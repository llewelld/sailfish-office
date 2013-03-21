#ifndef DOCUMENTPROVIDERPLUGIN_H
#define DOCUMENTPROVIDERPLUGIN_H

#include <QObject>
#include <QUrl>
#include <QImage>

class DocumentProviderPlugin : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged)
    Q_PROPERTY(QUrl icon READ icon NOTIFY iconChanged)
    Q_PROPERTY(QUrl thumbnail READ thumbnail  NOTIFY thumbnailChanged)
    Q_PROPERTY(QString title READ title NOTIFY titleChanged)
    Q_PROPERTY(QObject *model READ model NOTIFY modelChanged)
    Q_PROPERTY(bool ready READ isReady NOTIFY readyChanged)
    Q_PROPERTY(QUrl page READ page WRITE setPage NOTIFY pageChanged)

public:
    DocumentProviderPlugin(QObject* parent = 0);
    virtual ~DocumentProviderPlugin();

    virtual int count() const = 0;
    virtual QUrl icon() const = 0;
    virtual QString title() const = 0;
    virtual QString description() const = 0;
    virtual QObject *model() const = 0;
    virtual QUrl thumbnail() const = 0;
    virtual bool isReady() const = 0;

    QUrl page() const;
    void setPage(const QUrl &url);

signals:
    void countChanged();
    void iconChanged();
    void thumbnailChanged();
    void pageChanged();
    void titleChanged();
    void modelChanged();
    void readyChanged();

private:
    class Private;
    Private* d;
};
Q_DECLARE_INTERFACE(DocumentProviderPlugin, "DocumentProviderPluginInterface/1.0")

#endif // DOCUMENTPROVIDERPLUGIN_H
