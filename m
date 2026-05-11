Return-Path: <linux-renesas-soc+bounces-32329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EgGE1A3AWpHSAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 03:56:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB850711F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 03:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD4DC30062E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 01:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E45723C50A;
	Mon, 11 May 2026 01:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BunskTsp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF4A1E9B3D;
	Mon, 11 May 2026 01:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778464590; cv=fail; b=sC8/lspFqmaIiScyQEJiQ1QrK+EGp7IOK+LflWwgnBEzIyUxCapQSdlpyQHoIiGxlPx/ZBxhWHO3Zqqqve/aWlHyT/hkjhcsfyDoNnKHuNtN772mGrLCdJuGJKbfqI4LjnXp0M9nb6KcfUJCAXCp1w2bktbf1vrLdR88dMFVMgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778464590; c=relaxed/simple;
	bh=BGQNYnhowyr+XuhyUzUcWdL2rmbFTcVjJqfO4W9Ug10=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oVDBOZ9OMWUydRIrpPBRfb1wXzbEiq00/X/VAln6wkKeIYA4RnySbgvNHUnOIepJJleNgDY3vf2QS2ALj2Ct9L4CX8zqhRWneN8GP2+qS/QV/2NpLMU5g0dasBf50qYDOuVcW78Z33oyoQUXHpQEQHZIITxU4axo4huRWrge18w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BunskTsp; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmWrg6IvD4SWOkSqxYryi0soFbkK2jwIPI6a1MVHdSZBi+6jLBstYR/c4T12qD52lDn1v0AHLbe3LehzIVMyW5ZLdf2e+dCPTPH/X9fJucfJMFfn3o43zvMNk/P+bbeAT6fd7Kzf4cIcgsd6N0J516v6CW1PQ1kJxg+5zuv6gyVMNiyjJdwkrsycRFQoKi7rnZigCWSzW4cD5lNyuS9s1vSeFR7cRYJCTLXmxtl15Gsqh1FISGAnqPhIZWy1bJtctldUMxM/H5w0txLqWzNvrApTt3owC2pCBQ6wdzFPTYlOChCnghQKy+DuA1ydym9sGVUTd3OblzP06VmevLad4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5D9gNVQZmc0Vb/7cxADwJK6ETZNYdFe4XF0pC3yyTM=;
 b=EB7J4sZtO4RKmDcZ/i/4/oDgz8Pv31BmwuFGk2bFJiS9sgwfQjzyE601++RRdwwx9KCXbkUUV1xFnM07/btmR6QNDYMYP1etylfylKwkkJ4kBH0tScwT656N5dYkj2qzhYGoflywmm4OwPbFX/QJI5eXWKV36pOFQsDKPUDgVGP4Ltaq14nQM3evbS7w1VFtLku+SvuwpK0r9Q8D1M4lTC2A3nF3OK27JxVbaF0BdbY1MVV5TV9W7XZ44DItbOK1PIgxgfJAbxLjValKy5cP6A9TtTiVLRWoNCgtinx0lxxfPZVKj7+2rDWjWTgrvD3TyWuArC0qsfNIq4o6CZ7lFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5D9gNVQZmc0Vb/7cxADwJK6ETZNYdFe4XF0pC3yyTM=;
 b=BunskTspM3dZs1JKFfge/1MMzJsao8N0NpwADEXovNN5UxebiJC5F8X5VyEj9caEE93b1Chy0oBrEtTHKdhdNdOAw8x81MRzC+L5YH/80aarE0tDyS+logboW9CnsyBu+gePhTbYx1gEaHFAV3108Lm4QRuZcu8KMHnVMTlp/TQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TY3PR01MB10061.jpnprd01.prod.outlook.com (2603:1096:400:1de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 01:56:25 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 01:56:25 +0000
Message-ID: <87bjemn1yv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH v3 06/10] ASoC: renesas: fsi: Add shared SPU clock support
In-Reply-To: <20260510084303.122426-7-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
	<20260510084303.122426-7-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 May 2026 01:56:24 +0000
