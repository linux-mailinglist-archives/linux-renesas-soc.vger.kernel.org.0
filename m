Return-Path: <linux-renesas-soc+bounces-3261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A186902E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 13:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3311C22D55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 12:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA12013AA33;
	Tue, 27 Feb 2024 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UJSO7Co+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2082.outbound.protection.outlook.com [40.107.113.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870B113AA2B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709036024; cv=fail; b=VOp+hV+p5om200r8M4VvlSmfrhhQbX1U7VZHPjyG+sdI9fOtYyx9R+r8GOmwZ7hnRAIQmaI7rZSVLubrFuRsI40ODw6aCvDY2ulEmy0kTK32WAJ1xC6lM9fqARt6k/8bqB/eKbpcEP0Igeo8GDxxlVJ/6QbLFv+WYvbDnEzvBCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709036024; c=relaxed/simple;
	bh=zYdS+v/dNC1hqG0bb3LeSr03wq655nl961Z647dbzlk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BJQmrZ+rvCwb45Q9MbSoCUmiSkCkFGehQ6YQ+BOz0p5kc2O775v/59EDOoMwz69oRjK44GcmPa6HpMY7Zsu1+mumuGK/5w9n0sz6YYNq64Vg65tIzOz5T4IiBuak01a0jMt1Kzz79kGW3js4B8TyS7yG8Ta1KdlhDXUDykNn6sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UJSO7Co+; arc=fail smtp.client-ip=40.107.113.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlOGWhrT/VHXtb5+BSbV1NkBUSuqs1ElOklUBF5Y8NyBNZEPqAP43fPFtiOCNPJOVsHkS6nzlJZpqJmpH2R6fXSsflKl4/YcGX+DXdqYSkfuwiFYvQNNZQTYMRDfa46QEeBrJcIFWlQY1+20B5iu1RfJ+tDh/zCX0Ru+pisTuySrHZcQ2AHAx7ei9liZE5GV4DaujU4VtGbZ0FneBdsoJR20c7G3fI3ddCA5SdHvnyhwr0RpXpm0Wf9ARTYAR31GjBqchFBp+AFLjZ/7Yu378wuBXZbUF+TYn9IQfLpuK5TIX6ktkuds43YKNCLVNBYFQF2Mi+Kh/XcCL2AQk+eeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYdS+v/dNC1hqG0bb3LeSr03wq655nl961Z647dbzlk=;
 b=Tso6sjnjlplvZ5AtkI+FGkQ4h/ErnOLkUE1XsIgYgbRuznY8WxeFWFMf6P4hPAmd6SdMfi0BJCzjeb0NIb6dZ90vVwcFTW82S1W0toIdpAS6/M6w/sPkbxWH9f61k+i3UqxQic6QCRpk7X7ZvgOCX2ux51zxppNVoZ4S0qTyncPLkRtoQjKDI/8lae72LVfKPtQHOps8rfmihnBtOlQ13i3jGIfIwXFrDvXZ0YoSl7/G8bJwy/mqYNO2ohnNK7dLe6j7iRQM2tZELwZMKqawmz/RO/FCuTvveWo7puWwP60akE1qhfTuxaQK2/eDYlK93UK3RqqS6xtX03dwZgi5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYdS+v/dNC1hqG0bb3LeSr03wq655nl961Z647dbzlk=;
 b=UJSO7Co+2L96rApo0+llRjNUzYHD7UUEfSGoaiE3OUNMMYJCE3D8ftq7HyPyUD/WKwrZqWgRGnUdpQxDjr7yXHJN0854lwlHGJ7uXPQcdTibVZYS1Rj1gOKS/7SHTw+2Vl2d/YWy/3ddjShIe3N5hTDNFI2+bPrKqwAv7J+YqsA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB8379.jpnprd01.prod.outlook.com
 (2603:1096:400:160::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 12:13:38 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.023; Tue, 27 Feb 2024
 12:13:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Konrad Dybcio <konrad.dybcio@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: defconfig: Enable Renesas DA9062 PMIC
Thread-Topic: [PATCH v2] arm64: defconfig: Enable Renesas DA9062 PMIC
Thread-Index: AQHaaO6sAWDQvb+u4UuLCtdC5QZR7rEd3E8AgAA+QeA=
Date: Tue, 27 Feb 2024 12:13:38 +0000
Message-ID:
 <TYCPR01MB11269AABAF06BB5F9A8F6164986592@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240226200157.428896-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXyJP=dor0nujf1p2gsr+b9ZRMns9YTfV5-MZwf_L5z3A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXyJP=dor0nujf1p2gsr+b9ZRMns9YTfV5-MZwf_L5z3A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB8379:EE_
x-ms-office365-filtering-correlation-id: 8a01ab61-fd59-411a-2a04-08dc378d87d5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ru8LrvRlD2hFUdd+pZuFB+ewGOv3gmjOPGhZHWIdJk1U2dDJmq7UCWI+eJUqzaDyP+s9Aw+PIsGJlzdBIvXOIwXa2lR9P56jANBz1stO8ieSWokedDtpiA2+N+LqmzlXRxKwIVkPUqm/AuHEoYpART50psslqgYx+p+UmHTsl8T2zOsiUPGb3E6Paff6MbomhLSAlLtgMLpMIIMR2lnXr5gB1iB1MkRRrW7wZhLOXGGWPoCCQE8mS/ffGCt0RgPI0ubUlOZjFDC+M+KAcUymvxQ6pETBYH9LtM9pShcCkfMU2YwWmcmZDU7hXKi4zWPG6RRw3KVGcB012bm6q4wYFGS9lWtMRYDasCRj4aqtOSkm6p/luNdTEHwtSa8aPXTkyz32lr3WntDZKCI0wKpy+PXVjxTGuHPTHLN5r6201yo4+3aseHkH4UNFq/xhmll/dsaVnlop6Pn/UTiIPmn0pcF4NMZ+GGkOhFZ2g0VArmvUITlO5OQxU3dDEYMpLE+/nyiK+emR3H7sVMpqsGx8b13kF6fnTbfR7fkaV0SMKw38RfX6oGjCU5bdEXx9r39u8gTzqQjH2lnN5vuAzPMl5SpOEADlvatVoc98pJUS9AG1gttJdDTN//3V5JQQE1WShl+J4Jt5IokRxagR/synqLD36MPRCzOaEmwATMNBzpouHSpe63wHZEMD0dsVdq+BEDUPbAHiYlv+o68KBSJIrqypLzVXMplLK2nfrx/vqEM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S05zME5oSitvTUZtYzNHYkFobU42VU5lS3cxNlFRNjZLQmdIODc0VEZKU213?=
 =?utf-8?B?ckpFbXBCMFluWi9TNE1YY1RrMUtZWGt3RTBJQjFtdTVxV0RhSWhyMkxHTExJ?=
 =?utf-8?B?Qi9YWExaUnlseXFZL3NJTUNkWXNUUG5zTjhZdjFxVGpIMXZYVTNQcUlEMkM4?=
 =?utf-8?B?V0JuTHp6QnI3SThacHozVDJMQTE4RHBGY2xCU2pubnBLbGwvYm04TVVEYm9T?=
 =?utf-8?B?Qzk4NlB0V2NaSVJIV1duTVNLbTVwSm50VHRUZzlTMFZ2SUhpL2QvYmM5QmdF?=
 =?utf-8?B?ZGZza2lQNHFUQ3RlRlJYOE1WTnJDTng1MGIyT3ptZ0RHUU1GdmFnVTRLY09Z?=
 =?utf-8?B?NnpXcFNML3lPVHBRdGJBV3ZVaUdDRzZHTll1elJZL2hPZTNYeXBmR096RkRo?=
 =?utf-8?B?NFlISDA5Q3JFTUgybHlOeXlXaTlsT1BJL0VXNlpLc2NKS1RiY29oS0UwaTdW?=
 =?utf-8?B?a003NDR6QWZxSEtNNmdYV2tGekNlaDhGZjN4dENtOWNPT1BCcDgxbU5pZFV4?=
 =?utf-8?B?RUl2a1d2aEVET3VuZTJwTGtKTENML1lBTEx0cEdpZWtRb1o2bDFTS3hadll1?=
 =?utf-8?B?TVFOVVJSaUR2U3NWVHBMQnZwZ3I1b21EY0RNY1pZeGwzTDZEb2xnMkNLUmtx?=
 =?utf-8?B?QmJXZTdEek5HOXNFeGkvODNqQlhmb2JGUWdJcFlrbS9DODVINVFidDdNdGpJ?=
 =?utf-8?B?N3JRbWpQMTNOVHphbCtRM2RSM2h0cnVNeE5wK3QwaFFUTndvNkdlb2N2QTJn?=
 =?utf-8?B?NXpDUzhoTkhBSzZWaGNCeGFsWHc0RDhkeC96dDZudHhydTAxdEZXcS85NVdu?=
 =?utf-8?B?eFN1Ty8vOE54MEd0NzArOHdicGlNSzJrbWk1NWlRZEh4anVtNnNjcDVMSGE1?=
 =?utf-8?B?cTF5U2gyVWJPUkc0cWRtdS9tazdNQzlhSG5zcjkvTExhYUZtWlArR2ZDQ3Jr?=
 =?utf-8?B?QXJINFMxVWdKUlQ1R1RjTC9peEtOblpUemdZZ2ZwTy9JK0E3d3NxWVlsbTFZ?=
 =?utf-8?B?TEozaTNkcTlJU1ZBVVJqSmZDQWNGSE8xK2phbnpNdlc1ZXYrZ0dFbnVLbmdN?=
 =?utf-8?B?UGtubTIzQXQ3eGFQaCtaOVRuQkZycWViVVpXejRDaXJZOXRKZXIrSDRUYml3?=
 =?utf-8?B?OUVveW5IQXBoM1NTelVScWI1b3ZGMnA5L0FNTE5HTVJrWEpHZlV3ZERBK0Jw?=
 =?utf-8?B?UkJKdzkvWmg4WnFRVXBaWld2QkZ0ZHhPU0V1SWFGWjlsLyt3T1lySXJFNEh3?=
 =?utf-8?B?bGFrYUNFSHNKa0NSZXV1bWFZaUpiQ0Y1RGwzTThHd0QzR2FZaGdHbTRYVU1L?=
 =?utf-8?B?OGtwbGtZejU4eHJtck9GYWh1UjRZOUdBUXdXaHpoWkNIUW1mVVdNR1hkak80?=
 =?utf-8?B?S3V0SnZCLzhVMlpGOVRsS3dhODgwa2Z2aW5kUUNmeXltTDdJN3V6YVBIUDZa?=
 =?utf-8?B?RkFnWmNHWXBaMVlYaEZOZDhIUC9VSFN0aEJZekQzSUlPT1dRTkg2bTVjRE1U?=
 =?utf-8?B?RWFwaHVrR3M3czgyRjBmUVhsMFNid0dtQ2w0RTBqN0J0dHR3Uy9zeXJ4eWJu?=
 =?utf-8?B?VUJMM1RkWHc2ZWVMd0dyVFNsUll5SEJkZTJ5ZXZyUFRUVzVnWFBwYTNGSkZy?=
 =?utf-8?B?dFBWbXdCY2VOcGxPeWRGcUtmY1RENFZWWFFYTGpvWmIzNXNRSnBpdWhFcDlV?=
 =?utf-8?B?ZlVtRHdXMnc2eXdYbW1QWGt2TlN4RWRJTnNybUc4dUhGd0x0emR2K05MREVH?=
 =?utf-8?B?Y2thMDdWQ0NHYnJrdkpJTjVUdFlkbHBkODNUWWlvazJ5SWpQbjRrRDhTMTRo?=
 =?utf-8?B?VG5uampqQ1RScUhUL0VGVWNveUNJQ1RPN2FhYXFhR0g3Z1hHdlR1WHNsTDVH?=
 =?utf-8?B?RGxESjJ4Zko3dzkzaktjeDVvK3d1ZTVQa3RlYmZmRW9nTG52ZXNNZEVhTysy?=
 =?utf-8?B?YytzeXo0KzVXYm5TU2YrZzE4OGZUSTZtQ1RiNEkvK1hGa0pXdEphRFFaZXk1?=
 =?utf-8?B?V3J1YW5CSHlkbE8yQ1V6MXVzTW83OWdoUjhRUFlUMDhXSkNYUDVYV2ZzMWFX?=
 =?utf-8?B?RUR0UGhKcURXMFhia2MwRkZ5RFFOS3BZK0UvN2xtaHJvQXlBT2xMdldXeGN5?=
 =?utf-8?B?M2pvd0JHM3NLU3dCMS9DSTdxSGdaeHl3ZW9QT2V2WnpDSDlQazByZkdacEFh?=
 =?utf-8?B?RUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a01ab61-fd59-411a-2a04-08dc378d87d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 12:13:38.8441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hq+etmF/277Sn+jJoVJsOHBlsMQElpmIodifIUZvH50/N+JvLOfjZsHBnqi9CLziEKqguFPpsGAfjTPGwy8NJZX5PBfP+8B+4AhMPVYdc3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8379

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDI3LCAyMDI0IDg6MzAgQU0NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2Ml0gYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIFJlbmVzYXMgREE5
MDYyIFBNSUMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiBPbiBNb24sIEZlYiAyNiwgMjAyNCBhdCA5OjAy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBFbmFibGUgdGhlIGNvbmZpZyBmb3Ig
dGhlIFJlbmVzYXMgREE5MDYyIFBNSUMgYW5kIGJ1aWx0LWluIFJUQywgR1BJTw0KPiA+IGFuZCBP
TktFWSBkcml2ZXJzIGFzIGl0IGlzIHBvcHVsYXRlZCBvbiBSWi97RzJVTCxGaXZlfSBTTUFSQyBF
VksNCj4gPiBkZXZlbG9wbWVudCBib2FyZHMuDQo+IA0KPiBSWi9GaXZlIGlzIChpbiByZWFsaXR5
OiBzaG91bGQgYmUpIGhhbmRsZWQgYnkgYSBkaWZmZXJlbnQgZGVmY29uZmlnLg0KDQpPb3BzLCB3
aWxsIHVwZGF0ZSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLg0KDQo+IA0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0K
PiA+IHYxLT52MjoNCj4gPiAgKiBFbmFibGVkIENPTkZJR19JTlBVVF9EQTkwNjNfT05LRVkgYW5k
IENPTkZJR19QSU5DVFJMX0RBOTA2Mg0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2NvbmZpZ3Mv
ZGVmY29uZmlnDQo+ID4gKysrIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KPiA+IEBA
IC00NDIsNiArNDQyLDcgQEAgQ09ORklHX0lOUFVUX1RQUzY1MjE5X1BXUkJVVFRPTj1tDQo+ID4g
Q09ORklHX0lOUFVUX1BXTV9CRUVQRVI9bSAgQ09ORklHX0lOUFVUX1BXTV9WSUJSQT1tDQo+ID4g
Q09ORklHX0lOUFVUX1JLODA1X1BXUktFWT1tDQo+ID4gK0NPTkZJR19JTlBVVF9EQTkwNjNfT05L
RVk9bQ0KPiA+ICBDT05GSUdfSU5QVVRfSElTSV9QT1dFUktFWT15DQo+ID4gICMgQ09ORklHX1NF
UklPX1NFUlBPUlQgaXMgbm90IHNldA0KPiA+ICBDT05GSUdfU0VSSU9fQU1CQUtNST15DQo+ID4g
QEAgLTU1OSw2ICs1NjAsNyBAQCBDT05GSUdfU1BJX1RFR1JBMTE0PW0gIENPTkZJR19TUElfU1BJ
REVWPW0NCj4gPiBDT05GSUdfU1BNST15ICBDT05GSUdfU1BNSV9NVEtfUE1JRj1tDQo+ID4gK0NP
TkZJR19QSU5DVFJMX0RBOTA2Mj1tDQo+ID4gIENPTkZJR19QSU5DVFJMX01BWDc3NjIwPXkNCj4g
PiAgQ09ORklHX1BJTkNUUkxfUks4MDU9bQ0KPiA+ICBDT05GSUdfUElOQ1RSTF9TSU5HTEU9eQ0K
PiA+IEBAIC03MjQsNiArNzI2LDcgQEAgQ09ORklHX01GRF9BTFRFUkFfU1lTTUdSPXkgIENPTkZJ
R19NRkRfQkQ5NTcxTVdWPXkNCj4gPiBDT05GSUdfTUZEX0FYUDIwWF9JMkM9eSAgQ09ORklHX01G
RF9BWFAyMFhfUlNCPXkNCj4gPiArQ09ORklHX01GRF9EQTkwNjI9eQ0KPiANCj4gR2l2ZW4gYWxs
IG90aGVyIERBOTA2Mi1yZWxhdGVkIG9wdGlvbnMgYXJlIG1vZHVsYXIsIHNob3VsZG4ndCB0aGlz
IGJlDQo+IG1vZHVsYXIsIHRvbz8NCg0KT0ssIHdpbGwgbWFrZSB0aGlzIGFzIG1vZHVsYXIuDQoN
CkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgQ09ORklHX01GRF9FWFlOT1NfTFBBU1M9bQ0KPiA+
ICBDT05GSUdfTUZEX0hJNjQyMV9QTUlDPXkNCj4gPiAgQ09ORklHX01GRF9ISTY1NVhfUE1JQz15
DQo+ID4gQEAgLTExNjYsNiArMTE2OSw3IEBAIENPTkZJR19SVENfRFJWX1JWODgwMz1tICBDT05G
SUdfUlRDX0RSVl9TNU09eQ0KPiA+IENPTkZJR19SVENfRFJWX0RTMzIzMj15ICBDT05GSUdfUlRD
X0RSVl9QQ0YyMTI3PW0NCj4gPiArQ09ORklHX1JUQ19EUlZfREE5MDYzPW0NCj4gPiAgQ09ORklH
X1JUQ19EUlZfRUZJPXkNCj4gPiAgQ09ORklHX1JUQ19EUlZfQ1JPU19FQz15DQo+ID4gIENPTkZJ
R19SVENfRFJWX0ZTTF9GVE1fQUxBUk09bQ0KPiANCg==

