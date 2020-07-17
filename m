Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3201223306
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 07:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgGQFoo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 01:44:44 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:6174
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725300AbgGQFon (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 01:44:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/qKEwKib4Kl6zTuSJF4gIN6jfzPocGyhtt5BKXXngK2IEUTtj6PwPsoP5+cbB1Z7o12oX8lFpP/zlY3RkqaZozyor4lr7UOHrtUux5D8rPFEAOV0BeajPLdCFhuQC1Br432Tybr8ZI0BUyDo4RlJZ0Jy/uwjpPVTLHwtLGw39q8Y3VY4uYx0Gjax2/weqxJTMYeXUk+qWCABNeVDHKQABXpJA30N94yKJMKP9n6chlmAbTiaxH5C0Uw8VrDok4PpmeCW1s3j8AX4TZM3+8FBHXcUMQ5dnB5+f2IW+Gz98NuoogJr6nwKVIvb8vCP1vIqs+MkhYH4VgyzBWCwYcfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pA4khmarcRyHbNUR8LVkoPJGxEucW1Ju/NKwn41CM4w=;
 b=AHjNFTMhwhn/AspbuSCu/vYcBnFq9DdM484LZPaEih2WvZdLJ9z/61wrVJYbw1qGYOXXOYgBAcTYzqr8K/Bs6gpbkgbACM+6AkaHleXOhbJt2vuEe7W2VYuhU3UZbYdx1x8WK80HlZNEOlSwDyGgLQd4GPQ4SSRi887ykUVXamJnJAjmqEBeG+x3S4J/8yBXkB78R8701TeiUY/hloFInml2ngXJuuGOzSrU5PWJUcYotSFZt7O3G0+Nky8NyrSnqRXsWkk+VP7Rv61nzzzfaYr5cm3FWnNnVkjArdfkdD086ic3vn0ppWMhoKXiWGnpxhJJ3LclYGY2ih52Prlg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pA4khmarcRyHbNUR8LVkoPJGxEucW1Ju/NKwn41CM4w=;
 b=GJN5IO0mqgReki9iG5LPYPME/zGsDsVK7TXF/9Nc3WzbZ5y1CVMqTvCeU5GfdzyaNMiLYuCVvH6o8P3frj2nDAyqu31YKUMkFFpCYgsXZWtCYVjdreImPVCEgoiaKFlN+KwjwSlVVDVZOXB6PDnomwSShcuOOOncVI5q3DslB1Y=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4544.jpnprd01.prod.outlook.com (2603:1096:404:129::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 05:44:40 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 05:44:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Topic: [PATCH] arm64: dts: renesas: add full-pwr-cycle-in-suspend into
 eMMC nodes
Thread-Index: AQHWVrImoipTHpQCfEOOGfl8yMfzBakIYI8AgALjfUA=
Date:   Fri, 17 Jul 2020 05:44:40 +0000
Message-ID: <TY2PR01MB3692CD5627D9848ADDA88BF0D87C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594382612-13664-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
In-Reply-To: <CAMuHMdVqFU538syZq2B=An-MA3zo3RT115JmvaVxyt5mb-Wvsg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 754cd02e-dc56-4dcf-41da-08d82a147fb1
x-ms-traffictypediagnostic: TYAPR01MB4544:
x-microsoft-antispam-prvs: <TYAPR01MB4544672A1B5FEE8C86A09F39D87C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I4VQASsp1m2tEmGYncB7h+pCNIN3TUD1UlB2OsdjQAh1HHrF2Ku5F7iybDfVGbq2VRgF8lOglttIOdg1pHJ63QDxKISN8lZSi2c00qE0sJMCaB/2GOfZi/WKVoXBO1afqydaofwCwyYK64n2ICfZwcq2kMGwuxUhIta88xDuhQ3slaafMYpiucXvZeoGCnNRVVQ+bCl4LUxTRuNYMUW1ueMYCdqrKIq3jJ/zeTBDiNNMCvSmhavQcD165+RqzadCxpVI8EgMxtdBjBuHQNC8zPIsAn7wFMJuDeOChOmTdZPMTNNjpowS5IQ3V6CjCFDE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(8936002)(7696005)(2906002)(83380400001)(186003)(33656002)(76116006)(66946007)(55016002)(4326008)(71200400001)(6506007)(55236004)(5660300002)(15650500001)(8676002)(53546011)(86362001)(9686003)(64756008)(66446008)(478600001)(6916009)(66556008)(66476007)(26005)(52536014)(54906003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 9uKVykW54KrPxWZU9ZQpcK4KXcscblMDfnwdgpK07/JwWcuYQqB+RjZfI1lXEzSP2BNJLqo8bR00sZoiiYGMvSGrekuZ5Gz3C3f6/gSkVBGZva5GT3svE5Kar4V966h7hfVnBelt2fF06UbbCW3xcePW6YFhyaIgeThAMFdn0fYIdrULxzsAEEqOI1lQ+mtNokYt+aHOXFSbcSSM/wmhikYPVRJDokG5ozBnCJgxo9IqZHDNCJhZ1TRgKN3YPAmJyoKSk4c0vRAp1LNRY1p6uhm5X4XBe+Ld9lQ/KADTqcgiJfPEHLWlDpZwjkNxGoQHPVg8S/lWiLVyg0zKHBmlopAdNZfxmZ5n86aVlhIrPXfLZX3JFuu7R2YqlappRE4uzNY9K194juYG3WGE+mERgbbI43StLaCuKVUbYeNt/uJpmHGiI+KYRJpzmYr99ZkDJe0m5mUe7Aj1LsK33n8hhcjPaL/AjrpbZFpF/YUniaGSvK1WrT0WkLQILFFgz+IF
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754cd02e-dc56-4dcf-41da-08d82a147fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 05:44:40.1161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +EXkcLJ7v1kz+gOvV2Z1WGDD4L8JYl0CkkI8BKTHi7kdIRg6MJTOMbJXv/xhHqI46BEadcpzqG18+5nE7iQCQKX5vhsyO7Xlakndb2woJo+3kmLH5qHHzkH1SSm6XAyT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4544
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBKdWx5IDE1LCAyMDIwIDY6MDUgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gRnJpLCBKdWwgMTAsIDIwMjAgYXQgMjowMyBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBmdWxsLXB3ci1j
eWNsZS1pbi1zdXNwZW5kIHByb3BlcnR5IHRvIGRvIGEgZ3JhY2VmdWwgc2h1dGRvd24gb2YNCj4g
PiB0aGUgZU1NQyBkZXZpY2UgaW4gc3lzdGVtIHN1c3BlbmQuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gaS5lLiB3aWxsIHF1ZXVl
IGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjkuDQoNClRoYW5rcyENCg0KPiA+ICBhcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAtZWJpc3UuZHRzICAgfCAxICsNCj4gPiAgYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3NhbHZhdG9yLWNvbW1vbi5kdHNpIHwgMSArDQo+IA0KPiBJ
IGFzc3VtZSB3ZSBuZWVkIHRoaXMgb24gb3RoZXIgYm9hcmRzLCB0b28/DQo+IEF0IGxlYXN0IFVM
Q0IgdXNlcyB0aGUgQkQ5NTcxIFBNSUMsIGFuZCBoYXMgYSBzaW1pbGFyIFBTQ0kgczJyYW0NCj4g
aW1wbGVtZW50YXRpb24gYXMgU2FsdmF0b3ItWChTKSBhbmQgRWJpc3UuDQoNCkkgdGhpbmsgc28u
IEFuZCwgSSBhbHNvIHRoaW4gVUxDQitLRiBzaG91bGQgbm90IGhhdmUgdGhpcyBiZWNhdXNlDQpp
dCBkb2Vzbid0IHN1cHBvcnQgU3VzcGVuZC10by1SQU0uIEJ1dCwgd2hhdCBkbyB5b3UgdGhpbms/
DQpKRllJLCBJIGNvdWxkIHN1Y2ggZW52aXJvbm1lbnQgaWYgSSBhZGRlZCB0aGUgcHJvcGVydHkg
aW50byB1bGNiLmR0c2kNCmFuZCBhZGRlZCAiL2RlbGV0ZS1wcm9wZXJ0eS8iIGludG8gdWxjYi1r
Zi5kdHNpLiANCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAt
LQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+
IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0K
