Return-Path: <linux-renesas-soc+bounces-724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB780558B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 14:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24ECB1F2105C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 13:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B725C905;
	Tue,  5 Dec 2023 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="og0PxBmd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57718194;
	Tue,  5 Dec 2023 05:10:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jD2OEVNBnA+HwHzw8t0N1XZZ3t0JKSIXWZdIjmD7PZwHRdbAbV6H5U9ANlQtMI72eqEdZwVd1b+K142/n8/WFUfE8cyGznnQFz2CFb8LaNXMZMKqut2B6lOdTnSzfTTSIvZ/OkUY7ggyJFOg4Hbd9VQfwKZjdAn9mlNUDXQ8HTZz859yd+f031pu9JeNkXArwCEKR7MrLRUrE/UzDCZ8r67lSSRGZsGQlHDJ3yPjnlnkMxK2CI+lm5x46Lq7f9Kr8XkacEzgE1wtgl5NQ7HTXwA72kD6E7dA544zCiTL0sJbcc40v7ysTblEKuQE4JQDulkGpOTXVYGU+R6Iu3qoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYC3BZamts/6NmHk4L6XAvTGckz2Dtc0Xs0h/yLDePE=;
 b=YDQcDsPt742uSTRovPI1EE4bjw/xS5gyRmaDoBzemUiKR88fAiMQ1TY4O7cmYUxOkrToetHW4PHRHrtilOhpMp71nv3qdywjpbNt4ROtiGSuK849x328TY/3ADkZ4qRaaiBuHgiyXzpe1hQ2GtZjEoZvaIif61heqDIwkEDI+pRMXfkt+RVAkoZhSo4rL9btsqZXlZjaNCBZqIrzDiwXU8C23yDpRh7PLX65w3e7zgQOzHVoAiC1+p8GWvWl/A2pWn+PkT2EAb0bTH8KmIYdHEQPS2clkOnxa6BsCcsYLfMnaBLzpa+iCj38Ddncrhh4UREEF6IIMFyDX/SRCasUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYC3BZamts/6NmHk4L6XAvTGckz2Dtc0Xs0h/yLDePE=;
 b=og0PxBmddsfSkneuAWcLJezprYbhz/l/Nimjao/xI6VewOIWpYtUPMC3lcpnLub6RFHkWePXbMpqaAXFBAqnAGQhMVxTEzJAZh8ppvAhqA/x7OF3NyWbCPEj8fIZ0vj177AgS/3baLZ1KdQXEHFtEt/DEXeKGtH+j5tagnPDvUc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB11079.jpnprd01.prod.outlook.com
 (2603:1096:400:396::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:10:52 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 13:10:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3.1 1/8] dt-bindings: mfd: da9062: Update watchdog
 description
Thread-Topic: [PATCH v3.1 1/8] dt-bindings: mfd: da9062: Update watchdog
 description
Thread-Index: AQHaJtbe4EZccKNa3Um4FWQPgvizPrCaXNyAgABOQYA=
Date: Tue, 5 Dec 2023 13:10:52 +0000
Message-ID:
 <TYCPR01MB1126978560C2D842D17010B368685A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
 <20231204172510.35041-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdW0VU8f2oRVuS0WZQazrF__rhGebOV_V7LO4uJKwecDLA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW0VU8f2oRVuS0WZQazrF__rhGebOV_V7LO4uJKwecDLA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB11079:EE_
