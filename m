Return-Path: <linux-renesas-soc+bounces-31389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D5IK4aO5Wk7lgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 04:25:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C7E4263D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 04:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F05663002D17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 02:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1BD316189;
	Mon, 20 Apr 2026 02:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XV84nPym"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401411C84A6;
	Mon, 20 Apr 2026 02:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776651905; cv=fail; b=OpQvoBZrF07WTGqwnwK66leGQ6J4cBrAoAqExNdfcftwCQZ0uRctXSRaOKSEP+Fk5e/whAd+GauptxZxCEkd0EeLgTM0XEG9+kZocvTGqKCjAG4eWjVGImo/IFgycCfF8+eeeQHUU84btYDe+5gndOCPesEO9sndSLKyOpZKtp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776651905; c=relaxed/simple;
	bh=KvO3CVSvCI3+5caX6CibMHTXBW9bEWDCbDpnuEDxyDo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eyiqERz07bFUoejZWWDf0Bg0eKLZT4WyPG66gvqDntAYlsQHyOb497duWBQjgcSXHDsgiGCTyYrDXq1Ot90jr8CQv2YxqjMpsDkVaaoEOLaNZzMpL8m1zA7GI5gI2bNxx6LZ+tz6hykx25cSHPwj468nr7uoYVMLtk62wmLNG3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XV84nPym; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0LOVKVA3lisbLik/ZCutuM2ioCkwcVNyMff4m4mFWYeX/3OfgjYzUVmBlilZAkufs0FcR+KF8E8bFgw5KzGZwXaCWWWUxnL33ZFz+fX0j4MFb8e97OaIIIXiQlMa6AokuwgrxlCPuaQjEBNr0DWBDNlcwJA0852UVavJZ3OIhO5fD510A1g2BRPKLKVj2Dmn2RVTqgGeNeqTQvaJq3lsNreOEjqPRnngwz0nkPGapoDNm1x7ZxIAtlKa+YLYfjtEhZsRI2rERQcaUiAtDMzTSfEYmMJggkePTog6elkJLZxYxjsifIHS1Tzb2ikwPkAjLMmcleRi1E8/ZaOpKCarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuQNH+q0Novvj+IwSSfJWGCBTPA0wR2nQdECqge5hWQ=;
 b=lkOzYrTxF1T5iU8lUgwBkvOHP+mjjeKCKzuEQap5okiIqi8zD3vNRZO76JvCvmcdk44aEnGWPPerV/oCyEycU1QB7ouhLXgCxTZkbZwJXp3T+CKg89txinIj6qFaulgDAxcjNb1u1My0SOmqotn7/fyleu77+9QHhfCSFuDjKXVfm90F960TjZtEfR4LXD2SXh9DuZORkrJID3dBjfRTZfX9YSB/SF2HrHXfo6BPnmtBESTnmgaNwo/njLeoQ4aOZ1BZuJHVF2b23JvvFKF0xeh6LkbZuoOLBvK+/aVLqMK5W2eMb0HgrMnVSBstlNZGZfKCDuTNgsB0iD2zuritHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuQNH+q0Novvj+IwSSfJWGCBTPA0wR2nQdECqge5hWQ=;
 b=XV84nPymjRPoWz+PW6TA4iFWaTqwiIyxZfxAJfaCyQxQXQnQCj6QIxe6JucPxoLNVP12dtsW1e8YsExeRn6IasjFWGwSHjaXJOVSqA1e2ahGhnidvW4EUWhKM2gKrRSs1FCE09GTAU35uv3KRaQEGGf1TgfGgRqogeJWPVsTAI1gUkiKNfpBmytsb4fwmBry+ms04kdYvmt1+wwhB0hA538sKL0jORQhNcHurBh8fDr7B95tlZgQPave4eZGaYb2p3IwTkXc0HOr/87SqVya48RK95v1XckJWA7MXw+8iAeEPvNMBQxMafVlq0/YiyvAY9fnyexrjq4W+J51Rp/yxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19)
 by DU4PR04MB10622.eurprd04.prod.outlook.com (2603:10a6:10:593::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.30; Mon, 20 Apr
 2026 02:25:00 +0000
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4]) by AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4%3]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 02:25:00 +0000
Message-ID: <d6dcdce0-6ff9-433a-963c-5f0ea9f2a9fa@nxp.com>
Date: Mon, 20 Apr 2026 10:26:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
 <00e2f34a-c488-4a61-bb87-0f0431990c3f@nxp.com>
 <TY3PR01MB11346B5C92803F6A3D174ACCF86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB11346B5C92803F6A3D174ACCF86202@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:EE_|DU4PR04MB10622:EE_
