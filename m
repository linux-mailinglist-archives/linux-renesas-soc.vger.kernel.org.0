Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9767D115472
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 16:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbfLFPku (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 10:40:50 -0500
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:24656
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726250AbfLFPku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 10:40:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StTaUk5Ae8PD7UQ+rcxcq1EWW5705kLesMRDZ+eHm08gDze4C/cMzkx/jUYMmP+faL9vs815KMnTTztuanCEos1Lb9COERyS/Qm1YKstWt4Me0wAkYEX8LXI5p3rpDBzVLX+Vmv9u9wOVC2vTd5sSEGa9+HTpqPIqqMaCBdkdHPPk3Pz85v1x3Tpxja2XVe3w94KOMdGLFCCfTEYUEKVZvu/CiK75kdybuH2gkbuJCGikQurNy0B4eb9Lw0vF1y/y6JXm4pzrjYGid2FxVu2l+LsIzbCey3Q5p9ZeTjBzsr3hFDUYAj3nEosKmOwthg+4Dt/xy/MmWo+J0PtPQh/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96lcQjVD08V7xowwvsFl6CgUYneWQh7nBDGOiVFu+sc=;
 b=V2y8elUxi7thSlC4nO2CUI2oC03WRiPjBEAM0sXbP3NTwi/gEcehkwr7mD1RtJByXNTatjcFVLiYXgnnrP4bD+S0RJ1aHLJJ2LgNJOLI4+DQizN/EuOgvplqiDGRAhEo+l7Uzey+YOSFh6XeNUJXQ4Bzu7OCft11/7ISS/Sn6S80WJyEbNJCZlYWXGJR7VaPwte//yqNppogA7unfdYZdVqbqVm07RZXysdMhxZGaZvFKcs5+jPt+n0wwejH0ZtOEb8fV7SpK3J7Und/yQ+LedYu5bFbJGVKJ6eptI3lbFi70Cvr2XZ5J9VrP3W3dyDtMT7SP6b+d4jfxMMtokxnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96lcQjVD08V7xowwvsFl6CgUYneWQh7nBDGOiVFu+sc=;
 b=TCqZXZxHccNVnEynATCRBRUK/KQ/WgCCgOkUjofQ1doixia8uOz0idJjw+d0qsEqBrscjpxiX9TszAxBMpI20miKnV1RHR5mOC/Ym9LHtQk6vdVuDNWPQ0yEGEjfdDIqEdGQgEt/RmtGyzYCkOSQD4eRxdL6xsYroa4NoIXTH8w=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1804.jpnprd01.prod.outlook.com (52.133.162.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Fri, 6 Dec 2019 15:40:43 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::5166:5e51:90f5:3ee1%7]) with mapi id 15.20.2495.014; Fri, 6 Dec 2019
 15:40:43 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [PATCH v3 7/8] [HACK] arm64: dts: renesas: draak: Enable LVDS
