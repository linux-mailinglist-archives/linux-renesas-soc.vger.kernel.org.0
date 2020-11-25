Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80092C4521
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 17:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbgKYQ0Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 11:26:25 -0500
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:35648
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731031AbgKYQ0Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 11:26:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtykcJZ0ZVXMF/AtzkQWJXINazDJTdA01PH/l3fz1Eb5o9PSsIH4LWp0OD8LapkEnezqyJbHwh2zNlKk7xdX8NBA70P2zL8CAt/e15Kb5M0vN4BLqCpAOy4f25Bw5YKRecSDA4W3eF4uG7xQEIKAKflEMHf6YOZAA2wNXiXsL4pKAufvvvF1jMywWLqbq/cQjmMqXfynbCIxhZ5WZkpYIrkGqw3Mxmy0RZty13Dk6WFJslcXMcPBA26rpDsuGpQI+WBSqGtYSLMTsgXpF1kFDvq5dg6ssg9zHKcDVDPQFP7ZUD3MqChHnjFKjWovT+Ipsl9hZbmPKsmzd/lA9OiwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r19F5ipJuw3ljUktizs6QwLfUD6hwUcz5s98yJUGImo=;
 b=Yc7Y4x2SodL7v9q60QYjv97qOpV/wpjGIjFw8suMgDEYvUokj23RjOn6ePrQJ6kTVfn0CdaBjkfJsX49TMllCpA8ZFkmf33FjC5yF7LeLCy3/32ie/VoIzzh8GLLPJ4BDHOnFpp/snknOvjjjs2+PZMyDKcGtYu4e/tkdNErad3+t8ZEXdZU7b2pv4qeoz0er/I/8mMRJbEiwSGFOpNeoxQwm+ux4AgaiccPS7qPD5Lh+qDkC7ZhFJ7APw9l+hMNMMsg0RO6kqRfL4hlLwa2IW2lQjpUvNo2yfG6rVQ/5E9HT90vzPdOw9aZAX54o2kx4wtEShjlyw5B8s4Q9RQ1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r19F5ipJuw3ljUktizs6QwLfUD6hwUcz5s98yJUGImo=;
 b=nmGZ3WBLGzxKrnAOmFmcfRiT4ItBYVNxDPFEzZW+ou6WXeWRf9B1rkj9lEyL0NYADjICG96DSbfEVSs3F/bxW1OFPwhx/3guy2v3snQ5LMQb089Ub7AUuQgXZ9TaP8HnpA6QyU8Px4hyAeI5EyDXXjt6rpgwGRJhpDagIyRqB1g=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Wed, 25 Nov
 2020 16:26:20 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3589.025; Wed, 25 Nov 2020
 16:26:20 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725
 sensors
Thread-Topic: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725
 sensors
