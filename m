Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711DC81528
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 11:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfHEJPr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 05:15:47 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:18476
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727259AbfHEJPr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 05:15:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhJeDJr0T13Lv/ccBpQ0pCr2nc5+EU9mlHGQenAq3VF29/wWFrupVMlNU4bjADWdFSGaVRx305FchM47okjKxGYTTV4OBBpLER5LZ+1zlBY/dBad6mPCu/ZeFRRZOq/6dvGgmsj1rFxwEqVE6qwLo67I6kpIpy9VfIL2NUNz83fwZhiLn8f1ZPuyUCFu93LMz/rHJmTNRJlEmn1SEXnyaOfk+TKbs6HUfvwRsv+5BAAtzUVEb5L1qGlDDzAAyW9sbtmlXVbB6UK7Z9GtCy6NRQ2Z6k9c8JH697me4oLqhRjo0T8QhKB/oVdx/mFAddbXJ4tjUycp4Sozfy+cj1u2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9tEp9AM2Fc26iuH1aU4kovuEW00N5qWKXD0mHc+J3A=;
 b=BEDXQmbju6d4EelbpY12sUvgL5Y4y/W7KsEQxnseNUHhppgdVe7/xCqdHPzpdkp1JJYGKbE4aZRhgmlFyVl190wNujScS0i4A0iNSMCUt5l9fNbjh5kG1/TCDW4vXSuxmjp0hcJahC6y8qFo9Tan2TaulMaF5/MMej9dF27oGNt47lsSMLuTrzF/ECsoMT9k49UD8Q4jcEDFqtqb2K+T/Cbt6/VFuezcS3P5814WgxoZ8MkqYY8EetGagtUk/sMaGMfLcqTy5D857Y2Z3NBxg1fZ7sVYGSaRh2MHuoXmJo6x6g9qKBX6TigsUNnmAoDq8fOdLilqJRQUvktJ6e7mpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9tEp9AM2Fc26iuH1aU4kovuEW00N5qWKXD0mHc+J3A=;
 b=E/o30hACvhVztVB0TytZeCttzEe4zvbZzYKWGTP+LfVha/Ifu9Fq2c0m26Uhhi6VIfY2olH6z6gQuG5r2bEqB+aoTXyJ7DiTw4iWW9iCo0XtZmCtE0LQt94/0wIV3MfzGX87T8goZxhpc7NuyCQ633swryQelUqT9u7ssKsrv8o=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1465.jpnprd01.prod.outlook.com (52.133.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 09:15:43 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2136.010; Mon, 5 Aug 2019
 09:15:43 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH/RFC 09/12] drm: rcar-du: lvds: Fix companion's mode
