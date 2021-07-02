Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C013B9E2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 11:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhGBJ2l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 05:28:41 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:35264
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230388AbhGBJ2j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 05:28:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGbCHch1sg+IOwcZPGlU12u4u724WN1jR/NvjhJ8QG2KO8bGBpHoKKWyz27njgPoI0OMNlQoV99g8/OfD8AmhSVQt4JBhOd9ARCdRNi40UIQilpMg0eeUGViG4tqNYGPJvSt0x54Wyl3BOFLGUEgx/rrikHIjzkm/Wc8OGYa5gD+YHK+e5mg4VeMo0fi+zeNYU16p9rkVK1DCPdbGaOz4lX9G4EjsnUr74JrH2fVLII25354eXGftpJv2OvM3sJq8pT+IeG/wyqYzJ/LojqK/A5U5fTdMLmCMopCdZkFALNEahaz6fkZ/W4wVMCiCtwGcRh/EZXda7bRoaFION9Fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKtGlki9ImoscGeUrwdoZzGZpIABjYyqQwbP3MmVWzM=;
 b=jp9tRcJQ7vIxHQ49mVc3WvbfE6ohzIhxNF43JtbSGwsPIOo8nEVTdTx6CdH9V9pB4OF6DHFjlaLoX2hUD4ZnpZcT7/1aRX9azxJWbBSJpbTkaueQcTrJ+4aisOdK58vHVVhxKIxf5AFUpovnRDbaJ6u61aCxoKCP3vq5Cu1d/qceLh3j72pQYHIFYke13pvG2yGVqWJH4ODScf8SKCbrhEJUNIRUb21X51yvMrALYll3eNdoTpSl3fv7qsisDIeAv/YGAHKNGq2nNyXc1cawgLdBVgLGoaFm6TGOc+pvMLXrRxtt/jW2ro5frDG/RksYSAMh5Lm8h/25p0LpszyB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKtGlki9ImoscGeUrwdoZzGZpIABjYyqQwbP3MmVWzM=;
 b=W+wQ8FOi3uhJwxErcvLDx94s1INjoDN+reJqqPLI+R/ZfbPnohiBm/s9qxUiHIu66gc9G+ukFywALkvbBEezTtZAV9/vmon7Dj7P1YlmGnv8yjkgRZxXhWUnK21AYMdVQNyjcqawAyz9hTH6WmyHzGLwsn/oj7aBum60iWgn+f8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1943.jpnprd01.prod.outlook.com (2603:1096:603:23::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 09:26:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 09:26:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 05/11] reset: renesas: Add RZ/G2L usbphy control driver
Thread-Topic: [PATCH v3 05/11] reset: renesas: Add RZ/G2L usbphy control
 driver
Thread-Index: AQHXbYHctgPC13H3KUyb9vFaVzGovKsscJ4AgAANifCAAuXkAIAACJbQ
Date:   Fri, 2 Jul 2021 09:26:03 +0000
Message-ID: <OS0PR01MB59224A957F76F5A6C10A3814861F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
         <20210630073013.22415-6-biju.das.jz@bp.renesas.com>
         <83276a09d6aea1b6e8ac4aa2bfef77ef99c2d76e.camel@pengutronix.de>
         <TYCPR01MB593358CF332F7C5CC1A852DD86019@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <634d5d9203b633ffdcc05a9b388cdab12f383d8d.camel@pengutronix.de>
