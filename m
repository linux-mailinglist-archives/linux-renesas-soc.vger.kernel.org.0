Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C698735960D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 09:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbhDIHIU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 03:08:20 -0400
Received: from mail-eopbgr60045.outbound.protection.outlook.com ([40.107.6.45]:43399
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233499AbhDIHIT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 03:08:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqJAIqIf8DLpXvVXJzpH6g1sV22ygb15YGlD7/6TbBPuytGfjwiETVEP1TmN9BmBPWKSzmpGThpAdbnqgrPJgx3Q2BD41cdZg4AM78r2SLYrmhGaRt3ckMcCvloKVIxtwHemZyyLZoWDXLpIN0/h9LSHKuCoqntU+xQwOagnpoF3QqVh3bPR7uSImEoZSAaGIDGtYb41dd6SPA2Gl5aZ33yu+ZBtb/K9RQNFk5w2Wrq07JXdWEDoasg4scxgAh0+RReAwqOH8et8MthQubqApPohStuZYKMRG+UUROvLy+OmRR0KFnKXs8ZXBvZ+Io033VkABqE55BB0+HUw76otJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y6SxiQuDT4NS5zOE1IqqKRz/q1Mb2rxAJKRA+yStto=;
 b=Pq2xE+3z8vF3CJ02lwnviU0NLEmsH6BuGWijwr0iAH+ygimylk/l3lIDMiklw3kJsOXYIMYPjvhgQHgFqU/HgzAlp3eWw8L637aOZU7C+iZYkytitq9y4006uwacAzZTxEKhu0SamhYXRc/F7Adkr6kv/CRpJe/+T48NDR5q2HKsYxjfVt899usKPNiuCA5HVeDDhbiJEjHe1sqvhpiDVt17KBRj0YmXY0NNakI7z3T2Y12ICBpkH5HLXAq4PStFCleZ4RGHTu/XGJvk8hSakEIBwtt3QJTc9+5RxqHvq5+uIzSWlQHBiOnVNkkSkkkXTObf+uVx1WdzOelPZX1J/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y6SxiQuDT4NS5zOE1IqqKRz/q1Mb2rxAJKRA+yStto=;
 b=JEzVDmQPwhKa1/goOfUE310SxNe6CJPFZlPbYvcQyuny2hf/qVcmOlMeZOBgIwFZbXaZDOHpRlNLwkRli8JNMUTs/akNor1ujpJyAecJNIPNrh0MYbs2a4p2HmaT184K852v4zO989fP3USdg6Sm9sc71ZEiQnSE/sWXUakqkJo=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2172.eurprd03.prod.outlook.com (2603:10a6:3:1e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Fri, 9 Apr 2021 07:08:02 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3999.033; Fri, 9 Apr 2021
 07:08:02 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "keescook@chromium.org" <keescook@chromium.org>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Topic: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Index: AQHXKrRUz5e/K6qNQUGVKWIQIRdIZKqoF3GAgACvA7WAAArQAIAAMm+AgAKFaQCAAD+igA==
Date:   Fri, 9 Apr 2021 07:08:02 +0000
Message-ID: <dbd6a71b1b907de004d23d2ea4b15045320f1ae1.camel@fi.rohmeurope.com>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
         <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
         <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
         <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com>
         <42210c909c55f7672e4a4a9bfd34553a6f4c8146.camel@fi.rohmeurope.com>
         <CAHp75VeX8H5E6GfVHxgu_6R+zbvmFV8fT9tO-nsm1nB3N4NF_A@mail.gmail.com>
         <202104082015.4DADF9DC48@keescook>
In-Reply-To: <202104082015.4DADF9DC48@keescook>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51aff8ad-1415-49f9-8b75-08d8fb263735
x-ms-traffictypediagnostic: HE1PR0301MB2172:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB21721CFFF5AFB159525CF057AD739@HE1PR0301MB2172.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w/lkRsGavJo/hBIIOL7fP3PiYDUjyptFBizt4BK+gaH9HZ1Pt+HaZMvSGY6Thf6vHVOPNDP2MJqRYZTdfMT3d63fW2hzq4O5oE0S3DRv5B0mWt7WGBvsPUY8PnkNurllA2i+1Pzf/LZjBPIp6C9wNIo/XzzTsl8UYR3E950zXt5DCCTJypASpP2G988pggOcEUP+sQ0/J2idxwXcYmX9561oPBeWNtu7aZ2J7avbJiaPNBJns6GlRZmY4lsEb3UyHwKt7piGaEK886vuQBO3OoG1DWBNDVZ8Nxo/2dnthKdEYPeiD0aImdhW7ZFzUJV7vY8JFa0WL9CmoTd2ZjvHd+ImEWvOovm/AdBMg/2lUzfizlU5jVKlGFR9LVXj1Q0+88qqhFWOTTpJ1hZNakFk6Tut5bsKBpLLQiFFfUb/fTsMcAOn3hhIEdPYehOfCGSQwB9f+IDHSQwDXnZQScatrodhGFPYIJfPtZ5lUeeps5WFoY6azii6x9VeFYPfqdTDass450bN8pZweVcU2d1oC6u3HizhU+o1YsHsR50UL5it1r4/VWWqUqvpbB0uqwCeoG4c/TZuNrNjSBkMLNKqZufPOCX2uJf69HIluJkmCmeb4wAJQmjZ4EQDvY/qpBb/Un/pDLjghY9G5OrGQ3ddcCdJRtBOj8/XhapbiiFOvg7EkP4HfLVNVuaJkkyuukldy2AOONWzUlEN4IsSmHWE680fervalyTLYcMZXXFWK6g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(8676002)(7416002)(966005)(316002)(110136005)(53546011)(5660300002)(66476007)(64756008)(76116006)(8936002)(66446008)(2616005)(66556008)(6506007)(66946007)(6486002)(71200400001)(54906003)(3450700001)(478600001)(6512007)(26005)(4326008)(2906002)(83380400001)(38100700001)(86362001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?L1l5b29BdkU1d3B1ZlBUZGFUVWlQbjVrVDEwVGJxd1h2ak9jNWpnOHB0UXpy?=
 =?utf-8?B?WGU5WkxiYnRSUGR1cExYTnZMRjY2U3pmbjVSQ29YcFJoSWZuTEwxY0duNWpt?=
 =?utf-8?B?K0ZrR3lYSmc4ZVNNaUVvbG96dVRscE9PWGFreWlCRWJ5Q2N3dnl0M0FWaG9D?=
 =?utf-8?B?U29ib3VtaE1XUVlGY1U5R1A1dEVBbUdleXdHWU00TFgzT1I2Q1BrbGF1T1VS?=
 =?utf-8?B?RENHd1o1cGlLTXJybFRWM0srUWtxRnhWTlJyNXZraXErWUsrUkRQM2d6cmFU?=
 =?utf-8?B?d3dVSWUyaVhoeE9wRXJPZUNHNzRXemM2ZENTSUNQUlhvT2RNZG1zTjN1OEpk?=
 =?utf-8?B?Q3BoYWtHOTY0WHdPZkxjanhDTjU3RnRpM3BzVkc3MWlaTWxpNXpiRjNmTjYx?=
 =?utf-8?B?UXArUWpiUnoxSjRRenNtcjlXZTF6OWxvZXRLN2ZtaHRkWE9DZWJkbDZFL2J1?=
 =?utf-8?B?clBLMnBNVmJHcWYxZFhWZzRrOG9Xdk1PMnFzUENDR0hmZEJVSlMzeVNzSWZ3?=
 =?utf-8?B?U2tLZWpLeC9QNmVtZzBJUzJna3Q2OEQ2TVFrWWU3d1FZQmwzeXAvQnl4SEZu?=
 =?utf-8?B?dXlaRkUzY005b1JBTEhUSEJxQm45L0xnRjNmUWRLcTc2RnZreSt5Qm01Ulhi?=
 =?utf-8?B?ZW0xdExwMktBcEF0NmZTQWsrN2ZqS1FQWGYvaWVIb3dzUzF5WThuT2NyWHc0?=
 =?utf-8?B?UmNidzYwdmZzSlk1N1B0eEhqTFhETEZISUFQYWVZTzQ2NUhRWmIwUUVBeWlF?=
 =?utf-8?B?eEo3eW96RXNZVlJDdmdvYkx0VWMxTEtHZ1hTSDBJRmZRbjk5VnhWcHBwazhi?=
 =?utf-8?B?R01sZStyZXNjMFhlSjFDMEpIbmhUUEZGMkJBSUJjN1NoTWswQTVBRGh5SEE5?=
 =?utf-8?B?QUErUThyMHR3U2R6Z3grRlc1MUg1eEVYV052aWgwaFRVUURNSGZub1hmU0lm?=
 =?utf-8?B?TkM4QUxxNEVEb3czVVZVYmNUR3BURE8ya2xNdXNwSzZIQTN4b1JEZTlsZUJo?=
 =?utf-8?B?U3ErdktPMU5DckxPamVVcmRxUXpBa2RwTFhwd1dDUlcyMU9Jc0hoS1Uyak9s?=
 =?utf-8?B?WE5ENGNVVDBUcnFYbUczaS90bFRaVGVxUUJjN3pSd2o5OXNtdzIyUng2dzBv?=
 =?utf-8?B?dXdRcEdhT2FhUGo1YWIxRjQzSjh2SEFYamx0dDIwZ3dUdWJtMkxVQnRhUk1m?=
 =?utf-8?B?THZSa0sveHArRG9JbDh6Y1lhZFBiRTdtUkdId0lhTjc5ai9NVlY5TllTc2Vz?=
 =?utf-8?B?WUZXMmJINUhGdkNxU1RNTUI1MERvQ3F6bzJoUmlaYXJLWnRCVmN1WmE1d0g2?=
 =?utf-8?B?WEQxbkdXanUveEdlbFRyWHhiT1Qxb1ZldXJzNW5UQ2thZVNPcVhxbUtubmhR?=
 =?utf-8?B?YzFOSno3Ky9zRERxRDVDMVhPY2o2NFhGL3hsZ3UzVGlHcEdNYnk0OEpudUZ5?=
 =?utf-8?B?OGxpR3lLUlVnTnJiTGR2ai9JVEJxQ3JienYzREh3dWZyQnRvalgxNmtDMGIx?=
 =?utf-8?B?WnR2TTJRZjkxb2JCSE1GK3BjcSs2R1IwZEdiTmx0RHh4ejB1c1ZOaHlPV0Ur?=
 =?utf-8?B?VkMrTytHWU0vN29QdUhndUtOT0E0Wko4YXNITXNwMmtYY2pXN041dTJkUXVu?=
 =?utf-8?B?V1Vvclg4aUxIYTVzT1IreE01WXZINUVEZjJBSVZNQ1FMenJ3MitLblNQYWtl?=
 =?utf-8?B?dXNubmRuenpyUnZVQndKZ3cyYXRNWE9pMXc5Q3haUWdBUDBLbjNVUTJ6bXFi?=
 =?utf-8?B?NWRrU1dYREcxRU5WOTlKNnoyQXJFRDVhV0JXQ3ZzSkw4RVh5VWQ1Q2JrMTFF?=
 =?utf-8?B?amNSTncxbU1ucFJIanlKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F26DB8B59A40541A2121E2FDF1FAF27@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aff8ad-1415-49f9-8b75-08d8fb263735
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 07:08:02.4831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOVN2FuIMEs9wPkUyJXeZs9Ll68J813n4riHm3Lm4YDX0xuku4qxey1ZmoHziAAw6IVXjeNgTLkqXzCd3+dFdkoPPZQ1HOl37B2qrDO8am4kFbxtvdpNyWshajg/vt97
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2172
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpPbiBUaHUsIDIwMjEtMDQtMDggYXQgMjA6MjAgLTA3MDAsIEtlZXMgQ29vayB3cm90ZToNCj4g
T24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMDM6NTA6MTVQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOg0KPiA+IE9uIFdlZCwgQXByIDcsIDIwMjEgYXQgMTI6NDkgUE0gVmFpdHRpbmVuLCBN
YXR0aQ0KPiA+IDxNYXR0aS5WYWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiA+
ID4gT24gV2VkLCAyMDIxLTA0LTA3IGF0IDEyOjEwICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3Jv
dGU6DQo+ID4gPiA+IE9uIFdlZCwgQXByIDcsIDIwMjEgYXQgODowMiBBTSBNYXR0aSBWYWl0dGlu
ZW4NCj4gPiA+ID4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+
ID4gPiA+ID4gT24gV2VkLCAyMDIxLTA0LTA3IGF0IDAxOjQ0ICswMzAwLCBBbmR5IFNoZXZjaGVu
a28gd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBUdWVzZGF5LCBBcHJpbCA2LCAyMDIxLCBNYXR0aSBW
YWl0dGluZW4gPA0KPiA+ID4gPiA+ID4gbWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29t
PiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gKyAgICAgICBCVUcoKTsNCj4gPiA+ID4gPiA+ID4gK30N
Cj4gDQo+IFRoaXMsIHRob3VnaCwgYXJlIHlvdSBzdXJlIHlvdSB3YW50IHRvIHVzZSBCVUcoKT8g
TGludXMgZ2V0cyB1cHNldA0KPiBhYm91dA0KPiBzdWNoIHRoaW5nczoNCj4gaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjYnVnLWFu
ZC1idWctb24NCj4gDQoNCkkgc2VlLiBJIGFtIHVuc3VyZSBvZiB3aGF0IHdvdWxkIGJlIHRoZSBi
ZXN0IGFjdGlvbiBpbiB0aGUgcmVndWxhdG9yDQpjYXNlIHdlIGFyZSBoYW5kbGluZyBoZXJlLiBU
byBnaXZlIHRoZSBjb250ZXh0LCB3ZSBhc3N1bWUgaGVyZSBhDQpzaXR1YXRpb24gd2hlcmUgcG93
ZXIgaGFzIGdvbmUgb3V0IG9mIHJlZ3VsYXRpb24gYW5kIHRoZSBoYXJkd2FyZSBpcw0KcHJvYmFi
bHkgZmFpbGluZy4gRmlyc3QgY291bnRlcm1lYXN1cmUgdG8gcHJvdGVjdCB3aGF0IGlzIGxlZnQg
b2YgSFcgaXMNCnRvIHNodXQtZG93biB0aGUgZmFpbGluZyByZWd1bGF0b3IuIEJVRygpIHdhcyBj
YWxsZWQgaGVyZSBhcyBhIGxhc3QNCnJlc29ydCBpZiBzaHV0dGluZyB0aGUgcG93ZXIgdmlhIHJl
Z3VsYXRvciBpbnRlcmZhY2Ugd2FzIG5vdA0KaW1wbGVtZW50ZWQgb3Igd29ya2luZy4NCg0KRWcs
IHdlIHRyeSB0byB0YWtlIHdoYXQgZXZlciBsYXN0IG1lYXN1cmUgd2UgY2FuIHRvIG1pbmltaXpl
IHRoZSBIVw0KZGFtYWdlIC0gYW5kIEJVRygpIHdhcyB1c2VkIGZvciB0aGlzIGluIHRoZSBxY29t
IGRyaXZlciB3aGVyZSBJIHN0b2xlDQp0aGUgaWRlYS4gSnVkZ2luZyB0aGUgY29tbWVudCByZWxh
dGVkIHRvIEJVRygpIGluIGFzbS1nZW5lcmljL2J1Zy5oDQoNCi8qDQogKiBEb24ndCB1c2UgQlVH
KCkgb3IgQlVHX09OKCkgdW5sZXNzIHRoZXJlJ3MgcmVhbGx5IG5vIHdheSBvdXQ7IG9uZQ0KIA0K
KiBleGFtcGxlIG1pZ2h0IGJlIGRldGVjdGluZyBkYXRhIHN0cnVjdHVyZSBjb3JydXB0aW9uIGlu
IHRoZSBtaWRkbGUNCiAqDQpvZiBhbiBvcGVyYXRpb24gdGhhdCBjYW4ndCBiZSBiYWNrZWQgb3V0
IG9mLiAgSWYgdGhlIChzdWIpc3lzdGVtDQogKiBjYW4NCnNvbWVob3cgY29udGludWUgb3BlcmF0
aW5nLCBwZXJoYXBzIHdpdGggcmVkdWNlZCBmdW5jdGlvbmFsaXR5LA0KICogaXQncw0KcHJvYmFi
bHkgbm90IEJVRy13b3J0aHkuDQogKg0KICogSWYgeW91J3JlIHRlbXB0ZWQgdG8gQlVHKCksIHRo
aW5rDQphZ2FpbjogIGlzIGNvbXBsZXRlbHkgZ2l2aW5nIHVwDQogKiByZWFsbHkgdGhlICpvbmx5
KiBzb2x1dGlvbj8gIFRoZXJlDQphcmUgdXN1YWxseSBiZXR0ZXIgb3B0aW9ucywgd2hlcmUNCiAq
IHVzZXJzIGRvbid0IG5lZWQgdG8gcmVib290IEFTQVAgYW5kDQpjYW4gbW9zdGx5IHNodXQgZG93
biBjbGVhbmx5Lg0KICovDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMi1y
YzYvc291cmNlL2luY2x1ZGUvYXNtLWdlbmVyaWMvYnVnLmgjTDU1DQoNCnRoaXMgcmVhbGx5IG1p
Z2h0IGJlIHZhbGlkIHVzZS1jYXNlLg0KDQpUbyBtZSB0aGUgcmVhbCBxdWVzdGlvbiBpcyB3aGF0
IGhhcHBlbnMgYWZ0ZXIgdGhlIEJVRygpIC0gYW5kIGlmIHRoZXJlDQppcyBhbnkgZ2VuZXJpYyBo
YW5kbGluZyBvciBpZiBpdCBpcyBwbGF0Zm9ybS9ib2FyZCBzcGVjaWZpYz8gRG9lcyBpdA0KYWN0
dWFsbHkgaGF2ZSBhbnkgY2hhbmNlIHRvIHNhdmUgdGhlIEhXPw0KDQpNYXJrIGFscmVhZHkgcG9p
bnRlZCB0aGF0IHdlIG1pZ2h0IG5lZWQgdG8gZmlndXJlIGEgd2F5IHRvIHB1bnQgYQ0KImZhaWxp
bmcgZXZlbnQiIHRvIHRoZSB1c2VyLXNwYWNlIHRvIGluaXRpYXRlIGJldHRlciAic2FmZXR5IHNo
dXRkb3duIi4NClN1Y2ggZXZlbnQgZG9lcyBub3QgY3VycmVudGx5IGV4aXN0IHNvIEkgdGhpbmsg
dGhlIG1haW4gdXNlLWNhc2UgaGVyZQ0KaXMgdG8gZG8gbG9nZ2luZyBhbmQgcG90ZW50aWFsbHkg
cHJldmVudCBlbmFibGluZyBhbnkgZnVydGhlciBhY3Rpb25zDQppbiB0aGUgZmFpbGluZyBIVy4N
Cg0KU28gLSBhbnkgYmV0dGVyIHN1Z2dlc3Rpb25zPw0KDQpCZXN0IFJlZ2FyZHMNCglNYXR0aSBW
YWl0dGluZW4NCg0KDQo=
