Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9E68229E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 04:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfETCSy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 May 2019 22:18:54 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:14764
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726102AbfETCSx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 May 2019 22:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5tpsUWLFwjzNaVkn+0u8gh2FSlz1/CBeYjHZRcUL88=;
 b=rOQRHBf0rgebZkoQ7amytxTbqDcANoJ7gJJIOX9dT+Dh5PcPpQwa+E7GZrtpRDtzGGXOOBdNEQXcew1ax9wgUMbw88piP2DrFDfwM+U2Hjy5EIKYrcEENso9bC83USXneQY6UR5omCdVARI//MqfcFSnK8p6xTp/TU40/WYemqs=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB1783.jpnprd01.prod.outlook.com (52.134.227.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 02:18:47 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 02:18:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "George G . Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>
Subject: RE: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for
 SCIF2"
Thread-Topic: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for
 SCIF2"
Thread-Index: AQHVAhK8s7aOvk7PBUeG1lpS8I4AmqZd4YmAgACiA4CAFNl1EA==
Date:   Mon, 20 May 2019 02:18:47 +0000
Message-ID: <OSBPR01MB3174C93C0A49701EC72F9D82D8060@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
 <20190504004258.23574-3-erosca@de.adit-jv.com>
 <CAMuHMdWnuvQvugqfMjE1R_QDvf-Pma8POb1x5YjRr97+M-=HHg@mail.gmail.com>
 <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b207bd3c-b5f6-4f9c-d90d-08d6dcc97dc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB1783;
