Return-Path: <linux-renesas-soc+bounces-14675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09CA6A309
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 10:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E444B19C0543
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Mar 2025 09:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558262066F7;
	Thu, 20 Mar 2025 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KerhpbwB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E314A1D;
	Thu, 20 Mar 2025 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742464605; cv=fail; b=CCCfYf/bIJbk5XKmEucBNP8/zyVRbUQQhIkgwawPeI0PKZWe5GkO4fwLEmLV4g7jz5SJNYdQGNJdamf8E0mv6+G3huPgT9QGEobOPiLd21QaPLp31Zhq1ebZCDO/tAwd0oIQbWu1+3o/zpeHZ5Ng/j+9d3WmiLjkM2/8nkai/ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742464605; c=relaxed/simple;
	bh=WOw+r1W/vS05F/5+KZ9nIozx3yFpU4wnbM/Q1HtGeZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cRV9AU3Lr5Biu8WlBNBOGWYV7P0PeoHsk34tuPanr7Zzr27NHl+wzERe6TUrEjZp2bX8xs5SV2mCm1LcWbkYjWM3Y0XNdMeU9J7pMC6KYQJ/2+1pWxP96wlVuIXpfb5cdhlBcJeoFdezfhXefSCOuQRbbucwDrE2r9dzjl3Wa18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KerhpbwB; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKA7L66jsFcrwsxDAbIvrzzlfO1m0i8jcu5CMtEU6Y9gKJvtw3xNEVsk3BaedBJ14ER0Ms+6+YDHZJfP5jt38k1MaMWVqhhdYCBX3cpPN0baz9Wt6teOT9hYkqoHOhIEMTGevwj1BbLcry/90ta/5VyDxg3C09jEKnnllJuE/m8SgdBG5Z6/JaBCdrVR9d53zVMDEmQSBjtYf07vq7eSERFoqhBFTmOpCaQLupC+ZPeU1ELG0hvCe7QhDvGDixgGJ6joK/02s7VgTZYV8130YJQsEUwvgTtp8K/QnmU8XM3dfnL35mVf+1/s4Y/8sEYbbDFoWqWf147IYPDPwlGgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOw+r1W/vS05F/5+KZ9nIozx3yFpU4wnbM/Q1HtGeZI=;
 b=vP7QOYFiwxrSMNok51OGYPGABvxNKE5nyfaVzi1uz2zkjd2pqVKoanuy8FyfnIyMepgOpvghDcmHC899lRjeNicW6B0zX5utFk6S0tfn111Geec4mgLsN3jh1XV+5FyFukfkTLd9Dv4YGZb1IHSLG7jsIloU/25Ny8oy9b4f5+Gd8zqYB13j29TT2akxysEkMLpSAPX4ypG0znaCPTgDyXFTSpeUfqNbGNoxw5XX9g1Z7inh+Nef0iDODKo2aPtTxxAzK1EztT03cq1WcgHcpjvqCoq//PlX2is8MY3/5/WboAOi0Qiv66xEaUhChGzwLp6We92RO0SGAN+ySnLezQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOw+r1W/vS05F/5+KZ9nIozx3yFpU4wnbM/Q1HtGeZI=;
 b=KerhpbwBylBblnVRb1aW01SssRzQc83/vAryy6Js4ou6AozLJNK0sE+Xpdj8PKWiP7kVt6G7SG+i9yA6Pcwjy53wxYrQsS6OUyVsWdMl1qzzb8fAPirUFkLEXC8sA5x0vJN7OZFMfs3k8xYiUrGEksDG81cGott+kLN5BRAptrI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8839.jpnprd01.prod.outlook.com (2603:1096:400:16e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 09:56:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 09:56:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/4] clk: renesas: r9a09g047: Add XSPI clock/reset
Thread-Topic: [PATCH 4/4] clk: renesas: r9a09g047: Add XSPI clock/reset
Thread-Index: AQHbjCwY5rxAgO08dEmG8/sKWXb5ebNmNBMAgBWwGKA=
Date: Thu, 20 Mar 2025 09:56:37 +0000
Message-ID:
 <TY3PR01MB11346470A93F3A22E7C8FE39086D82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
 <20250303110433.76576-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdWof-HMkNjLM-a3VsToUQk5aBULLQBkdkMXq3djoBct+w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWof-HMkNjLM-a3VsToUQk5aBULLQBkdkMXq3djoBct+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8839:EE_
