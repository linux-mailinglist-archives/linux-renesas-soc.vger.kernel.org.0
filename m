Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB89F426BCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 15:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242505AbhJHNjY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 09:39:24 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:6437
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242369AbhJHNjW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 09:39:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcZBVaGVDvJ2sWw9WbZegrgiENRNRBGsydfBYxBr2V525n0PqFL+6wFx0m+FhmrPiQ+M8/XXpTFCABIXGKKwqqYikbfrfxzBCsYy+3tNGNcpXoyxtJToqm0ST+l2fRUZQTptJUkMFAzKlZHxKnjx8K3zafBwrceBjPIptelt6zr8aQHhO0H4bGE9ueYlPJBkoET6lSLO9vYDmMtkHEdFg3HN0Bggaad5nHmT90Y2DzGe1F54jKdG990NY6xilMhaM6Y9R9OJl63GmPqiQB6d7TDbRnmpXPDtOqPirki3JUMurr1HbC2wn2J1IjbZxkdIvX3TUQD1FjbDeqhdTBFDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihhCxrBze8uEssKftG14Z6yT3+G7HfUgCOGnpRasRho=;
 b=ll8xzcXUGwL1eFk5rj/yzPekR4GA/D3YfBwfoyH0iI7vuIY3CWuoQLfPU7YD3goO78Zm1b2a/wgnFMo8TvigzEBVTh20SvnmNMdKhAGCgo4ESLqe2knHMzgUYpVQIeBGarug8bah3VwgtcA33AVfVx8Xl+sP5DZtIZq+EH8cCC1yXUM0njvzqVg5edxs9T4s3+1HyNFt+nrOS3ozd3FyOBvC5Ykq6fvq1HHKg1fxXgGHA8yXpWtCbp1Wyz9BWNpT/LvJObAhS3W/7yJFeR4bdPpsS1yXQ7LcnbOk/trmQMFbtAwMrS1cNQfn41EBazaTv025colQgpgEzydwxygxcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihhCxrBze8uEssKftG14Z6yT3+G7HfUgCOGnpRasRho=;
 b=l1V98wsXYYclSBGsQO3nriNLD/iTArxXHUgORF7ecHnttb9Tkl8T6fO5eTY286M38e0F6DkTvKp+Rf0TvSnkrJyHsSjXlAKKKuFLYduzKHT/JBHD8O+qYHVeHOUoQEg5W5/jXhwZ0mKotZfVW+h1mPcn5i8NZc9D75rktLPgRII=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4324.jpnprd01.prod.outlook.com (2603:1096:604:67::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 13:37:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9ca6:1cf:5:9fc1%3]) with mapi id 15.20.4587.018; Fri, 8 Oct 2021
 13:37:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on
 SMARC platform
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on
 SMARC platform
Thread-Index: AQHXu5Ox4/dokw/QOkuKV9S8zZhk+qvI/ksAgAAdI8A=
Date:   Fri, 8 Oct 2021 13:37:21 +0000
Message-ID: <OS0PR01MB5922BC3395A1FF9673736B3186B29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
 <20211007155451.10654-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVAk0_Fp=EPYJLd41DARk7qji62T=qvrdNyfYukOvJE4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVAk0_Fp=EPYJLd41DARk7qji62T=qvrdNyfYukOvJE4Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4df2a4b9-9c48-4a78-ea5e-08d98a60c1f9
