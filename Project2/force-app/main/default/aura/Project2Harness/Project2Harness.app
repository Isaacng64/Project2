<aura:application extends="force:slds">

    <!-- You can register events and use handlers on the app itself, perfect
    <aura:registerEvent name="ToggleCart" type="c:ConfirmCart"/>
    <aura:handler name="init" value="{! this }" action="{!c.getPersistentSameShipping}"/ -->


    <div style="background-color: rgba(0, 38, 255, 0.315);">
        <c:MainPage/>
    </div>
    


</aura:application>