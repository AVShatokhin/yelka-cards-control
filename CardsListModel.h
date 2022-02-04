#pragma once

#include <qqml.h>
#include <QAbstractListModel>
#include <QRandomGenerator>
#include <QFile>
#include <QURL>

struct item {    
    QString card_id;
    QString code;
    QString uid;
};


class CardsListModel : public QAbstractListModel
{
	Q_OBJECT
    QML_ELEMENT
    QML_ADDED_IN_MINOR_VERSION(1)        
    Q_PROPERTY(QString fileName READ getFileName WRITE setFileName NOTIFY fileNameChanged)
    Q_PROPERTY(bool edited READ getEdited WRITE setEdited NOTIFY editedChanged)
    Q_PROPERTY(bool notEmpty READ getNotEmpty WRITE setNotEmpty NOTIFY notEmptyChanged)

public:
	CardsListModel(QObject *parent = nullptr);
	~CardsListModel();

    QVariant data(const QModelIndex& index, int role) const override;

    int rowCount(const QModelIndex & = QModelIndex()) const override;

    QHash<int, QByteArray> roleNames() const override;
    
    QString getFileName() { return _fileName; }   
    void setFileName(QString fn) {
        _fileName = fn;
        fileNameChanged();
    }

    bool getEdited() { return _edited; }
    void setEdited(bool e) {
        _edited = e;
        editedChanged();
    }
    
    bool getNotEmpty() { return _notempty; }
    void setNotEmpty(bool e) {
        _notempty = e;
        notEmptyChanged();
    }
    
public slots:
    void initModel(int startCardID, int count);
    void loadFile(QUrl file);
    void saveFile(QUrl file);
    void saveFile();

signals:
    void notEmptyChanged();
    void editedChanged();
    void fileNameChanged();
    
private:
    QList<item>* _list = nullptr;
    QString _fileName = "";
    bool _edited = false;
    bool _notempty = false;
};
