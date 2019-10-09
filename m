Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E61D0F7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 15:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbfJINBY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 09:01:24 -0400
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:6174
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730901AbfJINBY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 09:01:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsCDPVybq+sZpSNZElW7Yws+t8ySZhVY61/wFGlyxmemSa6JpqEO+CvVZ6RcQTqvh38IWQqxpnP3l3uAw0X/YquPaxbMuTArQ/VxggmxH7TtCYOMdqI4Emv8rMpcT3yTTEUuYPIGTprymWQReBJXeYSEdcTsjyh/r0CoEx+jP33eOAalIxLtBEGCyFwAjB95WN7dLE157fAEOWYECqcXQ7azSc1HT4tZlxU9zRjR/ZWBCURMkWuLVJyXz2J+UchXcTKZNzMnXR468S8CZQ/YGCe9X0rknGYjw16FYY1q1/C3x9CFe86sEkqp7YaHmGR6pWX7SFdqM8GtYp0sk77B0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9nX7WpcueoehtWL7YqPM9OH6wUFWJCfa4rCoSHma9I=;
 b=U11LOU6s2H65/NqvVHBaXzKqkIIYu2d5wAMQurs23CP9zyM61BoOrvhpMxQLOIMYL8eKpc3hJd8xPcIStlWtSRtIuPz5TUWWvqba+nUjCA44kYfhOiG39JmK13BFtO8Os83m7eF7riZ3l3MJgcCmdJ0tHjuDl+cewXAqwqHoBP5fpF9TyUb6L3S2b2KjdNMYIGYYDExv6f8wNz3HHz8JoQKY0E6jkhm/ehUHh/4qpWweVSTMN4oaJYJvjvkzvk2lj44rtootyY+dH7rmX0QvX/mm/WnYf9g5SjLZgy0ZbT+6Lj6CVgJ9nTjzU8kf8v7Q7WTar6IjKAIyEdY3BKzNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9nX7WpcueoehtWL7YqPM9OH6wUFWJCfa4rCoSHma9I=;
 b=Oq30GggpdQ06mi2MhYL+MDzklU9mvy8S16CkWkOQP0I/U/ZRaHBeJN4D/3OT5TGgTT8CmzKpSPrPC2yIEusAJbZmeI7Vilv5bQlqcwukEj0Cq7YQCt+a9D989EZX312pYwJmpzhaWb96opsNIembenqvOgsLv9gVt8jHK+pkGjc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4759.jpnprd01.prod.outlook.com (20.179.182.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 13:01:20 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::dc33:9b1f:4522:550e%3]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 13:01:20 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
CC:     Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Topic: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Thread-Index: AQHVC+tiLLGvXBZAYUqFmAoy3pT9cqZ1Lr4AgND+19CADPwJgIAAAW7w
Date:   Wed, 9 Oct 2019 13:01:20 +0000
Message-ID: <OSBPR01MB210328C4D1CB0573B689888DB8950@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
 <OSAPR01MB30894A7D5FE7983ED0D6E5B5D8070@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <OSBPR01MB2103A204D26A26D5C8E35F3DB89D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <8ecdceea-a698-7f6a-7a33-4684b9e139c6@ti.com>
