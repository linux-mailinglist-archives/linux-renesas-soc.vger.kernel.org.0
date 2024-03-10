Return-Path: <linux-renesas-soc+bounces-3660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC3877605
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 10:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090FE281C04
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Mar 2024 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA921E888;
	Sun, 10 Mar 2024 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="phqv6PD0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773311DDD6;
	Sun, 10 Mar 2024 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710064757; cv=fail; b=sULrW2YHIx4pQlC+1VuAuP6L5L8ZJS24DRfH9EfjY3CJLZTTgPzBdbhCzHyGH+6K2iRnIsIHdZoiINMXepcdXa6Sh01R5jKvUfAY/2OsFYSGKJcDYXe+4Hw14I0UsnGra54VqihAsWsNBZ9WKH21V2DhsyGxVykoKp974lHIQo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710064757; c=relaxed/simple;
	bh=7BTm6O1NDuHM8+z6cAiq2rtU36JD6tWL8npJtivWq/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mrtCn66GJXaqT9EMpEhrX7RI7499LA0j1zIlReycQI13ULuWH68/IsQoOXyXN+fSHBGwe6F6tZm3t3SGDdBzAasoq1KaqNe+fcwYc3QGA48RzdDyvhEQ7CfiIrN1BMpaviBvAjT61dr7hVFySLsrb6Y5pA3NNvFFvUEbfM3tN8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=phqv6PD0; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgzI9bcNwNyaRP4lJREq5uzVo5BnUCH5UGO1Cxlm1YiOnYYfJ7b6q+eHuON1AuT3cjqwjeGH7uMe2aLmjhtTDZv5Sh4wCJqCjhpk1cmmGFwI7/gDnJTveDLxRSSF/SvMfNjmdp5zhKKqfgOlfsxlJ0zCSO4v5d4s9NyO+3uO+0QkyDGmmDRJNGjVqgjAJNSUHccmJCV7HhKAnSXdQzgxEZM0BEoxDL0+jRpDq9so9+xJmXpLZDrbOsvXRwvziQEcdIpBGk/G1LH2Xroz+wcUtsQB262Hrm73TGohvKCQTG6JNLkFiiXX/oD6tk6dieMia7SPJXt9RmeOVMZls2VFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BTm6O1NDuHM8+z6cAiq2rtU36JD6tWL8npJtivWq/k=;
 b=lFYtXdsT3P2yD3mIMd3EdHndsnPmIPOPfZ//jCHyGIz7/BKIsKLNb/6v+iQ03D55Z0c9UoejtAKnXPh0dN0wUFEBjKlqde+fgdUdRZIibNo/U4WCr4WJXL0K9SqAdTkVHs6q1b3YtrEki1581G++OGfcdWlOG4MaTX3zKLGjnJfAfDjyiCN90goTk34UhNlVOturLxICOEx7jeJqpeVWFliGIh2Nx0CerKXxvQPqrfCHqG632P7UFVNO2+NvfHXTEIwzdgVE0uTuA/AwiF5CtyYr9REjQX+bGzH6TgP/MMBRvcqMmtCpqd2F9TWPfmNENrSUwyvX75G1DHp03hKrCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BTm6O1NDuHM8+z6cAiq2rtU36JD6tWL8npJtivWq/k=;
 b=phqv6PD0FgZg6E7rJNKTQhrBKXiajlVJI6e9N839EENwb37INtaXqPNjx0pBZMjZgOqa6/J2kluz6epayKm9Pn+MwDOZrUm1Xqu98mjIrYzqkvoBnvkcJ5ph01Ho+c3emzTsZog/fqZ6AEAjmgn27qOT9um2fOrHHr5r+A0D+k4=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYCPR01MB5999.jpnprd01.prod.outlook.com (2603:1096:400:4a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sun, 10 Mar
 2024 09:59:10 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sun, 10 Mar 2024
 09:59:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Index:
 AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyCAAAOtAIAAADSQgAAR4gCAACQ3AIAAATtQgAENy3CAAASEAIAAANOAgAAIfQCAABNnkA==
Date: Sun, 10 Mar 2024 09:59:10 +0000
Message-ID:
 <OSAPR01MB15877347CFDC7465AAF9D1CE86252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
 <OSAPR01MB1587C505F324B11824AB6AB286262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <OSAPR01MB158700437A1D57805BAF349686262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <OSAPR01MB158719BA384CA9E730D051F786252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ed77f6a1-70a5-455f-a6d5-34ebfa931279@linaro.org>
 <OSAPR01MB158788EC4F6CFD47406AB9FA86252@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <5d43aaa3-04ff-4936-a752-7bfb29204eec@linaro.org>
In-Reply-To: <5d43aaa3-04ff-4936-a752-7bfb29204eec@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYCPR01MB5999:EE_
x-ms-office365-filtering-correlation-id: 0d31d4d4-02a8-416a-05a9-08dc40e8bbbd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FQNKbVsvJHTKIzjM99rZlrYo+plzELcVTHPYwZtcHcyMzqc1kAC09HsyEVkVB4QmAnLPgi8llmAYVYF5HPbFB/X4Z2WCHGwsEluN6mziAJUWPQM43p5z8DhAy2zLyqx10VRf4SNv9JVm6QONQq74sTbcR9T+qOrUAcnIQpqp7g2SjH9WBo2vLDgcqpN1uRHWWmC4BIBk7McadZ8DyZmi2zidv4H5RX/n1HRE42JozlJbdZKkuoh87mqddvq6nmqHH11zBnQ5LnLh2KmZrYxSkATj/1nP4tjvOCLB0Gl4Tgr/o2CqRwZrVbBGZ8LXnKxfBveX5a5u8sOXYyBrIqu9zBkTTeUTxtA6KovN8i95Ngnz4gbIVnN/9RefQQOdB2X90PF4znq884QhQHtSn40eaR1mHJpaY8Vp4wMgE+Yb9434mSGx6pMe+uWlzyPJoosQWjNHHTD4gDOlMlipHwMF/0krVl1ejzO9ORPPXjQSBLBid+Leeia+cf7pfWXxB3tz77T16GDGyMZZk0mSvsYvSWQ3aKaCDlKK+v93bSHr5a4E6p9OYCsSaHzb296OZuBL6Qstsfj4YDr88oS61cm9hB2i/lSq0mUv8ZqVEKBS/o3CvtGJ9RPcgRcztDp/QIiYRc5gFaFKe24TCLjjcxca/TZdQUfoMXxr2V4ZOJXtQkWo/dK1Q8x+VDuO6nWfARaxqoOxkBWz1NjTL4PUdE3z3ncyKBq/DA0J6qwxwmsoi2U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aVBYNFYxNzdGZllZYjAwNG44YUVFeVo3TXpiN2haK3k5UlBNdmIvSHUrbk9t?=
 =?utf-8?B?dml1S2ZPZ2Y1ampLMlU2Z2x5VnFXMmtraFZyM2ViZ0JqUXN0TWc3dzRESDBW?=
 =?utf-8?B?aUdQdGxKN2Z6WDA3RTN0WmtKMzA3YjExbVFJYnorNnlEUUxHa3hRdEVtZ3c5?=
 =?utf-8?B?U3N1MXFmd0VaK2FEN3NNUGhISi9pNDlMVU8yS1h0bHZzZ05wM3Z5YVkrSEs2?=
 =?utf-8?B?bjZoSVRjS1JZcVBML0dFQ01adnFmN1ZCRFRRVVJMZUpRc1JlbGFMOEZpOGN1?=
 =?utf-8?B?d1VBWVNhN2FyekFJeURZS2NNQVNiYkhKczJDNWZtdUtPeEpOMkVXSDd4MXZE?=
 =?utf-8?B?MkpxL2tBdXZxT3RxM085U0tCVXlOVHNhWXdvMG9ubU1UbTY1VlZnK0F4ejIy?=
 =?utf-8?B?NHExeW5KYjVnRTZBTlg3K1hHa0VuWUQvSGNTS0kwbTNpV2hrNXBWRjJTWWJo?=
 =?utf-8?B?WVNhK2RucDRGZHA5dWRZcWZlZG9VTzQ4UUVGR3UxczdMdms2SGVvNEp1ZUNG?=
 =?utf-8?B?WVplYVhzeHQwOGllVHd0Sm9QV0JvRk1tZmdGUnVCZ3Z5UjVXeUN6eUhFeFdi?=
 =?utf-8?B?cHVvbW1FaWdpZlZvYzRYS1dZZU5yN3NLMVZrN3BZWjJIQVhCaHgyODVQbHMr?=
 =?utf-8?B?ZnJrYXU2WFJvaG54UmEvVGJ2c3dzUDRQblEvSUNKZlFWaFlwNm95VGhSeHZR?=
 =?utf-8?B?cytXMXA1c2ptbXpQbmtXZlBEY1JSb1JVTkdldUpIVnhURzB6NWpTVCsxSkFY?=
 =?utf-8?B?VEJRZzF4a0hsNDd6Rmt6R0F3ZE5uTjhSL29DTEhRMno5UFRQa3FDZ2c3R1Jp?=
 =?utf-8?B?N2dVWDlLZFluQWUzTzN5Z2tkekVtbmxibHRONmwyeWwyRWlKTFlYOXJ6Tnpr?=
 =?utf-8?B?T2YvVDdLVDlpdHVRZVpLQm1JbVJ5QUhGQ1gvUTJIZjQ1aStMRks1M0JhamlP?=
 =?utf-8?B?QXFwQWJ3alFiTm9STHdUTnQzdTUrcGJRSVBQTytOU2ZRQzdyZHBMUGl5MnJ5?=
 =?utf-8?B?dGNTNHYxbGM2Ym12UDJUcUZiVU1xWmxmSFpSY3N2VWtQemNpRHlSM1FWV2VF?=
 =?utf-8?B?c3RwbisvVnVyMzVqN0NrNzhkNHJYQS9BbWRjUjBsaGdCalRidzV3MjEvN29T?=
 =?utf-8?B?djhnY1hhYmE1Tll6ZkJHaGF2NStOaU1sbm55a1o2SG1rd1RiS2t3RStWa0Vt?=
 =?utf-8?B?TnlYbkkwRDVkdGZXS1F1Y3BEY3U1M1RTVVYyNG5TZkRCMWNtNXBGaHBHdWU2?=
 =?utf-8?B?NUVLWlFsdmRuaHM2ZFhkV3FFK2lINWFLZzNDdHBrQUFEQ0VJZHJNUFZXb1VG?=
 =?utf-8?B?RXh0SjJnWll3b0xET0tUa0tQU2hxak9ZNjVQblFYQndEQTdINUNTbXU1ek55?=
 =?utf-8?B?b3JtNmVxNVlLajdZdTMzL2VzVUx1a0RqWTJFTDlJRFFTbVpCU3FpdlV1MTFQ?=
 =?utf-8?B?bnR6dFF3aFMxYzRmNWtuNnJ4MzIxNnhYYVpwK2YvU1F6NFcyMFRhRnd3UmYy?=
 =?utf-8?B?bFpsbHRTbndRUktrRGdhRHdnay8vVWd6Rmkzc2hlcmxxM1ZzdlY5dHcyMVhK?=
 =?utf-8?B?b0JDS2x4TGRaRTdMNjYzNEY4TW1BRXF4L3hlcHBxQ2xhdzErbDNaRHRvMW94?=
 =?utf-8?B?MmwxTUNGQ1hCamUwK3dFYlVTZzY2SlFKbUVwSEhCNmI4OUxINVhmNXJQNktU?=
 =?utf-8?B?eXFydjBDTUdQK0cyRkNxRWVSK1ZlTnIwN05CS2lMZEh0OTFoRldxZGhrMWF1?=
 =?utf-8?B?N1k4d3V0UkRtQ2pFdVU4TVFKWmd1Z2xsbUZUd2FFMGF5OFZqUkh1clpyS3c0?=
 =?utf-8?B?NExMaG1rYVN4YVRLNTNXLzg3ZUlrL2Z3bGU2THEwd3lKVTFkdkVYUVBRc2Fx?=
 =?utf-8?B?UkJiMW1Ic2IxU1Y3TDFVYVRmUTU5c08vc3pwMm1NYXpKY0VLd25lT1lEZjNS?=
 =?utf-8?B?WVFsSnhPa2xjTGQ4QkNRWDJHY0JYUjNFdSs1WVVHK1A4SFlJaG9McjJHSFJC?=
 =?utf-8?B?QnNtbGhsSGo3blphc1RxL1pmRGk5QUQxd0FYd3ZnRnB3YTF1OVhZUkZyd0hZ?=
 =?utf-8?B?OXp6cUpDYjZyaUhFRDNCbWZCQnBGZGltQWZpdkhIWURxRGpnQkVjZ2lmaUU0?=
 =?utf-8?B?UjdKaGRQVFhkSytsc25CbFFpWFQwYitIN01may9BYS9xS3dEVWtrT2p2Mk50?=
 =?utf-8?B?bWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d31d4d4-02a8-416a-05a9-08dc40e8bbbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2024 09:59:10.5980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ms7CvMvSd1kyAccGp+KU8O2sX3mBx6YI1nGhKJpWQM4r/nM/8Qj2tBPpCgDwAqSzkvdAdWCVIjrWFPjvo2OIjE3HFWZKvCoRpP3L5zbmEfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5999

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFN1bmRheSwgTWFyY2ggMTAsIDIwMjQgODo0MCBBTQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDQvNF0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDdnMHs0Myw0NCw1NH06IFVw
ZGF0ZSB1c2JocyBmYW1pbHkgY29tcGF0aWJsZQ0KPiANCj4gT24gMTAvMDMvMjAyNCAwOToxNiwg
QmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCj4gPg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IFN1bmRheSwgTWFy
Y2ggMTAsIDIwMjQgODowNiBBTQ0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDdnMHs0Myw0NCw1NH06DQo+ID4+IFVwZGF0ZSB1c2JocyBmYW1p
bHkgY29tcGF0aWJsZQ0KPiA+Pg0KPiA+PiBPbiAxMC8wMy8yMDI0IDA4OjU3LCBCaWp1IERhcyB3
cm90ZToNCj4gPj4+Pj4+PiBvbGQgRFRCICsgb2xkIGtlcm5lbCB3aWxsIGhhdmUgMTYgcGlwZSBi
dWZmZXJzIG9sZCBEVEIgKyBuZXdlcg0KPiA+Pj4+Pj4+IGtlcm5lbCB3aWxsIGhhdmUgOSBwaXBl
IGJ1ZmZlcnMuDQo+ID4+Pj4+Pj4gTmV3IERUQiArIG5ldyBrZXJuZWwgd2lsbCBoYXZlIDkgcGlw
ZSBidWZmZXIuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gWW91IG1pc3NlZCBuZXcgRFRCIGFuZCBvbGQg
a2VybmVsLiBUaGlzIGJyZWFrcyBhbGwgdXNlcnMgb2YgRFRTLg0KPiA+Pj4+Pj4gVGhhdCdzIHRo
ZSBlbnRpcmUgcG9pbnQgb2YgeW91ciBicm9rZW4gZ2VuZXJpYyBjb21wYXRpYmxlcyB3aGljaCB5
b3UgZGlkIG5vdCBhZGRyZXNzLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBBcyBwZXIgbXkga25vd2xlZGdl
LCB0aGVyZSBpcyBubyB1c2VyIGluIFJaL0cyTCBpcyB1c2luZyBuZXcgRFRCIGFuZCBvbGQga2Vy
bmVsLg0KPiA+Pj4+PiBTbywgaXQgaXMgc2FmZS4NCj4gPj4+Pg0KPiA+Pj4+IElmIHRoZXJlIGlz
IGEgdXNlciBmb3Igc3VjaCBjaGFuZ2UsIHdlIGNvdWxkIHVzZQ0KPiA+Pj4+DQo+ID4+Pj4gCWNv
bXBhdGlibGUgPSAicmVuZXNhcyx1c2Jocy1yOWEwN2cwNDMiLA0KPiA+Pj4+IAkgICAgICAgICAg
ICAgInJlbmVzYXMscnpnMmwtdXNiaHMiLA0KPiA+Pj4+IAkJCSAicmVuZXNhcyxyemEyLXVzYmhz
IjsNCj4gPj4+Pg0KPiA+Pj4+IE9yDQo+ID4+Pj4NCj4gPj4+PiAJY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHVzYmhzLXI5YTA3ZzA0MyIsDQo+ID4+Pj4gCQkJICJyZW5lc2FzLHJ6YTItdXNiaHMiOw0K
PiA+Pj4+DQo+ID4+Pj4NCj4gPj4+PiBUaGUgZm9ybWVyIGNvbnN1bWVzIGxlc3MgbWVtb3J5IGNv
bXBhcmVkIHRvIHRoZSBsYXRlci4NCj4gPj4+Pg0KPiA+Pj4+IEFzIGxhdGVyIHJlcXVpcmVzLCAz
IHBsYXRmb3JtIHN0cnVjdHVyZXMgZm9yIHJ6L2cybCwgcnovdjJsIGFuZA0KPiA+Pj4+IHJ6L2d1
bCB3aGVyZWFzIHRoZSBmb3JtZXIgcmVxdWlyZXMganVzdCAxLg0KPiA+Pj4NCj4gPj4+IEFub3Ro
ZXIgd2F5IGlzIHVzaW5nIFJaL0cyTCBTb0MgZmFsbGJhY2sgY29tcGF0aWJsZSBmb3IgYm90aCBS
Wi9WMkwNCj4gPj4+IGFuZCBSWi9GaXZlIHZhcmllbnRzDQo+ID4+Pg0KPiA+Pj4gCWNvbXBhdGli
bGUgPSAicmVuZXNhcyx1c2Jocy1yOWEwN2cwNDMiLA0KPiA+Pj4gCSAgICAgICAgICAgICAicmVu
ZXNhcywgdXNiaHMtcjlhMDdnMDQ0IiwNCj4gPj4NCj4gPj4gSG93IGRvZXMgaXQgc29sdmUgYW55
dGhpbmc/IE5vdGhpbmcgYmluZHMgdG8gdGhpcy4NCj4gPg0KPiA+IFRoaXMgd2lsbCBzb2x2ZSBh
bGwgdGhlIGlzc3Vlcy4NCj4gDQo+IFRoYXQncyBub3QgcmVhbGx5IHRoZSBhbnN3ZXIsIGJ1dCBJ
IHNlZSB5b3UgcGxhbiB0byBrZWVwIG9sZCBmYWxsYmFjay4NCg0KWWVzLCBUbyBhdm9pZCB0aGUg
QUJJIGJyZWFrYWdlIGFzIHBlciB0aGUgdXNlIGNhc2UgeW91IG1lbnRpb25lZCBmb3IgbmV3IGR0
YiArIG9sZCBrZXJuZWwNCg0KPiBTbyB0aGlzIG1lYW5zIG9sZCBmYWxsYmFjayBpcyBjb3JyZWN0
IGFuZCBlbnRpcmUgcGF0Y2hzZXQgZG9lcyBub3QgbWFrZSBzZW5zZS4NCj4gDQo+IFRoaXMgaXMg
Y29uZnVzaW5nLg0KDQpJIG5lZWQgdG8gY29ycmVjdCB0aGUgYmluZGluZy9kcml2ZXIgY29kZSBh
cyBwZXIgdGhlIGJlbG93IGZvciBhdm9pZGluZyBhbGwgcG9zc2libGUgQUJJIGJyZWFrYWdlDQph
bmQgYXQgdGhlIHNhbWUgdGltZSBvcHRpbWl6ZSB0aGUgbWVtb3J5IHVzYWdlIGluIGRyaXZlciBh
cyBhbGwocjlhMDdnMHs0Myw0NCw1NH0gYmVsb25nDQp0byB0aGUgc2FtZSBSWi9HMkwgZmFtaWx5
IFNvQ3MuDQoNCg0KCWNvbXBhdGlibGUgPSAicmVuZXNhcyx1c2Jocy1yOWEwN2cwNDMiLA0KCSAg
ICAgICAgICAgICAicmVuZXNhcyx1c2Jocy1yOWEwN2cwNDQiLA0KCQkJICJyZW5lc2FzLHJ6YTIt
dXNiaHMiOw0KDQpPcg0KDQoJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHVzYmhzLXI5YTA3ZzA0MyIs
DQoJICAgICAgICAgICAgICJyZW5lc2FzLHJ6ZzJsLXVzYmhzIiwNCgkJCSAicmVuZXNhcyxyemEy
LXVzYmhzIjsNCg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KDQo=

