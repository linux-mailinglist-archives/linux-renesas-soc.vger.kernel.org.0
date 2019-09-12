Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6CDDB0752
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 05:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbfILDvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Sep 2019 23:51:43 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:24407
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726157AbfILDvm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Sep 2019 23:51:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIXV+KifC3dKS66tWv/pp/BtwyRvubf/fdWl5oWbi7D0QrL1zH9fLdwbUGqzC3KIYSqhcBfCpDOUPNHu2V39o497m77UthVSVZmA0FNPZ9dgbrnEYBO9XE1moU160wPok2xS4Pg00efooBhGWTAo/2TRsP+s/TVsWzOQc0Jaxh7sqYWBAjZrHrbOjI9vnrdqEF9hdyCgA7W5kaOoyzlC5pS5InRf1mMMC9ZVzPMEc+JEdVJNvnWuFRRIki9N1bIfX/77e0lnnofKst0pJWnhqkTLS8vupeSzVLi+Y2y3EBWF3W2h64Y4dMCTMis08ARBD/HiZtUIrIBrp6maZSyRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quALNKZjqGcEeK/uG7FV3diK4AbmmzqpaqoPG+mJQwg=;
 b=Y8xLE6pIHufv0sRQsR+Q/OM2vt/VIR0JaDyw/Hmtr6Tn8Cu+4by6DFu6v8r4AevDxFqulolPymRolVucYKceE0qZgY+wE7cjAgwepHafabhZ6pV5h7+V11/IMGM7ibL6Rvr3Rdk2Z+JffspQhMUhfe1nrHi85FrGSQAUQqG+21MbF0+k+gTwZsv6Muzhg8dbfsPfYDQitkALvhQSTeB9wkl/7/fottLBLjHTMNhSErrtAV6f30dXdW1KHE4u9Yjkih70uxO/VYin+NVajRIChMV/YYyh+4YKEDUDO6CX2rUs3YIypdQ5MaQ2gtb4BAgke/zfh7YzpcJPyZPR5fuZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quALNKZjqGcEeK/uG7FV3diK4AbmmzqpaqoPG+mJQwg=;
 b=RkoWhVVaFofeBuNmuVqHHh425q8DOmLjnHmAngC2G1Gj/P6FtD/9VsoisQlfTR6sg0b93c0ZiU4eUgWLAiRHAw5Nl5tLVtF0Y+ZKhRyVbpkYdKijs9KCsApZyi8kbKUmZnSiG/83PWdO1qgPoDNd0eSfkzZ3aKuEB/V8vEiErHs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYASPR01MB2.jpnprd01.prod.outlook.com (52.133.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 03:51:39 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.022; Thu, 12 Sep 2019
 03:51:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Christoph Hellwig <hch@lst.de>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Thierry Reding <treding@nvidia.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] mmc: queue: Fix bigger segments usage