x-ms-traffictypediagnostic: OSBPR01MB1783:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <OSBPR01MB1783812915C767FDE4073D5CD8060@OSBPR01MB1783.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:191;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(376002)(39860400002)(366004)(346002)(189003)(199004)(53936002)(3846002)(66556008)(5660300002)(64756008)(6116002)(6246003)(66446008)(14454004)(8676002)(81156014)(26005)(11346002)(2906002)(9686003)(73956011)(66946007)(76116006)(52536014)(66476007)(186003)(478600001)(486006)(55016002)(74316002)(476003)(7696005)(102836004)(6506007)(7416002)(6306002)(256004)(6436002)(14444005)(316002)(86362001)(76176011)(966005)(66066001)(110136005)(71190400001)(71200400001)(54906003)(99286004)(4326008)(305945005)(446003)(25786009)(68736007)(81166006)(8936002)(7736002)(33656002)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1783;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vb1OLtWAfN9HxNEhGgDZXYUWhTDxTrvgA8yUd24TJzbTQOi/FcyLg6FakolgF64R6Si6U9JuF1skWN+ZccpvbsUFKCLicj0hvRqrlcXKxWILx34PsSQjvxjlnzK2PoG5kmOTF8SCo2AwRyzf+UaHvvIN0OHuUFqjyXqvYmJHH4vAgE0Tbc9wvQC0a7dWYGMHMNm+a/aUxNb4DSN45lhsNh6LB2lBrRGn3GihQWSrS0+YaGkf+/cWwZYhSQHVJuoj1kGPVUQfVJv4eOUsS0zUiU8RLzwb4pdXXqaL20W7QgEKS1hed4clcLsZAHRAix8jR3MlPQWyno96AvYHlBOvqZoL3T6WiEzd7UIMsYNwCaZSqRR5Kyvzw6QbiYwCHrISvz4LTjJ/MCEdmpQcYf03jxNUUtuoehmgMv8U7fJeWg0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b207bd3c-b5f6-4f9c-d90d-08d6dcc97dc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 02:18:47.1725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1783
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgRXVnZW5pdS1zYW4sIEdlZXJ0LXNhbiwNCg0KPiBGcm9tOiBFdWdlbml1IFJvc2NhLCBTZW50
OiBUdWVzZGF5LCBNYXkgNywgMjAxOSA0OjQzIEFNDQo8c25pcD4NCj4gPiA+IFswXSB2NS4wLXJj
NiBjb21taXQgOTdmMjY3MDJiYzk1YjUgKCJhcm02NDogZHRzOiByZW5lc2FzOiByOGE3Nzk2OiBF
bmFibGUgRE1BIGZvciBTQ0lGMiIpDQo+ID4gPiBbMV0gdjQuMTQuMTA2IGNvbW1pdCA3MDNkYjVk
MWIxNzU5ZiAoImFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3OTY6IEVuYWJsZSBETUEgZm9yIFND
SUYyIikNCj4gPiA+IFsyXSBzY2lmIChERUJVRykgYW5kIHJjYXItZG1hYyBsb2dzOg0KPiA+ID4g
ICAgIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2Vyb3NjYS8xMzJjY2U3NmE2MTk3MjRhOWU0ZmE2
MWQxZGI4OGM2Ng0KPHNuaXA+DQo+IEVuYWJsaW5nIERFQlVHIGluIGRyaXZlcnMvZG1hL3NoL3Jj
YXItZG1hYy5jLCBJIGNhbiBub3RpY2UgdGhhdCBvbmUgb2YNCj4gdGhlIHN5bXB0b21zIGlzIGEg
TlVMTCBkc3RfYWRkciByZXZlYWxlZCBieToNCj4gDQo+IHJjYXItZG1hYyBlNzMwMDAwMC5kbWEt
Y29udHJvbGxlcjogY2hhbjA6IHF1ZXVlIGNodW5rIChfX19fcHRydmFsX19fXyk6IDBAMHhmZmZm
ODAwNjM5ZWI4MDkwIC0+IDB4MDAwMDAwMDAwMDAwMDAwMA0KPiANCj4gSW4gd29ya2luZyBzY2Vu
YXJpb3MsIGRzdF9hZGRyIGlzIG5ldmVyIHplcm8uIERvZXMgaXQgZ2l2ZSBhbnkgaGludHM/DQoN
ClRoYW5rIHlvdSBmb3IgdGhlIHJlcG9ydCEgSXQncyB2ZXJ5IGhlbHBmdWwgdG8gbWUuDQpJIHRo
aW5rIHdlIHNob3VsZCBmaXggdGhlIHNoLXNjaSBkcml2ZXIgYXQgbGVhc3QuDQoNCkFjY29yZGlu
ZyB0byB0aGUgWzJdIGxvZyBhYm92ZSwNCg0KWyAgICA0LjM3OTcxNl0gc2gtc2NpIGU2ZTg4MDAw
LnNlcmlhbDogc2NpX2RtYV90eF93b3JrX2ZuOiBmZmZmODAwNjM5YjU1MDAwOiAwLi4uMCwgY29v
a2llIDEyNg0KDQpUaGlzICIwLi4uMCIgbWVhbnMgdGhlIHMtPnR4X2RtYV9sZW4gb24gdGhlIHNj
aV9kbWFfdHhfd29ya19mbiB3aWxsIGJlIHplcm8uIEFuZCwNCg0KPiByY2FyLWRtYWMgZTczMDAw
MDAuZG1hLWNvbnRyb2xsZXI6IGNoYW4wOiBxdWV1ZSBjaHVuayAoX19fX3B0cnZhbF9fX18pOiAw
QDB4ZmZmZjgwMDYzOWViODA5MCAtPiAweDAwMDAwMDAwMDAwMDAwMDANCg0KVGhpcyBtZWFucyB0
aGUgY2h1bmstPmRzdF9hZGRyIGlzIG5vdCBzZXQgdG8gdGhlICJkc3RfYWRkciIgZm9yIFNDSUYg
YmVjYXVzZSB0aGUgbGVuIG9uIHJjYXJfZG1hY19jaGFuX3ByZXBfc2cgaXMgemVyby4NClNvLCBJ
J20gdGhpbmtpbmc6DQogLSB3ZSBoYXZlIHRvIGZpeCB0aGUgc2hfc2NpIGRyaXZlciB0byBhdm9p
ZCAidHhfZG1hX2xlbiA9IDAiIHRyYW5zZmVycmluZy4NCg0KYW5kIA0KDQogLSBhbHNvIHdlIGhh
dmUgdG8gZml4IHRoZSByY2FyLWRtYWMgZHJpdmVyIHRvIGF2b2lkIHRoaXMgaXNzdWUgYmVjYXVz
ZSB0aGUgRE1BIEVuZ2luZSBBUEkNCiAgIGd1aWRlIGRvZXNuJ3QgcHJldmVudCB0aGUgbGVuID0g
MC4NCg0KRXVnZW5pdS1zYW4sIEdlZXJ0LXNhbiwgd2hhdCBkbyB5b3UgdGhpbms/DQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4+DQo+ID4gVGhhbmtzIQ0KPiANCj4gTGlr
ZXdpc2UhDQo+IA0KPiA+DQo+ID4gR3J7b2V0amUsZWV0aW5nfXMsDQo+ID4NCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiA+DQo+ID4gLS0NCj4gPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnDQo+ID4NCj4gPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+ID4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCj4gDQo+IC0tDQo+IEJlc3QgUmVnYXJkcywNCj4gRXVnZW5pdS4NCg==
