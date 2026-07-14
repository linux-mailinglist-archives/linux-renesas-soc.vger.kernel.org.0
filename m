Return-Path: <linux-renesas-soc+bounces-35217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0POBMFgVmqY4QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:16:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58778756DCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:16:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=Vg0kMURZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E80B5302334E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF4B480961;
	Tue, 14 Jul 2026 16:11:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7136EA88;
	Tue, 14 Jul 2026 16:11:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784045494; cv=fail; b=WHGZoY9AdvJPZRhvDIHjoirXIr/Y/tDfFULNrjjOg3Oz0cT5d4gE3ArTg/kkmz9Ea3d9B0esypvnl6mKojkDPZX05R7Nw1WgL67z9ai2KULD3T7AzwV+ORFTBhIjAO8753NB2DA3qHCOy22UKi46ZG1TZxvSHEgwfE38ESlvEIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784045494; c=relaxed/simple;
	bh=nQ2EY28lVcZvCW2O31PoDjXX+lSoXEJaZ8I5/WpJDSE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nkInlrXMa3tLP23Bl6LQyS8RvL5MVsfaMXsH5iqMRnwwWRMq8kiKwrBjk8g2CQyPSCvsY2+OGJ/LytpV6cVaYCHiSUwWHdQTXFcsymUt2JAIy4c9/8C7/EXsxXVg6v8qFqf+G2mZ/wc9XD3Dkgx++Pyg53x1YjesANwUii2+uqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Vg0kMURZ; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2TT188RzMPicH4P8MNwuB0pFQWnshGuiI2EsN0prd9rBayuSLjPWa5jo9oocBF6eXHFoQignjzNSX1mwgb1VlMn7x1fo14W4+9K9ivbo+jAt6E27wAWOO376Ze//wRwZa+KFjvqs9ZqrPVS8rCnvWg/pGfu31ZV0yEc0Wa7LFxQ5/ofP96Ey43Hz3xa5nKBKfkd0kfC0q32P6O339miZx5ojAAdIVGzMi/6dhMNTX0ReJLA58p2JncC64oM2TIweDcoOOvj5LIax7D7cXWKt3HHm6+dzar882q5TOrCO8+x5wTH4UWmO7Ks1CbQea9TYsVQucxb9YHpzeHHide9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ2EY28lVcZvCW2O31PoDjXX+lSoXEJaZ8I5/WpJDSE=;
 b=hLbyqiG1u8RFuxVpEqUlfTTMi+DPvmN+qK/y6CiYJS+LcciSCND20GXTEV9cI1/mq2crPOOfpge7N81mT0xSIV1AeXqWadESmSUf7IxLVC8PJ98qp+ETMnlo45NtRaQazFDaiw1GtnnVN0so0lkBnKbDtsyYNfh7iT7jSOr8YoqekoCNN3UIDWDtqZqLwoEoeuxcjJ9V/YUOddTijAhey2Pt8ofDyBNW+u/Hv83sjt+J1MICmL7KfA5l4YOCB0HIwteZc6Yw45glFyDgbMoYqsC4ZzTi5r0ZwRltjBLEbeJsyfYF4EFXXHcVvgBHxSUmRyM8iFCtzcO53Q5kl27bNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ2EY28lVcZvCW2O31PoDjXX+lSoXEJaZ8I5/WpJDSE=;
 b=Vg0kMURZj/F4Ara8w2zNz4a/61MWxRtp7sflUEP1UbH7L9BnuyBD3meYUtIBAQ5ScoUurdDpZddVAfz7ARiN2Xoi3DlXiNdP24BJTjylL1LPaEJ8pfK1TEh7McZ8D29zTJXQKOG5sEki/qSCxGGkfaoQsHF/dWttOSiBjFZsp6A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13209.jpnprd01.prod.outlook.com (2603:1096:604:351::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 16:11:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 16:11:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Ulf Hansson
	<ulfh@kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v20 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Thread-Topic: [PATCH v20 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Thread-Index: AQHdEvBXl6MRbd73BkixhhvPf+m/RLZtKR8AgAAAz/A=
Date: Tue, 14 Jul 2026 16:11:28 +0000
Message-ID:
 <TY3PR01MB113465E307DC9AA067A1B1D1F86F92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
 <20260713175159.138334-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQDWJGxuU04PEo2bJgHJF5F+0=HXqKzthKhKSR6dg0Tg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXQDWJGxuU04PEo2bJgHJF5F+0=HXqKzthKhKSR6dg0Tg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13209:EE_
x-ms-office365-filtering-correlation-id: 51be5454-fb59-4648-d12a-08dee1c28ff2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|4143699003|56012099006|11063799006|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 rxX3XgZLt9RSXRPf1awq3lb0YlKeynK9sujZGUMX1FhH3uM1MmomPKVOGuhe1GULoQ6SAYZZF3NkssScJx2MWx9IQ4+kaS4anCCJwB1o1hDNWieenrbdPf+afKpeqngt57Oq0rb5GfExfdDLziC4L+TJWhGQcA8WHB5MLv1Ptthx7fNvQwCE7IqLmGqL1Js02ravc8A1OowJBWH/hkXffRzyDA4KbgRb4KZoc2CaKh2uRzhml9hbuj24uCPqXlB7JBSVCnPokrXArIUseyuDKxahuKLc5/iyseGFn0ukPRyzMWTNgw56rP5lQPmMLq/+KOUHpkLJKwVTXuZVuIbB5PS/qgdwNNvsYfjgW/ZJiUachhHABiy83giGkZn9b/OZKN0DI94JjJhhfZn9ONUa5jbdkqe/Q+dFhf6gSyVRt4t1v8I9rtS5S/2QaCYThBWSmBHGUHG6SXWAhZx7Y0IYLknEuyBjTz8zdcTVmhhv9rYH7tfQbZV3kQHPonkB3IMdmMwo2p0s/8duLGmgtw3RMwWkW2KzBUah/Wn8KMJvYvKbrrNeAcT/G8XQzW+TFB5VLLf1HT8B7pV/aKv4AD7sxUT5mr6GCeY1oG5q0gugq1VW+eJlnx7rTktbXNvwVrSieOq0N/dl/ac/IsMkFgFMxjeVD+72KzizYG874eUztRBymlM7paUaNWIRNs3RWU4Brmi5B2RLqaISHPl9CnrX4HPpC304K+Ml3YkPHdkO9wg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmJ2MllnMlZUckVWc2R0S2srcFhna0xyVDkwRWNHczRkTWp2MTJ6ZnhKWFJL?=
 =?utf-8?B?STVDVERhMDdhZ01KTW1HTjhSbjZvQkhXSzRoQlYvSGNLRjJEejlza0tYZDZN?=
 =?utf-8?B?N3RUeEM5ODl2aXhlcmZ2Z2lmS0xYTUxCUmpPWFBSeUdCL0V4WS9hYiszci9M?=
 =?utf-8?B?TWliZHlwK1RyQVd5eStOUmkvVTY0S01OUFJkVjdzbjRwK1ZpVDRUQzRHODZO?=
 =?utf-8?B?RHo2ZGdLN2FEd1ZyS0czTitXY0xLcVNnMWpsNlJtQUFncVNyVmhDWTZOM1ds?=
 =?utf-8?B?YTFvRUxmbFRneXFrMVBzMUhDaCtjajJvZHQ4ODRPRFRvTHpIUUh6ekgyL0JI?=
 =?utf-8?B?Ty80RW1UcGdlckVPT2J2Kzcxb1ZwazNMRkliS2tkR1ZiTU82bjYvc3hkRWZk?=
 =?utf-8?B?K3U1OHI1MmhyWm42TFc1NzdmT3htQVRHbTRBZGx2ZUpPNjB0M0l5OG1SNE9V?=
 =?utf-8?B?clpFNGdrVGxRdUNicVhuOUdiTml3TkU0Vzl5ck96K2lZc0JvamkvV0Jnam05?=
 =?utf-8?B?aEtnOVlvcVExVGh1SXZuVEU4MXZ5WGN4ZEJqVzM0NnI3c0FieGhBREYzTE5O?=
 =?utf-8?B?SlhsYU5hTVFaUTdHUkNVTUk3UjhWM1ZocGNYdTdZRWJDUmYzYzRkNVh0YVhT?=
 =?utf-8?B?R1plTlVyRVdvcHVzbFZERjFjVi80c2cvZUMwWENkS3RGckthc2RyU3Z0U3l3?=
 =?utf-8?B?T05od1Q4RGtxbnJWT2tXK0xkM0k2aUdhaE1Wa1NrZnlPVFAvK0tsNjZpNHc2?=
 =?utf-8?B?NjcxM1lIMDk2WHZrTGIwam5xUWUwSFVrNVgybUd5VU9DN1ZqQjhWRWhZQzlF?=
 =?utf-8?B?cWNRQUVHZnc1U1NqVDFYYXZtOUFSOHAwRDR5OUZVT1pNYnZLZHJ6SDZ0eStz?=
 =?utf-8?B?T2dCNWtrRFhySHlnUDFiU25FTG1uUzJrOVcvemphZVpZdTBENitQOTA2VUZo?=
 =?utf-8?B?cWFjK0t2ZGRldXZPdDhuME9zaHN4U1N6UUVvaVQxS3VKRTJDTHJJdU9yN3Z4?=
 =?utf-8?B?ajRQMldhS0tFMHN5VFNoTy9KclYzRHF5YTBGTnBtSlR3OXFvK1FGYnNRMVN1?=
 =?utf-8?B?ODF1TzNveDhSTk1aU3g4V3V0UW5jVzFJTG9ma2UvaVZmd0VkR0tIOVduQ0NZ?=
 =?utf-8?B?aURrR1pTQ1B2SjBZemllQjU3V3l2cEFwc3psMVo2VDh5QnFLZWV1SWFVRDBM?=
 =?utf-8?B?VWx1Mzdwd01HS0kreEMyN2xwaStNdlIvNEZ6ZFFHUkdTOFgvanNMWkIzK0hw?=
 =?utf-8?B?WHFkTTBLZHBiakxya2luWEVseGMxeUlzckpVWkhnNnYwZXUvRkZxYVZGL0ZN?=
 =?utf-8?B?MHJDV2xUc3A1NkovQmV2b1N5MVRMUWNLUnphcW11L1dLNjZIckd2ZkFHNWZL?=
 =?utf-8?B?eUpJdGdzVGxJcXBPbjV1eHJCdytDSFp1TnlWK2dpb1NLTDhvNDFseHRmbE5Y?=
 =?utf-8?B?WXlNeU13dGhHZGRZdURFNk1NRUkyQXZ3cURIV2VxR0QxalJQOTVOTUhqMHVI?=
 =?utf-8?B?S0FobVRvUEduWDhETjBxV3luaDkvUStHVlpOVUlTdEhhc2VhTUt3RTU3VHNi?=
 =?utf-8?B?aXpQUXI1alRMK01ZMUkvS1dmSVZlVGhndmgvSnhoNmZQWnBxUUNLV2xkZHVm?=
 =?utf-8?B?REpTVFhJS0hBVWl6dUVFdjRNNmRiUkNKeUxLaDRyZTdERHF2a2RJVXd2WVMy?=
 =?utf-8?B?VUR3RmtnZzE3YUM2OHpNZyt4cnNJRmQ2MGczNWs1aHIvQ0tsSWZRY2NKRS9W?=
 =?utf-8?B?UWlTN2trTWNuSVBlU1FTc2x4R3F0aHpNOFVsak8zMThNOVJjRDdzVWZPQVFS?=
 =?utf-8?B?WGo0RzBkbWxwVmwrYm1LdGcyemlVeW9ITk5VVzNRdkhyRnFidW5ZMnhQa2x4?=
 =?utf-8?B?S0JYdFdHVWZFemhqQmt6UUVXbGs1RmkrMkpmWElWR3o1Y0VKUGQyOXhIdXZy?=
 =?utf-8?B?TERPLzdjSTB2T1FmbG1CcU9LUjJQSjZwNUpLYmhuTU5WT21waXlPVDREYnNw?=
 =?utf-8?B?TDkzdzJkSW9mUm5HZWQ3Z1FYVUlxRnA2VENHb1grTmVFR1BsODNZWFJ5aGNZ?=
 =?utf-8?B?MUNhY3FlNzBqUE1OYW03SmtyVDRkajd3Nmthd285M2ZZV3BHVjQwdUg4dnl1?=
 =?utf-8?B?NXYzQlV4a3RkdzhMQ2NkWHhFeThialFNSUpTQ2QyYUJNV09ZYWVCSTk1cTNl?=
 =?utf-8?B?eEZ3clk4ZHRyUkVrWXk0SWliUEVubk5YcUE2N3hXRDEvQ015WDRlMDVxaVJl?=
 =?utf-8?B?QnpZMjkrS3VyT2RKdUdpdFJoMTBOZFo1TGpBb2hHUmE0OThUcUxsMXBwOW9V?=
 =?utf-8?B?eHJ0MFlGRnRaM3BJVEtXK29oTmVqN3RxZjRIdE5SeVk2bUdCQ3VPZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 51be5454-fb59-4648-d12a-08dee1c28ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 16:11:28.7537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52xGzamblDNaKntNAG7hp7ghYEM6ytX7aPMg73eansch7p9QjbTQbBTWU0zhOexWP9j8nnVLjCOooqAY0aMlBQjN2IJN/cSbL5UT55+PAX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13209
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35217-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58778756DCD

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGVzdGluZy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
Pg0KPiBTZW50OiAxNCBKdWx5IDIwMjYgMTY6NDMNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MjAg
MDgvMTJdIG1tYzogcmVuZXNhc19zZGhpOiBBZGQgUlovRzNMIFNESEkgc3VwcG9ydA0KPiANCj4g
SGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMTMgSnVsIDIwMjYgYXQgMTk6NTIsIEJpanUgPGJpanUu
ZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhlIFJaL0czTCBTb0MgKHI5YTA4ZzA0NikgaGFz
IGFuIFNESEkgY29udHJvbGxlciB3aXRoIHNldmVyYWwNCj4gPiBkaWZmZXJlbmNlcyBmcm9tIGV4
aXN0aW5nIHBsYXRmb3JtcywgcmVxdWlyaW5nIGRlZGljYXRlZCBoYW5kbGluZy4NCj4gPg0KPiA+
IFV0aWxpc2UgdGhlIFRNSU9fTU1DX0hXQURKIGZsYWcgdG8gaWRlbnRpZnkgY29udHJvbGxlcnMg
dGhhdCBjYXJyeSBhDQo+ID4gc2Vjb25kIGhhcmR3YXJlIGFkanVzdG1lbnQgcmVnaXN0ZXIgKFNE
bV9TQ0NfSFdBREoyIGF0IG9mZnNldCAweDAxMCkuDQo+ID4gV2hlbiBib3RoIFRNSU9fTU1DX1RV
TklOR19ERUxBWSBhbmQgVE1JT19NTUNfSFdBREogYXJlIHNldCwNCj4gPiByZW5lc2FzX3NkaGlf
c2V0X2h3X2FkanVzdG1lbnRfZGVsYXkoKSBhZGRpdGlvbmFsbHkgcHJvZ3JhbXMgSFdBREoyDQo+
ID4gd2l0aCAweDNGRkYgYXQgMy4zIFYgYW5kIDB4RkYgYXQgMS44IFYuIEEgbmV3IFJaRzNMX1NE
SElfU0NDX0hXQURKNA0KPiA+IHJlZ2lzdGVyIChvZmZzZXQgMHgwMjIpIGlzIGFsc28gY2xlYXJl
ZCBhdCB0aGUgc3RhcnQgb2YgdHVuaW5nIHdoZW4NCj4gPiBUTUlPX01NQ19JTlRFUk5BTF9ESVZJ
REVSIGlzIHNldC4NCj4gPg0KPiA+IEFkZCBhIG5ldyB2ZXJzaW9uIGNvbnN0YW50IFNESElfVkVS
X1JaX0czTF9TRE1NQyAoMHhjZTEwKSBhbmQgZXh0ZW5kDQo+ID4gcmVuZXNhc19zZGhpX3NkYnVm
X3dpZHRoKCkgdG8gaGFuZGxlIGl0IGFsb25nc2lkZSB0aGUgZXhpc3RpbmcgR2VuMw0KPiA+IHZh
cmlhbnRzLg0KPiA+DQo+ID4gSW50cm9kdWNlIG9mX2RhdGFfcnpnM2wgd2l0aCBSWi9HM0wtc3Bl
Y2lmaWMgcGFyYW1ldGVyczogYSB3aWRlcg0KPiA+IGNsa19tYXNrIG9mIDB4MjAwMDAwMjAwLCBh
IG1heF9kaXZpZGVyIG9mIDIwNDggKHJlZmxlY3RpbmcgdGhlIDExLWJpdA0KPiA+IGRpdmlkZXIp
LCBhIGRlZGljYXRlZCByemczbF9zY2NfdGFwcyB0YWJsZSwgYW5kIGFsbCByZWxldmFudA0KPiA+
IHRtaW9fZmxhZ3MsIGluY2x1ZGluZyBUTUlPX01NQ19JTlRFUk5BTF9ESVZJREVSIGFuZCBUTUlP
X01NQ19IV0FESi4NCj4gPiBXaXJlIGl0IHRvIGEgbmV3IG9mX3J6ZzNsX2NvbXBhdGlibGUgZW50
cnkgdXNpbmcgc2RoaV9xdWlya3NfcnpnM2wNCj4gPiAod2hpY2ggc2V0cyBmaXhlZF9hZGRyX21v
ZGUpLCBhbmQgcmVnaXN0ZXIgdGhlDQo+ID4gInJlbmVzYXMsc2RoaS1yOWEwOGcwNDYiIGNvbXBh
dGlibGUgc3RyaW5nIGluIHRoZSBPRiBtYXRjaCB0YWJsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCENCj4gDQo+IFRoaXMgY2F1c2VzIGEgZGl2aXNpb24gYnkgemVybyBvbiBB
cm1hZGlsbG8gKFItTW9iaWxlIEExKToNCj4gDQo+ICAgICBEaXZpc2lvbiBieSB6ZXJvIGluIGtl
cm5lbC4NCj4gICAgIENQVTogMCBVSUQ6IDAgUElEOiAyMiBDb21tOiBrd29ya2VyLzA6MiBOb3Qg
dGFpbnRlZCA3LjIuMC1yYzMtYXJtYWRpbGxvLTA2MzM4LWdkMTU1NzY3MGFiMGMgIzk3Ng0KPiBW
T0xVTlRBUlkNCj4gICAgIEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgUjhBNzc0MCAoRmxhdHRlbmVk
IERldmljZSBUcmVlKQ0KPiAgICAgV29ya3F1ZXVlOiBldmVudHNfZnJlZXphYmxlIG1tY19yZXNj
YW4NCj4gICAgIENhbGwgdHJhY2U6DQo+ICAgICAgdW53aW5kX2JhY2t0cmFjZSBmcm9tIHNob3df
c3RhY2srMHgxMC8weDE0DQo+ICAgICAgc2hvd19zdGFjayBmcm9tIGR1bXBfc3RhY2tfbHZsKzB4
NDQvMHg3NA0KPiAgICAgIGR1bXBfc3RhY2tfbHZsIGZyb20gTGRpdjArMHg4LzB4MTANCj4gICAg
ICBMZGl2MCBmcm9tIHRtaW9fbW1jX3NldF9pb3MrMHgxMWMvMHgxYmMNCj4gICAgICB0bWlvX21t
Y19zZXRfaW9zIGZyb20gbW1jX3NkaW9faW5pdF9jYXJkKzB4YTQwLzB4YWI4DQo+ICAgICAgbW1j
X3NkaW9faW5pdF9jYXJkIGZyb20gbW1jX2F0dGFjaF9zZGlvKzB4OTAvMHgzMmMNCj4gICAgICBt
bWNfYXR0YWNoX3NkaW8gZnJvbSBtbWNfcmVzY2FuKzB4MWQ4LzB4MmE0DQo+ICAgICAgbW1jX3Jl
c2NhbiBmcm9tIHByb2Nlc3Nfc2NoZWR1bGVkX3dvcmtzKzB4MmJjLzB4NDVjDQo+ICAgICAgcHJv
Y2Vzc19zY2hlZHVsZWRfd29ya3MgZnJvbSB3b3JrZXJfdGhyZWFkKzB4MTcwLzB4MjE0DQo+ICAg
ICAgd29ya2VyX3RocmVhZCBmcm9tIGt0aHJlYWQrMHgxMTQvMHgxMjQNCj4gICAgICBrdGhyZWFk
IGZyb20gcmV0X2Zyb21fZm9yaysweDE0LzB4MjgNCj4gICAgIEV4Y2VwdGlvbiBzdGFjaygweGUw
OTQ1ZmIwIHRvIDB4ZTA5NDVmZjgpDQo+ICAgICA1ZmEwOiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwMDAwMDAwMCAwMDAwMDAwMA0KPiAwMDAwMDAwMCAwMDAwMDAwMA0KPiAg
ICAgNWZjMDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAw
MDAwMDANCj4gMDAwMDAwMDAgMDAwMDAwMDANCj4gICAgIDVmZTA6IDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIDAwMDAwMDAwDQo+ICAgICBEaXZpc2lvbiBieSB6
ZXJvIGluIGtlcm5lbC4NCj4gICAgIENQVTogMCBVSUQ6IDAgUElEOiAyMiBDb21tOiBrd29ya2Vy
LzA6MiBOb3QgdGFpbnRlZCA3LjIuMC1yYzMtYXJtYWRpbGxvLTA2MzM4LWdkMTU1NzY3MGFiMGMg
Izk3Ng0KPiBWT0xVTlRBUlkNCj4gICAgIEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgUjhBNzc0MCAo
RmxhdHRlbmVkIERldmljZSBUcmVlKQ0KPiAgICAgV29ya3F1ZXVlOiBldmVudHNfZnJlZXphYmxl
IG1tY19yZXNjYW4NCj4gICAgIENhbGwgdHJhY2U6DQo+ICAgICAgdW53aW5kX2JhY2t0cmFjZSBm
cm9tIHNob3dfc3RhY2srMHgxMC8weDE0DQo+ICAgICAgc2hvd19zdGFjayBmcm9tIGR1bXBfc3Rh
Y2tfbHZsKzB4NDQvMHg3NA0KPiAgICAgIGR1bXBfc3RhY2tfbHZsIGZyb20gTGRpdjArMHg4LzB4
MTANCj4gICAgICBMZGl2MCBmcm9tIHRtaW9fbW1jX3NldF9pb3MrMHgxMWMvMHgxYmMNCj4gICAg
ICB0bWlvX21tY19zZXRfaW9zIGZyb20gc2Rpb19lbmFibGVfNGJpdF9idXMrMHgxMjAvMHgxMzgN
Cj4gICAgICBzZGlvX2VuYWJsZV80Yml0X2J1cyBmcm9tIG1tY19zZGlvX2luaXRfY2FyZCsweGE0
OC8weGFiOA0KPiAgICAgIG1tY19zZGlvX2luaXRfY2FyZCBmcm9tIG1tY19hdHRhY2hfc2Rpbysw
eDkwLzB4MzJjDQo+ICAgICAgbW1jX2F0dGFjaF9zZGlvIGZyb20gbW1jX3Jlc2NhbisweDFkOC8w
eDJhNA0KPiAgICAgIG1tY19yZXNjYW4gZnJvbSBwcm9jZXNzX3NjaGVkdWxlZF93b3JrcysweDJi
Yy8weDQ1Yw0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3Jl
LmMNCj4gPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMNCj4gPiBA
QCAtMjM1LDkgKzIzOCwxOCBAQCBzdGF0aWMgdm9pZCByZW5lc2FzX3NkaGlfc2V0X2Nsb2NrKHN0
cnVjdA0KPiA+IHRtaW9fbW1jX2hvc3QgKmhvc3QsDQo+ID4NCj4gPiAgICAgICAgIGNsb2NrID0g
Y2xrICYgQ0xLX0NUTF9ESVZfTUFTSzsNCj4gPiAgICAgICAgIGlmIChjbG9jayAhPSBDTEtfQ1RM
X0RJVl9NQVNLKQ0KPiA+IC0gICAgICAgICAgICAgICBob3N0LT5tbWMtPmFjdHVhbF9jbG9jayAv
PSAoMSA8PCAoZmZzKGNsb2NrKSArIDEpKTsNCj4gPiArICAgICAgICAgICAgICAgaG9zdC0+bW1j
LT5hY3R1YWxfY2xvY2sgLz0gKDEgPDwgKGZmcyhjbGspICsgMSkpOw0KPiANCj4gSXMgdGhpcyBj
aGFuZ2UgaW50ZW50aW9uYWw/DQo+IA0KPiAgICAgY2xvY2sgPSAwLCBmZnMoY2xvY2spID0gMA0K
PiAgICAgY2xrID0gODM4ODYwOCwgZmZzKGNsaykgPSAyNA0KDQpPb3BzLCBJIG1pc3NlZCB0byBj
aGVjayB0aGUgYWN0dWFsIGNsayBbMV0gaW4gdjIwIHdoaWxlIGZvY3Vzc2luZyBvbiBmaXhpbmcN
CnNhc2hpa28ncyBjb21tZW50Lg0KDQogQWN0dWFsbHksDQogY2xrID0gY2xrICYgR0VOTUFTSyg3
LDApIC0tPiBGb3IgTm9uLVJaL0czTCBhbmQNCiBjbGsgPSBjbGsgJiBHRU5NQVNLKDksMCkgLS0+
IEZvciBSWi9HM0wgDQoNCkkgbmVlZCB0byBhZGQgdGhlIGNsa19kaXZpZGVyX21hc2sgdmFyaWFi
bGUgdG8gb2ZfZGF0YSB0byBmaXggdGhpcyBpc3N1ZS4NCg0KWzFdDQpyb290QHNtYXJjLXJ6ZzNs
On4jIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy9tbWMqL2lvcw0KY2xvY2s6ICAgICAgICAgIDE1MDAw
MDAwMCBIeg0KYWN0dWFsIGNsb2NrOiAgIDggSHogLS0+IEl0IGlzIHdyb25nIGhlcmUgKDE1MCBN
SHogLyAoMSA8PCAyNSkpLg0KdmRkOiAgICAgICAgICAgIDIxICgzLjMgfiAzLjQgVikNCmJ1cyBt
b2RlOiAgICAgICAyIChwdXNoLXB1bGwpDQpjaGlwIHNlbGVjdDogICAgMCAoZG9uJ3QgY2FyZSkN
CnBvd2VyIG1vZGU6ICAgICAyIChvbikNCmJ1cyB3aWR0aDogICAgICAzICg4IGJpdHMpDQp0aW1p
bmcgc3BlYzogICAgMTAgKG1tYyBIUzQwMCBlbmhhbmNlZCBzdHJvYmUpDQpzaWduYWwgdm9sdGFn
ZTogMSAoMS44MCBWKQ0KZHJpdmVyIHR5cGU6ICAgIDEgKGRyaXZlciB0eXBlIEEpDQpjbG9jazog
ICAgICAgICAgMTUwMDAwMDAwIEh6DQphY3R1YWwgY2xvY2s6ICAgMTUwMDAwMDAwIEh6DQp2ZGQ6
ICAgICAgICAgICAgMjEgKDMuMyB+IDMuNCBWKQ0KYnVzIG1vZGU6ICAgICAgIDIgKHB1c2gtcHVs
bCkNCmNoaXAgc2VsZWN0OiAgICAwIChkb24ndCBjYXJlKQ0KcG93ZXIgbW9kZTogICAgIDIgKG9u
KQ0KYnVzIHdpZHRoOiAgICAgIDIgKDQgYml0cykNCnRpbWluZyBzcGVjOiAgICA2IChzZCB1aHMg
U0RSMTA0KQ0Kc2lnbmFsIHZvbHRhZ2U6IDEgKDEuODAgVikNCmRyaXZlciB0eXBlOiAgICAwIChk
cml2ZXIgdHlwZSBCKQ0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IExhdGVyOg0KPiANCj4gICAg
IHN0YXRpYyB2b2lkIHRtaW9fbW1jX21heF9idXN5X3RpbWVvdXQoc3RydWN0IHRtaW9fbW1jX2hv
c3QgKmhvc3QpDQo+ICAgICB7DQo+ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjbGtfcmF0ZSA9
IGhvc3QtPm1tYy0+YWN0dWFsX2Nsb2NrID86IGhvc3QtPm1tYy0+Zl9tYXg7DQo+IA0KPiAgICAg
ICAgICAgICBob3N0LT5tbWMtPm1heF9idXN5X3RpbWVvdXQgPSBob3N0LT5nZXRfdGltZW91dF9j
eWNsZXMoaG9zdCkgLw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoY2xrX3JhdGUgLyBNU0VDX1BFUl9TRUMpOw0KPiANCj4gY2xrX3JhdGUgPSAyLCBCT09NIQ0K
PiANCj4gICAgfQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiAN
Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvDQo+IGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

