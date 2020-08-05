Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3693523C9DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Aug 2020 12:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgHEKVx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Aug 2020 06:21:53 -0400
Received: from mail-eopbgr1300134.outbound.protection.outlook.com ([40.107.130.134]:26006
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726841AbgHEKSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Aug 2020 06:18:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrN1XWm2iT/sXuGXWTel9MqyMTwkPrNUMvQNC4FN0Sd7L8G8ppOklsf38VVSjz3bQmnzY+5O1ibCGE1a8uBzxzJ33czNpBlmuEfpGteUO4DuVtvzyBbup3NrfopCqEx0B5tVPK6W4ykhkKhdmET9Hv/XOd4sw2KBC8C/mpeHvlaeki+YYoyQPEXBWzim1o/uvi2cC7Rh+FQCEI5WNNu+ngNl1DHS6RvA1zYTxt1ybBO2Couw0eP9xKsOQx6msbh0t2+T5HXhxBcAWEEqXEl6m24q1EL8Yd/Xx6EN2gRFJj29E89L+DOjwzFiTeFqsXE97R/a/EhcwVxuV9wCnvxaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqK0/LKq9WqkUe0HfWeKyZUFt70jUNa5xDfc85fDaUQ=;
 b=FI6jz/nRgDrE7ZzPntwUBjP1K5gOTH2B5sqCKdV3/U6aKr/WBZK7bgRiO8fqWi2li3hWhOyNNXmpeZCU+GdE7LwHKR1Y0HXYx9P0iCqZdKumhEZgr5unqlG3LNi3c7Bkv4yPVFP1kUeB/qni3fC/OigDO9cbFf3EHH3+p8TwPafayF0n1/tlM4ER9Uv4jfUsKToYWPKSv+Xv24UkTz6rJ48n8L+YhjIRpnOivH0JYimdDToNPUXksEDtg1Fj3mnumlkBc5FUa6ZEvRR9P9TKcHB3vHUkWfOkP8yFbAJTFVzw7pyS0j2q/Vbzu3WFkqcl+3w9MsEZTfLLdbScRGnyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqK0/LKq9WqkUe0HfWeKyZUFt70jUNa5xDfc85fDaUQ=;
 b=S4gpCkKS4kdnhVZTJ0qkQHHGTd0UbUU5VPrDMscw6LOvxEHM/7GKaY22hLM9+HCM/VK/0PdVjXh/KnLTY4ovY2K3XYeHBOrYEwzjgs14fopWPQFrOJ0iisf/FdHhIJKf9W9RvDP2y1SEsDK8po+dzjL2hLv8mEIsjth8CtjSgDg=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB3484.jpnprd01.prod.outlook.com
 (2603:1096:404:dc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Wed, 5 Aug
 2020 10:16:36 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 10:16:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] usb: typec: hd3ss3220: Use OF graph API to get the
 connector fwnode
Thread-Topic: [PATCH 3/5] usb: typec: hd3ss3220: Use OF graph API to get the
 connector fwnode
Thread-Index: AQHWaod/8WFhKYKduU6ansmJnYbIgakpQn4AgAAK6nA=
Date:   Wed, 5 Aug 2020 10:16:36 +0000
Message-ID: <TYBPR01MB5309F982DEA56623F406AF0D864B0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
 <20200804174828.8339-4-biju.das.jz@bp.renesas.com>
 <e401f3de-629c-f1e5-cd3f-9c870fe3b2c0@gmail.com>
In-Reply-To: <e401f3de-629c-f1e5-cd3f-9c870fe3b2c0@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [31.49.74.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 35ab43f0-ceb4-4476-9e5c-08d83928a297
x-ms-traffictypediagnostic: TY2PR01MB3484:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB34845373C097BB9A7ED4A7CE864B0@TY2PR01MB3484.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JdmvVwCqNaP8cKzZRv0GX4ATpby0bfQOeHNkBtFNgq7LjZW2EoGwGZVkhXKclCxu4D2pvf58YhxTRzP5Wc8HshrG+26KJPpuH0h9y+9XP0RuKIf6G/FK8Bv1RX2jAJp4xDHabdRuhCuVOKIhhmFd2CHXM24TzqZ6rG9Afr0uDQx7xYjOQ2p32iKZ5Uvidgj9Z+FbvNmHye6rlNsiF6JW+vjQtd3H+qgtDHVy0KMcK+kMtr/2RNycjaf8ZTcEzJajha0SI46/8F0u3XY3je6+Ut5zWth0OcvXRP91y8h5hgWPWPJnzKvG2HjjeTKZ4Xmp4SQwUxZl2uWbOiltNbkDqbjk/WuzqnCHdgqWhEya0nN20ToLc5Wg+OvKr46bVLn2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(8676002)(55016002)(2906002)(110136005)(316002)(7696005)(9686003)(54906003)(52536014)(5660300002)(33656002)(478600001)(71200400001)(8936002)(86362001)(4326008)(66476007)(26005)(6506007)(53546011)(64756008)(66446008)(66556008)(76116006)(66946007)(186003)(15583001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 0yYiLx/0rLswlBMLlSHmPQfdhGp8nDdbabcrv77vxNuRjC0bsJLk7JiKzpkq0bX7kWGZB9ZgcC+EBE8mQoVRw0hiFT+bCmQOxuDq7a6naoPWjW5R1cQVBPi0ZxsB4uT+JrgbbSWUdvurEU5rLHezJyQbB+Zt07rDUj3xqWnj1tN78SAmzmCQJsurXOAEAa3EKcNBYNeql3LIASbZs6D6q/ZdwMsmjA+RLFJJUUhlFiIamjYB1nx7pe2rOWEemwU7kgnNswIxj7ET1h6ZCktFQaI3Z5CLGAws5VsrKesvGaCQt4MgLC2URlvzgg6PFUQnKhy9eP0ZadaxqpjImmzjV9iTBeyjn4uBGqz+S1zNT+dqYmtpr9qGZEOgeChLI8RPpRACAbMLSvNwj/t/GolxHafLwdZv6H4lxkDtWRRfPQUfymj31IZaNds1GyqYwghidTTrRNpkltPJ3sabQqdVrWnPS8CNYH1+nyIOmX7D+CDYzNnE+huU4EDXdR03cTq9knElIlWWE1yfKqC6YiIvCeQaQWMxoRXOXbsPQOPZI87vm4C22RbI1+910b+S9Mx7mYp04mkkKQ9M0y1NPGqkbZB2B0wYuPpzPabiaPiybOcsiHVhSRbutLZeF9NVttX2unp4qvQ3AclI0sR9NlI9uA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ab43f0-ceb4-4476-9e5c-08d83928a297
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2020 10:16:36.1260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAVTSfysptJb1bZNEVngdbDPwIAD4TvU7cLn73Tg4OaNlAfF2wxAVonlpu5ZwqjW1+kHtQHuMOXkjnkEzPTuyJpI98calc3KEoLOi2osebw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3484
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDMvNV0gdXNiOiB0eXBlYzogaGQzc3MzMjIwOiBVc2UgT0YgZ3JhcGggQVBJIHRvIGdl
dCB0aGUNCj4gY29ubmVjdG9yIGZ3bm9kZQ0KPg0KPiBIZWxsbyENCj4NCj4gT24gMDQuMDguMjAy
MCAyMDo0OCwgQmlqdSBEYXMgd3JvdGU6DQo+DQo+ID4gU29tZSBwbGF0Zm9ybXMgaGF2ZSBvbmx5
IHN1cGVyIHNwZWVkIGRhdGEgYnVzIGNvbm5lY3RlZCB0byB0aGlzIGRldmljZQ0KPiA+IGFuZCBo
aWdoIHNwZWVkIGRhdGEgYnVzIGRpcmVjdGx5IGNvbm5lY3RlZCB0byB0aGUgU29DLiBJbiBzdWNo
DQo+ID4gcGxhdGZvcm1zIG1vZGVsbGluZyBjb25uZWN0b3IgYXMgYSBjaGlsZCBvZiB0aGlzIGRl
dmljZSBpcyBtYWtpbmcgaXQNCj4gPiBub24gY29tcGxhaW50DQo+DQo+ICAgICBDb21wbGlhbnQ/
IENvbXBsYWludCBpcyB3aGVuIHlvdSBjb21wbGFpbi4gOi0pDQoNCldpbGwgZml4IHRoaXMuDQoN
Cj4gPiB3aXRoIHVzYiBjb25uZWN0b3IgYmluZGluZ3MuIEJ5IG1vZGVsbGluZyBjb25uZWN0b3Ig
bm9kZSBhcyBzdGFuZGFsb25lDQo+ID4gZGV2aWNlIG5vZGUgYWxvbmcgd2l0aCB0aGlzIGRldmlj
ZSBhbmQgdGhlIFNvQyBkYXRhIGJ1cyB3aWxsIG1ha2UgaXQNCj4gPiBjb21wbGFpbnQgd2l0aCB1
c2IgY29ubmVjdG9yIGJpbmRpbmdzLg0KPg0KPiAgICAgRGl0dG8uDQoNClllcCwgV2lsbCBmaXgg
dGhpcy4NCg0KUmVnYXJkcywNCkJpanUNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBH
bWJILCBHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVy
IEdlc2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJh
c3NlIDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1l
cmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50
aWZpY2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjog
REUgMTQ5Nzg2NDcNCg==
