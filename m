Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4702121846
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 19:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbfLPSAP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 13:00:15 -0500
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:35016
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728886AbfLPSAO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 13:00:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLXRFkhocYv6z3pL3Mcg475ctdT5TZQViBuG6AB6eygUVrxS4vy0kFcqS+i9DZADjNAT+EE3voOvPAfQvoacLeodXTfusnwZtW6GSRS12L4slfgwwO9hNj71ROxCepK5+auxq7zCZ/2OMEekqMJxfYTtaKQG9RiXZVhA2mYScwwZPJlj3+eQOS3834CrWjypmSN6cq3NnPJgy6ZL5OTeyXnT09LeYtT8t2MbOypr6RzQ/iH/tG1/HFOtRoAAMVZi/sFwFC3KAgwuBuT+Ld05h91xz54V9nQgCYr1m5dNYfXstz1HZdZPo+pBE0ERWBjxCcxzNfYy3i/DUy8JiQ+H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glkd+9TVukY0BcoEF+tknKFlTwQkAurn+op8ZhCIuNw=;
 b=XAw5q8mkl7frbCZjbLS3ZTvCBJIV3aKxL9jmXNAEu3M+HkuPGq3/J2YPkbvcQALJjTsTO5p9oqJjWUPM9dTsbukuEg1H6qg2fmIBkTkKkCsO9pBSuGjR7IWE3poza1VLKA/fKoPZRNM2HDanwnqpg7XkhBsMeogJnqbAYIxJlxuw9uAeZZ08dQdfS7lB0qxDS8qlHTGl4sAmcQz04sIkamg8BpzBmNzdBTBcJsDZ3Lx6X2sbSY00tk+fvungwq8wmfEelO+/fcc5KFcRv6C5FVyK6Mg4Vc9CG+baxFkPGJzmMdmHbDWNHKinDZZ1AfOoCpTeA6lihRuMACIKTTCiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glkd+9TVukY0BcoEF+tknKFlTwQkAurn+op8ZhCIuNw=;
 b=k4M+HqyA8QCIGBpbGBQH6e4rtu/PHBNIF0A6T/upi9aKwmC08bLzx7C8oDhDNY3K5O/i+j4YUeM7gE+PxCrhuLyI3xPKrrwmnEIY9PyPZ9LwDRx2Wv/yDA8OghVhuDVGJQc3sHKVtDBG2pb7EP6wxAdvySrH0xl5rmG+rTrMJKw=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1497.jpnprd01.prod.outlook.com (52.133.162.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Mon, 16 Dec 2019 18:00:09 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:00:09 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH v4 2/7] drm: rcar-du: lvds: Improve identification of
 panels
Thread-Topic: [PATCH v4 2/7] drm: rcar-du: lvds: Improve identification of
 panels
