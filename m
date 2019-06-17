Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFC74798A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 06:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfFQEyc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 00:54:32 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:52896
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725863AbfFQEyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 00:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBs6DjSniTBp0wubAe36CjoKCpovrbC9VOMS8YGkyzM=;
 b=U0CACPbYH1BjpYuWBqCSbQuUTRbbyb1xyeW+bhbU1pm61EJ6OuNTNDCql0PI6pyX1qYo1DFZzuCqiTUYETr8c+QukUUBJ3kiVFV1mzOeBGVSN0EuMIUj6CZeiVuqZ55/iUFHNRwac6waYbxvI3xLW3n4dk7EGslYpVqPiP6wx/Y=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB1542.jpnprd01.prod.outlook.com (52.134.225.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Mon, 17 Jun 2019 04:54:28 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 04:54:27 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
CC:     Joerg Roedel <joro@8bytes.org>, Jens Axboe <axboe@kernel.dk>,
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
Thread-Index: AQHVIdGm2I9J5403AkGhlbCnRkkrDqaaC4IAgACzcgCAAAKLAIAEhNUQ
Date:   Mon, 17 Jun 2019 04:54:27 +0000
Message-ID: <OSBPR01MB3590D4EF069F4554DA5D7ABBD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
 <20190614071800.GB8420@lst.de>
 <CAMuHMdXm5RtDUL5Wkyd6aJihu9nykYOhRf7vN6hOtB-OO8CTQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXm5RtDUL5Wkyd6aJihu9nykYOhRf7vN6hOtB-OO8CTQQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 518661ca-7bf1-4cf1-a947-08d6f2dfe09d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB1542;
x-ms-traffictypediagnostic: OSBPR01MB1542:
x-microsoft-antispam-prvs: <OSBPR01MB154295F96B86314E54BB2038D8EB0@OSBPR01MB1542.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(376002)(346002)(396003)(39860400002)(189003)(199004)(316002)(7696005)(6506007)(64756008)(2906002)(86362001)(102836004)(66556008)(14454004)(66066001)(55016002)(7416002)(53936002)(6246003)(53546011)(6116002)(3846002)(71200400001)(476003)(71190400001)(99286004)(9686003)(76176011)(486006)(73956011)(54906003)(76116006)(66946007)(186003)(68736007)(446003)(4326008)(478600001)(66446008)(26005)(52536014)(229853002)(305945005)(110136005)(7736002)(6436002)(11346002)(8936002)(5660300002)(33656002)(74316002)(256004)(81166006)(81156014)(8676002)(66476007)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1542;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XBC3F6p3NDp2aUZeWfuLLbdTBV3VqqNJAH/C21adlCSzt1s1kIJfPd7Q1vc+WCY5bno/rlZj2v/YI5qa16YMZrhyWjezi+ONSO31Ejsftnwh73IWYzGaZYYXNmSYgNsrVfbSaYpyJjO+VvJuioBBB//Q/ZuaZP3+k6PWhD8wZNrEFCJBkgs81EXrQHVSpVKgkrVl4RSabLREwuhu4TsdRJTuUA6uyR+3/SMShyHihXOUQif3nTKPPO75z+aur7GoL//U2YdwQhaxnqm25TaK9+RIqieT5E5V//ACZrDS0ebjibpSxM1dt/ykXJZY/8f8WZaUixbXegpGt0gzzcb+3JSW+xVKvPpmeeOj9/wuuC/PibIuHY+kUJbHqvr79pSVZ20yw8vkAG4YA3NeeMnYWm86PaT+yafIPof6QCtRH6I=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518661ca-7bf1-4cf1-a947-08d6f2dfe09d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 04:54:27.8921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1542
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsIENocmlzdG9waCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzIQ0KDQo+
IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5LCBKdW5lIDE0LCAyMDE5IDQ6
MjcgUE0NCj4gDQo+IEhpIENocmlzdG9waCwNCj4gDQo+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0
IDk6MTggQU0gQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+ID4gT24gVGh1LCBKdW4gMTMsIDIw
MTkgYXQgMTA6MzU6NDRQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4g
SSdtIGFsd2F5cyB0cmlnZ2VyZWQgYnkgdGhlIHVzZSBvZiBtaW5fdCgpIGFuZCBvdGhlciBjYXN0
czoNCj4gPiA+IG1tYy0+bWF4X2Jsa19zaXplIGFuZCBtbWMtPm1heF9ibGtfY291bnQgYXJlIGJv
dGggdW5zaWduZWQgaW50Lg0KPiA+ID4gZG1hX21heF9tYXBwaW5nX3NpemUoKSByZXR1cm5zIHNp
emVfdCwgd2hpY2ggY2FuIGJlIDY0LWJpdC4NCj4gPiA+DQo+ID4gPiAgMSkgQ2FuIHRoZSBtdWx0
aXBsaWNhdGlvbiBvdmVyZmxvdz8NCj4gPiA+ICAgICBQcm9iYWJseSBub3QsIGFzIHBlciBjb21t
aXQgMmE1NWMxZWFjNzg4MjIzMiAoIm1tYzogcmVuZXNhc19zZGhpOg0KPiA+ID4gICAgIHByZXZl
bnQgb3ZlcmZsb3cgZm9yIG1heF9yZXFfc2l6ZSIpLCBidXQgSSB0aG91Z2h0IEknZCBiZXR0ZXIg
YXNrLg0KDQpHZWVydC1zYW46DQoNCkkgYWdyZWUuDQoNCj4gPiA+ICAyKSBJbiB0aGVvcnksIGRt
YV9tYXhfbWFwcGluZ19zaXplKCkgY2FuIHJldHVybiBhIG51bWJlciB0aGF0IGRvZXNuJ3QNCj4g
PiA+ICAgICBmaXQgaW4gMzItYml0LCBhbmQgd2lsbCBiZSB0cnVuY2F0ZWQgKHRvIGUuZy4gMCks
IGxlYWRpbmcgdG8gbWF4X3JlcV9zaXplDQo+ID4gPiAgICAgaXMgemVybz8NCg0KR2VlcnQtc2Fu
Og0KDQpJIGFncmVlLiBJZiBkbWFfbWF4X21hcHBpbmdfc2l6ZSgpIHJldHVybiAweDFfMDAwMF8w
MDAwLCBpdCB3aWxsIGJlIHRydW5jYXRlZCB0byAwDQphbmQgdGhlbiBtYXhfcmVxX3NpemUgaXMg
c2V0IHRvIHplcm8uIEl0IGlzIGEgcHJvYmxlbS4gQWxzbywgdGhlIHNlY29uZCBhcmd1bWVudA0K
Im1tYy0+bWF4X2Jsa19zaXplICogbW1jLT5tYXhfYmxrX2NvdW50IiB3aWxsIG5vdCBiZSBvdmVy
ZmxvdyBhbmQgdGhlbiB0aGUgdmFsdWUgaXMNCjB4ZmZmZl9mZmZmIG9yIGxlc3MuIFNvLCBJIGFs
c28gdGhpbmsgdGhpcyBzaG91bGQgdXNlIHNpemVfdCBpbnN0ZWFkIG9mIHVuc2lnbmVkIGludC4N
Cg0KPiA+IFRoaXMgcmVhbGx5IHNob3VsZCB1c2UgYSBtaW5fdCBvbiBzaXplX3QuICBPdGhlcndp
c2UgdGhlIHBhdGNoIGxvb2tzDQo+ID4gZmluZToNCj4gDQo+IEZvbGxvd2VkIGJ5IGFub3RoZXIg
bWluKCkgdG8gbWFrZSBpdCBmaXQgaW4gbW1jLT5tYXhfcmVxX3NpemUsIHdoaWNoIGlzDQo+IHVu
c2lnbmVkIGludC4NCg0KR2VlcnQtc2FuOg0KDQpJJ20gYWZyYWlkLCBidXQgSSBjYW5ub3QgdW5k
ZXJzdGFuZCB0aGlzIG1lYW5zLg0KSXMgdGhpcyBwYXRjaCBpcyBwb3NzaWJsZSB0byBiZSB1cHN0
cmVhbT8gT3IsIGRvIHlvdSBoYXZlIGFueSBjb25jZXJuPw0KDQoNCkJlc3QgcmVnYXJkcywNCllv
c2hpaGlybyBTaGltb2RhDQoNCg==
