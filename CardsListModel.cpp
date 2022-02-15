#include "CardsListModel.h"

CardsListModel::CardsListModel(QObject* parent)
	: QAbstractListModel(parent)
{
	_list = new QList<item>;
}

CardsListModel::~CardsListModel()
{
}

QVariant CardsListModel::data(const QModelIndex& index, int role) const
{
	if (!index.isValid()) {
		return QVariant();
	}

	switch (role) {
	case 100:
		return index.row() + 1;
	case 101:
		return _list->at(index.row()).card_id;
	case 102:
		return _list->at(index.row()).code;
	case 103:
		return _list->at(index.row()).uid;

	default:
		break;
	}

	return QVariant();
}

bool CardsListModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
	item __item;

	if (!index.isValid()) {
		return false;
	}

	switch (role) {
	case 103:
		__item = _list->at(index.row());
		__item.uid = value.toString();
		_list->replace(index.row(), __item);
		break;
	default:
		return false;
	}

	setEdited(true);
	emit dataChanged(index, index, QVector<int>() << role);

	return true;
}

int CardsListModel::rowCount(const QModelIndex&) const
{
	return _list->size();
}

Qt::ItemFlags CardsListModel::flags(const QModelIndex& index) const
{
	if (!index.isValid())
		return Qt::ItemIsEnabled;
	
	return QAbstractListModel::flags(index) | Qt::ItemIsEditable;
	//return Qt::ItemFlags();
}

QHash<int, QByteArray> CardsListModel::roleNames() const
{
	return {		
		{100, "num"},
		{101, "card_id"},
		{102, "code"},
		{103, "uid"}
	};
}

void CardsListModel::loadFile(QUrl file)
{
	setFileName(file.path().replace(0, 1, ""));
	setEdited(true);
	QFile * __file = new QFile(getFileName());

	if (!__file->open(QIODevice::ReadOnly)) {
		qDebug() << __file->errorString();
		qDebug() << __file->fileName();
		return;
	}

	QString __buffer = __file->readAll();
	QStringList __stringList = (__buffer.remove("\r")).split("\n");
	
	_list->clear();

	for (auto p{ __stringList.begin() }; p != __stringList.end(); p++) {
		QString __line = *p;
		if (__line.length() > 0) {
			QStringList __sl = (*p).split(";");
			if (__sl.length() == 3) {
				item __newItem;
				__newItem.card_id = __sl.at(0);
				__newItem.code = __sl.at(1);
				__newItem.uid = __sl.at(2);
				_list->push_back(__newItem);
			}
		}		
	}
	endResetModel();
	__file->close();	
	setEdited(false);
	setNotEmpty(true);
}

void CardsListModel::saveFile(QUrl file)
{
	setFileName(file.path().replace(0, 1, ""));		
	saveFile();	
}

void CardsListModel::saveFile()
{
	//qDebug() << _fileName;
	
	QFile file(_fileName);

	if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
	return;

	QTextStream out(&file);

	for (auto p{ _list->begin() }; p != _list->end(); p++) {
		out << (*p).card_id << ";" << (*p).code << ";" << (*p).uid << "\n";
	}
	
	file.close();
	setEdited(false);
}



void CardsListModel::initModel(int startCardID, int count)
{
	beginResetModel();
	_list->clear();
	for (int __i = 0; __i < count; __i++) {
		item __newItem;		
		__newItem.card_id = QString::number(startCardID + __i);
		__newItem.code = QString::number(QRandomGenerator::global()->bounded(9000) + 1000);
		__newItem.uid = "";
		_list->push_back(__newItem);
	}
	endResetModel();
	setEdited(true);
	setNotEmpty(true);
	setFileName("");
}
