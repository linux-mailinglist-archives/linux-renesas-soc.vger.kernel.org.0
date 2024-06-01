Return-Path: <linux-renesas-soc+bounces-5760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C76588D6EEA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 10:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03326B2174B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 08:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACE11CF8A;
	Sat,  1 Jun 2024 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F1p0oaCg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CAB111AD;
	Sat,  1 Jun 2024 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717231095; cv=fail; b=HJuZw6enEQK1ibfogXGGWzhqXZ4BkcNqrriLKonSrvJdy9Spf6k17Meuqv0C/gijNe+jUTKYKwBGPV8ucyXeA/Zm+qmQKPE7ZEqOfODZosTgYFx3A3+tcmQ9K41hGExosDm9ILSguacdVgulJUQlvY/+qfQHtXo3DdHYjJxqqrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717231095; c=relaxed/simple;
	bh=EjO15f+WXD7iOVJEA/AQBFV1pGl4vXzAXZd7m6JzJh4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kfnB+jTKR071zHYkKJJoX7cWy0ARllG5pzjTFm2IFp85N+2hkGV5bPA7eh5FK1cPpox1sRkOQYp3+DqnP3EFZGXEUsqSPF8GTqEYpd3MgdFJFsAdlpWMIcekYPB6gHQZjoxZeIkK1MY4U6qOubvV5RTADJKqv8xcobingwUOiNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F1p0oaCg; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UybYfV5+eVThez+ZXPTk7dBNKzwPy7+aBDLJUNNzDpGHKppE1j7B3ULEjEJU49JzRQ4UzkIn4JvqBYNpkCHg3Tcw/Bj2zrYHUs//W1sp3Y2i5KVQOCLG0uRe49QSVqWNJ3ws6rWZJO4cvtcVZOMhmIYwY9m9rk3KtLv3GSaXS6hYrl6w+1m37YhM2sPs3ssGiv4c9HWMXKHTKlcyJPcFCk1H5DPyUawvNjwnzS44XCzjJrwVAtZkvm4oF6HqEWWfLLrxZ3/szLGvrogugXs/YId6c9mLWbzqDlvmWkAjGzvwRPQoFLzzt0VxVmqkstE8RXCxX0Oqslwz3RzvObTyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjO15f+WXD7iOVJEA/AQBFV1pGl4vXzAXZd7m6JzJh4=;
 b=S9gl2adaNsl+J47Tuc03CeLHoXKkC6y74vxb4Nc6iPS2/LHQOAwHWjbC0hEdGaxB4BuAQ1nrkA0FrQ/1Vqe3rfEhyso7FhvBpwb7Y8HPp/8zjwRXu0OdY9CfQsVfMhUH98uw/XZ6R2+ilXqCoXnE9M/lutW+IONZ7tT4L4seATSnsPNY92lTYAB6hxNqSLdC5VSfbvnIcWXv+zq2YNww6XbaqPns/T56z5XH5JPoOFqfeHzU8scQTrWQIFaICWyo0zJvMyvJ0XI7QCjuV2XeOygLujiOUMIBYql2dHK/lBTlbyQzsRxJSnXWUtk0aowOyMimxESDDw4WnffKCL87fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjO15f+WXD7iOVJEA/AQBFV1pGl4vXzAXZd7m6JzJh4=;
 b=F1p0oaCgG54NRhgRvMofA6vKQMgVwzbaQlPrW8awF9hV0ds1bbpimbP+eJ2vkxVFrZs37pXY5zpBmxaFT9Fwx8/BE0NTogudHfahme8sZNdCIsjI3OKTBOiugnrL65J8zmOs4czQCqqx3IeP6G3bOIHbS0aTLwK8qep3DOxBsQk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12402.jpnprd01.prod.outlook.com (2603:1096:405:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Sat, 1 Jun
 2024 08:38:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7633.017; Sat, 1 Jun 2024
 08:38:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Russell King
	<linux@armlinux.org.uk>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] clk: Update API documentation related to clock
 disable
