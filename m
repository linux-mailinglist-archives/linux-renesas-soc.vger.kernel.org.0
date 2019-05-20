Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20709230C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 11:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730548AbfETJwx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 05:52:53 -0400
Received: from mail-eopbgr1410130.outbound.protection.outlook.com ([40.107.141.130]:16084
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726126AbfETJwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 05:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVXEskpmVdARa5OXz8WLt64AAadIwWlDNxuSoa8arMs=;
 b=YCSri4Bo10FmZyMaqECMfYgcrLpqK6bsSNH1w3KLc1/PsLQXAO+OAchRRPslHfRjcjS5mXksU8jpwflvw0euo64wkqv/YL8HmmXUrcc411CEDlYx19uXgJPhpwGMjUIicAtz5b3Q4TgKe1T5a5vGOuztzZyOObcLczPGy5fi8pU=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB4696.jpnprd01.prod.outlook.com (20.179.183.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Mon, 20 May 2019 09:52:47 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 09:52:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
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
        Michael Rodin <mrodin@de.adit-jv.com>
Subject: RE: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for
 SCIF2"
Thread-Topic: [PATCH 2/6] Revert "arm64: dts: renesas: r8a7796: Enable DMA for
 SCIF2"
Thread-Index: AQHVAhK8s7aOvk7PBUeG1lpS8I4AmqZd4YmAgACiA4CAFNl1EIAAXKuAgAAMDoA=
Date:   Mon, 20 May 2019 09:52:46 +0000
Message-ID: <OSBPR01MB31742E56261058846C5CBF44D8060@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
 <20190504004258.23574-3-erosca@de.adit-jv.com>
 <CAMuHMdWnuvQvugqfMjE1R_QDvf-Pma8POb1x5YjRr97+M-=HHg@mail.gmail.com>
 <20190506194233.GA32430@vmlxhi-102.adit-jv.com>
 <OSBPR01MB3174C93C0A49701EC72F9D82D8060@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <CAMuHMdVR4idTqOiNWMi3GAS0D-V+SMsYSsukgEMYyz5zDcuPbw@mail.gmail.com>
In-Reply-To: <CAMuHMdVR4idTqOiNWMi3GAS0D-V+SMsYSsukgEMYyz5zDcuPbw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3c2c5d1-0f19-4922-0c68-08d6dd08e9bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4696;
x-ms-traffictypediagnostic: OSBPR01MB4696:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <OSBPR01MB46967B35EF74B513D12B237BD8060@OSBPR01MB4696.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(376002)(136003)(396003)(366004)(189003)(199004)(53936002)(53546011)(6506007)(9686003)(33656002)(14454004)(55016002)(3846002)(6116002)(52536014)(6306002)(102836004)(6436002)(6246003)(99286004)(478600001)(476003)(486006)(5660300002)(7696005)(446003)(186003)(26005)(76176011)(66946007)(64756008)(76116006)(11346002)(66476007)(66446008)(66556008)(73956011)(966005)(71190400001)(71200400001)(8676002)(81166006)(81156014)(7416002)(86362001)(316002)(8936002)(66066001)(74316002)(305945005)(7736002)(6916009)(4326008)(68736007)(25786009)(2906002)(256004)(229853002)(14444005)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4696;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8PVGTAGEOJOKp6F81zZWIXSet/oXQMMMPZfuOWaJxy/iBDGI2HOLS1aaeKrbo5YOZ5ypyRVa0R3+RjkjAcJboSzVSgZBYTRezqXgInMipWue97CDg3O/iSjZE+13bFvbknMfEtF/I4BI3UwqBzsS+wvDM3ud97Gh+RaeH3LlhY/J3vhbFPbbpCGmiT6qZBeFMh6a9/mdpSmncdlnHlsnhVTsEYZYwPRivukFfm7dj++Z3Euhsh8T971+uopcrf5/SnXC/klxCQrPKaM/lW35ks1EWdUtffTn+0QKCgFUelwDhF8RUXOX5DrfGbWip7fcWPO7wodNBLIlaJ3fDlPRn2x1QNedO3hVMCGZSNRYtmbVWgPnQ16BNSJjl/P1Zv6dE55IkM/ww1eFtWA/0KdGnqAhpjmLMdp3u08UuG1nWr0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c2c5d1-0f19-4922-0c68-08d6dd08e9bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 09:52:46.9391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4696
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkhDQoNCj4gRnJvbTogR2Vl
cnQgVXl0dGVyaG9ldmVuLCBTZW50OiBNb25kYXksIE1heSAyMCwgMjAxOSA0OjM4IFBNDQo+IA0K
PiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBhbmFseXNpcyENCj4gDQo+
IE9uIE1vbiwgTWF5IDIwLCAyMDE5IGF0IDQ6MTggQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEV1Z2Vu
aXUgUm9zY2EsIFNlbnQ6IFR1ZXNkYXksIE1heSA3LCAyMDE5IDQ6NDMgQU0NCj4gPiA8c25pcD4N
Cj4gPiA+ID4gPiBbMF0gdjUuMC1yYzYgY29tbWl0IDk3ZjI2NzAyYmM5NWI1ICgiYXJtNjQ6IGR0
czogcmVuZXNhczogcjhhNzc5NjogRW5hYmxlIERNQSBmb3IgU0NJRjIiKQ0KPiA+ID4gPiA+IFsx
XSB2NC4xNC4xMDYgY29tbWl0IDcwM2RiNWQxYjE3NTlmICgiYXJtNjQ6IGR0czogcmVuZXNhczog
cjhhNzc5NjogRW5hYmxlIERNQSBmb3IgU0NJRjIiKQ0KPiA+ID4gPiA+IFsyXSBzY2lmIChERUJV
RykgYW5kIHJjYXItZG1hYyBsb2dzOg0KPiA+ID4gPiA+ICAgICBodHRwczovL2dpc3QuZ2l0aHVi
LmNvbS9lcm9zY2EvMTMyY2NlNzZhNjE5NzI0YTllNGZhNjFkMWRiODhjNjYNCj4gPiA8c25pcD4N
Cj4gPiA+IEVuYWJsaW5nIERFQlVHIGluIGRyaXZlcnMvZG1hL3NoL3JjYXItZG1hYy5jLCBJIGNh
biBub3RpY2UgdGhhdCBvbmUgb2YNCj4gPiA+IHRoZSBzeW1wdG9tcyBpcyBhIE5VTEwgZHN0X2Fk
ZHIgcmV2ZWFsZWQgYnk6DQo+ID4gPg0KPiA+ID4gcmNhci1kbWFjIGU3MzAwMDAwLmRtYS1jb250
cm9sbGVyOiBjaGFuMDogcXVldWUgY2h1bmsgKF9fX19wdHJ2YWxfX19fKTogMEAweGZmZmY4MDA2
MzllYjgwOTAgLT4gMHgwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPg0KPiA+ID4gSW4gd29ya2luZyBz
Y2VuYXJpb3MsIGRzdF9hZGRyIGlzIG5ldmVyIHplcm8uIERvZXMgaXQgZ2l2ZSBhbnkgaGludHM/
DQo+ID4NCj4gPiBUaGFuayB5b3UgZm9yIHRoZSByZXBvcnQhIEl0J3MgdmVyeSBoZWxwZnVsIHRv
IG1lLg0KPiA+IEkgdGhpbmsgd2Ugc2hvdWxkIGZpeCB0aGUgc2gtc2NpIGRyaXZlciBhdCBsZWFz
dC4NCj4gPg0KPiA+IEFjY29yZGluZyB0byB0aGUgWzJdIGxvZyBhYm92ZSwNCj4gPg0KPiA+IFsg
ICAgNC4zNzk3MTZdIHNoLXNjaSBlNmU4ODAwMC5zZXJpYWw6IHNjaV9kbWFfdHhfd29ya19mbjog
ZmZmZjgwMDYzOWI1NTAwMDogMC4uLjAsIGNvb2tpZSAxMjYNCj4gPg0KPiA+IFRoaXMgIjAuLi4w
IiBtZWFucyB0aGUgcy0+dHhfZG1hX2xlbiBvbiB0aGUgc2NpX2RtYV90eF93b3JrX2ZuIHdpbGwg
YmUgemVyby4gQW5kLA0KPiANCj4gSG93IGNhbiB0aGlzIGhhcHBlbj8gc2NoZWR1bGVfd29yaygm
cy0+d29ya190eCkgaXMgY2FsbGVkIG9ubHkgaWYNCj4gIXVhcnRfY2lyY19lbXB0eSgpLCBhbmQg
d2hpbGUgaG9sZGluZyB0aGUgcG9ydCBsb2NrPyBTbyB0aGUgY2lyY3VsYXINCj4gYnVmZmVyIG11
c3QgYmUgbWFkZSBlbXB0eSBpbiBiZXR3ZWVuIHRoZSBjYWxsIHRvIHNjaGVkdWxlX3dvcmsoKSBh
bmQgdGhlDQo+IHdvcmsgZnVuY3Rpb24gc2NpX2RtYV90eF93b3JrX2ZuKCkgYmVpbmcgY2FsbGVk
Lg0KPiANCj4gSSB0aGluayB0aGlzIGNhbiBoYXBwZW4gaWYgdWFydF9mbHVzaF9idWZmZXIoKSBp
cyBjYWxsZWQgYXQgdGhlIHJpZ2h0DQo+IG1vbWVudD8NCg0KSSB0aGluayBzby4gQWNjb3JkaW5n
IHRvIHRoZSBsb2cgWzJdLCB0aGUgeG1pdC0+aGVhZCBhbmQgdGFpbCBpcyBzZXQgdG8gemVyby4N
Cg0KMjc4IFsgICAgNC4zMzEyMzRdIHNoLXNjaSBlNmU4ODAwMC5zZXJpYWw6IHNjaV9kbWFfdHhf
d29ya19mbjogZmZmZjgwMDYzOWI1NTAwMDogOS4uLjUyLCBjb29raWUgMTI0IA0KMjc5IFsgICAg
NC4zMzQ4ODVdIHNoLXNjaSBlNmU4ODAwMC5zZXJpYWw6IHNjaV9kbWFfdHhfY29tcGxldGUoMCkg
DQoyODAgWyAgICA0LjMzOTk5Ml0gc2gtc2NpIGU2ZTg4MDAwLnNlcmlhbDogc2NpX2RtYV90eF93
b3JrX2ZuOiBmZmZmODAwNjM5YjU1MDAwOiA1Mi4uLjEwMCwgY29va2llIDEyNSANCjI4MSBbICAg
IDQuMzQzMzQwXSBzaC1zY2kgZTZlODgwMDAuc2VyaWFsOiBzY2lfZG1hX3R4X2NvbXBsZXRlKDAp
IA0KMjgyIFsgICAgNC4zNzk3MTZdIHNoLXNjaSBlNmU4ODAwMC5zZXJpYWw6IHNjaV9kbWFfdHhf
d29ya19mbjogZmZmZjgwMDYzOWI1NTAwMDogMC4uLjAsIGNvb2tpZSAxMjYgDQoNCj4gPiA+IHJj
YXItZG1hYyBlNzMwMDAwMC5kbWEtY29udHJvbGxlcjogY2hhbjA6IHF1ZXVlIGNodW5rIChfX19f
cHRydmFsX19fXyk6IDBAMHhmZmZmODAwNjM5ZWI4MDkwIC0+IDB4MDAwMDAwMDAwMDAwMDAwMA0K
PiA+DQo+ID4gVGhpcyBtZWFucyB0aGUgY2h1bmstPmRzdF9hZGRyIGlzIG5vdCBzZXQgdG8gdGhl
ICJkc3RfYWRkciIgZm9yIFNDSUYgYmVjYXVzZSB0aGUgbGVuIG9uIHJjYXJfZG1hY19jaGFuX3By
ZXBfc2cgaXMgemVyby4NCj4gPiBTbywgSSdtIHRoaW5raW5nOg0KPiA+ICAtIHdlIGhhdmUgdG8g
Zml4IHRoZSBzaF9zY2kgZHJpdmVyIHRvIGF2b2lkICJ0eF9kbWFfbGVuID0gMCIgdHJhbnNmZXJy
aW5nLg0KPiANCj4gVGhhdCBzb3VuZHMgbGlrZSBqdXN0IGEgc2ltcGxlIGNoZWNrIGZvciAhcy0+
dHhfZG1hX2xlbiBpbg0KPiBzY2lfZG1hX3R4X3dvcmtfZm4oKSwgdG8gcmV0dXJuIGVhcmx5LCBf
YW5kXyByZXNldCBzLT5jb29raWVfdHggdG8NCj4gLUVJTlZBTC4NCj4gDQo+IEhvd2V2ZXIsIHVh
cnRfZmx1c2hfYnVmZmVyKCkgbWF5IHN0aWxsIGJlIGNhbGxlZCBpbiBiZXR3ZWVuIHRoZSBjaGVj
aw0KPiBhbmQgdGhlIGNhbGxzIHRvIGRtYWVuZ2luZV9wcmVwX3NsYXZlX3NpbmdsZSgpIC8NCj4g
ZG1hX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UoKSwgY2xlYXJpbmcgcy0+dHhfZG1hX2xlbiBhZ2Fp
bi4NCj4gVW5sZXNzIHNvbWV0aGluZyBoYXMgY2hhbmdlZCByZWNlbnRseSwgdGhlc2UgdHdvIGNh
bGxzIGNhbm5vdCBiZSBtb3ZlZA0KPiBpbnNpZGUgdGhlIHNwaW5sb2NrLXByb3RlY3RlZCBzZWN0
aW9uPw0KDQpJIGFsc28gdGhpbmsgdGhlc2UgdHdvIGNhbGxzIChhbmQgZG1hZW5naW5lX3N1Ym1p
dCgpIGFuZCBkbWFfYXN5bmNfaXNzdWVfcGVuZGluZygpKQ0Kc2hvdWxkIGJlIG1vdmVkIGluc2lk
ZSB0aGUgc3BpbmxvY2stcHJvdGVjdGVkIHNlY3Rpb24gbGlrZSBzY2lfZG1hX3J4X2NvbXBsZXRl
KCkuDQoNCkFsc28sIHNjaV9mbHVzaF9idWZmZXIoKSBzaG91bGQgaGF2ZSB0aGUgc3BpbmxvY2st
cHJvdGVjdGVkIHNlY3Rpb24gYW5kDQpjaGVjayB0aGUgeG1pdCBhbmQgZG1hIHN0YXRlIHNvbWVo
b3cuDQoNCj4gVXNpbmcgYSBjYWNoZWQgdmFsdWUgb2Ygcy0+dHhfZG1hX2xlbiBmb3IgdGhlIGRt
YWVuZ2luZSBjYWxscyBtaWdodA0KPiB3b3JrLCB0aG91Z2guDQo+IA0KPiA+IGFuZA0KPiA+DQo+
ID4gIC0gYWxzbyB3ZSBoYXZlIHRvIGZpeCB0aGUgcmNhci1kbWFjIGRyaXZlciB0byBhdm9pZCB0
aGlzIGlzc3VlIGJlY2F1c2UgdGhlIERNQSBFbmdpbmUgQVBJDQo+ID4gICAgZ3VpZGUgZG9lc24n
dCBwcmV2ZW50IHRoZSBsZW4gPSAwLg0KPiANCj4gSSBndWVzcyByZXR1cm5pbmcgYW4gZXJyb3Ig
bWFrZXMgbW9zdCBzZW5zZT8NCj4gRWxzZSB3ZSBoYXZlIHRvIGZpeCBpdCBkZWVwZXIgaW50byB0
aGUgZHJpdmVyLCB3aGVyZSBoYW5kbGluZyBiZWNvbWVzDQo+IG1vcmUgY29tcGxleC4NCg0KSSBz
ZWUuIEkgdGhpbmsgc28uIChXZSBzaG91bGQgYXZvaWQgbW9yZSBjb21wbGV4LikNCg0KQmVzdCBy
ZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