X-MS-Office365-Filtering-Correlation-Id: a32608ae-b668-462f-9b25-08de9e840568
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|22082099003|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 tj5I9tsvyTvs0rTFXLrRVpcsV+Pc4vzQ3lsKqlabSJ3XHCgPRdHGyzeNFtF67zdzxuE7j6OG9ToLxdqiX30QfTJNlRzXPZC0U2+4yvhYnflKmD+km7Y6D9Xl/y26yK/nRUu2wooy/cp61Et1TiBrj4c5nvGTtszvQma95C3YCrjVR570eH9zzQjpikUVtbgx02syR0o3cycX0AUFmNIFBx5tK3AV2vccItdoNXSb44SKBB4ZztHAK77tywty0elUny2oJHSCGm4tPZ+btBjekzIN7tWE72IboOcC70xG0iG6QixVAVkblFlYTGDs8dgU+0pVffX8SiZJfQ6/8byBHIyeYx0Reqmv14iCGG89m1xXgX/2BNozF4rjRn8H+2RksyFtF3/K48m4RopbbNTdM3qdCk4W35ZX3+tb0GN6XxS5/ixKuW9NxwWrKHAiZKqm+WGATOFokpvP9FxRXODcBnwIcI+r+mqJXT1xvtv7l38EWuMU3GWgg0gehdE0uzlswUaPWyXIt9/dLquHaRQdzjk+5aAiR0VK0MPJDRFr2QMPAHLWe9ndeSLqMzjGvHVS1kC0PwTIPHhV4x69MOevoOat1NNW5pJ2ZoSWUkTCBULJ3tYuvclb5Ytoo0wtJV1oNf8sqxhBP/CkSIobFnBAp9NHTFTr3S+nGG4WmN5pYE5zLRqo05SEZ+An1o8DkCEIiDAAG3INH5SbYRu1G+o6EV4Mx+PtHB6/8YaQ/xq+qgKQfFWbvOVMjOg8xr6cpDNSCfVXY3XUjmrPlBEIvT7Zcg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7940.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(22082099003)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UzJmcWgvYmdYT0pEUk5tR1JGSWpBUTlwQ002dEkzcXVSNC9jUzVkVXY1VE5t?=
 =?utf-8?B?RVRIWDJ0Q3RTN2licjltNzhFeFRHeFJ4eFc2YUlkMFdhc2p6RjlWald4c1d1?=
 =?utf-8?B?OTdGMkQ5eTJBRjJCNStwVHFNQkt4ck5HeEJDcHZIRE10cDZlT1k2Y0hMVlkr?=
 =?utf-8?B?dVdsZ2orRGE2T2x4MmxsVG5aS0Z0T0VUaHBjWGE3bHRNeFJ5Qmc0SUpEUVVE?=
 =?utf-8?B?Q1dKalNCZURVUk8zNCsyZ0FUTWQrcS91RWlibmxwVjd3NnFGdnk1Um5sTjYy?=
 =?utf-8?B?anBEU3N3RUpZUDE4cnFLM09XOVpObVV4TzhRQXBnM0dFdmU0MzE5YWFhUXZF?=
 =?utf-8?B?amg1YndPZ1N5NlJ5bU5IY256bktPNEdoTUtTTXFLeE9QbkcxNzdiT0l2TXMr?=
 =?utf-8?B?dTZMMUk0NWhsVkRZU0xVWFBkVlY2Sy9IRHRzZGFObSt5cXBMWWk0anVQeVFZ?=
 =?utf-8?B?OFNQczRuS1NhUXlXRGtiY0VBSllRenVhZmlZeHhHbHZvQmdFbWFaUEorOVlH?=
 =?utf-8?B?Y3BWdTBCYWMrUWVvbFJ3OXpmKzZaRkl3ejJjUVlLbGRCWUthNkJWcVFsU1FT?=
 =?utf-8?B?cENqenQ5S2UyZXo0SFA4QzhGY0UvTzRoWWJqbTVZTWlpSzFPa1l3V3FEZkMx?=
 =?utf-8?B?aGNvVzlQc2RGZ1IzcUZDYUtjdlQ5TXpiV2NCMitqMklIRFlrZEJvRFRDNFM1?=
 =?utf-8?B?bm5rb0dCTkJ4TFR6MWdVanZLQUhzTEsxTlFudXlYTFRjR3NzUnFtYXljcGVy?=
 =?utf-8?B?Z1lxdXVvTDRHZ1I3RUZYbkJpTHM4b0c1TWppbktRTWdrZ3Fab3NGTDRvTkxB?=
 =?utf-8?B?czRnOHR3U2dqWVlRTkFtSEdRaEhKNmVmSXhaRVJRM2tXUVBwUGpoZk9xUUNU?=
 =?utf-8?B?TmRiMDBCT2Z4dkhNajZ2WnU0WUMyczlEcmtrVW9IQmlDWlR0YmdJa2NpTEFz?=
 =?utf-8?B?NlRXMTRqRjhiaWEvR1ZWYW5vOHdyMzljMjNLYmFwVHBUbTl0eWJTZ1BobWZ6?=
 =?utf-8?B?eXpQQ3d3OVpza1FRc25Ia3JWM1JBRjBxcXVVSCtONS9wR3JxSENQNHRxR0NC?=
 =?utf-8?B?R2RORkNSa1RHNTdYR3k0clEydkd2am1mbWhFUmRvZ084TTA5SjQvR0drQzlM?=
 =?utf-8?B?OHJJYnpCUEI5cHZ5cWczMFN2anNoaVJlQ3ZQeDFvNllIYk41RUY2ZDNsYUZj?=
 =?utf-8?B?dnYyQnNyOTEwT0gyTWZlek1OSitwc0RHNi9VZkFXQzVBTkR4SzM1VUcwMHBU?=
 =?utf-8?B?M08zdmFJc3l2dXpqU3ZFTU9JekRFYXAxQ2xrcFVKbm9xRzBuQkhQZTQ0alFP?=
 =?utf-8?B?V1FSUW5uUUNuOUtyK1ZOSEFSa0FOZHJhRjRQTkFWaWt6MDFnTXAxeVBJb0sr?=
 =?utf-8?B?LzB5NDdneTRneCtOSTdpNWVMY2pnSW5pdXJhT2k1ckhiL0dQNXZLUWJBYUpr?=
 =?utf-8?B?d2lQUUhFdURDL2hZSFdSbzNyRFVaT2NudFFobjdaVVNLckNtOXZPU0QyQjVr?=
 =?utf-8?B?NnhUZjlQcU1YemZoK2luQ1dZN1FxWXQ2c1FXaHZqdG1PVUhLK1liQjFQT3F6?=
 =?utf-8?B?MnQwRHlMUGI2MkFDMHpmNTNzdTdBNEZrdE9BUEdRNUcwVVc5d1FrZTkxM1hD?=
 =?utf-8?B?aDh1QktXWEEwSzZja21OT2tpSmk2OVJhZ25ZakdScTBMK1BhVm1sQ3lxbnpv?=
 =?utf-8?B?ZFhVbXFDUTczWjlXNTUrWUdic0R4ZDVlUzgraVFoeEdoR1R5MVBXd2dRNVpS?=
 =?utf-8?B?dWlIR3BZM0VDVjlhMEFCQ2xsbnl0TlFJdnVxWnd1b214WGlSSi81SmdhcEhP?=
 =?utf-8?B?d2V0dDBISkhLYkNIcWJ2TDRQY2g5RjBldnJhTTZJREZEM1dtUlNMZVFSUFp1?=
 =?utf-8?B?SXdERHVnMS84VzJqRXk4dmFHVnhHNHNUb1dVQ0VFaHcvcERKNVpIWlBXdCtl?=
 =?utf-8?B?SXlFYW8wNWVUZmwwYUZYRmN5a0JpZy93cDZqZWFWc0tTcnlsWlF5RUNFb1BT?=
 =?utf-8?B?MWl6TmxGa2ZTR0ZadlZHNnE3WGE4bm43Yk04Y1pHTm8yRnh1M3FrajFOZTJB?=
 =?utf-8?B?U0RZN3U2SDVaeE81ZENucCtlQjFFUGcrZWI5MW5iR1NxRVRJazI2TWc0VWRB?=
 =?utf-8?B?eHF0K3laNXhLbGh3RXR0aERaRCtKd3RtMTAxd1AyNElKZ05PU0s5U2ZNMDdn?=
 =?utf-8?B?MG93a25RemtUTzJzTS9PczBZaFJFQjRlaFRiTXRGR2lHQ0xUS1R0ZWUxR2c4?=
 =?utf-8?B?QkQ2QlVFemNBNkc0WlhHZzFSdFQxQ2wyOWFVZXcxazR4bzA3UWdGT24vbkIv?=
 =?utf-8?B?amw4SnVtUnBmR3MzYWZFbWgrdHppd3Jlbnl3S0RkaCtrWncyb0tHdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a32608ae-b668-462f-9b25-08de9e840568
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7940.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 02:25:00.0200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/C/QUXynXjgTM6mbnbWFv+Yof7dHSm55W+gwT/H986oLuX7dx3bKjnFnTzxTyosgnEOwP4CUgfPidMX0trdNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10622
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31389-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,renesas.com:email,aka.ms:url,smarc-rzg3l:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E4C7E4263D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:49:35AM +0000, Biju Das wrote:
> Hi Liu Ying,
> 
> Thanks for the feedback.
> 
> 
>> -----Original Message-----
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: 17 April 2026 07:05
>> Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
>>
>> Hi Biju,
>>
>> On Thu, Apr 16, 2026 at 09:29:25AM +0100, Biju wrote:
>>> [You don't often get email from biju.das.au@gmail.com. Learn why this
>>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>
>>> On the RZ/G3L SMARC EVK using PSCI, suspend to RAM powers down the ITE
>>> IT6263 chip. The display controller driver's system PM callbacks
>>> invoke drm_mode_config_helper_{suspend,resume}, which in turn call the
>>> bridge's atomic_{disable,enable} callbacks can handle suspend/resume
>>> for the bridge without dedicated PM ops.
>>>
>>> Introduce it6263_bridge_init() and it6263_bridge_uninit() helpers to
>>> consolidate power sequencing, hardware reset, I2C address setup, and
>>> LVDS/HDMI configuration. These replace the open-coded init sequence in
>>> probe() and are hooked into atomic_enable/atomic_disable respectively,
>>> guarded by a powered flag to avoid redundant re-initialisation.
>>>
>>> Switch from devm_regulator_bulk_get_enable() to
>>> devm_regulator_bulk_get() so that regulators can be explicitly enabled
>>> and disabled across power cycles. Move reset_gpio and regulator state
>>> into the it6263 struct so they are accessible beyond probe time.
>>>
>>> Add a remove() callback to cleanly power down the bridge on driver
>>> unbind via it6263_bridge_uninit().
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>> v1->v2:
>>>  * Dropped system PM callbacks instead using bridge's
>>>    atomic_{disable,enable} callbacks to handle suspend/resume.
>>> ---
>>>  drivers/gpu/drm/bridge/ite-it6263.c | 88
>>> ++++++++++++++++++++++++-----
>>>  1 file changed, 73 insertions(+), 15 deletions(-)

[...]

>>> +static int it6263_bridge_init(struct it6263 *it) {
>>> +       int ret;
>>> +
>>> +       ret = regulator_bulk_enable(it->num_supplies, it->supplies);
>>> +       if (ret) {
>>> +               dev_err(it->dev, "failed to enable power supplies\n");
>>> +               return ret;
>>> +       }
>>> +
>>> +       it6263_hw_reset(it->reset_gpio);
>>> +
>>> +       ret = it6263_lvds_set_i2c_addr(it);
>>> +       if (ret) {
>>> +               dev_err(it->dev, "failed to set I2C addr\n");
>>> +               regulator_bulk_disable(it->num_supplies,
>>> + it->supplies);
>>
>> I know that you call it6263_bridge_init() in probe, probably because you want to enable the regulators
>> for hotplug detect after probe(it6263_detect() reads register HDMI_REG_SYS_STATUS to do the detection).
>> However, an idea[1] is to wrap the register read operation with regulator_bulk_enable() and
>> regulator_bulk_disable() in it6263_detect() so that you may drop
>> it6263_bridge_init() from probe.  With that,  it6263_bridge_init() is now only called from
>> atomic_enable, which means that the initialization code can be open-coded and the initialization is
>> supposed to be successful(due to the "atomic" nature) hence no need to do the regulator disablement
>> bailout(error message in dmesg is sufficient).
> 
> it6263_detect() still works with regulator_disable(), see the logs below.

I guess that it works for you on RZ/G3L SMARC EVK because regulators are
already enabled by PSCI before this driver's probe.  But there could be
platforms which use dedicated regulators(like discrete PMICs) for IT6263,
which means the regulators are not yet enabled before probe.

> 
> 
>>
>>> +               return ret;
>>> +       }
>>> +
>>> +       it6263_lvds_config(it);
>>> +       it6263_hdmi_config(it);
>>> +
>>> +       it->powered = true;
>>
>> If you drop it6263_bridge_init() from probe, I think 'powered' flag can be dropped too.
>>
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int it6263_bridge_uninit(struct it6263 *it) {
>>> +       regulator_bulk_disable(it->num_supplies, it->supplies);
>>> +       it->powered = false;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>  static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
>>>                                          struct drm_atomic_state
>>> *state)  { @@ -587,6 +626,8 @@ static void
>>> it6263_bridge_atomic_disable(struct drm_bridge *bridge,
>>>         regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
>>>         regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
>>>                      AFE_DRV_RST | AFE_DRV_PWD);
>>> +
>>> +       it6263_bridge_uninit(it);
>>
>> Well, this could effectively disable the regulators and hotplug detection
>> won't work then.   So, again, the above idea[1] helps.
> 
> Is it not working on your setup? It works for me.

My setup uses always-on regulators, so detect works for me as well even if
regulators are not explicitly enabled/disabled in detect callback.  But,
as I mentioned above, we need to enable/disable regulators in detect callback
(also in edid_read callback) after atomic_disable is done for those platforms
which use dedicated regulators.

> 
> 
> root@smarc-rzg3l:~# [   33.512618] ####it6263_detect####
> [   44.008621] ####it6263_detect####
> [   54.504623] ####it6263_detect####
> [   65.000602] ####it6263_detect####
> [   65.227743] ####it6263_detect####
> [   65.233322] ####it6263_bridge_atomic_disable####
> [   75.240637] ####it6263_detect####
> [   85.480628] ####it6263_detect####
> [   95.720662] ####it6263_detect####
> [  105.960640] ####it6263_detect####
> [  116.200647] ####it6263_detect####
> [  126.440635] ####it6263_detect####
> [  127.048981] ####it6263_detect####
> [  127.517962] ####it6263_bridge_atomic_enable####

[...]

>>> @@ -858,13 +901,21 @@ static int it6263_probe(struct i2c_client *client)
>>>                 return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
>>>                                      "failed to init I2C regmap for
>>> HDMI\n");
>>>
>>> -       reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>>> -       if (IS_ERR(reset_gpio))
>>> -               return dev_err_probe(dev, PTR_ERR(reset_gpio),
>>> +       it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>>> +       if (IS_ERR(it->reset_gpio))
>>> +               return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
>>>                                      "failed to get reset gpio\n");
>>>
>>> -       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
>>> -                                            it6263_supplies);
>>> +       it->num_supplies = ARRAY_SIZE(it6263_supplies);
>>> +       it->supplies = devm_kcalloc(dev, it->num_supplies,
>>> +                                   sizeof(*it->supplies), GFP_KERNEL);
>>> +       if (!it->supplies)
>>> +               return -ENOMEM;
>>> +
>>> +       for (unsigned int i = 0; i < it->num_supplies; i++)
>>
>> Nit: I would define i together with the other local variables at the beginning of this function.
> 
> "i" is used here only. For me it is better than putting at the top.
> 
> I got feedback from other subsystem maintainer to use unsigned here
> as the scope is within for loop.

Ack.

> 
> Cheers,
> Biju

-- 
Regards,
Liu Ying

