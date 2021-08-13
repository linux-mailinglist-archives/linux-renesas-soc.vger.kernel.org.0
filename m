Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAAB3EB51D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 14:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239981AbhHMMRZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 08:17:25 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:57200
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229474AbhHMMRZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 08:17:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBxqvsnkznTEKfoI7D66JhHNKGz44bP6p7EC+xlrPW6x7gs/r3C93IlWV6BiTluoYxTcSZhoZuGKlazRN3A6rrzXa2ekAFBbzQ4M7L34Fdf3GE9gRdz18p6XZh7908+5sZmtxqPo5aF8PzzxYxny2ki7OuleSh7Ry1ee8fvrvtqV7pDK2Q8kQ04N7DLkRi5GWyGmo95osL4j55dpDn5+XQI6gpetnWkGtjHl9ehqBxKSpINAlmxYVIgTaTrrq0m0pVn95nSNRZXkD6y2jO1vjvb0B0D6r5Z1rSxwXB51RjBvLDFvXZr/vbctgE7lp+iSsSWraiw47kmjk08xNOy7xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzBBgv83tLiIHFnzHApY5v4MvyS/oQYxPE5pdyd/m3c=;
 b=fLVYAZ5ozItrwRG58hRqVagCj57P1WCX2TWkA5effYflKnaoDcAmeFGtLhCDIv3mRuc7yUePVWUggsskuaneA+jvS2IaIM0C8HwRzaZIF+YoJOEkLP0QkFUqaWsVYn1FZnATTEX5V6LpVJW6ESvNI7Om+pwD0xoY0c/i3l6ZRy3t3sERzB5zEHE2PLLuCdg9VXTEM0KhKwy/OnsSFcdbASJrsJvhYKQuT9Ua2tG2vpjuCuZ8hV5kMc8tqnJl8wvvBYggKzOb8701mjL7uV0IJEGvliz61hEsXSrjh5RHoF4oRLX/4pLZLWTiiasxD0OyOPrZnOJ7HDqwfAYkb4myOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzBBgv83tLiIHFnzHApY5v4MvyS/oQYxPE5pdyd/m3c=;
 b=A3ycwjL8L1mxXHh7YFzFcR5kAC7G5Qz7O9A/8fznmIMEfeqseO0Y+CytPPynWvOj5pV+WE+0YzjQW8+IP/2yCaEi/nFkCcSqRriKni+5BObpLfAevDe6uEXSH4wwN+zF9lNLeRLqfRmL9tnpw/cgQs7N+aQtZlYqSaAHg8yQs54=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3730.jpnprd01.prod.outlook.com (2603:1096:604:53::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 12:16:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 12:16:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to
 handle coupled clocks
Thread-Topic: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to
 handle coupled clocks
Thread-Index: AQHXgvI2g+77GqWYgE+LlXgC8Po5JatuLqGAgAFYXcCAABGoAIAB2EzA
Date:   Fri, 13 Aug 2021 12:16:54 +0000
Message-ID: <OS0PR01MB5922495A19B0CDDD50D525D486FA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
 <20210727141749.17783-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyiarunEWaQPyR+R+7RbMBXm-xaE1HpuyTwCcNymVS2g@mail.gmail.com>
 <OS0PR01MB5922E8535729D5AF997B33E986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUcvRzW0dsdsq7j2JWfu=64JzM9M=z=qvhUhDFwXHuwQQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUcvRzW0dsdsq7j2JWfu=64JzM9M=z=qvhUhDFwXHuwQQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff5ded55-50ae-4195-72e1-08d95e543d75
x-ms-traffictypediagnostic: OSAPR01MB3730:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB37308B39325DCA14EB2507A386FA9@OSAPR01MB3730.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6LZEvsuAgibxe7UMo8z2B42jbx88r2kSKFZH5U1Zl/xz1wWo8eVcbayQtuFROHT3z6341lUAoEmzn2bSmi66pXwHLGa2SiDLA0E5mmrC51BX/awMG8eU24AEG/gdxnONUmVv6mnJsIiyzgrgiZbNc++jmbpcd3S4H9d/vxHWyUUrBVN8gwkRjeKcZ9IutPokdC/OsfRFkGVJOWDZu20F58+JNwYb4WVyG1fcpNvL9k8ljx1igs62j3LX92iLGOpnsgjiLT/iFLX9vzcCEtNQyAUdSctkiI7iBt/xJVVSpPCy+fQECVdmHWXAikIjthiR+q081EEfJrjWwjqBv/YQSOdSPb54p8NJlOvQYHbdjo0TIYWCfcwlQilOKMpt6lcVdRtFlXkwTzLehjBYH60C0jArJzqXNucEooZW/wGQ0nBobdPVKtX4goIc2mpIC0swdHqcz0/FnYtm7VB8dsIgCxQLDENChKRMwiuDvSh7eRUtu/hg3MrFzyUO6wHeiK8XlFgJwbe9q0Xvy0VMBoBO7tyQvgsbfHe95K7tNxa8jwLr+2oC8u5kIM6gUh3c+Ghq9rQVT/yXvkGqJbui9I21Ie95YICp9LpSNws1qOP6/WMW7Z3tbWalRYcZT8mCgZGZw+WYCS4Sxl6q/N4WXT0f2btuf9nI11IjfeoK7HWyLHJD3Fq0O/JRWnqtiJ44xvQ9lrSQIrYKhha5rD04Tvzig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39850400004)(346002)(396003)(55016002)(5660300002)(316002)(26005)(83380400001)(66446008)(6916009)(64756008)(54906003)(2906002)(8936002)(8676002)(9686003)(186003)(478600001)(7696005)(53546011)(33656002)(107886003)(38100700002)(122000001)(71200400001)(6506007)(4326008)(76116006)(38070700005)(52536014)(66946007)(66556008)(66476007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWVKT0lTV01XRTluWVM2RnUwdHZYYlFhejFrdDFZMGpoVWFEZHZXRGNlek4x?=
 =?utf-8?B?QXFIdnE2ZkxqM1EycWhmZDg1eXgxd3N2VXkva3RPY1ZtWEpWanFJWFlNSW5t?=
 =?utf-8?B?cFhjZ2ZBT1lHTDJjUlJrVUoycmFZT3Z5SHFTTGVXVU9UcDJiS0FZTjZHcVpa?=
 =?utf-8?B?Z3A3YWhYQ1dqbXpPN1NrVWhjb01xOEFWUHFVeTl6a3hnWWhNMzFGZlFub21V?=
 =?utf-8?B?aWQ5WEljb01vdTFsM2JZdjZWM1dNRGpHQTdmTGRyRkRxeXdkUmNxT2ltdDZU?=
 =?utf-8?B?b0JKKzRUVlAzOWZIQ0FqRUNHRlZWdkw0TFY4S3FLZXZDaXp0V2hYRVc4WlVX?=
 =?utf-8?B?N3o3NUVSbk1SNVFkeWJwdnRPanZlYjRJclRpTnNVY3BLTTZHUGtGTTVmbnFv?=
 =?utf-8?B?RXJUbEpkeElHS1NQdktXTjdpSnRqQkplRGtzeS9NemJsRnNSbGt5VCt5ZlpQ?=
 =?utf-8?B?c0R0QUVDcXEyalF3cHdOM1N4Zkoxbm0rTlNxci9kWVlkdTFrS3JaTWNuVnRS?=
 =?utf-8?B?ZG9udVloa3BPcHU4dTk3c3ZkcERmZVFqNTZxdlV2UFFjUUdUNzBoU1FjdEtW?=
 =?utf-8?B?ZHQ3UklVMFFCWXFHRWxMU1gxWTE5b0xJVWF4bHpMeVVWOERlc2tDckk2K2Nr?=
 =?utf-8?B?TkRsdTh2cEtyR3VWVjlGZVdSd0plK0xaeDhDUktaZHc5YWRnbkYxRzVqK243?=
 =?utf-8?B?Vk1LR1FRKzYxV2g3Z09OaU5tMnhzRlh6WDh3dUpPTTBvUktrRjNpeXZBQkVT?=
 =?utf-8?B?blEwOGtXdCtTL3diek5IcS9YQjRXSG5uYmwrUVdxMFY5UWdJKzIvTUF6cFdu?=
 =?utf-8?B?eXRlL1B6bUQ0cVR5U1pUZVNFejkrYzU2TXUraXZMR0V1eUpzMDlBRndydVpH?=
 =?utf-8?B?aitUc3c0VUhIZUc0Q2dFMGswQkFnbmxHeHRzSm5WRDdaWlNTUnRqMDhyNkMr?=
 =?utf-8?B?Nk9BYlRLQjZ2WmRnblBaMDFJVjV2SWN2UTUvbldqYXJyYzdXZHdkRTZSRzdT?=
 =?utf-8?B?dERjRVBRYVd2UnBGMGhXdEhIb2NOOGJ2aVJkb3NFejZ5UmFoMzNlTUoydjRP?=
 =?utf-8?B?YzhnUS9LQnZyc3ljeEc4dXdjbmM1ZzBiVnhxc2VlQTlSemNNZWZ3U3AzMVA1?=
 =?utf-8?B?VEYra1ludVpBOHo1cEMyaVJEY2FrSzFwYjI1akxEcG92aTZYWkJyRityYjZP?=
 =?utf-8?B?Rll5akdDSE11aGNQdDR4dlM2akplMHlEYmFKL09sU2pnT2E2N0dEUjB5QnRm?=
 =?utf-8?B?WUJSS3dSY3Ntbk84YVZNSkFOdGU4YVNkcTVwWitVTWI0SGRleHRndFAvalZG?=
 =?utf-8?B?WFdhNmRCT2FmSFFienR3bFRYNnRRcW1wb2RVOGwxQWVNUjRWRCtzbTd1R0F3?=
 =?utf-8?B?RDZoK21DaCtCZ0xNSHc0ay8ya3VjQUw0UmQ2dXljNGttUmtwaWpTa0dnSk03?=
 =?utf-8?B?Qm5USXJLOHU2N2pycDBVWjl2aVJaVC9jcjdKTU5NWHo2bG1jbkU4dzRLMFUy?=
 =?utf-8?B?WnJmZThZUDBRdGxXaE90Rzh1MXl1eUlhN2hWU3hSM0dVaVJuM2o3eS8xZnhz?=
 =?utf-8?B?VXB5cGdaeEhxMFhqZEg2VlZpOTZxbGtkbkFEM0RDbVFraUF6ZTlSY2cxM3NJ?=
 =?utf-8?B?QmRYSkVtSlBoUnVMRWRxclVvWmM1OVNJa1BkUFlpcWZWUEpqc0FBWXZ2Y1Zq?=
 =?utf-8?B?UkhoUFBUc2ZrTGdlT3FrdzI3VEM1ZVFzMC9DcU93a0ZiY3lWSmx4QlRQaVNm?=
 =?utf-8?Q?emdibN0ihIvL3eAxNJEwLIFloDmO1UzntHCrw8/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5ded55-50ae-4195-72e1-08d95e543d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 12:16:54.9110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJqJdyj9d42ki/rbJm0ZUxquROEzmK6YOKc1J7sftXcjBYG0Lh8eQLuouR8z8OQBFmZN08BeMQQ9WEIWQOM7HkgBgUyGquu19jFm3/iBtdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3730
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy80XSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHJ6ZzJsLWNwZzogQWRkIHN1cHBv
cnQNCj4gdG8gaGFuZGxlIGNvdXBsZWQgY2xvY2tzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24g
VGh1LCBBdWcgMTIsIDIwMjEgYXQgOTowMCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzRdIGRy
aXZlcnM6IGNsazogcmVuZXNhczogcnpnMmwtY3BnOiBBZGQNCj4gPiA+IHN1cHBvcnQgdG8gaGFu
ZGxlIGNvdXBsZWQgY2xvY2tzIE9uIFR1ZSwgSnVsIDI3LCAyMDIxIGF0IDQ6MTggUE0NCj4gPiA+
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+
ID4gPiBUaGUgQVhJIGFuZCBDSEkgY2xvY2tzIHVzZSB0aGUgc2FtZSByZWdpc3RlciBiaXQgZm9y
IGNvbnRyb2xsaW5nDQo+ID4gPiA+IGNsb2NrIG91dHB1dC4gQWRkIGEgbmV3IGNsb2NrIHR5cGUg
Zm9yIGNvdXBsZWQgY2xvY2tzLCB3aGljaCBzZXRzDQo+ID4gPiA+IHRoZSBDUEdfQ0xLT05fRVRI
LkNMS1swMV1fT04gYml0IHdoZW4gYXQgbGVhc3Qgb25lIGNsb2NrIGlzDQo+ID4gPiA+IGVuYWJs
ZWQsIGFuZCBjbGVhcnMgdGhlIGJpdCBvbmx5IHdoZW4gYm90aCBjbG9ja3MgYXJlIGRpc2FibGVk
Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4g
PiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+
ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9j
bGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3J6ZzJsLWNwZy5jDQo+ID4gPiA+IEBAIC0zMzMsMTIgKzMzMywxNiBAQCByemcybF9jcGdfcmVn
aXN0ZXJfY29yZV9jbGsoY29uc3Qgc3RydWN0DQo+ID4gPiBjcGdfY29yZV9jbGsgKmNvcmUsDQo+
ID4gPiA+ICAgKiBAaHc6IGhhbmRsZSBiZXR3ZWVuIGNvbW1vbiBhbmQgaGFyZHdhcmUtc3BlY2lm
aWMgaW50ZXJmYWNlcw0KPiA+ID4gPiAgICogQG9mZjogcmVnaXN0ZXIgb2Zmc2V0DQo+ID4gPiA+
ICAgKiBAYml0OiBPTi9NT04gYml0DQo+ID4gPiA+ICsgKiBAaXNfY291cGxlZDogZmxhZyB0byBp
bmRpY2F0ZSBjb3VwbGVkIGNsb2NrDQo+ID4gPiA+ICsgKiBAb25fY250OiBPTiBjb3VudCBmb3Ig
Y291cGxlZCBjbG9ja3MNCj4gPiA+ID4gICAqIEBwcml2OiBDUEcvTVNUUCBwcml2YXRlIGRhdGEN
Cj4gPiA+ID4gICAqLw0KPiA+ID4gPiAgc3RydWN0IG1zdHBfY2xvY2sgew0KPiA+ID4gPiAgICAg
ICAgIHN0cnVjdCBjbGtfaHcgaHc7DQo+ID4gPiA+ICAgICAgICAgdTE2IG9mZjsNCj4gPiA+ID4g
ICAgICAgICB1OCBiaXQ7DQo+ID4gPiA+ICsgICAgICAgYm9vbCBpc19jb3VwbGVkOw0KPiA+ID4g
PiArICAgICAgIHU4IG9uX2NudDsNCj4gPiA+DQo+ID4gPiBXaGlsZSB1OCBpcyBwcm9iYWJseSBz
dWZmaWNpZW50LCB5b3UgbWF5IHdhbnQgdG8gdXNlIHVuc2lnbmVkIGludCwNCj4gPiA+IGFzIHRo
ZXJlIHdpbGwgYmUgYSBnYXAgYW55d2F5IGR1ZSB0byBhbGlnbm1lbnQgcnVsZXMuDQo+ID4gPg0K
PiA+ID4gPiAgICAgICAgIHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdjsgIH07DQo+ID4gPiA+
DQo+ID4gPiA+IEBAIC0zOTIsMTEgKzM5NiwzNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX21vZF9jbG9j
a19lbmRpc2FibGUoc3RydWN0DQo+ID4gPiA+IGNsa19odyAqaHcsIGJvb2wgZW5hYmxlKQ0KPiA+
ID4gPg0KPiA+ID4gPiAgc3RhdGljIGludCByemcybF9tb2RfY2xvY2tfZW5hYmxlKHN0cnVjdCBj
bGtfaHcgKmh3KSAgew0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBtc3RwX2Nsb2NrICpjbG9jayA9
IHRvX21vZF9jbG9jayhodyk7DQo+ID4gPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2
ICpwcml2ID0gY2xvY2stPnByaXY7DQo+ID4gPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZwcml2LT5y
bXdfbG9jaywgZmxhZ3MpOw0KPiA+ID4gPiArICAgICAgIGNsb2NrLT5vbl9jbnQrKzsNCj4gPiA+
ID4gKyAgICAgICBpZiAoY2xvY2stPmlzX2NvdXBsZWQgJiYgY2xvY2stPm9uX2NudCA+IDEpIHsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnByaXYtPnJt
d19sb2NrLCBmbGFncyk7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gMTsNCj4gPiA+
ID4gKyAgICAgICB9DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZwcml2LT5ybXdfbG9jaywgZmxhZ3MpOw0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgeW91
IGNhbiBhdm9pZCB0YWtpbmcgdGhlIHNwaW5sb2NrIGFuZCB0b3VjaGluZyB0aGUgY291bnRlcg0K
PiA+ID4gaWYgdGhlIGlzX2NvdXBsZWQgZmxhZyBpcyBub3Qgc2V0Lg0KPiA+DQo+ID4gT0suDQo+
ID4NCj4gPiA+DQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgICAgICByZXR1cm4gcnpnMmxfbW9kX2Ns
b2NrX2VuZGlzYWJsZShodywgdHJ1ZSk7ICB9DQo+ID4gPg0KPiA+ID4gSG93ZXZlciwgSSdtIHdv
bmRlcmluZyBob3cgdGhpcyBjYW4gd29yaz8NCj4gPiA+DQo+ID4gPiAgICAgICBERUZfQ09VUExF
RCgiZXRoMF9heGkiLCBSOUEwN0cwNDRfRVRIMF9DTEtfQVhJLA0KPiBSOUEwN0cwNDRfQ0xLX00w
LA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg1N2MsIDApLA0KPiA+ID4g
ICAgICAgREVGX0NPVVBMRUQoImV0aDBfY2hpIiwgUjlBMDdHMDQ0X0VUSDBfQ0xLX0NISSwNCj4g
UjlBMDdHMDQ0X0NMS19aVCwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4
NTdjLCAwKSwNCj4gPiA+DQo+ID4gPiBUaGlzIHdpbGwgY3JlYXRlIDIgaW5kZXBlbmRlbnQgY2xv
Y2tzLCBlYWNoIHdpdGggdGhlaXIgb3duDQo+ID4gPiBtc3RwX2Nsb2NrIHN0cnVjdHVyZSB0aGF0
IGhhcyB0aGUgaXNfY291cGxlZCBmbGFnIHNldC4gIEhlbmNlIGVhY2gNCj4gPiA+IGNsb2NrIGhh
cyBpdHMgb3duIGNvdW50ZXIuIFNob3VsZG4ndCB0aGUgY291bnRlciBiZSBzaGFyZWQ/DQo+ID4g
PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPiA+DQo+ID4gT29wcy4gWW91IGFyZSBjb3JyZWN0
LiBJIG5lZWQgdG8gYWRkIHRoaXMgY291bnRlciB0byBwcml2IGluc3RlYWQgb2YNCj4gbXN0cF9j
bG9ja3MuDQo+IA0KPiBPbiBzZWNvbmQgdGhvdWdodCwgYSBjb3VudGVyIGlzIG92ZXJraWxsLiBB
IHNpbXBsZSBmbGFnIHNob3VsZCBiZQ0KPiBzdWZmaWNpZW50LCBhcyB0aGUgY2xrIGNvcmUgb25s
eSBjYWxscyAue2VuLGRpc31hYmxlKCkgd2hlbiB0aGUgY2xvY2sgaXMNCj4ge2Rpcyxlbn1lbmFi
bGVkLg0KDQpKdXN0IHRvIGNsYXJpZnksIHNpbXBsZSBmbGFnLCBkaWQgeW91IG1lYW4gdG8gdXNl
IGJpdCBmbGFnPyAoaWUsIDIgYml0cyAsIHNpbmNlIHdlIGhhdmUgMiBtb2R1bGUgY2xvY2tzKQ0K
d2hlbiBjb3JlIGNsb2NrIGNhbGxzIGVuYWJsZSwgc2V0IGEgYml0IGFuZCByZXNldCB0aGUgYml0
IGR1cmluZyBkaXNhYmxlLg0KDQpUaGVuIGJhc2VkIG9uIHRoZSAyYml0cywgZWl0aGVyIHR1cm4g
b24vb2ZmIGNsb2NrIG9yIGp1c3QgcmV0dXJuIHRoZSBzdGF0dXMuDQoNClBsZWFzZSBjb3JyZWN0
IG1lLCBpZiBteSB1bmRlcnN0YW5kaW5nIHdyb25nPw0KDQpDaGVlcnMsDQpCaWp1IA0KDQoNCg==
