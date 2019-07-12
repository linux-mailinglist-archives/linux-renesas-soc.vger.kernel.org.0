Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEFB66FEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2019 15:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfGLNWD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jul 2019 09:22:03 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:10560
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727363AbfGLNWD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jul 2019 09:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeCKlOJDTrfQLMTlLvC2M39EDdwpHpY3Hs0icfI4cxU=;
 b=hpZwjJdBofqNthvxc91gfc1obQmMNjuc5iomcMZ6GtxPxXYhyqCXOBNIffnwyjDrJBXd3/zcHL/yXbimR3HnVZm1JZe7PcI8ZGF6WWQewCoUTg1tUlQseSa5l4UydNrCDdDdf1A+6b1IZHV1YODq/ceJGxjFFaeAbO9duFSg6As=
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com (52.133.178.139) by
 TYAPR01MB4192.jpnprd01.prod.outlook.com (20.178.140.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 12 Jul 2019 13:21:59 +0000
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::1df6:94db:4b85:e719]) by TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::1df6:94db:4b85:e719%5]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 13:21:59 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/3] arm64: dts: renesas: hihope-common: Add PCA9654 I/O
 expander
Thread-Topic: [PATCH 1/3] arm64: dts: renesas: hihope-common: Add PCA9654 I/O
 expander
Thread-Index: AQHVMxtLucEscQFPxk2EcRRdJW6iWKbG9KIAgAAMeVA=
Date:   Fri, 12 Jul 2019 13:21:59 +0000
Message-ID: <TYAPR01MB2111E5F445AC1CEA0C720BD9B8F20@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1562321720-18735-1-git-send-email-biju.das@bp.renesas.com>
 <1562321720-18735-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdU79JQfEH5hY=wjyknE+sLpS6i3GeXYZ5Z=uzWkWDC-DA@mail.gmail.com>
In-Reply-To: <CAMuHMdU79JQfEH5hY=wjyknE+sLpS6i3GeXYZ5Z=uzWkWDC-DA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2135413c-3320-47ab-5d2a-08d706cbeb56
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4192;
x-ms-traffictypediagnostic: TYAPR01MB4192:
x-microsoft-antispam-prvs: <TYAPR01MB419287A26F9E1BE9A55A8630B8F20@TYAPR01MB4192.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(199004)(189003)(51914003)(86362001)(52536014)(71190400001)(71200400001)(446003)(44832011)(76116006)(81156014)(81166006)(8676002)(2906002)(66066001)(478600001)(256004)(14454004)(66946007)(5660300002)(66446008)(229853002)(8936002)(186003)(26005)(7736002)(476003)(66556008)(64756008)(486006)(66476007)(11346002)(305945005)(74316002)(6436002)(102836004)(107886003)(9686003)(55016002)(6246003)(54906003)(33656002)(68736007)(4326008)(3846002)(6116002)(76176011)(53546011)(6506007)(7696005)(6916009)(99286004)(53936002)(25786009)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4192;H:TYAPR01MB2111.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W7rBX/Br2TfW+YxABU00q1xJc7F2jrQlJe+a+RyHt4pm/eQ0ut7Cv3dS+YALfmU7XWCQDzqG3bG3DGTA/0w8skc8uoMwip3q8YAXEBbipRbsbyqV1WeN5++9nYj+k4EyQbjypjvPFQBr0vNlRy95OhrR83xnij8cn0IPi9RUA9/uvJ65d27YK6E3hgUmBJG7mJcx2cMkY4NYdN620DQiLUO64PqMzj2iw8Jz1X5gBwcOqJ3sL4Yb4yYnrAOFuUDMypMHyA2yJp/3d0WKCEAMxaJrri7DScBRztrRrRzOEz8oIbynlWucVTSSqeVUutRqHOKCF9tb0YHhZ5S4G7JkpOARnYdjmUrUXx873d8vFnwZP303oS3MK47nwM/ow3eaE+H7aF2HcuItxS0BhtU4158HjSaewoy0avrwMQW/xEk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2135413c-3320-47ab-5d2a-08d706cbeb56
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 13:21:59.0829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4192
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDEvM10gYXJtNjQ6IGR0czogcmVuZXNhczogaGlob3BlLWNvbW1vbjogQWRkIFBD
QTk2NTQNCj4gSS9PIGV4cGFuZGVyDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBKdWwg
NSwgMjAxOSBhdCAxMjoyMCBQTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+IEVuYWJsZSBQQ0E5NjU0IEdQSU8gZXhwYW5kZXIsIHNvIHRoYXQgd2UgY2FuIGNv
bmZpZ3VyZSBpdHMgR1BJT3MgbGF0ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvaGlob3BlLWNvbW1vbi5kdHNpDQo+ID4gQEAgLTE2Miw2ICsxNjIsMTMg
QEANCj4gPiAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KPiA+ICAgICAgICAg
c3RhdHVzID0gIm9rYXkiOw0KPiA+DQo+ID4gKyAgICAgICBncGlvX2V4cGFuZGVyOiBncGlvQDIw
IHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJvbm5uLHBjYTk2NTQiOw0KPiA+
ICsgICAgICAgICAgICAgICByZWcgPSA8MHgyMD47DQo+ID4gKyAgICAgICAgICAgICAgIGdwaW8t
Y29udHJvbGxlcjsNCj4gPiArICAgICAgICAgICAgICAgI2dwaW8tY2VsbHMgPSA8Mj47DQo+IA0K
PiBZb3UgbWF5IHdhbnQgdG8gZGVzY3JpYmUgdGhhdCB0aGUgaW50ZXJydXB0IG91dHB1dCBpcyB0
aWVkIHRvIEdQNV8yNT8NCg0KQlRfUkVHX09OIGFuZCBXTEFOX1JFR19PTiBhcmUgb3V0cHV0IHBp
bnMuIFRoYXQgaXMgdGhlIHJlYXNvbiwgSSBoYXZlbid0IGRlc2NyaWJlZCB0aGUgaW50ZXJydXB0
IG91dHB1dC4NCklmIG5lZWRlZCwgSSBjYW4gYWRkIHRoaXMuIFBsZWFzZSBsZXQgbWUga25vdy4N
Cg0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGluZ31z
LA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K
