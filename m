Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34469C985B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 08:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfJCGjt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 02:39:49 -0400
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:58332
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725860AbfJCGjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 02:39:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnVhshgd0qmAPC3W5hWvmqs1F8nXC1GkARieV9BcS70v8WDkyiJhozBwj/9lLVCC8Yru8C/wTTle8WB4hkNAxBUlaZoNL9PBiAlP4rpH3wC0hsorlhYWM2s76QuFmxHLJhs89cYSHjh/O78tJ1oXXZ6y+6wZybeN478sK2hFDYC1HjS/J2lLDpHKF8T8pTBRvAtjDukbR4rttzMeGpsehewkcx5cwF387Mz1dW3a0K/IBp37Nze3nWd/NPUqVr6/xcfiU2fwa6Rvo1iK5nrYMod6ApZaRYrgaFJWHfAJCjE5NSvKngrisZI43RsDBnt+7ooDhJ9fswa3LxDdQLnDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HqbmNE45MJmY2RWnGqPjlYCHIT8ybUtLH5lozwZPZg=;
 b=CfqYZ/Q6QoVF22d82eqeUmrpPPQp8xHu0v+wQEFrK2cbi2kYRMAM77GtZlHkDpBFlxg78wQliPScOcnwA48NUy1wMgBc25BBwD73lHoVJ/FKQkNc1Fj0Hjw5qBn7TjD5xU5M7dh0y8kGUjs/rOPd254Q7o3vgFgk2nCvS1FNMN1PMpNHqXXYZoYkrM5MiGXQb7grNSz9Cg0Hb6KyrFSKEAucgzZf0CK4AkKVbHBHUddvGG2gbqr56vsbkMu0kJpqNle9d9TQOCyqX4A6U2TkLsaY15DkPkwtb/Rnh1uNJ/fb7LrJZWOupf5Kku09Z7iUsmB5kP8ds/RQstR7vlYGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HqbmNE45MJmY2RWnGqPjlYCHIT8ybUtLH5lozwZPZg=;
 b=ZyxN26xT8vrO+a3dJts60f0VqJGLmqA0mEMLOyrwHGRYeR3uKp3WQIngIkn5hh0cz+LDyHWIjWxSfABsfQ9BOxij7+v6EvTMYU4Rv4Gx9hsSfPdZoxtAaRlWMWQj9jWML2MrgExgrVjUDa4Sejt6d6AprGqTuWekST3zxeU5CTw=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1734.jpnprd01.prod.outlook.com (52.134.226.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Thu, 3 Oct 2019 06:39:45 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.022; Thu, 3 Oct 2019
 06:39:45 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT
 support
Thread-Topic: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT
 support
Thread-Index: AQHVchsy9YYAaMwKvEWMepy4B2mVP6dIXKcAgAAplGA=
Date:   Thu, 3 Oct 2019 06:39:45 +0000
Message-ID: <OSBPR01MB21036A4E612729D5C5709E7BB89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
 <df05997f-e9c5-d226-68cd-6f1274995688@linaro.org>
In-Reply-To: <df05997f-e9c5-d226-68cd-6f1274995688@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23d1cc66-f528-46bf-bd60-08d747cc7ae6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB1734:|OSBPR01MB1734:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1734A7549899DEF5B43F5289B89F0@OSBPR01MB1734.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(346002)(136003)(366004)(39850400004)(376002)(51914003)(199004)(189003)(66446008)(55016002)(3846002)(14454004)(86362001)(76116006)(66556008)(9686003)(4326008)(66476007)(64756008)(33656002)(478600001)(305945005)(7736002)(66066001)(6436002)(74316002)(6246003)(8936002)(8676002)(81156014)(81166006)(2906002)(11346002)(5660300002)(476003)(102836004)(7696005)(6116002)(486006)(71190400001)(76176011)(66946007)(44832011)(26005)(71200400001)(446003)(53546011)(110136005)(54906003)(229853002)(186003)(6506007)(99286004)(316002)(25786009)(52536014)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1734;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x27yBehwHgXSrbtA1te2P4sfWsU2iTfJtuFV6id+G+j9ELsfqVFXllSiMJ+M8PBtBSuMSfAk2MWHMXAvd/9ndOiR4iU3S76uo9/MDtyiK2ZR/5+Z7RsbFis5x4ffy2AvEvscjhKmqInLaKH+8j+Za7X5a+Vho0XIURj9Fkc9X0fcPNa8Z+HnOD1CYgslHmVlAppqot7KoyD1EPtEThDH/JEg3ispVJyzs2rVY7qkBHLxTMCA0TAyAJKyHrVa8jG24JVZ3C72tRNOPuGBkEc5B8bww97sOSb94h4d6wteegXBYN5ZhhiJueQ82R9EjtuGwPNYw6LmQYSfFLtB4bVtDC9ZNnUXX0FcJMuVNB1KKTGTRT7n+Z+BeHHWn1rNxXjeMplYIJhHESlUUiPKIBoZmJD2aefGOEOrTlL8EGa2jdk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d1cc66-f528-46bf-bd60-08d747cc7ae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 06:39:45.5897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mlPakkkh8JgtCDbgv9RSGyi+yB1NM8H5WhDhGgbM/mIF+ryfAIvMONdhs/8nbI0qQ4tYALYnBqNrb66jNdzRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1734
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgRGFuaWVsLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBkdC1iaW5kaW5nczogdGltZXI6IHJlbmVzYXMsIGNtdDogRG9jdW1lbnQgcjhhNzc0
YjENCj4gQ01UIHN1cHBvcnQNCj4gDQo+IE9uIDIzLzA5LzIwMTkgMTY6MjgsIEJpanUgRGFzIHdy
b3RlOg0KPiA+IERvY3VtZW50IFNvQyBzcGVjaWZpYyBiaW5kaW5ncyBmb3IgUlovRzJOIChyOGE3
NzRiMSkgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJw
LnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGltZXIvcmVuZXNhcyxjbXQudHh0IHwgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsY210LnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsY210LnR4dA0KPiA+IGluZGV4IGM1
MjIwYmMuLjdiMWY0NTQgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsY210LnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZW5lc2FzLGNtdC50eHQNCj4gPiBAQCAtMzIsNiAr
MzIsOCBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVzOg0KPiA+ICAgICAgLSAicmVuZXNhcyxyOGE3NzQ3
MC1jbXQxIiBmb3IgdGhlIDQ4LWJpdCBDTVQxIGRldmljZSBpbmNsdWRlZCBpbg0KPiByOGE3NzQ3
MC4NCj4gPiAgICAgIC0gInJlbmVzYXMscjhhNzc0YTEtY210MCIgZm9yIHRoZSAzMi1iaXQgQ01U
MCBkZXZpY2UgaW5jbHVkZWQgaW4NCj4gcjhhNzc0YTEuDQo+ID4gICAgICAtICJyZW5lc2FzLHI4
YTc3NGExLWNtdDEiIGZvciB0aGUgNDgtYml0IENNVDEgZGV2aWNlIGluY2x1ZGVkIGluDQo+IHI4
YTc3NGExLg0KPiA+ICsgICAgLSAicmVuZXNhcyxyOGE3NzRiMS1jbXQwIiBmb3IgdGhlIDMyLWJp
dCBDTVQwIGRldmljZSBpbmNsdWRlZCBpbg0KPiByOGE3NzRiMS4NCj4gPiArICAgIC0gInJlbmVz
YXMscjhhNzc0YjEtY210MSIgZm9yIHRoZSA0OC1iaXQgQ01UMSBkZXZpY2UgaW5jbHVkZWQgaW4N
Cj4gcjhhNzc0YjEuDQo+ID4gICAgICAtICJyZW5lc2FzLHI4YTc3NGMwLWNtdDAiIGZvciB0aGUg
MzItYml0IENNVDAgZGV2aWNlIGluY2x1ZGVkIGluDQo+IHI4YTc3NGMwLg0KPiA+ICAgICAgLSAi
cmVuZXNhcyxyOGE3NzRjMC1jbXQxIiBmb3IgdGhlIDQ4LWJpdCBDTVQxIGRldmljZSBpbmNsdWRl
ZCBpbg0KPiByOGE3NzRjMC4NCj4gPiAgICAgIC0gInJlbmVzYXMscjhhNzc5MC1jbXQwIiBmb3Ig
dGhlIDMyLWJpdCBDTVQwIGRldmljZSBpbmNsdWRlZCBpbiByOGE3NzkwLg0KPiA+DQo+IA0KPiBU
aGUgcGF0Y2ggZG9lcyBub3QgYXBwbHkgb24gdGlwL3RpbWVycw0KDQpPSy4gSSB3aWxsIHJlYmFz
ZSBvbiB0b3Agb2YgdGlwL3RpbWVycyBhbmQgd2lsbCBzZW5kIFYyLg0KDQpSZWdhcmRzLA0KQmlq
dQ0K