In-Reply-To: <8ecdceea-a698-7f6a-7a33-4684b9e139c6@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb131b08-ce15-4ecd-a94b-08d74cb8c7b7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB4759:|OSBPR01MB4759:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB47597802F6AEFA68779DABEFB8950@OSBPR01MB4759.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:334;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(51914003)(199004)(189003)(13464003)(6306002)(53546011)(76176011)(316002)(4326008)(99286004)(6506007)(14454004)(33656002)(6916009)(6246003)(6436002)(107886003)(9686003)(7696005)(64756008)(229853002)(76116006)(66556008)(66446008)(66476007)(55016002)(66946007)(52536014)(66066001)(71190400001)(71200400001)(5660300002)(476003)(11346002)(8936002)(486006)(446003)(25786009)(81166006)(81156014)(44832011)(8676002)(2906002)(3846002)(6116002)(86362001)(186003)(305945005)(7736002)(74316002)(54906003)(256004)(14444005)(26005)(102836004)(966005)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4759;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cDXQkQsziBVHAghiWE/kJWW6z8OuCefC3DvawZJQ1MTw6c8KQi4p24f2VcOkNBxbw3Qi2jYo2wnRUJ1gKi4QQF2vOSKF3uCXFXHejyz/ls3fTUgEiSwFbsqxkxfelO4UZ7NDN6YgyyCe5cpbRW64VojHmSUUuE1GTJgmTN3o2/bZOsR44QTOFfRJpghnZoFAA126+f5zBosTgkoOZm8FbcgPZVAFjT6Sfds3Hk1eJzRokfAlxB07BkDjFARv1ZsTwjIIlHleMEIIuSE2Rz6uc/Ky2BxtO6RCazBq0+F1DeN26xOov6wlZ6NaAKoP62ls08xX4BPV1Qmc0ehrytqkJ4zYmknRD8NIYEIi280cJYZ1WpYotPybt9SvBekyjZq21ojAml198GP/RmeeTzGLy1S/BD/lysbKdFzbv4CRlkNojAhkTnJh3CDHUpFcZb1LtlvuUv80KvNId077cEA8Rw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb131b08-ce15-4ecd-a94b-08d74cb8c7b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 13:01:20.2931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+CEn0hm1wmzfkk/JL2r75tmqy0IDEP2jCfuG18yQ1A0whfrFpb8CnnAtTS5Uv6DFIO+Pb/vW9aAKXbpsc2DmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4759
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS2lzaG9uLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjaw0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5j
b20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciA5LCAyMDE5IDE6NTUgUE0NCj4gVG86IEJp
anUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IFNpbW9uIEhvcm1hbiA8aG9y
bXMrcmVuZXNhc0B2ZXJnZS5uZXQuYXU+OyBXb2xmcmFtIFNhbmcNCj4gPHdzYStyZW5lc2FzQHNh
bmctZW5naW5lZXJpbmcuY29tPjsgU2ltb24gSG9ybWFuDQo+IDxob3Jtc0B2ZXJnZS5uZXQuYXU+
OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsNCj4gQ2hyaXMg
UGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT47IEZhYnJpemlvIENhc3Rybw0K
PiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPjsgbGludXgtcmVuZXNhcy1zb2NAdmdl
ci5rZXJuZWwub3JnOw0KPiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHBoeTogcmVuZXNhczogcGh5
LXJjYXItZ2VuMjogRml4IHRoZSBhcnJheSBvZmYgYnkgb25lDQo+IHdhcm5pbmcNCj4gDQo+IEhp
IEJpanUsDQo+IA0KPiBPbiAwMS8xMC8xOSAxMjowOSBQTSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4g
SGVsbG8gS2lzaG9uLA0KPiA+DQo+ID4gQXJlIHlvdSBoYXBweSB3aXRoIHRoaXMgcGF0Y2g/IFBs
ZWFzZSBsZXQgbWUga25vdy4NCj4gPg0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTA5NDY2MDEvDQo+IA0KPiANCj4gQ2FuIHlvdSByZXNlbmQgdGhlIHBhdGNoIHdpdGgg
dGhlIHVwZGF0ZWQgdGFncyBwbGVhc2U/DQo+IA0KDQpZZXMuIFdpbGwgZG8NCg0KUmVnYXJkcywN
CkJpanUNCg0KPiA+DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IEJpanUNCj4gPg0KPiA+PiBTdWJq
ZWN0OiBSRTogW1BBVENIIHYyXSBwaHk6IHJlbmVzYXM6IHBoeS1yY2FyLWdlbjI6IEZpeCB0aGUg
YXJyYXkNCj4gPj4gb2ZmIGJ5IG9uZSB3YXJuaW5nDQo+ID4+DQo+ID4+IEhpIEJpanUtc2FuLA0K
PiA+Pg0KPiA+Pj4gRnJvbTogQmlqdSBEYXMsIFNlbnQ6IFRodXJzZGF5LCBNYXkgMTYsIDIwMTkg
MTA6MjIgUE0NCj4gPj4+DQo+ID4+PiBGaXggdGhlIGJlbG93IHNtYXRjaCB3YXJuaW5nIGJ5IGFk
ZGluZyB2YXJpYWJsZSBjaGVjayByYXRoZXIgdGhhbg0KPiA+Pj4gdGhlIGhhcmRjb2RlZCB2YWx1
ZS4NCj4gPj4+IHdhcm46IGFycmF5IG9mZiBieSBvbmU/ICdkYXRhLT5zZWxlY3RfdmFsdWVbY2hh
bm5lbF9udW1dJw0KPiA+Pj4NCj4gPj4+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4+PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPj4NCj4gPj4gVGhhbmsgeW91IGZvciB0
aGUgcGF0Y2ghDQo+ID4+DQo+ID4+IFJldmlld2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4+DQo+ID4+IEJlc3QgcmVnYXJkcywN
Cj4gPj4gWW9zaGloaXJvIFNoaW1vZGENCj4gPg0K
