Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C398978750
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 10:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfG2IZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 04:25:44 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:30690
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726305AbfG2IZm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 04:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCKqbsKowYFxybnReJSJKUqjDc/lr+M1SdZyi10gYulVGd7yWFCOWwGxtx01voB/pxxjZcjS38JR1f/o7vezyZ75ieBy4rU+opWZy4n3hCuLwJu99IC4lvhAinCpy9tryE1KSVni+zW0ZPtvW8WuYKwXV1dZWTdd8RrF5UEkgICi8DwSJcG4S7uMgcEB3XKoq8dYAHdYuE3uBFOe9OvjtNNJ9UiE35lnV78Bi2OcGCE3UydHT2Ro7RisVgOqNYAVDgPhYlJb39R0YQajejpx6t0Qx8Fw1tXWTTPrtFPWN+nxlM9TQ5hPSo8X6DVrxOrzu44NGF+Vh3YiUOFfNhVu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMZy7MD3oq7f5DcW/BJP0Y6ZDuw68RzWLlGJrzwk6OA=;
 b=EYU2g1APeCc75gDAHxlAEHnQigjuUrg+c3/rdblSJIgNFjbOmHx3RyIOYNuKvjllbNnhZi5bBSZv1CT2CHk0X8QTAno2N1Advet1toqXkQF34lmoAj7turVDb3Lz1/gszV/IlJs3buDXZe7Cd6Z01BDrMH/hkvHl7RfyAKfQMl/zIq2C2dmeecR74Jin90lhN2v4/+LMmlwwTEycZc/uR5abNNiL3Zqf2lH4OCa+1gaDS9yLN0Y+bkjEn4fjjM5GJVv2b4QxCQKHawhsp49oS0W8w8Ncmwo1CyPBiidXPUKV6DpBQ827le/fX1/iZMeBtEZnBd9M3LgrdjrglcHvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMZy7MD3oq7f5DcW/BJP0Y6ZDuw68RzWLlGJrzwk6OA=;
 b=IM4rTCQWzSX2I/xd3I2ptKDallXGM1hBWCzmaPbqZApIHx0Zr+j4W4KjT656Jv0sIK3huqcTRSAzkKw8XstnQH8h5LOnb33y8kddiUrvo1lpqmMpnzjQ/uJZuJ+A1EXg0Tzt9S1j6AijZHMzx4gMR3CG2Pjnt9yF2IudavMwyPI=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB4589.jpnprd01.prod.outlook.com (20.179.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 08:25:24 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9%5]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 08:25:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: RE: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Thread-Topic: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Thread-Index: AQHVMXpGeT4aQWsNQ0KL+gAQlHHL46a40smAgAxIY4CAFhNHAIABDMBggAUtLgCAAAIsYA==
Date:   Mon, 29 Jul 2019 08:25:24 +0000
Message-ID: <TYAPR01MB4544A8358DE51BFB1193287CD8DD0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
 <20190703083514.32385-3-horms+renesas@verge.net.au>
 <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
 <20190711080302.qeotxueyvlr7pvhe@verge.net.au>
 <20190725090946.GA3311@kroah.com>
 <TYAPR01MB4544F226C06730C5611EB025D8C00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <20190729081440.ftgchumfoszlht4q@verge.net.au>
