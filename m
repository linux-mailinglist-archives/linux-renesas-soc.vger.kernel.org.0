Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3174D12473F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 13:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfLRMta (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 07:49:30 -0500
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:26112
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726707AbfLRMt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 07:49:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pf0bubOPXOJLNH2yIqdBQAyS5mNmOy1LlXJR6GYy7sdxa1UvYN6C5D1axuDJ1Qsj5gjZZ37fh8wzpOkhGzhERkLbPxfptifQs5sdjq7XEacWifqQ/YpOGKGhaVqXX8Wx/sfqtTFsdi9ehVPDt8avXZflZNq4GC5SgGFiZD0EXEyRXj7a8N+8QwsCg7dm4aafmmB2DgLzM4JZpKyDBcAPzaHY/XrXGz30Bfb4CVlWKG/XpA8ahkARJwNaa1NrAuFfnaJPdgbB+H1uROvzyE5x/eDq6eGjZ4TQzWTb1DbyuvwXocD9j/5Xt9vHAcNfiqBZpw6VbVK2GLQ8T9o8mvfQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wgvg/tiDrkwgpIeGNdgdllWdViEu7ByWKLH2dcuPHoU=;
 b=C+Jyus+sg+LQWy75vrppf7y3Asggng64amVCT7y3Qj2/r7SoYN5Kk1oYT2seSMLVgrp453RFoU3JfUB4RVqEo+iCYc3cgH9lxvDPaJwfYYxg1NuZwM0l+Gdq5hXBLEgPP50+AklCzVSi/Zs+ImTMZcR/4QBTkRIr3iYvDPN5A9uGANVHgGlCLNoEmdB9vW7qqwSXm+bAQPllG1vs/M5RmOratmb44R/KuN0dtOeyPE5IpBSqr2w898O8IBfPaEo/HBgd7WOL1NiPkPPAeJPhK0v/eqH8IzeARP51vPBY2kf3OT9jy7qJZxPb5hnXDqGbw9N/WHQaTodN/nebaguGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wgvg/tiDrkwgpIeGNdgdllWdViEu7ByWKLH2dcuPHoU=;
 b=Gi+Uq8SDIzKDnTZDtERuu7L1zK6ExRwlm/eRir8UCxdiPsxjUjOPLnLasZPRBLWm1U8OsFME99kVNyS4cA0VRZz05DNtv0ndBlLSN4ZVVS31No2yaF0E6F0KcoJt6MJWuEYLryzlYDNbxWUSRnTS+81C2CrWugZv0NwyMZMJghQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1606.jpnprd01.prod.outlook.com (52.134.227.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 12:49:24 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::38ab:d1f:b0d9:7c5b]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::38ab:d1f:b0d9:7c5b%6]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 12:49:23 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clock: renesas: cpg-mssr: Fix the typo
Thread-Topic: [PATCH] clock: renesas: cpg-mssr: Fix the typo
Thread-Index: AQHVtZP4WRCiPlhUiEGcHNCCSIr9C6e/0foAgAAEm2A=
Date:   Wed, 18 Dec 2019 12:49:23 +0000
Message-ID: <OSBPR01MB2103DDF07C530B24DCD2BE4BB8530@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1576667390-29449-1-git-send-email-biju.das@bp.renesas.com>
 <2368e2c8-7f80-ec22-2c9f-4f719ab347dc@cogentembedded.com>
In-Reply-To: <2368e2c8-7f80-ec22-2c9f-4f719ab347dc@cogentembedded.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19c79505-7fe1-4107-2083-08d783b8b588
x-ms-traffictypediagnostic: OSBPR01MB1606:|OSBPR01MB1606:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB16069FFB37D493E3C269B023B8530@OSBPR01MB1606.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(189003)(199004)(51914003)(9686003)(44832011)(55016002)(54906003)(316002)(86362001)(110136005)(33656002)(52536014)(478600001)(2906002)(71200400001)(5660300002)(66446008)(4744005)(8676002)(81156014)(7696005)(66946007)(186003)(26005)(64756008)(66556008)(81166006)(53546011)(6506007)(4326008)(7416002)(66476007)(8936002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1606;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WZ8Zh6B02DAXitGv5IOtDqlY1o65prel8wKc54zg/6Kx8S+TewLVBE3NSAKtczllB085N5rPkDs51TohoV1qryFCKBONTLsaLqYdQJA7wwzZJzk1UM4I6u/t2y3ZIXt4Z2ZZVQj4p9jStbIrBBZ+e9aPunYMt/VZlwLrVZFGhNJefnjmJTRTrdlJu1zctoj7vM0pkkNNzGJ45gARp0sLA18bYXggWMc9GdPryygJ6mJGAwBRWM83YRYSqL7S4dgOyfvSDvQM3IiKxJyeUpV4LeTeHO1t3gpXzUUZEiRQ5w7J7Z/DvHeEaHSxNiKVAcfR5xBOcGHat2OYu2J7TIkld1ptFPY6vdvCPZHxaeQrPetfJ+q927Js/ixldQXcmDN2c7afkINP6TI0l0XOn0Fc5v1CupMR27ZHQhB6hbty4dSZrOkPpxgQrgJwSyM5dUOvc8/FtMyfaUFFiWODFzN2jIg9JHIdy/IJ9bONnObcH8zLo4m94qEm0QNOspuhNMoJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c79505-7fe1-4107-2083-08d783b8b588
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 12:49:23.3186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8jx6ngFfoP+t7kxMrbi7ettdLuUYexxU4lMgMqAXJBCyZUtY6wth5oNKeJyG35QT+ibmOW0/zCST1XEXuBcGXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1606
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBjbG9jazogcmVuZXNhczogY3BnLW1zc3I6IEZpeCB0aGUgdHlwbw0KPiANCj4gT24g
MTguMTIuMjAxOSAxNDowOSwgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IFRoaXMgcGF0Y2ggZml4
ZXMgdGhlIHR5cG8gJXMvcjhhNzc0YTEvcjhhNzc0YjEvLg0KPiA+DQo+ID4gRml4ZXM6IDEwMDAz
OTMgKCJkdC1iaW5kaW5nczogY2xvY2s6IHJlbmVzYXM6IGNwZy1tc3NyOiBEb2N1bWVudCByOGE3
NzRiMQ0KPiANCj4gICAgIFNIQTEgc2hvdWxkIGhhdmUgYXQgbGVhc3QgMTIgZGlnaXRzLg0KPiAN
Ck9rIHdpbGwgZG8uDQoNCj4gPiBiaW5kaW5nIikNCj4gDQo+ICAgICBBbmQgbmV2ZXIgYnJlYWsg
dXAgdGhlIHRhZyBsaW5lcyBwbGVhc2UuDQoNCkRvIHlvdSBtZWFuICwgIGRvIHRoZSBjaGFuZ2Vz
IGxpa2UgYmVsb3cgYW5kIGlnbm9yZSBjaGVjayBwYXRjaCB3YXJuaW5ncz8gSXMgaXQgYWNjZXB0
YWJsZSB0byBldmVyeW9uZT8NCg0KRml4ZXM6IDEwMDAzOTM4YTBjNjRjMmYwZDg5ICgiZHQtYmlu
ZGluZ3M6IGNsb2NrOiByZW5lc2FzOiBjcGctbXNzcjogRG9jdW1lbnQgcjhhNzc0YjEgYmluZGlu
ZyIpDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5j
b20+DQo+IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdlaQ0K
