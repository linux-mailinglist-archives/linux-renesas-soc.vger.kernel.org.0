Return-Path: <linux-renesas-soc+bounces-34900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qjoIBC2ETmpYOQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:09:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 43675729069
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:09:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="IBrQOFh/";
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56F5A3037232
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 17:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194514963B2;
	Wed,  8 Jul 2026 17:01:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A9271471;
	Wed,  8 Jul 2026 17:01:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530103; cv=fail; b=LBjPSajfxCAW8QPexqDsLFMzb+7Yj3X1qk0C4c96RxNmEe7n8aH8ARg3cUHhX3ygoH5NCMWEus/KnjfhvM4cg0gcseX6yCzfoo+IIOaNFPmHSWc/SfVxjsS1FEvsBw8Vx1P8tpdYj+qoxX3axJrSkI8rLo33z9bT9+QOUTNaDuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530103; c=relaxed/simple;
	bh=K34nlV7kwiFtwAw4KP+IrRnE17nCiQWGYou6pgZ3VG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tKbNW58PbuJ2G6QpoqAITU5dabKnw7j4FmKrYqOThCPxsU9NEQxVo+2C9dBUscWPk3kbn0UXiWPTq9pfxmHJcrv7S+YcsWcNWePF5XG5zpSnL5dzJAMGU8xV1Qzm+g6c3dt5v/PnePzcIT2R1UCZT5FMoSrezuc6vCjMm5kcw5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IBrQOFh/; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghUrQB4MQDSUcNMQR06bzB9wLIWZP3IoKadwyGbBlfpI8+FAjv/Ww9ZrQrJCT0FUivqnvEu+ZPwv8Xy2suRGhd/AW6JRCpYurrpbBk1d8YLGltXSX3KoWEBVecKFiXMQx+kmes/wFcf2AEKmOA/y5THFgrGCHJzRxOofAW00OJnJ/gzStk3kdtreYsUsQkW6QHiG+EscOmFQfuuEoDPsFsJzyoP8kranR2wrVzu81ZbbuH25jTI5wPzkUpIogvg7w61JW3c0HaZ07FdYIuUmNu7yfIUU0yIC27a2qXF2PiJ834dz4nuaZi+Vyx38JNrPgw7KzaJG7XTnU0OTnKrD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFtuvJ53NSAMXJ6Ig5fQAf39VnLtjSPP8Uf9rbMCfhM=;
 b=HBgDWNvaftwLTOVfloLMUCKJPgqYYwognku2HWGQHS1DFNm52tA4Kry3HAQOCoK6h4QLjoE1L34elyJhflRQ8LUm9hfbk/+Ago/WIlNC1YIfMQScQc45DjqqyZqsl75aB1/NJkJX4Lrg8trD4EPlRBHJ20rOcGkkGiJfIPNr1HOdmGvrxYAZZ9uycmnnnjRrqrFR5LrVA3VvH1fe+oiYiPGYdEp9EfqASYx58refwzCxay9myglYuVOdPCFb8wPrNOyOf4GLDcxRXN7qvpCBQx8y+vjgUMIwNDkmH/cqgHftBLLCl1jV5MGaFqo6UjqmhVzRa2BHAa/vpcLYZDIk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFtuvJ53NSAMXJ6Ig5fQAf39VnLtjSPP8Uf9rbMCfhM=;
 b=IBrQOFh/yFsk+bzKQ6GqHk5AKfxdS+VEMivSYLto3Xh3RcYUUU9iWZc4eqoZIb66f5OpB3+Sqhhi8s5nboTQ+V3K92pZvBB6bciAxrIPOu4mhKkp5kuzxhnPJfrYsO5kjFofHyZjW/J5DEBeWM5EZ+mQiz2Pv/mQo4i16D+7p6Q=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYRPR01MB12875.jpnprd01.prod.outlook.com (2603:1096:405:1b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 17:01:31 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 17:01:31 +0000
Date: Wed, 8 Jul 2026 19:01:19 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 08/16] drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU
 support
