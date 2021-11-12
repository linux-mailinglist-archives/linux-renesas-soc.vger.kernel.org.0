Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1532344E9BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 16:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhKLPPD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 10:15:03 -0500
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:47936
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229547AbhKLPPC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 10:15:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6emgKYQggOTkV7n7UGbQqkjIClkCdKHCS6wePMx7n+d8TEPOVlnFA0QEpGBOkyJD956ztxNgqTn3VmNSPs5GnV+anWKIb59ZeYFinf9g5AVDhx2ZymelPtpT8QTVakpT9pc6FYro6W9+wGOvUNWdtFeOrS7ZlKg/a/4v1wWQqctonAvYaAOTmmC83lDX0VdjHXiF6W3uzRjjOgffQZd2xJHuNLUhhiUevI0IgmV/8LzVREnBD72qdWAAI7UN5I5MakvitbvoSH3hsQ7DKKgbttAXAmUZLzMEDG4LHrLHOB5vsOy2bkOC+16d3lPb8H5YKuebouOthAVVrs1K4Oozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFLuCopi84+AlwwqIKV2F8VOkXWBFFn2TExIY51Vqpg=;
 b=Ezr6VV7wD/tAwtl1M38rtFstlMUK0a+cXfoO3A8PPp8hACEN57vF4PvsAm6CYMDkyFJasbYkS+P4oh8GviMaxLvXt/Ti3CLRjuxxf5KhJwUu+Tuk3Fbf0U1tlgbScZAhzBq74dGxQJ125NHsVhx1BWqd+5EAS9V7sMjAUVs8ykTBdBBvu/+PQcXotZnIIoHn3xNnn6Gr8CC39OesY7g13u4Qrl6TCT5yeWtkDDLSL9tsoTfrz58FrgGr6pQXGzLi4NK6iUUiTIElem8Iswsy9Mnf8RN0QPCLN9hOkaZyKNpemaiDWhQshtSx+0iciGDXZWjgkq2lWtgeyOhV62WwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFLuCopi84+AlwwqIKV2F8VOkXWBFFn2TExIY51Vqpg=;
 b=Lkv/QJCwpWsq9cMwZJceFvyRsvPjB2kqUTsHqQGXW5/ACIIeslLDEO/Jcgd+Uo1OkTIr+ik+sGI/j3suD7WFGsIYOMLuq5NlwUtkjyZEHmRtSIMeaydLVdMi61a4eQrxuviialrofY7hUHJ19BFxNSKXPxBm1M2DNpnIZ/ryCc4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5957.jpnprd01.prod.outlook.com (2603:1096:604:d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 12 Nov
 2021 15:12:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4669.021; Fri, 12 Nov 2021
 15:12:09 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Topic: [PATCH v2 3/3] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1kga/bAok/kurkSGky574+HrCav//ngAgAAD7ZA=
Date:   Fri, 12 Nov 2021 15:12:09 +0000
Message-ID: <OS0PR01MB592261CFF5DB51DA3B4765BA86959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com>
 <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
In-Reply-To: <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4fb2622-b562-4d9a-2fba-08d9a5eecc23
x-ms-traffictypediagnostic: OS3PR01MB5957:
x-microsoft-antispam-prvs: <OS3PR01MB5957CFED45A46BD28695B88886959@OS3PR01MB5957.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VzCl82Fo0E958RVjSH3nSUqoZkIsqXcHlaFBIow0JfYNXK5i41KC42FxNv9Z8vssbGVW+KtBEfxRqS2w6zhRQudHIyC2dGdPLN6TtGDKfYta2/Dt0+AQ626BmnxRLzldFOFAuR4wV5J9CF6iiSu62KjbbMTazi2h2KMFizitGfAAR7klYRpASHnMftYI7d0+RDulNG7uOQQkvyZFzG+RQLgipHTeDRmlB/5Mfl3xAF/fea0sdz2p9h+pKVMDAiGttBWddd+VQqpQJS6EjdZDotX7aT8hThr3Ur27uY/sdVf2JnSJUlGWxj/x71Nydg6b2FOHTNuPkdNPvzA0by6GiqYQCz0g5sI+eL7TiQ7P1IataDhVOJgfoJpMIICXDvwQWLmSPn3YE5lMuczWvFuVWshhzEayQVPX5cqyWBcauUKbBMY0xQLVULKt90fNNcWmiHh0pNy2CdTvqA0nF0erATLLHFJzo8hVdVZuLCBydVai1MyqKcCmLXXNu2Lt6RjOHvHrtQeWlKL9jOvsTpSpNGiLh84NzVnBaCDRQQh0LdArttxPtfmSzIXI9NfRmvoGfQhUnpCOtKNDrZJl62MhzNcfG+6FBIbmNsomf/XEXP3lqAmGdnp/9A7Q50GiY44zzgBNiwX8Yk73eexEz+ENWjojNTA6oe0SEQOjqaIdAgkwI6dh+bw435e4Mergv1nawHdwEa8jY7ss8MO8Cv58ww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(33656002)(38100700002)(4326008)(122000001)(6916009)(508600001)(26005)(5660300002)(66446008)(64756008)(76116006)(7696005)(66556008)(86362001)(66946007)(66476007)(316002)(8676002)(53546011)(6506007)(186003)(2906002)(7416002)(52536014)(9686003)(54906003)(8936002)(55016002)(71200400001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rng3Sk82QmNFV0laemhMRGlmKzRrdkRYZlEyWmFkblJvcGoxVzFpZG9qVnpR?=
 =?utf-8?B?TkQzalorYW5YU0ZJYjhMRVd1R2M3bWVSTWhrTUxSMzdwR3FtVGdFV0U4ZGVK?=
 =?utf-8?B?LzhhZnpvWFB5anI4TFVYaTJIZFlGM1JVYlI0eCsxUlRXRXFDMGNNcFloZTQ5?=
 =?utf-8?B?RVVlZk90TTVXQ0duZWZiTFFQWTFHM3dvYzVCSWc3VDdMZjY2WmFNQ2wydUti?=
 =?utf-8?B?SC8zdTNWQ2d1YTkwVkZvK0ZwUFM1SVloRTVvQVRZczg1VmlnbG5YaDV5cDdh?=
 =?utf-8?B?ZlpsSGFSbVYyejVSV3Q4K1kvMFFjZ3Qza0cwL3R0VkMzMkVVMG50YUlSWnh4?=
 =?utf-8?B?Y3hvajJ2MkNVSjNTOUovRkdXK2JEc3FsQ2RQUEtXeWNLazNkaDY3eTlUNzI4?=
 =?utf-8?B?MXRRY2ZUTU9hazVpQ1F4M2pwLzhPY2tpK3FxK2FRbHU2bzBrMXc5ZGtvMEdG?=
 =?utf-8?B?V21QcEtsTjNySDFpTVYrMmduM0ZMT3dnVXNhaVUrMlgyQmtGeUphQTJKanhH?=
 =?utf-8?B?ZEZIVklNSlBtY1AyNTdmNTQ1Q3Y0MU14RUh6SzBUK2lYdGVZVXpDT2FmVWZL?=
 =?utf-8?B?OWQ1R25qakVvYlNJYndiVEVYZ0lpU2RWbUNWQUdXMEw5K3JaOEFmYUwzd1VP?=
 =?utf-8?B?STZzU2FhamlmdnpyV1laUkJiTDVsZ3VMZG9yUjhFMXMxN1AyUkx4VnlwU1VD?=
 =?utf-8?B?QXA5aFpRRmp5VVozQnBaS3B5T1F5bHRGeG1FSGxYWTRCeVZtb1RpTWZJaG9U?=
 =?utf-8?B?OG9YN0xUaStsTEM3TDliYmRGY0ZseFBLNUlMWVEyVlNqa0F2WWg1dzNZQzFk?=
 =?utf-8?B?M1VjU094VktaaG8wKzAwUGZ2NzNUSTRkazd4dEp5TzY1NFNldW9vc05ZS2FX?=
 =?utf-8?B?aUE5cGJoWXRFRGhzU3l2UXNMQnRzcXI4MEdCMG8xMjY5MEpORUl6K3BiVFll?=
 =?utf-8?B?cUVTc3NiOVpFUEo4ZnFObUVTcVhvQk1nYyt5VUI4QkRyaTE0cStZSWpNaGRv?=
 =?utf-8?B?YSs2Zy9aanh1blZUUEM3VW9WYzYwaURrR29HTCtld3h6VGZHV1IxemFTU3o5?=
 =?utf-8?B?eTF3MEllR3l2TTdjSUdZVkdXcG1VUElpNUFYeVJHM1djOXpFckRyRlVhZVBC?=
 =?utf-8?B?eEhhZmdoeTNpN29uWUxtcXlEa2lacWdkYitpMjFvanErdHM1MFBYdHVsN2Jv?=
 =?utf-8?B?QmNjVHFIOWhEZGdyNWJCTDYwWm0zYWhpRTZHWXRFdzhiRzR2WXNabnVnZzBk?=
 =?utf-8?B?Y05MZzI0cEFFOG5nS1RjRnJveUFnQVVUaWhWMUtKUW1KOTl2YlpFblBvcmx4?=
 =?utf-8?B?MGhiaHUwRE9SY00rd0lYK2lVUGkvcStHcmw1bXNjbXo0S2VZaW5Halp3WnB2?=
 =?utf-8?B?YVE4UEVyYWFTcFNta1p6bjVIRkQ2ZHNaSnFEWmFYZ2QzZE9RdGxjTVk5Ri9j?=
 =?utf-8?B?ZkN1UnY3VFhub09PN1kwQnluOGR5bDc4STd2d0hxNzl4K0JVY1gxQWd5aUo0?=
 =?utf-8?B?a08wWWhSc0NVNWtHNXRsczBKVGovUzhhWStaTVNhMExWQkhVQkJmNnRwcnNH?=
 =?utf-8?B?RHl3eFBrSmhpeDRuK3llTXRtNEIvZjZKaUJVTG9sdTdqRFRtcGk2S0MzK3RK?=
 =?utf-8?B?b2t3bjI3WmZBTk14Y0ptMThyUE1MRDVTay82aUNVM2tMSmhabVZaWUxOU1BS?=
 =?utf-8?B?aWp3NVZUUlBmN0Z6V2xSVUhOTG9nMG5yN2tzSkFGNlVNWlhPbHJ2SzBQQWxQ?=
 =?utf-8?B?M1NHME96VVJoNG1WVnRuU2VoQi9ueHQ5TUswTTZ6LzRTMzh2YkIwSHo3ZWJC?=
 =?utf-8?B?RlZWOXBDODlNRGIvdzlWdytJWXQ2UkJPQ1ZLanNWTU9rODFFcU9DeVQzN0du?=
 =?utf-8?B?eXk3MTA5dkNzZVpla0NIaElyUkVIVWJ5M01ta0NtN3ovM3d6Q2E4Z3Bwdkpx?=
 =?utf-8?B?NWIxQm02dGRoVVFhSlhJUUZ6cEZRTzVvbzN6L2dISWlBdzVRRStKRTJOTDJZ?=
 =?utf-8?B?d0xJbjF0RjJuMVJYYkptdFRsYkVFcVVrTEpsSW5XVU5RTCs3WkFTeC9kOFBL?=
 =?utf-8?B?ZEIzaU5FVzRsZkFxbDRlTXlGZUU1TjBxZitvQVhsUS9rTDdrT3R1UDNtck9R?=
 =?utf-8?B?dGNWUVpWa0VGNzlvcFRBR1VnM2Q5N2NDQi9YdHlGNVA2MXlVYkEwTGZ6bENT?=
 =?utf-8?B?WjRkQS9MM1FIMU9BNnZCWnFaRTFsUURVWXBabjJ0TnZyVFpkWTZOQmR6ekp5?=
 =?utf-8?B?Q2R1Z3FaMXRlKzdNOWIxWE9VRGJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fb2622-b562-4d9a-2fba-08d9a5eecc23
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 15:12:09.3312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAhaQFTmVPtqkel5kNd+Zi3pQ4k9jtqncY+cSLFRKvCe4toSe9FAeixrBa5KEY7ZDDBYujZSQQxmujAp82/637zTSP9p5HJA5+A5nBCsdpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5957
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy8zXSBjbG9ja3NvdXJjZS9kcml2ZXJzL3JlbmVzYXMtb3N0bTogQWRkIFJaL0cy
TA0KPiBPU1RNIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIE5vdiAxMCwg
MjAyMSBhdCA0OjMyIFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gUlovRzJMIFNvQyBoYXMgR2VuZXJpYyBUaW1lciBNb2R1bGUoYS5rLmEgT1NU
TSkgd2hpY2ggbmVlZHMgdG8NCj4gPiBkZWFzc2VydCB0aGUgcmVzZXQgbGluZSBiZWZvcmUgYWNj
ZXNzaW5nIGFueSByZWdpc3RlcnMuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGFkZHMgYW4gZW50cnkg
cG9pbnQgZm9yIFJaL0cyTCBzbyB0aGF0IHdlIGNhbiBkZWFzc2VydCB0aGUNCj4gPiByZXNldCBs
aW5lIGluIHByb2JlIGNhbGxiYWNrLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhh
a2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVu
ZXNhcy1vc3RtLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5j
DQo+IA0KPiA+IEBAIC0xNjYsNiArMTY5LDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IG9zdG1faW5p
dChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQ0KPiA+ICAgICAgICAgaWYgKCF0bykNCj4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiArICAgICAgIHJzdGMgPSBvZl9y
ZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUobnAsIE5VTEwpOw0KPiA+ICsgICAg
ICAgaWYgKElTX0VSUihyc3RjKSkgew0KPiA+ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJS
KHJzdGMpOw0KPiA+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9mcmVlOw0KPiA+ICsgICAgICAg
fQ0KPiA+ICsNCj4gPiArICAgICAgIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7DQo+ID4g
Kw0KPiA+ICAgICAgICAgdG8tPmZsYWdzID0gVElNRVJfT0ZfQkFTRSB8IFRJTUVSX09GX0NMT0NL
Ow0KPiA+ICAgICAgICAgaWYgKHN5c3RlbV9jbG9jaykgew0KPiA+ICAgICAgICAgICAgICAgICAv
Kg0KPiA+IEBAIC0xNzgsNyArMTg5LDcgQEAgc3RhdGljIGludCBfX2luaXQgb3N0bV9pbml0KHN0
cnVjdCBkZXZpY2Vfbm9kZQ0KPiA+ICpucCkNCj4gPg0KPiA+ICAgICAgICAgcmV0ID0gdGltZXJf
b2ZfaW5pdChucCwgdG8pOw0KPiA+ICAgICAgICAgaWYgKHJldCkNCj4gPiAtICAgICAgICAgICAg
ICAgZ290byBlcnJfZnJlZTsNCj4gPiArICAgICAgICAgICAgICAgZ290byBlcnJfcmVzZXQ7DQo+
ID4NCj4gPiAgICAgICAgIC8qDQo+ID4gICAgICAgICAgKiBGaXJzdCBwcm9iZWQgZGV2aWNlIHdp
bGwgYmUgdXNlZCBhcyBzeXN0ZW0gY2xvY2tzb3VyY2UuIEFueQ0KPiA+IEBAIC0yMDMsOSArMjE0
LDMzIEBAIHN0YXRpYyBpbnQgX19pbml0IG9zdG1faW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUNCj4g
PiAqbnApDQo+ID4NCj4gPiAgZXJyX2NsZWFudXA6DQo+ID4gICAgICAgICB0aW1lcl9vZl9jbGVh
bnVwKHRvKTsNCj4gPiArZXJyX3Jlc2V0Og0KPiA+ICsgICAgICAgcmVzZXRfY29udHJvbF9hc3Nl
cnQocnN0Yyk7DQo+IA0KPiBNaXNzaW5nIHJlc2V0X2NvbnRyb2xfcHV0KHJzdGMpLg0KDQpPb3Bz
LiBNaXNzZWQgaXQuIFdpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbg0KDQpSZWdhcmRzLA0KQmlq
dQ0KDQo+IA0KPiA+ICBlcnJfZnJlZToNCj4gPiAgICAgICAgIGtmcmVlKHRvKTsNCj4gPiAgICAg
ICAgIHJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICBUSU1FUl9PRl9ERUNMQVJFKG9zdG0s
ICJyZW5lc2FzLG9zdG0iLCBvc3RtX2luaXQpOw0KPiA+ICsNCj4gPiArI2lmZGVmIENPTkZJR19B
UkNIX1I5QTA3RzA0NA0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBvc3RtX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpIHsNCj4gPiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIG9zdG1faW5pdChkZXYtPm9m
X25vZGUpOyB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBv
c3RtX29mX3RhYmxlW10gPSB7DQo+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMs
b3N0bSIsIH0sDQo+ID4gKyAgICAgICB7IC8qIHNlbnRpbmVsICovIH0NCj4gPiArfTsNCj4gPiAr
DQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG9zdG1fZGV2aWNlX2RyaXZlciA9
IHsNCj4gPiArICAgICAgIC5kcml2ZXIgPSB7DQo+ID4gKyAgICAgICAgICAgICAgIC5uYW1lID0g
InJlbmVzYXNfb3N0bSIsDQo+ID4gKyAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IG9m
X21hdGNoX3B0cihvc3RtX29mX3RhYmxlKSwNCj4gDQo+IC5zdXBwcmVzc19iaW5kX2F0dHJzID0g
dHJ1ZT8NCj4gDQo+ID4gKyAgICAgICB9LA0KPiA+ICt9Ow0KPiA+ICtidWlsdGluX3BsYXRmb3Jt
X2RyaXZlcl9wcm9iZShvc3RtX2RldmljZV9kcml2ZXIsIG9zdG1fcHJvYmUpOyAjZW5kaWYNCj4g
DQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
