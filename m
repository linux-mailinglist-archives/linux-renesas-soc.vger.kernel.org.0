Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E89F31E64B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Feb 2021 07:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhBRGYZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Feb 2021 01:24:25 -0500
Received: from mail-vi1eur05on2068.outbound.protection.outlook.com ([40.107.21.68]:64800
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230412AbhBRGS2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Feb 2021 01:18:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS9aY5nmhiVyyTPZAAY3YoDeoRLn/hpekyJr/0zMyA4SUnn7H8PbNiWAlR4bOJaNHpuddLL7ZH+/ZNOUgH6flOqxoaKKeHxO2YFTtmHSv3x7FLdgCancc5KZPJcKeSJxnEMLz2D8gM/DudxnpeWEuSfaMfyjyMt5de9PEcPrzoiHFoX654CGae5/cvuRRq+BTEYY81dWKbDw6+svVvmCUuO1aKYAQ1S8TncUtIcqF9QSmLBuMWcEAyNMvSjvPNV8A1Cj+ktVb7RP9G2U0RXk49YoYha5EabIRdjrrBg5H9fefKO1NQnV9j6JzqOXoQV0p/uIxJibfU3WclaLonpkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wO7KS9jECSiDQ8Sa15S9PhUQSlEKm4qvcCiPnCIjyU=;
 b=V8cjTFhJIj6WVy5Wf+oYKq61qMBCAzsfo6PyVPDiQwDmXrgXJyz8z1yUVqxl5tCD0acEtBHwW9VJ9Vi8Iq/IhsGls78x6T0XJsqy9hU28Ed3y6VepopYwjCyPvNTqV/kkdHET5u9WbDaiukwwGnTF2CFnCjT8d+aHpJXhN7zvObYCNd17yYnme/WNx6L6QOq8atYeou8W8YpYyBprDgY1TDCtzDE94DoqVbN+HA7S6zcxVSZz/5U3gxS3QBicOutLKXqI9NlzbbPHnRmMiTkumT04tW4qcQSVeTheL9qhv2461YwgdAC3/M690XeOjlRJlEmsNP2gv7h0mxectQtng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wO7KS9jECSiDQ8Sa15S9PhUQSlEKm4qvcCiPnCIjyU=;
 b=GxZDCXxbhSX2BL3xzULiVK7X8naIMcXKTZakfu47BYwxa0cPf/p8lYfEL+0L/aJUYRqbeXDfWBPBOKCB/vUQyukbSuO+LQwQ3TEgt7e0u9EKv9LLI8UAATmNNwIRRlVLQBbUerXqVxPQvXqH/FMHPQUAJ5G1fq75S+a2ZvgYgo4=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2396.eurprd03.prod.outlook.com (2603:10a6:3:67::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27; Thu, 18 Feb 2021 06:15:37 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::c18c:4a01:ca24:78c1%5]) with mapi id 15.20.3846.038; Thu, 18 Feb 2021
 06:15:37 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: Re: [RFC PATCH 5/7] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Thread-Topic: [RFC PATCH 5/7] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Thread-Index: AQHXAHJu3Svdke5q00WPonJJusD7Qqpc6F4AgACRrgA=
Date:   Thu, 18 Feb 2021 06:15:36 +0000
Message-ID: <2060c166226c2bd18d240ae266d5fae813d18294.camel@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
         <b7025d14fc8eb0eac95437ac62e74f64a7cf2b4c.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
         <20210217213412.GA2800178@robh.at.kernel.org>
