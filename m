Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6A82CD591
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 13:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387750AbgLCMfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 07:35:37 -0500
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:61856
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728493AbgLCMfh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 07:35:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cx4faSDlby05MBFIAkcaqK+LKnaCor/AwhtbkiCxLQDntBnB4ifBEkfQoWo9WvB6AKD3dwTnnqM7vweyjZ/Kf/nS7tjkgAVQcVCvGTACvWyDznodVuIyB+m5xmVxCGSparyGoa3W9TNEZoXT4kFGKqwzWG2KQT0tjAB3rRZRiNlYteUqeeWQ14rxxzJgeTq3rRm2vRvj9KJp9zkm8b2G6YBXcnuqYymDcjvUyitlmshGltVs7fpci0yak/S4azAd64pPAOUQZ+72r9E7fLXv2i4rwDTnHS1vBM0WO81IVbq8KX+cDfO951Ldseb3ondhCILu6a5A9sfC1PBOBEOq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZG7Aua+THbt1q0ut4xKKo4kcV/n9g+vVPN4kUB1eD8=;
 b=mPRcJSngtGcPO5lfbb8Ovn9ZxJheEyX2p1YKwDnfVcfDftxeGwiflhdWficOZk8+cNTQvFW3MMsQOW/JQvEK9mFMZ4BiJxWZyjHAhVDZ6Ixd83mEqUEjvml42kE+zS0kJcxYCvLZFST0P7cdEQVDic7TFlZUfZT/PkUrOfD73r/x5HNqCWx1nTq7+WUZhVWkt+GKDf+BkimCdJvvH6VshNTZoqJqmAVlHXQpW3cphmgxxv3fXm+zHL6XURX/6d1jmHgrfHPhjeSaY2I1YCRdZE80hhMMT4Z6LhXf1WGLzrLzDXIVpwLt72+//oWMIu9vu+6LcNj3/auo4hxaimD8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZG7Aua+THbt1q0ut4xKKo4kcV/n9g+vVPN4kUB1eD8=;
 b=sUfDwct0d4guWYk380OdZTrPoI49iwR0ey6/YUhe6GTCUQGkkqygzhn4anWtiOHjYyDpzNNs3RDv0GSUBItuVMqNp6FPeLaT1vShOzbP6HuATOIZxWqXiO1OIGF+BD9PXABxmaXyfYB3TScW8dPe1XOTWwLgbD7JYJDXHJm9vNI=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSBPR01MB1942.jpnprd01.prod.outlook.com (2603:1096:603:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 12:34:46 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3632.019; Thu, 3 Dec 2020
 12:34:46 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
Thread-Topic: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
Thread-Index: AQHWxCgBjTTksS/Um0C69sgTmeAq46nlOYQAgAAC8gCAABKX8A==
Date:   Thu, 3 Dec 2020 12:34:46 +0000
Message-ID: <OSBPR01MB50487007A05AEC0EBB1B4A70AAF20@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vjTQv7wrdJFe6TS3saUE=Sj6ty0JSz0VZUd=TyDVfp4Q@mail.gmail.com>
 <CAMuHMdUHujqMnCKH14GM1SzN+3_E4j9u1R8uDuM3YmVjcd_MTw@mail.gmail.com>
In-Reply-To: <CAMuHMdUHujqMnCKH14GM1SzN+3_E4j9u1R8uDuM3YmVjcd_MTw@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 8fc28782-8a2d-4b77-da14-08d89787d1b6
x-ms-traffictypediagnostic: OSBPR01MB1942:
x-microsoft-antispam-prvs: <OSBPR01MB1942FE3D727E92B5807DFD34AAF20@OSBPR01MB1942.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uE52U32GCUDkJ4VXTfIycV3LU3FHT8CH14VRjJq7wsbQGN9CgbFyYOglGzr7ncq3cgXSFCAoVJLs9yiHfJLGJ2Fcqs+Fa177f1IOAahEjJXvt21dB6pMDkLwc92erosBgG2/yjck7MBcrL+ZyAQFu/7z8S4qfNtkiW7FZ+e4/CpQ86gmROPdI/Q8EDdpxpwO5JHUYd5qTPjBttjH/8GJJg+22gPF7TRrBnxkc6KCIPqfNiGdCnaK4Bpmz/pUMn4HDdiIPGd8HGSTk7bisXy+J3LiAU9KYeoJ+MJtrGiHto2fFMk4ypnq2DB3kqsuhtljdHA71PLeSU9BrhUkoggeag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(53546011)(26005)(7416002)(54906003)(52536014)(478600001)(86362001)(110136005)(5660300002)(6506007)(83380400001)(7696005)(4326008)(8676002)(66446008)(55016002)(64756008)(9686003)(33656002)(8936002)(186003)(2906002)(76116006)(71200400001)(316002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bkpxczI1Y3Z5L3Y0bmxla2p2Smd0b284bERwK1M5YWtXbURHZy9sS1NtVm1x?=
 =?utf-8?B?ZG53YlRyQm4rQ1NvTmtFTzdUMDg2K2NUdWM5SHBkckpqcm5lbFh5UE9Wd3BY?=
 =?utf-8?B?ZmpWb0pqYkhBSWU1Y0phSWhpK0M1WjVDNmEzZVora3V2ODYwYmh5S3E5SDhI?=
 =?utf-8?B?Z2JZYlJIV0hNSGZCTFRNdU50bnlhOWZDZldHT1NTS0tlaE1BZDk1WkwzbzhW?=
 =?utf-8?B?K01Nd0FmZUN4MmZqc0JOQ2laTnpibmtPMnhEajRhUkxwQXJ5eDgxcC93bW9H?=
 =?utf-8?B?ay9MOEJYamtQL3hGQmNqQUIzLzljODNiZU9INDlseS8vSTNYemgyeGUzOWFP?=
 =?utf-8?B?bVdiZ1VHcUdtQXRkNXZ0QmRicTlZTGkzaHE4WXJXM056QkRwbFJjZFl5czky?=
 =?utf-8?B?Z1FqTkswMDliOVBHY3BLaFNPeitKRVNIYjlDSE1IbXZsT2FqN3Y3MnJ6QlhE?=
 =?utf-8?B?dG5aS3VpMmV2eU1sSmJscE85cEQ5RDJ5cmlBVVFsaVYvalFQRHY3ZWRYMXk4?=
 =?utf-8?B?aGxrdkhucmphU1hlUCtaTWV0WnRYUG8zTnQ0N2cwM2pxMTg4ZVlyUkgxUmg2?=
 =?utf-8?B?alJEYUJLWExlOVpHS2U0K0VHbitiV0NjeFhNc20vYnA5WmZRWW53b3NRckt1?=
 =?utf-8?B?eWhMdlEzaGJwUW1tREQyeUVleC83Mlhta1c5K0dJMyszODE5ZHV2YkUrNUg2?=
 =?utf-8?B?Nm1pOWx1aFc1Zkx0M25JQmt1elYrY2J1QVozS2x3UmJaZjNLS1I0bjA0ck1S?=
 =?utf-8?B?eDVTZUpzclFiY0ExUU1UcHRFbklLSTI0TGtMd1FVclFqa2RNUUZtc2JwWWtQ?=
 =?utf-8?B?dmVoWTZZeVAzVkNwY0pzTFBCaDQ5d0p3SFN5bm12RUlON0dxUkdPZ0NnL0FM?=
 =?utf-8?B?bkxJOXFFVGptWVp0ZkxpTnhlQUFNallpNFpGcXBJcXNZU2tpUE1UblBDODNl?=
 =?utf-8?B?VXM2cmdSZWVlVThTYnZOMEJzMHJsTzVaa1V5enA2N3dZa0hvZm9MZEdyd1Jv?=
 =?utf-8?B?MjVqc3VGRzUyOUJhUGZyM0E1U3RNMVQ3a0diU3RWdW92VzI1TkVQeXEyRFdv?=
 =?utf-8?B?TjlYRnZYaGFnVmc3QkIxR2RKeTljSDAvTmR6WFJyT1JuSGZFeE1mSEhNaFpL?=
 =?utf-8?B?bmw2QnZtT21Zc3pPU1Fka25CZjVZY2hkT3hKNDdtMHozM3pETFR3ZG14Z0VU?=
 =?utf-8?B?bjZXalowSmpZQTZFOW11NFo0eDZ3ekpCc002MWpXeW9SdEprTUZhVXAvRlpv?=
 =?utf-8?B?dUpJSElXeTYyRUE1TTUycDdxOUt3azVsZzJ3TlRKVG1FTlhDdXE3WkRlbmlI?=
 =?utf-8?Q?KHJy2fV0mPsDg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc28782-8a2d-4b77-da14-08d89787d1b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 12:34:46.5377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KSaLrt1mjP2/BRBbmkL87Pi/lFF1MY4RFEN/Rk8iMZ9TnDQd+xpnm9nMlBwllb4/SXLjpkaADvO+3I7dR2y1qfLrw/sTfBjbb++4GUjRSiAfY1d2ZW2qC6dHG+8vyzMg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1942
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDMgRGVjZW1iZXIg
MjAyMCAxMDo1Mg0KPiBUbzogTGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwu
Y29tPg0KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPjsgU2VyZ2Vp
IFNodHlseW92IDxzZXJnZWkuc2h0eWx5b3ZAZ21haWwuY29tPjsgUHJhYmhha2FyDQo+IE1haGFk
ZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+OyBQaGlsaXBw
IFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPjsgSmlyaQ0KPiBLb3NpbmEgPHRyaXZpYWxA
a2VybmVsLm9yZz47IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IExpbnV4LVJlbmVz
YXMgPGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBQYXZlbCBNYWNoZWsg
PHBhdmVsQGRlbnguZGU+OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPjsgTEtNTA0KPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwLzVdIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IFRyaXZpYWwgZml4ZXMN
Cj4gDQo+IEhpIFByYWJoYWthciwNCj4gDQo+IE9uIFRodSwgRGVjIDMsIDIwMjAgYXQgMTE6NDIg
QU0gTGFkLCBQcmFiaGFrYXINCj4gPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToN
Cj4gPiBPbiBUaHUsIE5vdiAyNiwgMjAyMCBhdCA3OjExIFBNIExhZCBQcmFiaGFrYXINCj4gPiA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IFRo
aXMgcGF0Y2ggc2VyaWVzIGZpeGVzIHRyaXZpYWwgaXNzdWVzIGluIFJQQy1JRiBkcml2ZXIuDQo+
ID4gPg0KPiA+ID4gQ2hhbmdlcyBmb3IgdjI6DQo+ID4gPiAqIEJhbGFuY2VkIFBNIGluIHJwY2lm
X2Rpc2FibGVfcnBtDQo+ID4gPiAqIEZpeGVkIHR5cG8gaW4gcGF0Y2ggNC81DQo+ID4gPiAqIERy
b3BwZWQgQysrIHN0eWxlIGZpeGVzIHBhdGNoDQo+ID4gPiAqIEluY2x1ZGVkIFJCIHRhZ3MgZnJv
bSBTZXJnZWkNCj4gPiA+DQo+ID4gPiBDaGVlcnMsDQo+ID4gPiBQcmFiaGFrYXINCj4gPiA+DQo+
ID4gPiBMYWQgUHJhYmhha2FyICg1KToNCj4gPiA+ICAgbWVtb3J5OiByZW5lc2FzLXJwYy1pZjog
UmV0dXJuIGNvcnJlY3QgdmFsdWUgdG8gdGhlIGNhbGxlciBvZg0KPiA+ID4gICAgIHJwY2lmX21h
bnVhbF94ZmVyKCkNCj4gPiA+ICAgbWVtb3J5OiByZW5lc2FzLXJwYy1pZjogRml4IHVuYmFsYW5j
ZWQgcG1fcnVudGltZV9lbmFibGUgaW4NCj4gPiA+ICAgICBycGNpZl97ZW5hYmxlLGRpc2FibGV9
X3JwbQ0KPiA+ID4gICBtZW1vcnk6IHJlbmVzYXMtcnBjLWlmOiBGaXggYSByZWZlcmVuY2UgbGVh
ayBpbiBycGNpZl9wcm9iZSgpDQo+ID4gPiAgIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IE1ha2Ug
cnBjaWZfZW5hYmxlL2Rpc2FibGVfcnBtKCkgYXMgc3RhdGljDQo+ID4gPiAgICAgaW5saW5lDQo+
ID4gPiAgIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEV4cG9ydCBzeW1ib2xzIGFzIEdQTA0KPiA+
ID4NCj4gPiBBcyB0aGVzZSBhcmUgZml4ZXMgdG8gdGhlIGV4aXN0aW5nIGRyaXZlciB3aWxsIHRo
ZXNlIGJlIHBhcnQgb2YgdjUuMTAgcmVsZWFzZSA/DQo+IA0KPiBJSVVJQywgb25seSB0aGUgZmly
c3Qgb25lWypdIGlzIGEgZml4IGZvciBhbiBpc3N1ZSB0aGF0IGNvdWxkIGhhcHBlbiBkdXJpbmcN
Cj4gbm9ybWFsIG9wZXJhdGlvbj8NCj4gDQpBZ3JlZWQgKEJ0dyBJIHdhcyByZWZlcnJpbmcgdG8g
dG9wIDMgcGF0Y2hlcykuDQoNCkNoZWVycywNClByYWJoYWthcg0KDQo+IFsqXSAtRVBST0JFX0RF
RkVSIHdvdWxkIGJlIGVhdGVuLCBjYXVzaW5nIG5vIHJlcHJvYmUgdG8gaGFwcGVuLg0KPiANCj4g
R3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0K
PiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
