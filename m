Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F50719F00
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 16:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfEJOU4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 10:20:56 -0400
Received: from mail-eopbgr1410130.outbound.protection.outlook.com ([40.107.141.130]:45960
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727896AbfEJOUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 10:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcNoVX6FrHMPEVfeEiYBjv6VdFmDSe793jDQDXxkvT0=;
 b=PbSfdmRRUCbSc/QQ7fqaTgFWzPDAuNCCvcaY76MM4r7C0f2QbkbXeUMM/5hEsBag6qdvy8dILK+LS1NsJcLS7RR2B0/rq4dlVxixTfnf607p6mAWtglbhGOD+psvl36OuvpV5RwHar+W8wgi6HvEactpASeuiCDRGsAOFUzAn5o=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1772.jpnprd01.prod.outlook.com (52.133.164.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Fri, 10 May 2019 14:20:51 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 14:20:50 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
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
Thread-Index: AQHVBqPALgaZA5gQ3UyQXy3OztR526Zj8K2AgAATPwCAAC3qAIAANNKQ
Date:   Fri, 10 May 2019 14:20:50 +0000
Message-ID: <TY1PR01MB15628F7CF651279C59FE864D8A0C0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-12-chris.brandt@renesas.com>
 <CAMuHMdV7aQd-g1t_t27d8ge69e3VZnG7nQ7Lzre=qrJ1UrUuuA@mail.gmail.com>
 <OSBPR01MB3174FA32BADD2B97A6003ADCD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <OSBPR01MB317441157A3BFA9148FFF558D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB317441157A3BFA9148FFF558D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fbb7157-7a6f-44f6-8740-08d6d552b461
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1772;
x-ms-traffictypediagnostic: TY1PR01MB1772:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB1772CED39F29B0530B1225748A0C0@TY1PR01MB1772.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39860400002)(376002)(346002)(136003)(51444003)(199004)(189003)(446003)(4744005)(66446008)(966005)(76116006)(73956011)(229853002)(55016002)(486006)(66946007)(66476007)(66556008)(64756008)(11346002)(5660300002)(186003)(305945005)(7736002)(6246003)(76176011)(53936002)(8936002)(476003)(4326008)(6436002)(86362001)(81156014)(81166006)(66066001)(6306002)(8676002)(26005)(9686003)(478600001)(316002)(68736007)(52536014)(7696005)(256004)(6506007)(25786009)(54906003)(110136005)(14454004)(33656002)(102836004)(72206003)(74316002)(2906002)(71200400001)(71190400001)(3846002)(6116002)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1772;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rWT5gXIEVmN7SttfVEzic9dTshQ1Tjk9G1vfiUX5+JnGFDqT/fzrxo17jyIL95SG2KRwizHEQhgi5qb/rDQvxM9r1CrdOxaGRbBsR00TTXPvaTUu53u8kLCuY6ecG/ZU1iBME68MjJ7W/Z+pCDREbfMw/JMWab/XzUg7cOi2OcY+dj5ayOroCXzLSlugyRfBI3GjQppZLcgpjyEX05J/vsZRegSPh4PXSonHfYQvjF1cC0kEKdQI3sQd1plcbl+6olBcpvob11O2xhXyD5/L0eODnSxmqjJQ9sH+6ORsCxDL/BElbntuOxiaclrXUIXXJaX6xr0S++imN2xn7G58z9Y0H+AHEASvaARP/pkMz9IrH+w6nzdzgCSFGsgdmeY6kWlHzV8fTMvdZarSpUwAolKAXgBO3hbaq5lczkzf77c=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbb7157-7a6f-44f6-8740-08d6d552b461
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 14:20:50.8638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1772
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2hpbW9kYeOBleOCkw0KDQo+IEZyb206IFlvc2hpaGlybyBTaGltb2RhDQo+IFNlbnQ6IEZy
aWRheSwgTWF5IDEwLCAyMDE5IDc6MDAgQU0NCg0KPiBJIGhhdmUgc3VibWl0dGVkIHN1Y2ggYSBw
YXRjaCBhcyBmb2xsb3dpbmc6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTA5Mzg1NzUvDQoNCk9LLg0KSSB3aWxsIHJlYmFzZSBteSBwYXRjaGVzIG9uIHRvcCBvZiB5b3Vy
IHBhdGNoLg0KSSB3aWxsIHNheSBteSBwYXRjaCBzZXJpZXMgZGVwZW5kcyBvbiB5b3VyIHBhdGNo
Lg0KDQo+IEFib3V0IFNvQyBwYXJhbWV0ZXJzLCBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBhZGQg
bWVtYmVycyBpbnRvIHN0cnVjdA0KPiByZW5lc2FzX3VzYmhzX2RyaXZlcl9wYXJhbSBsaWtlDQo+
IGhhc191c2JfZG1hYyBpbnN0ZWFkIG9mIFVTQkhTRl8qIGRlZmluaXRpb25zLiBJbiBvdGhlciB3
b3Jkcywgd2UgZG9uJ3QNCj4gbmVlZCB0aGUgcGF0Y2ggMDgvMTUgYW5kDQo+IHBhdGNoIDA5LzE1
IGFuZCAxMC8xNSBzaG91bGQgYWRkIGVhY2ggbWVtYmVyIGZvciBpdC4gQ2hyaXMtc2FuLCB3aGF0
IGRvDQo+IHlvdSB0aGluaz8NCg0KSSB0aGluayB0aGF0IGlzIGdvb2QuDQoNCk5ldyBQYXRjaCAw
OC8xNToNCiAqIEFkZCB0byBzdHJ1Y3QgcmVuZXNhc191c2Joc19kcml2ZXJfcGFyYW06DQogICAg
ICB1MzIgaGFzX3J1bnRpbWVfcHdjdHJsOjE7DQogKiBSZW1vdmUgVVNCSFNGXyoNCiAqIFJlbW92
ZSB1c2Joc2NfZmxhZ3NfKg0KDQpOZXcgUGF0Y2ggMDkvMTU6DQoqIEFkZCB0byBzdHJ1Y3QgcmVu
ZXNhc191c2Joc19kcml2ZXJfcGFyYW06DQogICAgIHUzMiBoYXNfY25lbjoxOw0KDQpOZXcgUGF0
Y2ggMTAvMTU6DQoqIEFkZCB0byBzdHJ1Y3QgcmVuZXNhc191c2Joc19kcml2ZXJfcGFyYW06DQog
ICAgIHUzMiBjZmlmb19ieXRlX2FkZHI6MTsNCg0KDQpDaHJpcw0KDQo=