In-Reply-To: <20190729081440.ftgchumfoszlht4q@verge.net.au>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c733d43d-13b8-42fa-2fc5-08d713fe4df7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4589;
x-ms-traffictypediagnostic: TYAPR01MB4589:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB4589C370710925185FFA6483D8DD0@TYAPR01MB4589.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(189003)(199004)(66446008)(76176011)(64756008)(66946007)(66476007)(66556008)(6116002)(3846002)(229853002)(74316002)(9686003)(7696005)(33656002)(53936002)(55016002)(186003)(66066001)(25786009)(76116006)(102836004)(99286004)(26005)(6306002)(6506007)(7416002)(305945005)(7736002)(14454004)(6436002)(256004)(86362001)(71200400001)(71190400001)(316002)(52536014)(486006)(4326008)(476003)(11346002)(966005)(446003)(2906002)(81156014)(6916009)(5660300002)(54906003)(8936002)(81166006)(6246003)(478600001)(68736007)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4589;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B8XE7xqQAkoGrydPSUcMC3ylukw0rmR2A0bzbjcSk4pPIDjfjMSL7Jt10RvnlW/SvgfDNfNGl/K6zga4V1jOPxjLxSUg+R7cmZfHvGjejScWG0fEFojJ2FquuPnR0EGIJmVjxKePv5hT/X2LU3klOKRl3BSdfvtBQ189mVdwSOHdQFHmawobfGTdhfgTQCYmshSAjk3Mf2ygfmqfdTYzntH52AI5qf4Az1aEKGsztqGif/nBtRTuFLY/BfPJyagWSH+G9fZAet17lb5k51/UfNcE2jMn/HxH0mnngWA3ssU7gxwCqyFjm3MRMJAglJfkaPRa0fX0CgQzXTGbo3jBrDDziSzzm5DVGkn09DfYRuYqhdqXT3WzajjG3QWhbmUiPgYQOPQ3gHqDOcS1GSjMUHMbKStvPabXMxuFnH1JLlQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c733d43d-13b8-42fa-2fc5-08d713fe4df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 08:25:24.5351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4589
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2ltb24tc2FuLA0KDQo+IEZyb206IFNpbW9uIEhvcm1hbiwgU2VudDogTW9uZGF5LCBKdWx5
IDI5LCAyMDE5IDU6MTUgUE0NCjxzbmlwPg0KPiA+ID4gPiA+IFVuZm9ydHVuYXRlbHkgdGhlIHBy
ZXZpb3VzIHZlcnNpb24gaGFzIGFscmVhZHkgbWFkZSBpdCBpbnRvIHVzYi1uZXh0DQo+ID4gPiA+
ID4gMjNjNDY4MDFkMTRjYjY0NyBkdC1iaW5kaW5nczogdXNiOiByZW5lc2FzX2dlbjM6IFJlbmFt
ZSBiaW5kaW5ncw0KPiA+ID4gPiA+IGRvY3VtZW50YXRpb24gZmlsZQ0KPiA+ID4gPg0KPiA+ID4g
PiBPaywgSSBndWVzcyB3ZSBzaG91bGQgZ28gd2l0aCB0aGF0IHZlcnNpb24uDQo+ID4gPg0KPiA+
ID4gU28gY2FuIHlvdSByZXNlbmQgdGhpcyBzZXJpZXMgYmFzZWQgb24gNS4zLXJjMSBzbyBJIGtu
b3cgd2hhdCB0byBhcHBseT8NCj4gPg0KPiA+IFNpbmNlIHlvdXIgdXNiLXRlc3RpbmcgYnJhbmNo
IGFscmVhZHkgaGFzIGl0IHdoaWNoIGlzIG1lcmdlZCBmcm9tIEZlbGlwZSdzIHVzYi1uZXh0IGJy
YW5jaCwNCj4gPiBJIGRvbid0IHRoaW5rIFNpbW9uIGhhcyB0byByZXNlbmQgdGhpcyBzZXJpZXMu
DQo+ID4NCj4gPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC11c2IvbXNnMTgy
MTAzLmh0bWwNCj4gDQo+IFRoYW5rcyBhbmQgc29ycnkgZm9yIHRoZSBjb25mdXNpb24uDQo+IA0K
PiBJbiB2NS4yLXJjMSB3ZSBoYWQ6DQo+IA0KPiAgIGRldmljZXRyZWUvYmluZGluZ3MvdXNiL3Jl
bmVzYXNfdXNiMy50eHQNCj4gICBkZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9yZW5lc2FzX3VzYmhz
LnR4dA0KPiANCj4gDQo+IEluIHY1LjMtcmMxIHdlIGhhdmU6DQo+IA0KPiAgIGRldmljZXRyZWUv
YmluZGluZ3MvdXNiL3JlbmVzYXMsdXNiMy50eHQNCj4gICBkZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9yZW5lc2FzLHVzYmhzLnR4dA0KPiANCj4gV2hpY2ggcmVmbGVjdHMgdjEgb2YgdGhpcyBwYXRj
aHNldC4gQW5kIEkgdGhpbmsgdGhpcyBpcyBhbiBpbXByb3ZlbWVudC4NCj4gDQo+IFNoaW1vZGEt
c2FuLCBjYW4geW91IGxldCBtZSBrbm93IGlmIHlvdSB3b3VsZCBsaWtlIG1lIHRvIHJlYmFzZSB2
Mg0KPiBvbiB2NS4zLXJjMT8gVGhhdCB3b3VsZCB3b3VsZCBnaXZlIHVzOg0KPiANCj4gICBkZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9yZW5lc2FzLHVzYjMtcGVyaS50eHQNCj4gICBkZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9yZW5lc2FzLHVzYmhzLnR4dAkJW3VuY2hhbmdlZF0NCg0KVGhhbmsgeW91
IGZvciB0aGUgZGV0YWlsLiBJIHdvdWxkIGxpa2UgeW91IHRvIHJlYmFzZSB2MiBsaWtlIHRoYXQs
IGlmIHBvc3NpYmxlLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
