Return-Path: <linux-renesas-soc+bounces-522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC56800C82
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 14:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A4F2813F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189003B28E;
	Fri,  1 Dec 2023 13:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="w6ciiap9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7371FB9;
	Fri,  1 Dec 2023 05:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASoqbXIcn8G9J/8zS6dDHiTSKpAbx2Ou2r52iZNuT0IjTBWCrPUnGOMGTE1R9i9MwpWHV9VbncvKfnBgJdkYvE8j1RdYQtLc3IbzRV8JNg6wbhy3w5IroXY0TANIoObs/A1EEpOyqRkkEpxiEO6TWAod+w0CPLfbLb0e7ykGkWu8ckq9Ssxc0+1eybUZkxBIAkyD2F3xX/n9QzSvmsP6Pub4sUAbMDj4JdEN1O6ozo/vvqRdTiT7U8vCsatS1YneSHaJjS4GgZCDCiN8zowD2sDLgT51t8sbdmdiZDqiwTuuBkSNmQ9gKmSdCEgqLzyCLZS/KvG8/sPMz7qIPsvFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4ZvB2QL0jpiBoCtm4Tt/RdFcekhcLeomW+XUc0EStw=;
 b=fIP5wo2h1SttCBQBhalE0uFXPBzY7dJEjUR2+tVyU7OJgOqpt5LEhB1sD2x0lY4Xt1XqWzBfbpKE6HLUfZIHk81dSGeQbN8K1A4DcUqZxkZsBPF6Xeys4qGVjycrH0GbvSIBBFh83JSgOiW20eFa6jcHAh3c00WZfAtK9pV6flLJ3Kj1S6yz4uDdWMjiS6GcPV/C+7v8QZY/Wfsh/1EKkcfuI9lkBBOuP2//fEGfk+8xYYCueKRCi4SAezCXR7ScGrtjncxzB4GpYZ8H6mZ+N8vQlliSNuXTPMeCQVc+ewurpGBAH9UzgOfURdvC0nViB4mZQWnVe+Yge1V38GcZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4ZvB2QL0jpiBoCtm4Tt/RdFcekhcLeomW+XUc0EStw=;
 b=w6ciiap9tYLSsmg0xBHKAfVHEdz6Lxh4oAoeXwR5eWKNPzB1w+93ub+UXygVK6gLp9vCSSWTg1aM4K2OB2l9nIRJWq5r0645XoIUjdVKPLmC19TnBJJy3p6oPuKpLWdt4FSlxtVN7ELNfxd0W40GywdlOtO0NNfghsP6DcAk0bU=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by OSZPR01MB7818.jpnprd01.prod.outlook.com
 (2603:1096:604:1b6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Fri, 1 Dec
 2023 13:48:40 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 13:48:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 5/6] arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and
 built-in RTC
Thread-Topic: [PATCH 5/6] arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and
 built-in RTC
Thread-Index: AQHaJEbNM7R/cfI89UKUKSmIlHIc6LCUbysAgAAAnjA=
Date: Fri, 1 Dec 2023 13:48:39 +0000
Message-ID:
 <TYVPR01MB1127976D50055BD345C7935F28681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXH3VVg0KmC0rtjeb_A_Awj805Mirc4pZu=KDZO9pdZZQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXH3VVg0KmC0rtjeb_A_Awj805Mirc4pZu=KDZO9pdZZQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|OSZPR01MB7818:EE_
