Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 108EA68652
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2019 11:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbfGOJ3P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Jul 2019 05:29:15 -0400
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:33815
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729413AbfGOJ3P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jul 2019 05:29:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKhwUjTTYZ2tyi62fPC2ccVs8GZ1XZh+g3ZH7FkchGcq1oFU3se3u0pRXc4EWc9VNLrtN4Vj0EJiwbxXqxzLLL4egZg0bwnS65w239jkK2Vc3n5DE3lksiXnff821sOnrWT0v7/sOvxJe6oE7EaSYD2sgzbsukoWC6xanrWAK8QkpwZAPpTToyW8hZ9XxUWi2wbcR2OWs6Fwo7oivJzF4Lks1UEmcEElcTeyFHj2nhD37Rt5GBwz8cUdwR7rfOE8zShV57n+oauONFAUrQOltO6X0w30LQuTPR01rul6W6i3/nGhRXS4yU2Q5aPkf0KJ6X0hL+W68CMvwfluGhI5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR/iLJSnNlX4nG7fgfL8RxpP1NhP2tfeGSPY2J2XoyA=;
 b=JAj23qQZYczSc0n13Bc1XzqF0CQRTzfd2ZXElE3XgQ+AobZFNtmC7lK0CP7LZwn7Xq47SEmfhtwj9pEI9DaMA94jr2JlPkyyfDmZHNZxj8s4nu9bKf9H3cRr/vfqyFWonutudyKtDieedInSevUZ1D2aBwBh89BR7eeMEcW1kUA7K9X7H5k1LNWEYP5FlmQlyzLk1DRiSgFBHPnYeUKGGFR8EedH9iMfKO74ntOxhOomCKzBquu/w34+kuowizz2ACsh//86SN+w920bI0r3C+7aoioxsvsPfK/Y7/77xHmBJUPV01vGetEpp0qHNnsWkNNCyNxBZetgMKXnohN1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JR/iLJSnNlX4nG7fgfL8RxpP1NhP2tfeGSPY2J2XoyA=;
 b=WpjGLpW1CdWJ70fzM9549E1Ng/49tQbZfeO5L3NuAT0Wmx8nYTOgx7D3R4uBgt6nk7OhdLTgqFIHNJK5jjHmcNMor5nVwkesZjkoM8BKVH3I0hlr4uUqEBX8Z/fTIahHaqxe/42Tb/LfcWcqZCKQbbNmNZyaZju7PFWhGpes0dk=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1466.jpnprd01.prod.outlook.com (52.133.163.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 09:29:10 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 09:29:10 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio
 support
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI audio
 support
Thread-Index: AQHVMzciFTrbHJHhA0C75HFDsxZm2KbHCNuAgARvcOA=
Date:   Mon, 15 Jul 2019 09:29:10 +0000
Message-ID: <TY1PR01MB1770CEA1C7A658C84FCD4EE6C0CF0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1562333979-28516-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUGfHyPp=5aBig4_Sh91hUku4Xx_Ho54X=EDcqrj_zXqA@mail.gmail.com>
In-Reply-To: <CAMuHMdUGfHyPp=5aBig4_Sh91hUku4Xx_Ho54X=EDcqrj_zXqA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 459f23d9-0cf5-431a-0dd6-08d70906e4c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1466;
x-ms-traffictypediagnostic: TY1PR01MB1466:
x-microsoft-antispam-prvs: <TY1PR01MB1466302DFE211D1EDD398777C0CF0@TY1PR01MB1466.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(189003)(199004)(186003)(26005)(76176011)(6506007)(53546011)(102836004)(3846002)(6116002)(229853002)(81156014)(8936002)(2906002)(5660300002)(25786009)(52536014)(7696005)(86362001)(81166006)(66066001)(74316002)(476003)(8676002)(6916009)(11346002)(55016002)(486006)(53936002)(9686003)(6436002)(99286004)(14454004)(6246003)(446003)(66476007)(44832011)(66556008)(64756008)(66946007)(66446008)(68736007)(76116006)(4326008)(54906003)(256004)(305945005)(7736002)(316002)(71190400001)(71200400001)(478600001)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1466;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jiGOVSzdfgSm5dSWVAfrp2m6nvQCbKOBdpO26xFcofYcaSFoG7oSSyCTjT5kex1rnNc0iUwL/rhQvRc6PV9On0TQHHx06QdoUvEqkfKzBwcA/HN+t1rTSz+5kLJ0FeFstnaDc8pd+MTCNmZrdidBBUbGb8DfRzEo5GdT+cb2e5PCmJImg5Uncl1+23X9FIwqfDAYGexWy6ERC/J+FPiMt+c2Yepn31YxYlKhJstQiN6LWD/MU8CybAD8gG+KuoXeLDhA+jVXQekIZk0C91JGYCPZ467rZwWDpfUw5VR4GtPyMzC3m0XEvq83CdoKLRNpHc60LDdzChDs8WVxLLVFvZyqDvYZMLszDl8qmJr4Z/DV4pc/3cJG3p2QUpK5xzuZNqoGrUFO8zAxRxPRCe5edM37NVNPe7+FM7xScCGPLsM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459f23d9-0cf5-431a-0dd6-08d70906e4c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 09:29:10.6413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1466
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxMiBKdWx5IDIw
MTkgMTQ6NDINCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IGhpaG9wZS1jb21tb246IEFkZCBIRE1JIGF1ZGlvIHN1cHBvcnQNCj4gDQo+IEhpIEZhYnJpemlv
LA0KPiANCj4gT24gRnJpLCBKdWwgNSwgMjAxOSBhdCAzOjQwIFBNIEZhYnJpemlvIENhc3Rybw0K
PiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNo
IGFkZHMgc3VwcG9ydCBmb3IgSERNSSBhdWRpbyB0byB0aGUgZGV2aWNlIHRyZWUNCj4gPiBjb21t
b24gdG8gdGhlIEhpSG9wZSBSWi9HMk0gYW5kIHRoZSBIaUhvcGUgUlovRzJOLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kNCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvaGlob3BlLWNvbW1vbi5kdHNpDQo+IA0KPiA+IEBAIC0x
NjgsNiArMTgwLDcgQEANCj4gPg0KPiA+ICAmaGRtaTAgew0KPiA+ICAgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KPiA+ICsgICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsNCj4gDQo+IFdoeSB0
aGUgYWJvdmUgbGluZT8NCg0KSXQgZG9lc24ndCBiZWxvbmcgdGhlcmUsIGdvb2QgY2F0Y2gsIEkn
bGwgc2VuZCBhIHYyIHNob3J0bHkgd2l0aG91dCBpdC4NCg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+
IFdpdGggdGhlIGFib3ZlIHF1ZXN0aW9uIGFuc3dlcmVkOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAt
LQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+
IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0K