In-Reply-To: <20210217213412.GA2800178@robh.at.kernel.org>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [213.255.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fa75f9c-51f4-4e34-3337-08d8d3d49bb3
x-ms-traffictypediagnostic: HE1PR0301MB2396:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2396DC46351769D0C7C25BDBAD859@HE1PR0301MB2396.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YPYXL0hudR9lSobAddx7u1EDyJNiGHMxyagoVGlp2iDY+9K5wNMrE4O01gjbilQYOGXSkB5p2HcGEx5snyePR8vaXJUqqt+hMA85lKykjnRPudg7K7RpQwMtKp5y92+kYzpDxMuJl9edG21gQe4i8PoJdeYSi92imipLhKIKWcIrPCCqP88Psm8gAewtIRIm+8g/7dCvW0ojpcpRXSVZENYWxvW5BaPyd4M4pt5ocQqD9FK2j7Fgnhe1l2P/B2OfsYHTvKK11X/4sodOnIisurpoZ/NFab/6ITac0ZxfmVnSeMVzZwfdFuVzVBGe2tnk58LHA1K2L3K4W9D0rYOPTmX37Geg3M0p5WMem0wk/Bc6ovzV/RZ3ddlcJE0AzJBpZ1PkXTbGwEd0yHHIipf25zyWXSxoOzTHvh3uUhrghUhLijPTKuVCR6wrXCIKkf4Wvu/el/ZpmNGHjcOptGZx3pYTOvocgIU8Q9ylNHqy9W9pXRMqvjUjygjf7d3vZQSO/IO+Wtl988rnDulNf9lh1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(39840400004)(346002)(5660300002)(66556008)(66446008)(66946007)(6506007)(6512007)(66476007)(64756008)(6916009)(83380400001)(76116006)(71200400001)(54906003)(316002)(186003)(3450700001)(2616005)(4326008)(478600001)(26005)(6486002)(86362001)(2906002)(8936002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dCswNTJlMVNic0RhWW1kdU1vdmQ4dFJZZE5nWndGOUgxRXgxdVJJUnY1ajJ4?=
 =?utf-8?B?ajVaemNXM1R6U3NwRi9IbnhlSVBpOE56NXAraGRSa0JwOE1lM1FOTU90TVRu?=
 =?utf-8?B?cDAveWZ2dWZ1WWZMSncyWWg0d09zcWFWcnEyMjU5MlJKUDRIb2JvU1VQWjNn?=
 =?utf-8?B?SjduaEYwU0JuQ09wL1VxelhockVYa1dOREFRTStHOWY1Sll5WnhJQ1YxY2FR?=
 =?utf-8?B?NU8yTVlJWElaWGlDT2tiRCtQOUtqSXVPUnZFTUtsVUFFUm9ZQjdYaWp1Q1Zv?=
 =?utf-8?B?dU0vMjh1UDFzSWFrT1BhUDVyVThpUkRZWFo3MmJPY3NwT01STmhqSEZxK0ho?=
 =?utf-8?B?Y2NqSFhZb1ZaV1pFVTJWUUNhRnlCV0ZzcGpqT3c2VXRtUUZJbitiY1lZSnZn?=
 =?utf-8?B?ek9iV1FzYitoYVpSYXl4aWsyODVyVDlRaHptZDhIV1BRTERxMGRvMkNabm1n?=
 =?utf-8?B?M3Q0VG5UYmNUTldYZmVNVER4cEJoU1pxNElJZEN6OE0yMWs0VFE0eW5iU2M4?=
 =?utf-8?B?KythWnBuR1VUajlRanF2MTNnc3RORzZGTjhuRk84RTlYaSsvTjhCWkY5T1p0?=
 =?utf-8?B?S1BrMGpmRU10aktISnhVTVd4ZlVuaGI5L01NdE5WZENBTCtUVER3VkxXdEtP?=
 =?utf-8?B?NnZEMy9uTUVOMVZVYXJjMDFnUUR3aFVJRTZyN2FlcTBNZGFCanJFQmt6WWtW?=
 =?utf-8?B?T2RvVkhDWHVBVXh2emNNMTlML1VGN1hQTTFnMkNQQndJRE9ydmd1UGVQMU5W?=
 =?utf-8?B?a0M1Z3JBUzI0bHJBbTRRS2FPWG5mdUR2enVIT3l2c2hsVzh3QWNPZHhvYmI3?=
 =?utf-8?B?Wnh1TS91SkxYYTY5NkgzNzdBUDVmbHBFTW81a3JNK0ZEdEFHWHd5cmNQMHFE?=
 =?utf-8?B?VEt3elo0QzE5dmNoTVRHZkQxcWxOMzJxQTkrOC9PWWQ0aFNTK0E5aUZpa1di?=
 =?utf-8?B?cEZSM0ZYOS84Wk05SkhTdUdacG0ycUdnZ203U0hRUXJ1LzBxMlVWY1p6c0d2?=
 =?utf-8?B?OVJhcy9kc3dBVkVsNGFoK1ZFc3VrOTlWbmtrWkQrSTlzb2JDeHlBWXVmMUhS?=
 =?utf-8?B?K0hSQjA3TkFQTXB2a1hSYlhRbnVTdkFieWVGRUhMTUIxWlJIL2gvOXk2SStY?=
 =?utf-8?B?QmF4SG4wMlJaMkRSVmtYL001dVlJYXlJVFlwRjcrcjdvWHlIaWFLMzRaOEIz?=
 =?utf-8?B?OU82SURjV0ZYUTBQZ2JiNmx5NHB1M1ZGcVJtTHBGNWQ3T2dlK2cvMDAzcDRL?=
 =?utf-8?B?OUJMeW9DbnRIVUNjZGJ2eWFRaHFiNGUwZUdkL3NJdHIvYndOdjc5cjh2bWw2?=
 =?utf-8?B?ejMyaWQxSzloUUFxMGF6Z3FHSWNaUGNrNFV3K25tMUN5ZEVBT2RobXZBTlFP?=
 =?utf-8?B?djZOUCtwcittT2V0RVNDODkwcG02cFFiRG0wSGZ1UmplZUJTRzFIemVvckk4?=
 =?utf-8?B?RjhYQ1J3R3VWV0hKVHRyTENsY0dHZkhQbVNFSDBoWXcrZXdaMTNEeWNFZVZj?=
 =?utf-8?B?Vmd2WFhBaTRrQTMzSkNFa2plc0R3RUt2N0p5TDFsY1ZuaHJ3Z2pXWm5CVmhF?=
 =?utf-8?B?dC9pL0xOa1VnaUxnb1NRbHNScVFEaUQzSXZXWko4eGJzekdaSUJlajhaU3pU?=
 =?utf-8?B?M3dHTHdPZi9rblR0d1lEdGF3YWdxMEJsOWlSN1hmbTBJd2JWaFlncllyajQx?=
 =?utf-8?B?a1JzWEg0cHo4eEYrMjVPSVd2TWJ5QUgrcEs1aUJKWEdNNFIrWHFHaWxIb0FL?=
 =?utf-8?B?UWtaNkJHM1NWU3VnMTBLNXYxRDdTalVUYURuRXB2UFE4aW5MWU91cXE0ckZ4?=
 =?utf-8?B?K2szb24yRldEaHRTYllWUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D218D037C4A1BF40B5F3310D9F972CD3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa75f9c-51f4-4e34-3337-08d8d3d49bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2021 06:15:37.0875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0CHQKB0IKEzYFqJc6x8BJWvRQX6KlOCfbEX2wLjtai1QurfIi4sHZJqbEe3/e0/ureVgKQPgblm/qKvXdn0AxmdYTHrmGg2fp79TBvQT2sclCYb6UqAbhjhfOrwGlQO3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2396
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

TW9ybmluZyBSb2IsDQoNCk9uIFdlZCwgMjAyMS0wMi0xNyBhdCAxNTozNCAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6DQo+IE9uIFRodSwgRmViIDExLCAyMDIxIGF0IDAyOjM1OjQxUE0gKzAyMDAs
IE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gPiBCRDk1NzZNVUYgcHJvdmlkZXMgb3Zlci1jdXJy
ZW50IHByb3RlY3Rpb24gYW5kIGRldGVjdGlvbi4gQ3VycmVudA0KPiA+IGlzDQo+ID4gbWVhc3Vy
ZWQgYXMgdm9sdGFnZSBsb3NzIG92ZXIgZXh0ZXJuYWwgRkVULiBBbGxvdyBzcGVjaWZ5aW5nIEZF
VCdzDQo+ID4gb24NCj4gPiByZXNpc3RhbmNlIHNvIGN1cnJlbnQgbW9uaXRvcmluZyBsaW1pdHMg
Y2FuIGJlIGNvbnZlcnRlZCB0bw0KPiA+IHZvbHRhZ2VzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0K
PiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Ivcm9obSxiZDk1
NzYtcmVndWxhdG9yLnlhbWwgfCA1DQo+ID4gKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Ivcm9obSxiZDk1NzYtDQo+ID4gcmVndWxhdG9y
LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Iv
cm9obSxiZDk1NzYtDQo+ID4gcmVndWxhdG9yLnlhbWwNCj4gPiBpbmRleCBiNjUxNWEwY2VlNjIu
LmFkM2Y1N2U5Y2Q5YiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmVndWxhdG9yL3JvaG0sYmQ5NTc2LQ0KPiA+IHJlZ3VsYXRvci55YW1sDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9yb2htLGJk
OTU3Ni0NCj4gPiByZWd1bGF0b3IueWFtbA0KPiA+IEBAIC0yNyw2ICsyNywxMSBAQCBwYXR0ZXJu
UHJvcGVydGllczoNCj4gPiAgICAgICAgUHJvcGVydGllcyBmb3Igc2luZ2xlIHJlZ3VsYXRvci4N
Cj4gPiAgICAgICRyZWY6ICJyZWd1bGF0b3IueWFtbCMiDQo+ID4gIA0KPiA+ICsgICAgcHJvcGVy
dGllczoNCj4gPiArICAgICAgcm9obSxvY3ctZmV0LXJvbi1taWxsaW9obXM6DQo+IA0KPiBXZSBo
YXZlICctb2htcycgYW5kICctbWljcm8tb2htcycgYWxyZWFkeS4gTmVpdGhlciByYW5nZSB3b3Jr
cyBmb3INCj4geW91Pw0KDQpUaGFua3MgZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcyA6KQ0KDQpJ
IGV4cGVjdCB2YWx1ZXMgdG8gYmUgbWFnbml0dWRlIG9mIGZldyBodW5kcmVkIG1pbGxpb2htcyAt
IHdoaWNoIG1lYW5zDQptaWNyby1vaG1zIHNob3VsZCBiZSB1c2FibGUuIEknbGwgdHJ5IHRvIHN0
aWxsIGNoZWNrIHRoaXMgYXMgSSBhbSBmYXINCmZyb20gYmVpbmcgSFctZXhwZXJ0LiBJIHByb2Jh
Ymx5IGNhbiBjb252ZXJ0IHRoaXMgdG8gbWljcm8tb2htcyBmb3IgdjIuDQoNCkJlc3QgUmVnYXJk
cw0KCU1hdHRpIFZhaXR0aW5lbg0KDQotLQ0KTWF0dGkgVmFpdHRpbmVuLCBMaW51eCBkZXZpY2Ug
ZHJpdmVycw0KUk9ITSBTZW1pY29uZHVjdG9ycywgRmlubGFuZA0KU1dEQw0KS2l2aWhhcmp1bmxl
bmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fn4gIkkgZG9uJ3QgdGhpbmsgc28sIiBz
YWlkIFJlbmUgRGVzY2FydGVzLiBKdXN0IHRoZW4gaGUgdmFuaXNoZWQgfn5+DQoNClNpbW9uIHNh
eXMgLSBpbiBMYXRpbiBwbGVhc2UuDQoibm9uIGNvZ2l0byBtZSIgZGl4aXQgUmVuZSBEZXNjYXJ0
ZSwgZGVpbmRlIGV2YW5lc2Nhdml0DQoNCihUaGFua3MgZm9yIHRoZSB0cmFuc2xhdGlvbiBTaW1v
bikNCg0K