x-ms-office365-filtering-correlation-id: 7a4b175a-8a5a-4bda-90c3-08dd6795813f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bFQ2UnhaVXU4ZnBWa1dDd3NIcm5YeDQxeXRELy9tdDVKTS9rRERMbnlwMmhY?=
 =?utf-8?B?TDJsTUowSHdvQlhvRDFSUUtjenl1ZnFDMjBVMTJTNGk3QXhoMkI2QWg4U05m?=
 =?utf-8?B?dU4xbm9ONDZFK1BiaXpMeXRvYmNIU1p5TEg4bElIRWcyOW1MTmd4RmY0SVVI?=
 =?utf-8?B?Rm5SMEJ1d1VkbHJiMkhPVkU0bFJHVmdXbzlMaURIbzN3YkllcndkSUplOHJj?=
 =?utf-8?B?UGtuMTQyZmUwZ3lMc1I1TkEyQmJ2TE55SzhVOHpIQlN1NG5RQzdsL1pIeXc4?=
 =?utf-8?B?bUNSbUdhWW1FM1Z1SWZ0KzY3bVZQQTZ4Ti9EK2VpNmhVMlpnTmRNaXdScjhP?=
 =?utf-8?B?b2xZUnBvU0gwSHE5R0ZuQTNyMUhvVnNJdjBSOTVOQnpTRVNRM2I1QThtQlFw?=
 =?utf-8?B?a0FEandxcDltSG1tTGI2NmswTU53QVdXbGFuenFFYU9YdnZNdkl1UlNuSEp2?=
 =?utf-8?B?bzkvMVVNT2F2RHBKYWxIenVMMUR5bHBhb3lWK3pYK2NiOEJCQzNPYUdXR2tT?=
 =?utf-8?B?WFRGSk1DT21jSlB2cnFSQmpnaThtSDFjejhEeWJ2OTBDUjhoeit6RTJpYkti?=
 =?utf-8?B?bFFuVVljTzJ6c3pnVXdDNE5MR1kxWFlaTDBvek45dGdDam81dDZmSUIzVzlM?=
 =?utf-8?B?N253akc4N0d2OXNxb0JFTmgxeWM2STI1alJmNE1ScVRCM2pyOVFBSU1iRjU4?=
 =?utf-8?B?RGpHbHNwTDI0bnZlRGs1dFpONUpiN211UmxZZ2JWZElYeDkrbXhobDhnbCt1?=
 =?utf-8?B?WXd4TGVTc3pvR05tWkFvakpmUDBzRzc1dGJhUHF4WThEcnpJdlc5QlM1TnBY?=
 =?utf-8?B?NkZLUG02cWxtc1Z2dWx6bTFyQ2hrUTNoK0dXbHFRZUlHSkNwN1UybmNuL3dT?=
 =?utf-8?B?S2h0RDdYTTBCWUNHNFM4ZWUyZ3M1MmtVUGd4UzVPWjNvTGZxd3h2ZE5SWkh5?=
 =?utf-8?B?c3VVQkwzbzF3TUFCcG85UUFlT2NJZVZTSDdoYlRpZGdQU3hXRUtXQ2xOMjFT?=
 =?utf-8?B?OTAyVXE2eUE3WGdvdXpVWW5saHRsYS9GdEpYNVRDSVR2QWY2ZTJkYlJhR1RB?=
 =?utf-8?B?ZzQ4VUpscWYvbkpnQS8rNDNyVzdOelNQcUVENXZMRFhtakVkbHAvMGdLQ1BQ?=
 =?utf-8?B?MDFKRnZHUnYxVGdGWmJvOU9hT0dTaUxEQUxEejBnY2hKSEZPUW55Rk8yZHBK?=
 =?utf-8?B?U3NxYmpnUnNROVF4M3NsK2tVRTBrVytHQ2diT0tLMmxpeDNZbDVDSUtCWXd2?=
 =?utf-8?B?cGY0R3BaRzV2elRpYTlwNXFBcUQyV3JyTGNjL01ybXhIMTU1STdrcXZCT21B?=
 =?utf-8?B?alRVVUxJa1BpbkYvLzdIa3YrcFgybWFqdW1MNFJRM25URTBvWGxCSktlTGdI?=
 =?utf-8?B?OTR3ek9vbEdWSERnWHhLY1NDc0R3U1J6VlMva21ubDBYbStnL1d6ZklYakVW?=
 =?utf-8?B?czBiRm0yWURjNVNLNWFUamExYVljbVpNOGZQNk5Zb1dLOXNFU0wxV2dGbldN?=
 =?utf-8?B?VlBEalduMEFVYnF3NFkxQzJ4OU1ZeUkvTlVtT09WaGhuNjJQeUQ0K2R4cHZS?=
 =?utf-8?B?blpxM3RXd0dXdXZhdEtkYjZTZE9sbm5xaEVNT2pCWlk2eWJzNERsTHplb2w3?=
 =?utf-8?B?UGVFckhENUw4dURsUmZ1UEYwejBoa3YrRTRpOWJDbG05OHcxenhSMlRiOHor?=
 =?utf-8?B?dTZGM2NleDVkai9pb2tnbEY5RFA2bDhlZlZSRUJRVTNUQXhLNlZTQUVUUEpW?=
 =?utf-8?B?b2tlb1h0b20zakZaR1F2NkhEU1dtbXZYL3Z2dEdKRzdDeUliamVXL1NFL2ZY?=
 =?utf-8?B?NzJtZkFCQmNvSFRoTjlTSk1LbTRMU0dMYXNiVjUzNnZLRG11QVVnd1kwRXBE?=
 =?utf-8?B?dVlaYmFjenJpZExSUllCeWtiSU5lR3NoM0F3YkhHK083Q2ExYSt0ODBzUEd6?=
 =?utf-8?Q?oDP+clO55vc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGcxUTY5azRCelJXcGtDclJqcTRhbHNaaGl4SmNsMjFYMVVRWFNsVVBObjEy?=
 =?utf-8?B?cXUzR0cwMjA0ZjY1Ri9oUDQ4WlZhKysySGRuSVJ6aXRNczdTM2FoUUV5ejlY?=
 =?utf-8?B?NEY3YjJPeXhUQ2NvTm5PRWtPVC8wWXFlN1hxNkNKajQ1emlIZzh0YVU1WWdp?=
 =?utf-8?B?M2tkMmltN2c1cE93dWZSMll3dzFjSEE1dGlmZ1QxTS95QUFtMm5xRks3OHU5?=
 =?utf-8?B?R1FpQktKN1VwZlE3UVprdWpzMTNCL3pUYXo1Y3dEUWM0aTFKUXBmYWl3YUQ3?=
 =?utf-8?B?WlEwcUJXMGpoVFZBcm1IalJOUmF0RllRajAzVUxWY2dNS2I1bHR5WCtLSDlZ?=
 =?utf-8?B?cGRVb0trZTZSR1Y5STdrNmY5Zmo0TDI3TnJmRGdweHM5Yk9Ya0QycUxCZThZ?=
 =?utf-8?B?S0Q2N09qT090R3drdTM2WjBCYmxmU3RqTjNvYWNFTmJLNUNpY3V5a1JiZ2U5?=
 =?utf-8?B?ays3V3hWOWliU2lPUFBKcFNsTXpYbXU3RTh3Uk0xNGExeXlxWUIrWmkwcndN?=
 =?utf-8?B?a2NYL21YZ3RxeDNGT0R5L0xrcDlYdS9ERk5vdGoxQ1k2SUw4MVF6RnQxZmR0?=
 =?utf-8?B?S3BlREl6RGJhS0pmN29DWWkvUDFWTDdkLytZd09tbHNYaFB6Z0o2RCtFMS9z?=
 =?utf-8?B?cEVocGNjWnRHOXNUY2RVK0l2Wk45eEtqZjZJVmszRUNZUzBrUGlwUkdpV2Q1?=
 =?utf-8?B?eXk5Z3JNNGxGeW9GcnE4d0tNdWdZNmFMYTVoMzMza1drYTI0blI2Ui85M2or?=
 =?utf-8?B?aVNVMGk1Q1dZS2tkWEFRM1dKRTZRN2ZGVzYvUWRGNnpDRFhCSUdHdHhzWVpR?=
 =?utf-8?B?NzhLRUVMSFpwVm0vdzcrOVg4YW9ITUR2VUJBdGczU3hSc1dqaHRkdXZDWDFH?=
 =?utf-8?B?dG9iYWNYaU9nMkc2T2hHczJHZng0ZkhnMGlxWVFUSWoxSkpDSy9vUnFwL2lM?=
 =?utf-8?B?Z2hOOWlxTFdNMWpwdmpaVm5Xd01xMUtwL3hQM0ZLclZ4OTFZdURCT2dHaXpy?=
 =?utf-8?B?RjY4WXRUZGRKcDBLREFJRk0rc1daZDdsYVFPNmptZk9BaEhjR29rdUd0R0dj?=
 =?utf-8?B?QU5DRlpVMHFxTkxYQWoydjdsWEY3c3F2aXVZL0FITk9FYUtEQk11RXNBY2dq?=
 =?utf-8?B?VlNGRTlmWmhnVjdSVzA2R1VxOW9DVnB2T05HZU90S0M0WTdiV1VoVmI4UXBx?=
 =?utf-8?B?TzFISlhMbzkwQzFGTUZFbXBlTU0wL0lNZkhiVkxWWldXQzJUVnlkQXhaR3h3?=
 =?utf-8?B?TmY5NTFQVkJaa1ZrU25wTDZQNXk0NUZRS2xBZGNSdjEwekF0dWtLU2p3OG9Q?=
 =?utf-8?B?SDIyZXczbmdKYXJuL09zaHNnKzZHeCtiMVpoRHVkK1hBdkFCb3ZZTUh2R1U4?=
 =?utf-8?B?R0wyS0hRWTB0VWZ0cXFmUklpK2pOd1FOcGhpZTJBZGlKMWl2TUtoSnMwa3Zh?=
 =?utf-8?B?STlIeVg2YzYvT3k2ajQ3em5LOVJqYzFiSDZSYjlYWVNIendDcWI1R1dtQTBV?=
 =?utf-8?B?c3MzY0xJSG5Rek81dDErempaV085VE42SmsvRU0rM3BLOE51QXpKVm1QalR1?=
 =?utf-8?B?NXVGajNqM0duQWd3UklHdmFSRmtueUMyUDljUGhCeHBSS05Mb0lCUXBLaTJs?=
 =?utf-8?B?Vm9wR0twdmxpdHhvSWlHSUFWRS9yMkFNaUVxR0FhbHl3YVlpZVM5bnJ6YS9p?=
 =?utf-8?B?KzFFeE9ZUlZFcm5aeXkxS24rN0dGdUVsWjJLN0tkbHY3emVXK3VOK0ZKNlpr?=
 =?utf-8?B?WkpRNW9qNk41dUNIam5hSW1SYlNNOHFjWXZmK2YrWFErUUE3ZTJRcnFuSkVB?=
 =?utf-8?B?dkxVdUZLOG9nYTFsUDNoV0lpRFlXazVvbXdwczNJc2NCS2RnYm00c1gxd0hn?=
 =?utf-8?B?d3YvNk5rekE1VE8xeFdjU2Q0akR5dE5oV1NDSWZQZDBMand3ejhBYXl1WDcv?=
 =?utf-8?B?YlNvT0ozcXBrM2Nxek9kdzRNblpoUjA0OHRMS2xDWVlBMWtvZkxGQnBma1N5?=
 =?utf-8?B?NHQ1NkpXQ3V4cWZIL2NDOThxYThHQ3hBUlZxYzlGQ04xNGFvbTlZOFpwWk1W?=
 =?utf-8?B?RDFIREZmdlpCbUtxcXdPY29HVG5VQ0hIMld4SkZleWhiSjdSbUppRlBWdDJI?=
 =?utf-8?B?am1hdTYrSFlFbkNIS0tiN3NzZnVPNnBqY2ZnWVp4ZFdhVWRRVkxlcFNSb2Z5?=
 =?utf-8?B?a3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4b175a-8a5a-4bda-90c3-08dd6795813f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 09:56:37.2545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3XuOLDYk5Tpi9lrvkhgBe053eAGrru3p5rU++09j8QhFtgf2922pBmkcQhV5O26CHLxRxSmhLRMWnJ/DxFUVG1VcVYVIbpomluHv3G+5FtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8839

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IE1hcmNoIDIwMjUgMTQ6NDQNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCA0LzRdIGNsazogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgWFNQSSBjbG9jay9yZXNldA0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMyBNYXIgMjAyNSBhdCAxMjowNCwgQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEFkZCBYU1BJIGNs
b2NrIGFuZCByZXNldCBlbnRyaWVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6djJoLWNwZy5oDQo+ID4gKysr
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yenYyaC1jcGcuaA0KPiA+IEBAIC02OCw2ICs2OCw3IEBA
IHN0cnVjdCBzbXV4ZWQgew0KPiA+ICAjZGVmaW5lIENQR19DRERJVjQgICAgICAgICAgICAgKDB4
NDEwKQ0KPiA+ICAjZGVmaW5lIENQR19DU0RJVjAgICAgICAgICAgICAgKDB4NTAwKQ0KPiA+DQo+
ID4gKyNkZWZpbmUgQ0RESVYwX0RJVkNUTDEgRERJVl9QQUNLKENQR19DRERJVjAsIDQsIDMsIDEp
DQo+ID4gICNkZWZpbmUgQ0RESVYwX0RJVkNUTDIgRERJVl9QQUNLKENQR19DRERJVjAsIDgsIDMs
IDIpICAjZGVmaW5lDQo+ID4gQ0RESVYxX0RJVkNUTDAgRERJVl9QQUNLKENQR19DRERJVjEsIDAs
IDIsIDQpICAjZGVmaW5lIENERElWMV9ESVZDVEwxDQo+ID4gRERJVl9QQUNLKENQR19DRERJVjEs
IDQsIDIsIDUpDQo+IA0KPiBUaGlzIGh1bmsgaXMgYWxyZWFkeSBxdWV1ZWQgYXMgcGFydCBvZiBj
b21taXQgNGQ2OTUyOTgxMjQ0ZDFlNA0KPiAoImNsazogcmVuZXNhczogcjlhMDlnMDU3OiBBZGQg
ZW50cmllcyBmb3IgdGhlIERNQUNzIikgaW4gcmVuZXNhcy1jbGstZm9yLXY2LjE1Lg0KDQpPSyB3
aWxsIGRyb3AgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQpCaWp1DQo=

