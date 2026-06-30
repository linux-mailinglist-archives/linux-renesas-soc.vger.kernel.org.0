Return-Path: <linux-renesas-soc+bounces-34579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SADxDLFBRGoArgoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 00:22:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C17726E85FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 00:22:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=ZxE0aiWM;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A23A30407C2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 22:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCDB31E858;
	Tue, 30 Jun 2026 22:22:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765C01D9663;
	Tue, 30 Jun 2026 22:22:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782858159; cv=fail; b=PA0VOq5FpTtAE2myKKnXThSBsfMIYz0KZAv8+u3DSl7wMspTAEsMtHDjGWULItE7STNz73Z3xXW3czjDqQBunYnKvxzuwElAtpmhA2xKyLZIg+MwVwpYya4KQyH7Sw0XFicTJfcwmTfS+g9BYSptC7llx7TPFOPkSmNkgxXg+uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782858159; c=relaxed/simple;
	bh=3GM2NM438srKN3Rorum3ZixRRPTlD5RqJgl38Tgvnoc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=n993hOvbSkx0A4jk8L2dwxDQ/Gf60JUhj6OQ2MgWnBYCx/TYdGLpgC50GCUVo8tHj9+WZuY7o8kMKfhZIXDcIwXlphbvGKCpqbn+h3uWhA8uXOZu6acNtVBhCSR6cbTV2FsXclqPXN8Lm5fp59oL1AGqCgw6pE41EeZ8hG9mGJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZxE0aiWM; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4ZX6254YEufKOLA3j8kcLODzsgp5Ne83ka6h+SzdxofAbahNr7tbAbAwxNjeq0lOasqLUKGCoPCHDrezeFSAehO0dwRluivKp4LKZDDFC9pA94jy/nz3g3q6TpWwnhKvhTvpO555A5qPezY6rjobdUVjxpet2gP7tzOeZUvHqpHnZDfO8LyKhwY8UG1V0eI0Gff0aOKWfHMJv+XlgzaOGOO2WGd8TDhDLOg1oXOed7U16IqbU+9YlUdVoKkOo2+YjXLRWQKRgjPO3V09YGNsJQLmILxdsbHD2uS1CO0bSqWdau96QYILWP3GSes4eTcmK1CpfRwS6yhZArKsdXA1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGX2yLi998zoQEbht59wDr5Kb5VymU9HDa+1XtdHS/8=;
 b=dmtWFY4tnP5HNnWXwEZQ/1PAxdnJEwXvDdQ9WGecQ6oigAHXESAiZ9snUf2f7B/fGMT+EuY5+Yv8Cp+mNAbzafIvI7v4WK+w0OdkPTlw5FpOyDmb8/sUxf1YdAL+0D5MYzx6ieZoJlnqeo5KQDCRF5+w5d76OaP9QjuzNAQ/rvSblNn4hvXxgthDSE85VWhWPAX+s97nJALjmvfw6oTiEmZY85mrNT/CnfE1LGv1mPhPdfaBukwj0JjMVuhZGpU6MRZyKMVle+ON/H2AmupcTCk+uyISz8+JAFYhmHiFvBphDfIeIZk4bSVQdByWndIIKgs6s6hzh31qUD0A6npqEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGX2yLi998zoQEbht59wDr5Kb5VymU9HDa+1XtdHS/8=;
 b=ZxE0aiWM++qxeTx5oajHMqQpNlS74B7tRoo+r3KoEOUOCDhFaomNXTMlkcUgCfaxpMx4elgqI+z4Ihl/CBYOUYFsjUSnAzuNoAM512QYj7N6m6KQLJ3k0Wnxl4+HL8dONuA7WFFuEhi+a9y/r//W25NcFA4bMpgCuOkPP0XatC8=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB13406.jpnprd01.prod.outlook.com (2603:1096:405:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 22:22:34 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 22:22:28 +0000
