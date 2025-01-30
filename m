Return-Path: <linux-renesas-soc+bounces-12751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C937A22D18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 13:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAFBA16773A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87B71BBBCC;
	Thu, 30 Jan 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n8xUUh5b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D17B660;
	Thu, 30 Jan 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738241377; cv=fail; b=bp5adeMLxUY2TDeKsNY8JCqGbiD9iZ/ney9CU/u4ePNILYiwQf+8GUQSbLsEw02yTR75MU/s4+xeRkeZggO0csuKK+894Aq7/K6P/lwYypIgRhRljO3QmIlWsfYvKwaj4bt0t9ahXI9Lbn//WQzpzyMvh7mKTNH/m95YvE4P/eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738241377; c=relaxed/simple;
	bh=3/bxAzZ5PRifHaXNTvwJzWx3mSPeKKKK5kG9prl9z2o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EazFTdK+yu0FXXQNKBBrFfGYmzqVYncKzjRs/szzLzkFhxqrqc8HAGF6Tr4lOMhsbRkJSUG7l3hGjLtaEpoMFk6iPSLZHJ6a1Sl94R1wpFbrs5gbrFlASiluHOk1GXR89AKK03gbATtyXUhtLT7wujq59dXcGuU/sJ9o5EzzqDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=n8xUUh5b; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnBdJ/wkUiOF4eZxcz/XIZg8ccBJFFIcl2fMfUj3AFoiqty42Rur4waGjKYRhfEPHPfwd3EtdrH4O69R5yovJ6U3PeG/XixTTBHVOu7dUgv/02uCHQbGZVUPlCv3OksyKayJsIyZiUSltoopubLziMdojPsR12IDI8VR8M/jRH4JOSQ+b88RVQ3GE2pfCnBP7DBUEYSEqYpA1q+kRcivoEnkdlogLqeIYmGXQAaWWQMHswmqhzsUSedSkGd9pr76386vHBH96V3YbiwN8JAvYs3rrQCWugC0F+c8w/wejUWNnhrxCfQvzzmgTIiwCr+IzlZy5azx8CNEjkgSV/qn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/bxAzZ5PRifHaXNTvwJzWx3mSPeKKKK5kG9prl9z2o=;
 b=AkOC0cBy6bJttNhJcE/8o2U3yLDr+Y/V/JgJi02fk6qf2NMEt9K2Fq1cRENuSBhbbOjfJBKOlpAcjdkSqpwpIo3juQi7pR+E7i/U/ygiM0izon3Y++Eu5+0xePiEzC6/ozDRTfPmkYmiccUmGOQUYDVKdBdQKWGMvbkf2YXIZ4+39u8BQ8jcpTWy2gpAn4Gwpl2OqufLjGtOF7u6AUwXH5XMHZiygfloPl4JE8K5S/gRVxEnNyiunb3cQKFf+ItPygdIMOccU+0RUkdEJyZ2SuVJ7XhpsHeHsCJ/rEnE+C3Alu47qAQ9S+AYuizl+7eS4OEZbz7DtsLFPmAQ+JP5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/bxAzZ5PRifHaXNTvwJzWx3mSPeKKKK5kG9prl9z2o=;
 b=n8xUUh5bcBkZckTF+HCj69To++oRmZnH/A8Mrd33CVbzG0q4GMG09S6m6P0M4dUwlx8MXCJLN9x/emsSUBH5/7pV8RWgzjYALIgISabY8g7Ie6UpCFpg04zkyijhJWWMsbFtp0NAgJtD4L7MXBJ21Dh2xQ9lKLLSlezqKUePhQY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11865.jpnprd01.prod.outlook.com (2603:1096:400:38c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 12:49:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 12:49:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v3 13/13] arm64: dts: renesas: r9a09g047: Add icu node
Thread-Topic: [PATCH v3 13/13] arm64: dts: renesas: r9a09g047: Add icu node
Thread-Index: AQHbcXImLqT4pAylgUmmsetMRDkAQ7MsZE0AgALhlaA=
Date: Thu, 30 Jan 2025 12:49:28 +0000
Message-ID:
 <TY3PR01MB113464FB02458C23E0CE776E486E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
 <20250128104714.80807-14-biju.das.jz@bp.renesas.com>
 <CAMuHMdWvuXNPaN8AW7BMPEh1YBiVvq-xDMNy8AvXiBotCBbkSg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWvuXNPaN8AW7BMPEh1YBiVvq-xDMNy8AvXiBotCBbkSg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11865:EE_
