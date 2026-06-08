Return-Path: <linux-renesas-soc+bounces-33668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nrpJI3nJJmoykgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:54:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4C3656D27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:54:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=UCnExznd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E739301A33B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6E23BF68D;
	Mon,  8 Jun 2026 13:53:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E93BB9ED;
	Mon,  8 Jun 2026 13:53:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926830; cv=fail; b=Sr3qgSfPfVDPEm1eb+16fWpusCNdXtsJpyZQT6gRyECpQ6cpphTBdrWtedI6vs+/wmn5lvbumaoJ4Dvn3ltMgM2L+z+uGMhrl5DFIQ2UxJzy24KyB3Mcf29PtPPSSLhifkCaa6HW4TkGk+lGtcexuA+SSfjbA0ThhihS4+R9bFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926830; c=relaxed/simple;
	bh=oRcJPwa5pmj9hOMhodg+S83jfxUcgfZKe6vsnD3fcwo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yv4OJCn5B8VfaCF0vb7yHv3ok44KJsJYPOBjYl2pfmLnZYnep6WewlOAWy3rddlDygowk28uTC0zNitIZuXHRGdlGI5KEqp0WG+t1ebN3i5hMp3DVssI+boFFkN+g7TJfBWFuOZ1aCkf9Y3DO/kS4AuPuMqquEEjxuao+a0hEPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UCnExznd; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhlctUwKwM82QlUU6nRSFM//xaydiItgzVV4u1oz2qmA8PzGx2O6lgnwQpeWL000Fne7lz87f7V+ykg/pjiquGxhYoqSAqTLhC0gmvLbeTcVFO6ql65QgllwrUsgNhIT9I4wgxRf7A7cvCWGrBrbM6or2PE29MV3xez6zJ4N1Sg9H1gWtQWGXlkHnjfXnt23QuXbxgJLag99AJwBjg/Z3hsNIdVBjG20NqP80P86n0vmw4961W4iEhngPjBi5FPykLhiW3eBpTEva8XXQRdTd5553no/u6lOm99mYUDEWBGPslWK4DtTo5UEJAP1hd/CbO09jJ+GoUvDH5r64ixXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRcJPwa5pmj9hOMhodg+S83jfxUcgfZKe6vsnD3fcwo=;
 b=BQcp7/a8hUHcXOA12iBNQgpspFp9m5ieqZyq7W7T73dQJp17Uk0/w620dgOMOR/6x0JF1+JLhfKPTyqM/+vo6JEIhNLMODtn2BkjZgtUkFzWx+z5VxzwCRfH+BwaI82hTadRZ0ah5jfL41LtU8g/cS+zpqNvAsdwlEyYhhQGZ7OyAwLDNc0Fbvaqxz2h3pXhG3648ECXJDp7EpXvBmYyAZ8ZMBq/+jaf3Yk4Vnp3HGmTXvjxQIQnBXP0w/O6d2ir8JwBEIRLO5BRCbGKyC5+ne9OrCA4BG1jxTrpl78NMK5Ydo5Fsun70PZswnUche7mwLqkPhbe1GXoeY9GVzlU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRcJPwa5pmj9hOMhodg+S83jfxUcgfZKe6vsnD3fcwo=;
 b=UCnExzndkdjz0ZQ0sECcGCK4EYph3oWZlaQXrHZ1rTUtH8ABk0mRkW5cS6C8vIMnYfzHV1nKFFbO0nYDosG6fIiFI1a6p/aKw0PDOr5rg5dPj0zKiEugswahRaGsBAoE/hY+r/LJ+wAW0KjJT/zcMGHP0eh86fC830McKsxMt+M=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10629.jpnprd01.prod.outlook.com (2603:1096:400:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 13:53:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 13:53:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Index: AQHc9z2t0rzHysclGU226VvULbQLWLY0jbuggAAD0ACAAACVgIAAApEAgAAID7A=
Date: Mon, 8 Jun 2026 13:53:41 +0000
Message-ID:
 <TY3PR01MB113466F579F4093217DAA6B70861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
 <TY3PR01MB113460B7F122E23FAC4D35502861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c4ae68b7-d423-4714-8415-679671467ac5@kernel.org>
 <TY3PR01MB113461D43EFBA56BAE7C8F403861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5f1b0d7d-3105-4371-a603-7e7bacd5f112@kernel.org>
In-Reply-To: <5f1b0d7d-3105-4371-a603-7e7bacd5f112@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10629:EE_
x-ms-office365-filtering-correlation-id: 41d1e6a8-3f18-48c0-77af-08dec565595f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|5023799004|11063799006|4143699003|3023799007|56012099006|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 0QDOYgSYhHrVWBCJUPX+8obz71WU3RkhDHF5Btydq36a6V132hBPJ6Q8l9dsQLoLIF0UeB4EsPnbuga0DLx//50MT1t+jvMNOlI9dfIIz66tXZoxzSshcFhhesQOcRtRqVHnctmunJsa50yA9rER1bUYDkAmZeUSLlSkCyxqRNgnOMY2FvEamcIf5St+5z+kGOYAcEf1HIGykQnBO2jYTTF0jaSMPKEGowGiAwddxz65ybMPNeRzDKox471aCVoNN5jwgsiE7rBuFtZVwBEBwKJUVfZ4LXk8dX/pnfExG2g35YYUW9cJ++SBta1CoWYRYXyLSnLe5wSewu5ajZJ0o9s8WfvOKcLCGl5kLZHn4JMqLQZ5SesgnLsH9njoNDsASkVB/ak+tcDtQhh2AO++U36e55JF6t+XFe1zZxai4zm7epDNZ2zuXqqe0tns/rKTYw4aKJMCFXKPCicAJLBV+SPOCHvnH+gbYxvTQNGVIX4hqKzm5V/3J7NMJAmuK2ym9WS77A34aRHplI0HeXdLUIqX4FFlWQBZeM/xX91i+ptgzLFooxrp4y4E+kv3R1yRQ5+U6Z1ETlxh3AH259fqAz+D2Q0Nd9SNu6h7RLNi2idxRGF6KloCOr8Bs4R6mXLAWx0FSI/NFSGpWwy2ocu4AVtulj0cTsgMtnsJdtDvoI6JwDwK49Otuc1obdSzkajYo5Ls6e8nkPGWuz3NDi6kpAJZUQq5+jTQVTn5PAt7bwWq9w2XYTj2/ZNkWF5UGAmwJDHeuvFM1s6Ks6kJVA1xXA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(5023799004)(11063799006)(4143699003)(3023799007)(56012099006)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHdjdi9ya21mNEFlQ2NhbnU4RlRJVURlK2tOWFJ5U3hRQUIydldjZjROUHIw?=
 =?utf-8?B?eUxsVzc2Rm1tV0Z3cEtCaWViaW1xWmUwRDMvU29BcmpZM0E1ZWFYWDJwM08x?=
 =?utf-8?B?UHdGRDZGbVUvck82RThubzhMaEY1SmprUkhwNWRPS2lZWkNoeG5NNjhlOXlu?=
 =?utf-8?B?bjREN1dTYXo5U1FLUVZreDFmNXRvME92MGJQcnFwY0dTdEVQTE8yRHhaMTd2?=
 =?utf-8?B?NDlkTzQrNGVqek5raHhkVERWQ3RGejNRZUEzd1FaUGdra0hHNFdtcjB5WTVQ?=
 =?utf-8?B?UVVCTTZzRTZ0eXZWZDFBNXU1b01XNE9oaDR6S0NhZzNVa21lUWUvQ1hJRjlZ?=
 =?utf-8?B?S3JQMTJWNW1jd1RJazJ3bElHaE01TDljaGFOV2JOZ0ptTTJwUjVEZGhiZGZ1?=
 =?utf-8?B?aDlxSlRjRjNHcjZpVFdIV2ptSkpqR21KMm5mSzZpUTVpRklpVVZDZFhGUDBY?=
 =?utf-8?B?OEtPRVY3TmpubDJQUXRRVXBPSk1LdHhpd3E0dzh4M1Q0bkd0SW5LTU5HY1pi?=
 =?utf-8?B?UDJ5RXNRbzVRTUhZVGNjOVVNZm8xcGE5a2ZvRjVQRkZXWHJJUmplU1BlV0Zm?=
 =?utf-8?B?UXU3S2M3L2tsdnB3aDhHY3VvZ2R5ZWUzajRUSmNEK2Z3SDlETHV3MWREdEx6?=
 =?utf-8?B?SjRBbEJOcXVGdkNNRWlCaG40akR6eks5QnZmc1ZxOGJmS1VSampYdk1zaXhY?=
 =?utf-8?B?RzhyeEJTYzhicERCeGlWWjk3MUVPWFNOUE51MFdCK0NyMGFNQm84TWtEbWNw?=
 =?utf-8?B?SnlSRWNrcGxaSU9KRlFjOC84NEw5Ly9sK295ZDdjb21Oc2hxb3lyYkc5U2li?=
 =?utf-8?B?R3hNNG1OYmxmdnduc2R3aGsySGhNeWI4ZWs5WDhBRDJyODViZ2dZN0FMc2VI?=
 =?utf-8?B?N0xldTRZZ1YvZ0s4UkZvaG9vY3k0ZWtkZ00zcVpyeHYwMVN2TmdqMWY3N2FD?=
 =?utf-8?B?MUlMM3FxODBabVZObHhkWUh2UzhBRHJ4R3gvazdTY3BLWXRqTjQweUdXcVR4?=
 =?utf-8?B?SWk5dnN6bk9TUC9wOHhURzA5SC8xcVo2TDVsZFdUSS9QS2J2L05OWC9CMzVy?=
 =?utf-8?B?MmZWQWJYWjhOdzFNYnR4VjkySkZ0QnBVV1hMelJVaUxpdUJTZzNsbEpaekZI?=
 =?utf-8?B?STA4UFFOc20wem9lbFJla2FFbTlGaWJzT202cnAvYmJtVktUbG9MSG5qbk10?=
 =?utf-8?B?Zk9ZeU9lcDNmbUJKODhuUXM0NUtKamlyOG03b3hQNjZYalZrRjJDWTg0UDdC?=
 =?utf-8?B?RGE1emRnQURaeTdCQWpvV0tBck55M09ib0dUdm9VZ3FrU1BHaXFmSEZUVUd1?=
 =?utf-8?B?b2QwVHg4QzdkQzBOblgvQ2pzTU43SURydXIzSXdTcGRlR0NJcndUUE1lK1dQ?=
 =?utf-8?B?MUNLQzBZTTJ2NzhBeVZ0c2tzemhBc1lZNWJzZDh0bG1qVG4wWUgwU2lUbEpI?=
 =?utf-8?B?YjY0UW1iSW5yNkNWWWl3QkptT3JPNmhzMjVLeXdPK2pydUV4V3ZtSFhGdUg3?=
 =?utf-8?B?dm1xeTFmVVhWTGQrZVZvUFNQb01sbEF4TnZDalRuVHp0N2FOTEFvNlExbERx?=
 =?utf-8?B?TTBvMy81a216WXZnSDdsb1FoV3ZsU0QveVlUY1I2UlNnMzBab2hiTndKRksy?=
 =?utf-8?B?MDZEZThHVTdINVkydkM4QTZQM3dxZEpOTFByYmdIK1NRWFA2dDMrZkdhK05s?=
 =?utf-8?B?YTBWdHIyWEZLYUxFZkNCcm5GL1dXd3lDeUxZZktQT2U3bmdldGJHbk9rb0Iw?=
 =?utf-8?B?cVg0Vlpzclk2OEpxMURHaGpHbWtmVllHb3JleW5ac3lNZGJkbDJ1dEQ4M3dQ?=
 =?utf-8?B?S1M3RFRNNmFwV1p0TFhTUEsvajM3NDFBS0R6SEtvSktUS1NvSlVVbG9sQ1Nu?=
 =?utf-8?B?NTYremV6bnNlRko1S2V4K1Q0V2tLeWVFNno5SUs4TFdnZ1VydHh0VDgwTjFW?=
 =?utf-8?B?SzIzM012ekNRS2tFR1FtcEpZMXFNL0ZMbjZXUVo5K1IwNGlNWEZlMmxyNHhI?=
 =?utf-8?B?Q2lpQ2NkSG5oOXdEOS83U1RGek5LNi9EcERrMkI5WlpyMTlvQURkT2tkc1Y5?=
 =?utf-8?B?L0xhbURiSW8wTG5RT1UzTHcvdzczYXU2OEhvajFLNi9pcE04cHB5TlVTdFdH?=
 =?utf-8?B?NUhNd3NRMHN1d2ZtU0kybGFMWHl3ZmRxWmdSa0Q0eSthd1hteXZZMkVWajkv?=
 =?utf-8?B?cFFMN29ESVBJTmpHZzNFTm5HbW5rekY0R2xVQnZhcHFjZDIxUE1kSERiemxu?=
 =?utf-8?B?alB5TnZMbTRxNVc5ZjZ0VG5URklzdlJhZ2hYR1YyNFFmckRyMWM3eWtZZU53?=
 =?utf-8?B?T2hqYWJXSGZLdUQ3WTF3elVUZFhhVjlpY0hhQUdwWkRTRFJOdE4rZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d1e6a8-3f18-48c0-77af-08dec565595f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 13:53:41.4620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrXrnzCrGMXFgV/XgC0Uv0AsQu3DyngYpfTdLt5fxL0rOoX7vsjmTdsfUmkY3+4z+hiQPBddwDz0qtMeKvfGpTo3nyX/DQLHyt5VKoIfMoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10629
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33668-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D4C3656D27

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxMzoyMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IFJldmVydCByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiANCj4gT24gMDgv
MDYvMjAyNiAxNDoxNSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mIEtvemxvd3Nr
aSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IDA4IEp1bmUgMjAy
NiAxMzoxMg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZkOiBzeXNj
b246IFJldmVydA0KPiA+PiByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiA+Pg0KPiA+PiBP
biAwOC8wNi8yMDI2IDEzOjU5LCBCaWp1IERhcyB3cm90ZToNCj4gPj4+IEhpIEtyenlzenRvZiBL
b3psb3dza2ksDQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
Pj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVh
bGNvbW0uY29tPg0KPiA+Pj4+IFNlbnQ6IDA4IEp1bmUgMjAyNiAxMjo1NQ0KPiA+Pj4+IFN1Ympl
Y3Q6IFtQQVRDSF0gZHQtYmluZGluZ3M6IG1mZDogc3lzY29uOiBSZXZlcnQNCj4gPj4+PiByZW5l
c2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiA+Pj4+DQo+ID4+Pj4gUmV2ZXJ0IGNvbW1pdCA1MTI4
NGQ4YjFkYmMgKCJkdC1iaW5kaW5nczogbWZkOiBzeXNjb246IERvY3VtZW50IHRoZQ0KPiA+Pj4+
IExWRFNfQ01OIHN5c2NvbiBmb3IgdGhlIFJaL0czTCIpIGJlY2F1c2UgaXQgaXMgY29tcGxldGVs
eSBub3QNCj4gPj4+PiBtYXRjaGluZyByZWFsaXR5IGFuZCBjbGVhcmx5IGluY29ycmVjdCBpbiBy
ZXNwZWN0IG9mIHJlbmVzYXMscjlhMDhnMDQ2LSBsdmRzLWNtbi4NCj4gPj4+Pg0KPiA+Pj4+IEl0
IHdhc24ndCBldmVyIGJ1aWxkLXRlc3RlZCBieSBhdXRob3Igb24gdGhlaXIgRFRTLCBlaXRoZXIu
DQo+ID4+Pg0KPiA+Pj4gWW91IGFyZSB3cm9uZyBoZXJlLg0KPiA+Pj4NCj4gPj4+IEl0IGlzIHRl
c3RlZCB3aXRoIGJlbG93IERUUywNCj4gPj4NCj4gPj4gU3VyZSwgSSBiZWxpZXZlIHlvdS4gQmlu
ZGluZyBpcyBzdGlsbCBvYnZpb3VzbHkgd3JvbmcgYW5kIGRvZXMgbm90IG1hdGNoIHRoZSBEVFMg
YXQgYWxsLg0KPiA+DQo+ID4gWW91IGFyZSBub3QgYWN0dWFsbHkgcG9pbnRpbmcgdG8gdGhlIG1p
c3Rha2UgaW4gdGhlIGJpbmRpbmdzLiBJdCBpcyByZXZpZXdlZCBieSBDb25vci4NCj4gDQo+IEkg
ZGVzY3JpYmVkIGl0IHZlcnkgY2xlYXIgaW4gdGhlIHBhcnQgb2YgdGhlIG1zZyBZT1UgUkVNT1ZF
RC4NCj4gDQo+IERvZXMgbm90IG1hdHRlciBpZiBpdCB3YXMgcmV2aWV3ZWQgYnkgQ29ub3IuIFRo
ZSBwYXRjaCBsb29rZWQgY29ycmVjdCBmb3Igb3VyIGV5ZXMgd2hlbiBsb29raW5nIEFMT05FDQo+
IGF0IHRoaXMgcGF0Y2gsIEkgYWxzbyB3b3VsZCBub3Qgc3BvdCB0aGUgaXNzdWUuIFlvdSBhcyB0
aGUgYXV0aG9yIGhhdmUgdGhlIGNvbXBsZXRlIHBpY3R1cmUgYW5kIHlvdQ0KPiBzaG91bGQgc2Vl
IHRoYXQgaXQgaXMgY29tcGxldGVseSBib2d1cyBjb21iaW5hdGlvbiBvZiBjb21wYXRpYmxlcy4N
Cg0KSSBtaXNzZWQgYWRkaW5nIHI5YTA4ZzA0Ni1sdmRzLWNtbiBpbiB0aGUgdG9wIGJsb2NrLCB3
aGljaCBza2lwcGVkIHRoZSBEVCBiaW5kaW5nIGNoZWNrcy4NCg0KTm93IEkgZ2V0dGluZyB0aGUg
YmVsb3cgd2FybmluZ3MsIGFmdGVyIGFkZGluZyB0aGUgY29tcGF0aWJsZSB0byBzZWxlY3QgYmxv
Y2suDQoNCi9ob21lL2JpanUvc2hhcmUvbGludXgtd29yay9saW51eC9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3JlbmVzYXMvcjlhMDhnMDQ2bDQ4LXNtYXJjLmR0YjogbHZkcy1jbW5AMTA4YTAwMDAgKHJl
bmVzYXMscjlhMDhnMDQ2LWx2ZHMtY21uKTogY29tcGF0aWJsZTogJ29uZU9mJyBjb25kaXRpb25h
bCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOg0KCVsncmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1j
bW4nLCAnc2ltcGxlLW1mZCcsICdzeXNjb24nXSBpcyB0b28gbG9uZw0KDQpGb3IgeW91ciBwYXRj
aCwNCg0KQWNrZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCg0K
U28gZ29pbmcgZm9yd2FyZCwgSSB3aWxsIGNyZWF0ZSBbMV0gd2l0aCB0aGUgYmVsb3cgY29tcGF0
aWJsZSBhbmQgcHJvcGVydGllcy4NCg0KWzFdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvcmVuZXNhcyxyOWEwOGcwNDYtbHZkcy1jbW4ueWFtbA0KDQogIGNvbXBhdGlibGU6
DQogICAgaXRlbXM6DQogICAgICAtIGVudW06DQogICAgICAgICAgLSByZW5lc2FzLHI5YTA4ZzA0
Ni1sdmRzLWNtbg0KICAgICAgLSBjb25zdDogc2ltcGxlLW1mZA0KICAgICAgLSBjb25zdDogc3lz
Y29uDQoNCiAgcmVnOg0KICAgIG1heEl0ZW1zOiAxDQoNCiAgIiNhZGRyZXNzLWNlbGxzIjogdHJ1
ZQ0KDQogICIjc2l6ZS1jZWxscyI6IHRydWUNCg0KICByYW5nZXM6IHRydWUNCg0KcGF0dGVyblBy
b3BlcnRpZXM6DQogICJebHZkc0BbMC05YS1mXSskIjoNCiAgICAkcmVmOiAvc2NoZW1hcy9kaXNw
bGF5L2JyaWRnZS9yZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLnlhbWwjDQoNCnJlcXVpcmVkOg0KICAt
IGNvbXBhdGlibGUNCiAgLSByZWcNCg0KDQpDaGVlcnMsDQpCaWp1DQo=

