LuaQ               �   @  A�  ��  �  �� ��  A �  �     � �A  B A@ �    � �E� F�� �  \@ E@ �� \� �@ �� �� �@  ܀ A AA � �D�� E  K��A � E�  �� \ \�  G� E� IƋE� I�ƌE� IǍE� K����  E�  �B \ \�  GA EA I�F�EA IȑE� K���� B	 E�  ��	 \ \�  G	 E	 I�F�E	 IAɑE� K���� �	 E�  �
 \ \�  IG�E  K��A B
 E�  ��
 \ \�  GA
 EA
 IƋEA
 I�ƌEA
 IǍEA
 �� �A � A�  �� � �� I���EA
 �    �I���EA
 K����  E�  �B \ \�  G� E� I�͋E� I�F�EA
 K��� B E�  �� \ \�  G� E� I�΋E� I�F�E� �A  I��EA
 K��� � E�  �� \ \�  GA EA I�΋EA I�F�EA ��     I��EA
 K��� B E�  �� \ \�  G E I�΋E I�F�E ��  I��EA
 K���  E�  �B \ \�  G� E� I�΋E� I�F�E� �    I��E  ^  � F      m    Map    ngrokc 
   translate    Ngrok    Secure tunnels to localhost.    luci    http 
   formvalue 
   cbi.apply    os    execute    /etc/init.d/ngrokc reload &    require    luci.dispatcher    luci.controller.ngrokc 
   luci.http    luci.model.uci    cursor    servers    section    TypedSection    Servers 	   template    cbi/tblsection 
   anonymous  
   addremove    nhost    option    Value    host    Ngrok Host    rmempty 	   datatype    hport    port    Ngrok Port    atoken    Auth Token    tunnel    Tunnels    extedit 
   build_url    admin 	   services    detail    %s    create    ena    Flag    enabled    Enabled    ngrokc/overview_enabled    lport    DummyValue    _lport    Local Port    ngrokc/overview_value    set_one    server    _server    Server    type    _type    Type    url    _url    URL        '   *       �   �@@�    � �@��   ��@��@ � �@� � ��@   �       AbstractSection    create 	   redirect    extedit    format                     3   :        � @ �@@ � A�  �� �@    ���  W�@@ ��  ���  A A� � A� �@��   �       map    get    lport        <em> 
   translate    config error    </em>                     @   I    .   � @ �@@ � A�  �� �@    ���  �   �@� @ �A ܀ �@    ���    A@A � �� � A    ��  �@� ���@ �W�@@�@��� � U��^ ��A �A �� �� �� U��^  �       map    get    server        ngrokc    host    port    :    <em> 
   translate    config error    </em>                     N   U        � @ �@@ � A�  �� �@    ���  W�@@��  �@�  �  �   ���� � A � AA �@��   � 
      map    get    type        string    upper    <em> 
   translate    config error    </em>                     Z   j    ]   � @ �@@ � A�  �� �@    ���  �   �@� @ �A ܀ �@    ���  @ A@�� �� � A    ��  F@ KA��� � \� ZA    �A�  �@ �A@ � A �� �A    ���  �@ �A�@� �B ܁ �A    ���  �B �W����� @�� ��� ��@C��W��@�  A� ��� @�W�� �  A� ����  CD@��� ��  �  ��� E �B \� �� �  �       map    get    server        ngrokc    host    type    dname    custom_domain    rport    tcp    tcp://    :    1    ://    .    string    gsub    www    <em> 
   translate    config error    </em>                             