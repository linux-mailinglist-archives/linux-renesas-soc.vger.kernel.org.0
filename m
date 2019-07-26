Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51B776019
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2019 09:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfGZHun (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jul 2019 03:50:43 -0400
Received: from mail-eopbgr1400108.outbound.protection.outlook.com ([40.107.140.108]:10944
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725864AbfGZHum (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jul 2019 03:50:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSeeCumDQhV/+7RnMUHIIpL381Tj2k7iCe/monnTyMiYJwQWJqesgY/OQjjQpfwbE9OIn8GdFddNLDW7QFvwlS3970lPP1crc3wcV41XUB28qiIXiGdTmaTSG62ZPZTzHRNHqNRAkc2cG6i78DA8yHUlszcoE9k5eZkzwORSvAwkzFOVzQ4fxlPxoCHEHSRDWVSI4GRPykthM/svLuJlm9hk+5EQ64BS5+I28aN+j5AIZI0SOcdul3Uf0maNhozMzQHSTKDMyn1QLXDQwUNaUfP7y4VvJcCYB2miqMBU1nguXFBS9qeswvMucL9bvS8q8cbc6ntxcywgxevb2pe0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmEgdroaOTz86SWu6O43uRZRoFVBJl1dOYYhCqKlmSA=;
 b=UBgZ3JEk5PFjjJVx1K9rmRk7zd9Zv4+iFJ4pvctWtjLAq9p3rAcqotZ7yTggwA3VJi57ANF3uOrjPKgcs5diEzzoo1fMXe++PwMfUZfAWsbPiQYwsRxDz0728J1ucYbucJA/s13HaRWuHr8X8ug2rXHklGQix6Lzr5lhoGlEbr3zJT2nsxayCJOadukGEmFlxG7OhEOlZgsfv33DmSHsRlOnWWlfRueOlmej+mnY29cKtjt9QxsZfO2z4Iq1I42iaTbe6Odd6lZrStJbeBQXqj0fq712uHREedporaYt2JfKAAfGhamUklrIknt2JdLqoBE1XM+unlWeeR8OLglXow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmEgdroaOTz86SWu6O43uRZRoFVBJl1dOYYhCqKlmSA=;
 b=GA2SaI7DhNNj9cnHqDLxTsYCab3YrH/pywzXlWtv+qvEwbCDfrMojB3ehL7s3rNmhpOhTjd2T37bbHK1BCcdqn39jRJ5mdZbHgPuoQEifQGy945zeXUXlzXYriY7w7JVltEAsdMoewOVXbtmkyXbu+jkRy6MgkW2DUCTXiOoxTQ=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB2447.jpnprd01.prod.outlook.com (20.177.105.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 26 Jul 2019 07:50:38 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9%5]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 07:50:38 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "hch@lst.de" <hch@lst.de>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v8 2/5] iommu/dma: Add a new dma_map_ops of
 get_merge_boundary()
Thread-Topic: [PATCH v8 2/5] iommu/dma: Add a new dma_map_ops of
 get_merge_boundary()
Thread-Index: AQHVQRdiJcAO4D9YH0CWT7gpS/OprKbX2+iAgASvQJA=
Date:   Fri, 26 Jul 2019 07:50:38 +0000
Message-ID: <TYAPR01MB45442AFA1D1417870A3C5D91D8C00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1563859608-19456-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <ae95cc2e-38b4-0ed9-744a-67f03f220a3f@cogentembedded.com>
In-Reply-To: <ae95cc2e-38b4-0ed9-744a-67f03f220a3f@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 004f881d-94fe-4f99-61af-08d7119df376
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2447;
x-ms-traffictypediagnostic: TYAPR01MB2447:
x-microsoft-antispam-prvs: <TYAPR01MB24478BAA8E9E46DF597EF3ABD8C00@TYAPR01MB2447.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(5660300002)(4326008)(229853002)(66066001)(26005)(7696005)(102836004)(99286004)(2906002)(33656002)(6246003)(11346002)(68736007)(6116002)(9686003)(256004)(76176011)(53936002)(86362001)(14454004)(478600001)(7416002)(8936002)(6506007)(25786009)(53546011)(54906003)(446003)(8676002)(2201001)(74316002)(7736002)(66556008)(71190400001)(81156014)(81166006)(66446008)(66476007)(76116006)(486006)(71200400001)(316002)(476003)(66946007)(64756008)(186003)(110136005)(6436002)(52536014)(2501003)(305945005)(55016002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2447;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6HayVG91R7AKG252nI90YWFkwVGB7a3tEdaDg4+h9GtiigZog+M4QA0dHIs/qvTxX6lalpYL/IEklVVV7If+jNpjcp51yEl045+2wL510U/q8O78Kjiw59sKUk94C3U+/+Lo52dwoyhgUxGEpWY9h1IIxOZxLCH2yv1R8y1wmWnzKyPDMcPcIPdmKmsJtDbgTG8FjpECsQRYwKKXQXln5vcI429QWlO4Mncq1pJ9JSf3SC/w+jnk/70CrWotZrgbvpvsppODI+oM/N0tKmB/aExcqfAPMr1OTbzZ5bie1A6CCrl2tdyF0pbTuQhSs7KW3Lu4DJIqyVj0A8tWx8Yt5ZcKDT2gnUlADMQx1jRs97YbQa/MD/tVe0GfZFaHygeO3ReT069zrp0JE2dvcgoPo2kTe9uqBNYNC3kC9FrpI5M=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004f881d-94fe-4f99-61af-08d7119df376
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 07:50:38.6285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2447
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8hDQoNCj4gRnJvbTogU2VyZ2VpIFNodHlseW92LCBTZW50OiBUdWVzZGF5LCBKdWx5IDIz
LCAyMDE5IDU6MTcgUE0NCj4gDQo+IEhlbGxvIQ0KPiANCj4gT24gMjMuMDcuMjAxOSA4OjI2LCBZ
b3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3IGRt
YV9tYXBfb3BzIG9mIGdldF9tZXJnZV9ib3VuZGFyeSgpIHRvDQo+ID4gZXhwb3NlIHRoZSBETUEg
bWVyZ2UgYm91bmRhcnkgaWYgdGhlIGRvbWFpbiB0eXBlIGlzIElPTU1VX0RPTUFJTl9ETUEuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1v
ZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2lvbW11L2RtYS1pb21t
dS5jIHwgMTEgKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYyBiL2Ry
aXZlcnMvaW9tbXUvZG1hLWlvbW11LmMNCj4gPiBpbmRleCBhN2Y5YzNlLi5mM2U1ZjJiIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMNCj4gPiArKysgYi9kcml2ZXJz
L2lvbW11L2RtYS1pb21tdS5jDQo+ID4gQEAgLTEwODUsNiArMTA4NSwxNiBAQCBzdGF0aWMgaW50
IGlvbW11X2RtYV9nZXRfc2d0YWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBzZ190YWJs
ZSAqc2d0LA0KPiA+ICAgCXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGljIHVu
c2lnbmVkIGxvbmcgaW9tbXVfZG1hX2dldF9tZXJnZV9ib3VuZGFyeShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiA9IGlvbW11X2dl
dF9kbWFfZG9tYWluKGRldik7DQo+ID4gKw0KPiA+ICsJaWYgKGRvbWFpbi0+dHlwZSAhPSBJT01N
VV9ET01BSU5fRE1BKQ0KPiA+ICsJCXJldHVybiAwOwkvKiBjYW4ndCBtZXJnZSAqLw0KPiA+ICsN
Cj4gPiArCXJldHVybiAoMSA8PCBfX2Zmcyhkb21haW4tPnBnc2l6ZV9iaXRtYXApKSAtIDE7DQo+
IA0KPiAgICAgTm90IDFVTD8NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyEgSSdsbCBmaXgg
aXQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgaW9tbXVfZG1hX29wcyA9IHsN
Cj4gPiAgIAkuYWxsb2MJCQk9IGlvbW11X2RtYV9hbGxvYywNCj4gPiAgIAkuZnJlZQkJCT0gaW9t
bXVfZG1hX2ZyZWUsDQo+IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdlaQ0K
