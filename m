Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F940CFB81
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 15:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfJHNnb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 09:43:31 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:4847
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725821AbfJHNnb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 09:43:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOU+tSxsfxRLnQ84dqJPYqOi5ZGFN/v4DxNxACF/DqovYHsZyakkDSd7ddz6MuS3NpUvfRtOlUGE/DMPyNAomAeOSOwZ6V6+5YMzG8OXj9g7ZsRud2RQZ81P9JwvbSB/X/LwOzGOWljlSvNqwalFiNJVOu9dJ05qVQayMShENZYVMKF16Uy4eTNVSyDqr9/gh9MZnU9IyPLXG3eUJ6BO2K3s43tIjnUBgaHt+XFHsuAx3Zo+oBJeQeGjDTUQesuIKmN3mbbhjqor9PoUUhsMi9ZAwv9yLlTfyy3LvROCYdrlVgiSdtFVzx26BlyZFUfx5TT3gPnU7+X8hBpGVdIG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmK2HTznrhQyhfKsd5Na53IxHRoa2C0r3gPJAwj9Te4=;
 b=DG0HYxJWk9PRQ6WwxYqR3u95RWEWKYKpTBexItTZsiaD9muWaJJhrChSM4Wui2gmj4BgJyvlxGC6giGNXBk1pOJduc0+ZOBnL4DVAYSRhHlyo7Qjk2UK73Cs7GRFftAR++v8F79V5p92+gWlWsARG2M9/pogkAkyH0wfbhRT3YX7oicF4Dn8rxicJgiojIXDmR8WHbyHG8+DOoaEzbG5L4esGEk01l5NzMYAVBf7sYOEi7lfBiJXJTdqeFs0Xxn9EE9AkbJK7rzEXI2H79av4OwEkhCelGLnhZHnghIVthbfDh8ccW1NcRZIJZ7qcNJwsDAR2NOgpMCrW8UL6if/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmK2HTznrhQyhfKsd5Na53IxHRoa2C0r3gPJAwj9Te4=;
 b=BogkqIu+mmJsWbkCgzppQtNifUpHop6Vs3+cwMd5OXxINmz4Kmpi0mjprGEnjZaHTjlgjZDo9mHhlQhMbzPTLYwokNPS/XRfg0z39el6BIpaq/Ns73zLXph2yfsrIW7XuR0CPRMn/G/gMOxafdV4V0qFmTEIFkjo0tZLM5tLq7w=
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com (52.133.178.139) by
 TYAPR01MB3854.jpnprd01.prod.outlook.com (20.178.137.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 13:43:24 +0000
Received: from TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::39f0:7085:b13f:7056]) by TYAPR01MB2111.jpnprd01.prod.outlook.com
 ([fe80::39f0:7085:b13f:7056%5]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 13:43:24 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio port
 node
Thread-Topic: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio port
 node
Thread-Index: AQHVesNxH5cE4MOPUUurULrZE7LHeKdQwSKAgAAFRMA=
Date:   Tue, 8 Oct 2019 13:43:24 +0000
Message-ID: <TYAPR01MB21111CD187E5EF5CB6FB01BAB89A0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
References: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWCu14DOci-EUuSZ_JTeZaoq90qr035WFsLY2c3UqgkeA@mail.gmail.com>
In-Reply-To: <CAMuHMdWCu14DOci-EUuSZ_JTeZaoq90qr035WFsLY2c3UqgkeA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db94a3f1-3864-45a9-8a3b-08d74bf57ded
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB3854:|TYAPR01MB3854:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3854DA5B4C6B8091308C1623B89A0@TYAPR01MB3854.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(51914003)(199004)(189003)(81156014)(8676002)(81166006)(14454004)(8936002)(229853002)(6916009)(107886003)(4326008)(5660300002)(33656002)(9686003)(6306002)(55016002)(6436002)(6246003)(66946007)(74316002)(52536014)(305945005)(66556008)(66476007)(64756008)(66446008)(86362001)(7736002)(76116006)(3846002)(6116002)(44832011)(476003)(14444005)(256004)(316002)(25786009)(99286004)(54906003)(486006)(71200400001)(71190400001)(2906002)(6506007)(53546011)(102836004)(76176011)(478600001)(26005)(186003)(966005)(446003)(7696005)(66066001)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3854;H:TYAPR01MB2111.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mruBWvl2NfveUdtxKBlbD1dnFtuyzggVMSSqND6nSDt6OixYotBnb3N/acfIsyEnBDybWe8crVLwAkNbKqA0duo4vlqPsPR3yfdgnQWmiBJkW116SmOQg1sMbd8m5dfF8Z6J9LjyOR8I1QQTmoNRrVDpLK143ggrIvD/FjHCo5KjDS8jLwYHaG5GbVCL/SXuhlYbJ1az1OwiZTBmpiB7d0UhH7J6l2vMCewI9ilE37sSMi5qnc0GHpYsNF4O+BQN5cSgNPiX110S24wazADH+/6xwp1SQ9/3dE/WX32RAU1+/sK71lWG3smQ100L0PAWkzf7TglqXanbVOeDkWhLfOWj+y62jep7uMVNAgUwKekgWg732FspCnPH4mnp0xjU2f0+QCUdPWYBVII4Mjt5htoniMMi1fNFp/A4tkpE6MpptK2P/D8dsgoFrT0kPMLbM0ggrnV3LxKHZI9swg4FMw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db94a3f1-3864-45a9-8a3b-08d74bf57ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 13:43:24.5526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /59PuefdjiYp5aTY326dW/rcgnYI4oui+0pGhQfdRpCGe0Jg3Pf2WTdoTwHAEmrNX/OYUkqxHL6N5D3LCicfAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3854
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRhMTogUmVtb3ZlIGF1ZGlv
DQo+IHBvcnQgbm9kZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRj
aCENCj4gDQo+IE9uIEZyaSwgT2N0IDQsIDIwMTkgYXQgNDo1MyBQTSBCaWp1IERhcyA8YmlqdS5k
YXNAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggcmVtb3ZlcyBhdWRpbyBw
b3J0IG5vZGUgZnJvbSBTb0MgZGV2aWNlIHRyZWUuDQo+IA0KPiBTdGFuZGFyZCByZXZpZXcgY29t
bWVudDogIldoeT8iDQo+IA0KPiA+IEZpeGVzOiBlMmYwNDI0OGZjZDQgKCJhcm02NDogZHRzOiBy
ZW5lc2FzOiByOGE3NzRhMTogQWRkIGF1ZGlvDQo+ID4gc3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IFYx
LS0+VjINCj4gPiAgKiBOZXcgcGF0Y2guDQo+ID4gVjItLT5WMw0KPiA+ICAqIEZpeGVkIHRoZSBj
b21taXQgbWVzc2FnZS4gVGhhbmtzIHRvIEZhYnJpemlvLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBk
ZXBlbmQgdXBvbg0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1yZW5lc2FzLXNvYy9saXN0Lz9zZXJpZXM9MTgNCj4gPiAyNTgxDQo+IA0KPiBXaHkgdGhlIGRl
cGVuZGVuY3k/DQo+IFRoaXMgbG9va3MgbGlrZSBhIGZpeCBmb3IgcjhhNzc0YTEsIHRvbz8NCg0K
U29ycnksIHRoZSBhYm92ZSBkZXBlbmRlbmN5IGlzIGZvciB0aGUgc2Vjb25kIHBhdGNoLiANCiJb
djMsMi8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRiMTogQWRkIFNvdW5kIGFuZCBBdWRp
byBETUFDIGRldmljZSBub2RlcyINCg0KUmVnYXJkcywNCkJpanUNCj4gPiAtLS0NCj4gPiAgYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL2hpaG9wZS1jb21tb24uZHRzaSB8IDIwICsrKysrKysr
Ky0tLS0tLS0NCj4gLS0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0
YTEuZHRzaSAgICAgIHwgMTEgLS0tLS0tLS0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kNCj4gPiBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kNCj4gPiBpbmRleCAzNTVkMGEy
Li4yYzk0MmE3IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9o
aWhvcGUtY29tbW9uLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
aGlob3BlLWNvbW1vbi5kdHNpDQo+ID4gQEAgLTg2LDcgKzg2LDcgQEANCj4gPg0KPiA+ICAgICAg
ICAgICAgICAgICBsYWJlbCA9ICJyY2FyLXNvdW5kIjsNCj4gPg0KPiA+IC0gICAgICAgICAgICAg
ICBkYWlzID0gPCZyc25kX3BvcnQwPjsNCj4gPiArICAgICAgICAgICAgICAgZGFpcyA9IDwmcnNu
ZF9wb3J0PjsNCj4gPiAgICAgICAgIH07DQo+ID4NCj4gPiAgICAgICAgIHZidXMwX3VzYjI6IHJl
Z3VsYXRvci12YnVzMC11c2IyIHsgQEAgLTE4Myw3ICsxODMsNyBAQA0KPiA+ICAgICAgICAgICAg
ICAgICBwb3J0QDIgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwyPjsNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBkd19oZG1pMF9zbmRfaW46IGVuZHBvaW50IHsNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmcnNu
ZF9lbmRwb2ludDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3Rl
LWVuZHBvaW50ID0gPCZyc25kX2VuZHBvaW50PjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICB9Ow0KPiA+ICAgICAgICAgICAgICAgICB9Ow0KPiA+ICAgICAgICAgfTsNCj4gPiBAQCAtMzE5
LDE3ICszMTksMTUgQEANCj4gPiAgICAgICAgIC8qIFNpbmdsZSBEQUkgKi8NCj4gPiAgICAgICAg
ICNzb3VuZC1kYWktY2VsbHMgPSA8MD47DQo+ID4NCj4gPiAtICAgICAgIHBvcnRzIHsNCj4gPiAt
ICAgICAgICAgICAgICAgcnNuZF9wb3J0MDogcG9ydEAwIHsNCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICByc25kX2VuZHBvaW50MDogZW5kcG9pbnQgew0KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkd19oZG1pMF9zbmRfaW4+Ow0KPiA+
ICsgICAgICAgcnNuZF9wb3J0OiBwb3J0IHsNCj4gPiArICAgICAgICAgICAgICAgcnNuZF9lbmRw
b2ludDogZW5kcG9pbnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRw
b2ludCA9IDwmZHdfaGRtaTBfc25kX2luPjsNCj4gPg0KPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGFpLWZvcm1hdCA9ICJpMnMiOw0KPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYml0Y2xvY2stbWFzdGVyID0gPCZyc25kX2VuZHBvaW50MD47DQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmcmFtZS1tYXN0ZXIgPSA8JnJzbmRfZW5kcG9p
bnQwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkYWktZm9ybWF0ID0gImkycyI7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYml0Y2xvY2stbWFzdGVyID0gPCZyc25kX2VuZHBv
aW50PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBmcmFtZS1tYXN0ZXIgPSA8JnJzbmRf
ZW5kcG9pbnQ+Ow0KPiA+DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGF5
YmFjayA9IDwmc3NpMj47DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBwbGF5YmFjayA9IDwmc3NpMj47DQo+ID4gICAgICAgICAgICAg
ICAgIH07DQo+ID4gICAgICAgICB9Ow0KPiA+ICB9Ow0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YTEuZHRzaQ0KPiA+IGIvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kNCj4gPiBpbmRleCBkMTc5ZWUzLi4zNGE5ZjQ3IDEw
MDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRhMS5kdHNp
DQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kNCj4g
PiBAQCAtMTcyNiwxNyArMTcyNiw2IEBADQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAic3NpLjEiLCAic3NpLjAiOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4NCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBw
b3J0cyB7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydEAwIHsNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBvcnRAMSB7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH07DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiAtDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmNhcl9zb3VuZCxjdHUgew0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY3R1MDA6IGN0dS0wIHsgfTsNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGN0dTAxOiBjdHUtMSB7IH07DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywN
Cj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg==