Thread-Index: AQHVrFLdhiNZZ/6mLk+E8oj0P8Dcc6e4nfKAgAR+fuA=
Date:   Mon, 16 Dec 2019 18:00:09 +0000
Message-ID: <TY1PR01MB177010675ADC18D97DADADE8C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213212135.GM4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213212135.GM4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32a3e3b4-74e3-41b6-938e-08d78251ca7d
x-ms-traffictypediagnostic: TY1PR01MB1497:|TY1PR01MB1497:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1497C22A1E513B2397B3CC16C0510@TY1PR01MB1497.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(71200400001)(4326008)(86362001)(6916009)(7416002)(5660300002)(9686003)(44832011)(7696005)(76116006)(2906002)(26005)(478600001)(81166006)(81156014)(8676002)(8936002)(6506007)(53546011)(55016002)(66556008)(54906003)(66476007)(186003)(316002)(66946007)(66446008)(33656002)(52536014)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1497;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bXC6Gl6BLGROAiC1mRll/k1fgGdRqVo46DK74zLUBoRJzY0MCe6iMpWlPtLtJIPvTgDMZj9pzlx5LerJqxpgxHXuW0lD8ZjtmqeuE6bp7G8nbSC05g0wfgKKYDsEJWr+kV3mTCk3Sa6mZRgs6iwD3o6+IqnMT8wkC5wqjJq20rz0mfOHf4zH4rS6rJFJsLIBvm44QEqzZh5+4Qj9b38QEKvsk21bWHqozqjvAOKMHzEpJCa+8JFXD+eLrzc0FwvBj36UUyIA4m0HpJGO9/es7MfpHhpsmKrjK6Zaes2E3Xe8CAEGbKoFfu4jX4wf7m5UDuycrYbEwQFPGtEa4msGS1DdbUhtQUXHRdPqeBM8N8pQ0rHMrjR1a9KdBu+83c9WdTB6v6Uc4amK4lpqxE0qJIfvbScE5GZQdGlRRxpuzXc/qFshkynYgWakfCzUAM0R
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a3e3b4-74e3-41b6-938e-08d78251ca7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:00:09.5365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnqr6ida4DaWEo+jLwjfxdDDG+5V30DOKXJ9favPSYmhe3DxN1Y0j89UCE+0TZYh6G32/RYLYVway+JXVATsIBBMeuDQzchAj9//CvPXD6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1497
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMTMgRGVjZW1iZXIgMjAxOSAyMToyMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDIvN10g
ZHJtOiByY2FyLWR1OiBsdmRzOiBJbXByb3ZlIGlkZW50aWZpY2F0aW9uIG9mIHBhbmVscw0KPiAN
Cj4gSGkgRmFicml6aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IEZyaSwgRGVjIDA2LCAyMDE5IGF0IDA0OjMyOjQ5UE0gKzAwMDAsIEZhYnJpemlvIENhc3RybyB3
cm90ZToNCj4gPiBEdWFsLUxWRFMgcGFuZWxzIGFyZSBtaXN0YWtlbmx5IGlkZW50aWZpZWQgYXMg
YnJpZGdlcywgdGhpcw0KPiA+IGNvbW1pdCByZXBsYWNlcyB0aGUgY3VycmVudCBsb2dpYyB3aXRo
IGEgY2FsbCB0bw0KPiA+IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSB0byBzb3J0IHRoYXQg
b3V0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5j
YXN0cm9AYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiAtLS0NCj4gPiB2My0+djQ6DQo+ID4gKiBO
ZXcgcGF0Y2ggZXh0cmFjdGVkIGZyb20gcGF0Y2g6DQo+ID4gICAiZHJtOiByY2FyLWR1OiBsdmRz
OiBBZGQgZHVhbC1MVkRTIHBhbmVscyBzdXBwb3J0Ig0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8IDQ1ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDM1IGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMNCj4gPiBp
bmRleCA4YzZjMTcyLi4zY2IwYTgzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfbHZkcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMNCj4gPiBAQCAtMjEsNiArMjEsNyBAQA0KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9h
dG9taWMuaD4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPiA+ICAj
aW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4NCj4gPiArI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4N
Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1f
cHJvYmVfaGVscGVyLmg+DQo+ID4NCj4gPiBAQCAtNzA1LDEwICs3MDYsNyBAQCBzdGF0aWMgaW50
IHJjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5pb24oc3RydWN0IHJjYXJfbHZkcyAqbHZkcykNCj4g
PiAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHQoc3RydWN0IHJjYXJfbHZkcyAqbHZkcykN
Cj4gPiAgew0KPiA+ICAJc3RydWN0IGRldmljZV9ub2RlICpsb2NhbF9vdXRwdXQgPSBOVUxMOw0K
PiA+IC0Jc3RydWN0IGRldmljZV9ub2RlICpyZW1vdGVfaW5wdXQgPSBOVUxMOw0KPiA+ICAJc3Ry
dWN0IGRldmljZV9ub2RlICpyZW1vdGUgPSBOVUxMOw0KPiA+IC0Jc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlOw0KPiA+IC0JYm9vbCBpc19icmlkZ2UgPSBmYWxzZTsNCj4gPiAgCWludCByZXQgPSAw
Ow0KPiA+DQo+ID4gIAlsb2NhbF9vdXRwdXQgPSBvZl9ncmFwaF9nZXRfZW5kcG9pbnRfYnlfcmVn
cyhsdmRzLT5kZXYtPm9mX25vZGUsIDEsIDApOw0KPiA+IEBAIC03MzYsNDUgKzczNCwyMiBAQCBz
dGF0aWMgaW50IHJjYXJfbHZkc19wYXJzZV9kdChzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQ0KPiA+
ICAJCWdvdG8gZG9uZTsNCj4gPiAgCX0NCj4gDQo+IEkgdGhpbmsgeW91IGNhbiByZW1vdmUgdGhl
IGNhbGxzIGFib3ZlIHRoaXMgdG9vLg0KPiBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2UoKSBj
YWxscyBvZl9ncmFwaF9nZXRfcmVtb3RlX25vZGUoKSwgd2hpY2ggaW4NCj4gdHVybiBjYWxscyBv
Zl9ncmFwaF9nZXRfZW5kcG9pbnRfYnlfcmVncygpLA0KPiBvZl9ncmFwaF9nZXRfcmVtb3RlX3Bv
cnRfcGFyZW50KCkgYW5kIGNoZWNrcyB0aGUgc3RhdHVzIG9mIHRoZSByZW1vdGUNCj4gd2l0aCBv
Zl9kZXZpY2VfaXNfYXZhaWxhYmxlKCkuDQoNCldpbGwgdGFrZSB0aG9zZSBvdXQgaW4gdjUNCg0K
VGhhbmtzLA0KRmFiDQoNCj4gDQo+ID4NCj4gPiAtCXJlbW90ZV9pbnB1dCA9IG9mX2dyYXBoX2dl
dF9yZW1vdGVfZW5kcG9pbnQobG9jYWxfb3V0cHV0KTsNCj4gPiAtDQo+ID4gLQlmb3JfZWFjaF9l
bmRwb2ludF9vZl9ub2RlKHJlbW90ZSwgbm9kZSkgew0KPiA+IC0JCWlmIChub2RlICE9IHJlbW90
ZV9pbnB1dCkgew0KPiA+IC0JCQkvKg0KPiA+IC0JCQkgKiBXZSd2ZSBmb3VuZCBvbmUgZW5kcG9p
bnQgb3RoZXIgdGhhbiB0aGUgaW5wdXQsIHRoaXMNCj4gPiAtCQkJICogbXVzdCBiZSBhIGJyaWRn
ZS4NCj4gPiAtCQkJICovDQo+ID4gLQkJCWlzX2JyaWRnZSA9IHRydWU7DQo+ID4gLQkJCW9mX25v
ZGVfcHV0KG5vZGUpOw0KPiA+IC0JCQlicmVhazsNCj4gPiAtCQl9DQo+ID4gLQl9DQo+ID4gLQ0K
PiA+IC0JaWYgKGlzX2JyaWRnZSkgew0KPiA+IC0JCWx2ZHMtPm5leHRfYnJpZGdlID0gb2ZfZHJt
X2ZpbmRfYnJpZGdlKHJlbW90ZSk7DQo+ID4gLQkJaWYgKCFsdmRzLT5uZXh0X2JyaWRnZSkgew0K
PiA+IC0JCQlyZXQgPSAtRVBST0JFX0RFRkVSOw0KPiA+IC0JCQlnb3RvIGRvbmU7DQo+ID4gLQkJ
fQ0KPiA+ICsJcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGx2ZHMtPmRldi0+b2Zf
bm9kZSwgMSwgMCwNCj4gPiArCQkJCQkgICZsdmRzLT5wYW5lbCwgJmx2ZHMtPm5leHRfYnJpZGdl
KTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBkb25lOw0KPiA+DQo+ID4gLQkJaWYgKGx2
ZHMtPmluZm8tPnF1aXJrcyAmIFJDQVJfTFZEU19RVUlSS19EVUFMX0xJTkspDQo+ID4gLQkJCWx2
ZHMtPmR1YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzDQo+ID4gLQkJCQkJPyBs
dmRzLT5uZXh0X2JyaWRnZS0+dGltaW5ncy0+ZHVhbF9saW5rDQo+ID4gLQkJCQkJOiBmYWxzZTsN
Cj4gPiAtCX0gZWxzZSB7DQo+ID4gLQkJbHZkcy0+cGFuZWwgPSBvZl9kcm1fZmluZF9wYW5lbChy
ZW1vdGUpOw0KPiA+IC0JCWlmIChJU19FUlIobHZkcy0+cGFuZWwpKSB7DQo+ID4gLQkJCXJldCA9
IFBUUl9FUlIobHZkcy0+cGFuZWwpOw0KPiA+IC0JCQlnb3RvIGRvbmU7DQo+ID4gLQkJfQ0KPiA+
IC0JfQ0KPiA+ICsJaWYgKChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJUktfRFVB
TF9MSU5LKSAmJg0KPiA+ICsJICAgIGx2ZHMtPm5leHRfYnJpZGdlKQ0KPiA+ICsJCWx2ZHMtPmR1
YWxfbGluayA9IGx2ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzDQo+ID4gKwkJCQk/IGx2ZHMtPm5l
eHRfYnJpZGdlLT50aW1pbmdzLT5kdWFsX2xpbmsNCj4gPiArCQkJCTogZmFsc2U7DQo+ID4NCj4g
PiAgCWlmIChsdmRzLT5kdWFsX2xpbmspDQo+ID4gIAkJcmV0ID0gcmNhcl9sdmRzX3BhcnNlX2R0
X2NvbXBhbmlvbihsdmRzKTsNCj4gPg0KPiA+ICBkb25lOg0KPiA+ICAJb2Zfbm9kZV9wdXQobG9j
YWxfb3V0cHV0KTsNCj4gPiAtCW9mX25vZGVfcHV0KHJlbW90ZV9pbnB1dCk7DQo+ID4gIAlvZl9u
b2RlX3B1dChyZW1vdGUpOw0KPiA+DQo+ID4gIAkvKg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4g
DQo+IExhdXJlbnQgUGluY2hhcnQNCg==