Thread-Index: AQHWwysoRoslK653N06JhtGRRchoxqnZB3+AgAAA85A=
Date:   Wed, 25 Nov 2020 16:26:20 +0000
Message-ID: <OSBPR01MB504858A417137ED7AC31F925AAFA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX+FZjAfbWWw53EToHP6c4JFmQX9wogAyW3OcOxHgMd0w@mail.gmail.com>
In-Reply-To: <CAMuHMdX+FZjAfbWWw53EToHP6c4JFmQX9wogAyW3OcOxHgMd0w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c6467157-6d5d-4bf9-dfd4-08d8915ed7e9
x-ms-traffictypediagnostic: OSBPR01MB5048:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB5048E299A390DB0DD3B41D14AAFA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CdIcfhrCsKehlptModr2PLRVOiVNZZaByt3teE0MlPrjDzsqoqewbVuEoKrfuBp8ecq2XVFhTnwjV45552c/i30zS6WqSwPbTXyN0vOzV/GkakoDrt30iMCO5bXr9kDR8QA/cANXnPyZ49LO3jOrCT+aIuSDxOZ+NnO0LT2Xg/lv8DKQraaHFEIC00KG0MUOztOfW4RDAnKDZ9e1xeEW5i5pvLhrgl6YI9dJmxF0svePllTwFlks6D4SyhmH/eiaYlw7j8Zep4l34YmBfTAGXBs3EoAntR8r1BpnvXUXIZ54OO+UK6TwJs40q//dJhULCiYm5shlH7G66Eqz5MFqaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(2906002)(54906003)(186003)(86362001)(83380400001)(6916009)(66476007)(9686003)(8676002)(53546011)(316002)(26005)(55016002)(66556008)(76116006)(66946007)(66446008)(52536014)(64756008)(8936002)(478600001)(33656002)(4326008)(71200400001)(6506007)(5660300002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: S1pxKkLhcI9ZimtjVodFzBgvQINUzNu1lcLfwocdxxudvIJRnRAOLiF3+NeyaMJhy+vWG0tRzPB9YeEbEiCr90NFRr5eQZhBJKGvroW2I8TW8lfgI8NhmUmz95uD5J7+hjRTZFVJtUl/jSM+b2isww8cu9mqMHrYQ4cUINdZ2R2BqKDFvhGnQ2yk9HnHtWFPVnMD7kUdd7kk5k7cYRsxZQgaWNTVfJnbq6b3mvLivNFV6921TZyJqV+dYq5fai35ahgMmZrs0k8OFgYe2tC8GbS20p3OOq9UAZqflgkgqrYEk69ZWqETi7cEd3QZWUirwFzUNnjF/Py+3TmceAltfOoSHGAUxoKTO4bfJt3njdLeybrK+pEu60TZ9KNbwRSJR3nuGe84wlx1NHPx829YRiZCw/fkZYUfaT6qEYx03kkYzaZJBzmm4kv0P5Auv22cawLlkKkaeNrGGXWZQ42Dbmuv0FSqmnbdJICVWutwX2N7r+av3qYM2WTtZ383fUZP6bHQvLPGxiuTW0MESDtJE9uVFExrbVI2qtFT2tOkmdaQ86aytDUq+LyoVGlH0zIRt8YbuoIi3KNHGGeh68xQpiB9h+l2fRj15idlLSiOLybUJcr4inoHwK4muBf5AA7mMRUlpxNx4ilDfagqA5IBeodBLV4Nh3CMeAnOnOZIkOX0PevZ3mAxxGkYRYDOU4CzqVFYf9uPA1LHrD24OV7usukIzTpMJ+JvNeDzv6VcR49rp8S+B2TCbITh2wT5Pj9F33EZhJb6Yo+L1lOi1ShYRnlIjSag748qMEvc1PSNVCC5K67y6a1kvzbJ0IlepFWpTlJ1vQGFV8pLH4KtU3rqcukiajkyrRKUYKzXLA4Sys3GfBaUU8BX163geRGT4JgqpoMVUQwI7Fj7IQXH5LqkEA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6467157-6d5d-4bf9-dfd4-08d8915ed7e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 16:26:20.6268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v9HowmHorNLlHwrBpJz8adctSvYdvPxNp64O5+koPYGsXfomIiZuKxwy4AYXs3RQAGHMiwneFR48wIgGwEL9X0d4dEuBxdAfh43SJvBlJALBT8I2Nr+Q9LidRkbrmauw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5048
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjUgTm92ZW1iZXIg
MjAyMCAxNjoyMQ0KPiBUbzogUHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRl
di1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1A
Z21haWwuY29tPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IExpbnV4LVJlbmVz
YXMgPGxpbnV4LQ0KPiByZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3Q6T1BF
TiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVEIERFVklDRSBUUkVFIEJJTkRJTkdTDQo+IDxkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+OyBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyIDAvMl0gcjhhNzc0Mi1pd2cyMWQtcTctZGJjbTogQWRkIHN1cHBvcnQg
Zm9yIG92NzcyNSBzZW5zb3JzDQo+IA0KPiBIaSBQcmFiaGFrYXIsDQo+IA0KPiBPbiBXZWQsIE5v
diAyNSwgMjAyMCBhdCAyOjAyIFBNIExhZCBQcmFiaGFrYXINCj4gPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBzZXQgZW5hYmxl
cyB0byBjb25uZWN0IG92NzcyNSBzZW5zb3JzIG9uIGlXYXZlLVJaL0cxSCBRc2V2ZW4NCj4gPiBi
b2FyZC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBzZXJpZXMhDQo+IA0KPiBEbyB5b3UgdGhpbmsg
aXQncyBhIHZhbGlkIHVzZSBjYXNlIHRvIG1peCBhbmQgbWF0Y2ggb3Y1NjQwIGFuZCBvdjc3MjUN
Cj4gY2FtZXJhcz8gRS5nLiBjb25uZWN0IHR3byBvZiBlYWNoPw0KPg0KWWVzIHRoYXQgaXMgdmFs
aWQgY2FzZSB0byBtaXggYW5kIG1hdGNoLiBEbyB5b3Ugd2FudCBtZSB0byBtYWtlIGl0IGNvbmZp
Z3VyYWJsZSB0b28gPw0KDQpDaGVlcnMsDQpQcmFiaGFrYXINCg0KPiBPciBzaG91bGQgYWxsIGZv
dXIgY2FtZXJhcyBiZSBvZiB0aGUgc2FtZSB0eXBlPw0KPg0KPiBHcntvZXRqZSxlZXRpbmd9cywN
Cj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRh
bGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5n
IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcw0K
