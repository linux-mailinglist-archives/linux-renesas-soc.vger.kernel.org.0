Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3D21216C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 19:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730718AbfLPSLG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 13:11:06 -0500
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:35088
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730314AbfLPSLF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 13:11:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IegOPDQcYLmH9Uh2nbBHfpIEWlWlikm3+POvidVscwRCseawwrzWq26STfWSk/Vi0wzXowBXGjJJqBCIOQktg89KzW1TCOHqIDJnMnUkOEyw0QgUr0fyJ7cPjKE9w7/oXZ7/7cpAaChTITgQp6P/xrLmhfEN6TYSD4aaTyKzCqgfK7m2enLx8yxt7rO6TJv4xRREXKvI1ABpKiz60iNl7fD9qhecjnxe/fh8zlyg40pEb/zZUGdsnpquozwAceZ3xQKCyhm7eswSAmyVJV2UvDtpIBgCxCrAFgHsn/KWwV0Bkdcku1+5m5oBFev+ELnUrBv3N9dO4fOGpshEhcv/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEwvxJpXarH/Lhpan8twx7oGY1ccDblgB8aNOgqPyu8=;
 b=YToPLxXxzbKF4aId82HRGTjb9inZtlk6kCUJ+yKPyHZw1mGnhwUu/X6k3Kxi/3nauCmY3AKJYH+pF3NZLlRIbMxQpdx3DjQuDrRUgfGc6lw+N+546U1lSUxt0UwPlpI3fxevp/IYbii8PBiY7BtbDURSTZzjdonYIurGA5d8DC/ZrfEnYOtYFXTfbRLF+vdWgShRQcSelB7QuzAqJlpK8BJajIky/X7BIyIJlMPdMvHJEjaAE16ngV47HM72LTHUk6kv1J2N/+RZQ9JhLy/Aa2bQMFAAlLUMVGPPgJHR/WYwMV7EDUAZHdMOw2u4BF+d0xW8IReFK9MrBGQuQkaE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEwvxJpXarH/Lhpan8twx7oGY1ccDblgB8aNOgqPyu8=;
 b=LowUI15/HMKqtpQQAuuSTW9QPV38aghKHfaq97vu2irPabSezgQo5ptGKiOGvZ40ig7IibtHGUFLJSm7ub/bdD8OJL3aPtoOoCYMDvK99Trij+8+vsSdm0K0Le/dTm62Mk4lOfGU6IWMs+Yg3es3CZ4Q3N9i6FjWsdbkbIYZqYw=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1596.jpnprd01.prod.outlook.com (52.133.162.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 18:10:56 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:10:56 +0000
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
Subject: RE: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration
 from DT
Thread-Topic: [PATCH v4 3/7] drm: rcar-du: lvds: Get dual link configuration
 from DT
Thread-Index: AQHVrFLgNLi4JqNqqE+gKHtXbAdbBqe4oFgAgAR975A=
Date:   Mon, 16 Dec 2019 18:10:56 +0000
Message-ID: <TY1PR01MB17700938B2C48F684E910BA4C0510@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191213213010.GN4860@pendragon.ideasonboard.com>
In-Reply-To: <20191213213010.GN4860@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a24a863-fab8-41d3-374a-08d782534c0f
x-ms-traffictypediagnostic: TY1PR01MB1596:|TY1PR01MB1596:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1596D54E87D281DF3035CAA0C0510@TY1PR01MB1596.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(6916009)(186003)(8676002)(55016002)(54906003)(44832011)(53546011)(52536014)(7696005)(2906002)(478600001)(33656002)(86362001)(76116006)(66446008)(66946007)(66476007)(7416002)(66556008)(64756008)(6506007)(9686003)(26005)(81156014)(81166006)(5660300002)(8936002)(316002)(4326008)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1596;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LCiX6qECK4pf4bfsUsjkcWkDF/NvnsibKK5VOQ4Ns1A0wONSisw79qUn6PSasseSqMDqbTX7eqB/+tJghJC7AEkg27iXeB/ODpc4GOLjSqllsm6DVJjWEVdV2VT6Hk0lAtkUMuPhORSLIxUulyIsy9/I+EfMDytdr+++/QjBp7VVlAUkZT+RiVs7dB3VNgUiFtjGWEm7s6TNFYagMTB0e7B9CDrBqHRf/tpRRsC9kmF1HorHxFw656zDVUgd2H/oUwCPk6akOeOr5dy48IZcuUVnfIC/uKLvw2BVQdJ4Tyub+yJst+BOx1Z3AJPRk0j/cMLgntjU7Res5w9WZAa/0T7hwgcnx4nMXkv4WVYmbV96O+/7buMBqV26gbz+4YEkOVD/TlparqjJG4AMuLEdiN1THjD3wX/5ZmQIW4IZAOjAOPb7Qn5f6oR4PsRK4OQe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a24a863-fab8-41d3-374a-08d782534c0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:10:56.4247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lbs9gpcMQiV2bbELTA4do/qIlCADCyIePlbSYkoC1nBT9a3VsdpV8pYcPLAFTq4bZ44hBIRX9ClrjpcRGyiyrr8NdXBkfs50bkG2Ye+3yXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1596
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2Vu
dDogMTMgRGVjZW1iZXIgMjAxOSAyMTozMA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDMvN10g
ZHJtOiByY2FyLWR1OiBsdmRzOiBHZXQgZHVhbCBsaW5rIGNvbmZpZ3VyYXRpb24gZnJvbSBEVA0K
PiANCj4gSGkgRmFicml6aW8sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+
IE9uIEZyaSwgRGVjIDA2LCAyMDE5IGF0IDA0OjMyOjUwUE0gKzAwMDAsIEZhYnJpemlvIENhc3Ry
byB3cm90ZToNCj4gPiBGb3IgZHVhbC1MVkRTIGNvbmZpZ3VyYXRpb25zLCBpdCBpcyBub3cgcG9z
c2libGUgdG8gbWFyayB0aGUNCj4gPiBEVCBwb3J0IG5vZGVzIGZvciB0aGUgc2luayB3aXRoIGJv
b2xlYW4gcHJvcGVydGllcyAobGlrZQ0KPiA+IGR1YWwtbHZkcy1ldmVuLXBpeGVscyBhbmQgZHVh
bC1sdmRzLW9kZC1waXhlbHMpIHRvIGxldCBkcml2ZXJzDQo+ID4ga25vdyB0aGUgZW5jb2RlcnMg
bmVlZCB0byBiZSBjb25maWd1cmVkIGluIGR1YWwtTFZEUyBtb2RlLg0KPiA+DQo+ID4gUmV3b3Jr
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiByY2FyX2x2ZHNfcGFyc2VfZHRfY29tcGFuaW9uDQo+ID4g
dG8gbWFrZSB1c2Ugb2YgdGhlIERUIG1hcmtlcnMgd2hpbGUga2VlcGluZyBiYWNrd2FyZA0KPiA+
IGNvbXBhdGliaWxpdHkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IHYzLT52
NDoNCj4gPiAqIE5ldyBwYXRjaCBleHRyYWN0ZWQgZnJvbSBwYXRjaDoNCj4gPiAgICJkcm06IHJj
YXItZHU6IGx2ZHM6IEFkZCBkdWFsLUxWRFMgcGFuZWxzIHN1cHBvcnQiDQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgNTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDcgaW5zZXJ0aW9u
cygrKSwgOSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jDQo+ID4gaW5kZXggM2NiMGE4My4uNmMxZjE3MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfbHZkcy5jDQo+ID4gQEAgLTY2OSw4ICs2NjksMTAgQEAgRVhQT1JUX1NZTUJP
TF9HUEwocmNhcl9sdmRzX2R1YWxfbGluayk7DQo+ID4gIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3Bh
cnNlX2R0X2NvbXBhbmlvbihzdHJ1Y3QgcmNhcl9sdmRzICpsdmRzKQ0KPiA+ICB7DQo+ID4gIAlj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsNCj4gPiAtCXN0cnVjdCBkZXZpY2Vfbm9k
ZSAqY29tcGFuaW9uOw0KPiA+ICsJc3RydWN0IGRldmljZV9ub2RlICpjb21wYW5pb24sICpwMCwg
KnAxOw0KPiANCj4gQ291bGQgeW91IHJlbmFtZSBwMCBhbmQgcDEgdG8gcG9ydDAgYW5kIHBvcnQx
LCBhbmQgc3BpdCB0aGVtIHRvIGENCj4gc2VwYXJhdGUgbGluZSBvZiB2YXJpYWJsZSBkZWNsYXJh
dGlvbiA/DQoNCnN1cmUNCg0KPiANCj4gPiArCXN0cnVjdCByY2FyX2x2ZHMgKmNvbXBhbmlvbl9s
dmRzOw0KPiA+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gbHZkcy0+ZGV2Ow0KPiA+ICsJaW50IGR1
YWxfbGluazsNCj4gPiAgCWludCByZXQgPSAwOw0KPiA+DQo+ID4gIAkvKiBMb2NhdGUgdGhlIGNv
bXBhbmlvbiBMVkRTIGVuY29kZXIgZm9yIGR1YWwtbGluayBvcGVyYXRpb24sIGlmIGFueS4gKi8N
Cj4gPiBAQCAtNjg5LDEzICs2OTEsNTUgQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcGFyc2VfZHRf
Y29tcGFuaW9uKHN0cnVjdCByY2FyX2x2ZHMgKmx2ZHMpDQo+ID4gIAkJZ290byBkb25lOw0KPiA+
ICAJfQ0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJICogV2UgbmVlZCB0byB3b3JrIG91dCBpZiB0aGUg
c2luayBpcyBleHBlY3RpbmcgdXMgdG8gZnVuY3Rpb24gaW4NCj4gPiArCSAqIGR1YWwtbGluayBt
b2RlLiBXZSBkbyB0aGlzIGJ5IGxvb2tpbmcgYXQgdGhlIERUIHBvcnQgbm9kZXMgd2UgYXJlDQo+
ID4gKwkgKiBjb25uZWN0ZWQgdG8sIGlmIHRoZXkgYXJlIG1hcmtlZCBhcyBleHBlY3RpbmcgZXZl
biBwaXhlbHMgYW5kDQo+ID4gKwkgKiBvZGQgcGl4ZWxzIHRoYW4gd2UgbmVlZCB0byBlbmFibGUg
dmVydGljYWwgc3RyaXBlIG91dHB1dC4NCj4gPiArCSAqLw0KPiA+ICsJcDAgPSBvZl9ncmFwaF9n
ZXRfcG9ydF9ieV9pZChkZXYtPm9mX25vZGUsIDEpOw0KPiA+ICsJcDEgPSBvZl9ncmFwaF9nZXRf
cG9ydF9ieV9pZChjb21wYW5pb24sIDEpOw0KPiA+ICsJZHVhbF9saW5rID0gZHJtX29mX2x2ZHNf
Z2V0X2R1YWxfbGlua19waXhlbF9vcmRlcihwMCwgcDEpOw0KPiA+ICsJb2Zfbm9kZV9wdXQocDAp
Ow0KPiA+ICsJb2Zfbm9kZV9wdXQocDEpOw0KPiA+ICsJaWYgKGR1YWxfbGluayA+PSBEUk1fTFZE
U19EVUFMX0xJTktfRVZFTl9PRERfUElYRUxTKSB7DQo+ID4gKwkJbHZkcy0+ZHVhbF9saW5rID0g
dHJ1ZTsNCj4gPiArCX0gZWxzZSBpZiAobHZkcy0+bmV4dF9icmlkZ2UgJiYgbHZkcy0+bmV4dF9i
cmlkZ2UtPnRpbWluZ3MpIHsNCj4gPiArCQkvKg0KPiA+ICsJCSAqIEVhcmx5IGR1YWwtbGluayBi
cmlkZ2Ugc3BlY2lmaWMgaW1wbGVtZW50YXRpb25zIHBvcHVsYXRlIHRoZQ0KPiA+ICsJCSAqIHRp
bWluZ3MgZmllbGQgb2YgZHJtX2JyaWRnZSwgcmVhZCB0aGUgZHVhbF9saW5rIGZsYWcgb2ZmIHRo
ZQ0KPiA+ICsJCSAqIGJyaWRnZSBkaXJlY3RseSBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4N
Cj4gPiArCQkgKi8NCj4gPiArCQlsdmRzLT5kdWFsX2xpbmsgPSBsdmRzLT5uZXh0X2JyaWRnZS0+
dGltaW5ncy0+ZHVhbF9saW5rOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmICghbHZkcy0+ZHVh
bF9saW5rKSB7DQo+ID4gKwkJZGV2X2RiZyhkZXYsICJTaW5nbGUtbGluayBjb25maWd1cmF0aW9u
IGRldGVjdGVkXG4iKTsNCj4gPiArCQlnb3RvIGRvbmU7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJ
bHZkcy0+Y29tcGFuaW9uID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKGNvbXBhbmlvbik7DQo+ID4gIAlp
ZiAoIWx2ZHMtPmNvbXBhbmlvbikgew0KPiA+ICAJCXJldCA9IC1FUFJPQkVfREVGRVI7DQo+ID4g
IAkJZ290byBkb25lOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQlkZXZfZGJnKGRldiwgIkZvdW5kIGNv
bXBhbmlvbiBlbmNvZGVyICVwT0ZcbiIsIGNvbXBhbmlvbik7DQo+ID4gKwlkZXZfZGJnKGRldiwN
Cj4gPiArCQkiRHVhbC1saW5rIGNvbmZpZ3VyYXRpb24gZGV0ZWN0ZWQgKGNvbXBhbmlvbiBlbmNv
ZGVyICVwT0YpXG4iLA0KPiA+ICsJCWNvbXBhbmlvbik7DQo+ID4gKw0KPiA+ICsJY29tcGFuaW9u
X2x2ZHMgPSBicmlkZ2VfdG9fcmNhcl9sdmRzKGx2ZHMtPmNvbXBhbmlvbik7DQo+IA0KPiBDb3Vs
ZCB5b3UgbW92ZSB0aGlzIGxpbmUgYWZ0ZXIgdGhlIEZJWE1FIGNvbW1lbnQgPw0KDQpXaWxsIGRv
DQoNClRoYW5rcywNCkZhYg0KDQo+IA0KPiBXaXRoIHRoZXNlIHNtYWxsIGlzc3VlcyBmaXhlZCwN
Cj4gDQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBGSVhNRTogV2Ug
c2hvdWxkIG5vdCBiZSBtZXNzaW5nIHdpdGggdGhlIGNvbXBhbmlvbiBlbmNvZGVyIHByaXZhdGUN
Cj4gPiArCSAqIGRhdGEgZnJvbSB0aGUgcHJpbWFyeSBlbmNvZGVyLCB3ZSBzaG91bGQgcmF0aGVy
IGxldCB0aGUgY29tcGFuaW9uDQo+ID4gKwkgKiBlbmNvZGVyIHdvcmsgdGhpbmdzIG91dCBvbiBp
dHMgb3duLiBIb3dldmVyLCB0aGUgY29tcGFuaW9uIGVuY29kZXINCj4gPiArCSAqIGRvZXNuJ3Qg
aG9sZCBhIHJlZmVyZW5jZSB0byB0aGUgcHJpbWFyeSBlbmNvZGVyLCBhbmQNCj4gPiArCSAqIGRy
bV9vZl9sdmRzX2dldF9kdWFsX2xpbmtfcGl4ZWxfb3JkZXIgbmVlZHMgdG8gYmUgZ2l2ZW4gcmVm
ZXJlbmNlcw0KPiA+ICsJICogdG8gdGhlIG91dHB1dCBwb3J0cyBvZiBib3RoIGVuY29kZXJzLCB0
aGVyZWZvcmUgbGVhdmUgaXQgbGlrZSB0aGlzDQo+ID4gKwkgKiBmb3IgdGhlIHRpbWUgYmVpbmcu
DQo+ID4gKwkgKi8NCj4gPiArCWNvbXBhbmlvbl9sdmRzLT5kdWFsX2xpbmsgPSB0cnVlOw0KPiA+
DQo+ID4gIGRvbmU6DQo+ID4gIAlvZl9ub2RlX3B1dChjb21wYW5pb24pOw0KPiA+IEBAIC03Mzks
MTMgKzc4Myw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0KHN0cnVjdCByY2FyX2x2
ZHMgKmx2ZHMpDQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCWdvdG8gZG9uZTsNCj4gPg0KPiA+IC0J
aWYgKChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJUktfRFVBTF9MSU5LKSAmJg0K
PiA+IC0JICAgIGx2ZHMtPm5leHRfYnJpZGdlKQ0KPiA+IC0JCWx2ZHMtPmR1YWxfbGluayA9IGx2
ZHMtPm5leHRfYnJpZGdlLT50aW1pbmdzDQo+ID4gLQkJCQk/IGx2ZHMtPm5leHRfYnJpZGdlLT50
aW1pbmdzLT5kdWFsX2xpbmsNCj4gPiAtCQkJCTogZmFsc2U7DQo+ID4gLQ0KPiA+IC0JaWYgKGx2
ZHMtPmR1YWxfbGluaykNCj4gPiArCWlmIChsdmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNf
UVVJUktfRFVBTF9MSU5LKQ0KPiA+ICAJCXJldCA9IHJjYXJfbHZkc19wYXJzZV9kdF9jb21wYW5p
b24obHZkcyk7DQo+ID4NCj4gPiAgZG9uZToNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBM
YXVyZW50IFBpbmNoYXJ0DQo=
