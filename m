Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795E316280
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 13:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfEGLAW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 07:00:22 -0400
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:51445
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726095AbfEGLAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 07:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyaVeHdLdmFqUy4wCx0mrTzfY42aMIXZJJTs6W30ZxQ=;
 b=WAJ1YzZ08rvR19LksfUk7S4rz/JVrWjFBpHT48YzrxDQcuHFZGapHrjolG+EmNMEgXhg8cxylpV3QADGU7SKOCr3xJp98SD26kyx6+JfpeHAUXQuCRLwju87JeDLrspGLOKbPtUDO3+2fWTTI5CGn0M8PWOuXvEWlGXC3VLg1kA=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY2SPR01MB0015.jpnprd01.prod.outlook.com (20.177.150.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 11:00:18 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 11:00:18 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1
 option
Thread-Topic: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1
 option
Thread-Index: AQHVBGYQ+cfCaNX+ik+H7Wxy1mef+qZfTXmAgAAw/eA=
Date:   Tue, 7 May 2019 11:00:18 +0000
Message-ID: <TY1PR01MB1562D08E4F5A6C635024BE718A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com>
 <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67e00e27-3e90-4c89-f25c-08d6d2db3136
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY2SPR01MB0015;
x-ms-traffictypediagnostic: TY2SPR01MB0015:
x-microsoft-antispam-prvs: <TY2SPR01MB00150D84A6D26456D08981F58A310@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(3846002)(33656002)(316002)(55016002)(9686003)(52536014)(99286004)(68736007)(54906003)(446003)(74316002)(256004)(486006)(72206003)(11346002)(14454004)(186003)(102836004)(7696005)(6506007)(476003)(305945005)(26005)(76176011)(8936002)(478600001)(25786009)(6116002)(8676002)(81166006)(81156014)(2906002)(86362001)(7736002)(53936002)(6246003)(6916009)(5660300002)(4326008)(66066001)(71200400001)(71190400001)(66946007)(73956011)(76116006)(229853002)(66476007)(6436002)(66556008)(64756008)(66446008)(4744005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2SPR01MB0015;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uFbpVKQNZmaJhb88SP9fjph5fQjSv1KQRTHacazGWuDtCRJxn5wRXR4RPO+2vVxugYOKtG7yIoiV8fgGDcToX3Eazw2dFLS3tr/ohBgUhCBqJxTUujnZvUc23kmG5Ue6PdRi7S+D9jG+tsA4a7wgZe653QPCWc4JG4Yj7nz1AkGYMyrjmuZApCYk0i7fX7/nxqG9dLM3HTT8wTSswKAF4xuHIBONUn3/m8w5hWaaVrqm5H51nqUyDl/LkHqvI5o6Xoy6zOtU2DzvPnizaYcWksBsR03R4nSc7Jo5E6KjyTCAPwzpShcbUB35kUniC+YGMUgM5YPJ9Jpc3eOYHypGGs1Vrpd48mNT4Jf08F7tM28FJD66sSpEip299sfNu6TMD1PuwZFrt/mmln5tg/qOIQN2jcyLhtSrBGVYnrW9llc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e00e27-3e90-4c89-f25c-08d6d2db3136
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 11:00:18.3168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2SPR01MB0015
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgTWF5IDA3LCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gKyAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwg
InJlbmVzYXMsdXNlc191c2JfeDEiKSkNCj4gPiArICAgICAgICAgICAgICAgY2hhbm5lbC0+dXNl
c191c2JfeDEgPSB0cnVlOw0KPiA+ICsNCj4gDQo+IFBlcmhhcHMgdGhpcyBjYW4gYmUgY2hlY2tl
ZCBzb21lIG90aGVyIHdheSAoZS5nLiBieSBjaGVja2luZyBmb3IgYSBub24tDQo+IHplcm8NCj4g
Y2xvY2sgcmF0ZSBvZiB0aGUgVVNCX1gxIGNsb2NrIHJlZmVyZW5jZWQgZnJvbSBEVCksIHRodXMg
cmVtb3ZpbmcgdGhlIG5lZWQNCj4gZm9yDQo+IGFkZGluZyBhIGN1c3RvbSBwcm9wZXJ0eT8NCg0K
DQpHb29kIHBvaW50LiBJJ3ZlIGRvbmUgdGhhdCBmb3Igb3RoZXIgZHJpdmVycyBiZWZvcmUgYW5k
IGl0IHdvcmtlZCB3ZWxsLg0KDQpJJ2xsIHRha2UgdGhpcyBvdXQuLi5vbmUgbGVzcyBwcm9wZXJ0
eSB0byBzZXQgOikNCg0KUXVlc3Rpb246IFNpbmNlIHRoZSBkcml2ZXIgZGVwZW5kcyBvbiB0aGlz
LCBzaG91bGQgSSBtZW50aW9uIHRoaXMgaW4gdGhlDQpkdC1iaW5kaW5ncyBkb2N1bWVudGF0aW9u
ID8NCg0KVGhhbmtzLA0KQ2hyaXMNCg==
