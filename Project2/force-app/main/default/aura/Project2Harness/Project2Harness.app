<aura:application extends="force:slds">

    <!-- You can register events and use handlers on the app itself, perfect
    <aura:registerEvent name="ToggleCart" type="c:ConfirmCart"/>
    <aura:handler name="init" value="{! this }" action="{!c.getPersistentSameShipping}"/ -->

    <lightning:layout>
        <lightning:layoutItem padding="around-large">
            <h1 class="slds-text-heading_large">Sample App</h1>
        </lightning:layoutItem>
    </lightning:layout>

    <lightning:layout>
        <lightning:layoutItem padding="around-small" size="1">
            NAVBAR
            <c:MainPage/>
        </lightning:layoutItem>
        <lightning:layoutItem padding="around-small" size="9">
            <c:Cart/>
        </lightning:layoutItem>
        <lightning:layoutItem padding="around-small" size="2">
            <ul>
                <li>
                    <div>
                        <h2 class="slds-text-heading_large">PRODUCT PICTURE</h2>
                    </div>
                </li>
                <li>
                    <c:MiniQuantityEditor/>
                </li>
            </ul>

        </lightning:layoutItem>
    </lightning:layout>

    <lightning:layout>
        <lightning:layoutItem>
            <h1 class="slds-text-heading_large">other stuff down here like the contact form</h1>
        </lightning:layoutItem>
    </lightning:layout>


</aura:application>	