X-ClientProxiedBy: TY4PR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:379::16) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TY3PR01MB10061:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0205d5-f349-4330-5f58-08deaf008207
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+ljyUOxPAMDzrKHeSy35TmuLnrhiiMPPKvm6/j2qlRgGMthM9SLu3pm7Rot6O28igNOaOzQ5BUJ+gLYTWcJgJoO9fVB2Ov4hBY1chPvXi0dGcvvH4Kxik5llfPNj3uEtPQWU2rTnzjf46xEVYTeBuzy0TswnJqby84JMAsGk6gunl1aU0kVtJjpJFk4XrJh+yKBU4E/tY8/p0iNUJX4/d/Fk9YM+H1gh2RS+lNOl27vCTmWw+G8qCbDlW0jZh+KNTPodtB6ljJUJ+3Nc3wj8dKqK4xEknnyQfidBc3RpW+9JFopOqcAwMx70a/bSxa64CMeACRqXaAOuD2nKXNCWNRoS17QZutiv6jCKjxJkRe+rBT1BUTCbTTo4dBW3X6l/MrZc+mKWWRakUvezcV9jJMk/e/cwR574yZRiSlmufDLAwLDrvy/8cLpUWpEwmKf166N8iEwonZXUMzHw/uz3wrRduD01R9ZT8KkrejyQkdqPasTD9lVLNYXGaHo71+nHVs3HInbaN9u92WuPhVvdK2b+2++8ULgavAenNRNyaoa677T+dnDlNW7OEEXU8yZYU8CvA/EYfvy0EIe5hM2lWf/O7yAKnj5JRR9qmWJw+3oNniteloyMG41CIMZ1qg0ba6Shj74xAPMyf0MYHu5M7sJFQ5lZoX0w7/Czs0ytxEu82+o8XH8Wusuw/n/kgcQuBqVMBx28H6NXKg7g9s8ENkQQNpJMK+3nXDf0wUvrDzxDCQ05sKwbLXPWu/nXPUjj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dslrjlZudpbb0RoLPzsr9dOomaIXPmLI3l2GTMoJ6Tag95qE/lj7QOvaWWDj?=
 =?us-ascii?Q?GFHImAhIZ73eXo9oQPTo/iGFJOHUvHQR2cojaJxrLlUxo3GDROfifo+0ZaGk?=
 =?us-ascii?Q?U21QHcLVyulwQSQtbdguqjrzVLu8vcvg4CQQiBu0FUf/p8Upfeo7vsrQYSPZ?=
 =?us-ascii?Q?rxbuyHXT53OlHEGWPQNSWxA6VLBZdueJXNBOXyq0Qmoo+b5o0ofQZT9QHYw7?=
 =?us-ascii?Q?Z9puMN6HoWOnJPzqnQ1yYpOlQ1e3ELOavGYFi7Yeghaxh6bvDvgUst5Sb/Zu?=
 =?us-ascii?Q?KLex0GnC0vdMwW8w9EshvJ3G0kA+OKI2XbfIt5COi+KL4K2bmoix6SJsryb7?=
 =?us-ascii?Q?VJPNEsBCD0uxzaSMu1t5ZjSl+YkohfKvIU7Zoh5GSE7Z93W6Jpw6hfTST61q?=
 =?us-ascii?Q?g73gkPuvW5r6KHV1DhwBYhNaNX4oraPPkZLvvca7rDVR5IpfywSp6Bq5XlJ7?=
 =?us-ascii?Q?MTQ3A4BgGiEGNo86xfD5s2f1kjd/pMfOIp5ViLtrnuoU1vIpYFXVnpIwnAcB?=
 =?us-ascii?Q?apIP7vlgW5zb/sZDv1ZueJr92kL3mqvCtlJ8Lz1ii8L5ZJBXUYrfaE4qCyGj?=
 =?us-ascii?Q?C6nm+QsZm02LvabTCLpMZ2TjzLDiFSeKCsMTGDA383+D+kRZt2TkvwfbcXyZ?=
 =?us-ascii?Q?do8WrMDfpR8T7S1Jxt2oQ5y8WWPGKLIy6LMxdcfEH8Bpi81kECP647bO+9Fn?=
 =?us-ascii?Q?fz4woh36gLcg69+7rh6C7qKZBZBdDYKUsS1M4Qf6QlgPSIYUIL9avNrGqOiz?=
 =?us-ascii?Q?9Vp3RxMMhHK7sMOFrkmgnwt4osB+wiTkePjvnXs6/RQ9dFZljekACrkcdhJr?=
 =?us-ascii?Q?SNOZ0uiXtif9ttNRV1Rk/mPGAAx+tt/YliACsqHXKbKGzwHAjUtpkgRVxDEf?=
 =?us-ascii?Q?ewZ8A+B3YcjRWUXDm85qpjc+gejAg23EqwtdnVpksJay5bElvj4cuhackADU?=
 =?us-ascii?Q?XauutwQED2fSKJB5RkCSPZ2I7w+vBl0/dOqWw/ickNW7Z8rDe5whRqKtMZt+?=
 =?us-ascii?Q?TyigEksn4TVisLtMyX3+4I99rn0SjWbtcXWu4qK7E4ElQm4BYiROp00TzzCV?=
 =?us-ascii?Q?0XPm7x6PRwcVHzN53aAfz6fLGGPYo4+32g4JwvUeiUeJFtRJ67xuPhiS1gU3?=
 =?us-ascii?Q?Omrr5RUoA8KiBgC6/HExLMUtgZNpTOOSqeGeske3hMl1r4qU8I9f4v1BNQEq?=
 =?us-ascii?Q?IY4svMnAsE+tPU78ufpmlhP4KsEYo9GoD2se4sMfR50L/cosCfCOaJddweTo?=
 =?us-ascii?Q?EaGpr7PicuOeGMVD/x6/XA3VfoKn4vMLCeo7VWlHYeN2bc4WleCsykkOcg/V?=
 =?us-ascii?Q?CWoos1gTqNlRNOv4gL/09Fm66MkTVesoCNZa+HQ/1bKnafnehM5VYwRPxVtv?=
 =?us-ascii?Q?ftSdJfaIBNNaLq2jsm+2fK8PRzPRwFlUTX3pWZ6OkwlfPjF+elxROkw22lli?=
 =?us-ascii?Q?DeFlce1OMo/t5AjoFHhRbm2JEGg1I8j9NqTUDdEl/Ah+xF4yG2cjFoeqJgad?=
 =?us-ascii?Q?awHQFWuxpkoNpTLqKlpZ0ZKDcsLC47pHOLItorACHkLlkQTiDqBst1AFWdyL?=
 =?us-ascii?Q?PAJY2gBmcY20ftvLofID9vdnJGBrY5TFl8Q1SSGVbT4PPeheov0Bg/2YK0Dh?=
 =?us-ascii?Q?li5Zs9EjZW6tlor6Vos7+7q4XuajAyFdLGzweTd5BKBbBMAc0SSgGgD0X4a2?=
 =?us-ascii?Q?AmwWIUBUGVYBqGuUrUIQIgm7eaGThPWql1dtgM5eO4FUMFxxjiGxfJJzNvr6?=
 =?us-ascii?Q?GQdK202oNVlqlzSKHSCcwpuyf97LPjmM/LuMEi1T6ahx/YLej2PI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0205d5-f349-4330-5f58-08deaf008207
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 01:56:25.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaDBdqREI8HrGQzGSsQRqRT1+JK/sxHj6G7hJQdsEtCsZvGWYaBA0nSnwTROpnsXRFyzqfwBw9ig8ao0OTLdbvN+EVJ56x/5QIumq9JVm34muKT0fgbN/b5Vbrwi5Z5b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10061
X-Rspamd-Queue-Id: BEDB850711F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,glider.be,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32329-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action


Hi

> Add SPU clock pointer and reference count for shared FSIA/FSIB usage,
> and initialize it in fsi_probe().
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Am I suggested this ?
clk_spu   should be merged into [07/10], and
spu_count should be merged into [08/10]

Thank you for your help !!

Best regards
---
Kuninori Morimoto

