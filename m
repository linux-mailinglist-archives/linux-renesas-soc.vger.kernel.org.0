Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28BF147A40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 08:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfFQGye (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 02:54:34 -0400
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:9248
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbfFQGye (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 02:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enhWT74/cCvJF0nC6N6Nkz9H+M7tE6bXm/KQF0zE/7I=;
 b=n/Xt2/PtgIDInZNQITAgCkcX26JHzjc0hkzuq+Fx9hSm2SSA0k8IWt6njnrt8WBV7rNRCgCP+kg1dQpKfcJg46igRqDmxnmeX2ugNwtv1buFu8RuJhqnywVhKn8HWWKlJYIkwMrHPPVts+OnETQBkgWdcl2jGjo9lmXqfDnnJoQ=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB2134.jpnprd01.prod.outlook.com (52.134.243.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 06:54:31 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 06:54:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
        Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
Thread-Topic: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
Thread-Index: AQHVIdGm2I9J5403AkGhlbCnRkkrDqaaC4IAgACzcgCAAAKLAIAEhNUQgAAgXgCAAAgYEA==
Date:   Mon, 17 Jun 2019 06:54:31 +0000
Message-ID: <OSBPR01MB3590218F1CA8CEE5DCB53065D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
 <20190614071800.GB8420@lst.de>
 <CAMuHMdXm5RtDUL5Wkyd6aJihu9nykYOhRf7vN6hOtB-OO8CTQQ@mail.gmail.com>
 <OSBPR01MB3590D4EF069F4554DA5D7ABBD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <CAMuHMdWPUZGFWeKzPK=zkwc5h2SD+aW6ULb8C2rDJSmTWNXjeA@mail.gmail.com>
In-Reply-To: <CAMuHMdWPUZGFWeKzPK=zkwc5h2SD+aW6ULb8C2rDJSmTWNXjeA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c698aa4-6fec-4fcb-e07b-08d6f2f0a61f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2134;
x-ms-traffictypediagnostic: OSBPR01MB2134:
x-microsoft-antispam-prvs: <OSBPR01MB213416C684FD4E44E21ECFDED8EB0@OSBPR01MB2134.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(396003)(376002)(346002)(366004)(39860400002)(136003)(189003)(199004)(2906002)(66066001)(305945005)(7736002)(5660300002)(74316002)(4326008)(6436002)(229853002)(52536014)(6916009)(54906003)(71200400001)(71190400001)(476003)(316002)(486006)(68736007)(76176011)(66446008)(64756008)(7416002)(11346002)(81166006)(81156014)(8936002)(446003)(256004)(6506007)(53546011)(478600001)(26005)(7696005)(6116002)(99286004)(76116006)(66946007)(186003)(14454004)(66476007)(66556008)(8676002)(6246003)(102836004)(86362001)(33656002)(3846002)(55016002)(53936002)(73956011)(9686003)(25786009)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2134;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ducfu4Ew1x2Y+uk6LN7poEQhg0GmkXwPQBepJCt4croP5CVp9bsbOLBH+5HlTYzo7WJ334hoXu1e/MicmB/p6XZad0PEmttKxNnwtYMAPWQvy/l94GzsTCAcwc9chQfK5TpDWZhS3uRetWCHRa86Vj2t5a8IppxsQvaHkjqADM3EK6Kzu08iXHw/UABsT+PCnODJe9ycoYyt6OW7bgVvkiSexd+fmmjR6QGWsKaiwCsfbD+p6uL1xlCF2d74zVM6pqcJSvhCgRYr0uqUdJHCx1sxZ/k9sLW5sKEPo/60rYbWjxT9t0iF3yv3KpFXlxaaV3RdH2DoR0mjODIXcw9/smaD5/FIo9ZEr3kU6L4UgHyV47Zfxkwb+qY8skGbaCpFf+a1dpavUu2ZrFa/BNML+7vjtCFJSusRNfR3H+oSkk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c698aa4-6fec-4fcb-e07b-08d6f2f0a61f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 06:54:31.1514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2134
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBKdW5lIDE3LCAyMDE5IDM6MjMgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24g
TW9uLCBKdW4gMTcsIDIwMTkgYXQgNjo1NCBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuLCBTZW50OiBGcmlkYXksIEp1bmUgMTQsIDIwMTkgNDoyNyBQTQ0KPiA+ID4gT24g
RnJpLCBKdW4gMTQsIDIwMTkgYXQgOToxOCBBTSBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4g
PiA+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTA6MzU6NDRQTSArMDIwMCwgR2VlcnQgVXl0
dGVyaG9ldmVuIHdyb3RlOg0KPHNuaXA+DQo+ID4gPiA+IFRoaXMgcmVhbGx5IHNob3VsZCB1c2Ug
YSBtaW5fdCBvbiBzaXplX3QuICBPdGhlcndpc2UgdGhlIHBhdGNoIGxvb2tzDQo+ID4gPiA+IGZp
bmU6DQo+ID4gPg0KPiA+ID4gRm9sbG93ZWQgYnkgYW5vdGhlciBtaW4oKSB0byBtYWtlIGl0IGZp
dCBpbiBtbWMtPm1heF9yZXFfc2l6ZSwgd2hpY2ggaXMNCj4gPiA+IHVuc2lnbmVkIGludC4NCj4g
Pg0KPiA+IEdlZXJ0LXNhbjoNCj4gPg0KPiA+IEknbSBhZnJhaWQsIGJ1dCBJIGNhbm5vdCB1bmRl
cnN0YW5kIHRoaXMgbWVhbnMuDQo+ID4gSXMgdGhpcyBwYXRjaCBpcyBwb3NzaWJsZSB0byBiZSB1
cHN0cmVhbT8gT3IsIGRvIHlvdSBoYXZlIGFueSBjb25jZXJuPw0KPiANCj4gUGxlYXNlIGRpc3Jl
Z2FyZCBteSBsYXN0IGNvbW1lbnQ6IGFzIHRoZSB2YWx1ZSBvZiAibW1jLT5tYXhfYmxrX3NpemUg
Kg0KPiBtbWMtPm1heF9ibGtfY291bnQiIGlzIGFsd2F5cyAweGZmZmZfZmZmZiBvciBsZXNzLCAi
bWluX3Qoc2l6ZV90LA0KPiBtbWMtPm1heF9ibGtfc2l6ZSAqIG1tYy0+bWF4X2Jsa19jb3VudCwg
ZG1hX21heF9tYXBwaW5nX3NpemUoJnBkZXYtPmRldikpIg0KPiB3aWxsIGFsd2F5cyBiZSAweGZm
ZmZfZmZmZiBvciBsZXNzLCB0b28sIHNvIHRoZXJlIGlzIG5vIGV4dHJhIHN0ZXAgbmVlZGVkDQo+
IHRvIG1ha2UgaXQgZml0IGluIG1tYy0+bWF4X3JlcV9zaXplLg0KDQpUaGFuayB5b3UgZm9yIHlv
dXIgcHJvbXB0IHJlcGx5ISBJIHVuZGVyc3Rvb2QgaXQuDQoNCj4gU29ycnkgZm9yIHRoZSBjb25m
dXNpb24uDQoNCk5vIHdvcnJpZXMuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2Rh
DQoNCg==