x-ms-office365-filtering-correlation-id: deaf9dde-6777-48bf-c865-08dd412c8896
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmltcVVKZWRlOUxlSXNlVUxqZkE0SGhNSyt6dTJncVZtandXaDJFUldnWFFu?=
 =?utf-8?B?aWdkOWM1TDdkb0pPSXpyVytCeDQ3RzFMUFBwNEV3S1BIOHlTc3krSmk0dFBG?=
 =?utf-8?B?T2RMYmI0MlhQbVpzZENic1dzU3d6UlQxK0J5RER3WHpUT3lxdVliSWFVRFVW?=
 =?utf-8?B?VzdoekNnZ0tTUVdHdkU4czd1ZHR2UFNWemhIR0pjeGNScVJkS1gvQ0VqWHdL?=
 =?utf-8?B?TWNaVWhNTG43SnNhWGNKN1JiTFBCUmtCSFE5dDNxV0t0QzB5YTJIRXJqOGZD?=
 =?utf-8?B?azBrZmtXNWNGMlQvNGFCK0YvNXRIWlBWelpsNU83bE1QTVRTR3M3VHVETHI0?=
 =?utf-8?B?L2F0cURpL3BnejZMQmlzU1Y0NjlTd2g4cys0ZHAvYzhzU3pJd3RmNFFvWTd3?=
 =?utf-8?B?K0Q2V3hyNW9kVTJPYkNFNmloMXFaamdieVVCUyt2OWR6UFBkZ0M3Qm9HRG04?=
 =?utf-8?B?R2tCWko3Q044eXBWUUN6RzNqR3o4bW9qN1VvK1kyZUtaRGt4dTFnNks3cHR1?=
 =?utf-8?B?ZzBnR3RKM1BrZ1ZIU0liV0NJd3VPSmpzWXlic3kzOEJpUkZiN3o2WG5yTmRO?=
 =?utf-8?B?Qi9QK1V5OFIzMTgxQm92RzAyUmt3Nk1sVElQK00xSlBnK1hWN1BuRlFLQ3JD?=
 =?utf-8?B?Vkg3S0xYWVZFRXRXdm1xMEQvTmlQaDcyc282cE03TldUM0hkSzIyTDhBZGFM?=
 =?utf-8?B?REVlc2F0RU95VW9Oc25peWIwTVhZWFlDSjBKSzNHclBWUkloQm5hS3ZTTHps?=
 =?utf-8?B?Y0ZQaHZKR2xBR3lKa2JjTmNYMWhRY2poRWFqT2tsUUFvQUVHVm11QnpGL0NN?=
 =?utf-8?B?VVBvOVVTa1QyS1Q4VkFlNzlQVUg1TnMxR0NZZ3JDYU9maEZSQTluMVBWQ0RW?=
 =?utf-8?B?WStwdklFTTQvUFVNV1B1N2dxUW96ZjNPbmpXMDlacXFrNEpJQjFkZXFoRWpo?=
 =?utf-8?B?YTdQdG5vUk1lOHE4cXRuNVZvWEdtSElTNmJUOEpVa3pjYjNWYStoa0p3TWNp?=
 =?utf-8?B?MWlya0F6eHhObzNidXRzOE5qMkxpUFVkU0MrY1BpdXdrdVBhdGg1SDZVaUVK?=
 =?utf-8?B?TTdjcWl6Qjg4L0hsNUZqZEhoZHppZFU4eUJwQ0ZaRGJldEFoT1cxVDNSNnI4?=
 =?utf-8?B?R2ZqRmJiZ3JUV1dCR3ZRQ1pzdnQzT1FCUGlxemVJWUc1NmxENmU2U2w1OXQ1?=
 =?utf-8?B?YzdRSFROUWdoNWpxYUp6N0VUS3F4U1pSai9DWWdPVHBoNEM0bmo4ZjhEUmln?=
 =?utf-8?B?VGUyVWlyOTNlYXZxalJhUDhqZkttTDVPV0pBUDNpS1ZHR045cjdjZi9ldldR?=
 =?utf-8?B?TUtRMVllOG1mTDFjUWZCbjZKS0ZZV0JOL1VXUERNV21QcVcrWlVVZHhWZnVh?=
 =?utf-8?B?d0V0NTdyRk1JZ01ObmZvK0pXUHR6TUkzZ2U5RHVCTXhSR051VG0rcUZoRjcz?=
 =?utf-8?B?TUZDS014WVExdTAzaXN4THlOYW16VTJRZzdjRmNjaVhsSGhVWWNTczgrRlRy?=
 =?utf-8?B?azZrZ3YwUUE0ZUJqOCs4Qk9lMDB0SG1xcmhDQlVxajJqbllPeW1uOHpOcTZx?=
 =?utf-8?B?OFpJTDcrbVg5MTNjR0lrOEYzaW9MdFo4WCtFL0FHamNGTXhzaXN5anVLeEdW?=
 =?utf-8?B?L0ZlRzUzZmFZQkY2cVBDdW1Melp3Rm9kNFNhVUpyTUxxcTZ6aXU2bEFFTXV5?=
 =?utf-8?B?Mi9mV2hHa2c1R3Q4VE5VeWpPaWVuNzI2bm9uVDducnFKT2g3cWlmWUlybjdj?=
 =?utf-8?B?L2FESm4yODAxL1V5cnFyMzJQTlVlbmoxV09nbHhWNENuMGdMWXNjTzhzdE5Q?=
 =?utf-8?B?MmNBMnJPcjZDMHlIUmFvaVR4VVU5WC9GZHVkcDBDcGpJNnNKTy9CNWJZcDN0?=
 =?utf-8?B?U2IxcW5yaFpleEdlM3Y2RVFtNU5jYWlmRFROS0pQaDhrT1BzSVFPek85UHhY?=
 =?utf-8?Q?no1ECccZ8h5/BWb8Ksj2JfKHxWCRCvfq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3VNQlY4Rnp1KzRHUmo4SVUyTmRKNlRoV1M1Y1JnRlg4OWtJVzRwS293U2E1?=
 =?utf-8?B?bzZCeE01ZDY4eTZvSjhwczNHN2NiQkpDdG1IT3Jjd2dGMTdBYlo0MDZ3M091?=
 =?utf-8?B?S1M0R0hpR05GTnZYMmZJbFB4Q1FpRTJnYk5jRndzb0RUa3VkOHdnQXMwaVp0?=
 =?utf-8?B?K1RRV1l1MlA0cis1YlZXZjFOV2Z0Z25jbVdtb2N6VVdiNmlPYm4vZGp0K201?=
 =?utf-8?B?VXQ2amY0Tk12ZFRhSko4aHpuUCttL0NwOTVJN0ZOZ0lXZ2hySFpRUGpHd0Ri?=
 =?utf-8?B?RCs0YjIxR3FPYXY1TGd4eUFUcVQvVmd1L2dUc0pvZFFmM29qdG1rcSs3Q1V1?=
 =?utf-8?B?bEhxOHNZWW9rUDhieC9CQ2RoSHpsdUlEcnFSWEZjQWszWGhmald6OWkzVGpz?=
 =?utf-8?B?RXhZVUc4YmkrMXUvclBhTGI4bmUxZm9wVzhsYnhraDVuTU1CUmdnRkdVai9P?=
 =?utf-8?B?NFR6b1ZlMlRBOXdYTEhML1dkTHk2ZngyTHNqOHdkTjZjMmdBR2Ftc1ZFTWk1?=
 =?utf-8?B?UVNvckRXcjdyT2FIRHpDcnp1RWdUNC8wYm1QV0RQaXpHV3VxTDFVeTVzczlM?=
 =?utf-8?B?S1FRdjkwQkF0aEdkYS8yYzIzaDNxWjlINmpxVnkrS01PNUt6MW5GMUxxMS9G?=
 =?utf-8?B?RE42QnhZVnI1MVVDYlJoL3JxQURIZ0t1YVIwMkwxMHFtT0tsd2dabDlmQVdx?=
 =?utf-8?B?Nzl0enNvRGI0MXlvUDVQaytOSCtsUnYwbGhGeDBwTWhRbTBqeldoQTRzVnhJ?=
 =?utf-8?B?dGg5OW9wVFdLcWhIYnhDWUx5U3QyVnMvRDY4TlErNVJnR1RGN1ptcEdEUEZ3?=
 =?utf-8?B?Y0ZFZkhvb1BFSFp0TTlyVDJjUHhtRTl6T2hyLzJzMHhoZmlmaFcwMkhzamhS?=
 =?utf-8?B?RVZSd05UMFAvMk1VZjlEeXZlRGNPOENyRFNCNHpzYllzYVdJQ1FNeC9QVGtB?=
 =?utf-8?B?emw3WWVRTFltS1RNczEycm9haTNnZlIzYmdCb2E3QnRCeFhRd0hvdGV2VmFD?=
 =?utf-8?B?aWoxVy9ud3p6MGpMc0Q1NDBEUjk5bzNTSmtSdGNUNzJmdmZtdUI4bWFaT1hJ?=
 =?utf-8?B?cnBBbWhxRnc2YkpwaVRWSmZBZlYzMFRQRjRFZW1XeDBvM0liUndEdzZ6WDRo?=
 =?utf-8?B?d2ZZMno3TW85ZStGMU1DeHY4NGxZaDZoQzRJQlBWRzhxUTREYjhkQ2VCVDdy?=
 =?utf-8?B?ZTNBNGw5REw5OVZQQnlnQWIyYitXWXZoL25Pck1nelBoV1BZenNZR3c3Qk1v?=
 =?utf-8?B?ZzZuUlVhd0ZjTCs3c1JOeS96RDdiUWx4TFNZcXl5NnhyNFBHTWZscUdxc1Vh?=
 =?utf-8?B?bFoxbThlWEwxdXhRNklhZURlM0RaOFUzb2lteTlTUFp4MFpWLzM0NnRLZ1dz?=
 =?utf-8?B?YWZZUCtsTVk4emtjN2FPaFk5Q1VFTjJjMERmOExNMG9vdk16RFJRSFNYelA3?=
 =?utf-8?B?Qi9QQkdSWFNDSUQ2VzI3S0ZSUWl2eWZPbVVRSDh4VWExSFNRSG5pOGkzUTd1?=
 =?utf-8?B?cUFMMzFmVE9qKzJzS0ZPRFYwQUpqZzVIdVc1Q3FidG5PcHVXbE5wN08wbDVk?=
 =?utf-8?B?UkpiNGFucFVjNmNKQUFBL25acjI0MUdEVjNrY3h3N3BVT2ZPT1l1VmYyY2wx?=
 =?utf-8?B?TlRkYnVhMUNNL2c3RTdtMUlUR1NoUDRtcEs2RnUzeVRRSWhFU0t0KzNiVmVk?=
 =?utf-8?B?cDJqNVFXcHptZkZsbTl2YWN6NFIrRVBMTzIybyt6MkZnbm5BREdpWUp3ZXVJ?=
 =?utf-8?B?SEppKytuL2dRTDVMdmp0Uk9VY0lFbTVxSkdkNWQybkplWGZLSkFuWWxKYjZM?=
 =?utf-8?B?ZC85cWhuWXVUa1psTUNWQ1BmdkR0MzV4b3I2TzlLMmhwYkQ1M2VuZldvREdi?=
 =?utf-8?B?cWlzZWN0T1hIb3p6eTRjNkJBaTRJY29qajZRb1N5WmlHaU81aXFvaXN0S0J1?=
 =?utf-8?B?WExDdG8xRXBhaEJoMXdicGVEVWx2TWdOK3ljdlVZMENRZjVBWmkvemdnRDkr?=
 =?utf-8?B?NFZOLzUzYUREWkpJUk0zYytlRjlKQ3pHVVQzOW1KOEhBQUZlMlVWbVFHdWVO?=
 =?utf-8?B?NkxRTThTcHcwWjVSSGkyUU9IZWhuYW50cGNkZnJSbUkxdzJmeDZtdXcySzFI?=
 =?utf-8?B?TWVNMXZ3SEZac0x0dzJMeVkraU40MXhvVjFQWEpFSEJmUWpaWHZ4aUJ6Wm5V?=
 =?utf-8?B?Nmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: deaf9dde-6777-48bf-c865-08dd412c8896
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 12:49:28.2200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIVGROnaKymZ4rlxCE9kv5xr7E9IAu1BWLX4B2pDaZLdnKuVozNQMxlWa25tCccagA43txjWIBYt+NL/iTGTlWRoSrMUVIOkslgNGIV7YyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11865

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNjo0Mg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDEzLzEzXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNDc6IEFkZCBpY3Ugbm9k
ZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMjggSmFuIDIwMjUgYXQgMTE6NDgsIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIGludGVy
cnVwdCBjb250cm9sIG5vZGUgdG8gUlovRzNFICgiUjlBMDlHMDQ3IikgU29DIERUU0kgYW5kIGFk
ZA0KPiA+IGljdSBhcyBpbnRlcnJ1cHQtcGFyZW50IG9mIHBpbmNvbnRyb2wuDQo+ID4NCj4gPiBB
bHNvLCBkZWZpbmUgdGhlIElDVSBJUlFzIGZvciBib2FyZCBEVCB1c2Vycy4NCj4gPg0KPiA+IFJl
dmlld2VkLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWkueHJA
YnAucmVuZXNhcy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAt
LS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiBAQCAtOCw2
ICs4LDI0IEBADQo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHI5YTA5
ZzA0Ny1jcGcuaD4NCj4gPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL2FybS1naWMuaD4NCj4gPg0KPiA+ICsjZGVmaW5lIFJaRzNFX05NSSAgICAgIDANCj4gPiAr
I2RlZmluZSBSWkczRV9JUlEwICAgICAxDQo+ID4gKyNkZWZpbmUgUlpHM0VfSVJRMSAgICAgMg0K
PiA+ICsjZGVmaW5lIFJaRzNFX0lSUTIgICAgIDMNCj4gPiArI2RlZmluZSBSWkczRV9JUlEzICAg
ICA0DQo+ID4gKyNkZWZpbmUgUlpHM0VfSVJRNCAgICAgNQ0KPiA+ICsjZGVmaW5lIFJaRzNFX0lS
UTUgICAgIDYNCj4gPiArI2RlZmluZSBSWkczRV9JUlE2ICAgICA3DQo+ID4gKyNkZWZpbmUgUlpH
M0VfSVJRNyAgICAgOA0KPiA+ICsjZGVmaW5lIFJaRzNFX0lSUTggICAgIDkNCj4gPiArI2RlZmlu
ZSBSWkczRV9JUlE5ICAgICAxMA0KPiA+ICsjZGVmaW5lIFJaRzNFX0lSUTEwICAgIDExDQo+ID4g
KyNkZWZpbmUgUlpHM0VfSVJRMTEgICAgMTINCj4gPiArI2RlZmluZSBSWkczRV9JUlExMiAgICAx
Mw0KPiA+ICsjZGVmaW5lIFJaRzNFX0lSUTEzICAgIDE0DQo+ID4gKyNkZWZpbmUgUlpHM0VfSVJR
MTQgICAgMTUNCj4gPiArI2RlZmluZSBSWkczRV9JUlExNSAgICAxNg0KPiANCj4gRG8geW91IG5l
ZWQgdGhlc2UgZGVmaW5pdGlvbnM/IA0KDQpSWkczRV9JUlEyPSAzLCBUaGUgdXNlciBuZWVkcyB0
byBsb29rIGF0IFRhYmxlIDQuNi0yNCAoIkxpc3Qgb2YgSW5wdXQgRXZlbnRzIikNCm9mIHRoZSBk
b2N1bWVudGF0aW9uIGZvciB0aGUgcGxhaW4gbnVtYmVyLg0KDQpVc2FnZSB3aWxsIGJlLA0KaW50
ZXJydXB0LXBhcmVudCA9IDwmaWN1PjsNCmludGVycnVwdHMgPSA8UlpHM0VfTk1JIElSUV9UWVBF
X0VER0VfRkFMTElORz47DQppbnRlcnJ1cHRzID0gPFJaRzNFX0lSUTIgSVJRX1RZUEVfTEVWRUxf
TE9XPjsNCg0KPiBBbmQgd2h5IGhlcmUsIG5vdCBpbiA8ZHQtYmluZGluZ3MvLi4uPj8NCg0KVGhv
dWdodCBub3QgdG8gY3JlYXRlIGEgZmlsZSBqdXN0IG9ubHkgZm9yIHRoZSBib2FyZCBkdHM/Pw0K
DQo+IFRoZSBzaW1pbGFyIFJaL1YySCBJQ1UgZG9lcyBub3QgdXNlIHN1Y2ggZGVmaW5pdGlvbnMu
DQo+IFRoZSBEVCBiaW5kaW5ncyBjbGVhcmx5IGRvY3VtZW50IHRoZSBtZWFuaW5nIG9mIHRoZSBj
ZWxsIHZhbHVlLCBhbmQgdGhlIG51bWJlcnMgY2FuIGJlIGxvb2tlZCB1cCBpbg0KPiBUYWJsZSA0
LjYtMjQgKCJMaXN0IG9mIElucHV0IEV2ZW50cyIpIG9mIHRoZSBkb2N1bWVudGF0aW9uLCBzbyBJ
IHRoaW5rIGl0IGNhbiBiZSByZW1vdmVkLg0KDQpBZ3JlZWQuIFdpbGwgdXNlIHBsYWluIG51bWJl
ciBpbiBib2FyZCBEVFMgYmFzZWQgb24gVGFibGUgNC42LTI0ICgiTGlzdCBvZiBJbnB1dCBFdmVu
dHMiKS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