Thread-Topic: [PATCH 0/2] mmc: queue: Fix bigger segments usage
Thread-Index: AQHVZ4yjpqU49w4Zy02sZKt0PSCCrKcmZ7SAgAEAStA=
Date:   Thu, 12 Sep 2019 03:51:38 +0000
Message-ID: <TYAPR01MB45443DFFA8FE57AAC331194FD8B00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568088179-16865-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAPDyKFo0kQvBUys6cFwwZ5xF4koWh3DsFAN2x+NKXfz6O4AD3w@mail.gmail.com>
In-Reply-To: <CAPDyKFo0kQvBUys6cFwwZ5xF4koWh3DsFAN2x+NKXfz6O4AD3w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 564b3d07-f8b6-41fb-729f-08d73734841a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYASPR01MB2;
x-ms-traffictypediagnostic: TYASPR01MB2:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <TYASPR01MB2298D29815B159573093CD8B00@TYASPR01MB2.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(51234002)(199004)(189003)(86362001)(76176011)(476003)(305945005)(5660300002)(7736002)(486006)(25786009)(11346002)(446003)(74316002)(71190400001)(186003)(71200400001)(52536014)(66066001)(256004)(14444005)(102836004)(26005)(8676002)(81166006)(6506007)(8936002)(76116006)(81156014)(4326008)(66946007)(66446008)(64756008)(66556008)(66476007)(7696005)(2906002)(33656002)(6306002)(9686003)(55016002)(54906003)(99286004)(229853002)(316002)(6436002)(6246003)(110136005)(478600001)(14454004)(966005)(6116002)(53936002)(3846002)(135533001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYASPR01MB2;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0U/0r6xCDpgKVzJZpJMihB6zNl19Psll14b4fKV2b14Cm3Nl73oOe/k5oqT+JE/fdZnBX2rcGqv+Im2qqfBcRJ44e8Sj40b+9V6O+fCBOBf/t9zBMIIkI6eSL9A/yepW+qpGNlNcw9XYEpEb5X95Op3uR3XV5Z3ow5mljMI5rVD5NlF4xrrkO7ew/D6vDHWY8m9QVEhgaCs2gAFGkLBdAEX4l4k6ZIQOuPzW8qP79jcP08xhp5HHdC/F+9Hi+NeWmbSotlZIDeuyTQoai3RVHD8MsFwUtSSZvVmghrDvJYyoBTbtyh/YB1Z0LGiHEgQcs/zC48jc4m00hGrE8vZictXrnDsJ772VdoBBdeSGQha0e00wm2h64KkQiYrMQGqibUnSeHj1zAsEbpZbw1Z7dB7E2jof/mKgyyCIzNB9kfQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564b3d07-f8b6-41fb-729f-08d73734841a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 03:51:38.7848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCRMm15aDndsZAx0egZ6/yE/LpUauuaEAs3+r7Z5CB4uuV3WRYRHUxlSdSzZxSF3Rae6VwRGCeV18qazET4W0DAXHLTFduWz7nl9RRF0FpodU5+1KsNtcMf2L81jwu/R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYASPR01MB2
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxmLA0KDQo+IEZyb206IFVsZiBIYW5zc29uLCBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJl
ciAxMSwgMjAxOSA5OjIxIFBNDQo+IA0KPiArIENocmlzdG9waA0KPiANCj4gT24gVHVlLCAxMCBT
ZXAgMjAxOSBhdCAwNjowMywgWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2Rh
LnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGJh
c2VkIG9uIHRoZSBsaW51eC1uZXh0IC8gbmV4dC0yMDE5MDkwNCB0YWcuDQo+ID4gVGhpZXJyeSBy
ZXBvcnRlZCBhbiBpc3N1ZSB3aGljaCBjYXVzZWQgdGhlIFNESENJIGVudmlyb25tZW50IFsxXQ0K
PiA+IHNvIHRoYXQgSSBtYWRlIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIHJlc29sdmUgdGhlIGlzc3Vl
Lg0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MTEzNzkwMy8NCj4gPg0KPiA+IEFsc28sIHRoaXMgcGF0Y2ggYWRkcyB0aGUgZmxhZyB0byBlbmFi
bGUgdGhlIGZlYXR1cmUgb24gbXkNCj4gPiBlbnZpcm9ubWVudC4NCj4gPg0KPiA+IFlvc2hpaGly
byBTaGltb2RhICgyKToNCj4gPiAgIG1tYzogcXVldWU6IEZpeCBiaWdnZXIgc2VnbWVudHMgdXNh
Z2UNCj4gPiAgIG1tYzogcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWM6IEFkZCBNTUNfQ0FQMl9N
RVJHRV9DQVBBQkxFDQo+ID4NCj4gPiAgZHJpdmVycy9tbWMvY29yZS9xdWV1ZS5jICAgICAgICAg
ICAgICAgICAgICAgIHwgOCArKysrKysrLQ0KPiA+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNf
c2RoaV9pbnRlcm5hbF9kbWFjLmMgfCAyICstDQo+ID4gIGluY2x1ZGUvbGludXgvbW1jL2hvc3Qu
aCAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IC0tDQo+ID4gMi43LjQNCj4gPg0K
PiANCj4gSSBjYW4ndCBhcHBseSB0aGlzIHRvIG15IHRyZWUsIGFzIGl0IGRlcGVuZHMgb24gdGhl
IGVhcmxpZXIgc2VyaWVzDQo+IHdoaWNoIGhhcyBiZWVuIHF1ZXVlZCBieSBDaHJpc3RvcGguDQo+
IA0KPiBUaGF0IHNhaWQsIHlvdSBjYW4gYWRkIG15IGFjayBmb3IgYm90aCBvZiB0aGUgcGF0Y2hl
cyBhbmQgeW91IHByb2JhYmx5DQo+IGFsc28gbmVlZCB0byByZXBvc3QgdGhpcyB0byBDaHJpc3Rv
cGguDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgYW5kIHlvdXIgYWNrISBBcyB5b3Ugc2Fp
ZCwgSSBzaG91bGQgaGF2ZSBpbmNsdWRlZA0KQ2hyaXN0b3BoJ3MgZW1haWwgYWNjb3VudCB3aGVu
IEkgaGF2ZSBzdWJtaXR0ZWQgdGhpcyBwYXRjaCBzZXJpZXMuLi4NCg0KQ2hyaXN0b3BoLCBJJ2xs
IHJlcG9zdCB0aGlzIHBhdGNoIHNlcmllcyB0byB5b3UuIFRoaXMgaXMgYSAidGVtcG9yYXJ5IGJh
bmQtYWlkIg0KcGF0Y2ggc2VyaWVzIGFzIHlvdSBzYWlkIG9uIHRoZSBvdGhlciBlbWFpbCB0aHJl
YWQgWzFdIDopDQoNCkknbSBub3Qgc3VyZSB3aGV0aGVyIG15IHN1Z2dlc3RlZCBzb2x1dGlvbiBm
b3Igc2RoY2kgWzJdIGlzIHN1Y2NlZWRlZCBvciBub3QsIGJ1dCwNCmFueXdheSBJIGJlbGlldmUg
d2UgY2FuIGhhdmUgYm90aCBzb2x1dGlvbnMgKEkgbWVhbnMgdGhpcyBwYXRjaCBzZXJpZXMgYW5k
IHRoZSBbMl0pDQppZiBuZWVkZWQuDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3BhdGNoLzExMTM3OTAzLyMyMjg3NjMzOQ0KWzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTExMzc5MDMvIzIyODc1ODg1DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCj4gS2luZCByZWdhcmRzDQo+IFVmZmUNCg0K
