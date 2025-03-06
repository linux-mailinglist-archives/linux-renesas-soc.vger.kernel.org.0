Return-Path: <linux-renesas-soc+bounces-14051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C48A54764
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F4E37A4827
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2821FDE37;
	Thu,  6 Mar 2025 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HC6qe5Nv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272DE1FDA84;
	Thu,  6 Mar 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255861; cv=fail; b=Em7zoGQyu4QcMzwG03B9undGfKwoxWt6SR991plG/8AzFdAFCaDC2bXX0NhFOXiOOf0ykCAL2FynHYsABSjIL7Au1+jNTKC6cP7qlwIT6qmAhdDu/4ickP2x2ucsf1z+ZQqzQPqyzAQhmzp/D0XRvZ3mkHVipbOYn5fP4+JE87Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255861; c=relaxed/simple;
	bh=Zh/kcl2QaW2DS1UUsCDHeTPjPW/h+A0PX9qq2fSNxlw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K+3ktN9LtHOjlD8WiwlMzADycXxDolMVFsqEA8Nhma2TczfS0OTCG0PCcoNOVXkGNM80534MjZff/7+09gP2iN5WAb/gsatFtsfeXx5Jck8+uTLfpfpnSbzuEBZaI1AyrN68Eskgf7GTPY2BQLn6fofePK/nRajkML6tKSLKNjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HC6qe5Nv; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NdXsSXGKNAkYMHoGGk33s3Ji58kfGPrfiZktdFgCw/yJZ848xuYpvcvOHTNqGJp6FAfVtutjxZsntgcW5XzGPcmDCIl9SvpFWdxBbFUaJMYGt2XS/0Qy7DTyIQ2kBEZsoLoxa3IeUSauL8UlDrg6Zy+k8lpu2mtbqTfEyZoC+bHMPIJtH112cg0adV9nD0l/GUshitzXBBik8xXJwJeH8nH65TrEtF6KCNQwoP13s815N5TyMUUVMHefvDNdp6ClhteuU33pLH0SlFBZuKUx4fe1nQAUle2kkB4LDjVMFB+uy48Qk0kjtHaa8PqxlLo8f1Hzhxwc6FgexKuImLSBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh/kcl2QaW2DS1UUsCDHeTPjPW/h+A0PX9qq2fSNxlw=;
 b=Hd9IGKmDHR/Qlb+fWpUU1BOHiGHyYBMmy6GxwfQnx8ahQByi8WJHI7ufDtRF1vT+a0qVycjCEORBeqrczXpHJSZA75aN5OIBSMQhI0L68aiaVNNcWtI/66Zwd5ECBRr7PykkqhlX5JKK/egf+2A+29XcxWdOcA7fjOvavx/feK6QhoV3fjx6rl3HoVRylPUe84AnlN84ZWCCuhP3GObiHYQocpOZwpmwtptPn5gEvY5pUH4JzCniMoyoI0gb7M+++PvRmVYPsWrcp7rrjRugTZbBlNRk5X5+NoaMNtVaixPm6fMuFMXS/hwUcjGVVbcyS0rgI72gdfj4a/YxGkAIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh/kcl2QaW2DS1UUsCDHeTPjPW/h+A0PX9qq2fSNxlw=;
 b=HC6qe5Nv3ppbq1sOa5NJ41sDNZT9+WHCR+XbK+SUjAyZLkPi+HMvx6xwRmQFTvsmYD1VDlf++Yxkq1AJK1bKb3hVccyeWIaRnSzc+DaV4SoNUjvq2X/UWOoFVSbjhkXmjOdlOqNRHvTLAYPJrvJssbeSLOLDsBQfzli5YHd5O4w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14794.jpnprd01.prod.outlook.com (2603:1096:604:396::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Thu, 6 Mar
 2025 10:10:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 10:10:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Topic: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Index: AQHbjCwSQtFnS5HRQ0O4YyzU/N2JT7NlMPsAgAC1N4A=
Date: Thu, 6 Mar 2025 10:10:50 +0000
Message-ID:
 <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
 <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
 <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org>
In-Reply-To: <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14794:EE_
x-ms-office365-filtering-correlation-id: 37ab9072-2c1c-4343-9b65-08dd5c972c47
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aE03eno1c2Jmazl2ZUFnd1U3UmdtdlJmbldBVVE1cmoxT2xjcEFxRUpyQUdX?=
 =?utf-8?B?TGNoQ3J4RG1iVVh4NWUrbDU2M3NQM2FnSXdZNWNLc1FXTlV0aXV4emlEMTJU?=
 =?utf-8?B?anlIQStMaEc0TXZNSWt5L1UvTlRudGdoSENaUWtLbkZySjZtUE9DY2lwRldi?=
 =?utf-8?B?U25ob0l2ZTlybkdCSEh4ZlJCYnZsdGtZNC93OXkwcUgzUHJxOWR6bzVFWUFN?=
 =?utf-8?B?cUFmc0cwbUc2ZTdEM0FDMDNXblphTDhnMHpOT1pCdUZSMkJGYTFIelFhOUJ1?=
 =?utf-8?B?akg3TjF4Tm1wQStJMnpWYnFFb0djOU9NTjBKWnRiQkdGa0ZIREI5ZkxtblF3?=
 =?utf-8?B?VHNHZGtENVJQK2NtMXFIUldEN1BFWUtxajFRdTA1N2tVdmVsZnFwL2sxQXB5?=
 =?utf-8?B?bkpwTnM5THZiNFN5YUprenppdmd5Z3VKd0NqeXdDc3EzOTdCek9KQ0xjTjRw?=
 =?utf-8?B?dVgrYkd1NEJFU1pvaTNZUnlGY1VJMnV1N0Uwa2U1NnpEK3FRbFVKWlFQSkhD?=
 =?utf-8?B?bzdlZG9QQk9CWXVCazd1WHpLQUgvdlVibmJDR0RMbkR3UnAzK3BDWmFOcmVa?=
 =?utf-8?B?cGwvdlUwNE5nQUJPM1h1MFpMSThSa0pnVXVxaFRpQkpJSHFqRTVSSkZmZ21l?=
 =?utf-8?B?MFUzZC9zSDk4TUFIdmtLMlFzY3YzTHVoRkswTHY5VUpSYlBUOGtNRUwzZzJ6?=
 =?utf-8?B?YTdNOUo1U1I1UkFKd1JnOEhxNE5qaG96Y1ZiVTUyRHdYaDlMYVF6U2pGUzNC?=
 =?utf-8?B?UTdpS2tSYWdWZXpHb09wZjN5TmFPZjdOWVlyNWg4K3pTS244VnUyZ1Ewa3pv?=
 =?utf-8?B?NTJFMWZTWTBidi9nckFpaVJLK1FHQzBMaGhsMUg0S2s1N1Z4REwzZm9lT2Fq?=
 =?utf-8?B?S3ZYN25lbVdRelYrUVlrZmVYN3oyS29VaHZ1blM4SXFkZG5EL1J4c2VPRHl2?=
 =?utf-8?B?TFFMWFVzMkhpS2czR3Jpb24zTzZjUS8xbkpSWkVOeXRNR2Q2cnBaR1RkaU8v?=
 =?utf-8?B?U2ZtNktHRWszVDJNYzh2S0o3TDZoWnFNeE9VdGVFdVZaaWV6b090bFpxdGtw?=
 =?utf-8?B?ZTdXTFVEdW04WkpwNFBnUk1YT0NUWldwcy9sR1dTL041U2Z0YlNzS29wQUhW?=
 =?utf-8?B?dlJFQmJXTERDQ21TR29zUTlENzVzMlpmTko2V0hFWm5ZZGViNjhPaVZ6NjNQ?=
 =?utf-8?B?ZjR6TUtaNVE3UUhjRzM0US91WWwwU3BXSEIwQXV1QktMcHN3dHlRZnZQZUp2?=
 =?utf-8?B?cVphSGY0RytWQmVoa2hMYjZaeTlleGhlYWtiZmhMV0s0bDBnMk5jM2t6b0or?=
 =?utf-8?B?WUtJTm5QYmVmRXBYc1NGNnZXYlZ6YVNiMDZHcUZ3cUpRM0F6VE1jUW1rQnJZ?=
 =?utf-8?B?aHBua3plSkFJQXNuSnA1ajhxQ0tEL1VKZDJNWlAzWjdnRWZwbXhXV0ljK2pi?=
 =?utf-8?B?TnlsUVN0cU1vclpQRmlHbzJ5NjQxUkZQYmZRQkhuQXVQTHd4ckMvMGFGTy9V?=
 =?utf-8?B?NjNJUzBHS0JJOVpOY3NXd2N5Z0FrTFUzR2dCZng2NzJWb004Q2Uxcis2NHBT?=
 =?utf-8?B?WW1rVmtqRHVTeHJSL0dTZmpPaEpUK252MllBS2lwdU1yNFkrRHZ2ZEI1T2Jv?=
 =?utf-8?B?blBDOVFtL0QwVU1QV0tKVUxMUjlzS1EveFRSQU96T3ZHWkFpUmxYTGJySERh?=
 =?utf-8?B?bE9KM2NVTWJsMUgwMWJ6YWhWQ1RmMUxDc0xMME1CL1hwN0JENzNwUm5MdExH?=
 =?utf-8?B?cTBWeExRbGg2czB6VEFHdDFxMGtLSFl6UTUzdmd4blN6MkFwSWlVSUprK2dB?=
 =?utf-8?B?MDVVcGc4Z3R3TU15YVdEK3ZNRHBGZkRvQW0xb0RXRytFUmZiM0J1eTRocVRD?=
 =?utf-8?B?Q1RCZC9DOVR5YlM4bjhhcW5sWE5ndWJrMHF2N2ljTGVGdkcxMlZpdzIwdmZF?=
 =?utf-8?Q?EljL+DVGn31ds1bs4MINXee5njwWJwWG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1pteG1YcmlmRys5YzNrN0hoeG5qMEtxOU4wYklTdEtOQ3FFRUVrdVZmcVRK?=
 =?utf-8?B?andLK3AycVBtRjJLYTBCd1IwUW1Ea2lLWVlhSGVuYW5USFJFaTl0S0srNkJk?=
 =?utf-8?B?amtPcjNRS0hWVlBLMTNJcW55eDBvZ0tTNWQwbHkxN055a1BzTm5nMTRmalRq?=
 =?utf-8?B?SDVkWERuY3FWbVJCcGdZNHlmSFExcSs3NkpRLzkxcEREVXZ2cW9wQmd0UGFj?=
 =?utf-8?B?TzZxOEk3N3dlMmpob0dQZ2l1c09IMXJrZnpjSGZDSWV2UHg4NUN2eFN2UWtZ?=
 =?utf-8?B?R2FYUmloZVhjRzlKbUwyTzFkYzVZUzh0V2xpTXA2RVZpV2YxbWxRVndQa1Yy?=
 =?utf-8?B?WEpqeWhoczhCUGxrbHIxRFU5TUdYc0xldDF5ZmM2dlN6WU5zb1F4Lzg3QXU0?=
 =?utf-8?B?dDR0VFl4M1J3UkVoN1JVS0toMm82cFhJOVRxK2V0a3c2RDZyL0J5L29Sb1Qw?=
 =?utf-8?B?VnZwZ1VneUJYNzVuRU1wVUFBM1BMYjFHZ05EOVVhT0JRSHVjQ0l0WDNaNzZQ?=
 =?utf-8?B?ZmFFWlJiaUQrMDRLcWVBM1dQS2xvVld6U0JVV05USzdaU1hzTFVMVVBLVE5V?=
 =?utf-8?B?WHBWOEFnK1h4OGpNYys1Ylhhc1cwVVh1VnlpL3JJWmhiNkhjbVdaNktLVmlT?=
 =?utf-8?B?c1o4dHc0ODAwNk1XQ0dpMDNIT3MxamVIMEExMmJLaE9BU0FYZlpuRDFiRFM1?=
 =?utf-8?B?ZEtDa3hzQ2NUNEZxZElpbk42L3dGUzY1WHB6S3BSeDdqT2ZCRWJEcFdkeE1I?=
 =?utf-8?B?dk9QY3oyZHR6K3oxYkY1dWVqSVFQMjIySVYyZDViaUdsYTFSaFprWEtZa0pE?=
 =?utf-8?B?cDdldTYvcElBYldsN1lTa2kvTjFVS2JYNjhaTjVZZjNhRzZhTWdZaC85Mkd1?=
 =?utf-8?B?bU5FRzlQb0J1M2syOE4vY3ZmaFlFNjAyQkZYZytJdkMvQ3h3aER2WnFIdk5V?=
 =?utf-8?B?VjA4NjlrVTRVU1NRVVJyMDcxN3dPRzVqSEE4MC9LWm8vZkc3RVl3aWY5R2h6?=
 =?utf-8?B?Nk9sVENDcVloRmMwVzlNRlczVlBmMmdCUGFBVlV3YW84aHpnQVRIWHRBaDRi?=
 =?utf-8?B?TGxuemVhaWl6a1hZRUVCc3BoeUlNdDJMelczUEdQM0l6KzU4aFYwR3ZNTHhU?=
 =?utf-8?B?a3ZzQTRtNTZMZjdWcW1xVTdoS0V1VjZadWg0eHlqMXdabEk0dlhKemdpeU1P?=
 =?utf-8?B?MmtCMzR6ZExUOC94aUJtYjkwdjVwZU5tamZld0N4S2pGQnZMcm9HeThwMCto?=
 =?utf-8?B?cUFadlRDMHZqU0V5NXhRSGFQUHd4QWplME4yeldLV0xLY09wU2hVd2k3OS92?=
 =?utf-8?B?WHNkajlrL210Vk5nbkxqa2FsTS9KbVdzc3VlVGk1WllHYXh0R1YwKzJVTlpW?=
 =?utf-8?B?VXBWVG0vWlBtd05GWGQxTTF3VUtEUHp0c2FDTjl6SVR3NzRIVGNzSVZKRUpl?=
 =?utf-8?B?WDJUdzNRMnphVi9kR0crM2lnNFZLdm1MeGQ5dWhLR0E5bzlhY29FNmlwSm9n?=
 =?utf-8?B?RFJIKyszSWxDamdUcGJrNHhSMi9INnI0ZWlMTUFZSHRzSFoxdDNobXlHdmxo?=
 =?utf-8?B?YVVzNlBXSW9CNEdvVnlVWXBjTm0vdjhSbk03QnI3MDJIZ3dMaFpoZlpUcmZG?=
 =?utf-8?B?K0ZnRFR6Wk0wR0VaYmJwdzhjYnZQTGVFd2lkekhERCsxRy9Yc0dNeUZ3ZVRu?=
 =?utf-8?B?eXExSmFvRTN5a2xuLy9BbU9lL3luT2xaUTRscFBCdERtNEF4MlhaeHBJQloz?=
 =?utf-8?B?MnYzS0RLcHdUZzhNWnpCaFFqblFVUGdZRTJkWVpvcWwzK20zbktocjNod1J1?=
 =?utf-8?B?WndETWZUelY2T2dZN0liTFZlNTNSVmJIc2hwWkRKODh2R2M5dnZ1WDM1Vis3?=
 =?utf-8?B?Z0trTVg2NkRBVzZ0d3FnejFuOFBFMnQ0MnE1SG8xMTduT2lZOVdkaDhXUVYz?=
 =?utf-8?B?MTI4VjhnQ0xMZ3NRa1dCbjVqa2dVaWFhdTA4VTFEUnR5YldwOXBqZXVKTU82?=
 =?utf-8?B?MzJEczFzNDZKVnNMaVF6VzJIdDVNVnNMQ2ppT3lQL0pxclRVejZ6bnJXNi95?=
 =?utf-8?B?dnRGTXhJUWtIc29tbjIwaG9PVzFpS280ZEVvUERPamtZSzl4UzFmKzhVQWln?=
 =?utf-8?B?LytVOWJuY2FDbDNZWmU1UjVHN2MvZEdtbmRObjhXTjd3Y0ZrQ1QzeEFhSEZ3?=
 =?utf-8?B?L0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ab9072-2c1c-4343-9b65-08dd5c972c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 10:10:50.9107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILnxfW1jkzvbjhADBWdDI0ePlhVRU/TiTkyb0MdazaZO2HDum3kinEa5SQO0H6Ql6+peaxKsKK7FvtDXmLrvoqhilArmpCRLvtnOveMyYgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14794

SGkgU3RlcGhlbiwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPg0K
PiBTZW50OiAwNSBNYXJjaCAyMDI1IDIzOjE3DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS80XSBj
bGs6IHJlbmVzYXM6IHJ6djJoLWNwZzogQWRkIHN1cHBvcnQgZm9yIGNvdXBsZWQgY2xvY2sNCj4g
DQo+IFF1b3RpbmcgQmlqdSBEYXMgKDIwMjUtMDMtMDMgMDM6MDQ6MTkpDQo+ID4gVGhlIHNwaSBh
bmQgc3BpeDIgY2xrIHNoYXJlIHNhbWUgYml0IGZvciBjbG9jayBnYXRpbmcuIEFkZCBzdXBwb3J0
IGZvcg0KPiA+IGNvdXBsZWQgY2xvY2sgd2l0aCBjaGVja2luZyB0aGUgbW9uaXRvciBiaXQgZm9y
IGJvdGggdGhlIGNsb2Nrcy4NCj4gDQo+IENvdWxkIHlvdSBhZGQgYW4gaW50ZXJtZWRpYXRlIHBh
cmVudCBjbGsgb2YgYm90aCBzcGkgYW5kIHNwaXgyIHRoYXQgb25seSBoYW5kbGVzIHRoZSBlbmFi
bGUgYml0IGZvcg0KPiBjbG9jayBnYXRpbmc/IFRoZW4gdGhlIGVuYWJsZSBjb3VudCBoYW5kbGlu
ZyB3b3VsZCBiZSBpbiB0aGUgY29yZSBjbGsgY29kZS4NCg0KVGhlIHBhcmVudCBjbG9jayByYXRl
IG9mIHNwaSBhbmQgc3BpeDIgYXJlIGRpZmZlcmVudC4gSWYgd2UgdXNlIGFuIGludGVybWVkaWF0
ZSBwYXJlbnQgY2xrLA0KV2hhdCBjbGsgcmF0ZSB0aGUgcGFyZW50IHdpbGwgdXNlPz8NCg0KVGhl
IHBhcmVudCBvZiBzcGl4MiBhbmQgZ3JhbmQgcGFyZW50IG9mIHNwaSBhcmUgc2FtZS4gSXQgaXMg
YSBtdXguDQoNCk11eC0+c3BpeDItPmNsayBnYXRpbmcNCk11eC0+ZGl2aWRlci0+c3BpLT5jbGsg
Z2F0aW5nIA0KDQpDaGVlcnMsDQpCaWp1DQoNCg==

