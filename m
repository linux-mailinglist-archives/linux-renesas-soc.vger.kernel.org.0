Return-Path: <linux-renesas-soc+bounces-34386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B9CLKvGnO2qYawgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:48:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6D6BD0D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 11:48:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=FkBJfYUR;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9171300DE1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 09:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2A43AFD0A;
	Wed, 24 Jun 2026 09:46:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0D25BF13;
	Wed, 24 Jun 2026 09:46:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294396; cv=fail; b=jaAsu+czBvMLeHAbB78Gw5yY9eExOQ7m2Eghtwdk01+oCjQDPaf0QqdjmbtcTHSewb6GROUZBKowU53q3Rzx0jMkxJJXY8zhMfcMKsqwyNq7Qg+Xj2E23fbHL1KCSiRs04pjJCoUmHcEgvv2+UGVT6RRSBLqGNybdfG7odrhOOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294396; c=relaxed/simple;
	bh=a0m03QrGxi2XDhb7OpG8GSu3OauHrjEkk5d+r/WXpQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=anOzEmQt7oVmNb2+HOONHSuhh3XCCEg4qIOie7BSUGvbCuTE9BRagxY133cCjOT0TFn1q8tvfnYx/gS07GQ4DVBOYxfnRvWmQDE5sqjMMSOoGyTRQ8mz8sY3ltPNTwbB5o5sch/AaqtBpsCbZ12GsreBTjjItXUbHUpNb7YoXjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FkBJfYUR; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZAcS/rFS+Gdur+QYnMre7BCUtTudZ9aSdy0rrFJo0Sbygj/KVD0u1OYDMTLx/fxvlKQcxd2neGP7i3r/ndMNknnGtcf+fwqbbCxlBUC9uFhlKmxKgCc0i6X0CNTQFwpe3qVCNd4rGYZvgXoghbZ6JOCc5cBI4uW56FsYQeu+cEGyRYJiOZFn7er9UYjUewkP2FpOPrI5xfJidieJkJQ8kWijcJocuPb//lUMbCly1o8EnSBjuAPrx3tpPtWto4QYvPrBdLeLaDiZBr2OmwuYwMxv4i56Mf2U+r8eHhTy6NniYu1cVO62VMoik3zuCsy7Y5Bz9QQBbRMm/mefWvZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0m03QrGxi2XDhb7OpG8GSu3OauHrjEkk5d+r/WXpQA=;
 b=W8oYxtkCqAIiiQbgPDFIauJlTOq7ZXaMP77ky2cw3s+Ud/+krc+DPoAltZpeAX3HjvFkCgjQeZhbbxgiEbtpUoWfukSs/lN+oqv4jzKV//G3BhaU5r7oAgJ8UrmldMNrP9tRRc1+BjsNkHOb9XIo21uMAJ+/3DvhjmsSytDL3KuXu9PePm71mTmtyZMkrDfCAi3hsWpGkh3MyirvdP9t4NQOKYprC5j2/PfvpHMGz7MmiZl2yCacLuWL6FFSVU7CajZbLa8F8ScHjNbTAGtEJoUnf1jY5gSdsFS21IrzqheFvPbwkLSjCYN5L0q4e1WkeBbGOJJG+kI9m7kxuAJjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0m03QrGxi2XDhb7OpG8GSu3OauHrjEkk5d+r/WXpQA=;
 b=FkBJfYURT2n6FWgPUnd4ZsaerPXYi7VhRQ3UW9hB/tLGiLdsz1na2mzSXibeieu7P7ZIdfYaiSE7vrWsDFMPmRTnuU0D3UePB52DXBFvyfQaKHhpDTegcRsC/1IwQ2Z3Rk9N669nEypm7uLLVsrkxQ2AHOhgWBfuJGWRZsHVRb4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB13773.jpnprd01.prod.outlook.com (2603:1096:604:368::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 09:46:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 09:46:26 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Alex Helms
	<alexander.helms.jy@renesas.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Brian Masney
	<bmasney@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Thread-Topic: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Thread-Index: AQHdAyw/4ueLfPD53keQC6SpXGUnQbZNdPEAgAABB+A=
Date: Wed, 24 Jun 2026 09:46:26 +0000
Message-ID:
 <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll>
In-Reply-To: <20260624-advanced-pink-dinosaur-ebe720@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB13773:EE_
x-ms-office365-filtering-correlation-id: d3c0ede8-38c7-419f-d815-08ded1d57565
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info:
 fJ7Wcww9jQQ+E3SLO6FZEVGoG6oGHspBEZLYiZHlkehSEgHYOt8nOUyhtQabq9Uj9TA3P9F9r4fAfvAlrqehdPLz5MrMlvHuRHGJ/q5A7Q67ep5askLAZDDg2VJd9io0A6/khtTrRLa66aaPecanZuynriTCTjVwR+8Dx3kLXA4Wd0p+89PNNfrgK2XvQ5qJF7QikLNA8GZze3PC56BoKOtL+n/ZFcPWiF2+OUKWN+4XSQCbZ3Ew72s3P3Uza5hs/g6A5exXlJstGOZRQ9Cd3kokoDeXRJ2eYju3SAwDsaL7Xlnd7pdZpKwvatSSq0Kd+t4XEE4ebQjUbCfNxci1BxH14FuP0f8/HZEHcjTqjRO55V3zdnfu07ooeTZ82nFMSMLNqfel1CEybtmcyVQmo6uMZFxFijRspakz2TnzyJhLMXs/Mcdk1eFicqinHxE+C2JhgCyGsH+TZ4ZI57/OV9Bd6moBIMWa6LCrSziZOIxh1WY9NSM9Ll21Z6KngfEjuLY0GyV5sBb+9iY1f6bsXX8CMWVQ8L87F51XI3W7y2ouEG4/1xg6XaxXKJbQ/ITbnPj0gwPQgLhhiK8VUvc/Ijzov38EIk7fsHpodShrJ+2END51KhGwH83e76IvSCluwPyYSqme1gRsz1T2l7JcIKoGjutaR8lctt53NHkqK6jmd5xx4dicXiXyNy8nvnkhc3IV3PrFsONb9vb8fplqWZX8ivw5jh/4804rARe424s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?emVSZENSRUFmRUEraDRpaHpRL1FEL3hZa1ZRYTYyMCtQU1dJVkhhRWIyeXZO?=
 =?utf-8?B?WHhIOEkyTG56ZW1iSytZK2huVHFHSjFtYnljQ2czUEQxVW5nYTRqMmhhVmJo?=
 =?utf-8?B?U1R3Y2pweU5Nb1RDQVVZUXZEZUhZS0pmeU4zaWkvdHhCWmpmeWJnbStzbWRk?=
 =?utf-8?B?bVh4MjY1VSt0dWluYkdBZ3Fpd2FndTRpTjJJbHI0cXJiY05mRmVMdjRRVUgy?=
 =?utf-8?B?WHo5RjZ0MTQvQ205dVUzMUlTOThQa2hMSC9lTC85SlhqMVdqREdxQUE5UVdZ?=
 =?utf-8?B?Wm9YbHNodHFvc0VnSk9YM2xibVRHSU5WZ3BuVkhRRHpGQ2hrc3dUM0FBemVz?=
 =?utf-8?B?UXU5QTBWaHlWakNYYkxVV3R4Yy90S0xrUFJZSEFTdkExdVZTRUdYSnhYc0Mw?=
 =?utf-8?B?QTlpdFdTakNIZ0VzWGJqYkFYV3Z5K2hsRUtibGZyVUhYb25NWGJNL25WRFZY?=
 =?utf-8?B?dEFZcnptNEJ1MTRjMjBBdllaUkRlNk03dWc4V2VoeVV6aFpWWjhKaTNEK2la?=
 =?utf-8?B?N1k4Q1k1RG9VRWxFeGdrL2pDVTJUaS9TNS93cmVPNkhqRFQ1OVV6SGRBL1hz?=
 =?utf-8?B?eGJDOVM3bkNOVjN5aEJVRDZNVFhrbjBZSWphVWY1K2ZiWkFiVi8xZWdyV0h0?=
 =?utf-8?B?YjljeUV5Qzk0eWhFOTFzOStpNHdDQXpHUVB6V01vOGxJVnFhdTQ2K0N3V0Za?=
 =?utf-8?B?b3lSQkpEdlhhVEhxNXdVUTJIandSY1J3cEZhNXVSdm5OcFhmdGdNMFFnaUV2?=
 =?utf-8?B?a1pQQWoyVTltc1QwdXFLbU5RYzk2bm81Y1RHbWc2RjRZNytUWGJYQm1HS1R4?=
 =?utf-8?B?cnNLNEczNnZXSjM4STBaZ1luQVp3b0c4OVZveXpTVks5MW5SNXBLNVhkTlBK?=
 =?utf-8?B?S1ZhWWFJOWI4TXR2cWVVL0REbmpxK0dQODZOeVZjSnNDQ3N2RmtzVHQxME40?=
 =?utf-8?B?M3JYSWdhSlN1U2M0UXE5UnllMEdiR2F2UC9lODIrai8zRWdHWTlhWEZXT0FY?=
 =?utf-8?B?ZzFtQy9hSjlWWGNqTURIZVdoZm1GQTNUcVF4OTFWWjBSZzJOWlo2ZDRkQnM5?=
 =?utf-8?B?V3NyZitkRU03SXIzNEpOejErWE54RmY2Nm1lRkVrbERRUk0wdWk3MGYyempo?=
 =?utf-8?B?QWtrbVdpblZpOG1nVzEvZVUyVURlaVJBeUkyTGxidXBKVm1acWE2VHdKVStj?=
 =?utf-8?B?bFE1MUcrRFFHS05SZU1aMDdIMDlySmdRNHA1RTdvOWVOdHdmZitGL2p0bmVj?=
 =?utf-8?B?NjV6aU5iUFNKVFYyUUNsOHdlZCtwb3NjbDJDb1RKakZ2VDFyMmFYNHJ1TXpW?=
 =?utf-8?B?Rm93c1Njb0NLZ1BZd0pwNmwxNlF6RWdOSXZqZkZUOGZSUzdNeEZRdnptVFRm?=
 =?utf-8?B?OXZWWEFUNWNOcHgyYlBYN1JDU0hzanZlQy9PT0Q3YklMZnFWUEcvMzV3dFNS?=
 =?utf-8?B?ZC9lWTVMb2pWMThlNGV2R3VYZzcyVms1MkJ4Zzl1ZGJaWjFES3duL0w5T2dZ?=
 =?utf-8?B?NmZEVTNNY0RZVysySGVrV3I5azB5bHZFVGNoTUhTVXY1b3lGL0l1ZTVTbjM0?=
 =?utf-8?B?VXlkTlVYVW8yVXFRTTN6NEwxRGlydXZ3L2grMWNSdnNQbVhyL3ZPelYyOWV2?=
 =?utf-8?B?bTl6bVQ0dGtDQi82TU52VThudkhUWXdTekN1aHF1YmxvOUhYM2pnM0IxYzVq?=
 =?utf-8?B?MUYza0dZV3FrWVRKSW41SHgzWFlXaHo0MllmQzJ5bnI1VjlxMytGUUl2eEty?=
 =?utf-8?B?M3kzOTFFTk9KL0lUVnltN05BMEVsczFtMElqQ3hyaE9Sa0dqT25Sa3lZUHhO?=
 =?utf-8?B?RVE2VkJieUdkWUFxZmZuODhZZEtWOUlQR0ZEL1pZUFBNSlZ5SGJCalI2dlBR?=
 =?utf-8?B?VEhHbzh6YjFNWHdKNmlCUVRMaStzSVh4M25IaXJDRFNTYUVaMU5KUGJyNDE4?=
 =?utf-8?B?NzBIaGRNZFJmMGpRUWloWVlaY3JqOUpKY3BldTRNYUlFaUo3dXlnUEg0NEJM?=
 =?utf-8?B?VVF6MmNRaFdIMzNpS2p5eml1T1c2Y29XNTZZRWpiRDNkYnF6aU9OWnhFaklG?=
 =?utf-8?B?WEF0NlA2anVxM0ZQbmlWa1IzTGRHcFNUa2pITnRQU2UzSkhwT0JhTi9mNTF5?=
 =?utf-8?B?b1hkaDU1a3h4WEFEbTFpT0I1SWkxenZFR0JCUHk4N3lweERjMTRiNzd0V0F3?=
 =?utf-8?B?bFNXa0ZNaWdaYTdrYlovbC9jTkw0eFMvMXc4OFZtNlR3N21jTjB6aDgyaldW?=
 =?utf-8?B?MWZMVzgrTGtuVnlrNmFNUFQ3aXp6RnR6VkxWc1dOS2FtREN0ZU91cmNjdUJG?=
 =?utf-8?B?M0hxWVk0TlIrZEdtcnRLOFQrWGdLaHRhWjVwUlZYc3BpcEt2VHpEUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c0ede8-38c7-419f-d815-08ded1d57565
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 09:46:26.0647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sIsOGOBKAu5dXhDEXgVPPWJDSumkYBZ5nggQz5DFHrh+QY8kfDj3U2lPECCSDOJwDZegYoRwH/IOOaWPPSCl0Ql8YPH3hQlO5Q/fCL1JdJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13773
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34386-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,renesas.com,baylibre.com,kernel.org,gmail.com,redhat.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3F6D6BD0D2

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDI0
IEp1bmUgMjAyNiAxMDo0Mg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogY2xv
Y2s6IHJlbmVzYXMsdmVyc2FjbG9jazc6IFVwZGF0ZSBtYWludGFpbmVyDQo+IA0KPiBPbiBUdWUs
IEp1biAyMywgMjAyNiBhdCAwNToyMDozN1BNICswMTAwLCBCaWp1IHdyb3RlOg0KPiA+IEZyb206
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFsZXgncyBl
bWFpbCBpcyBib3VuY2luZy4gVXBkYXRlIHRoZSBtYWludGFpbmVycyBsaXN0IHdpdGggbXkgY29u
dGFjdA0KPiA+IGRldGFpbHMgdG8gdGFrZSBvdmVyIHRoZSBzY2hlbWEgbWFpbnRlbmFuY2UuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gLS0tDQo+ID4gUmVmIFsxXQ0KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvYWpxV2V2b2ZFSjNmdjg1NkByZWRoYXQuY29tLw0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHZlcnNhY2xvY2s3LnlhbWwgICAgICAgICAg
fCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gUGxlYXNlIGFsc28gdXBkYXRlIE1BSU5UQUlORVJTIGZpbGUuDQoNCkl0IGlzIHRh
a2VuIGNhcmUgaW4gWzFdDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FNdUhN
ZFcwLVdzWnV1YzdQb1ZOQzVEQlVvWTlkUCtVTG1HVFE3NlZXTU9fU2pwYnVRQG1haWwuZ21haWwu
Y29tLw0KDQpDaGVlcnMsDQpCaWp1DQo=