Message-ID: <87pl17d5y5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH] ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume
In-Reply-To: <20260630175329.4145703-1-john.madieu.xa@bp.renesas.com>
References: <20260630175329.4145703-1-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jun 2026 22:22:27 +0000
X-ClientProxiedBy: TYWPR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB13406:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0221df-f9d2-425d-760a-08ded6f611b1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ecwlroILC2THphv5C8W81qrzQsxawYWs/fkQTJ597ETAq2RJNi3epPY3OTU//Sjjzo14XGvKRluqNtNnl3J+YQnQiU6a7/yNKKUdthT0C6hDHCTzlS82O3HgVzDa6H0+8IrRsL4205B8M/wr1QwKvCRx/q54JyEFAe0/4sZ/Alfh3Og4WgVIkmovNkKOR42bi3+FKQ6YB0T8/qeZ5xbfHOfJMBdTvPyfd8l7BY7Lv3jUf6zQ56yIonmzsuhfgwX0+ELAdFRBSyvVlZ2chum0yhyWT9KDTjPCfEznJB/7Os8yqeM9R9sh8mcUsaBDFjF7tRnB9tLTWC1Jpt2jNBh1g/mtan3UQhpnLJ8pb7JX5rsMjhk8Xkc56YgKu24bVzZ/IUgzO3eQSnGEzS9e/N8mZOyypmIhEGrW+LuRWUJGHbDHx5E32X81ucsJ0BFyAmXUR+uzB8P5nUBXT5RCr8WEy8Wm9WHALjoxPaLiAnbs7iNxHhhE/Pggw7yPUO5zx8PMnep7DBgdA16/0tl6ZnsePljKxxHyiC1f8Eg69DHKDnXNeWsAoThD/UNnwXBhPzSNoA6kwEcZyxJo77S+Cj2VhGRFhCgzK0yjk0W/jlu9yUt3vNP9ywRmHqJacmRQf+7C/pA1KvLvCqydca92C0yDHIsOW2J0WTuCZ5eC5s2lY9TjYyGgi/HXO6yYI4W/zZsl7XsIAdU/uzqXtAMgtnHnNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dED3ZssNmIPdVdzoEjvmuzBPUG42oe9/1HESusJ13qvJFIaXXyTQBvBCisvL?=
 =?us-ascii?Q?z9WyANV2znVZCGCJwNhpwpsgZJBJ5chmUDZxC/oJG4kHXO6A3e/xqaDkPIEz?=
 =?us-ascii?Q?xrPwHlCFbPWccT7p2aHP0nnX7aJq4flxz7criKiNvX1D1sIllhqd+irdjqXI?=
 =?us-ascii?Q?j5yyRKtnebw9F9P29+ybx3UkK8UfxxUm/Co3OhV6HnCIyPnSOYpNmGZ64g8S?=
 =?us-ascii?Q?KazQOiFS6kLBFpwHrnMTK3EvgetRlzxLkw2fhjpAlQX+QHHTW7s5N28sZJGR?=
 =?us-ascii?Q?Cpxsd6Q564DlKBYjpoChFUd9aImP9sDYsjan2YTXbCySbzBlbhH/UQNxAbJb?=
 =?us-ascii?Q?ZCtbuNjuWU2rNyhTBxPP0U1tLt/vGEafRkch2T9dDEG4MTlCnh+8p+4wF+qL?=
 =?us-ascii?Q?MkQd4F4UXu4qjpop/WGDX010qRjM+ElvoMFrkGjShp0XBfB5zIsy5R9UXVgr?=
 =?us-ascii?Q?amxRiZyZG3No4vFpcx9LlmtWupQLRZ8o4tCg6hiNEpult9IJ/wPFFfqWupSi?=
 =?us-ascii?Q?Gy/ZRDKQ22cZH5z5TWOCKJNZ7ufq8NtVkrQsRM95A+ei58d1Z1Vwnip2spIq?=
 =?us-ascii?Q?t9YRVJgjXGmncNuozxkIehCljf7uIme1UEO64xKwQa9Qf9s5/sLWste/XNgV?=
 =?us-ascii?Q?HcLE0h4l58typ3rxtj77BfNq42JI+nM6gd9rY8BB0PVxl1wDhswM6aa3YEV4?=
 =?us-ascii?Q?1fETy6lnHjYwB1+H2pp3NRmS9m37aTYbGjSSpLXh2kZ3ClUhvDKOBVXadCJm?=
 =?us-ascii?Q?eB5+dZzlzp1E89oNx56J28rgwmKDVEkfYKK125V47+Vd+OVydqVzu42AErYR?=
 =?us-ascii?Q?N/Kggcv537Y408q2XPuWOFsqOD2xvG/2jZvstT/jgsfgL/6D2nb+qozoxz/S?=
 =?us-ascii?Q?ewq2kY8AA3Ucox1d5/x/WEBPJFG+ZDeJJPeSbrV/ODX6YqeHeAK7c0s9hqtU?=
 =?us-ascii?Q?Z8xDBi5df4gnubAuEPXPGK9OiiLp8AtdyDgX17PO4biNAky3mqOfkFj1pAis?=
 =?us-ascii?Q?5r4iUdkEyMPZAf6BRPGP57/YxyYOl1BONcC+XssFV1a97ygWsHgLKjRYncO8?=
 =?us-ascii?Q?kAKNEor/2XJIyGcvmDGOcq0oAG315nsmtIce+w1ugdJAIol0W02gpSYcMbYH?=
 =?us-ascii?Q?1DjHilcTvbcxGeUV/rb6THiqR6xNoB6LT4OVVKNMj8LZy+zBU07XoUwYPKmq?=
 =?us-ascii?Q?MlsZ4RYhKYAU6UAV6N8vl6keN+cPArKfoXJKgyPZ+jfLMJq3mUXIixl6/XVK?=
 =?us-ascii?Q?NRaoc8ZUlMpC3g8O+kbtEY1h+dMGJd2nJGa7v6p9oLCsqTlxpRYaZz7XihFc?=
 =?us-ascii?Q?E8psDzea+clACrq9xUmR4bph9wti9DareWYB8cWvafxqX8CuadY8bPpSIQoz?=
 =?us-ascii?Q?BoElzmTOh9JeCouiVusUupExEBQfzT17OtngyBnm/TOjGJxnCaiX8tYdLaRm?=
 =?us-ascii?Q?X0YxlUtQK+BTzD7PSKzmCZo9q3L8vLGXfrmc+ly+PCJ2QJndpY69++HnMcpF?=
 =?us-ascii?Q?wd4G3A9Rakkg0+HICzG3uC/A3cDoqzPBrOWnTbWnZk6UKj4yGAyp+1TjeLol?=
 =?us-ascii?Q?xLvpemwTmp5t59EyfEXAFqK5m3oB0rZJ70vq8ie+ty5zH50otg0NDJEs/Pmh?=
 =?us-ascii?Q?GQRz/kqCqD4jx10EeZJvTE1zZfvUWlgmRNTJ8rWXss6Tl0RSANc8gkDE0eAc?=
 =?us-ascii?Q?dXwyLqfb7YXKDkGKySH34Elgf3G3+quy5X4iXGoFLgiV1CQK92M1fGM3hqlA?=
 =?us-ascii?Q?0MaVyzDiPSS+ACBbP4RIpQ3sbJ6tKYA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0221df-f9d2-425d-760a-08ded6f611b1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 22:22:28.2983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtzcHcALEgJebYsecLhCVq7QEdVLvMX5f6V1sOllu1PrleItiitWAjTwxfLYe5w3yhg8flnGYsCfSnoG28uUDPgMOtV2LbnA4R0mtiXTEB+gI9VGol8RWE8eRrgVPi8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13406
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34579-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:dkim,renesas.com:email,renesas.com:mid,renesas.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C17726E85FB


Hi John

> scu_supply is enabled alongside scu and scu_x2 during normal SRC
> operation, but rsnd_src_suspend() and rsnd_src_resume() only disable
> and re-enable scu and scu_x2. The supply clock is left enabled across
> a system suspend and its prepare/enable refcount becomes unbalanced
> after a suspend/resume cycle.
> 
> Disable scu_supply in rsnd_src_suspend() and re-enable it in
> rsnd_src_resume() so the SRC clocks are managed consistently across
> system PM transitions.
> 
> Fixes: ef19ecf042b4 ("ASoC: rsnd: Add system suspend/resume support")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

