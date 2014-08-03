#ifndef MOUSECURSOR_H
#define MOUSECURSOR_H

#include <QQuickItem>
#include <QGraphicsItem>

Q_DECLARE_METATYPE(QGraphicsObject*)

class MouseCursor : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QObject* target READ target WRITE setTarget NOTIFY targetChanged)
    Q_PROPERTY(Qt::CursorShape cursorShape READ cursorShape WRITE setCursorShape NOTIFY cursorShapeChanged)

public:
    explicit MouseCursor(QQuickItem *parent = 0);

    QObject *target() const;
    void setTarget(QObject *target);

    Qt::CursorShape cursorShape() const;
    void setCursorShape(Qt::CursorShape cursorShape);

signals:
    void targetChanged();
    void cursorShapeChanged();

protected:
    virtual void applyCursor();

private:
    QQuickItem* m_target = nullptr;
    Qt::CursorShape m_cursorShape = Qt::ArrowCursor;
};

#endif // MOUSECURSOR_H