Thread-Topic: [PATCH v3 1/3] clk: Update API documentation related to clock
 disable
Thread-Index: AQHaeSSqDRAVqq/5eEyHFotaY0RL47E+F8wAgHTt8zA=
Date: Sat, 1 Jun 2024 08:38:08 +0000
Message-ID:
 <TY3PR01MB11346918C91A6C21154D86DA986FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
 <20240318223848.GR13682@pendragon.ideasonboard.com>
In-Reply-To: <20240318223848.GR13682@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12402:EE_
x-ms-office365-filtering-correlation-id: 17a70e7b-6d15-4292-e327-08dc82162a39
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDZsQ2crYWQrVU4rdkMzb1QrYVF5RFpTbTlwa0NQUnFuTmFWN2tneXh3QWlP?=
 =?utf-8?B?KytmNEdXZ1MwL2hoUExYUDVBT2FUMWkrZEs5d2dPRUFjeExSTE9CL3pSaGVo?=
 =?utf-8?B?WWlsVGljREJka3dPSUlhVXZvNTI3U1ZPbUNscDN5a2xXU2k1SkVEVTBLb052?=
 =?utf-8?B?MHBFQ3VWeWV3WDJNWm5IWnNnV0E5amJyc0MrMHYxYklxV2lSSE9BSGpOQ0pt?=
 =?utf-8?B?bytiRHg3MnBrdHF1WDl1R1kycG1PbHIvMnZscTZSQ0ZtQXRhYWVHSUt0KzJN?=
 =?utf-8?B?Rys1dXY0aFpIZ0xmMGhLbW94TEEwNjhDdTZRaGdwWFJsc1pJRXZvbWRiVGsy?=
 =?utf-8?B?OVJLU1JoSzZOeUNDOThQaW1Hb1NaRW4yWTBNRlp6L010VW5RYVhhVGtUVVJC?=
 =?utf-8?B?d0xucmI1blFNTitOeVd3QXQwYVRDbzQ3dG0rNndvMWl2NnNDd1R3RTE0Z3hq?=
 =?utf-8?B?bWkyTXBWOWxmZnZPNGJ1RUxPT21JVVZyQVg0QkxDZFVHTlhNQlFybnkvTk5i?=
 =?utf-8?B?VDluOXNTeHNJT3BldXVNQmx1em1MZFZTaGlWRTA2RHI0RmNsdU5XbGFBWEFL?=
 =?utf-8?B?ZjZlaHJCWlV6VGtJV2orb1p5Ry9uTk40UGFrZmF0cG5zSmRKNVJMR2JNV1Q3?=
 =?utf-8?B?dmZLbUlEWktNVlhVOUZ4NXNTdTV6eHNtSUZOUjI3K28zVkhWNEJyR00xZk4r?=
 =?utf-8?B?V3RTdy91KzZNbjFLOE55RkIvT3lkTHZ3ZWswQXBMcDd1ZkpaL2EwaEZ4djVm?=
 =?utf-8?B?S0w3V1E0STIxTjg4ckI3ZWlHVUhoQVE4RkNUS05DanNveTNJT3JXYlVYVkFI?=
 =?utf-8?B?MWpSMlJmOVB1K0dVeG00NlA2V25nVVBwc1NSYUo3SHhYaWFpQjFXRTQxV3dh?=
 =?utf-8?B?YzRPRGgwVjJmKzh2dmphVHJraEFpUjJHOWtpWEg2dXpIR2dYTVljeElWVERQ?=
 =?utf-8?B?V1huZUFJcFl3aEc5UFV5YWRNQ25iL1lWL3lLclh3LzlZd284aTVQYmd1RVhz?=
 =?utf-8?B?TWJxeHJRY2t6MnhsemltVGlrMmRaTEVZaW85SjBDUmhWem41ZlhvSUszdkpQ?=
 =?utf-8?B?azFKYlVRVDIrM0ZiMVk1M21kYytTUnpFNVNJRnh0KzNnM2N4dWVlWG5QNDJV?=
 =?utf-8?B?T0gvQUlaN0RtOXc5QVlKK0RHNllFQUxxQWo3SEVZN0sveDRzQW5jUktpL3hw?=
 =?utf-8?B?cjlIWjdUSWp4NENWVm9YMkFkTmZzUmNzd0hLUVE0Uitob1k4WU5TYzN2REU1?=
 =?utf-8?B?NGRvTzRNSFR6WkhONFlzYzNFeXJid2laRWxaVjREbEUrMkdhZ25tSEJKZlBz?=
 =?utf-8?B?Z1ZXaEVnVm9iN1lFT3VPeGcyL0x2ak9lV1l2NGdPWmVsaVAybjhuVkV0WGtn?=
 =?utf-8?B?RFU2UTJnWEgyb0FVdi9tV3l0cDVPQWJoRXFFMDA4MmlDd2E3blhZUnZteTdI?=
 =?utf-8?B?SHlid1g0NDcrMGJjbjF3QjV3N3ltVmMrL0pRbUxaMUtQMUlvb2ROeUVsc0tt?=
 =?utf-8?B?VkhjVXRWdm1WekJEUmJteDFrZldPaVpVdForMkhiWDViWit6eklQVUR0cXJw?=
 =?utf-8?B?VlZwZjEwWDhTUW1Uay9mblczWk1Cd21IMVNxNU5UcW5jb21pWER6OGd3MGE0?=
 =?utf-8?B?bGl0NEhRWHpqQm9sUFJFVFBPSlBCcExUWDRodldNOWlTcXJnd01vNW4vb0Z2?=
 =?utf-8?B?U0VKMXFNdGlPMzV2TGFEL25FcXlUT3ltRnlNTXljbnhSRHBQUVJXZVRXSFFs?=
 =?utf-8?B?TW5yVGt6cEQ5OTk5Y1IvUUxKMEI5a0owb3JMNmU3TXl3R0wyN0xXMjdTVkpW?=
 =?utf-8?B?WFBBMnB5T0lJMGVjQnhrUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0R2dnllUU80K2VaUjNvOXBOemFyT2ZwdnpCZ0o3WStlWUFKbXljL2hjamEv?=
 =?utf-8?B?VElRMnUvMjhvVHZERGF6NEJmY0cvUGdzN0l5dGhMVExrVEhMZXIrOHhkdXVL?=
 =?utf-8?B?UFhzZnppbEhLNkhMRWJ3RW9SNGlySmFMTjlLWlErQ1o1SHB2dFdhMHdIQ25a?=
 =?utf-8?B?SlFKbERaOFlnQjRYRHNRQnV0S3RvLzhtR0hWb0VDZ255VTBmdHd4TnU5dlFD?=
 =?utf-8?B?S0lQZXlBektBd1lVSmd3aGFwOTNuNFZzbXd1QjkzOHJ2WUhteHR0eWRxTHFY?=
 =?utf-8?B?VmluYnZnczQ1Y09UN1VxU3pSSE9HQVVQa0dLNisvZ0FIS09ZMjRxUDQ5NTJh?=
 =?utf-8?B?Rjlla3NzZlQ0Tm9oRkhoU3llSnB5d0Q4cTJuWm9XbTBHMDQ2dDZGWTFYNXFK?=
 =?utf-8?B?WEZlbjBpZHQ1UjlBN1ZZWVZUaVBZeHdHSWtxbWpvS0M3R3lIQXVhVzg2TVV0?=
 =?utf-8?B?aVAwUkN1dWY0VFdoWkNqSFYySGUxYjFxTlpvWTVmRXZiUDNWdnV5dGNyV3dF?=
 =?utf-8?B?c0dpaXVPV0ZjTnhUd0k3TmNHcWg5dUw4MlJLTUEzZE5Kd1VVckJHcmFEUkFN?=
 =?utf-8?B?QjhlMGFDaW1kaFhnbVRmUm9SbHdCbzIzdnhNdll3TWVUMHA1dnQ1ZzhHNlNZ?=
 =?utf-8?B?UHRVc1J1TjhOWUJjVnBHenA3RHp5OU9zSjc2YWFEbnZBT2hWVFZUWTEvUHE3?=
 =?utf-8?B?QndwSHF0OFZpblV4ZWhhU2I0bVhjQkp2MXdJeEFuWGo5NmIxTzlCZy93NGVm?=
 =?utf-8?B?ZUFZRlh6T0UvT0ZCTnpFZEh1TWdpVUtYK3VaclRzd2taWmlDd1Y0Ym92cDVi?=
 =?utf-8?B?TURZeEpjVE5Gd3JBYktEV2QwRmpRZzUxN05UZjNTRmVwRVRQQW5Vb1gyUmdQ?=
 =?utf-8?B?VkIxck1mMnFoRzI3ODV4WVZ5MTRSSW1xRU1zanZhZmU0N0U5SElIWmNVUkFP?=
 =?utf-8?B?alBnWXMwSmF6RFlZOFUrUU9wem8vL3J3dmdUWlRqa1kvN2VmbHVud21TWERz?=
 =?utf-8?B?TnJUQkMxSjQ1aVAwekZNKzg3dFdSaGFNNE1DZXJISXpneVdFNEYyNnVCN1pF?=
 =?utf-8?B?dUhHa0tMSDN1dlViK1NMV0F2Zm9MdVNrSUpKaWQwZ1ZlbHRVZ3M4WmhYVXIr?=
 =?utf-8?B?MzJsT0V0M3cwNUd1ajdTbUFCdmY5TDFzWklOQTVmV3lNU0E2MjZiUFVmUzZm?=
 =?utf-8?B?cVZQTEZSbGZ5K2NNYnNBbFcwc0ExMkRHclVUcnhQZ3NRWjVtQmprTUVCQXpN?=
 =?utf-8?B?emNzT1piQnYraWl5RUpBdGgvNTVUR2pLTWdhZ00rYUpvYUR5WVcrL3VSb2ls?=
 =?utf-8?B?Q1ZRMnhqdE9GUWY0ZlFHUGFQdkhzWFRvWENuUVpaTVF0NWExblFMMnhSM2lF?=
 =?utf-8?B?QUlyYWZhQXNITi8xVGk2UDFlZCtpRjJvS0JKT1k4T2ZkOG1VZFJrNzFDb3gw?=
 =?utf-8?B?N3c0K1l3eXdSU0E4UldzTFlQN2sxR0RkdGVRaHIrOHpUZlBNYURucU1uZEVj?=
 =?utf-8?B?ZDJ2YnhpNEdoeXNjL3ZhM1dYeVVBbzJXSTFJanlORkFuK205bVpieU4yV0NK?=
 =?utf-8?B?QUdOQytSWkVKZjBoaFZUNHBqVWVoYnhFMUlLTng5bUdIaFdDNGJ3MzlHakp6?=
 =?utf-8?B?N3l1d3FnenEvdGFLSktxeGVVcHBWYkxJbjJyYmR3Y0RtMkhBamlWUHdmdmh0?=
 =?utf-8?B?UlNaVXE5UlNQdDVQK09jc3V3S2hWYkpjMXkvSVVoai9QT0l6Wkd0N1NaSStu?=
 =?utf-8?B?bGFjWEpjdEt2elcrMDZZSWEyZDdtZXo5NFI3cU1kTE5KcDlrTW90ZjlMMDJp?=
 =?utf-8?B?dkRZR3BlQTJGWHhKOEtDOGZKS1ZaU1hqdEp6SnBwTjU1RUluTFVnMjJlVnQ1?=
 =?utf-8?B?WndFTjZQMmpRa2Z2ejBkVGI3aDMvd29ja1htclZ0UVVESHowakFMK2VaMVc1?=
 =?utf-8?B?a3hOVzg1djBiVGVwcFJRaUVJVXJ3d2N5bXFCOVVSVXgzd2RNY1FpdElHMlli?=
 =?utf-8?B?Q1lNUm5JME96SVp0ZWcvRDlrQk12UVpFeWozYnBiNmJOOGIzeTBEcURiQmFW?=
 =?utf-8?B?bDkra0YveTQ3WXFmTXU5Tk5xR3dNS0FybjFMWmF3d1BWcDBocm9mdThtTEJD?=
 =?utf-8?B?WXdsd005N0xqUWZ3TnpEd1lROXJRRHA1NWxyc05QazhrYkdVZHlDZm5WYkJ3?=
 =?utf-8?B?OUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a70e7b-6d15-4292-e327-08dc82162a39
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2024 08:38:08.8966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XyagoHi4BFJRcqj3xU3N3OL86Yjptkmj3kRGGcK/qwzt1g+bCr6Fpb9/dz2XJY6mZhtV7PJ5D+q54Xy65UQwGT5PV22z4kohqBjCGg/V54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12402

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBNb25kYXksIE1hcmNoIDE4LCAy
MDI0IDEwOjM5IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMS8zXSBjbGs6IFVwZGF0ZSBB
UEkgZG9jdW1lbnRhdGlvbiByZWxhdGVkIHRvIGNsb2NrIGRpc2FibGUNCj4gDQo+IEhpIEJpanUs
DQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIE1vbiwgTWFyIDE4LCAy
MDI0IGF0IDExOjA4OjQwQU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+DQo+ID4gVGhlIEFQ
SSdzIHJlbGF0ZWQgdG8gY2xrIGRpc2FibGUgb3BlcmF0aW9uIGRvZXMgbm90IGV4cGxpY2l0bHkg
c3RhdGVzDQo+ID4gdGhlIHN5bmNob3Jvbm91cyBvciBhc3luY2hyb3VzIGJlaGF2aW91ciBhcyBp
dCBpcyBkcml2ZXINCj4gDQo+IHMvc3luY2hvcm9ub3VzL3N5bmNocm9ub3VzLw0KDQpPSyB3aWxs
IGZpeCB0aGlzLg0KPiANCj4gPiBkZXBlbmRlbnQuIFNvIG1ha2UgdGhpcyBwYXJ0IGNsZWFyIGlu
IEFQSSBkb2N1bWVudGF0aW9uLg0KPiANCj4gWW91IG5lZWQgdG8gZXhwbGFpbiB0aGUgcmF0aW9u
YWxlIGhlcmUsIHdoeSBhc3luY2hyb25vdXMgYmVoYXZpb3VyIGlzIHByZWZlcnJlZC4NCg0KT0su
IEJlY2F1c2UgaXQncyBub3QgaW1wb3J0YW50IGZvciBmdW5jdGlvbmFsaXR5IGFuZCBtb3Jlb3Zl
ciBzb21lIHN5c3RlbXMNCkl0IGNhbiBlbnRlciBzbGVlcCBzdGF0ZSBxdWlja2x5IGFuZCB0aGVy
ZWJ5IHNhdmluZyBwb3dlci4NCg0KSSB3aWxsIHVwZGF0ZSBpdCBpbiBjb21taXQgbWVzc2FnZS4N
Cg0KPiANCj4gPiBTdWdnZXN0ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjItPnYzOg0KPiA+ICAqIE5vIGNo
YW5nZS4NCj4gPiB2MjoNCj4gPiAgKiBOZXcgcGF0Y2guDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Y2xrL2Nsay5jICAgICAgICAgICAgfCAzICsrLQ0KPiA+ICBpbmNsdWRlL2xpbnV4L2Nsay1wcm92
aWRlci5oIHwgMyArKy0NCj4gPiAgaW5jbHVkZS9saW51eC9jbGsuaCAgICAgICAgICB8IDMgKyst
DQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay5jIGIvZHJpdmVycy9jbGsvY2xr
LmMgaW5kZXgNCj4gPiAyNTM3MWM5MWE1OGYuLmY1ZmE5MWEzMzlkNyAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2Nsay9jbGsuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay5jDQo+ID4gQEAg
LTEwMTAsNyArMTAxMCw4IEBAIHN0YXRpYyB2b2lkIGNsa19jb3JlX3VucHJlcGFyZV9sb2NrKHN0
cnVjdCBjbGtfY29yZSAqY29yZSkNCj4gPiAgICogaWYgdGhlIG9wZXJhdGlvbiBtYXkgc2xlZXAu
ICBPbmUgZXhhbXBsZSBpcyBhIGNsayB3aGljaCBpcyBhY2Nlc3NlZCBvdmVyDQo+ID4gICAqIEky
Yy4gIEluIHRoZSBjb21wbGV4IGNhc2UgYSBjbGsgZ2F0ZSBvcGVyYXRpb24gbWF5IHJlcXVpcmUg
YSBmYXN0IGFuZCBhIHNsb3cNCj4gPiAgICogcGFydC4gIEl0IGlzIHRoaXMgcmVhc29uIHRoYXQg
Y2xrX3VucHJlcGFyZSBhbmQgY2xrX2Rpc2FibGUgYXJlDQo+ID4gbm90IG11dHVhbGx5DQo+ID4g
LSAqIGV4Y2x1c2l2ZS4gIEluIGZhY3QgY2xrX2Rpc2FibGUgbXVzdCBiZSBjYWxsZWQgYmVmb3Jl
IGNsa191bnByZXBhcmUuDQo+ID4gKyAqIGV4Y2x1c2l2ZS4gIEluIGZhY3QgY2xrX2Rpc2FibGUg
bXVzdCBiZSBjYWxsZWQgYmVmb3JlDQo+ID4gKyBjbGtfdW5wcmVwYXJlLiAgVGhlDQo+ID4gKyAq
IHN5bmNocm9ub3VzIG9yIGFzeW5jaHJvbm91cyBjbG9jayBnYXRpbmcgb3BlcmF0aW9uIGlzIGRy
aXZlciBkZXBlbmRlbnQuDQo+IA0KPiBJZiBzeW5jaHJvbm91cyBvcGVyYXRpb24gaXMgbm90IGd1
YXJhbnRlZWQsIHRoZW4gaXQncyBhc3luY2hvbm91cy4NCj4gQXN5bmNocm9ub3VzIGRvZXNuJ3Qg
bWVhbiBzbG93LCBldmVuIGFuIGFzeW5jaHJvbm91cyBwcm92aWRlciBjYW4gY29tcGxldGUgdGhl
IGRpc2FibGUgb3BlcmF0aW9uDQo+IGJlZm9yZSB0aGUgZnVuY3Rpb24gcmV0dXJucyB0byB0aGUg
Y2FsbGVyLiBBbGwgaXQgbWVhbnMgaXMgdGhhdCB0aGVyZSdzIG5vIGd1YXJhbnRlZSBvZiBzeW5j
aHJvbm91cw0KPiBvcGVyYXRpb24uIEkgd291bGQgZG9jdW1lbnQgaXQgYXMgc3VjaDoNCj4gDQo+
ICAqIFRoaXMgZnVuY3Rpb24gaXMgYXN5bmNocm9ub3VzLCBpZiBtYXkgcmV0dXJuIGJlZm9yZSB0
aGUgY2xvY2sgcHJvdmlkZXINCj4gICogY29tcGxldGVzIHRoZSB1bnByZXBhcmUgb3BlcmF0aW9u
Lg0KPiANCj4gSG93ZXZlciwgYmVsb3cgeW91J3JlIGFkZHJlc3NpbmcgdGhlIGRpc2FibGUgb3Bl
cmF0aW9uLiBEaWQgeW91IG1lYW4gdG8gcGF0Y2ggdGhlIGRvY3VtZW50YXRpb24gZm9yDQo+IGNs
a19wcmVwYXJlKCkgaW5zdGVhZCA/IE1ha2luZw0KPiBjbGtfdW5wcmVwYXJlKCkgYXN5bmNocm9u
b3VzIHNlZW1zIGEgYml0IHdlaXJkLCBnaXZlbiB0aGF0IHRoZSBmdW5jdGlvbiBtYXkgc2xlZXAg
YW5kIGlzIGV4cGVjdGVkDQo+IHRvIHRha2UgbW9yZSB0aW1lLg0KDQpUaGlzIHBhdGNoIGFpbWVk
IGF0IHRoZSB1bnByZXBhcmUvZGlzYWJsZSBmdW5jdGlvbmFsaXR5Lg0KDQo+IA0KPiA+ICAgKi8N
Cj4gPiAgdm9pZCBjbGtfdW5wcmVwYXJlKHN0cnVjdCBjbGsgKmNsaykNCj4gPiAgew0KPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Nsay1wcm92aWRlci5oDQo+ID4gYi9pbmNsdWRlL2xp
bnV4L2Nsay1wcm92aWRlci5oIGluZGV4IDRhNTM3MjYwZjY1NS4uNWI0OTMwMjRlMWVjIDEwMDY0
NA0KPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvY2xrLXByb3ZpZGVyLmgNCj4gPiArKysgYi9pbmNs
dWRlL2xpbnV4L2Nsay1wcm92aWRlci5oDQo+ID4gQEAgLTExMyw3ICsxMTMsOCBAQCBzdHJ1Y3Qg
Y2xrX2R1dHkgew0KPiA+ICAgKgkJc2xlZXAuDQo+ID4gICAqDQo+ID4gICAqIEBkaXNhYmxlOglE
aXNhYmxlIHRoZSBjbG9jayBhdG9taWNhbGx5LiBDYWxsZWQgd2l0aCBlbmFibGVfbG9jayBoZWxk
Lg0KPiA+IC0gKgkJVGhpcyBmdW5jdGlvbiBtdXN0IG5vdCBzbGVlcC4NCj4gPiArICoJCVRoaXMg
ZnVuY3Rpb24gbXVzdCBub3Qgc2xlZXAuIFRoZSBzeW5jaHJvbm91cyBvciBhc3luY2hyb25vdXMN
Cj4gPiArICoJCWRpc2FibGluZyBvZiB0aGUgY2xvY2sgaXMgZHJpdmVyIGRlcGVuZGVudC4NCj4g
DQo+IEFzIHRoaXMgaXMgdGhlIGRvY3VtZW50YXRpb24gdGhhdCB0YXJnZXRzIGNsb2NrIHByb3Zp
ZGVycywgSSB3b3VsZCBleHBhbmQgaXQgYW5kIGV4cGxhaW4gd2h5IGENCj4gcHJvdmlkZXIgbWF5
IHdhbnQgdG8gbWFrZSB0aGUgZGlzYWJsZSBvcGVyYXRpb24gbm90IHN5bmNocm9ub3VzLg0KDQpX
aWxsIGV4cGxhaW4gaGVyZSBhcyB3ZWxsLg0KDQo+IA0KPiA+ICAgKg0KPiA+ICAgKiBAaXNfZW5h
YmxlZDoJUXVlcmllcyB0aGUgaGFyZHdhcmUgdG8gZGV0ZXJtaW5lIGlmIHRoZSBjbG9jayBpcyBl
bmFibGVkLg0KPiA+ICAgKgkJVGhpcyBmdW5jdGlvbiBtdXN0IG5vdCBzbGVlcC4gT3B0aW9uYWws
IGlmIHRoaXMgb3AgaXMgbm90DQo+IA0KPiAuaXNfZW5hYmxlZCgpIHNob3VsZCBiZWNvbWUgbWFu
ZGF0b3J5IGlmIC5kaXNhYmxlKCkgaXMgbm90IHN5bmNocm9ub3VzLg0KPiBUaGUgcmVsYXRpb25z
aGlwIGJldHdlZW4gdGhlIHR3byBvcGVyYXRpb25zIHNob3VsZCBiZSBiZXR0ZXIgZXhwbGFpbmVk
Lg0KDQpJIHdpbGwgdXBkYXRlIHRoZSBjb21tZW50IGhlcmUuDQoNCj4gDQo+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvY2xrLmggYi9pbmNsdWRlL2xpbnV4L2Nsay5oIGluZGV4DQo+ID4g
MDA2MjNmNGRlNWUxLi44NGIwMjUxODc5MWYgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51
eC9jbGsuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvY2xrLmgNCj4gPiBAQCAtNjgxLDcgKzY4
MSw4IEBAIGludCBfX211c3RfY2hlY2sgY2xrX2J1bGtfZW5hYmxlKGludCBudW1fY2xrcywNCj4g
PiAgICogQGNsazogY2xvY2sgc291cmNlDQo+ID4gICAqDQo+ID4gICAqIEluZm9ybSB0aGUgc3lz
dGVtIHRoYXQgYSBjbG9jayBzb3VyY2UgaXMgbm8gbG9uZ2VyIHJlcXVpcmVkIGJ5DQo+ID4gLSAq
IGEgZHJpdmVyIGFuZCBtYXkgYmUgc2h1dCBkb3duLg0KPiA+ICsgKiBhIGRyaXZlciBhbmQgbWF5
IGJlIHNodXQgZG93bi4gSXQgaXMgbm90IGd1YXJhbnRlZWQgdG8gZXZlcg0KPiA+ICsgYWN0dWFs
bHkNCj4gPiArICogYmUgc3RvcHBlZCwgdGhhdCB3aWxsIGJlIGRyaXZlciBkZXBlbmRlbnQuDQo+
IA0KPiBUaGlzIGlzIHRoZSBkb2N1bWVudGF0aW9uIG9mIGNsa19idWxrX2Rpc2FibGUoKSwgeW91
IHNob3VsZCBhZGRyZXNzDQo+IGNsa19kaXNhYmxlKCkgdG9vLiANCg0KVGhpcyB1cGRhdGUgaXMg
Zm9yIGNsa19kaXNhYmxlKCkuIEFtIEkgbWlzc2luZyBhbnl0aGluZz8NCg0KPiBJJ3ZlIGp1c3Qg
bm90aWNlZCB0aGF0IGJvdGggZnVuY3Rpb25zIGFyZSBkb2N1bWVudGVkIGluIHR3byBwbGFjZXMs
IGluDQo+IGluY2x1ZGUvbGludXgvY2xrLmgsIGFuZCBpbiBkcml2ZXJzL2Nsay8uIEkgd29uZGVy
IHdoeSB0aGF0IGlzLiBJdCBzb3VuZHMgbGlrZSBpdCBzaG91bGQgYmUgZml4ZWQsDQo+IG9yIHlv
dSdsbCBoYXZlIHRvIHBhdGNoIGJvdGggZG9jdW1lbnRhdGlvbiBibG9ja3MuDQoNClNha2FyaSBh
bHNvIHBvaW50ZWQgb3V0IHRoZSBzYW1lLCBoZSBzdWdnZXN0ZWQgdG8gcmVtb3ZlIGl0IGZyb20g
LmMuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gVGhlcmUncyBhbm90aGVyIGlzc3VlIHRoYXQg
SSdsbCByYWlzZSBpbiB0aGUgcmV2aWV3IG9mIDIvMy4NCj4gDQo+ID4gICAqDQo+ID4gICAqIE1h
eSBiZSBjYWxsZWQgZnJvbSBhdG9taWMgY29udGV4dHMuDQo+ID4gICAqDQo+IA0KPiAtLQ0KPiBS
ZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