Thread-Topic: [PATCH/RFC 09/12] drm: rcar-du: lvds: Fix companion's mode
Thread-Index: AQHVSQTW7lHBkvRIBkGLUeI/2XZawqbnhdqAgATEPWA=
Date:   Mon, 5 Aug 2019 09:15:42 +0000
Message-ID: <TY1PR01MB1770B1CB1BBCEA0B7139DA87C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-10-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082613.GJ5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802082613.GJ5008@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56ef2120-2108-43e2-2a12-08d719857df6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1465;
x-ms-traffictypediagnostic: TY1PR01MB1465:
x-microsoft-antispam-prvs: <TY1PR01MB1465A87528A5A21DB1BFA90CC0DA0@TY1PR01MB1465.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(102836004)(66446008)(66556008)(64756008)(2906002)(6916009)(66946007)(81156014)(81166006)(14454004)(6506007)(53546011)(8676002)(256004)(14444005)(11346002)(8936002)(5660300002)(26005)(446003)(76176011)(66476007)(68736007)(486006)(76116006)(476003)(66066001)(7696005)(86362001)(229853002)(44832011)(3846002)(6116002)(305945005)(55016002)(186003)(6436002)(53936002)(9686003)(71200400001)(99286004)(107886003)(33656002)(71190400001)(52536014)(74316002)(7736002)(478600001)(7416002)(25786009)(4326008)(316002)(6246003)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1465;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gX/1H1A3zIa2twrtYREESwBws7C2Dldy/7b4UoihUUZH5VCs+Vx+Uxzhm5LEUTx9Eb87jXmQTnnUB3n7T4ynhrtQiQHjLQyhs630FRJ88X2jXiezMqtGhhPQ15OV7Y7eAY3x6mSxgWAffnfFOoZDzdKRm5U4PJkFPiyGRhLNPqWy0szYj2G9fvPgGNaNIQikT4Mu4zB1OWdE/etUJxIiB6Et+ZtjPPoMxDBQTIqmIW/zMm58aARQAGZrMWLYA8SrRGPtOMZ6iQxmzi12qREBn9f/4zJaL+gJ5XIEv1IkfpuPE6X0kV+ZklDT7xW8/ahAZhNbCwd61ZOznRW+CMK+1+Ovg+JSEz7Cr1bhUBGZLuEeoTEED/vf5dXuT/tleC0/YvcTrvC8IL9TqZ5oixy2EdCzTyU8HFpE5XXAcYlS014=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ef2120-2108-43e2-2a12-08d719857df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 09:15:42.9284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1465
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMDIgQXVndXN0IDIwMTkgMDk6MjYNCj4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDkvMTJd
IGRybTogcmNhci1kdTogbHZkczogRml4IGNvbXBhbmlvbidzIG1vZGUNCj4gDQo+IEhpIEZhYnJp
emlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBGcmksIEF1ZyAw
MiwgMjAxOSBhdCAwODozNDowNkFNICswMTAwLCBGYWJyaXppbyBDYXN0cm8gd3JvdGU6DQo+ID4g
VGhlIGNvbXBhbmlvbiBlbmNvZGVyIG5lZWRzIHRvIGJlIHRvbGQgdG8gdXNlIHRoZSBzYW1lDQo+
ID4gbW9kZSBhcyB0aGUgcHJpbWFyeSBlbmNvZGVyLg0KPiA+DQo+ID4gRml4ZXM6IGU5ZTg3OThh
YjdiOCAoImRybTogcmNhci1kdTogbHZkczogQWRkIHN1cHBvcnQgZm9yIGR1YWwtbGluayBtb2Rl
IikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0Bi
cC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMgfCA2ICsrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0K
PiA+IGluZGV4IGVkZDYzZjUuLjc5NDRhZTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2x2ZHMuYw0KPiA+IEBAIC00MTUsOCArNDE1LDEyIEBAIHN0YXRpYyB2b2lkIHJjYXJf
bHZkc19lbmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4gPiAgCQlyZXR1cm47DQo+
ID4NCj4gPiAgCS8qIEVuYWJsZSB0aGUgY29tcGFuaW9uIExWRFMgZW5jb2RlciBpbiBkdWFsLWxp
bmsgbW9kZS4gKi8NCj4gPiAtCWlmIChsdmRzLT5kdWFsX2xpbmsgJiYgbHZkcy0+Y29tcGFuaW9u
KQ0KPiA+ICsJaWYgKGx2ZHMtPmR1YWxfbGluayAmJiBsdmRzLT5jb21wYW5pb24pIHsNCj4gPiAr
CQlzdHJ1Y3QgcmNhcl9sdmRzICpjb21wYW5pb25fbHZkcyA9IGJyaWRnZV90b19yY2FyX2x2ZHMo
DQo+ID4gKwkJCQkJCQlsdmRzLT5jb21wYW5pb24pOw0KPiA+ICsJCWNvbXBhbmlvbl9sdmRzLT5t
b2RlID0gbHZkcy0+bW9kZTsNCj4gPiAgCQlsdmRzLT5jb21wYW5pb24tPmZ1bmNzLT5lbmFibGUo
bHZkcy0+Y29tcGFuaW9uKTsNCj4gPiArCX0NCj4gDQo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8g
ZG8gdGhpcyBpbiByY2FyX2x2ZHNfbW9kZV9zZXQoKSBpbnN0ZWFkLCB0byBrZWVwDQo+IHRoZSBt
b2RlIHNldCBjb2RlIGdyb3VwZWQgaW4gYSBzaW5nbGUgcGxhY2UgPw0KDQpJIG5lZWQgdG8gbG9v
a3MgaW50byB0aGlzLCBhcyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgbHZkczEgaXMgYSBiaXQgc3Bl
Y2lhbC4NCkknbGwgZ2V0IGJhY2sgdG8geW91Lg0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gPg0K
PiA+ICAJLyoNCj4gPiAgCSAqIEhhcmRjb2RlIHRoZSBjaGFubmVscyBhbmQgY29udHJvbCBzaWdu
YWxzIHJvdXRpbmcgZm9yIG5vdy4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50
IFBpbmNoYXJ0DQo=