In-Reply-To: <634d5d9203b633ffdcc05a9b388cdab12f383d8d.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48d42282-8c54-4f97-b2f4-08d93d3b6a1b
x-ms-traffictypediagnostic: OSBPR01MB1943:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1943F2C3C43917CD439D74F7861F9@OSBPR01MB1943.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y0ULLCEH0lpSxjFc7N/BeiYaa5wNiNtKw11L/BPUAuePNsrJQ93IgwfhQtz1VZYvvLfWpbX3AfOvEWuEJtMbedtDHUWwBVeupGlLsYEJfWDfcRh80XJC7AOWiT863KN+orThy6VUoOdYuTyRqHvS1/wnLN8hViOVdJw3Y7/ZzRcBxEi8ptOdhPIzbDK/mmgBXK1TUTg3jgsETyQWXtnU0qtog3DBjD7Kx+mCcgyW7hqaw+i+/mlCpyA5aRc+q5o4PR7yIIx+1rh0ODfEjym4rgbdAdxIG2Txli/2fPOyOO0Bl+8S4cy1eUrEmJWIVYm0LNSQC1Zby6Yr55VNHodeZ3sdNIUXKp9JOjLXZFT5wjk23b0bvl5NG2c8s04MBxIzTYO2T6qIyhOBouLHCJMi0bMnPzi6rwx/FrlWlRMoCSFdPJYOElykPEGXbsMe+XH2qpbuYSSbriOjcqw+6eoB5US8l7bHNoGPAG8KjBaxZVSklRZQds0tx+XM15T6sfu+gaw2auFZVbrhDi4a2a5HFCJwSV98u+s0O0txiwAtJ/elL84BkyH3W6B2on2f5ZXJuTAzPvy7jBteBO3FiU7igboLNoXq/Mlg84zcuJHqyrI9E7gyCSCygRvzHKp0Oiw6zGHRDpv1swJRR7E6Bpu2QA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(38100700002)(71200400001)(122000001)(83380400001)(7696005)(26005)(478600001)(9686003)(55016002)(6506007)(8936002)(316002)(54906003)(186003)(86362001)(2906002)(66476007)(52536014)(5660300002)(33656002)(76116006)(66556008)(66446008)(8676002)(66946007)(64756008)(4326008)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGxScUgvdDlxTFRvUW9CYnUveE1NWGFoSlB5Rk5Pdks3UkhxcVBQM0ZWNVFH?=
 =?utf-8?B?T0NzMDVRMzd5K2hIUnNUdC9zVHRjNjgydk9acldZWklYQW5xbzVmaEJCSWJG?=
 =?utf-8?B?Q0R1UjBPUUdUNnNsZEtqK01NZFZkeFN2d1lGa0dTdGFwczJmd0hTS08weG13?=
 =?utf-8?B?MFJhNnpDVkFJNWZoMmpEdjdhU1Y3WWhWVktwazNoUzJka0NsMXJ0ekV5ekcx?=
 =?utf-8?B?TlV2ZXNCbTRaRlRCUkJYUkNaUE9DVXBYWTBBZzlwK2lyTWtvRk95dkhkenhJ?=
 =?utf-8?B?d0MxQjVGMytoVnFBaWFrZU94NlFacThVTmZWWGZ5M1B1dHliWVJ0b1BTMFQ1?=
 =?utf-8?B?a0lnOEdCdkNiMTI0Z2twdnVycjZ1VFljaEYvRlhSZjQ2MlNocnhQSE16T0Ft?=
 =?utf-8?B?YlZOT0toTDNESnJlbDFCRWc2aXhZdzNKVWJZOEtmaFdnZVBwR2R3UXhKcGdL?=
 =?utf-8?B?ZG1lK2ZhM01vK1pHT1VmMU55NUh1MEFEOUdxaWEzMFF0WGhNdXowM2o4OVNT?=
 =?utf-8?B?akV5eFowMGJTNjc5Y1JLWHFkNm5pbThReUdOMGc4R1NjQWQ0U1crRmtwMytV?=
 =?utf-8?B?T05yc0NDYnFnK1Y4MkRFVkVNbG0xQjRCTzdsOHJXekJBN2R4QmZzWnY4REdp?=
 =?utf-8?B?ZzY5NS9jU21HRkhhNzFUTVpaaWo0NFNzenBZSVQ2eUU1NVFRSVhtemFvMW9D?=
 =?utf-8?B?UmdvWjZWY2FadU8wWHNCVGlLVkEvc2hvaHlEbjJjY3FoeENFdWc5WmFRRHdW?=
 =?utf-8?B?MHU4VElXdll4Z1ZhYll4bmRsbFdjVkNxUXN4WWVnYkIveDVXOHdWcDlRM1I3?=
 =?utf-8?B?T1FFaXJmVStMRzgvcGFJNmlQQWJsUktVVGkrMlg0K1dqNXpkL2xaTGZVZnNq?=
 =?utf-8?B?b2hSaFdxQkpjYis0VjFqejY3QXIwSW1GaFNSR00yVmtXaFkwMUtyMDl2NEdZ?=
 =?utf-8?B?VEd3bXRPZWpHM0RLOU9ncUtJOG00TUVMWVhScUNDd21VV3F5TE9yVkUwd3hs?=
 =?utf-8?B?bi9GbEJBSVlEcFNCbVdGS2FaaXU2dC92QlRMaGZQRGxtVll2Q0FiZDhyNkFp?=
 =?utf-8?B?bkdMWnZWZWFBZ0VpemREb1JpTkFmUlFIaGJWaE9LOXNLQkVrd0YwNmFlUy81?=
 =?utf-8?B?NGJ5WGc1SUYxZjFSYWVFRUpjYnJiaC83Qis4dUtoVFJtQ0szYlpFS3BJMm5O?=
 =?utf-8?B?RkN2TnZSbGg0QnRzK2ZYWWl4aWdGRFR5dHVublFqd2pMVmtXck0wc0dURFpo?=
 =?utf-8?B?TXBZZEpYRjJRVXVzcHd4WUdtMWNZTS9nVWRFTTFuYk42c2Q4ZGdsLzhTeW84?=
 =?utf-8?B?RzRBVFNkeHBQRDl6WkdtWkRKdEhEam5COGRyUjNraERLNXJhYVY0cUo5TUJ1?=
 =?utf-8?B?anE4YWFxK1o1QWx3T2VXK0xqSVR2YUZxZ2wxUkhsaFpDa3FJeGYzU3VzMWVv?=
 =?utf-8?B?R0VKVXZUT0hMbW0rQXZmTEM5dFFBVGdwQVJ6WEtURTNJcnZvWkpGMXJHS3Ny?=
 =?utf-8?B?L080UFNlN3NkbnZaRktoZFB3OUk4dnUzYzBMb3QxL0VHYXl2QkY3SitERnRy?=
 =?utf-8?B?TGFCNVd5V3NSczR4bGF4S1A5alNqZmZOMHhLZk1XUFFaTy9LN2I3U1pwamU3?=
 =?utf-8?B?ZGN5K2xsTm04SGpHSWZDbFVyVHhORStBK3hDZkMySHJwdWVndnczZ3hlYXls?=
 =?utf-8?B?SE84RitNVmcra1pGL21keDk3azZob09Oa0licFZnRUJSSmUxRHpyZDgxRDBn?=
 =?utf-8?Q?duM7klc6jTZMiv0BvaNP8jcwA2jHQDLY2gWP1pJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d42282-8c54-4f97-b2f4-08d93d3b6a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 09:26:03.7162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ChLUi8v2IjG2coGXFSKvcQQJ/1xgP3hw0RFwwi8h6R9CVpoMCujXr+2k5uoRbR0lfM3vWnWtgZnkcTnVnXCZp6xlHn7vxYsLBIiZZNhZpaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1943
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUGhpbGlwcCwuDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzIDA1LzExXSByZXNldDogcmVuZXNhczogQWRkIFJaL0cyTCB1c2JwaHkgY29u
dHJvbA0KPiBkcml2ZXINCj4gDQo+IE9uIFdlZCwgMjAyMS0wNi0zMCBhdCAxMzoyNSArMDAwMCwg
QmlqdSBEYXMgd3JvdGU6DQo+IFsuLi5dDQo+ID4gPiBXaGF0IGVsc2UgZG9lcyBpdCBjb250cm9s
PyBBcmUgd2UgbWlzc2luZyBhbnkgZnVuY3Rpb25hbGl0eSB0aGF0DQo+ID4gPiB3b3VsZCBoYXZl
IHRvIGJlIGFkZGVkIGxhdGVyPw0KPiA+DQo+ID4gSXQgaGFzIG90aGVyIGNvbnRyb2xzIGxpa2Ug
ZGlyZWN0IHBvd2VyIGRvd24sIGNsb2NrIGNvbnRyb2wgYW5kDQo+ID4gY29ubmVjdGlvbiBjb250
cm9sIHRvIGhhbmRsZSB0aGUgY2FzZXMsIHdoZW4gVVNCIGludGVyZmFjZSBpcyBub3QgdXNlZA0K
PiA+IHBlcm1hbmVudGx5KGxpa2Ugd2hlbiBwb3J0MSBhbmQgcG9ydDIgdW51c2VkIHBlcm1hbmVu
dGx5KQ0KPiA+DQo+ID4gSW4gZnV0dXJlLCBpZiB0aGVyZSBpcyBhIGNhc2UgbGlrZSBiZWxvdyhm
b3IgZWc6LSApDQo+ID4gMSkgd2hlbiBwb3J0MSBhbmQgcG9ydDIgdW51c2VkIHBlcm1hbmVudGx5
ICggVGhpcyBjYXNlIHJlY29tbWVuZHMgSFcNCj4gPiBtb2QgYXMgd2VsbCkNCj4gPiAyKSB3aGVu
IGVpdGhlciBwb3J0MSBvciBwb3J0MiB1bnVzZWQgcGVybWFuZW50bHkoIFRoaXMgY2FzZQ0KPiA+
IHJlY29tbWVuZHMsIGZyb20gSFcgcG9pbnQgbm90IHRvIHN1cHBseSB0aGUgcG93ZXIgdG8gdW51
c2VkIHBvcnQpDQo+ID4NCj4gPiBNYXkgYmUgd2UgY291bGQgZXhwb3NlIHRoZXNlIHByb3BlcnRp
ZXMgaW4gZHQgYW5kIHByb2JlIHRpbWUgc2V0IHRoZQ0KPiA+IHJlcXVpcmVkIGNvbnRyb2wsIGlm
IHRoZXJlIGlzIGEgcmVxdWlyZW1lbnQgdG8gc3VwcG9ydCB0aGlzIGNhc2VzIGluDQo+IGZ1dHVy
ZS4NCj4gDQo+IE9rLCB0aGFua3MuIElmIHRoYXQncyBib2FyZCBkZXNpZ24gc3BlY2lmaWMgc3Rh
dGljIGNvbmZpZ3VyYXRpb24sIEkgc2VlIG5vDQo+IGlzc3VlLg0KPiANCj4gWy4uLl0NCj4gPiA+
ID4gKwlpZiAoKHZhbCAmIDB4ZmYpID09IChQSFlfUkVTRVRfUE9SVDEgfCBQSFlfUkVTRVRfUE9S
VDIpKQ0KPiA+ID4gICAgICAgICAgICAgICAgICAgIF5eXl4NCj4gPiA+IFdoYXQgaXMgdGhlIHNp
Z25pZmljYW5jZSBvZiB0aGUgbWFnaWMgMHhmZj8NCj4gPg0KPiA+ICBXZSBzaG91bGQgdXNlIChQ
SFlfUkVTRVRfUE9SVDEgfCBQSFlfUkVTRVRfUE9SVDIpIGluc3RlYWQuDQo+ID4NCj4gPiBCYXNp
Y2FsbHkgaXQgaXMgY2hlY2tpbmcgYm90aCBwb3J0cyBhcmUgaW4gcmVzZXQgc3RhdGUgb3Igbm90
Pw0KPiANCj4gVGhhdCB3b3VsZCBiZSBiZXR0ZXIuIFJpZ2h0IG5vdyBpdCdzIGNoZWNraW5nIHRo
YXQgYml0cyAyLCAzLCA2LCBhbmQgNyBhcmUNCj4gY2xlYXJlZCwgYW5kIEkgY291bGRuJ3QgdGVs
bCB3aGV0aGVyIHRoYXQgd2FzIGJ5IGFjY2lkZW50IG9yIG9uIHB1cnBvc2UuDQo+DQo+IFsuLi5d
DQo+ID4gPiA+ICtzdGF0aWMgdm9pZCByemcybF91c2JwaHlfY3RybF9yZWxlYXNlX3Jlc2V0KHN0
cnVjdA0KPiA+ID4gPiArcmVzZXRfY29udHJvbGxlcl9kZXYNCj4gPiA+ICpyY2RldiwNCj4gPiA+
ID4gKwkJCQkJICAgIHVuc2lnbmVkIGxvbmcgaWQpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3Ry
dWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX3ByaXYgKnByaXYgPSByY2Rldl90b19wcml2KHJjZGV2KTsN
Cj4gPiA+ID4gKwl2b2lkIF9faW9tZW0gKmJhc2UgPSBwcml2LT5iYXNlOw0KPiA+ID4gPiArCXUz
MiB2YWwgPSByZWFkbChiYXNlICsgUkVTRVQpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJdmFsIHw9
IFNFTF9QTExSRVNFVDsNCj4gPiA+ID4gKwl2YWwgJj0gfihQTExfUkVTRVQgfCAoaWQgPyBQSFlf
UkVTRVRfUE9SVDIgOg0KPiBQSFlfUkVTRVRfUE9SVDEpKTsNCj4gPiA+ID4gKwl3cml0ZWwodmFs
LCBiYXNlICsgUkVTRVQpOw0KPiANCj4gSXQgd291bGQgYmUgZ29vZCB0byBwcm90ZWN0IHRoZSBS
RVNFVCByZWdpc3RlciByZWFkLW1vZGlmeS13cml0ZXMgd2l0aCBhDQo+IHNwaW5sb2NrLCBzYW1l
IGluIHRoZSBfc2V0X3Jlc2V0KCkgZnVuY3Rpb24uDQoNCk9LLiBXaWxsIGRvLg0KDQpSZWdhcmRz
LA0KQmlqdQ0KDQo+IA0KPiByZWdhcmRzDQo+IFBoaWxpcHANCg==
