Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB25795390
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 03:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbfHTBmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 21:42:23 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:65120
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728719AbfHTBmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 21:42:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHrXkRfOyof8zw4GLeNlzQIHOQW2Q5mV+TefLSg5GiU7feJwuDQ6NE8C9g7QR2iDUj/dxSNE/4TiLnhiYtUOizRC+0FWHsYtyIEIuWqemRWzmcOBzC3Zq9E+lN/pxe5xht7bre5M1brUKd43e/JCg2Rbr04zqIU5TIkYlOQsBq3is8mn40GMInOa43Tx5DDStkec4vz28tVJM6LycB5YU/fKnS9za/niRgqAwljJSA3Sl5KNGHtks2ygGU+M17ev37A88R6wgsVST8ZylQaK7PCvz5+a2AwkNW2J4D2Buj/qbcma1G+nni+4aA/EfYA3M3LDy7icKAwrrOsiTVpfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuFsc4QCpeN5MWdsfnCavBMARojnbQftklZ+JYr+nGY=;
 b=QHkqGe2da4CbgBs5F03hqY8DYCCiT7MxqqKT0+/+crpE09pWbHnJtyteEz6a2yLRTxKpF/0Pv5CHT3w3ghyiss+c9dQY+4r5wFWg3RCzTI3J67cOtg0OXSlkDuA2fNeRKMr+YH6osoW+0ZW3tDe+KqzFiValGIDfmhd22NfFC9N3glBUhiLMpOyPs2+n5WsCW4sQENAKAI/+wOwFjM7Ra/1cqYHZJMlKIdIxOGURc1NmkVMVvsNYNPMzOL7g2TvQxGh4xOVAALALCEfAxphxnNI0JXLGC8doSYDqHixCy8HHBQWcyO1te/vDSCDFb7qVhvZKVIom5i44zAN8hxknbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuFsc4QCpeN5MWdsfnCavBMARojnbQftklZ+JYr+nGY=;
 b=Nhvc6WHY6PdrZrftwtLxgmLOXISktkD1xCPHrS2IKqyY7I6V45E6JsKoB4mZGw3VS+U8AccpyMMUcOJ89YM4lL2ojk4ZFkjUG6rX5h8O27OD0HnyTKAc+ETKB9bQLKkp6zuPZvDul3WMf2BsVIYfwq3tZXQ+9jVW/iz/PFGiMUQ=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2477.jpnprd01.prod.outlook.com (20.177.101.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 01:42:18 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 01:42:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Robin Murphy <robin.murphy@arm.com>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "hch@lst.de" <hch@lst.de>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>
Subject: RE: [PATCH v9 2/5] iommu/dma: Add a new dma_map_ops of
 get_merge_boundary()
Thread-Topic: [PATCH v9 2/5] iommu/dma: Add a new dma_map_ops of
 get_merge_boundary()
Thread-Index: AQHVQ4ypPSzm8K7UpEaJjj39WHup9acCk4MAgADUWRA=
Date:   Tue, 20 Aug 2019 01:42:18 +0000
Message-ID: <TYAPR01MB4544A7A255738624E2A405C9D8AB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1564129876-28261-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <312d6e38-5143-fb07-1efb-01e60cafa2c9@arm.com>
In-Reply-To: <312d6e38-5143-fb07-1efb-01e60cafa2c9@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b87e956-c552-4312-d6be-08d7250fa2f6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB2477;
x-ms-traffictypediagnostic: TYAPR01MB2477:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB247747EE531DE19F6EFA8AD7D8AB0@TYAPR01MB2477.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(55016002)(7736002)(6306002)(9686003)(33656002)(229853002)(478600001)(74316002)(6116002)(6916009)(3846002)(966005)(305945005)(316002)(6436002)(99286004)(256004)(25786009)(66446008)(64756008)(66946007)(66556008)(66476007)(76116006)(86362001)(26005)(8936002)(446003)(11346002)(81166006)(81156014)(476003)(8676002)(186003)(76176011)(53546011)(6506007)(7696005)(486006)(52536014)(102836004)(71200400001)(71190400001)(14454004)(54906003)(66066001)(7416002)(5660300002)(2906002)(4326008)(53936002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2477;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kl8OpN7lYzC4vbOThP5DN99YVOHxr2MpBWv1ST0JWuzAqNa3hZMvPIUzegR0dZh/7THk2FnTmY7nfDk7j+3SpvO2YaqfKzz0Gg7Ur8j64k+knXkRCSNmmirESz5KuAjeVQNMnCYO8g0waCDD72uzd2WNLTcmBtDDN1WSolwb6fVPiNJJJ2L4Diy26z8/OWkxqg1HBUjvDg+JmJTTEFofnuPPVoAeXJ9+EFJcGlq0+iVENHTs1cXyBL0HGoOm+CcBdBpOhd6J9W7GpLnuLzAvZyepuNw+rgGEKSB79elOOYYH9bmD3noZLY20FTVQEtmFye3OJd9JPhnMfa3ub9rZSEemXs6o000E6pvTzC0tj/OCr6fOzhWoQzgV1Ubf+Xl0GbKulGgei0WhPOw46R8nPjCa8Hcbds+t1U8kvu1Vlfk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b87e956-c552-4312-d6be-08d7250fa2f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 01:42:18.3318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F63FI09Ne1LiuvNJ/MAdzxBa4naQ1Nt0yEMnKijpDCX1friPSVRV3fSlnNQ2dZrkY05J1DWj0QOgo/ibqOl+/jQbNOlgoV6gSK+7nNXuScExIsZ9Z/vCEtjW+BWNRaHo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2477
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iaW4sDQoNCj4gRnJvbTogUm9iaW4gTXVycGh5LCBTZW50OiBNb25kYXksIEF1Z3VzdCAx
OSwgMjAxOSA5OjU1IFBNDQo+IA0KPiBPbiAyNi8wNy8yMDE5IDA5OjMxLCBZb3NoaWhpcm8gU2hp
bW9kYSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgZG1hX21hcF9vcHMgb2YgZ2V0
X21lcmdlX2JvdW5kYXJ5KCkgdG8NCj4gPiBleHBvc2UgdGhlIERNQSBtZXJnZSBib3VuZGFyeSBp
ZiB0aGUgZG9tYWluIHR5cGUgaXMgSU9NTVVfRE9NQUlOX0RNQS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogU2ltb24gSG9ybWFuIDxob3JtcytyZW5lc2FzQHZlcmdlLm5l
dC5hdT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMgfCAxMSArKysr
KysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2RtYS1pb21tdS5jIGIvZHJpdmVycy9pb21tdS9k
bWEtaW9tbXUuYw0KPiA+IGluZGV4IGE3ZjljM2UuLjI5OTJjZTQgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvZG1hLWlv
bW11LmMNCj4gPiBAQCAtMTA4NSw2ICsxMDg1LDE2IEBAIHN0YXRpYyBpbnQgaW9tbXVfZG1hX2dl
dF9zZ3RhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNnX3RhYmxlICpzZ3QsDQo+ID4g
ICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBp
b21tdV9kbWFfZ2V0X21lcmdlX2JvdW5kYXJ5KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0K
PiA+ICsJc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluID0gaW9tbXVfZ2V0X2RtYV9kb21haW4o
ZGV2KTsNCj4gPiArDQo+ID4gKwlpZiAoZG9tYWluLT50eXBlICE9IElPTU1VX0RPTUFJTl9ETUEp
DQo+IA0KPiBEaWQgeW91IGFjdHVhbGx5IG5lZWQgdGhpcyBjaGVjaz8gSW4gcHJpbmNpcGxlLCBp
ZiB0aGUgZGVmYXVsdCBkb21haW4gaXMNCj4gbm90IG9mIHR5cGUgSU9NTVVfRE9NQUlOX0RNQSB0
aGVuIHRoZSBkZXZpY2Ugc2hvdWxkIGJlIGFzc2lnbmVkDQo+IGRtYV9kaXJlY3Rfb3BzIHJhdGhl
ciB0aGFuIGlvbW11X2RtYV9vcHMsIHRodXMgaXQgc2hvdWxkbid0IGJlIHBvc3NpYmxlDQo+IHRv
IGdldCBoZXJlLiBJZiB5b3UgZGlkIG1hbmFnZSB0byBoaXQgYSBjYXNlIHdoZXJlIHRoZSBkb21h
aW4gdHlwZQ0KPiBkaWRuJ3QgbWF0Y2ggdGhlIG9wcyBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0
byBmaWd1cmUgb3V0IGhvdy4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyEgWW91J3JlIGNv
cnJlY3QuIFRoZSBjdXJyZW50IGRtYS1pb21tdS5jIHNldHMNCnRoZSBpb21tdV9kbWFfb3BzIHRv
IHRoZSBkZXZpY2UgZG1hX29wcyBvbmx5IHdoZW4gdGhlIHR5cGUgaXMgSU9NTVVfRE9NQUlOX0RN
QQ0KbGlrZSBiZWxvdzoNCi0tLQ0KCWlmIChkb21haW4tPnR5cGUgPT0gSU9NTVVfRE9NQUlOX0RN
QSkgew0KCQlpZiAoaW9tbXVfZG1hX2luaXRfZG9tYWluKGRvbWFpbiwgZG1hX2Jhc2UsIHNpemUs
IGRldikpDQoJCQlnb3RvIG91dF9lcnI7DQoJCWRldi0+ZG1hX29wcyA9ICZpb21tdV9kbWFfb3Bz
Ow0KCX0NCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMjbjExMTgNCi0t
LQ0KDQpTbywgSSdsbCByZW1vdmUgdGhpcyBjaGVjay4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGlo
aXJvIFNoaW1vZGENCg0KPiBSb2Jpbi4NCj4gDQo+ID4gKwkJcmV0dXJuIDA7CS8qIGNhbid0IG1l
cmdlICovDQo+ID4gKw0KPiA+ICsJcmV0dXJuICgxVUwgPDwgX19mZnMoZG9tYWluLT5wZ3NpemVf
Yml0bWFwKSkgLSAxOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
bWFfbWFwX29wcyBpb21tdV9kbWFfb3BzID0gew0KPiA+ICAgCS5hbGxvYwkJCT0gaW9tbXVfZG1h
X2FsbG9jLA0KPiA+ICAgCS5mcmVlCQkJPSBpb21tdV9kbWFfZnJlZSwNCj4gPiBAQCAtMTEwMCw2
ICsxMTEwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkbWFfbWFwX29wcyBpb21tdV9kbWFfb3Bz
ID0gew0KPiA+ICAgCS5zeW5jX3NnX2Zvcl9kZXZpY2UJPSBpb21tdV9kbWFfc3luY19zZ19mb3Jf
ZGV2aWNlLA0KPiA+ICAgCS5tYXBfcmVzb3VyY2UJCT0gaW9tbXVfZG1hX21hcF9yZXNvdXJjZSwN
Cj4gPiAgIAkudW5tYXBfcmVzb3VyY2UJCT0gaW9tbXVfZG1hX3VubWFwX3Jlc291cmNlLA0KPiA+
ICsJLmdldF9tZXJnZV9ib3VuZGFyeQk9IGlvbW11X2RtYV9nZXRfbWVyZ2VfYm91bmRhcnksDQo+
ID4gICB9Ow0KPiA+DQo+ID4gICAvKg0KPiA+DQo=
