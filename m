Return-Path: <linux-renesas-soc+bounces-32099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBePOTZB+mlCLQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 21:12:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0464D30DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 21:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1875530182BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 19:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB6D4BCADF;
	Tue,  5 May 2026 19:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fFJWz9O0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FA48BD3F;
	Tue,  5 May 2026 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008372; cv=fail; b=EzEftjFaPEeNazJW4/cOBmITzuJKsHFOWlWlfjSevpQ5aMY8IVHgiSN8CtgPuiVJPsqJaf2m/p/ca5JCU+npSXDrScyFvZSzPE7XBzUKSd3x7PSoSUyqvjk6CV9Xf4RtA6ffEA1q/UW9ykD79TBtoT/adGLqZ/1le3GymLvN4BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008372; c=relaxed/simple;
	bh=NXXix0QOXsnJHEewS06Eh/n2LsmUqKIbpGKOS9t/0so=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=E1p4ZQu7+M/FFzKdGNlxbnMhtJY4xNyOabLctuEgOQ5iN2vQXvAbpiqUSAXGcw/otff7fnOsVfkKJb6fYQ3uysZC6QDXdq5bTHapXDiLaWShwLM9f+x83ptauZJJz/vq8VEtyZoXekKVUnx1fqL70ap7lLYQl7X42L3ypUoHuqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fFJWz9O0; arc=fail smtp.client-ip=52.101.84.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVjA4A2hyA5oz9OEpJ4iDJMD6Arg9SwQAoY98TFkUkEwYnX/8DO8HXjLS3WL2ix9EkZdj2ZZ3FYprv38XMomfv1owIsQO1fd0tlpFIAlVy295IXywIQfIScNZ13AByIX90gJEPiy2cyP9or+wp9FRiC453v0a0NCWU6G6lfZRovWf4ATqdpLtP004HRstP5DwV34VDLC9gta+LS+s73DMg+zXfVTFM6nyVDjLn9k6RiYZEvhbWpVgvTK7R9Khgl4xm1CC3MecRNW6aYxQylFu1XkeZdDHaptkGe6cTgOOlZIz5uwXemKYOd2uzTDIvLT3ZFclWgrcsRe/R9S4nU+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PabJ7NwjyrhFI3xFY2PR27qb5l47JerJzCUyeD3EeYk=;
 b=jNbFGVwTsEE/72eEuOYNF9GnMTT0PWCAJXka8gjSwT9oJPNmUWGIrbBnfiSVY6Ar90TcZff4JHS4vKjozaiTi9YXdx8sQexIK5DRkzneSV4K3LeV9SMaStm/KMMM1mGrrwvOhDXqOfozpI6G6oXEvS9DAvpr0mqNVRUROG5ad6WuCJFRUroYqx8uJKUFzTm4fcJghjwAxPbtUvcnRff29kcSz2y09NN/XqBMU5BeCSEcgl1qSb2lrzKYrXfq0ZUR111/KiJd2RuT1VoLafuKkV49ezG+RSF7Ksr/56p7LoYUH9FMvOCoZyzxN9OhLzQ1EBZfgLNExuXXxTyPSIdmLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PabJ7NwjyrhFI3xFY2PR27qb5l47JerJzCUyeD3EeYk=;
 b=fFJWz9O0UPJyZgEHnF1Q5K1fb0gVxyV0ZR+e0noeoHbIMTsOG/EhPK77ZDlvwcqoYqf/GJr00iItK3lO3qxII8+kpXzYrSaC1T5ZuuAFH0vVSKdFW/aGMi29JMQ0Ud+o47ZlvCyaplZUBaWKd6oBQ8oCPBuiFdximcD7WD4xbCtlGWFmJEVatGM6J/2mjAfLJBrpG4ZKK2E8L/LcNrAwGbyC8l3h6g9JXCK6tTuIK/w6CaATFWmN3n/dLJYEJvloZ/P/Pbs1sJ9mP7/5MPqOxDzoMxdxaaGfxQa0Q0yfhqRV7hDrxcx5t8iaZl00jF7grVFv0kMGaMrzEkTYs213gA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7663.eurprd04.prod.outlook.com (2603:10a6:102:e9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:12:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:12:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260326130225.1406806-1-alexander.stein@ew.tq-group.com>
References: <20260326130225.1406806-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v4 0/2] Support TQMa8QM
Message-Id: <177800836406.1910663.18050002972728169453.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:12:44 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN6PR16CA0048.namprd16.prod.outlook.com
 (2603:10b6:805:ca::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: e8befa3d-ae78-4714-f29f-08deaada4ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zL+K+2vQ16UK31SmFVhPgG9/IbOnBONRiQZX/uTaSbaD63b2XGmpdeCRAxVMFm3eh8vIGBcQ/O2T3ogj1kNkBKN9tLOYgptXcpKrf6wIanBzoKdWROb1MxhWpK1jbGGCpcNZ9lULhtiAW1B/FJpoFVkYpYhtxGJP3BpNSQ9SGCUSml5mRH5kTRuUTEWbYARCAGu090rzmqAtfI+HMva0BnMUJ4ABAYt2BvdGm9onZwUapYJWGipQR/B9jD34pvHPq9kudxAefkFUdxDCEBOKlWylnAUPuSBQ1UgLafsjqUwM2V+9hRRZ5tdm36eVc8gHTWOnoDRSGRjqLXPeHtwCdARj2rLLe75zkrnOFF1C3DK6pN7ywLdIQXt0QVy5EeCV+AA4KggVKQTQ8MXlSyvht94w0qwaue5f9BPPdNfoANUCrUPZZgNT5TpiWCoemgbaHDhwx5s0ZihOenLxnR/cpmt27QT4s/E9a8r/qEJvJ1epNBM9fKqxjo506e2q/ResXk4K22ERDf0ylHtyQWILlOk5BWD7bgFa9V7UAUFMexZJJnDdfALdZ7+SNTwwz0QAE2GsfB5bP8OdWk2jp5e6PFgErTytcIbJVSDr8xxiw+GygRNi5DzpPd/9u14xH3mqkTpjz2hDtEOpF4skN3g3FP4uN2UKTmg1HfCzQx+KC7VsVSjscAdYwg225QSrT5rA0wqJz2jKu9xUtlxTfvPNghr+rb8TT5/DD73Tiv3B3yW8o2YZpX21Veb6LByO00T3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWVzZVppVnU4N0s2NStxNDFXM09kZDBwL1I0cXVDMzJzbkNyMzBxeUlOK2Ri?=
 =?utf-8?B?ZlBFWVZTQmNmZzFKYVExVmlKVmxQdGFtQXlUSlh1T083bjJHUXc1Zy9wVDFM?=
 =?utf-8?B?eDY0NFFkdVozWHNnZm1QMVE5a0N2ZlJjR3Mya2huN1lzTWVDdTRnaUJjelh6?=
 =?utf-8?B?eEh3UlpNM2duMFAybGFubnNqbUp0a3R1QXhPUVJ1SXJMYUNpWTUwK1FuOWdq?=
 =?utf-8?B?V0Npa0ZXdXU0TDdEQ0tpVFpIR2VwQXRibjJLelpuT3Q2Wmw0MC9IZFJkTVY4?=
 =?utf-8?B?YUxWWjB5ZVRHR1c5MW1nWmcyYkVoK1EyVmZxM3RURThIblIyN05wMzlZbE5X?=
 =?utf-8?B?bG5kcFlvREgxbnljNWd4R0ZZZ3I4U3dZZzlXWDhpZXFLTUx3UXJpRU9UN0tn?=
 =?utf-8?B?M0htMmw4akNXZ0pXcEpGOENySlJlbnF5T1NlajA2SWNIK3dlTTR4cWxqbjNF?=
 =?utf-8?B?ZEtwM294KzY0NVhGV1BnT2t6MWtXT21HR2FncnFCS2lLU0RqRG5PaTR2Tk16?=
 =?utf-8?B?NmlnQUZpUk9WQVlMcDY0MkpIQXA0M3dYNnlIU29ndUY4S3VJeXRBbVBTdjNT?=
 =?utf-8?B?TE5rQzRCcjUwa09ZUG9NM0FqWVRIa0pDOHJaelNvWkhUV3ovK1psWXcrSVZT?=
 =?utf-8?B?Z21pNkxoMVVkYXVxbE1FVFBpVVFXdi8xa1NCRkw0US83Zmx4VFdxU3ltL0FJ?=
 =?utf-8?B?MkZuandrcjhZK0xJSDljY1ZGTGpJa05zYWNGT3hKaklwWS94aXF2bDV6bytN?=
 =?utf-8?B?UTFNL0FEamVyZFR6VW9TVDdIaHZZem5PUTlwMysvWnR4TmdmM01wTk1IZjNt?=
 =?utf-8?B?cTNzK0ViY0dINlV3VWsrNzlDSFd4QVVWY3VDQVArNms2aWN1c1RrWTlISWJN?=
 =?utf-8?B?cG12UXVWZW1WVnpQWUVsZjJFWG9pSDVsMHZTVWEyMVkwVm9zajV3RTBmenRi?=
 =?utf-8?B?dXlONVZXY3I1WkV3MDFhZjN1RlNUZWsxVUQraStpZVV3Z1c5WGx2WW4xdmNT?=
 =?utf-8?B?bjBRNjQ0OUVCc1o4eUVZaEhYUnhxVnR3OHJ3WGRTbGhjdGRudjhqaUpYdEh6?=
 =?utf-8?B?TGVQbkxHR2hOVFUwMGNnRVhhMXlDT1pCT3RSUVQ1bHlDMHlWWHJ3YW16VmMy?=
 =?utf-8?B?SC82QkVjb05odDBUMHNSayt3dVFlN3Q5eVJCVDJDVENWVUgycERLT05IK1Z3?=
 =?utf-8?B?QlBKVUdPTTlQY0MvbHV0YVhEcFg3WThsRjNuRDhnVGJjUHNZNUk5OHJhdnRX?=
 =?utf-8?B?Q1BRdFlHaDR2N0pna3NoUkVoaDV6VHpuTjRlUmRsUDZqZEhpTlNLZ0dXYVF4?=
 =?utf-8?B?R0hHTDF2MHZBekE2aXlrdDg0dytocnZkT2dMdTR6VDI1dHVsQkJaNmYrOGla?=
 =?utf-8?B?OFdQa05KMkVQWjBNeU5VZ0dIRXdjRlJBT1RUYWU4NE9nQXpmdFVuUFhnUXJ2?=
 =?utf-8?B?RmZ4NGMvV1Q4bmJSd1BhazR1QUF5Y0FXZ0kydi8ra1pqeWZ1QTJmN2lHb1I1?=
 =?utf-8?B?WXJQcG1xbW1QZkdvM0xVUi80Y2g0dmRteXh0REtvKzczVHFpVzlnaDhuUEdI?=
 =?utf-8?B?c1pvcXc5ZWs0aHA4QjdFK2ZhUzA4VzgvQXZadkx0UHBLUkVZZUFPbnYzMkRm?=
 =?utf-8?B?NUdHRVhCa3QybUxpWkx5eWl2SmtPRU1XbDBNdnJZSGZlWmtwem1xQ0ZEZmxk?=
 =?utf-8?B?TzUreTZieFRQSllCR05ZRDFjZ2RycFBvaWR3OFlkQ2Y0akUxN0Z2MkVlOVBV?=
 =?utf-8?B?RVl6elRzRVAzVHVqcUNzT1FQLzNRZU1yVEFVRHN0NmJ6WWdIbHJsakx0dGV4?=
 =?utf-8?B?dHVoY2YyQkc3VEFLd25ockRPQnBuMkhUZElKUitoTVFseXhzai9Nd21XVXJS?=
 =?utf-8?B?WXF2SmJ3bnpud2IvZlZRemhqU0dlTzhDUG1Xd2c1ZnFUUkpGRnpTa0VGV1R0?=
 =?utf-8?B?UHlOaVUyMW9nVHpJRzcxVzZDcXFOZlY4c2xFWGZseU9INVJvd0JCc3ZBd3RO?=
 =?utf-8?B?ZUpWU2hRRjcxbjI2NVVnRXlrRkl2V252NmNhdFQvSDFVclBVNGVrbXJxd1NZ?=
 =?utf-8?B?SEJvc1VMQ3BnSmE5RElvUllNdnFPZ0krNEJCUzlMUjJvU09idkw1OHVvYVhy?=
 =?utf-8?B?NjNvM0FTbjY2NGl2dzNYbStKM3JvMU1BQ1BJczF1RlJ3OHl5bTBTOEZLbVFC?=
 =?utf-8?B?VUl6Z2hMVWs4c0hRMnRUUVFCRFRmVnlZbXpRNUZqWit4NnFGbFVwRjF6Yk5x?=
 =?utf-8?B?S09yNjhwcVlTT1gyUzcvQTVxR24vT1htSExuNVhCUisxb2ZBdkxBQ2NHMmU3?=
 =?utf-8?B?UDhidUlrcDA5Vi9tNDhHZjBNSmx5OER6OTEzR0M3amNwNWd0dG1jUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8befa3d-ae78-4714-f29f-08deaada4ac1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:12:46.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/vGEseSYJ9xQgYABHmJuMbQ/4EX973vEFT4QrlykvCjMLJfCYVPDsKsMkwL7s+q8134S7LxWx+3nj7Sxng4SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7663
X-Rspamd-Queue-Id: 5D0464D30DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32099-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,gmail.com,kernel.org,glider.be,ew.tq-group.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]


On Thu, 26 Mar 2026 14:02:20 +0100, Alexander Stein wrote:
> this series adds support for TQ's TQMa8QM. In v4 several prepatory have been
> merged already. So this series include only the two missing patches:
> 1. platform DT
> 
> 2. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
> workaround. See [1] for details. Split into separate commit for easy revert
> once an errata workaround has been integrated.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: freescale: add initial device tree for TQMa8x
      commit: da8dafc4dd394fa287def25bbce51eff3f761acb
[2/2] arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
      commit: 5d20f1ccb3393a2ccb3f3505891066ddff39167a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