x-ms-office365-filtering-correlation-id: 430fc650-b950-4dbd-9546-08dbf2743991
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /rmTnqIIxphJ8YuEsvIkH4jX4KAuU9LKnXHVgMh5j9RUMVicNvw1frDk5sUSJr29/EuHkM4azQdGACqoH2vipP7a84oMQkngQ6YtcftDkEQO5Ee3mrKR94OlMwbXfNUckoWwlWeqwAbziFdFKjSXNSfj0PZIh09TS6RohMGg9ezJ6FSWm6sfsROG0yo8ZXxb8elVm50P4G5Mn13nBl7AQ1BvvJt/GhUSRTIa+fch7HrRepdMnYHtjCa5oFkYItecBOx8w3Jje41wE5MBoShH7FVJCKJu3o+tQThiOwlmdYQvLitXyiYEEgWhUFkGeNemL0UBz34Gttc7KAgOdOisLerHiBv3t9f8QNso98qJfNGvvVdep3KC8FBuclTw/0rPkx/rShNEHqHH7NHLm8Lr8k0/THr74JEjQx68YDxe4L3hPPIEVynHm4EO8OW+n1xekKWIOQn2h9J8p0GDdmWtJ2/ipHzZLpOxg2Dx7fqqQ9WKuxQUC5aPLcC7jBdoMjRPmWo3PwYB2cHYrCMQirK0jXkntLO3ncf5aGZYKQVjHO2EC6PnSBo22eqkpm1FCojXVGxuNYYnVAvodPhS4/6BVIbRlW+REWOf01J/UxKcqmkcel7mtZvtvBRDMR+Aci/A
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(76116006)(66556008)(316002)(66476007)(6916009)(53546011)(66446008)(64756008)(7696005)(54906003)(6506007)(478600001)(9686003)(33656002)(83380400001)(86362001)(38100700002)(122000001)(55016003)(5660300002)(4326008)(8676002)(8936002)(71200400001)(52536014)(41300700001)(38070700009)(26005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?REJDdmF0Nlc5MHd6Ym5zMlR0d3d5aHVCT3RIRVlVckNja0JuV2Y3aE5GZW85?=
 =?utf-8?B?cld1QXh3TEthMS9GbW0zVExDWDlsMlBTRXpkUFZNSmhDK3VsSTBTNnNSZjRa?=
 =?utf-8?B?K0doK3dpSHkxWUpGanp2bVErVlhERFNnZllIQ1B3NWJNeWV4dFIreGFBVWta?=
 =?utf-8?B?MFdCRk5sTUI2ZGVMVzJjZ2t4RUgxVEVnR0QrS0NHRWNLcmRKSS9tVHlWaEd6?=
 =?utf-8?B?eGZUeDk3LzlwbUVNRTJkNGt6MHcvOTRwS0NZcDhtU0kvai94dW51VFpiekRF?=
 =?utf-8?B?eGQ3Ky9IeWJFOFBPQTBhckF0c2x0N0RmaWFQSWhrb3Uxc1JaNzZIOE0vTSty?=
 =?utf-8?B?dHZtS3FIOTBOV1BWYmhzUWRqSW9qUk4xWlVpM0k3Q1F1QkMvSS9XSVJpSzVK?=
 =?utf-8?B?SkpENm5EaFNMem5oWGJWR091NkJyaG1XZjczQ3NqK3BUbG5PVU1wTjJtVGp6?=
 =?utf-8?B?RWEvZCtzaWxqNFJtVDk5am1Wak43SlVQMWhWazNFRnNYS2pCc0hKUTJNRE9H?=
 =?utf-8?B?eDNBY0ZWZFlNOVg5T1RhMFFnWnM3cXFRRm0yRlBzaW05WVFVa0hPV3EzTDNo?=
 =?utf-8?B?TGNnQ1dOUS8vcXVObWpXem5uUUVPN2ZTRGp1VjN6SFdmTGpZUFNPQ3J3MUth?=
 =?utf-8?B?cTcrc0ZIY1ZIOTRYR3BzUWNtOXRMVHhaZTJTSnVOVnRFSGpvZjZWVW5sdFpu?=
 =?utf-8?B?aW9hNDhPaGc5RUpvUXIzcXZkU3FlK0RJb3o4c0RoUE5XOTA3K3ZDT0NxRnZB?=
 =?utf-8?B?OUZ2dHZLM3FSeWFLaVc4cnVKUmJMS3Fpb3FtNk8yTUtMTWRod2tmMUdJcllm?=
 =?utf-8?B?N21XelZFQ043WTJ3TVVIcVRlSDJPajdObjVWaVZzZ1ZpQXVzak5mOWpYYzRL?=
 =?utf-8?B?ODIwbmQrMEdSRmVNNHdWNnpjUjVqZlRaanFKcVpia0dQU0NRWFJJSWdreTlm?=
 =?utf-8?B?UEMzeWI3L2JjTXgrV2pXNHo4cElxdmFoMjNSRDhCM1JMM2JzbXJCMUdaMTNG?=
 =?utf-8?B?R29IbzhBRHlkeWwrV0o0QUxBV3ViQ0czZW9sZy9EeGpaZ0piYzN2MHhlRkR5?=
 =?utf-8?B?ZnZHLzFza2dUem11a2RvYWpEazk3clNOUU1zUnY1OFROWThDaGxkTVVjUUpF?=
 =?utf-8?B?dVh1NS9XYVcvN2FSckhiOFh0aldkY3VGcTZxNHRSdXEwMG9vOEFYODh0a294?=
 =?utf-8?B?UzB0OWJTTWtPR1k4STZmbjE5NFRVdVJ1NzdQYXd1cU5qYzFIdnJxUERIdmJy?=
 =?utf-8?B?V3lXYjZQbEJUTG1YZmhucDZiZnFUb252NXNma0txWEo3TGtBaHZwN1hzeG43?=
 =?utf-8?B?TE4vOHFWMDhTRVdLZUFRYnJPRnluSTJDTEVNTU45Smxvd2lOOG5DaUV1SVhZ?=
 =?utf-8?B?dHZyZnFWcVlsQlpkVzZkSmVuS2J0MHZ1NVJuNHQyak5XbXRqRVRPdkdYdTVT?=
 =?utf-8?B?ZGg0bmZmK0svY2hrbGpRNUJXUkZza2JNeENpbCtaSkFDVGtsYk5SWVNoSTRl?=
 =?utf-8?B?ZHg1QkpVc29Hb2lLNXVBcFRpYTUydGpUVnRLVDhtemhtM1N3aFlLZjNhRkhM?=
 =?utf-8?B?bVlJY3o3dUxpai9rYmJiYWVQR1QrdnhKVkx3VEd3U2RKQjZvRlc2OXpRQzdJ?=
 =?utf-8?B?N2tZOTlCWHp1N25aaE5zRERBeW5lUmFDMXFldlhlWHZhRXJSREU0d1oyT3Y2?=
 =?utf-8?B?V21OZHhCbzhzZlJScnpwVXZLUTFXUy9VRmVwOWlZSUFRN0NHTmgwbmE1YXdk?=
 =?utf-8?B?bmRWSE4xUjJ0SkxlUzBjSHBsVXp4VlJNVksvRmdoTWZEQmVuUXJqMndoMk1h?=
 =?utf-8?B?OVFjS2FaRjMxTVJmdHF2eDA5TWJ3aU1jdlJUMGxrZloraW0vWHMxTzFDaTdK?=
 =?utf-8?B?NXpPZGRReWVwK1FaVXVXSG9jUStvc2hnR3FodURFcXN4MDRHUFNiTEp0ZDRP?=
 =?utf-8?B?NkpBajZ0andmUHJ2SHNmc2l6VmRGdG5zSGprOTZEQ1NCQjVkaWI2dDZsbmtC?=
 =?utf-8?B?VzRJV3NNallSTE1KVDR4cjl0MzAyZjJmdmtjOU1LODJNSjlESFIyWm8zQk10?=
 =?utf-8?B?R0xjY3BiOVBDNXZNOW5ST0FnU1ZybTFWMFJXNG5yeTY2cVVKSnJBZzNXSEcx?=
 =?utf-8?B?b21KUnE3SFQwMWI1TnJlRFRlT1kwaFlBd0VzbTVGT3Z5cDkwY1I5U2ZSRXEw?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430fc650-b950-4dbd-9546-08dbf2743991
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 13:48:39.8889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UzoqvKd7+4Izo3KEcRuxOgjBOJukdqSqT7X5H7zAvnVcsF6BO47ICjnFsAsF4g1MpdlRB0mAS3EfKJhhU8hi0ZudZyrqTfug8AzjxeO+mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7818

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMSwgMjAyMyAxOjQwIFBNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggNS82XSBhcm02NDogZHRzOiByZW5lc2FzOiByemcydWwtc21hcmM6IEVu
YWJsZSBQTUlDDQo+IGFuZCBidWlsdC1pbiBSVEMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBG
cmksIERlYyAxLCAyMDIzIGF0IDEyOjA54oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBFbmFibGUgUE1JQyBEQTkwNjIgYW5kIHRoZSBidWls
dC1pbiBSVEMgb24gdGhlIFJaL3tHMlVMLEZpdmV9IFNNQVJDDQo+ID4gRVZLLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcnpnMnVsLXNtYXJjLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcnpnMnVsLXNtYXJjLmR0c2kNCj4gPiBAQCAtMjMsNiArMjMsMzUgQEAgJmNw
dV9kYWkgew0KPiA+ICAmaTJjMCB7DQo+ID4gICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8NDAw
MDAwPjsNCj4gPg0KPiA+ICsgICAgICAgZGE5MDYyOiBwbWljQDU4IHsNCj4gPiArICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJkbGcsZGE5MDYyIjsNCj4gPiArICAgICAgICAgICAgICAgcmVn
ID0gPDB4NTg+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgZGE5MDYyX3J0YzogcnRjIHsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImRsZyxkYTkwNjItcnRj
IjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGRh
OTA2Ml9vbmtleTogb25rZXkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZGxnLGRhOTA2Mi1vbmtleSI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Rh
dHVzID0gImRpc2FibGVkIjsNCj4gDQo+IFdoeSBpcyB0aGlzIGRpc2FibGVkPyBUaGlzIGlzIGNv
bm5lY3RlZCB0byB0aGUgcG93ZXIgYnV0dG9uLg0KDQpJIGhhdmVuJ3QgdGVzdGVkIHRoaXMgZHJp
dmVyLiBPSyBJIHdpbGwgdGVzdCBhbmQgZW5hYmxlIGl0Lg0KDQo+IA0KPiA+ICsgICAgICAgICAg
ICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgd2F0Y2hkb2cgew0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZGxnLGRhOTA2Mi13YXRjaGRvZyI7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAg
ICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHRoZXJtYWwgew0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZGxnLGRhOTA2Mi10aGVybWFs
IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+
ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgZ3BpbyB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJkbGcsZGE5MDYyLWdwaW8i
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4g
KyAgICAgICAgICAgICAgIH07DQo+IA0KPiBXaHkgYXJlIHRoZXNlIHRocmVlIGRpc2FibGVkPw0K
PiBJZiB0aGV5IGFyZSB0cnVseSB1bnVzZWQsIHlvdSBjYW4ganVzdCBkcm9wIHRoZSBub2RlcyBp
bnN0ZWFkLg0KDQpJZiBJIGRyb3AgdGhlc2UsIEkgZ2V0IGZhaWxlZCBtZXNzYWdlcyhlZzogZGE5
MDYyLWdwaW86IEZhaWxlZCB0byBsb2NhdGUgb2Zfbm9kZSBbaWQ6IC0xXSkNCmZvciB0aGVzZSBu
b2Rlcy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4g
ICAgICAgICB2ZXJzYTM6IGNsb2NrLWdlbmVyYXRvckA2OCB7DQo+ID4gICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAicmVuZXNhcyw1cDM1MDIzIjsNCj4gPiAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4Njg+Ow0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcN
Cj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFs
aXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

