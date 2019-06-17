Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10FCF47A0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 08:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfFQG3g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 02:29:36 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:62293
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725468AbfFQG3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 02:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vko7yAWz5RpBME2huowP5ti6qs9L1iHfX7uWHTycylI=;
 b=sygBfvZcPBunr5s1KfsSBWBiuwdoV3v/nUxmH8Dqh3WAhyN2guPrC7wKAwZ6kBflafYRhPbc7NJg4R4UI4z4HpTM540d/IvVfdxHWraA6cEqRrD+tg698zBAUFmJ3WHFam25eTwDaWY0ObrPkoUFfGtkeJpq7LqtYJ8ntFsuM3U=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3253.jpnprd01.prod.outlook.com (52.134.251.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Mon, 17 Jun 2019 06:29:31 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 06:29:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Robin Murphy <robin.murphy@arm.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "hch@lst.de" <hch@lst.de>, "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Subject: RE: [RFC PATCH v6 3/5] block: add a helper function to merge the
 segments by an IOMMU
Thread-Topic: [RFC PATCH v6 3/5] block: add a helper function to merge the
 segments by an IOMMU
Thread-Index: AQHVIdGm9DzU/q+TZ0eYoDEn/dmDGqaa6rgAgAR7xQA=
Date:   Mon, 17 Jun 2019 06:29:31 +0000
Message-ID: <OSBPR01MB3590A1AA199894E8220777EFD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <039d7388-ed24-c7e7-dd6a-656c719a5ed9@arm.com>
In-Reply-To: <039d7388-ed24-c7e7-dd6a-656c719a5ed9@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57dcdba1-60e8-46af-ac83-08d6f2ed280f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3253;
x-ms-traffictypediagnostic: OSBPR01MB3253:
x-microsoft-antispam-prvs: <OSBPR01MB325398BE878B761E8D1CFBFED8EB0@OSBPR01MB3253.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(136003)(39860400002)(366004)(376002)(396003)(199004)(189003)(11346002)(229853002)(53546011)(6436002)(66946007)(66556008)(14454004)(99286004)(8936002)(7696005)(68736007)(76176011)(7416002)(33656002)(55016002)(64756008)(8676002)(102836004)(6506007)(9686003)(66476007)(74316002)(7736002)(52536014)(81156014)(66446008)(6246003)(486006)(305945005)(2906002)(478600001)(5660300002)(73956011)(53936002)(26005)(4326008)(54906003)(186003)(25786009)(316002)(81166006)(14444005)(86362001)(71200400001)(256004)(3846002)(6116002)(66066001)(476003)(71190400001)(76116006)(446003)(6916009)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3253;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ookrFj0YWkEdiesS1geCt9LmuXlc7koRNT9eyE3J3QY7PYbN4vLo5WX6+nxOuZBNRU43CyCk2+LT/Yr4p+FMmApcyUj0Nm4KtJd+InyBY/3pQ7QZiknmI0zfcBx3E80kluFqwCyn78qTfBaFGTRxudIZ42fIYsJ/Qznt70tWTnVz8t5xh9jhfC3+3cm3fR57hEkUUQdoaEQwEv4AqbGRvGIyzdFaSGG85K3MN2QFNK0+iJCKGz2ZxNTXgH7MWLYy5PZ/KD9V6/qqd8NU/gbXzf0xj99ARwKMR9umAa66JWM+yrBcHDenkpYWyFxa2dm3QJ8JyhoeGaKJ9/0b3Qjm+XYzcvTcdiAVEb+1lI3uCOuavdO7BL+4EjlcgnkAmeJ9BFKVA/6nH9I4HSMioM1I5ytI8ecVwTSV2vGffiKxGeI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dcdba1-60e8-46af-ac83-08d6f2ed280f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 06:29:31.1131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3253
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iaW4sDQoNCj4gRnJvbTogUm9iaW4gTXVycGh5LCBTZW50OiBGcmlkYXksIEp1bmUgMTQs
IDIwMTkgNjo1NSBQTQ0KPiANCj4gT24gMTMvMDYvMjAxOSAxMToyMCwgWW9zaGloaXJvIFNoaW1v
ZGEgd3JvdGU6DQo8c25pcD4NCj4gPiArYm9vbCBibGtfcXVldWVfY2FuX3VzZV9pb21tdV9tZXJn
aW5nKHN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxLA0KPiA+ICsJCQkJICAgICBzdHJ1Y3QgZGV2aWNl
ICpkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbjsNCj4gPiAr
DQo+ID4gKwkvKg0KPiA+ICsJICogSWYgdGhlIGRldmljZSBETUEgaXMgdHJhbnNsYXRlZCBieSBh
biBJT01NVSwgd2UgY2FuIGFzc3VtZQ0KPiA+ICsJICogdGhlIGRldmljZSBjYW4gbWVyZ2UgdGhl
IHNlZ21lbnRzLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoIWRldmljZV9pb21tdV9tYXBwZWQoZGV2
KSkNCj4gDQo+IENhcmVmdWwgaGVyZSAtIEkgdGhpbmsgdGhpcyB2YWxpZGF0ZXMgdGhlIGNvbW1l
bnQgSSBtYWRlIHdoZW4gdGhpcw0KPiBmdW5jdGlvbiB3YXMgaW50cm9kdWNlZCwgaW4gdGhhdCB0
aGF0IG5hbWUgZG9lc24ndCBuZWNlc2FyaWx5IG1lYW4gd2hhdA0KPiBpdCBzb3VuZHMgbGlrZSBp
dCBtaWdodCBtZWFuIC0gImlvbW11X21hcHBlZCIgd2FzIGFzIGNsb3NlIGFzIHdlIG1hbmFnZWQN
Cj4gdG8gZ2V0IHRvIGEgY29udmVuaWVudCBzaG9ydGhhbmQgZm9yICJwZXJmb3JtcyBETUEgdGhy
b3VnaCBhbg0KPiBJT01NVS1BUEktZW5hYmxlZCBJT01NVSIuIFNwZWNpZmljYWxseSwgaXQgZG9l
cyBub3QgaW1wbHkgdGhhdA0KPiB0cmFuc2xhdGlvbiBpcyAqY3VycmVudGx5KiBhY3RpdmU7IGlm
IHlvdSBib290IHdpdGggImlvbW11PXB0IiBvcg0KPiBlcXVpdmFsZW50IHRoaXMgd2lsbCBzdGls
bCByZXR1cm4gdHJ1ZSBldmVuIHRob3VnaCB0aGUgZGV2aWNlIHdpbGwgYmUNCj4gdXNpbmcgZGly
ZWN0L1NXSU9UTEIgRE1BIG9wcyB3aXRob3V0IGFueSBJT01NVSB0cmFuc2xhdGlvbi4NCg0KVGhh
bmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLiBJIHVuZGVyc3Rvb2QgdGhlIG1lYW4gb2YgImlvbW11
X21hcHBlZCIgYW5kDQp0aGlzIHBhdGNoJ3MgY29uZGl0aW9uIGNhdXNlcyBhIHByb2JsZW0gb24g
aW9tbXU9cHQuDQpTbywgSSdsbCBhZGQgYW5kIGFkZGl0aW9uYWwgY29uZGl0aW9uIGxpa2UNCiJk
b21haW4tPnR5cGUgPT0gSU9NTVVfRE9NQUlOX0RNQSIgdG8gY2hlY2sgd2hldGhlciB0aGUgdHJh
bnNsYXRpb24gaXMNCmN1cnJlbnRseSBhY3RpdmUgb24gdGhlIGRvbWFpbiBvciBub3QuDQoNCkJl
c3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