x-ms-office365-filtering-correlation-id: 0e7838a8-6a7f-4c8d-fed8-08dbf5939baf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 B7rN+NAl6D9syvrSSw6YwYP//FFT8FJhuTJS4bMQJ11BFgpQ3O4ExiNIjXDB8YdgamEpWNPc3uzxNMnXAHng3V6Dd6L/sHuoGnyMPZny+Pcz2heqWTauQQQzBBF2yZeI8K8o4Taz4YthADkBLF8QuZPIjoKwMPiKEfLZy9rC5EoFqQJHeXI1dkB4yhTcM4T3MPEoRJ6DaKric2mE/wFx4wl7vZtHzDJsfmLUvHyYBs0dd1gVRAhazcz7+ZSZyEMPKX04rMbt3ES+w/BT4fHTXYzmUSFyC5549o790ht6fXDx+KT+s27tk8geRKT8WrrFyt7wBZ5k9fTrICCXhbq19QAzCsKJOWh2l9ciFTB91Vn8BorCTqGuCGKj6EimeREwEi2vrQvYRM3SOTvt0NkgPluRhLzFdwwZjG+aw9RbPehJtuVDIGnoC0vUrVTZyXStXIXLPxT/DqEfxfzfOXsKz4izxQgbA4ExHVtAJenabTR3SF9sOqWe31xJd1jsH9cFKLDFNtNpmGBREsPPDNnkOs3Q0b6RRioyJ4IsBk3nxy59ZTFB0H5Yzz/P/mFPsbN3rQsqsAlZlh480H8ejyF7Nb/bw71BklU3lideEgV6tHd3jS8dlrdgw/CRnKrtxZcI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6916009)(316002)(64756008)(54906003)(66446008)(66476007)(76116006)(66556008)(66946007)(478600001)(71200400001)(15650500001)(5660300002)(38070700009)(41300700001)(2906002)(4744005)(33656002)(52536014)(4326008)(8676002)(8936002)(86362001)(55016003)(122000001)(83380400001)(26005)(38100700002)(7696005)(53546011)(6506007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUQwdTZvNDM0SFpRdlJKR3o5SmpJdmZMRzIvaDR4VjVzVytrL2xzMDRLam4r?=
 =?utf-8?B?WWVJdzFjTVJTTmJZeGtlOVowZE1KNGFwdFcxVURtLzJNSi9HcE1jeEFmNjlF?=
 =?utf-8?B?Qk9laHY3MmZLMjQ1VzNZOEhyQ3BiYWd2MHJ1S0dCTHFZc0dtMDg0RzNrSktH?=
 =?utf-8?B?UVczUHNTK0hIVVpGYnQ2S1NTamtheVlvMkhGUW50Uy9wYVV1NzUwdTE1alBD?=
 =?utf-8?B?U2tSZFZia3NMY1hheFVlQlNrdXhlL2tNWHRsMWV4amlUNlNDTjk2UWx4VDcy?=
 =?utf-8?B?dWdHemlYT3IrMFpxcmVCR0xnY3dCWHUrRCt4OVFWYW9iY0JadmJuNFh0U0NN?=
 =?utf-8?B?Y2lNNUgwU2FsSXJUK2VPb3FFQXF5d2N3ek44aGlVSnFxK0V1NTluSXhqQ1dZ?=
 =?utf-8?B?R2JTVzBPQWhVRzV2dFV6cjZPSGI2OFROUENhRHk3eU9OVzlNN1NxQlRnL0FC?=
 =?utf-8?B?NjJTeVMwOXBScUtKeUJVbXorVnp2dXpLS2wrdDZ2SHJCYUxxTTFjb2xFYnhy?=
 =?utf-8?B?QUZVN1R5Q0RhWGFJSmUvTlNCa1JwcnJTdFd5OVNCTHZoNGpIQXJWcldadnZv?=
 =?utf-8?B?WFJEOVYxT09yT2hwdHZhbmF5bDQwQTFKd1RGSkJYRENWNU90cTZVM25sT0Nk?=
 =?utf-8?B?RXVveEZKQTdnOWJnMXNScmlaVzIvUzdCQnpCbHhzVzVaWFFudTRYU1c0OWNL?=
 =?utf-8?B?NHNXRVo2YjdOTHhBaVp6YXBYc1VzSkJLSEFHeE9xdWRNQ1V6bUxXOVNaQ29U?=
 =?utf-8?B?dkJhUlRxbUFDZ2tOQ3Ixb2FUaGF3bjhHbWF0Yi9PVS94V1M0Q3J1YzFKRHRN?=
 =?utf-8?B?NHZRcUlqbVFNdm1hcXRSSnNSbk5CT3Q2aE1Vb3Y3NWVLWlBXUFBBZUYrdmFp?=
 =?utf-8?B?bGo2MHdCWERuK3htdGpCdGhKUUI2T0RmZ1VCZnF0NzBURmpxZHZBaVVqdlB0?=
 =?utf-8?B?TDJFZzI5RDBIaDhYaHVSZm0xUDJVQTRRcDl5eXFPakVUNHRUVkZ2K3BCV3V4?=
 =?utf-8?B?Znp0bnN5dDBOb2dLWTRvWmxlRWdkOWpGM2JLd3BqQlp6QndpSkErS21oREdk?=
 =?utf-8?B?R1hUM2dkNnFmZWdYcXhDNjhIVXVaNDBXTkJLSGJVbitqZDlJR1lLMmttaFVi?=
 =?utf-8?B?Y2NRUS9ndnBTbGsvN2ZhTzhObm9vL2IwWldMRk5HNjlnNlBHYWJFdldUUXAv?=
 =?utf-8?B?aWZjdzNrN0dDYWJ3cUR2Zis0TmJuVy9rS0wwem5xT1d6bU1POHZHSExFUS8w?=
 =?utf-8?B?a0JYWXFGbEQrdE15cFpQU1VHd3E2VE85OE9XZUJZK0hSdE5mQXd3ZDVkdi81?=
 =?utf-8?B?UnVMbndtREZ2T2pqdkcxaThCbWMyLzVJbGxmNDZFbW1PZzhoOFBpbVdtOEpN?=
 =?utf-8?B?VS82R2lUT0pZcWZXUzc1cnpHUWNUYTFiSWVvM1prMVlmOGZ6SmFac1lKRlZo?=
 =?utf-8?B?QVZQWFF4aGFWZnRBVmVGWmdYS1hlZkE1TC9JSW94K1o4b1RqZWVCWkhKc3RX?=
 =?utf-8?B?dVQ1MklHVTR3N0ttSVNzenZ5RmdFeXRaUWV5VVZTTHkyRE0veCtOYWlCb2pB?=
 =?utf-8?B?WkhLNHJPcG9DK0JROUFpOS94blF6eXd3aWFyNnYwV3JhcjNwNkwrMDRPclg4?=
 =?utf-8?B?YXdVSm9uQXRYdWdwKzd0K1ZZRFAwdU1Gelk1cHMwdWlscmxCUWlRQ1pydnZy?=
 =?utf-8?B?cStpazRsaS9zUUllVzZTckxWRGJBbDBGeS82N20ySDZBU2RIcTBqdkxUL01l?=
 =?utf-8?B?OUtBeDd2VFJ5OG1NUWJTampjaHpQSFJQdno4UnAxdTQzSTNpSEZZOUdUTmR6?=
 =?utf-8?B?V3lka09zL1lKWjhZYlJLUnlHbkxWblVxTXI5cWFvVlFWVUNOMENmbEplWGQx?=
 =?utf-8?B?NHo2VGNhV0FDcWF1aHF5SVJaWW0wdkFocEVjeTBqQ256Rzh3SW9RVlJhQ0I3?=
 =?utf-8?B?bEh4SXNLTWtHbEhWdHdNdHFHTm5LWU41UmZ1OXJPOUMwcDRmTTJJWENLNnRT?=
 =?utf-8?B?SFIxUjJ4bFdzT0NIeWh4WDhEZzJOUElqWXpycDQ5dGE4bUZQOXFJVWhOWlZ3?=
 =?utf-8?B?dGFRVmxsWE5IT3FkckhYY09wMGVWUEJ2WUh0UUNIVjV0V3c2WDZtNzkzWmRO?=
 =?utf-8?B?QU1mNmtVTGdyL0JNNE00KzZmV2FZNE10dVVpMDdSa2lObGtLbkdBeXJPZk00?=
 =?utf-8?B?OXc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7838a8-6a7f-4c8d-fed8-08dbf5939baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 13:10:52.3777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lua5RVvDPeclocrFcV6PILaeBaFPEAnN65PBCz6ReCqQeRlrxPVNNoZ62AsdkFl6dDTcVNSexKFnHP+BkqCtihZ1hYCcOon58U6pA9DcxlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11079

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDUsIDIwMjMgODozMCBBTQ0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzLjEgMS84XSBkdC1iaW5kaW5nczogbWZkOiBkYTkwNjI6IFVwZGF0
ZSB3YXRjaGRvZw0KPiBkZXNjcmlwdGlvbg0KPiANCj4gT24gTW9uLCBEZWMgNCwgMjAyMyBhdCA2
OjI14oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToN
Cj4gPiBVcGRhdGUgd2F0Y2hkb2cgZGVzY3JpcHRpb24gYnkgcmVmZXJyaW5nIHRvIGRsZyxkYTkw
NjItd2F0Y2hkb2cNCj4gPiBiaW5kaW5nIGZpbGUuDQo+ID4NCj4gPiBVcGRhdGUgTUFJTlRBSU5F
UlMgZW50cmllcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2My4xOg0KPiA+ICBNZXJnZWQgd2l0aCBw
YXRjaCM4IGZyb20gdjIuDQo+IA0KPiBGaXhlczogYmQ4ODhhNDM3N2FlMTAzMCAoImR0LWJpbmRp
bmdzOiB3YXRjaGRvZzogZGE5MDYyLXdkdDogY29udmVydCB0eHQNCj4gdG8geWFtbCIpDQoNCk9L
IHdpbGwgYWRkIGZpeGVzIHRhZy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0K
PiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

