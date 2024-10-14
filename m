Return-Path: <linux-renesas-soc+bounces-9727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FFD99D0ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 17:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAE991F230E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 15:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD2255896;
	Mon, 14 Oct 2024 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LzQmoLWD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE9D49659;
	Mon, 14 Oct 2024 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728918521; cv=fail; b=qT9q4L/M0ypOt3+zdJwbFLyDqGG0ppGfCifNJF0dNoZb+BAAbbPr9Qpl0kjZ0XoW8qgiGq4H1zWFw+d5KLuToR7qTE4wL0X6y7MQXwO9dj9XGdERLxS4tM38TWc/RGzYgO4sjMYWxRSvkYS5/eHW2rX5yDtdw8aPrfUwL8C7QV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728918521; c=relaxed/simple;
	bh=+rfM9eXTr1ME/wKEYgJweOgYSeQAjCbXSOUfjjsrdq4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RLKSxlYqRHjNqvS+WysIgDC+OH/EfJGJEP7OYNanwEpxXiVxOLpxZDYal5qQd6VVVheEVB+1jkKFKNyMxCUM6zkTAckjJgy4GYTimazZ30Bgv9v0DtChMYClz7bxmC09la2zWA8AXIhHXexyYTL8PutjaNabSA0/g9Lv/PQdWkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LzQmoLWD; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVj3kArspFx0BiJbLkb6Y0LuQ8yzqbXIhp2evK3o6MjtcFNCUume4rRM1e1hsmER57DJRqQ18Gz+5IDOpngjSr/UXwxLRMNl5pyCDD/oFdrsZ9lF7S8k5nluoCR75pWyUcl7SEmByrDKDYFUi2ykSsVirx4j+MV7KmhvWp5il4lOHaauhAMdidiWNcw9tz4ndDyyPb/hDUsqoE44qpBhqGVxFjh4VBGBxpBDAM5BKrtlMc0oHglBJbVPlPG3SbYx3p6LScvti0iAaQ3O+ScDsCneNCFctT4H0Ji9t+rvCHEonEJYy+2Gjqm9h+Txb4BQP9qkpErCmFBMAzQ1pC5eoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rfM9eXTr1ME/wKEYgJweOgYSeQAjCbXSOUfjjsrdq4=;
 b=CUmMwiTohvnp4cJjj9OmCixjY1vCqPXND5v7AeJ2lqtP5jvx57810T4y/BB0fOnBcZN9/3KyIxHRzngKgWN/v8wqPOQIWs7Y5B1pShqR+B57nTJkgZ2Qbi66ZT4A1JKOJ3n9hO0MKQlAWKNHtMQjJLBCPiHmYTl5hpSnKa9LFOxkZajQ5GICuAt8gObL7su2Ce2QAU/RzMhXou1JYP/xU698FLc5pbxkyrCUEog/IrnXRbc5H0bb1S4ajSlmVv9PbbkCilGPS9UVaG9KtqxnLOwUN/6kI93WksHIaBqW3h23H1Q1cFLL2rE/+uf5CPHRcrFC9tTyw/A9OjEYm8B6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rfM9eXTr1ME/wKEYgJweOgYSeQAjCbXSOUfjjsrdq4=;
 b=LzQmoLWDtbvjKvuUJzJBqIlw2SRwE3RRb/65bYSqsLpjzaYediPAKjd7WaqQTRgVIBEaRcxc7Z2i+lQ62zflaClPToe91Jnj2jIDizMOE6OBwQI0+g6ekeh+PWN7VxPNSpXyitKs5zQjS6G8hdo/sdI/16fm0g5vL7yMUQ4Y0ow=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12526.jpnprd01.prod.outlook.com (2603:1096:405:1b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Mon, 14 Oct
 2024 15:08:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 15:08:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Topic: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Index:
 AQHbG/mHKVM27/WiLEqb195bZnu0obKF4ZgAgAAhcpCAAAp3AIAAAOSAgABFRACAAAhz4A==
Date: Mon, 14 Oct 2024 15:08:33 +0000
Message-ID:
 <TY3PR01MB113466447B5B6B5AEC564202386442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
 <TY3PR01MB11346125FF19898F34BD7137F86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com>
 <TY3PR01MB113461894D98B0DEDC86FB81786442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdU0mzLJC7QGHx2cOXKA0Yh_Dez___x-Div3XKQCkVFH2g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU0mzLJC7QGHx2cOXKA0Yh_Dez___x-Div3XKQCkVFH2g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12526:EE_
x-ms-office365-filtering-correlation-id: cb2b1ccf-ad3b-4183-5583-08dcec621242
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHBRZUVRSG1QTGkwSDRIMXZZYjRFWGd5bDF1UWxFQ2grZFErWWgzeGJCRklj?=
 =?utf-8?B?SDlyREtOdWdZWFBZMnh4bXAxczk2YVVEenRLeFEvMjI4MTJvVjR3S3NmVFBv?=
 =?utf-8?B?TUNrb0N1ajdPUUhHaHNiTU5GNHlDaGtUWTlkK3UxVENHYUxhc3JRQ1l6SUp6?=
 =?utf-8?B?ZTgyQ0VZNXlOamRGclpIa1l1YjRNYUJxaEpEWXVISVh4dFdreEdWSk1talRy?=
 =?utf-8?B?aDdIb3JKRVc3ZHJzdXAvSFJlMnp4d3pkY3JaYnltQXpORFdsbUN1UVJpS2x6?=
 =?utf-8?B?NmhJOGFQL3NpTHNjN0lIN00zaXlLV2VveEliaHJDNXNxdFQxc3ZLekNLZ1dH?=
 =?utf-8?B?djhTczRIMkttb2NRMW94Z1pHM2U2S2ZOeklqd3NSTExnYWtReWxWMnFZajY3?=
 =?utf-8?B?MTJFOTNRR3g4NWxRd2Q1SXp6bWN3QyswWWFJY1VDWmV5b282T0FUY0xiakwy?=
 =?utf-8?B?NG1lenNXQWVPNjNvMEZsNTEvbFJoR3BUd2VEdDRDVDlGOGhyM0Z6SmxWYmw5?=
 =?utf-8?B?VU9tMVdNUFVpL1ZnUWVPaGVZVkU0TUdzTGJBQlJOeTZOYjJoZ3pJaDIya2pr?=
 =?utf-8?B?UEE2TTNJNFpoWERSamVuS0JkbDhqNzhkQitOVjVxbWtTTFJmK3NGWGhNd3dO?=
 =?utf-8?B?eERwRHlpQjQzSEI5U0FhSy9FaFIzOUhXeXU4ZzkxOHhzMk1teFJLTEJtSktl?=
 =?utf-8?B?S1YvU1Bvcys4anU0NWFTM0hRd3FRV1VDcEJlTW5SdERUejVzODVwSEY2QWhN?=
 =?utf-8?B?S0V2a2FTb3RDVlZ5TlY3U2tTMlUwVU5QcThReW1lK1pOdUFnb0JIQk1PODFM?=
 =?utf-8?B?T0xjN1NYUTJONTY5YlBZWXB4RkRSN0ZteDJoU3NuMVpycTlWdEs3QTl3c0hJ?=
 =?utf-8?B?anhqM1NGVTNLcjZVb2VaNUNBZkdEbE51ZmhZUk5iSW1rVlpOc0p2eTZLK3BN?=
 =?utf-8?B?dXlUaHMzV2tOT0pPRkVSSEhuRU1SejAwU0p5UFlDZWVuKy8vb2Yyd3JNUVNP?=
 =?utf-8?B?TUkxa05SSkcwWEtmT0V6WDd4c21mMkhCYytjY1lKVloxUXVpZHVTS3B3blZ6?=
 =?utf-8?B?Znd6VlRvVVlPaEdqMThaOFRnOW9kVkZBS1Qvc1JKTityWmVyYUE3RDNBZmRN?=
 =?utf-8?B?cWJHVDNvMEtScFRWSWVxSGl5R0xhdkM4MWxLbmZGM2NrUTFwQlFYbVpFMWh2?=
 =?utf-8?B?YUdseVByVWwvSE5zckRUQnRqcVVvWkIwOEltWThuN1pST3praXh3Q2lYbnFS?=
 =?utf-8?B?ZHpSWG9KeGRwMFdSbjJtbDl0MU5zcDJUMXhCQWxuREJDaEt6b2sxaTJlVGZk?=
 =?utf-8?B?czhpR0VKVU4wZ3lVYnc3VHlOYTN2RTlraTdPdHVuL1poT1FOdmk0L2NNV2V1?=
 =?utf-8?B?clNMS3IwdTZ3bzhERklVOGZnQzJYREpxdGxydUpnUlM0TGl1aEJ1NWMwUExM?=
 =?utf-8?B?WXYybUtuVGdGc1I1Y1pNZ2tkUlZUMGJpQ0pNVnFXZTd2aDJaM3BSN0dpMk0x?=
 =?utf-8?B?aXNJRFVEcitEL1JvWTRLQkFMZDNjQmlrUUdsVXljVEdwVExKZ1Z3VEI4NlVt?=
 =?utf-8?B?VWFyVk9FSWxLZlVHeXdWRzZzelNjam5pWmJvaTJQSThuekQ5VitPaWFSSGpL?=
 =?utf-8?B?QTdvZUoxcW5tR1kyMU5GMzZDTThjREZCRVMrTlovbFh3elcxOTZ0Y2JjZ0Ez?=
 =?utf-8?B?UmlubTVncGhFTFIzUUozTUJQdk93b0wyNE8zc1krV2FUSzdZTTZaOWFLQlJy?=
 =?utf-8?B?TGwwQWxiQnRnTW5FVUVVNUZKTC9jUkJhZkdJRE0vRy94QS9iWmwrK2s2dG9V?=
 =?utf-8?B?a0FJdVZaQU9FWU95ZUtKdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWN5a3Q4TXplNGZvUzdxcmtrWURqZzNoUVQ1dGFRSnNSek1CU1l2a083OE5y?=
 =?utf-8?B?dmpFRHUvMC9YRWVhVU9TbUtDRnpPK21jRHpDSlJWWWNRT0x4dkdHdmovMWd3?=
 =?utf-8?B?ZWtLck1VRTl2cVJDcnJjSE5SQWdxM3ErMThzTElYWkZMbnQ5TXVVTy9GVUdC?=
 =?utf-8?B?MXA0ZHJsZjJFR09RNUU1Qm5pcWxzV2RIcE5pYTNaUGs5ckVCNGJ4YjY0VmVN?=
 =?utf-8?B?cUdqL0VTWDEwRVdkTFBLK1BVK0FMUHJJRDZrZTAvd0Q3ZHNHR2dyZEVPazNk?=
 =?utf-8?B?b29kZ0hMaU9kK1AwR1NmTytHcVRxeU5RbWt1Ynl2YUlSTXQwYSt0UllUSEpX?=
 =?utf-8?B?dk9oWWhzRk1BVXhrNmFRWVl1YjlhVENnNTJpUmNWczF4a1lyVEIwTXpTQ2hE?=
 =?utf-8?B?djZpME9tZ252eUpacDgvdm9UZHA0aHhGQklUZFRoQ1l1clk0aXZYNVUwQ3BK?=
 =?utf-8?B?ekg0NlM0NHlsS3dxMDdqRFlZNjNkVUZsdTNIalI3K3N4cHVOcnB5ZDNNZ3ox?=
 =?utf-8?B?WFdPSldURVlieXRrTXRxbHVsRWhOekh2M1ppSGgyemZMZldhaGJBMWw4aXJk?=
 =?utf-8?B?c1JUQW10Um1UTktkN0YvSEZvQjkrdkVCaTJIM1N2VCtWQ2kvVlVhVWU3dmln?=
 =?utf-8?B?eHlTaHhHTjdPTWhEUkZ6NWdwWndUSjdXakZ3SXFsMkZpc3RFVkhrTFJmWWxu?=
 =?utf-8?B?N0xzMVRnemc4TSs0REVocFdPSnhSUmVGVHBXR1MzMllVcE0wcmM1aDMvWlJa?=
 =?utf-8?B?Tk04VjFjTThqQ0VEcUVYVlNoUU4xWldGczMyRnJiQm9Ja1VXbS9yZy95Qkh2?=
 =?utf-8?B?dVY1QWIvVUpNSzhkWkw4ZHl5MXl3QllYWVpTa1kwNDc1MXlWem5ybERKOVZ5?=
 =?utf-8?B?dnJnNVY5YmZmMk1SY3RFMHhTaGFIVFN3d1BCMVd1QW9jSkxWOFpOQk9RemQ3?=
 =?utf-8?B?dlN0NVhBaHRWdGJNMVI3RFdpUk52dFF3ak1HK1JPNGExbCt1MUtoQVpRS2E5?=
 =?utf-8?B?dWVXZDNiUmRPV3AramdjM1B6dzYwRTI5SkExYWJyT3F6bnhLUERhdUZlangw?=
 =?utf-8?B?N1p6SzRoeWtRT2FqMHBMb0ttKzk5dThRcFdIVHp0OEZYWk0za1hlMlZJdEJT?=
 =?utf-8?B?WWZWMWNZditzRnBCaHROYm1SY2tUcWVrVTQzdzRmbUExZHpDSXhBVFIwVnh5?=
 =?utf-8?B?T2tLTFZFSDREVGN1Sm05YUUvM0E5NUIvV1R0cTVoTnU2d3NobG8yUkNTa0Jt?=
 =?utf-8?B?UXVzWExYaEtrcVV0MXlpaTRzVWlGZDMvaWh4NHVUMy9GS1VaK3EwTFk5Nm9j?=
 =?utf-8?B?a2VvNEtXYnhlLzhsRU11M2x2bWppTjJTSnVlODZMV3k4YU1tUnpJQVJuZ3k2?=
 =?utf-8?B?VnB5NjZreXlmeEQveWw1TWdZY21TVFZSdXk2Qk12cGxGQmMydFBOMldtMkdS?=
 =?utf-8?B?YXVKckxsL1hSajh4WFhtUldsOFJSaEZGZjVCNUt5QWc0aUlOTHF2eWxVdXda?=
 =?utf-8?B?eFQvc0lJUHpwdlRQS3BqWmpobXZjaWE3YXpybncxeFYzeUNDT2VWNUtrcHNM?=
 =?utf-8?B?bG9FZGc5c09HNCtFY2ptV1M3QnB0UFA3UzdwYjlyQ3BZR2J1MnRDbVkzYXp1?=
 =?utf-8?B?M3p0dFpwZXNZNkVSd00rUGszL3JnR3M4ZlZXVW5jQUFPOHV5cWNETjlZbG9E?=
 =?utf-8?B?TVFOemRtWVNxcGdpaXBsdzZGNEZHVTRuRStqNnU0RlBVeG9qN3hjeU1KcG9y?=
 =?utf-8?B?MGFDUThFUVNuSmMwVUl3VXprc013Y1ZNbzc3eVRPWXZSMVhjckpneVFNcDkw?=
 =?utf-8?B?YURzTDFsTGdKVTJXWFA1RUR6aStWZlM4UlRTa1B4RXBaQ09xbXk5U3RzZUdX?=
 =?utf-8?B?amdxa09Ndis4akdSQlo2d1ZPS3BnUnplZk03SURlL1lnTTcxc21LNEo1SDgx?=
 =?utf-8?B?UGJlcjFIaEMwWVMwYkN2MFhYOWNVQngwbjF2RVRtV0JyQzJKTzVBQUJOOEVF?=
 =?utf-8?B?YUYzZVBIRUduZUNXK2htalI0eUNSQXY2Z2I1Q0hNM3N2aE8zSjZtemF6NSti?=
 =?utf-8?B?TmQvSFRRdWJzYkFLRklIcFRxKzQwOXAzQWpFTnZ2Rzl5cVRYQjFTTEp1KzM5?=
 =?utf-8?B?eVpCQ3g4cXgvL3E3WkVGMWVuWk9rTlJDMzNoQjFVeHBYdElBVXdPUnlma2Q5?=
 =?utf-8?B?K0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2b1ccf-ad3b-4183-5583-08dcec621242
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 15:08:33.6496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wf49zO6BwX7WEMqs14CKYPqv1AbV8L/CSZUIFWOjQAhNxvB3waFrjGYZD9GoQWvFvisb3LrFWOKjY9NDl0VITRMs4B+QNm32Laf5XkSSaNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12526

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBPY3Rv
YmVyIDE0LCAyMDI0IDM6MzIgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gY2xrOiByZW5l
c2FzOiByemcybDogRml4IEZPVVRQT1NURElWIGNsaw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9u
IE1vbiwgT2N0IDE0LCAyMDI0IGF0IDEyOjM34oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IE9uIE1vbiwgT2N0IDE0LCAyMDI0DQo+ID4gPiBhdCAxMTo1NeKA
r0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiA+
ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gRnJp
LCBPY3QgMTEsDQo+ID4gPiA+ID4gMjAyNCBhdCA2OjIw4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IFdoaWxlIGNvbXB1dGluZyBm
b3V0cG9zdGRpdl9yYXRlLCB0aGUgdmFsdWUgb2YNCj4gPiA+ID4gPiA+IHBhcmFtcy0+cGw1X2Zy
YWNpbiBpcyBkaXNjYXJkZWQsIHdoaWNoIHJlc3VsdHMgaW4gdGhlIHdyb25nDQo+ID4gPiA+ID4g
PiByZWZyZXNoIHJhdGUuIEZpeCB0aGUgZm9ybXVsYSBmb3IgY29tcHV0aW5nIGZvdXRwb3N0ZGl2
X3JhdGUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gRml4ZXM6IDE1NjEzODBlZTcyZiAoImNs
azogcmVuZXNhczogcnpnMmw6IEFkZCBGT1VUUE9TVERJViBjbGsNCj4gPiA+ID4gPiA+IHN1cHBv
cnQiKQ0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSGllbiBIdXluaCA8aGllbi5odXluaC5w
eEByZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gdjEt
PnYyOg0KPiA+ID4gPiA+ID4gICogSW1wcm92ZWQgdGhlIHByZWNpc2lvbiBieSBkaXZpc2lvbiBv
ZiBwYXJhbXMtPnBsNV9yZWZkaXYNCj4gPiA+ID4gPiA+ICAgIGRvbmUgYWZ0ZXIgYWxsIG11bHRp
cGxpY2F0aW9uLg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAgZHJpdmVycy9jbGsvcmVu
ZXNhcy9yemcybC1jcGcuYyB8IDEyICsrKysrKystLS0tLQ0KPiA+ID4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4g
PiA+ID4gPiA+IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyBpbmRleA0KPiA+ID4g
PiA+ID4gODhiZjM5ZThjNzljLi5hMWUyMmQzNTM2ODkNCj4gPiA+ID4gPiA+IDEwMDY0NA0KPiA+
ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gPiA+
ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gPiA+ID4gQEAg
LTU0OCw3ICs1NDgsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZw0KPiA+ID4gPiA+ID4gcnpnMmxf
Y3BnX2dldF9mb3V0cG9zdGRpdl9yYXRlKHN0cnVjdCByemcybF9wbGw1X3BhcmFtICpwYXJhbXMs
DQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyByYXRlKSAgew0KPiA+ID4gPiA+ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIGZvdXRwb3N0ZGl2
X3JhdGU7DQo+ID4gPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZm91dHBvc3RkaXZfcmF0
ZSwgZm91dHZjb19yYXRlOw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2hpbGUgdGhlIHJlc3VsdGlu
ZyA2NC1iaXQgdmFsdWUgZml0cyBpbiBmb3V0dmNvX3JhdGUgYmVjYXVzZQ0KPiA+ID4gPiA+IHVu
c2lnbmVkIGxvbmcgaXMgNjQtYml0IG9uIHRoZSB0YXJnZXQgcGxhdGZvcm0sIEknZCByYXRoZXIg
cGxheQ0KPiA+ID4gPiA+IGl0IHNhZmUNCj4gPiA+ID4gPiAocmV1c2UhKSBhbmQgdXNlIHU2NCBl
eHBsaWNpdGx5Lg0KPiA+ID4gPg0KPiA+ID4gPiBPSyB3aWxsIHVzZSB1NjQuDQo+ID4gPiA+DQo+
ID4gPiA+ID4gPiAgICAgICAgIHBhcmFtcy0+cGw1X2ludGluID0gcmF0ZSAvIE1FR0E7DQo+ID4g
PiA+ID4gPiAgICAgICAgIHBhcmFtcy0+cGw1X2ZyYWNpbiA9IGRpdl91NjQoKCh1NjQpcmF0ZSAl
IE1FR0EpIDw8IDI0LA0KPiA+ID4gPiA+ID4gTUVHQSk7IEBAIC01NTcsMTAgKzU1NywxMiBAQCBy
emcybF9jcGdfZ2V0X2ZvdXRwb3N0ZGl2X3JhdGUoc3RydWN0IHJ6ZzJsX3BsbDVfcGFyYW0gKnBh
cmFtcywNCj4gPiA+ID4gPiA+ICAgICAgICAgcGFyYW1zLT5wbDVfcG9zdGRpdjIgPSAxOw0KPiA+
ID4gPiA+ID4gICAgICAgICBwYXJhbXMtPnBsNV9zcHJlYWQgPSAweDE2Ow0KPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IC0gICAgICAgZm91dHBvc3RkaXZfcmF0ZSA9DQo+ID4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgRVhUQUxfRlJFUV9JTl9NRUdBX0haICogTUVHQSAvIHBhcmFtcy0+cGw1X3Jl
ZmRpdiAqDQo+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgKCgoKHBhcmFtcy0+cGw1X2ludGlu
IDw8IDI0KSArIHBhcmFtcy0+cGw1X2ZyYWNpbikpID4+IDI0KSAvDQo+ID4gPiA+ID4gPiAtICAg
ICAgICAgICAgICAgKHBhcmFtcy0+cGw1X3Bvc3RkaXYxICogcGFyYW1zLT5wbDVfcG9zdGRpdjIp
Ow0KPiA+ID4gPiA+ID4gKyAgICAgICBmb3V0dmNvX3JhdGUgPQ0KPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgIChFWFRBTF9GUkVRX0lOX01FR0FfSFogKiBNRUdBICoNCj4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAoKHBhcmFtcy0+cGw1X2ludGluIDw8IDI0KSArIHBhcmFtcy0+cGw1X2Zy
YWNpbikgLw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIHBhcmFtcy0+cGw1X3JlZmRpdikg
Pj4gMjQ7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaG91bGRuJ3QgdGhpcyB1c2UgbXVsX3UzMl91
MzIoRVhUQUxfRlJFUV9JTl9NRUdBX0haICogTUVHQSwNCj4gPiA+ID4gPiAoKHBhcmFtcy0+cGw1
X2ludGluIDw8IDI0KSArIHBhcmFtcy0+cGw1X2ZyYWNpbikpIGluc3RlYWQgb2YgYQ0KPiA+ID4g
PiA+IHBsYWluIG11bHRpcGxpY2F0aW9uPw0KPiA+ID4gPiA+IFNlZSBhbHNvIHRoZSBjb21tZW50
IGZvciBtdWxfdTMyX3UzMigpIGluIDxsaW51eC9tYXRoNjQuaD4uDQo+ID4gPiA+DQo+ID4gPiA+
IE9LLiBXaWxsIHVzZSBtdWxfdTMyX3UzMigpLg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyAgICAg
ICBmb3V0cG9zdGRpdl9yYXRlID0gRElWX1JPVU5EX0NMT1NFU1RfVUxMKGZvdXR2Y29fcmF0ZSwN
Cj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsgcGFyYW1zLT5wbDVfcG9zdGRpdjEgKiBwYXJh
bXMtPnBsNV9wb3N0ZGl2Mik7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBVbmZvcnR1bmF0ZWx5IHdl
IGRvbid0IGhhdmUgYSBoZWxwZXIgbWFjcm8geWV0IHRvIHJvdW5kIHRoZQ0KPiA+ID4gPiA+IHJl
c3VsdCBvZiBkaXZfdTY0KCksIHNvIHlvdSB3aWxsIGhhdmUgdG8gb3Blbi1jb2RlIHRoYXQgKGZv
ciBub3cpLg0KPiA+ID4gPg0KPiA+ID4gPiBBcyBwZXIgWzFdLCByb3VuZF9jbG9zZXN0KHgseSkg
d2hlcmUgeCBpcyB1NjQgYW5kIHkgaXMgdTMyDQo+ID4gPiA+DQo+ID4gPiA+IEluIHRoaXMgY2Fz
ZSBtYXggdmFsdWUgb2YgeCBpcyAzMDAwTUh6IDwgMl4zMg0KPiA+ID4NCj4gPiA+IEJ1dCB0aGF0
IGlzIG5vdCBvYnZpb3VzIGZyb20gdGhlIGNvZGUgKGFuZCBmb3V0dmNvX3JhdGUgaXMgdTY0IHNv
b24/KS4NCj4gPiA+IEFsc28sIGlzIHRoYXQgZ3VhcmFudGVlZD8gV2hhdCBpZiB0aGUgdXNlciBw
bHVncyBpbiBhIDRLIG9yIDhLIEhETUkgZGlzcGxheT8NCj4gPg0KPiA+IDEwODBwQDYwSHotLT4x
NDguNU1IeiAtLT4gdGhpcyBpcyB0aGUgbWF4IGRvdCBjbG9jayBmcmVxdWVuY3kgc3VwcG9ydGVk
WzFdLg0KPiA+DQo+ID4gMzAwME1IeiBpcyB0aGUgcmVzZXQgdmFsdWVzIG9mIHRoZSBwbGwuDQo+
ID4NCj4gPiA0a0A2MC0tPjU5NCBNSHogYW5kIDhrQDYwLS0+Mjg1Nk1Ieg0KPiANCj4gT0ssIGlm
IHlvdSdyZSBzdXJlIGl0IGNhbiBuZXZlciBleGNlZWQgMzItYml0LCB0aGVuIGtlZXAgb24gdXNp
bmcgdW5zaWduZWQgbG9uZyBmb3IgZm91dHZjb19yYXRlIGlzDQo+IGZpbmUsIGFuZCB1c2luZw0K
PiBESVZfUk9VTkRfQ0xPU0VTVF9VTEwoKSBpcyBmaW5lLCB0b28uDQoNCkl0IG5ldmVyIGV4Y2Vl
ZHMgMzItYml0LCBUaGUgbWF4IHZhbHVlIGlzIDE0OC41TUh6IHdoaWNoIGlzIHZlcnkgbGVzcyBj
b21wYXJlZCB0byAyXjMyPSA0Mjk0IE1Ieg0KDQo+IEJ1dCB0aGUgIkVYVEFMX0ZSRVFfSU5fTUVH
QV9IWiAqIE1FR0EgKiAoKHBhcmFtcy0+cGw1X2ludGluIDw8IDI0KSArICBwYXJhbXMtPnBsNV9m
cmFjaW4pIg0KPiBpbnRlcm1lZGlhdGUgZGVmaW5pdGVseSBuZWVkcyB0byB1c2UgbXVsX3UzMl91
MzIoKS4NCg0KU3VyZSwgd2lsbCB1c2UgbXVsX3UzMl91MzIoKQ0KDQpDaGVlcnMsDQpCaWp1DQo=

