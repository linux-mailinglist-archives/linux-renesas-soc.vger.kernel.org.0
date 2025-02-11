Return-Path: <linux-renesas-soc+bounces-13054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F4A31025
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 16:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B4D162CAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 15:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C77D250BF1;
	Tue, 11 Feb 2025 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VC0/harz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08981C5D40;
	Tue, 11 Feb 2025 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288978; cv=fail; b=EMozbz/t4Wf38giBZmlXinHHQITA7ZU0qnHjgYaFqwNW1F202SVh1Ntb1xpXNd99rnlpwAu3QD18MkNuY18nZT/ErePba2UmuTnN/fmA41ERl1ih3pcjSeNBOTU8Q6JCXGvC4Q5/rAHpkWEtIO2ac9QscTlJwytYvI9TVST/FNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288978; c=relaxed/simple;
	bh=spUa5j4Mc5IFkcXKtPSbnSAKWwoYxNyNe9BB6+zUDvw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j9uXv7E4yW82tsE5KoOeaY+CQgEgjhvKtFAVQGsqTOnR9D/IV2xYapNYHldTRAIplMt/Yue+NGaUg9/VDZ7OOXoF6NjJizlsx1L4k7EaWM7aVccHjIPxWqCBgBRLiQG1zOgwgjlGxk4DvYfU+UFS2ZadgGSh4Bld2TKoRBzg9/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VC0/harz; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c//azlIB+ctLyT52jS79HduW2sW1PRrRIFjMNCS025gqIrn6yBcJPSZsqt0Nxb/Qaet1UovdJWDoyfkI4BXsP8eQpfJITZmuXZEIEnGG4kPIsxNOsNDZG5PpRbHcYwsvpt1mvKll4hfg6zcmcfCVmFS2CZXQjyHk8B/vhhnShpI2EP3VeBwavEfu+c8udTTbl/8+XLGh3pCtHgKwCaHHEwlYano5LJwkUJ0IDIvypEsPSdi7tKeU2taJaVgsKaFPg96OlXnjkwyezpeGUl/ml5FUm9riHPw2mYo2w6hsIHerO+dzR6qil1WT4jaL/BrnWM2UMA0FO/rTaYkg4Oe6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spUa5j4Mc5IFkcXKtPSbnSAKWwoYxNyNe9BB6+zUDvw=;
 b=ay09oo6OAqzjYgLpW7eJtgfPrsu63QU1YVXv8EeSwYPcOZxJP75q09RkRGYuQbQzqzekisxtkSVCJpHGKdS6CHhG2XGHH12/zTMhWz/ncV2gsWHpnOe5PLvwjYcrGZRhow9U2tGYXSUamouHqTLsnBS3ak0LB9QN1F8l8Ss74qeuPyzlwwpQ1BmXMgoyGLJgEKH8TAFS/u1vrXQVhViQVuW/ZBCqxztUmr2Y9vt0XTB3tttLt8HELYhJEYLPzMMddea+VaEpCbmK3WyyExskQnRUpBfGCdQ0npW0EAi24pJw6kHvHz0uAEvcQ7kysj/2r9yfQe0L+nLdkvC2kVFZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spUa5j4Mc5IFkcXKtPSbnSAKWwoYxNyNe9BB6+zUDvw=;
 b=VC0/harzq7C1kHGmkisVwVdISDgHzv8CrUHdNMm/YxkMCgejvXmxRqML1bWNnlQ90ZjU/4SbnBeQ2TeJXxQSSPYe9LySvoTf7WJjQvDV3Y5q2+9R+4ga6lU+73EbgUM2MYkXvWNWt0I+KWwq3tUekT2Nxycsz35hvTeACkpYbGE=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TYYPR01MB10546.jpnprd01.prod.outlook.com (2603:1096:400:30d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:49:31 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:49:31 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Markus Elfring
	<elfring@users.sourceforge.net>, Markus Elfring <Markus.Elfring@web.de>, Marc
 Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Topic: [PATCH v4] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Index: AQHbHAHYvXF5k5+c/kCOozFL8Zvee7NC9pGAgAAG91A=
Date: Tue, 11 Feb 2025 15:49:31 +0000
Message-ID:
 <TY3PR01MB120897A4A7AEF860A13F87E72C2FD2@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <20241011172003.1242841-1-fabrizio.castro.jz@renesas.com>
 <CAMuHMdUrg+gqJsg2LaBkzaLPzh4nZefqVdqH2rLhCEGQDya88g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUrg+gqJsg2LaBkzaLPzh4nZefqVdqH2rLhCEGQDya88g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TYYPR01MB10546:EE_
x-ms-office365-filtering-correlation-id: 8c4a364a-0e2f-4b34-2f12-08dd4ab3acb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NWpJd2E0a1l2N2pzQnZwQmlJWFQxaVg1ak1XQ1JQSkxtdWpGVHladWtIaGRs?=
 =?utf-8?B?Tk5QdjFBYi9VRDFoT3NwOU5KVGlpZlEwMjB2T0tDeUhhSXhXVXJvMzAyQ3lH?=
 =?utf-8?B?QnlBWE1jMS9qWEFmeUFEYlpBYUt5dmNsTUQ3RVN6L1VrR0RyTEVsY1QyNGIv?=
 =?utf-8?B?VjFKMnpoZXdxRnpJNEpGTWtIQzBxbG9OTlRQMjFkV3BoYUJNWmNYa0tVS1V1?=
 =?utf-8?B?OE1jUXZhVWtKQzBGRnVzL001Qm9Yek1Jc1lQYStuajF3VUhxTmlQVTd0enhC?=
 =?utf-8?B?UURpbXFMS0ZUWHlIMXh4SmFtc2FQdHZlOThWcDNXdml3UjBCckhtWVhoeHUy?=
 =?utf-8?B?NWt4TitoSnZsR25UUEVHa0dCS3pwODcxcFhwUVMxSEVXQUZ1Tmp1SmxSeWQx?=
 =?utf-8?B?WDMybjVPdVFadm1DL09VUjJNMzMrWmhJdm1FL2hpd2NMTVRISURMRHV2TWRW?=
 =?utf-8?B?bEtVVUZjTExxN3JBQ1NMc1VKSGwvZGhoc3lVZGlwWnhxcndsY2tCRXhqMTZY?=
 =?utf-8?B?TnlPODIzOGVlMWkvTWZqR1VIbmRKYUZTMFJjZmNxMk9nUVZFMUFhVjFjbDRq?=
 =?utf-8?B?b2pRNFovK3cxdjdFc1JUcmh1Rm5ycTJQQ3RialBYT1FQY0V6N1MwQ29SQTJm?=
 =?utf-8?B?TDN4R0VSK0J4eGVaSVRZOExhMnh1K2dRT3FlRWMvMktCWURWMkFONmk5NllN?=
 =?utf-8?B?ZzR2VkVaT0xIbFRJVkVLV1Z2aUNUQWEvNXl3OERha0ZIWWxaMFEvZk1Hcm5N?=
 =?utf-8?B?M2ovRExlVHJPbUZzbk5FUzNHWHdheGswZjlpR04rTVFrdnhuWkVnZXp5aGFy?=
 =?utf-8?B?bzU4YVJiaVRVeHpoMnBnMTk1RjVRSlExQW9rTC8vNnJnSjdtZVNCQys5VGpT?=
 =?utf-8?B?TEs4YndQc2lMaHpQcUg1UE9SOHo0Vjl5VW5uMm43YmxYdUxiQmVVS2pFcDBp?=
 =?utf-8?B?Wk14WXROb3B5aEdXcVhhTUg0ekxzaDhqbi9hamtZWGZRcUszakF6aG9aNUU3?=
 =?utf-8?B?cFpqNzgybkhwODJMY3ZKMFNzVXJyY1RmS2Rtdm1BZ2VSVXg4UXk0MTluZlZa?=
 =?utf-8?B?eHFXYWFuMUQ5OXd0bGtrOFdnQnlQcTlsZlUxcTIzOTgzUnFDMHB3S1d5UnlG?=
 =?utf-8?B?akVBRkFkU2NPejYrb2tVY0dvSTFZTnRGUUlHcVhCUXlLOERlZEVsL0VBb24r?=
 =?utf-8?B?NVM2WUtqOFpCaE1hZU04RVNtTTVHN2tYWXE2Y2Y3VjFwUW5laVRqVlJmMTZI?=
 =?utf-8?B?VHQ5S0FmbEhwMElRRUFzY3VlRnZTWE5rQ3UveFp3bTNSVThraUxYMVh5ZVFm?=
 =?utf-8?B?cmhsWTdVUnlqVzFtTFpmNHVQVW8vU3plZ1NXVnNoNmhGaTdrNFJjSTArNUh1?=
 =?utf-8?B?U2JrbFRma2VzUVN5UTVTbUxKbUlvckNvckFHQnRrTTd0MjJIeXRPeHlITWhq?=
 =?utf-8?B?V3RHMlRQR1pHenlJcjdvRGhWajRHTzVaaHJtWkU5QmJCR0FEcFpFNFlxemt4?=
 =?utf-8?B?bDBjQmcySUs0c0k5eEdiS0d0ZVVuQlJ0UFpuUmU1VTZya1VFeEJEYWxiRVk3?=
 =?utf-8?B?N2hIcmwxelMwRWJlWWZSRU5ZaTlaaXdsZmtWSS9yMXNjdzlYN3FDZjJ2RC90?=
 =?utf-8?B?MThEbU5iWHpMVHJjckYxV1prR3VGcnM4a0U0MURDbHQ0cTMxTURsaXVrVHNW?=
 =?utf-8?B?TmlMMFJ2TGhRWE9hZFp3ZDZoVjIwQnhVTVlURDVJWkl3MHN1M3ZrSVluZnZz?=
 =?utf-8?B?d2tLbG5mWTh5UFBhVms5NjNpZktndWI3aGtMWVFoTElvYVRGelllNzJoMnhk?=
 =?utf-8?B?SjViK2lITEhyajl5Y1MwcjBoMnZtSXUwY2liOHh4NTV3RW0yZXlOSm40RDY4?=
 =?utf-8?B?NkowNUVheXBrMHJUM2lyNmdGOENnZHErUE9pTGpIQ3RuV3NTbFQrYUdzdHJp?=
 =?utf-8?Q?Tsg5Xr5xCewnerHdCh9Yl2aGR1yePLwi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RU56ZmdLZnUvc0JvRCtOTlZUKzl5aTdIUDJMRDZGL01pVjNJMXRDMWpHaC9B?=
 =?utf-8?B?eHNmTFVRbksyQVhXVWN1YTdYc05ScnhQRU9vWEc5UEovTnJzZ2hrdkcrcUVX?=
 =?utf-8?B?S3I3Z1FxKzNxb0s1NU5ERUh2b1lYOVVMaWU4dnNTRzZyRkhJU0hYUGpHak16?=
 =?utf-8?B?Nm96UEVoSVY1U1o1LzZxVUF3TmhqN2lCSVFzS1l3OG1TUGtCaFY4YUVTdTMy?=
 =?utf-8?B?QUl0Z3JyTTExTzJiR0dURFJiVFNWWmNYTnRKcUR6NlJzWmlWcDZFUVFYS0li?=
 =?utf-8?B?SnhXalNmeVhmekRoN2JycXE3WWZuNkxWMXByd0g0cmpjR2N5QmhDNW9DS0RH?=
 =?utf-8?B?LzJhK3QzdTV5amYrVGhaTHp3eXhWOGVmZkRyTnozN1pMVDNWQU1Tc2kzT1ZH?=
 =?utf-8?B?VVVEUGJHckZrWlBObHZSWCtyZkxUVzBUMlpJaTZ4WnNDTEJmOEd6UGxTcG9j?=
 =?utf-8?B?K3k0cTZINDdneVNxN2xORWppZmZTUVorZk1qTDdDVHNSNFYzRHBpOXVHVFdM?=
 =?utf-8?B?QUgzb1VhU2dFYkFWcUtsQ0V2Q043NUZPS0VwVzRjLy9VSWFmKzNJektXTVJ3?=
 =?utf-8?B?MGZsMlZYcWZ0cjdwQmpKQXVtL1VEbmZyYkpiSERwV2tjWkRqS3VIVEx4NC9K?=
 =?utf-8?B?MFZZK1FyZ2FwcUdCM1BpeG5XWG5sV3YxY3lrYkVhSys2OUtPcXhyNk1jbHIw?=
 =?utf-8?B?UnZ1MFV5OWtWdSswcVMwZDJUdGxHMXBRTzRUdDFVbi8vdWd1MVh0ZDFIeWY3?=
 =?utf-8?B?RkhHWk1naFhmaG1ibnRWUWpmaWhHZkFvOTBtSjkrUDV1ZWJPYTM5dzBndzRa?=
 =?utf-8?B?RmMyeWhERkxNYlc4WDlNNW85ZS93ekZQQXUrN3E3K3J2UXFGYWF4d2xGSzZO?=
 =?utf-8?B?QzBVUkZQdFZSejA4bFJReVFiUnNFcXQ5bi80OGFyUHBJZnNZSGpUWlJlOW1q?=
 =?utf-8?B?T3BIRi9XYmpSZWRWaGxHMytUd3Y4SXdYbGliZStrTzNBMWsrSWJ3TUhUODRo?=
 =?utf-8?B?ZEpObWs0NUZ2SFRqbFdzVjNmMWhqM1d3eFlxMjVrQ0NZZ1ZEaVE4VUNweWR4?=
 =?utf-8?B?T3pGYVUxbG9iK2NrN2hacmZ0bFdzRWRWWENQL2R0bkhVZWlvTGR1Y1huOVJE?=
 =?utf-8?B?OU1BWHFTSkV3REduTUpGN29lZ1IrbTlNQTJhMjBKYzdzRGFlVVVwb1FjRnpo?=
 =?utf-8?B?REIzMnJrNkZhRDQ4ZlZFajlUNERxV0drTE41K1dLWVdzT1ZrZUlPNVpCQ0M1?=
 =?utf-8?B?eEpOejVwNWlFTGFvL05HUkZyZzV3Z2s1c0dXNGJ0dEQxa1Q5Z3F4QzhPUXJj?=
 =?utf-8?B?RFlLck9GaktWSm5zaW9DMnAyYmZNL0VibHVlWEhwZkRCbVd5dFZXTUU4b1p5?=
 =?utf-8?B?cVRLbEpnWUswVkRxb0hONVFKT2ZYbXhiM3kxalIyN2dyU3p4aThYbllITndU?=
 =?utf-8?B?T0o4YmNucTJlVXczVDRVNzlBWVMyd2d2WEdtTkFsSGVpNnFnTCs1REtGVWlR?=
 =?utf-8?B?TlNWU2NpalR6RFIvTDdGZUpueEUrSGVUQ1p6TTMvU09YRmxEVG9ENFY1Nkhp?=
 =?utf-8?B?QTJOaC9JUlpabTQvNWxWTk40WW5ONkdhTEsvTVV2RTZ2RVZ5bjYxaFJ2QTh1?=
 =?utf-8?B?TmI0V1N1cldEOHVPcDQ5NUo3NXBwM0VkNWxjZVFnODBSMk5VLy8rMU80RDRz?=
 =?utf-8?B?QUttanluMUVUZHpiKzlub1VjdGR5eHZHdUI3WHl3YnZ2MG9nZWJGOThreWtH?=
 =?utf-8?B?MVNHdkNzS1ZHeERTMUJ2M0ZUVS83VVNvVy9udEhOVEVhUXViVDVzdmVzaWY5?=
 =?utf-8?B?NCtLejhlK3lCVE9mSUhXKzNrWjJyZG0ySkxHNjcyUXVhVFZSOFh3Y0xhNURB?=
 =?utf-8?B?WWhFZW5ZM1FIeUdjNnJvc2VSTTdLckJnbUV6RVhsT01jeW5MWHc2b1VQSmRP?=
 =?utf-8?B?SXZ2T1lnK3NaTUhEdzBtb3ZRWDRBTGlVd1F0WTY4bmF0Sk1XQWtlS2RLc0U0?=
 =?utf-8?B?OEl4UlYzdTBZQ1pUWXFtWmhORTJhSmtBaWxvUzZad1BYL3l1Vys1TUJreFE3?=
 =?utf-8?B?MkhKbUE0REtldXNLQjE5czVreVIvbjNFZjZUZHdKYlpxckZLcVhaMGtXZGNm?=
 =?utf-8?B?dkVzck0vd24wbzhwcDVQa3RZWVIyWUVaQWRPRHQzMUNBS3pCZmJ0UTU5MzM1?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4a364a-0e2f-4b34-2f12-08dd4ab3acb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 15:49:31.3108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W+nShLVsHS2PwhTfJJTxOjhQRrrT9L1tRmlQSSMUXojfuRFR8MoAJhx42at6LZae3QFfEId7jeljVTNR2/aHZblahiKSsh2l0rMTQygSnZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10546

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxMSBGZWJydWFyeSAy
MDI1IDE1OjEyDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjRdIGlycWNoaXAvcmVuZXNhcy1yemcy
bDogRml4IG1pc3NpbmcgcHV0X2RldmljZQ0KPiANCj4gSGkgRmFicml6aW8sDQo+IA0KPiBPbiBG
cmksIDExIE9jdCAyMDI0IGF0IDE5OjIwLCBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNh
c3Ryby5qekByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gcnpnMmxfaXJxY19jb21tb25faW5pdCBj
YWxscyBvZl9maW5kX2RldmljZV9ieV9ub2RlLCBidXQgdGhlDQo+ID4gY29ycmVzcG9uZGluZyBw
dXRfZGV2aWNlIGNhbGwgaXMgbWlzc2luZy4NCj4gPiBUaGlzIGFsc28gZ2V0cyByZXBvcnRlZCBi
eSBtYWtlIGNvY2NpY2hlY2suDQo+ID4NCj4gPiBNYWtlIHVzZSBvZiB0aGUgY2xlYW51cCBpbnRl
cmZhY2VzIGZyb20gY2xlYW51cC5oIHRvIGNhbGwgaW50bw0KPiA+IF9fZnJlZV9wdXRfZGV2aWNl
ICh3aGljaCBpbiB0dXJuIGNhbGxzIGludG8gcHV0X2RldmljZSkgd2hlbg0KPiA+IGxlYXZpbmcg
ZnVuY3Rpb24gcnpnMmxfaXJxY19jb21tb25faW5pdCBhbmQgdmFyaWFibGUgImRldiIgZ29lcw0K
PiA+IG91dCBvZiBzY29wZS4NCj4gPg0KPiA+IE1pbmQgdGhhdCB3ZSBkb24ndCB3YW50IHRvICJw
dXQiICJkZXYiIHdoZW4gcnpnMmxfaXJxY19jb21tb25faW5pdA0KPiA+IGNvbXBsZXRlcyBzdWNj
ZXNzZnVsbHksIHRoZXJlZm9yZSBhc3NpZ24gTlVMTCB0byAiZGV2IiB0byBwcmV2ZW50DQo+ID4g
X19mcmVlX3B1dF9kZXZpY2UgZnJvbSBjYWxsaW5nIGludG8gcHV0X2RldmljZSB3aXRoaW4gdGhl
IHN1Y2Nlc3NmdWwNCj4gPiBwYXRoLg0KPiA+DQo+ID4gIm1ha2UgY29jY2ljaGVjayIgd2lsbCBz
dGlsbCBjb21wbGFpbiBhYm91dCBtaXNzaW5nIHB1dF9kZXZpY2UgY2FsbHMsDQo+ID4gYnV0IHRo
b3NlIGFyZSBmYWxzZSBwb3NpdGl2ZXMgbm93Lg0KPiA+DQo+ID4gRml4ZXM6IDNmZWQwOTU1OWNk
OCAoImlycWNoaXA6IEFkZCBSWi9HMkwgSUE1NSBJbnRlcnJ1cHQgQ29udHJvbGxlciBkcml2ZXIi
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6
QHJlbmVzYXMuY29tPg0KPiANCj4gUmV2aXNpdGluZyBjb21taXQgZDAzODEwOWFjMWM2YmY2MSAo
ImlycWNoaXAvcmVuZXNhcy1yemcybDogRml4IG1pc3NpbmcNCj4gcHV0X2RldmljZSIpLi4uDQo+
IA0KPiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yemcybC5jDQo+ID4gKysr
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6ZzJsLmMNCj4gPiBAQCAtOCw2ICs4LDcg
QEANCj4gPiAgICovDQo+ID4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9jbGVhbnVwLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4N
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4N
Cj4gPiBAQCAtNTMwLDEyICs1MzEsMTIgQEAgc3RhdGljIGludCByemcybF9pcnFjX3BhcnNlX2lu
dGVycnVwdHMoc3RydWN0IHJ6ZzJsX2lycWNfcHJpdiAqcHJpdiwNCj4gPiAgc3RhdGljIGludCBy
emcybF9pcnFjX2NvbW1vbl9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwgc3RydWN0IGRl
dmljZV9ub2RlICpwYXJlbnQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBpcnFfY2hpcCAqaXJxX2NoaXApDQo+ID4gIHsNCj4gPiArICAgICAgIHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSBvZl9maW5kX2RldmljZV9ieV9ub2RlKG5vZGUp
Ow0KPiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2IF9fZnJlZShwdXRfZGV2aWNlKSA9IHBk
ZXYgPyAmcGRldi0+ZGV2IDogTlVMTDsNCj4gDQo+IE5vdyB0aGVyZSBpcyBhIHZhcmlhYmxlIGhv
bGRpbmcgIiZwZGV2LT5kZXYiLCBhbGwgYmVsb3cgcmVmZXJlbmNlcw0KPiB0byB0aGUgbGF0dGVy
IGNhbiBiZSByZXBsYWNlZCBieSAiZGV2Ii4uLg0KDQpSaWdodCEgSSB3aWxsIHNob3J0bHkgc2Vu
ZCBhIHBhdGNoIGZvciB0aGlzLg0KDQo+IA0KPiA+ICAgICAgICAgc3RydWN0IGlycV9kb21haW4g
KmlycV9kb21haW4sICpwYXJlbnRfZG9tYWluOw0KPiA+IC0gICAgICAgc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldjsNCj4gPiAgICAgICAgIHN0cnVjdCByZXNldF9jb250cm9sICpyZXNldG47
DQo+ID4gICAgICAgICBpbnQgcmV0Ow0KPiA+DQo+ID4gLSAgICAgICBwZGV2ID0gb2ZfZmluZF9k
ZXZpY2VfYnlfbm9kZShub2RlKTsNCj4gPiAgICAgICAgIGlmICghcGRldikNCj4gPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4NCj4gPiBAQCAtNTkxLDYgKzU5MiwxNyBAQCBz
dGF0aWMgaW50IHJ6ZzJsX2lycWNfY29tbW9uX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2Rl
LCBzdHJ1Y3QgZGV2aWNlX25vZGUNCj4gKg0KPiA+DQo+ID4gICAgICAgICByZWdpc3Rlcl9zeXNj
b3JlX29wcygmcnpnMmxfaXJxY19zeXNjb3JlX29wcyk7DQo+ID4NCj4gPiArICAgICAgIC8qDQo+
ID4gKyAgICAgICAgKiBQcmV2ZW50IHRoZSBjbGVhbnVwIGZ1bmN0aW9uIGZyb20gaW52b2tpbmcg
cHV0X2RldmljZSBieSBhc3NpZ25pbmcNCj4gPiArICAgICAgICAqIE5VTEwgdG8gZGV2Lg0KPiA+
ICsgICAgICAgICoNCj4gPiArICAgICAgICAqIG1ha2UgY29jY2ljaGVjayB3aWxsIGNvbXBsYWlu
IGFib3V0IG1pc3NpbmcgcHV0X2RldmljZSBjYWxscywgYnV0DQo+ID4gKyAgICAgICAgKiB0aG9z
ZSBhcmUgZmFsc2UgcG9zaXRpdmVzLCBhcyBkZXYgd2lsbCBiZSBhdXRvbWF0aWNhbGx5ICJwdXQi
IHZpYQ0KPiA+ICsgICAgICAgICogX19mcmVlX3B1dF9kZXZpY2Ugb24gdGhlIGZhaWxpbmcgcGF0
aC4NCj4gPiArICAgICAgICAqIE9uIHRoZSBzdWNjZXNzZnVsIHBhdGggd2UgZG9uJ3QgYWN0dWFs
bHkgd2FudCB0byAicHV0IiBkZXYuDQo+ID4gKyAgICAgICAgKi8NCj4gPiArICAgICAgIGRldiA9
IE5VTEw7DQo+ID4gKw0KPiA+ICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBDYW4ndCB0aGUgYWJv
dmUgYmUgcmVwbGFjZWQgYnkNCj4gDQo+ICAgICBub19mcmVlX3B0cihkZXYpOw0KPiANCj4gPyBP
ciB3b3VsZCBDb2NjaW5lbGxlIHN0aWxsIGNvbXBsYWluPw0KDQpJZiBJIHVzZSBub19mcmVlX3B0
ciB0aGUgY29tcGlsZXIgY29tcGxhaW5zIHRoYXQgaXRzIHJldHVybiB2YWx1ZSBpcyBub3QgdXNl
ZDoNCg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNh
cy1yemcybC5jOjExOg0KLi4vZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6ZzJsLmM6IElu
IGZ1bmN0aW9uIOKAmHJ6ZzJsX2lycWNfY29tbW9uX2luaXTigJk6DQouLi9pbmNsdWRlL2xpbnV4
L2NsZWFudXAuaDoyMTU6MTU6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhf
X211c3RfY2hlY2tfZm7igJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRf
cmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdDQogIDIxNSB8ICAoKHR5cGVvZihwKSkgX19tdXN0
X2NoZWNrX2ZuKF9fZ2V0X2FuZF9udWxsKHAsIE5VTEwpKSkNCiAgICAgIHwgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQouLi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJlbmVzYXMtcnpnMmwuYzo1OTU6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmG5vX2ZyZWVfcHRy4oCZDQogIDU5NSB8ICBub19mcmVlX3B0cihkZXYpOw0KICAgICAg
fCAgXn5+fn5+fn5+fn4NCg0KDQpDaGVlcnMsDQpGYWINCg0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg==