Message-ID: <ak6CXxb3Rs3PB4Yl@tom-desktop>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
 <20260704093433.273672-9-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704093433.273672-9-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::18) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYRPR01MB12875:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6121f8-656c-467c-c757-08dedd128f0b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|7416014|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
	0dKl9lbSytsUTb3wvg2axrOpyl+L31FFAGbXJlGTihdfo2K/ZpECIplTWKBjr7HK7V0H8bZQtPMOJcJFOd+MseiUBFOCRTGDt218HmtlB8sVw/OSX1PUjC/E3ZNgA2a3fnHI2fPVfD09t418Nl8H9B/RqHLPsnnOVGwG2UmzmM/Q5j/6cU2hxjk+aCMG4B5k6a3g8qRGSHIqpJXtOtnljyAMew1RwHZ5Vj7hl8p2fARjghhyMwPh9lrdwfoIrRsJO+a/NlCUW29SgbqHMu7B/v43DDv+qtc1e7IZXjZSiAPsnVcqTAlksO/vG/uNkWEH7algM7fpBxs7j4F6PSCDOpKRxXQvLilqcdTW/QMTsjltAX0FtahcW9RXDaMMhdgQwLuUiQ9RASrv+QQJYC2yxxrp7WXQuywn/SzkdXjV5Ac7dj4Yg9GrzsZB/vvxUnMxtOXJI5pD4z+cMnd9SF+MUp4cawc4IVQv5BElJPyXrhp4xxryp5zahSm3Gv0Z9bIByq/Vet/Z2zrJp7HBR0tUMwBpa720F8/wodBYPnmPxc7eZCv1yZHsvUC3RbI3B691HlO3PARzU9Li2Wy8w+qEAHUe0lWW6hBREUBGw8knkInTH30+Z+nH61K8YHn/aPSqW7QgbvmXh1fwweji+bXjANJUYLxHlAyYn6UG/OK9gKqW1cBEKMSOpHPawNxRTFJSl9Uae7Koaz92klZP7KmRGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(7416014)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r36D5KK4kpsR4PNkgIgspcZ7vvEgvXUCh205mrmulHZhXtmMd/Zl9maPy4CL?=
 =?us-ascii?Q?tGDt6wtRmcZmZqvpsF9eTx4URL0MO8cL6eft0r3QhCIv5t+tE0grpDCY32JL?=
 =?us-ascii?Q?P+xFpUkMAKfPkckzeGyc2uq6lA+wXgKx02Btybl2sQQmwEV97f7lXC5GnPuN?=
 =?us-ascii?Q?17gBNwXW+N8m4GDAkedUvACqqrubTy+1VwhvlyQFW16Rt48PtQLMUTq9BgPA?=
 =?us-ascii?Q?btqb15zgQ3kUdLw6k0C9CkrwzsuJ6PJCL4j+wCf6c+GuaV2bLJCaOa9GRDEL?=
 =?us-ascii?Q?YLMmsmX6HG7rI7KOI2gEn9X5IoKr7UToG1LOgETMXIDbtmclqy030yIyYhSH?=
 =?us-ascii?Q?IdJRSUUT9VP64X/F3ucgXLLgZH4d1ActVw3ygv+aeq5fmJAfWlD8Ni5tTRI+?=
 =?us-ascii?Q?PRHJj0wD/wk1YofQ0dAqUpLbhPiLKZLXEb9pSP93UZve2MJGVLWOPX4OJiYW?=
 =?us-ascii?Q?HZ/vL0laH/x7kr2Zfenvk1PiY7O1bR6BuelHX7JYSdSyeOQodg4Pol5GOR65?=
 =?us-ascii?Q?1wlMgoXoid140luhXlUjt1urCxfoMjMQPxlN/ZfxGEG/vsRX9ZG/0rmpzv5V?=
 =?us-ascii?Q?+w/u8Guk0bPQW57PSag/bNcCQ0zF8v8S7RrDjK86ZcAp224IudpggwAk7efl?=
 =?us-ascii?Q?VyCnZ6MdPXsYLwaZV/k4BfH3gEBUQWuyzQ99fSUIJ9iI7QZw6uWRRQjxaGWU?=
 =?us-ascii?Q?Zp/gQK5X/P6NkESz5/CpePHThRZyZ0rPq/b2x/npdY2BTK+CWb63QgG3WDzr?=
 =?us-ascii?Q?LjpgPNNBGFBUk9Wilggk6Wx9raIZlEhN756zyswbekoj2WJLpZq8bZSI9tzO?=
 =?us-ascii?Q?fLZVmg4VEPuaueEGHynT7Xg5/VL340ypL9ZLG8A6OHD5AWNkOPovAjiYmZ/7?=
 =?us-ascii?Q?LIluAWSkDgHGZj88MIv5EDcXrMmLIJCrp/lDBgDZ6NDT2dadT/bBBy9AASkB?=
 =?us-ascii?Q?QC16aRl4J23gJz9ChKcWv4eZFrUNAOhEefel5OQMXi0Rtu10bc/C8HgZMnvt?=
 =?us-ascii?Q?e624JPh7h0Q5v9XfDA0/XkdaBLcgTbZUTssSzLqWeF/LOHeH5XRxjyGxLxmB?=
 =?us-ascii?Q?/NgeJ8d/+F5lICsdjrARBm8ZfZHyaVzgTK3otb88ht9zWdaL6tQfPju78NxL?=
 =?us-ascii?Q?61ca40ysNkcjHKZEHe6CuF2pR37y+EW+NY+CQKS6ICE1mXo5SY74LJE+YJ3P?=
 =?us-ascii?Q?Bzye9onWly+GyaGlfl3NL1wGwAKUNG7YQeJbwPpOkKqdnY2ByEP60n8z37pt?=
 =?us-ascii?Q?bXSg0lQxNpt1vuWs66T0Op2VvillPaP8A3QA6phVVCktgcRf/zIsOhaSvGvl?=
 =?us-ascii?Q?eEsCPoh751Prs+btfMGVBw0gZrgsenOpSDdmqTmPEfPpHN4CnD/E68EnYTkC?=
 =?us-ascii?Q?ziYomMoJaW9Pru2RWOfPife3oWbwH8qWkAFqP/qlIoovDOPdOf2/LyritQMA?=
 =?us-ascii?Q?Kn9FSe4v3UH3ZUoUt76Ne32+KxkKCcqg0HhXDXN7jYqYOIGcnyCfMnZfQnlt?=
 =?us-ascii?Q?GKVNXF8w3rpa1NmBF0v7jNq5b7fmVFb1YeoBVOGYweSosgThdkVeloX4TyC8?=
 =?us-ascii?Q?5uy9b+iCSXEEPzZF/MsJaVO4LuKK9bMTnz5DVAS4XPE9H3qnfdL4wxnrzHv/?=
 =?us-ascii?Q?zdkhvzYU2v7MSpj/gl9Um6h7ZVlHqvvzmd090qMIpoy26uL0XB7Y0TsX3uVr?=
 =?us-ascii?Q?pyIXt1RoqgosCOdCcaH4Dh7rHEgabPQ0kHopkt2JYe0+9dggoOf2tuUJMEje?=
 =?us-ascii?Q?lrzZFoi6vdJW31O6BOWao5SuNkZoCZ3FJH8HHDEoBYUydKidBxQ/?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6121f8-656c-467c-c757-08dedd128f0b
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 17:01:31.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnrNN0IAlXmDU6vDy3VavTHUaSKY/PDLelsyRqvEISig5HMXiz0YiF4kKRX6wwfXZX9a3Q9opPTjtJ6hQTK+z9CuMoF9S1wl5ZGihKmth4CZ+QRZc6GKczzP/kRqEQAH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12875
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34900-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:from_mime,bp.renesas.com:dkim,tom-desktop:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43675729069

