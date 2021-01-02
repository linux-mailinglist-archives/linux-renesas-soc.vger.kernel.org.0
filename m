Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363E82E86C3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Jan 2021 09:10:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbhABIK2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Jan 2021 03:10:28 -0500
Received: from mail-eopbgr1320092.outbound.protection.outlook.com ([40.107.132.92]:7296
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726080AbhABIK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jan 2021 03:10:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcBFVwG2n+LM3ZQIprqquKDXQic3pqXgr0DscMfolcksvQuGrT7SLQ7bttMGqPm64IGZHeahPtAlIEvT7bPBrx6ULHz1Fvo5TGswbrY01YAfQVzJJ5Vq+1hrRaV8WD83ZG8t3hr6eXjfKQ0qflE0LzKNL10Cq8Wo9nnxp4C6LUEK+4M5qb1Ww6TCSMVMyyXVxeEXBGGaKKGETNXhiwPpZGcYBHd4iaNt/4IW5oglgVYmUnXjmB7oqeUGMxjzJNqRBpsrqgL4YPmAb3LuamyXPZug1xOWqqLJtDW92nC/p0rO0cJbh47iW/5bnjkssfdnM0avc4nvQxVMqAsXAObj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/ytX7PUubWvxTcDGIT8zpjJ2tyjk/BnQx+nAIEUhKQ=;
 b=TbN4npAGWC5HcgUuMIptmAGhNeavmy9RdHU4Qa0pNDa4bp58wo/44yNCROLs58waSv33Q9r5v1T7KnKdUIyghYPLmNnASqRZjbHOHo36BvI4ShKesymRR4N1Sn0ZfG1WPEr7WwKKi7HgVNmedIHoVK9ZAcspfF1Skkdz+bGACwfR1Mh5rpIDkZ+8/cFYntPvmVu2ydahhI3MYbVlkpWcTIgZL/oj+rP2c/wcTkiI/VY13wMkfVW3l0tv9BifCcHL2IpJ+f63wtu16KoUXf5bJwNsMxGSWOnrV4gAJ+Fp7QlX2A9YjaeYfyE2FWbxDhE2kixpTrZq78ZmMO9c/M0OJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/ytX7PUubWvxTcDGIT8zpjJ2tyjk/BnQx+nAIEUhKQ=;
 b=HByhuS7T2YNvCdztOQsYKuF8w6jrFapJfCW5Uaw6jcoPf4PoUMIzZjHx/G3GEODPUbP5FRqs+714TsevotdNnKv0+7GgwR1LuyD7T+CRDlJZUJ8kzz/0EdIl6zytEqPFreEjgVyiRop7zGkotk1qfQLON40s99WD/uQZzHILZaM=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4539.jpnprd01.prod.outlook.com
 (2603:1096:404:10f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Sat, 2 Jan
 2021 08:08:49 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3700.032; Sat, 2 Jan 2021
 08:08:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Adam Ford <aford173@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "aford@beaconembedded.com" <aford@beaconembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support for
 RZ/G2 Series
Thread-Topic: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support for
 RZ/G2 Series
Thread-Index: AQHW4IXdk3RpMO7l7kmMnxvjyicg0qoT+dig
Date:   Sat, 2 Jan 2021 08:08:48 +0000
Message-ID: <TYBPR01MB5309645703192F7ED27CF72F86D40@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20210101113927.3252309-1-aford173@gmail.com>
 <TYBPR01MB5309353C04568B16E029261686D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAHCN7x+6BobFukqiENYg4HwZm5M0S5Dv14DmbmW5xYn0DdXBwQ@mail.gmail.com>
In-Reply-To: <CAHCN7x+6BobFukqiENYg4HwZm5M0S5Dv14DmbmW5xYn0DdXBwQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [81.135.30.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 684b53d7-64a9-41fd-cb8b-08d8aef5a2a3
x-ms-traffictypediagnostic: TY2PR01MB4539:
x-microsoft-antispam-prvs: <TY2PR01MB4539E25D083538611326215486D40@TY2PR01MB4539.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KmMwklde6WXCWOcatWh9tCVEG6ijj1W5ywAhWMuHE9UW8tmP6lTkmkbImPryOYevgNxyW5GcRFQu42UgcNbUYHEplKBCxowr9jhjdRgztCMSkzNhCZxtM+QRXwbQxNGhFPgEVFvFULT7d8w+kQpGHmc/2bEECBo6IoOxC4ZAhuyxIzMDImPRfjGAG7DPCyKG/D8nu5UhduPC2oYzHvcMNwzUW3xBQgVwbAHHPKrenurtSA7wiPIkSykRW7Mqy2mz36/vQuD1UcY4X38nYBj93R8LkfIiJk8TI3FGkWmfPaQgwvp/UW5cXtH52kLLgM4xmfHszH3doA9sXitmRTUiEffbgxNEle265sqKv1XhVHgDQR627TPs40nhJFQF+xNeZsRFpLImjCKQhYwaGJMf1w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(478600001)(4326008)(71200400001)(33656002)(8676002)(9686003)(55016002)(83380400001)(52536014)(316002)(7416002)(54906003)(6916009)(64756008)(5660300002)(66556008)(66446008)(86362001)(66476007)(6506007)(26005)(186003)(7696005)(76116006)(66946007)(2906002)(53546011)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QTB0UFQ0Ukc5UDVYbm1VOTBYVWgxU2hLWGIwSzFSM0RuRThXY3RjTkNxY0tQ?=
 =?utf-8?B?bHZWS1luTmxSc1hXMFZDZEVDa0Z5Q1lDcnlWc0ZuL04vVjQ4c3hSRS9JUHRy?=
 =?utf-8?B?ejZ4dHZTQUx0M2lnaUpGRklSVXhBQndRMCtNUTRWUHp6WUZndC9KWlowRHhX?=
 =?utf-8?B?QlEyaXJFUlpMWCtNQnc2TGlvaU9NVDg4OEJDQWN5aDkzQkZiMHAxUWVwZnZI?=
 =?utf-8?B?UUxEYTFVSVdjem1BeExXdUViMndGWlE3ek9SYjQzNEViSmYzUjVyRXlyK1Vv?=
 =?utf-8?B?QlAwaDYrbkl1ZW9Cd1F5QnNLMU45VTNJd1NBVldranoveW5KZkN4N0NHUUJn?=
 =?utf-8?B?c0tBQnVBeVAzSnMwaG5USm5PRHJ4bUtmRG9PcE9JaTRJSE54cXgyQUtXcjRQ?=
 =?utf-8?B?M3I0WXhrd3RnZ3ZRLzZUay9MY0NMcmhqMmI3aDlxMDBWckM5bmx3V25Ia0ls?=
 =?utf-8?B?NUZKc2tXYnNRVUdTa2NjZDBRbERKSXV0UUJnWWVDQ1VzajVZRDk3KzM4ck1s?=
 =?utf-8?B?UGUwMFZndEt6aGthRVBHdzZQVzVRcnpwM2JuNE5MVUNXaGxabVFuV3RhOGo1?=
 =?utf-8?B?bTlhT01CWnBkOWZxY2VSTlM1eEFUa0VkVlFUVGNxRXVFd2h4NHFFYk1LVTZX?=
 =?utf-8?B?dWVOZ2pDN1pza1hiZXUwNmVILytlL3orTTZjNnc5UkZxNUNsdXl6OXZqWEdK?=
 =?utf-8?B?MlV3b043ZkhleWxLMndYUjMwZTk3VjBkRjhoTE1oL0EzMzZNZDd0WjU2Lyt0?=
 =?utf-8?B?ZEUvVGhWbURodlZ2YTZSaGdKR205cURNTG5NOUkyQmlqQlE2cGtJVUUzR0pM?=
 =?utf-8?B?Z2ZaWFJEVG9lTFBSd2g1alpqUXpQKzZHVVRpSmlyWEFvTitTaHdzaUlTa3dQ?=
 =?utf-8?B?cVVWUFhQbHVjQUk5d2FkeGJzdXd2bmVJWnlnb2lQU0FqRXVHaVo4eFlRSnpq?=
 =?utf-8?B?amRRZXY1SS9RZ1ZUZTdEM0VoTEZhRlVQakdjY0ZXWXh1Q2VyTVpNdGN2dWpx?=
 =?utf-8?B?UmtjbFBHb0JjRDA3ekk4SUVLZElnd2tJTytQZnlPcXdyeEdmbWx3M1g0RFVI?=
 =?utf-8?B?NWNQam5Fcm4rVndENjJoNjg1SU13UU5hK2l6a1Jmb2RwSm1HK3laWnRNa0Va?=
 =?utf-8?B?TVFEM09SeXhKY0xuUEFaUXk0VDJsSU5HV2d3aVdPblFYNUsvS0NPVkZ1QUR4?=
 =?utf-8?B?NG13MjQyajlwUWJydWNxNjBhVWpXWlUxQXU3SEJzVFVPa2hFTENxT3lRelZR?=
 =?utf-8?B?OURiSEZza0RWdHgwRnZTaE1rNjdmcHBhMDBXNlp0OGpRZEZBRncrd1o0WGxP?=
 =?utf-8?Q?J2Ve69mJfYSV0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684b53d7-64a9-41fd-cb8b-08d8aef5a2a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2021 08:08:48.8513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4FbhNQQtPy+7apFGPHawyXABu/NXbybAqhT5tnouWUPxpT2SIBg29/kIVV1jFplmDJPEPZC8KweLkPmcb/77Vef0KjvhfaYn6hDn2gIkmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4539
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBtZW1vcnk6IFJlbmVz
YXMgUlBDLUlGOiBBZGQgc3VwcG9ydA0KPiBmb3IgUlovRzIgU2VyaWVzDQo+IA0KPiBPbiBGcmks
IEphbiAxLCAyMDIxIGF0IDEyOjU4IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBIaSBBZGFtLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0
aGUgcGF0Y2guDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IDAxIEphbnVh
cnkgMjAyMSAxMTozOQ0KPiA+ID4gVG86IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9y
Zw0KPiA+ID4gQ2M6IGFmb3JkQGJlYWNvbmVtYmVkZGVkLmNvbTsgQWRhbSBGb3JkIDxhZm9yZDE3
M0BnbWFpbC5jb20+Ow0KPiA+ID4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
PjsgUm9iIEhlcnJpbmcNCj4gPiA+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsNCj4gPiA+IE1hZ251cyBEYW1tIDxtYWdu
dXMuZGFtbUBnbWFpbC5jb20+OyBTZXJnZWkgU2h0eWx5b3YNCj4gPiA+IDxzZXJnZWkuc2h0eWx5
b3ZAZ21haWwuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkdC1iaW5k
aW5nczogbWVtb3J5OiBSZW5lc2FzIFJQQy1JRjogQWRkDQo+ID4gPiBzdXBwb3J0IGZvcg0KPiA+
ID4gUlovRzIgU2VyaWVzDQo+ID4gPg0KPiA+ID4gVGhlIFJaL0cyIFNlcmllcyBoYXMgdGhlIFJQ
Qy1JRiBpbnRlcmZhY2UuDQo+ID4gPiBVcGRhdGUgYmluZGluZ3MgdG8gc3VwcG9ydDogcjhhNzc0
YTEsIHI4YTc3NGIxLCByOGE3NzRjMCwgYW5kDQo+ID4gPiByOGE3NzRlMQ0KPiA+ID4NCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFkYW0gRm9yZCA8YWZvcmQxNzNAZ21haWwuY29tPg0KPiA+ID4gLS0t
DQo+ID4gPiAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9yZW5lc2FzLHJwYy1pZi55
YW1sICAgICAgICAgICB8IDQNCj4gKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gPiA+IGNvbnRyb2xsZXJzL3JlbmVzYXMscnBjLWlmLnlh
bWwNCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250
cm9sbGVycy9yZW5lc2FzLHJwYy1pDQo+ID4gPiBmLnlhbWwgaW5kZXggNmQ2YmE2MDhmZDIyLi4w
NTBjNjZhZjhjMmMgMTAwNjQ0DQo+ID4gPiAtLS0NCj4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9yZW5lc2FzLHJwYy0NCj4gPiA+IGlm
LnlhbWwNCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1v
cnktY29udHJvbGxlcnMvcmVuZXNhcyxyDQo+ID4gPiArKysgcGMtDQo+ID4gPiBpZi55YW1sDQo+
ID4gPiBAQCAtMjYsNiArMjYsMTAgQEAgcHJvcGVydGllczoNCj4gPiA+ICAgIGNvbXBhdGlibGU6
DQo+ID4gPiAgICAgIGl0ZW1zOg0KPiA+ID4gICAgICAgIC0gZW51bToNCj4gPiA+ICsgICAgICAg
ICAgLSByZW5lc2FzLHI4YTc3NGExLXJwYy1pZiAgICAgICAjIFJaL0cyTQ0KPiA+ID4gKyAgICAg
ICAgICAtIHJlbmVzYXMscjhhNzc0YjEtcnBjLWlmICAgICAgICMgUlovRzJODQo+ID4gPiArICAg
ICAgICAgIC0gcmVuZXNhcyxyOGE3NzRjMC1ycGMtaWYgICAgICAgIyBSWi9HMkUNCj4gPiA+ICsg
ICAgICAgICAgLSByZW5lc2FzLHI4YTc3NGUxLXJwYy1pZiAgICAgICAjIFJaL0cySA0KPiA+ID4g
ICAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5NzAtcnBjLWlmICAgICAgICMgUi1DYXIgVjNNDQo+
ID4gPiAgICAgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk4MC1ycGMtaWYgICAgICAgIyBSLUNhciBW
M0gNCj4gPiA+ICAgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OTk1LXJwYy1pZiAgICAgICAjIFIt
Q2FyIEQzDQo+ID4NCj4gPiBNYXkgYmUgd2UgbmVlZCB0byB1cGRhdGUgdGhlIGJlbG93IGRlc2Ny
aXB0aW9uIGFzIHdlbGwgdG8gY292ZXIgUlovRzINCj4gZGV2aWNlPz8NCj4gPg0KPiA+IC0gY29u
c3Q6IHJlbmVzYXMscmNhci1nZW4zLXJwYy1pZiAgICMgYSBnZW5lcmljIFItQ2FyIGdlbjMgZGV2
aWNlDQoNClNpbmNlIGl0IGlzIGdlbmVyaWMgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGJvdGggUi1D
YXIgZ2VuMyBhbmQgUlovRzIgZGV2aWNlLCBJIHdvdWxkIHVwZGF0ZSB0aGUgZGVzY3JpcHRpb24g
YXMNCg0KLSBjb25zdDogcmVuZXNhcyxyY2FyLWdlbjMtcnBjLWlmICAgIyBhIGdlbmVyaWMgUi1D
YXIgZ2VuMyBvciBSWi9HMiBkZXZpY2UNCg0KQWxzbyBtYXkgYmUgd2UgbmVlZCB0byB1cGRhdGUg
dGhlIGRlc2NyaXB0aW9uIG9mIGNvbmZpZyBSRU5FU0FTX1JQQ0lGIGluIGRyaXZlcnMvbWVtb3J5
L0tjb25maWcgdG8gdGFrZW4gY2FyZSBvZiBSWi9HMiBkZXZpY2VzIGluIGEgc2VwYXJhdGUgcGF0
Y2guDQoNCkNoZWVycywNCkJpanUNCg0KDQo=