Thread-Topic: [PATCH v3 7/8] [HACK] arm64: dts: renesas: draak: Enable LVDS
Thread-Index: AQHVXc+ha8jAjgIJ6EiELjIW5u69iKeAj5WAgC1LZnA=
Date:   Fri, 6 Dec 2019 15:40:42 +0000
Message-ID: <TY1PR01MB17708785623D4B6747418A9EC05F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1567017402-5895-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1567017402-5895-8-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191107195737.GL24983@pendragon.ideasonboard.com>
In-Reply-To: <20191107195737.GL24983@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8dbb26b-b35e-4cb0-6e83-08d77a62a77f
x-ms-traffictypediagnostic: TY1PR01MB1804:|TY1PR01MB1804:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB18042CDFF12265F1CACB8FDFC05F0@TY1PR01MB1804.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(199004)(189003)(52536014)(6916009)(305945005)(74316002)(53546011)(44832011)(7416002)(86362001)(8936002)(99286004)(81156014)(55016002)(76176011)(102836004)(6506007)(81166006)(8676002)(9686003)(4326008)(33656002)(26005)(316002)(186003)(229853002)(71200400001)(54906003)(5660300002)(7696005)(64756008)(966005)(66476007)(76116006)(66446008)(66556008)(66946007)(478600001)(2906002)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1804;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G8wNLCrch4NhtaUTpjLmYOVqdENj2K5Jc0yR8sQp6AcCmy0oHBwXpbIMoMjISo5c16BdUcAv2IlW9EehhbYHOOcNCbxUPf0XO8jG9KkBo8y9sogZKVwgIJzPe8hYWNZh9xl1ENMi7Qoy+N0hzbft/WbXZeTLYHAs6VU/LRkAdyKR+b2BCWwv20z/ybpW/N0mJiw1w9sF2nJjFz6mDF2Zc9Y/zM+WNqMYziTz8JDC2RDdhlGp5oLIl1uZBmGhLxiu0iCg1694b5j1pEaSbqj2FtWm/0FzJkkpxRWRErVPWQcEwnNsYn6HPAid63i5f/izt81kYsTb9bBrvpVkIMH/TYfU5abBTHES3GailQ/nbc867FniEr70Zb8xXHJ2U7TfJFzBuYRvQKYg4NscDUg3RoeGxy3TVUA8Cr0YMQg4RG2QxwWlVrsULcjDvOUeOMre1cwXSFgdJkbvZfSf+OMnTfYHIGk6BDlK6cLvlwJ9CUQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8dbb26b-b35e-4cb0-6e83-08d77a62a77f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 15:40:43.0115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aeNOfOvh0WTh6Wq8NQ2Z2aQnKceB2Nyf2E8AksziYz6bQS+gCjTf2wJYci0xh1L2LXNMTl3K4LlDAoFX3+4+fcK4tTNZeTr8OUB88BRt0NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1804
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2shDQoNCj4gRnJvbTog
bGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1yZW5lc2FzLXNv
Yy1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBMYXVyZW50IFBpbmNoYXJ0DQo+
IFNlbnQ6IDA3IE5vdmVtYmVyIDIwMTkgMTk6NTgNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA3
LzhdIFtIQUNLXSBhcm02NDogZHRzOiByZW5lc2FzOiBkcmFhazogRW5hYmxlIExWRFMNCj4gDQo+
IEhpIEZhYnJpemlvLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBUaGUg
c3ViamVjdCBpcyB3cm9uZywgaXQgc2hvdWxkIGJlDQo+IA0KPiBbSEFDS10gYXJtNjQ6IGR0czog
cmVuZXNhczogZWJpc3U6IEVuYWJsZSBMVkRTIGR1YWwtbGluayBvcGVyYXRpb24NCg0KVGhpcyBz
b3VuZHMgbGlrZSBhIGNvcHkgYW5kIHBhc3RlIGdvbmUgcmVhbGx5IHdyb25nIQ0KU29ycnkgYWJv
dXQgdGhhdC4gSSdsbCBiZSBkcm9wcGluZyB0aGlzIHBhdGNoIGluIHY0Lg0KDQpUaGFua3MsDQpG
YWINCg0KPiANCj4gT24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDc6MzY6NDFQTSArMDEwMCwgRmFi
cml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+IEVuYWJsZSBhbmQgY29ubmVjdCB0aGUgc2Vjb25kIExW
RFMgZW5jb2RlciB0byB0aGUgc2Vjb25kIExWRFMgaW5wdXQgb2YNCj4gPiB0aGUgVEhDNjNMVkQx
MDI0IGZvciBkdWFsLWxpbmsgTFZEUyBvcGVyYXRpb24uIFRoaXMgcmVxdWlyZXMgY2hhbmdpbmcN
Cj4gPiB0aGUgZGVmYXVsdCBzZXR0aW5ncyBvZiBTVzQ1IGFuZCBTVzQ3IHRvIE9GRiBhbmQgT04g
cmVzcGVjdGl2ZWx5Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiBMYXVyZW50J3Mg
ZHVhbC1MVkRTIHdvcms6DQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MDk2NTA0NS8NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAqIG5l
dyBwYXRjaA0KPiA+DQo+ID4gR2VlcnQsDQo+ID4NCj4gPiBubyBuZWVkIHRvIHJldmlldyB0aGlz
IHBhdGNoIHVubGVzcyB0aGV5IGxpa2UgdGhlIGlkZWEgYmVoaW5kIHRoaXMNCj4gPiBzZXJpZXMu
DQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gRmFiDQo+ID4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLWViaXN1LmR0cyB8IDIxICsrKysrKysrKysrKysr
KysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjhhNzc5OTAtZWJpc3UuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkw
LWViaXN1LmR0cw0KPiA+IGluZGV4IGIzOGY5ZDQuLjM4YjljNWEgMTAwNjQ0DQo+ID4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTkwLWViaXN1LmR0cw0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC1lYmlzdS5kdHMNCj4gPiBAQCAt
ODcsMTEgKzg3LDIwIEBADQo+ID4NCj4gPiAgCQkJcG9ydEAwIHsNCj4gPiAgCQkJCXJlZyA9IDww
PjsNCj4gPiAtCQkJCXRoYzYzbHZkMTAyNF9pbjogZW5kcG9pbnQgew0KPiA+ICsJCQkJZHVhbC1s
dmRzLWV2ZW4tcGl4ZWxzOw0KPiA+ICsJCQkJdGhjNjNsdmQxMDI0X2luMDogZW5kcG9pbnQgew0K
PiA+ICAJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczBfb3V0PjsNCj4gPiAgCQkJCX07DQo+
ID4gIAkJCX07DQo+ID4NCj4gPiArCQkJcG9ydEAxIHsNCj4gPiArCQkJCXJlZyA9IDwxPjsNCj4g
PiArCQkJCWR1YWwtbHZkcy1vZGQtcGl4ZWxzOw0KPiA+ICsJCQkJdGhjNjNsdmQxMDI0X2luMTog
ZW5kcG9pbnQgew0KPiA+ICsJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHZkczFfb3V0PjsNCj4g
PiArCQkJCX07DQo+ID4gKwkJCX07DQo+ID4gKw0KPiA+ICAJCQlwb3J0QDIgew0KPiA+ICAJCQkJ
cmVnID0gPDI+Ow0KPiA+ICAJCQkJdGhjNjNsdmQxMDI0X291dDogZW5kcG9pbnQgew0KPiA+IEBA
IC00ODksNyArNDk4LDcgQEANCj4gPiAgCXBvcnRzIHsNCj4gPiAgCQlwb3J0QDEgew0KPiA+ICAJ
CQlsdmRzMF9vdXQ6IGVuZHBvaW50IHsNCj4gPiAtCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGhj
NjNsdmQxMDI0X2luPjsNCj4gPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdGhjNjNsdmQxMDI0
X2luMD47DQo+ID4gIAkJCX07DQo+ID4gIAkJfTsNCj4gPiAgCX07DQo+ID4gQEAgLTUwNyw2ICs1
MTYsMTQgQEANCj4gPiAgCQkgPCZ4MTNfY2xrPiwNCj4gPiAgCQkgPCZleHRhbF9jbGs+Ow0KPiA+
ICAJY2xvY2stbmFtZXMgPSAiZmNrIiwgImRjbGtpbi4wIiwgImV4dGFsIjsNCj4gPiArDQo+ID4g
Kwlwb3J0cyB7DQo+ID4gKwkJcG9ydEAxIHsNCj4gPiArCQkJbHZkczFfb3V0OiBlbmRwb2ludCB7
DQo+ID4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnRoYzYzbHZkMTAyNF9pbjE+Ow0KPiA+ICsJ
CQl9Ow0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gICZvaGNpMCB7DQo+
ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVu
dCBQaW5jaGFydA0K
