Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7EBF19C14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 13:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfEJLA0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 07:00:26 -0400
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:12848
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727097AbfEJLA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 07:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PnpQOa5AHCF+bE8m2yVMUXaXjBMu9/cO5x5oYspClo=;
 b=f47qQl3BAgZxPJHVETs097af96U16jWcfbNvnev8bO9+O1B2rOoUmNc7Ho9c0b6KE+0EHXMfZHEDsczVNt9rNF8J215M109K+x1TOg0gNlD1jvG+rg6uI1nOes8A/e+5H5J3X4+E45xkrnB+xwVhogEyuubLyS0bDI74xavyrfk=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB5047.jpnprd01.prod.outlook.com (20.179.183.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.14; Fri, 10 May 2019 11:00:21 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 11:00:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH v2 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVBqPAmD3IBsdkTkW6RcwYeB06RKZj8K2AgAASkhCAACzbUA==
Date:   Fri, 10 May 2019 11:00:20 +0000
Message-ID: <OSBPR01MB317441157A3BFA9148FFF558D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-12-chris.brandt@renesas.com>
 <CAMuHMdV7aQd-g1t_t27d8ge69e3VZnG7nQ7Lzre=qrJ1UrUuuA@mail.gmail.com>
 <OSBPR01MB3174FA32BADD2B97A6003ADCD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174FA32BADD2B97A6003ADCD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acd9a0ae-a627-43df-2902-08d6d536b229
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB5047;
x-ms-traffictypediagnostic: OSBPR01MB5047:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB5047823831DABAA885715A5AD80C0@OSBPR01MB5047.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(136003)(346002)(376002)(366004)(189003)(199004)(3846002)(2906002)(102836004)(53546011)(6116002)(305945005)(6506007)(76176011)(7696005)(186003)(66066001)(99286004)(26005)(446003)(476003)(11346002)(71190400001)(71200400001)(7736002)(486006)(52536014)(229853002)(6246003)(316002)(4326008)(5660300002)(74316002)(256004)(110136005)(25786009)(6436002)(66476007)(66556008)(6636002)(66446008)(64756008)(66946007)(73956011)(33656002)(54906003)(76116006)(53936002)(81156014)(966005)(81166006)(8936002)(6306002)(8676002)(2940100002)(478600001)(14454004)(55016002)(86362001)(9686003)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5047;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8n1FrEVTKG0h6xvioQz4obfuNoBcVyzHTGhDtQSQDmaGJ6nNyiCPbzWZdNAYVKHeLyMvnR+o14+5PKPm/y+jZyfc5/VvveP9WS5cRwMl00+2GeQKm3P2UT6xmIHLDy0Sq2OWTKxNSvnmcMOMZGlu9t/EsDDq3ypiacXL/FmL9/rY7HNYxeVe9foowMRw1iqABNHF2J841KLEn8xlAO00g/xisYze/pR1jtDBFkckxRj30lVLv5FyfEPZiEOqAN2Oj4wGnH5RtSU7Z1AibzKkB0JzLqf+N1GxkH/g4xdWB5FEqze47HYmtAZWzHo4tDZZrQ5+gbdVMbsSSRxFBUUBABJE8G5iaQ+8wm12mbLP2SoJD6cfC8BtV3DXSxXOgvFULWV64HvLNUpYn5HM7MWmTOWsdZ0T0VgM36hGD2HNKmI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd9a0ae-a627-43df-2902-08d6d536b229
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 11:00:21.0018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5047
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLCBDaHJpcy1zYW4sDQoNCj4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEsIFNl
bnQ6IEZyaWRheSwgTWF5IDEwLCAyMDE5IDU6MTYgUE0NCj4gDQo+IEhpIEdlZXJ0LXNhbiwNCj4g
DQo+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBGcmlkYXksIE1heSAxMCwgMjAx
OSA0OjA3IFBNDQo+ID4NCj4gPiBIaSBDaHJpcywNCj4gPg0KPiA+IE9uIFRodSwgTWF5IDksIDIw
MTkgYXQgMTA6MTQgUE0gQ2hyaXMgQnJhbmR0IDxjaHJpcy5icmFuZHRAcmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA8c25pcD4NCj4gPiBCVFcsIHRoaXMgZHJpdmVyIHVzZXMgYSBtaXggb2YgZmVhdHVy
ZSBjaGVja2luZyB1c2luZyBVU0JIU19UWVBFXyoNCj4gPiBlbnVtcywgYW5kIGEgcGFyYW1ldGVy
IGJsb2NrL2NhbGxiYWNrIHN0cnVjdA0KPiA+IChyZW5lc2FzX3VzYmhzX3BsYXRmb3JtX2NhbGxi
YWNrKS4gIFBlcmhhcHMgdGhlIGZlYXR1cmUgZmxhZ3MgY2FuIGp1c3QNCj4gPiBiZSBtb3ZlZCB0
byB0aGUgc3RydWN0LCBhbmQgdGhlIHZhcmlvdXMgc3RydWN0cyByZWZlcmVuY2VkIGZyb20NCj4g
PiBvZl9kZXZpY2VfaWQuZGF0YT8NCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50ISBJ
IHRoaW5rIHNvLiBTbywgSSdsbCBtYWtlIHN1Y2ggYSBwYXRjaCBsYXRlci4NCg0KSSBoYXZlIHN1
Ym1pdHRlZCBzdWNoIGEgcGF0Y2ggYXMgZm9sbG93aW5nOg0KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDkzODU3NS8NCg0KU2luY2UgdXNiaHNjX2lzX211bHRpX2Nsa3MoKSB1
c2VzIHRoZSB0eXBlIG1lbWJlciwgZWFjaCBzdHJ1Y3QgYWxzbyBoYXMgdGhlIHR5cGUgbGlrZSBw
cmV2aW91cyBjb2RlLg0KDQpBYm91dCBTb0MgcGFyYW1ldGVycywgSSB0aGluayBpdCBpcyBiZXR0
ZXIgdG8gYWRkIG1lbWJlcnMgaW50byBzdHJ1Y3QgcmVuZXNhc191c2Joc19kcml2ZXJfcGFyYW0g
bGlrZQ0KaGFzX3VzYl9kbWFjIGluc3RlYWQgb2YgVVNCSFNGXyogZGVmaW5pdGlvbnMuIEluIG90
aGVyIHdvcmRzLCB3ZSBkb24ndCBuZWVkIHRoZSBwYXRjaCAwOC8xNSBhbmQNCnBhdGNoIDA5LzE1
IGFuZCAxMC8xNSBzaG91bGQgYWRkIGVhY2ggbWVtYmVyIGZvciBpdC4gQ2hyaXMtc2FuLCB3aGF0
IGRvIHlvdSB0aGluaz8NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IFlvc2hpaGlybyBTaGltb2RhDQo+IA0KPiA+IEdye29ldGplLGVldGlu
Z31zLA0KPiA+DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gPg0KPiA+IC0t
DQo+ID4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiA+DQo+ID4gSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dA0KPiA+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
