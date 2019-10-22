Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55BD0DFE4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2019 09:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfJVHbC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Oct 2019 03:31:02 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:22848
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726160AbfJVHbC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Oct 2019 03:31:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9BPogU3jpq/JJZSo8UANvb8+gyjo6BD32ngdhkhzoxmry0oKoZXUKHVpir3bH4g/Yvi26KashvdVP58vz/4ZFbyiW53OBZHnEw4MsfhgZTBUJkehDr9Hu9OqUyrOTkfn+OBADqQgDCYPaCOEBruja4AmU5/Li8QTdwLgNOgDDBuqeCoY4llgKfghqtES9RPh+6k3YZRHfxueriBbEixCmx0WeNkvf6ZCl04eet3r9fJu68zcbxQKlCStnwfqlwl0vNh6jbivq5BjGV+0m5iUpXSRUX4M1r5pUsyuf4L3XQ6ArOt6Sy96evDF8DuPBkb9FuU00IkFzlq8wIqMoFifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/sO9Qc+GNRa5Bk0UA7Rw1pSxATVcam2C6T0VfFxYKU=;
 b=FaKqg5Hxjnd8OdrBmkYiXFtpFXOmMcXjcAY8e0wrlZqZlgrkfhDJVknG1wTFe3clGzcgxJ4lEIVjiLlgMGT9VLk9KugWT/ySQmR0u+Tb9ffpvDvq362IFdpe/4ixjCIUZgcMhkD0Msja9fTgYBTTdAGyPgK1o2O5pZx9QEiaPkDT5n8F4Vue5yRWqXjxg/w9nL1rvH1/j4e1k/mTonjmTBeFuYSIzN6xtpBjJG5/uBVvoVz0rjJbyr08wAgTOKtJHN5ousCCh77rStftwIIKBxkm/hnITjU07kg+sS+vgLTFUaLmDc6nZGWGcZni9dlXFgbqrsKUHm+UDJK4W8vdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/sO9Qc+GNRa5Bk0UA7Rw1pSxATVcam2C6T0VfFxYKU=;
 b=HL9bXlXK4oyExAQf66swDal6yhClhXB9un8SwoPm54RiAGN2JyoOBoT1xvNXX2vWnH3loXlgMKB4Fw8jzb+4lNastCjtFuqtQigCWSg+bX2iKa/8gdHeVt0qovEBpvU63IStWPDxsdU7QoibPXhel01jUjy8aNSkArqq629YkDg=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3799.jpnprd01.prod.outlook.com (20.178.97.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Tue, 22 Oct 2019 07:30:57 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 07:30:57 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Topic: [PATCH] mmc: renesas_sdhi_internal_dmac: Add r8a774b1 support
Thread-Index: AQHVcqQwVUdoU56Bi06ox7Sw0gSDmqc+BhQAgAAM8rCAAAqBAIABH8mQgArVvbCAHFxHQA==
Date:   Tue, 22 Oct 2019 07:30:56 +0000
Message-ID: <OSBPR01MB21033DE78EB2205B1ECD55F1B8680@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569307744-42479-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdUsLCciw7KFudSC7pRqfwwaGH5iJSgv906kY342V+6ocQ@mail.gmail.com>
 <OSBPR01MB21036B8294382D1A7A50816BB8860@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdXq1BaNSrOTqUkE34kS6i1kyEXLXe=S5pMdRiEvkD4fvw@mail.gmail.com>
 <OSBPR01MB210339B59E1B57FFDB00038AB8810@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB21039338C4101BDF113E728FB89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21039338C4101BDF113E728FB89E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6229f363-dcaa-46de-7e3a-08d756c1c797
x-ms-traffictypediagnostic: OSBPR01MB3799:|OSBPR01MB3799:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3799FB3C63F52C3FF83A43ECB8680@OSBPR01MB3799.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(199004)(189003)(51914003)(99286004)(102836004)(86362001)(44832011)(26005)(53546011)(6506007)(8936002)(256004)(7736002)(74316002)(486006)(3846002)(66066001)(71200400001)(6116002)(71190400001)(446003)(186003)(11346002)(305945005)(2906002)(476003)(81166006)(8676002)(54906003)(966005)(14454004)(7696005)(478600001)(81156014)(33656002)(25786009)(6306002)(55016002)(52536014)(5660300002)(229853002)(76176011)(316002)(66476007)(66556008)(64756008)(66446008)(66946007)(6436002)(6246003)(9686003)(76116006)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3799;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPV20d4yGedu8xxZmGnF6/thY5uQbCv1YsN6eavq1RadOBrkqBnzsNGsZWywGkUVBjs5KYEXTwt/Afl/WXldYznVrg1jVQfM2w+Lf+Q6TK9yFZkPUg9kzG7asT01U/+x6OOJ0Xp9KDHOPZQ5Y6tHou49c9L5F5z8L/zfe04fJlDMJhxfZUUokOvscJBXnMiKqiHKUNrpGSuQWNqe+N/54Y9SCS6h4DRhcZmKdJE/xgnza6GDCiosWYYfn+/IKpelMs11u+lKyFDH+FWKPj9jJTpqrlWlqYHMkSCUICsTME+Gqj8f7450Y7kdPa5dITFAATIMo83wLxCH2L/nw59f+Kt2x5pq/5MU7Rna6GYm3bTYsnu/LXTOjKgwNEDJeBRYv1IOspHYTkQTWgIb8q6A51Kj/p4Z42GfPSB59+qQW7UiGoVGyvynbKpznAPx80m+Hiyv3YlsKAK3Q72Jq1YE6/y7LwpY9PGttkmFA4FZl3g=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6229f363-dcaa-46de-7e3a-08d756c1c797
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 07:30:56.5690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O21qtg7MDe9xuFPrKd9f4Whv1/NMIYecOA7fv8bFzOlj7BviFEMdeYVTQoaA0gW438wAbMO7g5RSyiWQaDGzeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3799
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgV29sZnJhbSwNCg0KR2VudGxlIHJlbWFpbmRlci4NCg0KVGhpcyBwYXRjaCBpcyBmb3Igd2hp
dGVsaXN0aW5nIHI4YTc3NGIxIFNvQyBhbmQgdGhlcmUgYnkgc3VwcG9ydGluZyB0aGUgc2FtZS4g
ICBBcmUgeW91IGhhcHB5IHdpdGggdGhpcyBwYXRjaD8gDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4g
U3ViamVjdDogUkU6IFtQQVRDSF0gbW1jOiByZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYzogQWRk
IHI4YTc3NGIxDQo+IHN1cHBvcnQNCj4gDQo+IA0KPiBIaSBHZWVydCBhbmQgV29sZnJhbSwNCj4g
DQo+IEFyZSB5b3UgaGFwcHkgd2l0aCB0aGlzIHBhdGNoPyBQbGVhc2UgbGV0IG1lIGtub3cuDQo+
IA0KPiBSZWdhcmRzLA0KPiBCaWp1DQo+IA0KPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIG1tYzog
cmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWM6IEFkZCByOGE3NzRiMQ0KPiA+IHN1cHBvcnQNCj4g
Pg0KPiA+IEhpIEdlZXJ0LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4N
Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1tYzogcmVuZXNhc19zZGhpX2ludGVybmFsX2Rt
YWM6IEFkZCByOGE3NzRiMQ0KPiA+ID4gc3VwcG9ydA0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+
ID4gPg0KPiA+ID4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgNToxMSBQTSBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6
IFtQQVRDSF0gbW1jOiByZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYzogQWRkDQo+ID4gPiA+ID4g
cjhhNzc0YjEgc3VwcG9ydCBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCA4OjQ5IEFNIEJpanUgRGFz
DQo+ID4gPiA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gVGhp
cyBwYXRjaCBhZGRzIFNESEkgc3VwcG9ydCBmb3IgUlovRzJOIChSOEE3NzRCMSkgU29DLg0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0Bi
cC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvbW1j
L2hvc3QvcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWMuYyB8IDEgKw0KPiA+ID4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjLmMN
Cj4gPiA+ID4gPiA+IGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1h
Yy5jDQo+ID4gPiA+ID4gPiBpbmRleCA3NTFmZTkxLi43YzYwMjBlIDEwMDY0NA0KPiA+ID4gPiA+
ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYy5jDQo+
ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9k
bWFjLmMNCj4gPiA+ID4gPiA+IEBAIC0zMDgsNiArMzA4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzb2NfZGV2aWNlX2F0dHJpYnV0ZQ0KPiA+ID4gPiA+IHNvY193aGl0ZWxpc3RbXSA9IHsNCj4g
PiA+ID4gPiA+ICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopQklUKFNESElfSU5URVJOQUxfRE1B
Q19PTkVfUlhfT05MWSkgfSwNCj4gPiA+ID4gPiA+ICAgICAgICAgLyogZ2VuZXJpYyBvbmVzICov
DQo+ID4gPiA+ID4gPiAgICAgICAgIHsgLnNvY19pZCA9ICJyOGE3NzRhMSIgfSwNCj4gPiA+ID4g
PiA+ICsgICAgICAgeyAuc29jX2lkID0gInI4YTc3NGIxIiB9LA0KPiA+ID4gPiA+ID4gICAgICAg
ICB7IC5zb2NfaWQgPSAicjhhNzc0YzAiIH0sDQo+ID4gPiA+ID4gPiAgICAgICAgIHsgLnNvY19p
ZCA9ICJyOGE3NzQ3MCIgfSwNCj4gPiA+ID4gPiA+ICAgICAgICAgeyAuc29jX2lkID0gInI4YTc3
OTUiIH0sDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJcyB0aGlzIHN1ZmZpY2llbnQ/DQo+ID4gPiA+
ID4gRG8geW91IG5lZWQgYSB0dW5pbmcgcXVpcmsgZW50cnkgaW4gc2RoaV9xdWlya3NfbWF0Y2hb
XT8NCj4gPiA+ID4NCj4gPiA+ID4gRG8geW91IG1lYW4gdGhlICAicXVpcmtzLT5tYW51YWxfY2Fs
aWJyYXRpb24iICBhcyBtZW50aW9uZWQgaW4gdGhlDQo+ID4gPiA+IGJlbG93DQo+ID4gPiBwYXRj
aCA/DQo+ID4gPiA+DQo+ID4gPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTEwMjQxMzEvDQo+ID4gPg0KPiA+ID4gRXhhY3RseS4gSXMgUlovRzJOIGFmZmVjdGVkPw0KPiA+
DQo+ID4gTm8uIFJaL0cyTiBpcyBub3QgYWZmZWN0ZWQuICBJIGhhdmUgZW5hYmxlZCBIUzQwMCBt
b2RlIG9uIFJaL0cyTiBib2FyZA0KPiA+IGFuZCB3aXRob3V0IHRoaXMgcGF0Y2ggaXQgd29ya3Mg
ZmluZS4NCj4gPg0KPiA+IE5vdGU6LQ0KPiA+ICBJIGFsc28gdGVzdGVkIHdpdGggcXVpcmsgZW50
cnkgYWRkZWQgaW4gc2RoaV9xdWlya3NfbWF0Y2guICBUaGF0IGlzDQo+ID4gYWxzbyB3b3JrcyBm
aW5lLg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBCaWp1DQo=
