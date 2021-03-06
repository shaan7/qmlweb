#include "mousecursor.h"

#include <QCursor>
#include <QGuiApplication>

MouseCursor::MouseCursor(QQuickItem *parent) :
    QQuickItem(parent)
{
}

QObject* MouseCursor::target() const
{
    return m_target;
}

void MouseCursor::setTarget(QObject *target)
{
    if (m_target != target) {
        m_target = qobject_cast<QQuickItem*>(target);
        emit targetChanged();
        applyCursor();
    }
}

Qt::CursorShape MouseCursor::cursorShape() const
{
    return m_cursorShape;
}

void MouseCursor::setCursorShape(Qt::CursorShape cursorShape)
{
    if (m_cursorShape != cursorShape) {
        m_cursorShape = cursorShape;
        emit cursorShape;
        applyCursor();
    }
}

void MouseCursor::applyCursor()
{
    if (m_target) {
//        m_target->setCursor(m_cursorShape);   FIXME: Why does this not work?
        static_cast<QGuiApplication*>(QGuiApplication::instance())->setOverrideCursor(m_cursorShape);
    }
}
