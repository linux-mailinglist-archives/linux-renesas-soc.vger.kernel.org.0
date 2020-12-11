Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42F22D7696
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 14:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731295AbgLKNas (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 08:30:48 -0500
Received: from mail-am6eur05on2040.outbound.protection.outlook.com ([40.107.22.40]:59361
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394178AbgLKNaI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 08:30:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j03P6labW1OqGw5cETtTAXMaFDgS0J6cW5/Wv8n9o/FgncTREeucpvCxgFiPU6LVQ5T+GSVwMChTFw/IcmZ1HYW4deu2COhrXkGF10s0GyNtYwcnaEWPTlxd/bmbmqCvvC6hqa/HEVcUqvDf2+eZefaE9Bp7WVCTAHHVvQm16VKJTo7YI783NH2OCAJya3dpx39LTQPUWsAb5eC0r4Pbyg4oY7ZhooMD3xUWvyftW+KCFD0ysIxHEBD74Z/N39CLbn2IMn10S5vpxnn04Zk1ocvx5yX6LRMTWFvip9gQAo7h1/y3tiLnzaFKNSMHQiQF91x1mICkedj/2LZrElqd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIejI713CKpGoKiUomv3ep+fye0v8T27wOoYKvUt/sI=;
 b=jrUkIOgm6jNrgoRbSIvhDwAHfjQDJkU757SyjczW9CHTvvcV5l/XkmFB1ezgVnT874V2FWcUvCHDbFix/xL6MF/5PrUL1LpndLz0JSKCGx4cnQbB6KNoIgNxIXIbHqIkOUQek0wM3OgfTCGCrTiP45cFBm4VF65OQYvb4WT/lG28tkoFECTuXk44EEmluom/Jnvvm2nK29leM0Q8/9KX0v4N8tGXzIi7FxthxImReBUSeGLpMnQPUEvK5yKTZo31r++MfTnqMuuQT+Qv8mWcIghb+/MD3ihx7tF0kIsmedjmr9l51jGUkmGTUHQe30Xrs1mp1uvkx9UuY0N6LUsxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIejI713CKpGoKiUomv3ep+fye0v8T27wOoYKvUt/sI=;
 b=AN9vWIrVb+uv/Q9hp0mY6jTyTjx4Nvh+ga/0aO51SbB8Z/IKF8aQTHMcp5AJKP89Lntcvel6D5keLru6e36Dw71OEjIex8Q1VDlsJ3cgSx63B0oGKaRVk9guHg1wRykdmTsRNwiiBtJAku2pGErk1wIqGu1awaiIot8mUxZerkE=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2667.eurprd03.prod.outlook.com (2603:10a6:3:ee::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.13; Fri, 11 Dec 2020 13:29:16 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 13:29:16 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/10] mfd: bd9571mwv: Make the driver more generic
Thread-Topic: [PATCH v2 09/10] mfd: bd9571mwv: Make the driver more generic
Thread-Index: AQHWz7CxIAplfmaFvES536Qq8YJ+sqnx49aA
Date:   Fri, 11 Dec 2020 13:29:16 +0000
Message-ID: <bffe84a32c983b5d15fb5e0b3b42dc8b28d6f3bf.camel@fi.rohmeurope.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607686060-17448-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1607686060-17448-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3d3657a-55d4-4958-e941-08d89dd8c1c4
x-ms-traffictypediagnostic: HE1PR0302MB2667:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0302MB2667BF5D9F73D30D18F5917AADCA0@HE1PR0302MB2667.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Au7tOlJAgwPFiMtfmU8v6zLWvPXaH+SWl6lf+jt5LF84KV3dO7ZgFGLNgF0bMLDfGXMbv31QuOrdT3YsmgtzJtDWpSLh8IyTCexmsf50IpHjuBzMoTaD6MK9I/CMiCPg/0uuVclJ7Fwp2V0LCQtAOLYtfsLm8YKAJR9Vs3Uo1OyIeKkYjtA6HkICFN79cTt7STbjZmfdIx7FOCBQHgbJedo1vpEj7zEowsqGQlei7vjE9YXMEZ2etPW/ge/kz/Clw4311eHJs4HK30nchrJKUowmy99nxmmee3jMh+BLYWdFH3H9Vp4dnkLOJz48KG86gGJcuui9A98V244oc84yG61wP0vwwWadtIlTksDG0gVK5nmfcN+5yjE3T9AL28K1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(366004)(346002)(136003)(376002)(86362001)(316002)(4001150100001)(4326008)(66476007)(2906002)(8676002)(2616005)(186003)(76116006)(6486002)(6512007)(5660300002)(83380400001)(6506007)(71200400001)(7416002)(8936002)(26005)(54906003)(66946007)(64756008)(110136005)(3450700001)(66556008)(478600001)(66446008)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M25IbHF2cnh4Nkpad0IvWGtaWm9XVVZNZ3JYZk84a1Y4dENWNUlXRUJlZ3Nt?=
 =?utf-8?B?cmVvSWtJekpEQ2VaWkd1RUpiSUhBQjd0b0JkREs1dGYraStsdEVTa2p0Z0pR?=
 =?utf-8?B?UzBqRmM3Tk5TWlBGc205cVZudmtwVDY1c1Urdjd5aDNVZEVveWtZdEFlNU80?=
 =?utf-8?B?MDFBZ05abkp0ZU1nUDgyS3hkZHR1aDRDakR4RHpWVHpiN3ZOdTMzSE5paWtG?=
 =?utf-8?B?QlBURDA2SEc5cEhRc013WTZBd1FVUUU1R0l2VU8vUDEwdXFiVTR5emg5c0xw?=
 =?utf-8?B?Z1ZpdW9abmpuclpGUm16OHBOeExidEx6eDgyRW12SXdFWHJLREo3OW5pQUNC?=
 =?utf-8?B?ak5jZ0RmVzhWZGtFWU9SQ3hZWnNyaU1ieUJ3TXlIZE00S2xrKzkvSGVmYWlC?=
 =?utf-8?B?cGhCTFR1S1ZRZHA3RDJqbEdwQXdMM0VxTEIzcFRKRURHbS82TWlxbnJLUEVJ?=
 =?utf-8?B?ZHQzNDNYMlFqbkcxL1RJb0tHS1Joa3p6dEpxd2VkTHRXa0x1bkpSbmpEb3Nz?=
 =?utf-8?B?RkdJM0YrR2xwZVVxVzYxcll2MTZmb1ZHem1qdmNVRDh0N1NvL2tjNkV6VDRh?=
 =?utf-8?B?OGIxamQ2OWdRc010YWdnMUpjbE9ab3BSbkZnRlNXMVhLT0pxcitEWlpTcDkz?=
 =?utf-8?B?VFozeFZIcXAyRjR3MXl3dS90MzZUMlBtVXI5bHBhTEFyVzgzcmkxL1ZIaitF?=
 =?utf-8?B?aUFPM1dFSmtyM2NCYUkwYXNFOGhLRDJneFQxZm9HUjV0U0NRZG9RRGhZMnZC?=
 =?utf-8?B?V0lsVVRxVyt3elVYN2hUcTBnaWJleVcxeTJGemVMZkMveTdXN2Q3bTMxMHNS?=
 =?utf-8?B?ZUR1dDZtT1RZVy9pM0swSllhY01mSmI2cHJUd0ZMaENCRVhPWmU2Vyt6bEpT?=
 =?utf-8?B?YnFndE92KzZ4V0h3OVZSOGt1KzUyQ05SOW1xZFZtNlhmNlh6WlVTekU1bkoy?=
 =?utf-8?B?UmxXVFRpdmltNVlPRjJTaWtTVjE3M1FQWEtDTjVsUHdnTS9rd0dXSlZkbkNl?=
 =?utf-8?B?T01SNklsNHZmS1VCZk1kQzVEWjlPNmRhekJMV2ZCbG5KT01aNWJyN2h1ajVw?=
 =?utf-8?B?SE1La3BQcDViSHR0SnlFRkRKM2R4YWU5eXZJQWNMbFNod2lsalRCRmFabTJ5?=
 =?utf-8?B?aENoeWNHNXdiZFF4V1diSG1nVFpwZ1NCanB0VjhBMGdjbHlMNHc5cTRJRXJP?=
 =?utf-8?B?ZURyU2NBUWhZWlZxRmFtVjJOQ0ZFRHErOGl6NW9kMFBHcVRjQWlHTEMyWVJi?=
 =?utf-8?B?cnZJdFNZSk9BL2s2SkVWdnNmMW5Pc0JUbVlzZVFUOXBlaDduVWZTZ0s3ZkdZ?=
 =?utf-8?Q?efbM0QSpgHy/3F4RmNjJw6WBj+dWfxFwx4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08A74DD05A1E7748B1B8AB0EBC2D50DB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d3657a-55d4-4958-e941-08d89dd8c1c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 13:29:16.1479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6+gNA3Un8HqV2GxCTSmacWAWLEE0WFoOSYfzH8TsfrhLWFV1oPNw+5UqtvhrvFUNexL4hicZvzWRjPfiiaqhElhgsmHcP+UZ+nuMumxeaZkA7hzapWgTOF0rE9Uwgc4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2667
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgWW9zaGloaXJvLXNhbiwNCg0KDQpPbiBGcmksIDIwMjAtMTItMTEgYXQgMjA6MjcgKzA5MDAs
IFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiBGcm9tOiBLaGllbSBOZ3V5ZW4gPGtoaWVtLm5n
dXllbi54dEByZW5lc2FzLmNvbT4NCj4gDQo+IFNpbmNlIHRoZSBkcml2ZXIgc3VwcG9ydHMgQkQ5
NTcxTVdWIFBNSUMgb25seSwNCj4gdGhpcyBwYXRjaCBtYWtlcyB0aGUgZnVuY3Rpb25zIGFuZCBk
YXRhIHN0cnVjdHVyZSBiZWNvbWUgbW9yZSBnZW5lcmljDQo+IHNvIHRoYXQgaXQgY2FuIHN1cHBv
cnQgb3RoZXIgUE1JQyB2YXJpYW50cyBhcyB3ZWxsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2hp
ZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5jb20+DQo+IFtzaGltb2RhOiByZWJh
c2UgYW5kIHJlZmFjdG9yXQ0KPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZmQvYmQ5
NTcxbXd2LmMgICAgICAgfCA3MQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tDQo+ICBpbmNsdWRlL2xpbnV4L21mZC9iZDk1NzFtd3YuaCB8IDE4ICsrLS0tLS0t
LS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jIGIvZHJpdmVycy9t
ZmQvYmQ5NTcxbXd2LmMNCj4gaW5kZXggODBjNmVmMC4uYWRiOWUzZCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMNCj4gKysrIGIvZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMN
Cj4gQEAgLTMsNiArMyw3IEBADQo+ICAgKiBST0hNIEJEOTU3MU1XVi1NIE1GRCBkcml2ZXINCj4g
ICAqDQo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMTcgTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3Jl
bmVzYXNAZ21haWwuY29tPg0KPiArICogQ29weXJpZ2h0IChDKSAyMDIwIFJlbmVzYXMgRWxlY3Ry
b25pY3MgQ29ycG9yYXRpb24NCj4gICAqDQo+ICAgKiBCYXNlZCBvbiB0aGUgVFBTNjUwODYgZHJp
dmVyDQo+ICAgKi8NCj4gQEAgLTE0LDYgKzE1LDM0IEBADQo+ICANCj4gICNpbmNsdWRlIDxsaW51
eC9tZmQvYmQ5NTcxbXd2Lmg+DQo+ICANCj4gKy8qKg0KPiArICogc3RydWN0IGJkOTU3eF9kYXRh
IC0gaW50ZXJuYWwgZGF0YSBmb3IgdGhlIGJkOTU3eCBkcml2ZXINCj4gKyAqDQo+ICsgKiBJbnRl
cm5hbCBkYXRhIHRvIGRpc3Rpbmd1aXNoIGJkOTU3eCB2YXJpYW50cw0KPiArICovDQo+ICtzdHJ1
Y3QgYmQ5NTd4X2RhdGEgew0KPiArCWNoYXIgKnBhcnRfbmFtZTsNCj4gKwljb25zdCBzdHJ1Y3Qg
cmVnbWFwX2NvbmZpZyAqcmVnbWFwX2NvbmZpZzsNCj4gKwljb25zdCBzdHJ1Y3QgcmVnbWFwX2ly
cV9jaGlwICppcnFfY2hpcDsNCj4gKwljb25zdCBzdHJ1Y3QgbWZkX2NlbGwgKmNlbGxzOw0KPiAr
CWludCBudW1fY2VsbHM7DQo+ICt9Ow0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBiZDk1NzFt
d3YgLSBzdGF0ZSBob2xkZXIgZm9yIHRoZSBiZDk1NzFtd3YgZHJpdmVyDQo+ICsgKg0KPiArICog
RGV2aWNlIGRhdGEgbWF5IGJlIHVzZWQgdG8gYWNjZXNzIHRoZSBCRDk1NzFNV1YgY2hpcA0KPiAr
ICovDQo+ICtzdHJ1Y3QgYmQ5NTcxbXd2IHsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ICsJ
c3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPiArCWNvbnN0IHN0cnVjdCBiZDk1N3hfZGF0YSAqZGF0
YTsNCj4gKw0KPiArCS8qIElSUSBEYXRhICovDQo+ICsJaW50IGlycTsNCj4gKwlzdHJ1Y3QgcmVn
bWFwX2lycV9jaGlwX2RhdGEgKmlycV9kYXRhOw0KPiArfTsNCj4gKw0KDQpJIHN0aWxsIGRvbid0
IHNlZSB3aHkgeW91IGFjdHVhbGx5IG5lZWQgdGhpcyBzdHJ1Y3R1cmU/DQoNCj4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbWZkX2NlbGwgYmQ5NTcxbXd2X2NlbGxzW10gPSB7DQo+ICAJeyAubmFtZSA9
ICJiZDk1NzFtd3YtcmVndWxhdG9yIiwgfSwNCj4gIAl7IC5uYW1lID0gImJkOTU3MW13di1ncGlv
IiwgfSwNCj4gQEAgLTEwMiw2ICsxMzEsMTQgQEAgc3RhdGljIHN0cnVjdCByZWdtYXBfaXJxX2No
aXAgYmQ5NTcxbXd2X2lycV9jaGlwDQo+ID0gew0KPiAgCS5udW1faXJxcwk9IEFSUkFZX1NJWkUo
YmQ5NTcxbXd2X2lycXMpLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBiZDk1
N3hfZGF0YSBiZDk1NzFtd3ZfZGF0YSA9IHsNCj4gKwkucGFydF9uYW1lID0gQkQ5NTcxTVdWX1BB
UlRfTkFNRSwNCj4gKwkucmVnbWFwX2NvbmZpZyA9ICZiZDk1NzFtd3ZfcmVnbWFwX2NvbmZpZywN
Cj4gKwkuaXJxX2NoaXAgPSAmYmQ5NTcxbXd2X2lycV9jaGlwLA0KPiArCS5jZWxscyA9IGJkOTU3
MW13dl9jZWxscywNCj4gKwkubnVtX2NlbGxzID0gQVJSQVlfU0laRShiZDk1NzFtd3ZfY2VsbHMp
LA0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGludCBiZDk1NzFtd3ZfaWRlbnRpZnkoc3RydWN0IGJk
OTU3MW13diAqYmQpDQo+ICB7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gYmQtPmRldjsNCj4g
QEAgLTEyNywxMyArMTY0LDYgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfaWRlbnRpZnkoc3RydWN0
IGJkOTU3MW13dg0KPiAqYmQpDQo+ICAJCQlyZXQpOw0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgCX0N
Cj4gLQ0KPiAtCWlmICh2YWx1ZSAhPSBCRDk1NzFNV1ZfUFJPRFVDVF9DT0RFX1ZBTCkgew0KPiAt
CQlkZXZfZXJyKGRldiwgIkludmFsaWQgcHJvZHVjdCBjb2RlIElEICUwMnggKGV4cGVjdGVkDQo+
ICUwMngpXG4iLA0KPiAtCQkJdmFsdWUsIEJEOTU3MU1XVl9QUk9EVUNUX0NPREVfVkFMKTsNCj4g
LQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0JfQ0KPiAtDQo+ICAJcmV0ID0gcmVnbWFwX3JlYWQoYmQt
PnJlZ21hcCwgQkQ5NTcxTVdWX1BST0RVQ1RfUkVWSVNJT04sDQo+ICZ2YWx1ZSk7DQo+ICAJaWYg
KHJldCkgew0KPiAgCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZWFkIHJldmlzaW9uIHJlZ2lz
dGVyDQo+IChyZXQ9JWkpXG4iLA0KPiBAQCAtMTQxLDcgKzE3MSw4IEBAIHN0YXRpYyBpbnQgYmQ5
NTcxbXd2X2lkZW50aWZ5KHN0cnVjdCBiZDk1NzFtd3YNCj4gKmJkKQ0KPiAgCQlyZXR1cm4gcmV0
Ow0KPiAgCX0NCj4gIA0KPiAtCWRldl9pbmZvKGRldiwgIkRldmljZTogQkQ5NTcxTVdWIHJldi4g
JWRcbiIsIHZhbHVlICYgMHhmZik7DQo+ICsJZGV2X2luZm8oZGV2LCAiRGV2aWNlOiAlcyByZXYu
ICVkXG4iLCBiZC0+ZGF0YS0+cGFydF9uYW1lLA0KPiArCQkgdmFsdWUgJiAweGZmKTsNCj4gIA0K
PiAgCXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMTYwLDcgKzE5MSwyMyBAQCBzdGF0aWMgaW50IGJk
OTU3MW13dl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50LA0KPiAgCWJkLT5kZXYg
PSAmY2xpZW50LT5kZXY7DQo+ICAJYmQtPmlycSA9IGNsaWVudC0+aXJxOw0KPiAgDQo+IC0JYmQt
PnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwNCj4gJmJkOTU3MW13dl9yZWdt
YXBfY29uZmlnKTsNCj4gKwkvKiBSZWFkIHRoZSBQTUlDIHByb2R1Y3QgY29kZSAqLw0KPiArCXJl
dCA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShjbGllbnQsIEJEOTU3MU1XVl9QUk9EVUNUX0NP
REUpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiZmFp
bGVkIHJlYWRpbmcgYXQgMHglMDJ4XG4iLA0KPiArCQkJQkQ5NTcxTVdWX1BST0RVQ1RfQ09ERSk7
DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiArCXN3aXRjaCAocmV0KSB7DQo+ICsJY2FzZSBC
RDk1NzFNV1ZfUFJPRFVDVF9DT0RFX1ZBTDoNCj4gKwkJYmQtPmRhdGEgPSAmYmQ5NTcxbXd2X2Rh
dGE7DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCWRldl9lcnIoYmQtPmRldiwgIlVu
c3VwcG9ydGVkIGRldmljZSAweCV4XG4iLCByZXQpOw0KPiArCQlyZXR1cm4gLUVOT0VOVDsNCj4g
Kwl9DQo+ICsNCj4gKwliZC0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50LCBi
ZC0+ZGF0YS0NCj4gPnJlZ21hcF9jb25maWcpOw0KPiAgCWlmIChJU19FUlIoYmQtPnJlZ21hcCkp
IHsNCj4gIAkJZGV2X2VycihiZC0+ZGV2LCAiRmFpbGVkIHRvIGluaXRpYWxpemUgcmVnaXN0ZXIN
Cj4gbWFwXG4iKTsNCj4gIAkJcmV0dXJuIFBUUl9FUlIoYmQtPnJlZ21hcCk7DQo+IEBAIC0xNzEs
MTQgKzIxOCwxNCBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dA0KPiAqY2xpZW50LA0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgDQo+ICAJcmV0ID0gcmVnbWFwX2Fk
ZF9pcnFfY2hpcChiZC0+cmVnbWFwLCBiZC0+aXJxLCBJUlFGX09ORVNIT1QsIDAsDQo+IC0JCQkJ
ICAmYmQ5NTcxbXd2X2lycV9jaGlwLCAmYmQtPmlycV9kYXRhKTsNCj4gKwkJCQkgIGJkLT5kYXRh
LT5pcnFfY2hpcCwgJmJkLT5pcnFfZGF0YSk7DQoNCkkgdGhpbmsgeW91IGFscmVhZHkgZGlkIHRo
ZSBiaWcgdGFzayB3aGVuIHlvdSBjbGVhbmVkIHVwIHRoZSBzdWItDQpkcml2ZXJzIGZyb20gdXNp
bmcgdGhlIHN0cnVjdCBiZDk1NzFtd3YuIFRodW1icyB1cCBmb3IgdGhhdCENCg0KU28sIGFzIEkg
c2FpZCBpbiBjb21tZW50IHRvIHByZXZpb3VzIHZlcnNpb24gLSBJIGRvbid0IHNlZSB0aGlzIHN0
cnVjdA0KYmQ5NTcxbXd2IGJlaW5nIHJlYWxseSB1c2VkIGFueXdoZXJlIGVsc2UgYnV0IGFzIGFu
IGFyZ3VtZW50IHRvIElDDQppZGVudGlmaWNhdGlvbiBmdW5jdGlvbiBhbmQgYXJndW1lbnQgZm9y
IHRoZSByZW1vdmUuIEkgdGhpbmsgdGhhdCBieQ0Kc3dpdGNoaW5nIHJlZ21hcF9hZGRfaXJxX2No
aXAgdG8gZGV2bV9yZWdtYXBfYWRkX2lycV9jaGlwIHlvdSBjb3VsZCBnZXQNCnJpZCBvZiB0aGUg
cmVtb3ZlLCBlcnJvciBjbGVhbnVwIHBhdGggYW5kIHRoZSBpMmNfY2xpZW50ZGF0YS4gQW5kIGlm
DQp5b3UgcmV2aXNlZCB0aGUgYXJndW1lbnRzIGZvciBpZGVudGlmaWNhdGlvbiBmdW5jdGlvbiB5
b3UgY291bGQNCnByb2JhYmx5IGZ1cnRoZXIgY2xlYW4gdGhlIHN0cnVjdCBkZWZpbml0aW9ucy4N
Cg0KQnV0IGFzIEkgcHJldmlvdXNseSBzYWlkIC0gdGhpcyBpcyBvbmx5IGEgJ25pdCcgZnJvbSBt
ZS4gSSBhcHByZWNpYXRlDQp5b3VyIHdvcmsgd2l0aCB0aGVzZSBkcml2ZXJzIQ0KDQo+ICAJaWYg
KHJldCkgew0KPiAgCQlkZXZfZXJyKGJkLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgSVJRIGNo
aXBcbiIpOw0KPiAgCQlyZXR1cm4gcmV0Ow0KPiAgCX0NCj4gIA0KPiAtCXJldCA9IG1mZF9hZGRf
ZGV2aWNlcyhiZC0+ZGV2LCBQTEFURk9STV9ERVZJRF9BVVRPLA0KPiBiZDk1NzFtd3ZfY2VsbHMs
DQo+IC0JCQkgICAgICBBUlJBWV9TSVpFKGJkOTU3MW13dl9jZWxscyksIE5VTEwsIDAsDQo+ICsJ
cmV0ID0gbWZkX2FkZF9kZXZpY2VzKGJkLT5kZXYsIFBMQVRGT1JNX0RFVklEX0FVVE8sIGJkLT5k
YXRhLQ0KPiA+Y2VsbHMsDQo+ICsJCQkgICAgICBiZC0+ZGF0YS0+bnVtX2NlbGxzLCBOVUxMLCAw
LA0KPiAgCQkJICAgICAgcmVnbWFwX2lycV9nZXRfZG9tYWluKGJkLT5pcnFfZGF0YSkpOw0KPiAg
CWlmIChyZXQpIHsNCj4gIAkJcmVnbWFwX2RlbF9pcnFfY2hpcChiZC0+aXJxLCBiZC0+aXJxX2Rh
dGEpOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvYmQ5NTcxbXd2LmgNCj4gYi9p
bmNsdWRlL2xpbnV4L21mZC9iZDk1NzFtd3YuaA0KPiBpbmRleCBiY2M3MDkyLi41YWI5NzZhIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9iZDk1NzFtd3YuaA0KPiArKysgYi9pbmNs
dWRlL2xpbnV4L21mZC9iZDk1NzFtd3YuaA0KPiBAQCAtMyw2ICszLDcgQEANCj4gICAqIFJPSE0g
QkQ5NTcxTVdWLU0gZHJpdmVyDQo+ICAgKg0KPiAgICogQ29weXJpZ2h0IChDKSAyMDE3IE1hcmVr
IFZhc3V0IDxtYXJlay52YXN1dCtyZW5lc2FzQGdtYWlsLmNvbT4NCj4gKyAqIENvcHlyaWdodCAo
QykgMjAyMCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnBvcmF0aW9uDQo+ICAgKg0KPiAgICogQmFz
ZWQgb24gdGhlIFRQUzY1MDg2IGRyaXZlcg0KPiAgICovDQo+IEBAIC04Myw2ICs4NCw4IEBADQo+
ICANCj4gICNkZWZpbmUgQkQ5NTcxTVdWX0FDQ0VTU19LRVkJCQkweGZmDQo+ICANCj4gKyNkZWZp
bmUgQkQ5NTcxTVdWX1BBUlRfTkFNRQkJCSJCRDk1NzFNV1YiDQo+ICsNCj4gIC8qIERlZmluZSB0
aGUgQkQ5NTcxTVdWIElSUSBudW1iZXJzICovDQo+ICBlbnVtIGJkOTU3MW13dl9pcnFzIHsNCj4g
IAlCRDk1NzFNV1ZfSVJRX01EMSwNCj4gQEAgLTk0LDE5ICs5Nyw0IEBAIGVudW0gYmQ5NTcxbXd2
X2lycXMgew0KPiAgCUJEOTU3MU1XVl9JUlFfV0RUX09GLA0KPiAgCUJEOTU3MU1XVl9JUlFfQktV
UF9UUkcsDQo+ICB9Ow0KPiAtDQo+IC0vKioNCj4gLSAqIHN0cnVjdCBiZDk1NzFtd3YgLSBzdGF0
ZSBob2xkZXIgZm9yIHRoZSBiZDk1NzFtd3YgZHJpdmVyDQo+IC0gKg0KPiAtICogRGV2aWNlIGRh
dGEgbWF5IGJlIHVzZWQgdG8gYWNjZXNzIHRoZSBCRDk1NzFNV1YgY2hpcA0KPiAtICovDQo+IC1z
dHJ1Y3QgYmQ5NTcxbXd2IHsNCj4gLQlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+IC0Jc3RydWN0IHJl
Z21hcCAqcmVnbWFwOw0KPiAtDQo+IC0JLyogSVJRIERhdGEgKi8NCj4gLQlpbnQgaXJxOw0KPiAt
CXN0cnVjdCByZWdtYXBfaXJxX2NoaXBfZGF0YSAqaXJxX2RhdGE7DQo+IC19Ow0KPiAtDQo+ICAj
ZW5kaWYgLyogX19MSU5VWF9NRkRfQkQ5NTcxTVdWX0ggKi8NCg0KDQpCZXN0IFJlZ2FyZHMNCiAg
ICBNYXR0aSBWYWl0dGluZW4NCg0K
