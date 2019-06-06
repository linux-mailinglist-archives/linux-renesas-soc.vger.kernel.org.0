Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E804236BED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 07:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbfFFFyE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 01:54:04 -0400
Received: from mail-eopbgr1400101.outbound.protection.outlook.com ([40.107.140.101]:50995
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725267AbfFFFyE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 01:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CF7dgdLsljFTzBrGIHTax3oqN4WWMt13dT0Gdc6+aYA=;
 b=RRfgQp6hpsTO3dlk2KhJBJEKrLj/QML9LxqOTxTKyvkmzjkC9tQ0lHzTUHeRcT50DZP7yWyHAcyof9cpuCAtk00z7GPVjVPstK8q9+ga3okhe7biKGf/X3OCxQAbat7lAnk1Vs7zrwEI5OgW8TBUJ7edBskV8ycbE8jCNAcwdlU=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3364.jpnprd01.prod.outlook.com (20.178.100.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 05:53:56 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 05:53:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Robin Murphy <robin.murphy@arm.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "hch@lst.de" <hch@lst.de>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "joro@8bytes.org" <joro@8bytes.org>
Subject: RE: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Thread-Topic: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Thread-Index: AQHVG5AuSNIEYbUj60Sza33KteoVlaaM+2qAgAEa6pA=
Date:   Thu, 6 Jun 2019 05:53:56 +0000
Message-ID: <OSAPR01MB3089C968A7434A635AF5B7C2D8170@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
In-Reply-To: <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e95900e7-74e4-4e02-4c8c-08d6ea435d2f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3364;
x-ms-traffictypediagnostic: OSAPR01MB3364:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <OSAPR01MB33649590CB859A99E54D00DAD8170@OSAPR01MB3364.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(346002)(39860400002)(396003)(136003)(52314003)(189003)(199004)(5660300002)(74316002)(305945005)(316002)(186003)(11346002)(26005)(4326008)(486006)(476003)(25786009)(73956011)(14444005)(76116006)(66946007)(68736007)(446003)(478600001)(256004)(52536014)(8676002)(81156014)(86362001)(81166006)(7736002)(66446008)(66556008)(66476007)(64756008)(76176011)(54906003)(6306002)(6916009)(6116002)(3846002)(229853002)(6436002)(8936002)(14454004)(966005)(66066001)(71200400001)(71190400001)(53936002)(6246003)(9686003)(55016002)(7696005)(33656002)(99286004)(6506007)(102836004)(2906002)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3364;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hcGinsUpvTax+GpQ+JKZxQEx25r6H8EKpmq8wtT6a4/T1DcRoNGrxYB0CF426TijEb9G8pPcKfAe2CaWQ1CfJ9+KRz8y0v8rRK0IlNmvZK1ml0C7cMuMr92h87x3dydWBeRV0qTAd6VXWYHH6OSnWXXh8/ScTXzDlNA7xcYuDPrDZ7WOQThFqdPoHQQSYpx/d81oFMwQ/nB6xWDJ6syuknfbDXJaPvUea9o0/OdRqeln8tfbVXLPrL4MaUiZVAGxAkt0BrsbhZz3wqCQUfw7PHGpEE2xL4t7DmVpP3XBdCxvDDomVILCzdLR521sA9JrSb5NlKXB0OXTxAGpIEZWs0Y+kd8hfPPvVHXaT8ZvcOrlBmRoWvMPVCUo+We0Wbs7OqnplDeD+muLJgGpcXd7FQmv9IXesL2/MNvf7+wT5JA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95900e7-74e4-4e02-4c8c-08d6ea435d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 05:53:56.4904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3364
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iaW4sDQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cyENCg0KPiBGcm9tOiBSb2Jp
biBNdXJwaHksIFNlbnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDE5IDk6MjIgUE0NCjxzbmlwPg0K
PiA+IEBAIC05MDIsOCArOTE0LDE4IEBAIHN0YXRpYyBpbnQgaW9tbXVfZG1hX21hcF9zZyhzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2csDQo+ID4gICAJaWYgKGlvbW11
X21hcF9zZyhkb21haW4sIGlvdmEsIHNnLCBuZW50cywgcHJvdCkgPCBpb3ZhX2xlbikNCj4gPiAg
IAkJZ290byBvdXRfZnJlZV9pb3ZhOw0KPiA+DQo+ID4gLQlyZXR1cm4gX19maW5hbGlzZV9zZyhk
ZXYsIHNnLCBuZW50cywgaW92YSk7DQo+ID4gKwlyZXQgPSBfX2ZpbmFsaXNlX3NnKGRldiwgc2cs
IG5lbnRzLCBpb3ZhKTsNCj4gPiArCS8qDQo+ID4gKwkgKiBDaGVjayB3aGV0aGVyIHRoZSBzZyBl
bnRyeSBpcyBzaW5nbGUgaWYgYSBkZXZpY2UgcmVxdWlyZXMgYW5kDQo+ID4gKwkgKiB0aGUgSU9N
TVUgZHJpdmVyIGhhcyB0aGUgY2FwYWJsZS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKGlvdmFfY29u
dGlndW91cyAmJiByZXQgIT0gMSkNCj4gPiArCQlnb3RvIG91dF91bm1hcF9zZzsNCj4gDQo+IEkg
ZG9uJ3Qgc2VlIHRoYXQganVzdCBmYWlsaW5nIHJlYWxseSBnaXZlcyB0aGlzIG9wdGlvbiBhbnkg
dmFsdWUuDQo+IENsZWFybHkgdGhlIE1NQyBkcml2ZXIgaGFzIHRvIGRvICpzb21ldGhpbmcqIHRv
IGhhbmRsZSB0aGUgZmFpbHVyZSAocGx1cw0KPiBwcmVzdW1hYmx5IHRoZSBjYXNlIG9mIG5vdCBo
YXZpbmcgSU9NTVUgRE1BIG9wcyBhdCBhbGwpLCB3aGljaCBiZWdzIHRoZQ0KPiBxdWVzdGlvbiBv
ZiB3aHkgaXQgY291bGRuJ3QganVzdCBkbyB3aGF0ZXZlciB0aGF0IGlzIGFueXdheSwgd2l0aG91
dCBhbGwNCj4gdGhpcyBpbmZyYXN0cnVjdHVyZS4gRm9yIHN0YXJ0ZXJzLCBpdCB3b3VsZCBiZSBh
IGZhciBzaW1wbGVyIGFuZCBsZXNzDQo+IGludmFzaXZlIHBhdGNoOg0KPiANCj4gCWlmIChkbWFf
bWFwX3NnKC4uLikgPiAxKSB7DQo+IAkJZG1hX3VubWFwX3NnKC4uLik7DQo+IAkJLyogc3BsaXQg
aW50byBtdWx0aXBsZSByZXF1ZXN0cyBhbmQgdHJ5IGFnYWluICovDQo+IAl9DQoNCkkgdW5kZXJz
dG9vZCBpdC4NCg0KPiBCdXQgdGhlbiBpdCB3b3VsZCBtYWtlIGV2ZW4gbW9yZSBzZW5zZSB0byBq
dXN0IGhhdmUgdGhlIGRyaXZlciBiZQ0KPiBwcm9hY3RpdmUgYWJvdXQgaXRzIHNwZWNpYWwgcmVx
dWlyZW1lbnQgaW4gdGhlIGZpcnN0IHBsYWNlLCBhbmQgc2ltcGx5DQo+IHZhbGlkYXRlIHRoZSBs
aXN0IGJlZm9yZSBpdCBldmVuIHRyaWVzIHRvIG1hcCBpdDoNCj4gDQo+IAlmb3JfZWFjaF9zZyhz
Z2wsIHNnLCBuLCBpKQ0KPiAJCWlmICgoaSA+IDAgJiYgc2ctPm9mZnNldCAlIFBBR0VfU0laRSkg
fHwNCj4gCQkgICAgKGkgPCBuIC0gMSAmJiBzZy0+bGVuZ3RoICUgUEFHRV9TSVpFKSkNCj4gCQkJ
Lyogc2VnbWVudCB3aWxsIG5vdCBiZSBtZXJnZWFibGUgKi8NCg0KSW4gcHJldmlvdXMgdmVyc2lv
biwgSSBtYWRlIHN1Y2ggYSBjb2RlIFsxXS4NCkJ1dCwgSSB0aGluayBJIG1pc3VuZGVyc3Rvb2Qg
Q2hyaXN0b3BoJ3MgY29tbWVudHMgWzJdIFszXS4NCg0KWzFdDQpodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzEwOTcwMDQ3Lw0KDQpbMl0NCmh0dHBzOi8vbWFyYy5pbmZvLz9sPWxp
bnV4LXJlbmVzYXMtc29jJm09MTU1OTU2NzUxODExNjg5Jnc9Mg0KDQpbM10NCmh0dHBzOi8vbWFy
Yy5pbmZvLz9sPWxpbnV4LXJlbmVzYXMtc29jJm09MTU1ODUyODE0NjA3MjAyJnc9Mg0KDQo+IEZv
ciByZWZlcmVuY2UsIEkgdGhpbmsgdjRsMiBhbmQgcG9zc2libHkgc29tZSBhcmVhcyBvZiBEUk0g
YWxyZWFkeSBkbw0KPiBzb21ldGhpbmcgdmFndWVseSBzaW1pbGFyIHRvIGp1ZGdlIHdoZXRoZXIg
dGhleSBnZXQgY29udGlndW91cyBidWZmZXJzDQo+IG9yIG5vdC4NCg0KSSBzZWUuIEknbGwgY2hl
Y2sgdGhlc2UgYXJlYXMgbGF0ZXIuDQoNCj4gPiArDQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+DQo+
ID4gK291dF91bm1hcF9zZzoNCj4gPiArCWlvbW11X2RtYV91bm1hcF9zZyhkZXYsIHNnLCBuZW50
cywgZGlyLCBhdHRycyk7DQo+ID4gICBvdXRfZnJlZV9pb3ZhOg0KPiA+ICAgCWlvbW11X2RtYV9m
cmVlX2lvdmEoY29va2llLCBpb3ZhLCBpb3ZhX2xlbik7DQo+ID4gICBvdXRfcmVzdG9yZV9zZzoN
Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pb21tdS5oIGIvaW5jbHVkZS9saW51eC9p
b21tdS5oDQo+ID4gaW5kZXggOTFhZjIyYS4uZjk3MWRkMyAxMDA2NDQNCj4gPiAtLS0gYS9pbmNs
dWRlL2xpbnV4L2lvbW11LmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2lvbW11LmgNCj4gPiBA
QCAtMTA0LDYgKzEwNCw3IEBAIGVudW0gaW9tbXVfY2FwIHsNCj4gPiAgIAkJCQkJICAgdHJhbnNh
Y3Rpb25zICovDQo+ID4gICAJSU9NTVVfQ0FQX0lOVFJfUkVNQVAsCQkvKiBJT01NVSBzdXBwb3J0
cyBpbnRlcnJ1cHQgaXNvbGF0aW9uICovDQo+ID4gICAJSU9NTVVfQ0FQX05PRVhFQywJCS8qIElP
TU1VX05PRVhFQyBmbGFnICovDQo+ID4gKwlJT01NVV9DQVBfTUVSR0lORywJCS8qIElPTU1VIHN1
cHBvcnRzIHNlZ21lbnRzIG1lcmdpbmcgKi8NCj4gDQo+IFRoaXMgaXNuJ3QgYSAnY2FwYWJpbGl0
eScgb2YgdGhlIElPTU1VIC0gInNlZ21lbnQgbWVyZ2luZyIgZXF1YXRlcyB0bw0KPiBqdXN0IHJl
bWFwcGluZyBwYWdlcywgYW5kIHRoZXJlJ3MgYWxyZWFkeSBhIGZ1bmRhbWVudGFsIGFzc3VtcHRp
b24gdGhhdA0KPiBJT01NVXMgYXJlIGNhcGFibGUgb2YgdGhhdC4gUGx1cyBpdCdzIHZlcnkgbXVj
aCBhIERNQSBBUEkgY29uY2VwdCwgc28NCj4gaGFyZGx5IGJlbG9uZ3MgaW4gdGhlIElPTU1VIEFQ
SSBhbnl3YXkuDQoNCkkgZ290IGl0Lg0KDQo+IEFsbCBpbiBhbGwsIEknbSBzdHJ1Z2dsaW5nIHRv
IHNlZSB0aGUgcG9pbnQgb2YgdGhpcy4gQWx0aG91Z2ggaXQncyBub3QgYQ0KPiBETUEgQVBJIGd1
YXJhbnRlZSwgaW9tbXUtZG1hIGFscmVhZHkgbWVyZ2VzIHNjYXR0ZXJsaXN0cyBhcyBhZ2dyZXNz
aXZlbHkNCj4gYXMgaXQgaXMgYWxsb3dlZCB0bywgYW5kIHdpbGwgY29udGludWUgdG8gZG8gc28g
Zm9yIHRoZSBmb3Jlc2VlYWJsZQ0KPiBmdXR1cmUgKHNpbmNlIGl0IGF2b2lkcyBjb25zaWRlcmFi
bGUgY29tcGxpY2F0aW9uIGluIHRoZSBJT1ZBDQo+IGFsbG9jYXRpb24pLCBzbyBpZiB5b3Ugd2Fu
dCB0byBtYWtlIHN1cmUgaW9tbXVfZG1hX21hcF9zZygpIG1lcmdlcyBhbg0KPiBlbnRpcmUgbGlz
dCwganVzdCBkb24ndCBnaXZlIGl0IGEgbm9uLW1lcmdlYWJsZSBsaXN0Lg0KDQpUaGFuayB5b3Ug
Zm9yIHRoZSBleHBsYW5hdGlvbi4gSSBkaWRuJ3Qga25vdyB0aGF0IGEgZHJpdmVyIHNob3VsZCBu
b3QNCmdpdmUgaXQgYSBub24tbWVyZ2VhYmxlIGxpc3QuDQoNCj4gQW5kIGlmIHlvdSBzdGlsbA0K
PiByZWFsbHkgcmVhbGx5IHdhbnQgZG1hX21hcF9zZygpIHRvIGhhdmUgYSBiZWhhdmlvdXIgb2Yg
Im1lcmdlIHRvIGENCj4gc2luZ2xlIHNlZ21lbnQgb3IgZmFpbCIsIHRoZW4gdGhhdCBzaG91bGQg
YXQgbGVhc3QgYmUgYSBETUEgQVBJDQo+IGF0dHJpYnV0ZSwgd2hpY2ggY291bGQgaW4gcHJpbmNp
cGxlIGJlIGhvbm91cmVkIGJ5IGJvdW5jZS1idWZmZXJpbmcNCj4gaW1wbGVtZW50YXRpb25zIGFz
IHdlbGwuDQoNCkkgZ290IGl0LiBGb3IgdGhpcyBwYXRjaCBzZXJpZXMsIGl0IHNlZW1zIEkgaGF2
ZSB0byBtb2RpZnkgYSBibG9jayBsYXllcg0Kc28gdGhhdCBzdWNoIGEgbmV3IERNQSBBUEkgaXMg
bm90IG5lZWRlZCB0aG91Z2guDQoNCj4gQW5kIGlmIHRoZSBwcm9ibGVtIGlzIHJlYWxseSB0aGF0
IHlvdSdyZSBub3QgZ2V0dGluZyBtZXJnaW5nIGJlY2F1c2Ugb2YNCj4gZXhwb3NpbmcgdGhlIHdy
b25nIHBhcmFtZXRlcnMgdG8gdGhlIERNQSBBUEkgYW5kL29yIHRoZSBibG9jayBsYXllciwgb3IN
Cj4gdGhhdCB5b3UganVzdCBjYW4ndCBxdWl0ZSBleHByZXNzIHlvdXIgcmVxdWlyZW1lbnQgdG8g
dGhlIGJsb2NrIGxheWVyIGluDQo+IHRoZSBmaXJzdCBwbGFjZSwgdGhlbiB0aGF0IHNob3VsZCBy
ZWFsbHkgYmUgdGFja2xlZCBhdCB0aGUgc291cmNlIHJhdGhlcg0KPiB0aGFuIHdvcmtlZCBhcm91
bmQgZnVydGhlciBkb3duIGluIHRoZSBzdGFjay4NCg0KSSdsbCByZXBseSBvbiBDaHJpc3RvcGgg
ZW1haWwgYWJvdXQgdGhpcyB0b3BpYyBsYXRlci4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJv
IFNoaW1vZGENCg0KPiBSb2Jpbi4NCg==