x-ms-traffictypediagnostic: OSAPR01MB4324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB43249845C346028D95BB506486B29@OSAPR01MB4324.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ePjHqLAWFwEApYPWEdUm3j9s7YdFa0YvAeQH/zqyNAO7snka3sWL0yxcCN2xL3RWYuH5683bIuUtZ2hSZse+WY9oLfZDqmeCERn/cWLZUlNt6YCxyjEe2IBxLDvf8QkJJbk7dWLUA5vL/uPlfHauceZN8ybHpJEEg5VaGXWvnyg+lg29cKUa0JVAbxSZ+aezftLpMWOVu5DYuQvRV1lYipC6Y9YjrUxCAVWH/r7NcRC/ogCFJhA/fWL6PTZk8vTnvUreaguB4FC4ZgSU3u9wgrefO7zvoZOPwxTJafTsz3WaI/qW8jC/ENbY2IrFJ3YcLLCZYRNMF4XDUgngf1qLgbiUCNpZocGjN+t1/bafO1gFVZ5M33aVxSDzuYaCfTV8CjW/IPtr2JaKr6MMXL98zPJFW3h+epP+KXZxD/G2vR4xlfr6xo7Wd6qAGA+hWAMTFYOIoCswPWa/+/oMvKvTNvtDkIMDF4cmpttcrYoBZXtaY4eg0VaqB2xwN7XA/kVsBVrvvd6/1ORVMDBcwg3XnQGiHGgZzh7jGAEe9U+TPe3rGAsqE6cxixd2m3indZVq2aTTpMUM/yjAH0DOWR3diMWP5hhpezfkCdO3NPAUsZ7hWxVo39s7KOccnjKVSbpKaLXiIUsP9ZK++6zPWHqQdu6QI9p7iG/OwHUGH4UjjPB5+IbSz3mm4ukwy2qkzil368ryDNzOaJDRIRJRr2ktyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4326008)(316002)(38070700005)(107886003)(2906002)(8936002)(38100700002)(186003)(26005)(66446008)(71200400001)(66476007)(64756008)(7696005)(122000001)(86362001)(6916009)(53546011)(6506007)(9686003)(55016002)(8676002)(33656002)(5660300002)(52536014)(66556008)(66946007)(508600001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emhBeU5STkVqdXJ5ZjU2SXdNaGc4MkxjcXlNang3elc3YmhPYUdQa2pGYjRo?=
 =?utf-8?B?SEowVDJjTFNFRFRlVkJRNUpmRzVzcFN5eWZvbU44MWR4S0ovNHFsejNENHZT?=
 =?utf-8?B?MHZPNktnWlplMC9YeHpORTd5c3c3K2c5UGNZTGU0VXgzOVNyR1BxTUFwQ3Nx?=
 =?utf-8?B?bWpPZ0pzZjBLRThtQWpjSHpWa2QzTzVWdkxSaXEwbDltN2NZVnRkcGZualYr?=
 =?utf-8?B?dlNWS1pJdXNYQjZLK2pYWEhleG8vbEcrVVBhaFNwK1lzMGI2MWoxTHk2b2Jq?=
 =?utf-8?B?d09hWi82dFFwTVN3Rm9aR0d5cXJNYk1ubklRS0FjNXJxeitKYUs5RjU2NUhj?=
 =?utf-8?B?MDVHY3FZZnp0bm1tREo5QW5mUlo1Smk5WWpHRlcxaXVrSUNhQ3hVemFMWm8w?=
 =?utf-8?B?dzFDdDZNS0hnczZTTWdqanBOT1g0aXIwcGZZYUE2NDBLZzFHSXhLM0tuSmtY?=
 =?utf-8?B?M0JHVXJ0czg4dTBiNTQ3aFBDTitGUWNIK3BwQTlxeGkxLzRtaVlUajl4empr?=
 =?utf-8?B?dEpYNDRacUN4V3lqcnBER1JQSWNVeFkrbWRJaGN6SGFKcHYyUFJxcnp6TTN2?=
 =?utf-8?B?VVRNdlgxSkROaDRvcUFwWVVkRFBGOWlhOGlwWkFPS0YwaEdGT3BwWHpDcWxx?=
 =?utf-8?B?TUZScGlEV3dhUU5OTG51TzAvOFAyYjVuNjdvS3FIYWtvZ2E4THUxUkZzK28w?=
 =?utf-8?B?RXFrRWFVc3RRaXQ1MHVleHpIWEZCM2o2eGZoeGgwRm5PUlBYdmVrZGlFUHlN?=
 =?utf-8?B?YW9ibi9YTklCcWh5SVNWTFBSK1RlQXh6YmthMDNpZlh2SXBudHVkY0VSdlE5?=
 =?utf-8?B?RWN6NjcyUzVCakhhVEZ4R2V6VmVyamRKS2U4K0tjWVlQbkVFclZ2ck1VaXMy?=
 =?utf-8?B?TlZ6Z2xFTFhaZFRiZ3NCQVltblpUbG9PZkw0czRJQWx3ZVN5QTkzSmJFMEtu?=
 =?utf-8?B?NnBQUDFNODBXcnRNUUpiU1RsWWJOdlRwa0RxdE4ySnhESmdncStNSGgvWTRD?=
 =?utf-8?B?QkRnaVREb2NxYnMrZ2RiUmgwQnFwL05vYjg5SjRtNVYzbEl6Q0lObllrcHhx?=
 =?utf-8?B?N2hScjFoUnBDSEVubG8rai8rR2Q1MkpldVFsb083enNjMTVxcW5KbDZZdVVH?=
 =?utf-8?B?RVZIcm9vcFJYZUt2VGxDMEZoc3g5aDlUenhXNU0rQXFoTElCTkltOTZOOGcy?=
 =?utf-8?B?eXM5Z202RkdaL1ZFL1FlQU8rbDhLVnlhUFR0a2FFQ2FNenRJT0NhcWRSRHFQ?=
 =?utf-8?B?Sm5uOU9oYndUK0xScDdWMW5pSlF6RHMzRFZ6NGtKUXBvSzdEOVJ0YXVRWWJl?=
 =?utf-8?B?VXJjUWxJVldjMy9PdDRLNDIvVG1pcTdVdWUyVmlCSDJ0RlAvTGVRTmQrVGJk?=
 =?utf-8?B?R3Q4QVNpakFzUm1qNTllVjBaZThsNEU0ZGRxSVEyMmRDeGZtQlVsTTdVeStq?=
 =?utf-8?B?TFVhZVV3ckRyOE53NU5nVXNrL3BtSnc2VE5CVEF2M3RpVHJUUEo2QTBoa29q?=
 =?utf-8?B?UTdCWnNVd09LOEEycURxZlpkcGVpZ3RORXpXb3JYaHRoekVQNGlXbzlQdGY3?=
 =?utf-8?B?WkMrN0svbzMrVThYUHRvK3BRSnY3KzBtTi8zSjVQUmdmMW0zd2VrSHNDZVlN?=
 =?utf-8?B?c0ZKVTVlQlNMSGZrWnlQUEo3THR6K0R1WTBvZU5jWDM5eG9Ob3RwRzJMQnN4?=
 =?utf-8?B?bkVEY3gveXY0bThkd2J1U001YTFteFpDcGpyNDhWd2dEcVc2QmpKS1NiUW5k?=
 =?utf-8?Q?CU83pzKwpKtByBFH4c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df2a4b9-9c48-4a78-ea5e-08d98a60c1f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 13:37:22.0960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6M1r9ehsOgqCPCaFWKUSHmHq3zQOy4veYJURNu14EPTY+sZ5BuDyegdDC5Rp+gsYr52GP9oDA6am1Hc+dXdHJLX+GygBPeQZ4b6EbefhxEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4324
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemcybC1zbWFyYy1zb206IEVuYWJsZSBl
TU1DDQo+IG9uIFNNQVJDIHBsYXRmb3JtDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBP
Y3QgNywgMjAyMSBhdCA1OjU1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gd3JvdGU6DQo+ID4gUlovRzJMIFNvTSBoYXMgYm90aCA2NEdiIGVNTUMgYW5kIG1pY3Jv
IFNEIGNvbm5lY3RlZCB0byBTREhJMC4NCj4gPg0KPiA+IEJvdGggdGhlc2UgaW50ZXJmYWNlcyBh
cmUgbXV0dWFsbHkgZXhjbHVzaXZlIGFuZCB0aGUgU0QwIGRldmljZQ0KPiA+IHNlbGVjdGlvbiBp
cyBiYXNlZCBvbiB0aGUgWE9SIGJldHdlZW4gR1BJT19TRDBfREVWX1NFTCBhbmQgU1cxWzJdDQo+
ID4gc3dpdGNoIHBvc2l0aW9uLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBzZXRzIEdQSU9fU0QwX0RF
Vl9TRUwgdG8gaGlnaCBpbiBEVC4gVXNlIHRoZSBiZWxvdyBzd2l0Y2gNCj4gPiBzZXR0aW5nIGxv
Z2ljIGZvciBkZXZpY2Ugc2VsZWN0aW9uIGJldHdlZW4gZU1NQyBhbmQgbWljcm9TRCBzbG90DQo+
ID4gY29ubmVjdGVkIHRvIFNESEkwLg0KPiA+DQo+ID4gU2V0IFNXMVsyXSB0byBwb3NpdGlvbiAy
L09GRiBmb3Igc2VsZWN0aW5nIGVNTUMgU2V0IFNXMVsyXSB0byBwb3NpdGlvbg0KPiA+IDMvT04g
Zm9yIHNlbGVjdGluZyBtaWNybyBTRA0KPiA+DQo+ID4gVGhpcyBwYXRjaCBlbmFibGVzIGVNTUMg
b24gUlovRzJMIFNNQVJDIHBsYXRmb3JtIGJ5IGRlZmF1bHQuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcnpnMmwtc21hcmMtc29tLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcnpnMmwtc21hcmMtc29tLmR0c2kNCj4gPiBAQCAtNSwxNCArNSw1NSBAQA0KPiA+
ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjEgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLg0KPiA+ICAg
Ki8NCj4gPg0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+ID4gICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0cmwuaD4NCj4gPg0KPiA+ICsv
KiBTVzFbMl0gc2hvdWxkIGJlIGF0IHBvc2l0aW9uIDIvT0ZGIHRvIGVuYWJsZSA2NEdiIGVNTUMg
Ki8NCj4gDQoNCj4gNjQgR0IgKHRoZSBNVEZDNjRHQVNBUUhEIGRhdGFzaGVldCBpc24ndCBjbGVh
ciBhYm91dCB0aGUgZXhhY3Qgc2l6ZSBhbmQNCj4gdGhlIG1lYW5pbmcgb2YgR0IpDQoNCkl0IGlz
IDY0IEdCLg0KDQo+IA0KPiA+ICsjZGVmaW5lIEVNTUMgICAxDQo+ID4gKw0KPiA+ICsvKg0KPiA+
ICsgKiBUbyBlbmFibGUgdVNEIGNhcmQgb24gQ04zLA0KPiA+ICsgKiBTVzFbMl0gc2hvdWxkIGJl
IGF0IHBvc2l0aW9uIDMvT04uDQo+ID4gKyAqIERpc2FibGUgZU1NQyBieSBzZXR0aW5nICIjZGVm
aW5lIEVNTUMgICAgICAgMCIgYWJvdmUuDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIFNESEkgICAo
IUVNTUMpDQo+ID4gKw0KPiA+ICAvIHsNCj4gPiAgICAgICAgIG1lbW9yeUA0ODAwMDAwMCB7DQo+
ID4gICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7DQo+ID4gICAgICAgICAg
ICAgICAgIC8qIGZpcnN0IDEyOE1CIGlzIHJlc2VydmVkIGZvciBzZWN1cmUgYXJlYS4gKi8NCj4g
PiAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDQ4MDAwMDAwIDB4MCAweDc4MDAwMDAwPjsN
Cj4gPiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgcmVnXzFwOHY6IHJlZ3VsYXRvcjAg
ew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7DQo+
ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gImZpeGVkLTEuOFYiOw0KPiA+ICsg
ICAgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQo+ID4g
KyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOw0KPiA+ICsgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICBy
ZWdfM3AzdjogcmVndWxhdG9yMSB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
cmVndWxhdG9yLWZpeGVkIjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAi
Zml4ZWQtMy4zViI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0
ID0gPDMzMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDwzMzAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLWJvb3Qtb247DQo+
ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1hbHdheXMtb247DQo+ID4gKyAgICAgICB9Ow0K
PiA+ICsNCj4gPiArICAgICAgIHZjY3Ffc2RoaTA6IHJlZ3VsYXRvci12Y2NxLXNkaGkwIHsNCj4g
PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZ3BpbyI7DQo+ID4gKw0K
PiA+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJTREhJMCBWY2NRIjsNCj4gPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQo+ID4g
KyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICBzdGF0ZXMgPSA8MzMwMDAwMCAxIDE4MDAwMDAgMD47DQo+IA0KPiAi
bWFrZSBkdGJzX2NoZWNrIiBzYXlzOg0KPiANCj4gICAgIHJlZ3VsYXRvci12Y2NxLXNkaGkwOiBz
dGF0ZXM6MDogWzMzMDAwMDAsIDEsIDE4MDAwMDAsIDBdIGlzIHRvbyBsb25nDQo+IA0KPiBQbGVh
c2UgZ3JvdXAgdGhlIHR3byBzdGF0ZXMgdXNpbmcgYW5ndWxhciBicmFja2V0cy4NCg0KT0suDQoN
Cj4gDQo+ID4gKyAgICAgICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOw0KPiA+ICsgICAgICAg
ICAgICAgICBncGlvcyA9IDwmcGluY3RybCBSWkcyTF9HUElPKDM5LCAwKSBHUElPX0FDVElWRV9I
SUdIPjsNCj4gPiArICAgICAgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1vbjsNCj4gPiArICAg
ICAgIH07DQo+ID4gIH07DQo+ID4NCj4gPiAgJmFkYyB7DQo+ID4gQEAgLTMyLDQgKzczLDEwOCBA
QA0KPiA+ICAgICAgICAgYWRjX3BpbnM6IGFkYyB7DQo+ID4gICAgICAgICAgICAgICAgIHBpbm11
eCA9IDxSWkcyTF9QT1JUX1BJTk1VWCg5LCAwLCAyKT47IC8qIEFEQ19UUkcgKi8NCj4gPiAgICAg
ICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgLyoNCj4gPiArICAgICAgICAqIFNETyBkZXZpY2Ug
c2VsZWN0aW9uIGlzIFhPUiBiZXR3ZWVuIEdQSU9fU0QwX0RFVl9TRUwgYW5kDQo+IFNXMVsyXQ0K
PiA+ICsgICAgICAgICogVGhlIGJlbG93IHN3aXRjaCBsb2dpYyBjYW4gYmUgdXNlZCB0byBzZWxl
Y3QgdGhlIGRldmljZQ0KPiBiZXR3ZWVuDQo+ID4gKyAgICAgICAgKiBlTU1DIGFuZCBtaWNyb1NE
LCBhZnRlciBzZXR0aW5nIEdQSU9fU0QwX0RFVl9TRUwgdG8gaGlnaCBpbg0KPiBEVC4NCj4gPiAr
ICAgICAgICAqIFNXMVsyXSBzaG91bGQgYmUgYXQgcG9zaXRpb24gMi9PRkYgdG8gZW5hYmxlIDY0
R2IgZU1NQw0KPiA+ICsgICAgICAgICogU1cxWzJdIHNob3VsZCBiZSBhdCBwb3NpdGlvbiAzL09O
IHRvIGVuYWJsZSB1U0QgY2FyZCBDTjMNCj4gPiArICAgICAgICAqLw0KPiA+ICsgICAgICAgZ3Bp
b19zZDBfZGV2X3NlbCB7DQo+IA0KPiAgICAgZ3Bpb19zZDBfZGV2X3NlbDogJG5vZGVuYW1lOjA6
ICdncGlvX3NkMF9kZXZfc2VsJyBkb2VzIG5vdCBtYXRjaA0KPiAnXihob2ctWzAtOV0rfC4rLWhv
ZygtWzAtOV0rKT8pJCcNCj4gICAgIChmb3IgYWxsIGhvZ3MpDQo+IA0KPiBQbGVhc2UgdXNlIGUu
Zy4gInNkMC1kZXYtc2VsLWhvZyIuDQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBn
cGlvLWhvZzsNCj4gPiArICAgICAgICAgICAgICAgZ3Bpb3MgPSA8UlpHMkxfR1BJTyg0MSwgMSkg
R1BJT19BQ1RJVkVfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgIG91dHB1dC1oaWdoOw0KPiA+
ICsgICAgICAgICAgICAgICBsaW5lLW5hbWUgPSAiZ3Bpb19zZDBfZGV2X3NlbCI7DQoNCk9LLiBI
ZXJlIGFzIHdlbGwuDQoNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgc2QwX3B3
cl9lbiB7DQo+IA0KPiBncGlvLXNkMC1wd3ItZW4taG9nICh3aXRoICJncGlvLSIgcHJlZml4LCB0
byBtYXRjaCBzY2hlbWF0aWNzKQ0KT0suDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGdwaW8t
aG9nOw0KPiA+ICsgICAgICAgICAgICAgICBncGlvcyA9IDxSWkcyTF9HUElPKDQsIDEpIEdQSU9f
QUNUSVZFX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICBvdXRwdXQtaGlnaDsNCj4gPiArICAg
ICAgICAgICAgICAgbGluZS1uYW1lID0gInNkMF9wd3JfZW4iOw0KPiANCj4gZ3Bpb19zZDBfcHdy
X2VuDQpPSy4NCg0KV2lsbCBhZGQgdGhpcyBjaGFuZ2VzIHRvIG5leHQgdmVyc2lvbi4NCg0KUmVn
YXJkcywNCkJpanUNCg0KPiANCj4gPiArICAgICAgIH07DQo+IA0KPiBUaGUgcmVzdCBsb29rcyBn
b29kIHRvIG1lLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcN
Cj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFs
aXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
