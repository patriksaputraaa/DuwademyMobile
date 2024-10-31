using CommunityToolkit.Mvvm.Messaging.Messages;

namespace DuwademyMobile.Data;

public class RefreshMessage : ValueChangedMessage<bool>
{
    public RefreshMessage(bool value) : base(value)
    {
    }
}