Hi Biju,
Thanks for your patch.

On Sat, Jul 04, 2026 at 10:34:18AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add Display Unit support for the Renesas RZ/G3L SoC (R9A08G046). It is
> similar to the one found on RZ/G2L, but has LVDS support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 22 ++++++++++++++++++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  4 ++++
>  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  4 ++++
>  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  1 +
>  4 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> index 3d13f61d3c97..a8d841421a0b 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -55,6 +55,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
>  	.mode_clock_max = 83500,
>  };
>  
> +static const struct rzg2l_du_device_info rzg2l_du_r9a08g046_info = {
> +	.channels_mask = BIT(0),
> +	.routes = {
> +		[RZG2L_DU_OUTPUT_DSI0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 0,
> +		},
> +		[RZG2L_DU_OUTPUT_DPAD0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 1,
> +		},
> +		[RZG2L_DU_OUTPUT_LVDS0] = {
> +			.possible_outputs = BIT(0),
> +			.port = 2,
> +		},
> +	},
> +};
> +
>  static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
>  	.channels_mask = BIT(0),
>  	.routes = {
> @@ -81,6 +99,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
>  static const struct of_device_id rzg2l_du_of_table[] = {
>  	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
>  	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
> +	{ .compatible = "renesas,r9a08g046-du", .data = &rzg2l_du_r9a08g046_info },
>  	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
>  	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
>  	{ /* sentinel */ }
> @@ -92,7 +111,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
>  {
>  	static const char * const names[] = {
>  		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
> -		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
> +		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
> +		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0"
>  	};
>  
>  	if (output >= ARRAY_SIZE(names))
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> index baf076d69cda..0b86c5a01210 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> @@ -21,10 +21,12 @@ struct device;
>  struct drm_property;
>  
>  #define RZG2L_DU_FEATURE_DPIO_OE	BIT(0)	/* Has DPIO output enable control */
> +#define RZG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(1)	/* Per output mux */

This is not needed, we decide to move setting clock duty cycle handling into
encoder driver.

>  
>  enum rzg2l_du_output {
>  	RZG2L_DU_OUTPUT_DSI0,
>  	RZG2L_DU_OUTPUT_DPAD0,
> +	RZG2L_DU_OUTPUT_LVDS0,
>  	RZG2L_DU_OUTPUT_MAX,
>  };
>  
> @@ -61,6 +63,7 @@ struct rzg2l_du_device_info {
>  #define RZG2L_DU_MAX_CRTCS		1
>  #define RZG2L_DU_MAX_VSPS		1
>  #define RZG2L_DU_MAX_DSI		1
> +#define RZG2L_DU_MAX_LVDS		1

This is not used, please remove.

>  
>  struct rzg2l_du_device {
>  	struct device *dev;
> @@ -74,6 +77,7 @@ struct rzg2l_du_device {
>  	unsigned int num_crtcs;
>  
>  	struct rzg2l_du_vsp vsps[RZG2L_DU_MAX_VSPS];
> +	struct drm_bridge *lvds[RZG2L_DU_MAX_LVDS];

Same here.

>  };
>  
>  static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> index f50d166b764f..7315d437c2ea 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -105,6 +105,9 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  			return -EPROBE_DEFER;
>  	}
>  
> +	if (output == RZG2L_DU_OUTPUT_LVDS0)
> +		rcdu->lvds[output - RZG2L_DU_OUTPUT_LVDS0] = bridge;
> +

Same here.

>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
>  		enc_node, rzg2l_du_output_name(output));
>  
> @@ -115,6 +118,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
>  		return PTR_ERR(renc);
>  
>  	renc->output = output;
> +	renc->rcdu = rcdu;

Same.

>  	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
>  
>  	/* Attach the bridge to the encoder. */
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> index 3e430c1f6132..8b048ca508be 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> @@ -17,6 +17,7 @@ struct rzg2l_du_device;
>  
>  struct rzg2l_du_encoder {
>  	struct drm_encoder base;
> +	struct rzg2l_du_device *rcdu;

Same.

Thanks.

Kind Regards,
Tommaso

>  	enum rzg2l_du_output output;
>  };
>  
> -- 
> 2.43.0
> 

