Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AC42D5678
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 10:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388701AbgLJJOR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 04:14:17 -0500
Received: from mail-am6eur05on2078.outbound.protection.outlook.com ([40.107.22.78]:40769
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388708AbgLJJON (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 04:14:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUxhx4+Ns/Hm4XB7jSOf+6JqjodEMryhfG5Ncn6u+/Q1il9rMKsNmVFqhyRtASBvssWZkfT41QUJwoFCDIUiLccz39oXbmdkEZSPWxjJOaJ5FLY0P9EYJi8qmmJcQNYlDRJYg+io/M63Boz33qGMsqLR0io/Pcw7jHJ4EWFuGhZL70oksv0QRgKyCmt8osx9xyNTAzMtZeDw4NbsK+3FAvnF5t1++N17GT6cUbPMwDb+e1J5pTjf/MV+N+kdHsCiheTY00kuIUxNifrQHq8OBpWDI94++1pQRXXcuee2N9ZyOa1A8TMQM8LM42FkYH4XecVw0cvVyWABjcmp9jMdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=innsb/iyLUaLLIUkbYwNyAMp+233G2pJijVvVP3IiJQ=;
 b=Au66vBAsB2Pomj7tjir/oUsqIXFvqh4DWHgr0UAAb9QGIk+Y36iut19ep5Qt7PNKIZZzYWQS2w0C5AoncMQlADedvEbqFDGcf4MiKeI7lSHhmU0MEpSV4BJS4MDzAXf+wQXbEIs4YR6b9wKrXwdEFd4GL0EKJGvEmXFaAxtxo2FesplFxhJwSGHHXe4/5I1cSXP1cJauoaJ462y0Cbgx7WOhP+kNTL5L4jnAjNIsoW1Gt9QNwR2vsKTt/aR/p1aW3cUFZP9wwl3inrhJXYPrS4Dm3zo1EbRzqj36vGF8qOoii8RyebfemMAJfe7tBIXbMKgtEkB0Qc4OH6gZxtQllw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=innsb/iyLUaLLIUkbYwNyAMp+233G2pJijVvVP3IiJQ=;
 b=GtjFH6bxHGNqEFGGQ/xReBtFDzOElVXbyIpHolZmtslEuGe7uxcUG0hAkNWyfzBqbinKm7SQ/6eW1s4E9gZEqDOnGN2yaaik9Rgv/gSwbfwDGxYbWC03WIFdMYZDuBzgNT/2xq+eGN9TejctXH3hiLnW0/cENfjv9fA5jnTgPCw=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3163.eurprd03.prod.outlook.com (2603:10a6:7:5e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.20; Thu, 10 Dec 2020 09:13:21 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 09:13:21 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzi93D4ghTujm1EOpsE3lf7qGwqnvweaAgAAvMYCAAAzwAIAADv6A
Date:   Thu, 10 Dec 2020 09:13:21 +0000
Message-ID: <65455eec652f03194fd7dcb91f9d3cc423ef139d.camel@fi.rohmeurope.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
         <TY2PR01MB3692AE2EBAE6876F1CA26A34D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
         <f19f7c3cf1d25e55a40825d6048ab9134b7d3502.camel@fi.rohmeurope.com>
         <CAMuHMdVL5MrHr7P=WCN4vqLaD6km7TocC5FK_dNJdnTMV+YBwg@mail.gmail.com>
In-Reply-To: <CAMuHMdVL5MrHr7P=WCN4vqLaD6km7TocC5FK_dNJdnTMV+YBwg@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e5657c3-8ea1-49e4-e388-08d89cebd743
x-ms-traffictypediagnostic: HE1PR03MB3163:
x-microsoft-antispam-prvs: <HE1PR03MB31635C09F918A5E977B81810ADCB0@HE1PR03MB3163.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GOxIpZmSdNDke0NxVBs82DD0asvch0ZzknM9KTiLOgJqPKAQH5Gd6JF1JDOiCHO2jsrSCRcOMOG+3IT8GouMjvBesN+HPPG0SY0hVoRJ6OTpkCRFJpuHyT16PJvyBQ/izHiwI07ZO/5c1zNcb9uXn0Y5EwZ8fDFdbkqP8F73ok1cSViI6WE/QnBTZPT00UQHzUOzFN+eWJYtujdLNRdSUltQucxAdPXe5lxe9XHvpQ7diQgfOSfafR9godcbD+DIMEnTOxiap9ghrZS6WyE+zm1mVXsINdnxIaOTgGbs7xkZ+W5uKHys3NUZawAprYSNxquKEv4a6omqnoV4UVtmag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(66946007)(110136005)(2616005)(4001150100001)(3450700001)(66476007)(86362001)(186003)(64756008)(508600001)(54906003)(2906002)(66446008)(4326008)(66556008)(6486002)(6512007)(26005)(83380400001)(5660300002)(71200400001)(8936002)(6506007)(76116006)(8676002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RHBEQXNxSExvY1cxV0R0YlQvMk1vR3RPb0R4L2c3TDRIQUdCb1dSSzB5S1Jw?=
 =?utf-8?B?R0VmVTZUb1dhenlYSXgxM05iUGRmTjZOVitkaXRlT2Rwc0N6aCtlRElNRDEv?=
 =?utf-8?B?VVJKeFQ0YW5JcktFbEQ0a2VnLzdqZGNBZDJtMTRWZ3JRWmNrQVFtb2sxc2Na?=
 =?utf-8?B?VjQ5Mi9rbWpDdi9oRnhkTkRDRjJ0NEljZ2xmM2VKb3dXUzN0UGxuQVZwd21t?=
 =?utf-8?B?UnBZTUF2MkIwRzVucDdLclFwQTB6LzIxS1JjdGFqV1pZdVJGU2hBdUk3dndK?=
 =?utf-8?B?aWVQNmJndVk5cHlRL1QzWGN0bzNqZnNHamhnSFB0VWNjTUV3ZU1aMWlqbnU1?=
 =?utf-8?B?ODV2T290Nkk2L09hbmVxVFQrUVozdVI5enFPRFdwRWkvdUgrcVo2OHF3WkpV?=
 =?utf-8?B?VkNZSEJNNlhGMzUzL0k5SWpHdDhEcWlZNS9PVFVDTUdnTmhSQ3dNOEQycjU4?=
 =?utf-8?B?L0FRa0Q1RWpYcjVBbkdsK1ZBai9FcktZWmdCMnBRK2tsMlhzT3JwUS9iSWh1?=
 =?utf-8?B?VEQ3NVZpZ05sTDRxVk0xVkZhcGV1c2E0eHc5YXR1N2dhYlB3RmpzeFJvNGc0?=
 =?utf-8?B?RG1xMkVLejFSR0dLVVd5M3UrYk5RSERQSG9DVWdzbGNRMTY4aXFkWWxOWEVU?=
 =?utf-8?B?bmhnT09NYnJyUEhQSituQUJkVFlJb3J0NkxrRUlWREJpbjZmZGFEYjJDamp5?=
 =?utf-8?B?eHhlcnRMVGNBeDdiRzRQRWtCYjZWQXp0Rzc2a1ZzVk15d2diZnBjRCtpa2hP?=
 =?utf-8?B?L1ZxOXZ5dCt5UndScENwS2lIVTMyNVpPVnArVTJoNDNOaVhSWjRSY3BkSGVn?=
 =?utf-8?B?MExtWitqL1hUT2VnNHdiU0FlaWQyeFNWdUh5M3JzUHJJN243bGdPMVNIOWtR?=
 =?utf-8?B?UEsxa05hYnFJUlhKOXMyUktwMkhTNFBVeDBNTVEwZUdPTXNMSFVwb1pOS1pm?=
 =?utf-8?B?UXlXTFUrOUpBd1ZtNVNjY3o1WmdudHF1by84T2Q0OXVXNVl5YlV1LzEzZVN1?=
 =?utf-8?B?SS9pRFZYeTQ0UHpVV0o4QkdqRUtyQ3o4bEsrL3JUOE1aU3NKVHFoc01FQnJF?=
 =?utf-8?B?MCtzYUpzV2xDZXp4NEFMd2YyTWUrOHZaaDgwSUJGU2hIaGQ0SFJhNnhNN2NF?=
 =?utf-8?B?NEhBTGJxUDAzcTlYZnZHTHNaODg4SW1BQTFna3c3OWlxZHpPTHpFRXF3R2M0?=
 =?utf-8?B?MnF2NnpIajYxZXQ0TmJqYTViSTdVcVB3OTlleGVZQ1hOUkl3OW1xQUxtOVpn?=
 =?utf-8?B?eXVqcmdsYTU3V2hEa2tpeUJPWVd2OW5WWjE2bzdEbkpHMmtaZWhVcDVFUWp2?=
 =?utf-8?Q?VYHRXx53ZTPlHs2e7mRoqN8v0MgDS/NJZ+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CA6828329109A47B34095A26D0C22EC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5657c3-8ea1-49e4-e388-08d89cebd743
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 09:13:21.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AcY9M8rXzWg14CSKlHFrHMGMDU80AFSieRnDjtw2a/jVdpK04jxpfvv7bxKnfoMjkuaNtwH9yb2OKFoucuHnUG93LV2yfVGTxdgECLE+oGp8XTeiOO2VsH5/arcUnOlm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3163
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpPbiBUaHUsIDIwMjAtMTItMTAgYXQgMDk6MTkgKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gSGkgTWF0dGksIFNoaW1vZGEtc2FuLA0KPiANCj4gT24gVGh1LCBEZWMgMTAsIDIw
MjAgYXQgODozMyBBTSBWYWl0dGluZW4sIE1hdHRpDQo+IDxNYXR0aS5WYWl0dGluZW5AZmkucm9o
bWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMC0xMi0xMCBhdCAwNDo0NCArMDAw
MCwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhv
ZXZlbiwgU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciA5LCAyMDIwDQo+ID4gPiA+IDEwOjMwDQo+
ID4gPiA+IFBNDQo+ID4gPiA8c25pcD4NCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9iZDk1
NzFtd3YuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gQEAgLTE4Miw2ICsyNzIsOCBAQCBzdGF0aWMgaW50IGJkOTU3MW13dl9w
cm9iZShzdHJ1Y3QNCj4gPiA+ID4gPiBpMmNfY2xpZW50DQo+ID4gPiA+ID4gKmNsaWVudCwNCj4g
PiA+ID4gPiAgICAgICAgIHByb2R1Y3RfY29kZSA9ICh1bnNpZ25lZCBpbnQpcmV0Ow0KPiA+ID4g
PiA+ICAgICAgICAgaWYgKHByb2R1Y3RfY29kZSA9PSBCRDk1NzFNV1ZfUFJPRFVDVF9DT0RFX1ZB
TCkNCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgYmQtPmRhdGEgPSAmYmQ5NTcxbXd2X2RhdGE7
DQo+ID4gPiA+ID4gKyAgICAgICBlbHNlIGlmIChwcm9kdWN0X2NvZGUgPT0gQkQ5NTc0TVdGX1BS
T0RVQ1RfQ09ERV9WQUwpDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGJkLT5kYXRhID0gJmJk
OTU3NG13Zl9kYXRhOw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ICAgICAgICAgaWYgKCFiZC0+ZGF0
YSkgew0KPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGJkLT5kZXYsICJObyBmb3Vu
ZCBzdXBwb3J0ZWQgZGV2aWNlDQo+ID4gPiA+ID4gJWRcbiIsDQo+ID4gPiA+IA0KPiA+ID4gPiBX
aGlsZSBCRDk1NzFNV1YgYW5kIEJEOTU3NE1XRiBjYW4gYmUgZGlzdGluZ3Vpc2hlZCBhdCBydW50
aW1lLA0KPiA+ID4gPiBJIHRoaW5rIGl0IHdvdWxkIHN0aWxsIGJlIGEgZ29vZCBpZGVhIHRvIGRv
Y3VtZW50IGENCj4gPiA+ID4gInJvaG0sYmQ5NTc0bXdmIg0KPiA+ID4gPiBjb21wYXRpYmxlIHZh
bHVlIGluIHRoZSBEVCBiaW5kaW5ncywgYW5kIGxldCB0aGUgZHJpdmVyIG1hdGNoDQo+ID4gPiA+
IG9uDQo+ID4gPiA+IHRoYXQuDQo+ID4gPiANCj4gPiA+IEluIHRoaXMgZHJpdmVyIHBvaW50IG9m
IHZpZXcsIHdlIGNhbiB1c2Ugc3VjaCB0aGUgRFQgYmluZGluZ3MsDQo+ID4gPiBob3dldmVyLCBp
biB0aGUgYm9hcmQgcG9pbnQgb2YgdmlldywgaXQncyBkaWZmaWN1bHQgdG8gZGVzY3JpYmUNCj4g
PiA+IHdoaWNoIGNoaXAgaXMgaW5zdGFsbGVkIG9uIHI4YTc3OTkwLWViaXN1LmR0cy4gU28sIEkn
ZCBsaWtlIHRvDQo+ID4gPiBrZWVwIHRoaXMgcnVudGltZSBkZXRlY3Rpb24uDQo+IA0KPiBUbyBj
bGFyaWZ5OiBJIG1lYW50IHRvIGRvY3VtZW50IGFuZCBhZGQgdGhlIGNvbXBhdGlibGUgdmFsdWUs
IGJ1dA0KPiB0cmVhdCBib3RoIGNvbXBhdGlibGUgdmFsdWVzIHRoZSBzYW1lIGluIHRoZSBkcml2
ZXIsIGFuZCBzdGlsbCBkbw0KPiBydW50aW1lDQo+IHByb2JpbmcuDQo+IA0KPiA+IEZpcnN0IG9m
IGFsbCAtIEkgZG9uJ3Qgd2FudCB0byBpbnNpc3QgY2hhbmdlcyBoZXJlIHNvIG15IGNvbW1lbnQN
Cj4gPiBjYW4gYmUNCj4gPiBpZ25vcmVkLiBJIHdvdWxkIGRlZmluaXRlbHkgbGlrZSBzZWVpbmcg
dGhlIHN1cHBvcnQgZm9yIEJEOTU3NCBpbi0NCj4gPiB0cmVlIQ0KPiA+IA0KPiA+IEJ1dCBhcyBh
ICduaXQnOg0KPiA+IEkgZG9uJ3Qga25vdyB3aGF0IGFyZSB0aGUgZGlmZmljdWx0aWVzIHlvdSBh
cmUgcmVmZXJyaW5nIHRvIHNvIGl0J3MNCj4gPiBoYXJkIGZvciBtZSB0byBjb21tZW50IHRoaXMu
IFdpdGhvdXQgYmV0dGVyIHVuZGVyc3RhbmRpbmcgb2YgYm9hcmQNCj4gPiBkdHMNCj4gPiBmaWxl
cyAtIEkgdGhpbmsgQkQ5NTc0TVdGIHNob3VsZCByZWFsbHkgaGF2ZSBvd24gY29tcGF0aWJsZSBh
cyBJDQo+ID4gdW5kZXJzdG9vZCBpdCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgQkQ5NTcxTVdWLiBS
ZWx5aW5nIG9uIHByb2R1Y3QNCj4gPiBjb2RlDQo+ID4gcHJvYmluZyBzb3VuZHMgbGlrZSBzb21l
dGhpbmcgdGhhdCBtYXkgZWFzaWx5IGJyZWFrIHdoZW4vaWYgbmV3DQo+ID4gdmFyaWFudHMgYXJl
IHByb2R1Y2VkLiAoIEkndmUgc2VlbiBuZXcgSFcgdmFyaWFudHMgdXNpbmcgdGhlIHNhbWUNCj4g
PiBJRCBpbmZvcm1hdGlvbiBiZWluZyBwcm9kdWNlZCBpbiBwcmV2aW91cyBjb21wYW5pZXMgSSd2
ZSB3b3JrZWQuDQo+ID4gU3VyZQ0KPiANCj4gWWVzLCB0aGlzIGhhcHBlbnMgZnJvbSB0aW1lIHRv
IHRpbWUsIHVuZm9ydHVuYXRlbHkuDQo+IA0KPiA+IFJPSE0gd291bGRuJ3QgZG8gdGhpcyBidXQg
c3RpbGwuLi4gOl0gKS4gQW5kIHByb2R1Y2luZyBib2FyZHMgd2hlcmUNCj4gPiBEVFMNCj4gPiBk
b2VzIG5vdCBhbGxvdyBkZXNjcmliaW5nIHRoZSBjb3JyZWN0IGNvbXBvbmVudHMgc291bmRzIGxp
a2UgYXNraW5nDQo+ID4gZm9yDQo+ID4gYSBub3NlLWJsZWVkIHRvIG1lLi4uIElmIHByb2Jpbmcg
b2YgSUMgdHlwZSBmYWlscyBBTkQgdGhlcmUgaXMNCj4gPiBkZXZpY2VzDQo+ID4gd2l0aCB3cm9u
ZyBQTUlDIGluZm9ybWF0aW9uIGJ1cm5lZCBpbiBEVCAtIHRoZW4gZml4aW5nIGl0IGNhbiBiZSBh
DQo+ID4gbmlnaHRtYXJlLiBTbyBJIHdvdWxkIHJlYWxseSB0cnkgbWFrZSBEVFMgZmlsZXMgc3Vj
aCB0aGF0IHRoZXkgY2FuDQo+ID4gYmUNCj4gDQo+IFRoZSBpc3N1ZSB3ZSdyZSBmYWNpbmcgaXMg
dGhhdCBvbGRlciBFYmlzdS00RCBib2FyZHMgaGF2ZSBCRDk1NzEsDQo+IHdoaWxlDQo+IG5ld2Vy
IGJvYXJkcyBoYXZlIEJEOTU3NC4gIFRoZSBzY2hlbWF0aWNzIHNheSAiQkQ5NTc0TVdGLU0gKHRl
bnRhdGl2ZQ0KPiB2ZXI6QkQ5NTcxVEwxX0UzKSIsIHNvIGl0IGxvb2tzIGxpa2UgYm90aCBwYXJ0
cyBhcmUgcGluLWNvbXBhdGlibGUNCj4gKGlnbm9yaW5nIG1pc3NpbmcgcGlucyBmb3IgQVZTLCBM
RE8xLCBMRE8yLCBhbmQgTERPNiBvbiBCRDk1NzQpLg0KPiBIZW5jZSBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjhhNzc5OTAtZWJpc3UuZHRzIGhhcyBhIGRldmljZQ0KPiBub2RlDQo+IGNv
bXBhdGlibGUgd2l0aCAicm9obSxiZDk1NzFtd3YiLiAgSWYgd2UgaGF2ZSBydW50aW1lIHByb2Jp
bmcsIHdlIGNhbg0KPiBrZWVwIG9uIHVzaW5nIHRoYXQgZm9yIGJvdGggdmFyaWFudHMuDQoNClRo
YW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uIDopIFRoaXMgaXMgYSBuaWNlIGxlYXJuaW5nIGV4
cGVyaWVuY2UgZm9yDQptZSENCg0KPiA+IGNoYW5nZWQgdG8gbWF0Y2ggdGhlIGFjdHVhbCBib2Fy
ZC4gKFBlcmhhcHMgaW50cm9kdWNlIHRoZQ0KPiA+IGNvbXBhdGlibGUNCj4gPiBmb3IgQkQ5NTc0
TVdGIC0gbWFrZSB0aGlzIGRyaXZlciB0byBtYXRjaCBib3RoIG9mIHRoZSBQTUlDcyAtIGxlYXZl
DQo+ID4gdGhlDQo+ID4gcnVudGltZSBwcm9iaW5nIGhlcmUgZm9yIG5vdyAtIGFuZCBpbiBwYXJh
bGxlbCB3b3JrIHdpdGggdGhlIERUUw0KPiA+IGZpbGVzDQo+ID4gc28gdGhhdCBldmVudHVhbGx5
IHRoZSBwcm9iaW5nIGNhbiBiZSByZW1vdmVkKD8pIFRoYXQgd2FzIG15IDEwDQo+ID4gY2VudHMN
Cj4gPiBvbiB0aGlzIHRvcGljIDpdICkNCj4gDQo+IEV4YWN0bHkuIFRoYW5rcyENCg0KSSBhbSBt
b3JlIHRoYW4gaGFwcHkgd2l0aCB0aGlzIHNvbHV0aW9uIDopDQoNCi0tTWF0dGkNCg==
