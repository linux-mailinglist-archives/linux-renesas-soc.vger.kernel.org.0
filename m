Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919F03AED9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 08:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387718AbfFJGDE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 02:03:04 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:58632
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387614AbfFJGDE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 02:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPkBGpmyFclYIDk0FkFQ18gqVAHuXBvRU4a92Wd0olM=;
 b=LOqs1QpcnblaYTAaIXBTriMNjzAgxX/hV5GHZtf2nbnkhh+At7QiC/x7F+lJu3O6YuGY0bOpcG8pr7vArxQJqrS5c67ynD73RDbaw9IRI6FyjyBOYG9jZWrHNBeyhmIjZKGWwrPWhP9K0dMhWrtrG83Vd06+9LgSXCttAdrYBB0=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2337.jpnprd01.prod.outlook.com (52.134.248.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Mon, 10 Jun 2019 06:02:59 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 06:02:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] phy: renesas: rcar-gen3-usb2: fix imbalance powered
 flag
Thread-Topic: [PATCH v2] phy: renesas: rcar-gen3-usb2: fix imbalance powered
 flag
Thread-Index: AQHVHRjIO6KREcmvc0O2wL/9DKckHqaQLhiAgAQ67vA=
Date:   Mon, 10 Jun 2019 06:02:59 +0000
Message-ID: <OSAPR01MB3089681C9E1AC1FA4D548300D8130@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559901734-23540-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVwdb1J8j4JaeHhCmkSF4ozWN+EVh7f01MSaGOkSb9W0w@mail.gmail.com>
In-Reply-To: <CAMuHMdVwdb1J8j4JaeHhCmkSF4ozWN+EVh7f01MSaGOkSb9W0w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9276dfec-4a13-43d1-292a-08d6ed694a5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2337;
x-ms-traffictypediagnostic: OSAPR01MB2337:
x-microsoft-antispam-prvs: <OSAPR01MB23376B6D4A77F7EBAA9BFCA4D8130@OSAPR01MB2337.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(39860400002)(396003)(366004)(376002)(51914003)(189003)(199004)(8676002)(486006)(74316002)(7696005)(73956011)(305945005)(5660300002)(11346002)(2906002)(476003)(26005)(102836004)(6506007)(53546011)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(446003)(186003)(3846002)(6116002)(71190400001)(71200400001)(14444005)(256004)(99286004)(68736007)(76176011)(4326008)(229853002)(6436002)(6246003)(52536014)(66066001)(81166006)(81156014)(25786009)(6916009)(8936002)(54906003)(316002)(55016002)(14454004)(33656002)(53936002)(86362001)(9686003)(478600001)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2337;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qOgwKj98siITivYfx7iAOg3++9pt1wze1qZTvM2f5jzYfmaiM0ZBnK/96Z9m071Xq3vVQIhzRCJjSsr+QsxKqYRgcW6RIZT0rBk4tij7Jujm7eYLCMqgWHYtX38sa1P8k0Xa8PGTh3+/K7hJgV7z6N5Wnn2GozpDUnBNup9R4DkAIJCapZPTE0w+wZeCkkQ80bQDp89x8ba0SOeC+uuqO2c8Izr+QETYDCzXojmZ0QGHGKEfuP0ppECek45+gmJeMGin8R9nWslhNuKeQMxG0d7O3gjLUjrZzoCfktPMAAf8IS+g0zum2F32LV8cbEHm4ofjfnt37s+vIgibZo/6uoVHoEbDgjYJZXb4fEZNv6xWq2Aa6pl96P8Os5uSyAX5SaJ99qr4rwxHqL0e2pWwpggMs63ThnM0nlO3QMV7ItU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9276dfec-4a13-43d1-292a-08d6ed694a5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 06:02:59.3036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2337
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBKdW5lIDcsIDIwMTkgMTA6MjMgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gVGhh
bmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gT24gRnJpLCBKdW4gNywgMjAxOSBhdCAxMjowNyBQ
TSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+IFRoZSBwb3dlcmVkIGZsYWcgc2hvdWxkIGJlIHNldCBmb3IgYW55IG90aGVy
IHBoeXMgYW55d2F5LiBBbHNvDQo+ID4gdGhlIGZsYWcgc2hvdWxkIGJlIGxvY2tlZCBieSB0aGUg
Y2hhbm5lbC4gT3RoZXJ3aXNlLCBhZnRlciB3ZSBoYXZlDQo+ID4gcmV2aXNlZCB0aGUgZGV2aWNl
IHRyZWUgZm9yIHRoZSB1c2IgcGh5LCB0aGUgZm9sbG93aW5nIHdhcm5pbmcNCj4gPiBoYXBwZW5l
ZCBkdXJpbmcgYSBzZWNvbmQgc3lzdGVtIHN1c3BlbmQuIEFuZCBpZiB0aGUgZHJpdmVyIGRvZXNu
J3QNCj4gPiBsb2NrIHRoZSBmbGFnLCBlbmFibGluZyB0aGUgcmVndWxhdG9yIGlzIHBvc3NpYmxl
IHRvIGJlIGltYmFsYW5jZQ0KPiANCj4gSSB0aGluayBpdCByZWFkcyBiZXR0ZXIgYXM6DQo+IA0K
PiAuLi4sIGFuIGltYmFsYW5jZSBpcyBwb3NzaWJsZSB3aGVuIGVuYWJsaW5nIHRoZSByZWd1bGF0
b3IgLi4uDQoNClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uISBJJ2xsIHJldmlzZSBpdCBv
biB2My4NCg0KPiA+IGR1cmluZyBzeXN0ZW0gcmVzdW1lLiBTbywgdGhpcyBwYXRjaCBmaXhlcyB0
aGUgaXNzdWVzLg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdl
bjMtdXNiMi5jDQo+ID4gKysrIGIvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1nZW4zLXVz
YjIuYw0KPiANCj4gPiBAQCAtMTA2LDYgKzEwNyw3IEBAIHN0cnVjdCByY2FyX2dlbjNfY2hhbiB7
DQo+ID4gICAgICAgICBzdHJ1Y3QgcmNhcl9nZW4zX3BoeSBycGh5c1tOVU1fT0ZfUEhZU107DQo+
ID4gICAgICAgICBzdHJ1Y3QgcmVndWxhdG9yICp2YnVzOw0KPiA+ICAgICAgICAgc3RydWN0IHdv
cmtfc3RydWN0IHdvcms7DQo+ID4gKyAgICAgICBzdHJ1Y3QgbXV0ZXggbG9jazsNCj4gDQo+IEl0
IGlzIGFsd2F5cyBhIGdvb2QgaWRlYSB0byBkb2N1bWVudCB3aGF0IGlzIHByb3RlY3RlZCBieSB0
aGUgbXV0ZXg6DQo+IA0KPiAgICAgICAgIHN0cnVjdCBtdXRleCBsb2NrOyAgICAvKiBwcm90ZWN0
cyBycGh5c1suLi5dLnBvd2VyZWQgKi8NCg0KSSBnb3QgaXQuDQoNCj4gQ2hlY2twYXRjaCBkb2Vz
IGhhdmUgYSBjaGVjayBmb3IgdGhpcywgYnV0IHVuZm9ydHVuYXRlbHkgaXQgaXMgZW5hYmxlZCBm
b3INCj4gZHJpdmVycy9uZXQvLCBuZXQvLCBhbmQgZHJpdmVycy9zdGFnaW5nLyBvbmx5Og0KPiAN
Cj4gICAgIENIRUNLOiBzdHJ1Y3QgbXV0ZXggZGVmaW5pdGlvbiB3aXRob3V0IGNvbW1lbnQNCg0K
T2gsIEkgZGlkbid0IGtub3cgdGhhdC4gVGhhbmsgeW91IGZvciB5b3VyIGluZm9ybWF0aW9uLg0K
DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPg0KPiANCj4gYW5kIHRoZSBpbWJhbGFuY2UgaXMgZ29uZToNCj4gVGVzdGVkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KDQpUaGFuayB5b3UgdmVy
eSBtdWNoIGZvciB5b3VyIFJldmlld2VkLWJ5IGFuZCBUZXN0ZWQtYnkgdGFncyENCg0KQmVzdCBy
ZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==
