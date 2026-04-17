Return-Path: <linux-renesas-soc+bounces-31342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCGBJuOp4Wn5wQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:32:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F34169B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A75F23038172
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 03:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF60359A75;
	Fri, 17 Apr 2026 03:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o+fr8xCs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7A42F9D82;
	Fri, 17 Apr 2026 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396768; cv=fail; b=J5SRROVh5sepVv5JamLCfK3witkFuJlI9oaxOx9G6g1r+UlcPxecn3sf7+3rjlWqwEnCZGUSuIFbHCQq9OSlhpXu5w/Ts2t7G9ruQxTjTLlmAF3m6ROujPksWpfCOVCtSxwb9pcDJVP2KQlAMYGiRsD/P77lMM4+3A/RRc5ffw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396768; c=relaxed/simple;
	bh=LaLT0wI4ZGwlmNsleGXSE4iA3+fk4WEAIWRh9fBfZTI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=q54buVzeIwUhAySqytD097BjT3jQ7G5CXfrm14fzIVqHN+EvosWrWxitIzQQ7XT+pYCeFpXF5pXStMsqR9tdBipxNPKhYMpsHmRQHSC1MJKjxTBi3WfFB08CWjhTIlRwCwZgS1Lk/QIx3CInqRJ76W7q8Ev1srpu6qYWILjaTBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o+fr8xCs; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+PEfnsayNQGtUbmuNkMB7bBPWIViBOF6c/J+8TdTsZqg4/aHjqaPIizHyFhuobgCE/FQyZXyiGIoERL566P2dAGy3iiOsE6p1tMA1QHlSsB+X/b8XZk/IPq4j2PUFsJjTWSMXjOD0kD/wJlyYDGbFcT3gkux2MzZQZHwIPwIuWqKh+wwt6rjPPomKRPPQuz9jKQP3r3ruWyWYLnhh7ZPMa/ntV1mHgAPYVsmkqhNMLvI02zkxh6KchxnYlU8JacF5njFStV4OP7Ri14y5BO/3qV28rzCsOUIMrtSzH9EakhS7JmywwlrOXL74XD5SEsFGOlWnVb5TFpYoq+IhWt+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXVKpLoIlJ9xREcUJh2NL1PwBNrMRpUufEb6P4YcIsQ=;
 b=DcVy9W2fQbk0Di9WNwwqNTBrtL+BCYbkxLO9VJyb1ve3DEeWbsLhS7jJd6gdloItcjhp1DhBcQZY585+YKNisOMBMH3n+vJkHgi4WoPEDxGVyHPqkFY+AHnInmGCnsvaBxxP4+G7aOX0vse//KODDxUUtUX1RWesdxr8n9eRnJ7IWosf0Ep+BTS5Lt8URyNrpLpfkkh6UDGhQF+oukRLjwDN+l7XrmwcfYkuJ/v9EC+GNaK0mItdd64a8nAFIsGcxxt5P0NPixbma+wNICm5Hs3ea+P8af6HPWdL1SFHE+xByF93U3kgXMSPukiq0WTGXIWfXDZ/kCnX/HB0d/DH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXVKpLoIlJ9xREcUJh2NL1PwBNrMRpUufEb6P4YcIsQ=;
 b=o+fr8xCsN5A3XNpOQQRESvWCY+YP5TJjiwp5IRJkYUXyTdJbXfh5Q7OlK3/3ydHJmGM8/qON1PE/Cz3QHSlQvCVLdoMOJQ5c/UX4BOlQ31tAnQNInMD2W9lYq/IxK8nsO7YP+K+qtOTu2RKRsmk+VO3T6QUrOdrnqwMrPGNiB2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB12049.jpnprd01.prod.outlook.com (2603:1096:400:408::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 03:32:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 03:32:42 +0000
Message-ID: <87ik9qz2il.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 11/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
In-Reply-To: <20260415124731.3684773-12-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
	<20260415124731.3684773-12-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 17 Apr 2026 03:32:41 +0000
X-ClientProxiedBy: OSTP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:219::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB12049:EE_
X-MS-Office365-Filtering-Correlation-Id: 046d7f4e-6ee6-4666-e035-08de9c31fb92
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MYl3BAbG3ZpiX21nL0hwPABY3rVVCDU74i2zLsnWMsUBKYbx3HCITTIrA8OZq9gaPqJt45SY06m2AA6cGVjfTVgE3BnjKJOKhIZE9HXDQP7cxcpexanD9JtBg3bsP28ZsYOPKKWf+I/R8MPt9jWYDFSIyUAZTYWOfkqKK86codZHdO5ghr+DG9EMK7OtsAIGnIYeQ3QCZqrVmo1w1OiHQCHx4cLkvnhoMVKpQ8PbVPaX1v0kexiFE1wn4GAYQBt/DvjmMzsXx8p6v2WXDHjY1rmOGzEQ02p0ThI+oME/g+6dYl1vtXxJr3x1mCdaJD1mjQFSHID/mzH3594/Al6Pnqhi3CApuYuMMyIo/2LcxOudqQXpK1ePCIRqP1XZVrOyKbs0K1c4uk4/Mn4pEf930WU0Xhh3epZIazwgtq5evB3OqAdez3HPyQes1P5RIHeaY1KFXeDoOQJyUhKKQSR+mg1/PemykSMguLZhsw/N61FNo8i1m1jX+rCsajZZwt1ZJnhO4XxpE0cUdkjmqAC4xSDiafK1bC/GKNE5jeKvz7W+5hcydRN2T8baSUe9EQPHmbDR4EFSxbrrubSq9Zn1b2jrYXkTRhlMy5R/hIw70OQpNWkYG1F6nVYIeCioEyJAxJUlwNYu2+4vVqCKNn/rC8B8ZOiLJfmvonLbbFByYzSRXJl/bhXFDRP20ptWiz6p9L3zi5pHkdiPfzYAfZCRXTDd+K0s+64SlgsWtFiOXP4A0bFN1tXdal2Ul1ZOpuKyWah5zcpdXG+MSh6Zb16l+akgHh1toeT+30Rk+7zykRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u8bYRXVKcx4558Bkj5n+mq75kjq0b/B0dES9EpxB+767T0NYgRAKASUsYazI?=
 =?us-ascii?Q?a1PAUSlYPYMGC6mk7QXZMxJjyJfiFtGWqIKjo8ghRTl9STazx7zbTAG2v0k+?=
 =?us-ascii?Q?GWo04fBk9BpNwnK7VyIWmYBMvX1GJlOGt+Vvr8uL/4yYQbXVZbYEred0elqL?=
 =?us-ascii?Q?p6Q/FpNkFmK+JxbiwI5VNkFp1774Uo1PdET2cHF6Lt5av1K8MAPZL9gpjJh4?=
 =?us-ascii?Q?fOwKIPgcaZV+BVk28Z2FUe3wli1iCjOfvh+fUmpLDfz1t2PsJD1RYfQk+LYg?=
 =?us-ascii?Q?Y9KoWE6GSedi9eEv+S1IfLhzPTqE3nPRtWk0ZB1mE9W/e9Wzlo940rf1nXmF?=
 =?us-ascii?Q?Pdv8GB/4GoGY0GqK8tYl5l/csZwi5OS3zTwHNUvbD4G3gLdzRdzc5J+K79pG?=
 =?us-ascii?Q?ZB1jVkGWZ9qwxVjKVxt5mfr4B6TZOfP5blxIH3/p+BCgTfa1nVrGAgdoJfeY?=
 =?us-ascii?Q?m4o5tW2T1amVefx9l/z+VAjNfprOHkTnpMk8YZ1eUPsdOkHg6yJwXcEHNtd4?=
 =?us-ascii?Q?AUVW6CAnBhHBFEJgQSjgDsm2hXY23Zu3ZUJ6upVcOBygG9nZ9MQzzIWZn3X9?=
 =?us-ascii?Q?x1uI6uPT+9ZBIYtrUm3VonpTnbKJVa8az9GCyd/yjv/ia0h9sK9f6PxIQkq4?=
 =?us-ascii?Q?rH+D0G9gVzt2ezYrvy2ezaRNkmQZagjcYbDNuDzi3xo4Y9MU2TapYPGs/o54?=
 =?us-ascii?Q?wh5j4fMbvPwjhTE7OUyz63BraV7y52Q8G6KethSVSXzbWrpW4fuqkNi3WNuV?=
 =?us-ascii?Q?zN73eLHUZFFIVmt3uIYxTRnIFGMIjjPCuWTJGTi+yquWqUUTmV6UK3X1P89H?=
 =?us-ascii?Q?87xwjy6MwwU7dlwKs8YW3RPxT6hS0aKbDHLMmTwUJLjUULOzgc4WAEq9a8Lv?=
 =?us-ascii?Q?wBMfHXAoSG2Wp0cnQ/SBEV6J5w6/zfPTQtmN5BkBHB5w/VV5d+7p/dKsRM8G?=
 =?us-ascii?Q?S8tYlsiQE21UnNSw3kFvyDcBfSJHdTDxA8sZ+FxwngtuK+Q90NAMZ7igKA2f?=
 =?us-ascii?Q?dZ0WP1CwGYaGJcPhmzMou0ooChYNyVoidiMXokhUNUocYbdyjF1ksliT8R3i?=
 =?us-ascii?Q?9IT3/7Fi4+PxwJVx6v0NubGuo5t3H0KVhnTy3odNhimwgxqDwvdV9mHPesbc?=
 =?us-ascii?Q?EauCwb6cSbE3M81NKMyAm/tjBMffriUZ3EDOrB7DYT/5Gp0RlD4oSGRo+1QO?=
 =?us-ascii?Q?67KgVb4sxhTmAm7vsZ2Taeg64TYSkIrHjlJMKjBh8s4boze/MplB0Hg4xUn6?=
 =?us-ascii?Q?tEE0TLpkUrcVbIqlYKsPFt7BoWbophihynjcizs6AqNu88tgK7k2CGlqrvrO?=
 =?us-ascii?Q?WEbkujtpYmq+Qdn016EHcr15vy05+1aUGzAeKSnwX11WKxeH0QVnEo5o1uxj?=
 =?us-ascii?Q?e9EYRjaQ+jhBIIOkB4ZrDeIak24B9+RFhEz6VyBd/dss0eezWSrbteYfdKvW?=
 =?us-ascii?Q?NF3jfim5lkVcJpR3hy2RWR1Bwery4v7jEefflIQhFcAx3eAVJ8VqNAzOJVb4?=
 =?us-ascii?Q?hwS3tzCwfBpNg5EUY63ecKogGQwnfjw6xirXyJQY5KKKuQR6zKpVry/787It?=
 =?us-ascii?Q?xF/O7KO7j8MoOjk2rxryzI+9ORt4nChyJWS/yolpzT4f3jAINX7nPLHwZikX?=
 =?us-ascii?Q?OiTAc7fVNULv91VvwcyNsa9hfJnhIFutntGzJY+4vPCiB3vna0+iWKBSvW37?=
 =?us-ascii?Q?kprR5PDvigh2gKHUzPLxZuNf3BEWGOJ+mRnQFiZ/E6AZrSB2DdYyqn/3LYMf?=
 =?us-ascii?Q?zfR9x8CdppQc2FhBRjH3FX2i/9ql8/PkJ7KThw8Q9B+1BTBKEG2o?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046d7f4e-6ee6-4666-e035-08de9c31fb92
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 03:32:42.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHSFO5V5RufjgMqgcWWSFf5r7Qd9qfWZjnWTDsnCyiQr6yVOKZIcgiTIejuTD1ncf+GKG5woMAG0HL3OcfmFwsCyLP/yhg1WUJD+RyMrQggTrFoeQE+yaP+qF1k7XQ/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12049
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31342-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB1F34169B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

Thank you for the patch

> RZ/G3E's ADG module requires explicit clock management for SSI audio
> interfaces that differs from R-Car Gen2/Gen3/Gen4:
> 
>  - Per-SSI ADG clocks (adg.ssi.N) for each SSI module
>  - A shared SSIF supply clock for the SSI subsystem
> 
> These clocks are acquired using optional APIs, making them transparent
> to platforms that do not require them.
> 
> Clock prepare/unprepare is handled in rsnd_adg_clk_control(), which
> is called from probe, remove, suspend and resume (all sleepable
> contexts). The trigger path (atomic context) only calls
> clk_enable/clk_disable, which is atomic-safe and requires no
> additional splitting.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> @@ -424,9 +455,35 @@ int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
>  	if (ret < 0)
>  		rsnd_adg_clk_disable(priv);
>  
> +	/* RZ/G3E: per-SSI ADG and SSIF supply clocks */
> +	if (enable) {
> +		for (i = 0; i < ADG_SSI_MAX; i++) {
> +			ret = clk_prepare(adg->clk_adg_ssi[i]);
> +			if (ret < 0) {
> +				while (--i >= 0)
> +					clk_unprepare(adg->clk_adg_ssi[i]);
> +				rsnd_adg_clk_disable(priv);
> +				return ret;
> +			}
> +		}
> +		ret = clk_prepare(adg->clk_ssif_supply);
> +		if (ret < 0) {
> +			for (i = 0; i < ADG_SSI_MAX; i++)
> +				clk_unprepare(adg->clk_adg_ssi[i]);
> +			rsnd_adg_clk_disable(priv);
> +			return ret;
> +		}
> +	}
> +
>  	/* disable adg */
> -	if (!enable)
> +	if (!enable) {
> +		/* RZ/G3E: unprepare per-SSI and supply clocks */
> +		clk_unprepare(adg->clk_ssif_supply);
> +		for (i = 0; i < ADG_SSI_MAX; i++)
> +			clk_unprepare(adg->clk_adg_ssi[i]);
> +
>  		clk_disable_unprepare(adg->adg);
> +	}
>  
>  	return ret;
>  }

As mentioned in comment, to avoid duplicate code (like above), it will
call rsnd_adg_clk_disable() in case of rollback, too.

	/*
	 * rsnd_adg_clk_enable() might return error (_disable() will not).
	 * We need to rollback in such case
	 */
	if (ret < 0)
		rsnd_adg_clk_disable(priv);

Because of this style, I guess "enable" need to call clk_prepare() for *all*
clk without loop break, even though it returuns error. And call clk_unprepare()
for *all* clk when "rollback" and/or "disable".

Enable
	for (i = 0; i < ADG_SSI_MAX; i++)
		ret |= clk_prepare(...);
		    ^^
	ret |= clk_prepare(...);
	    ^^
	...
	if (ret < 0)
		rsnd_adg_clk_disable(priv);

Disable
	clk_unprepare(...);
	for (i = 0; i < ADG_SSI_MAX; i++)
		clk_unprepare(...);

Thank you for your help !!

Best regards
---
Kuninori Morimoto

