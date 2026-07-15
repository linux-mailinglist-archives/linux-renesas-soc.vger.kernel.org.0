Return-Path: <linux-renesas-soc+bounces-35252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /B77ATxeV2oWKgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:17:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DC75CDD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 12:17:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=UdlT3nD2;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 765003074670
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1E743C7A5;
	Wed, 15 Jul 2026 10:13:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A21943C7AC;
	Wed, 15 Jul 2026 10:13:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110399; cv=fail; b=F9ghvN6zyaMY5aKNqjL4UCohjYFoVY7QXUX7h/WQNnIk9GkZjaKi1iijqk3uZqj4xWgo5gkfr/wxzdzptft6LHTHSgABW+VbW8P//WvGII8ntv52Lnq+cip+9/fdNQaBgg9S/rP0NMDcoAWqp7Mi5qrKEpI8A/JmHBBOieOhTy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110399; c=relaxed/simple;
	bh=fZSrEbd6Nh+KzGGFsQ+lRZAxqbGFwhzyZ7kB2oXZL/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T/z/MYvcLzIpIMfl1Isa/8/24QO1Jc2Kk9qbBISNMW63ZEccWSxA+mEeC2noDQZqdfyudJO+OrUSzR7sTcVfgD7bg9FGhuLzavWTjmrhSXGP6azZWTtgnJMIUYxNazFB6kVXkhd2truniz8L26B3o4nEqnzx6tRFi2wdkRfUgbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UdlT3nD2; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmzKhXZovlTzoalhnIxcF2qMJSCg18yIwVb5cQX+27RG5++csPJpF9vURgwAx1XcbGLgwkFQre/nkoR6K6ibPn+YfIrjkXuZOFbwlFl7Lf6dyQsOoleS0cAm0AYBHwMk4WOYy4OU019HQ7n6xRI0wAh4QGaxOOs0g09uUy7C/ApAD45I+CApxVDAK9yxnTZ0/xiofOCFqjoGh2NzGABzNCqV4YMtQyY+p2lqi3DYhw+S23w8TWubVGmZmdqzocYrkpAhX+uc3t5TGR2H6fViOZ+Oy/jVt5PH/lhjPiDwAx9icvY7fi7LuLYd5y5T3I47OZnwDzIBydI/S6emRvx/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycWL0g03cb0XHsdYEtpuW3/a7sQUKISo3LnjdDN45a4=;
 b=aac+eY/W1abIM5Ao1H20yPp8SN/415anQW77iwUwASg8Lh0w+GN7wpu2lGQe27dX0BahRrWk/2KjsyKhBsQIy3/K9MCPoVz+Qpsp5i2aP6y64m7EPT58TSzJ/NHqFUvrNDfwPQMgnU8473ke1u65yq3Olval9Mtc+tIx4PPfFGAHuv7Aw1MTfuJFxUN0cfM5PAG/5gpd2bbeKnpiLiDu1Sg7gYAz4vq+W8vmVvzEztI0/7LqEeQSUqrFB9EngWKFcmkAQIjNvrXFyvVOprxQvBZiLu1GOCKMCGUo0hg8V6ebtYMycb6wHQ17qJuh8Bo359w6weIpoVOV7cIAysvCEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycWL0g03cb0XHsdYEtpuW3/a7sQUKISo3LnjdDN45a4=;
 b=UdlT3nD2hNbmj92IBEJgWtNuxPzv9PIeFjAWjNd3Mu8qZuh7g+ME7OQnjd8Brwya0LDmUU1Yj/WyWrhfk86xPmOOHtXQzti44fo3T6CQzgT7h0PDWO0m0LdrI0khirO670bArDn6wVJ7zJQnty8vNYBPMEluKHf2p9VdjzbXmAc=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY3PR01MB10965.jpnprd01.prod.outlook.com (2603:1096:400:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 10:13:15 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 10:13:15 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@lysator.liu.se,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	peda@axentia.se,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Josua Mayer <josua@solid-run.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Wed, 15 Jul 2026 12:12:46 +0200
Message-ID: <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY3PR01MB10965:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c67359f-39fa-4c60-6f5e-08dee259aed6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/RZZHombSrNsVSQNu2J7Fr00Zr3KJlFBzTYojuvKUnpiVPW6/qtxKR1ZqyIiZkmaX8EKacACWiaErrUaxF80J5Gj9xn+zBvrMH1TbU2C9hQ3u2fYPYnGjX95Kw3n+t069i7wq06u8YwfYC+fVUIfRwtF7vOh1J6E414jgAjsRZ6flRJ+unjBilC/f0ZKGu+gGPJMqTIzWJRO3toaVxF1U15/GRvAh8PC0ycM5neHVObM0ZXv2gH2mpXDZSm8cpp63CFcfpluuUov8vnfqW+LRkmiHrC7rn/xrQdyLpWax8zZzFpXRSnB3xlnaYxaP8MkS4fYH6bLvDVC3iDjtjxug83CBCFEnPu2+Qcux8LEgvTrbeR9YkxD7w4a+rmCpvpf7TejjLuZ7yeUE7y/aezUUjpou6UgEpnjCNWbsMCsXxJZgE0PZQIV6HqzWY2OHLZTglIfS/SwZnnsAyCfdOD+2ANtXEKhxN1HCmhKNubaUBJrNTcFhYhKZ+fwXPRvJAbBEtxw9GydVYiygYP2UaNGnv4H0R3w0oed0FXLdcyEJLs1AA2YfDgVv0CZVy93N2yshg79cV/HFCIlPk28f95tayucWk6S0lg6SKfsJU5HapWMOS15Ae4izvw5u6KauimZBD471cag8aoFXnvowXZQZMV27hXV7Ex8AMlgqTzsi1rD5x0eFulbxACTYu3OTTBba+WSCguVJ4jp6RL6aNmwUyL//k0lU6opjoykx1EWpGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uOQh8zF/bvbk+b3+Vg8KeN0JfFjQ0LVmAnpOdcABbs16Aumtucs9ed09StVd?=
 =?us-ascii?Q?PrPxejxnpEoXUuY+sbny2IGUeH02lucizwM19g3Wh+8y+RMy9wstcv+yX3a7?=
 =?us-ascii?Q?8F7PvF69zeWviXFNb4T31jWJqlpXit9+8ZvFfmeYFGo1KdjuAAPTaVz/sugJ?=
 =?us-ascii?Q?nKeyfya0b7ozPRB3mXgj+eZGg56VrytrAfMfU0aoFY53bFHpfQ9bM6cU7kvJ?=
 =?us-ascii?Q?8cqlWSExA2e9iMvrn1juH1VOlgIP5Cd0Brb+5VpIZXs24HJbc2RGJ8q/0xrb?=
 =?us-ascii?Q?JH/j4whAGvFqU51D/kMc/Gamvv8Ziap+NiiMEA+hWWmSxnM908W5sHOPH+3C?=
 =?us-ascii?Q?4ndiOK/qZU6hOUWNZY4r2tG5ipm6ALn5xpyIP5BaPTzWIzeo0MTlRREO7PsQ?=
 =?us-ascii?Q?aR4wjKcQ41WQ7zgbJTKXTIwUNuSnmSh8Aa0U9ZIu0epSkpdVI8iAIydhsxCl?=
 =?us-ascii?Q?8UOr9Yr7e+styr+89/eY5AwqdOLzbkOmjF88LNwEFDoaf0tYDzrU1R3HkUd/?=
 =?us-ascii?Q?DvrY8MTSqCWNrAmryCyGrVXCUhIUbjh6vyPbfrHn6hdw0P25k4g1jlFjpvTb?=
 =?us-ascii?Q?t8rQBcLh41Oc7r10U5Gcx42iagXmG+AT0k6YZMbpasYYEtAyN6QJZHWOQNrK?=
 =?us-ascii?Q?3zlKRmq1fq42QVr7pq31KlBzHVoHaYnwdkSxkx3dNwurPsT69aEm1CYOsBNL?=
 =?us-ascii?Q?C5JMbxPQRvpqRFNe2mbZwU0h+V9rdsCtUagGb8801S4fTitjFjdWMJXM2bzN?=
 =?us-ascii?Q?HGURi6pmrRTYxCW+aCp630JqHLrRMTy6M1Tu/j9Q+0mMs9EMgbF7Iy87od/E?=
 =?us-ascii?Q?o7yAGyn3sP5DT+RrlFUdQB34q1a4dGqP8aBcBnarewzf/LK+GgQ4jdSO7/BX?=
 =?us-ascii?Q?Dd9xH5ZcQ6cOwR+fBEYrl6i7wnUhPHozwQFpaH54VimkYHEqQn+7rAl/2kqh?=
 =?us-ascii?Q?94R1ZWEQh2QQMdmKscJ8fk6ToqblBbhMQlDcbFt8IY7LvyQ+RtBrt3rqq4dY?=
 =?us-ascii?Q?AD9JcyjmFYaGhjmGn9SkzrnYgKGZBtBXy9grgPOwUK3qihE6swKQGJFJ398o?=
 =?us-ascii?Q?U94EX25HziFmNQjnd6lUQQk2tjd2qB9HaLa/Kkdrduwo3uXglg1tmm5aZ+2m?=
 =?us-ascii?Q?+JwNlz0bNyedlmQz7J1QAk9r/5+p0iO0qk3hfL6YaJqstamp/ktPS7P1/2GS?=
 =?us-ascii?Q?TCWD52fALxMKbUASjlMZ3BCDZYjLVua63jrHcKIWruaQaUq2EcW2lJdhh9Hm?=
 =?us-ascii?Q?IFzvZnN2FVNXkvFH+w0QW0SpSKRhSom+pvB2rIU3WZoPK6CU3NGjRt2c16pA?=
 =?us-ascii?Q?vOet30o2igXS8EJlPagu+db03yIYQjcEYheEQdcqu25C79nHv+a5WAvjAPOH?=
 =?us-ascii?Q?2P8+Iy3p0t+ARrRRZ6QZJD795PlfSZCQ+JjUcSfSIftA42E/9fwsseph7Yve?=
 =?us-ascii?Q?hMD1jMYOwxvMZJpIjC3NiVnaiZlN3fhXqjTNS/PNBhC3l8UU5WValMZEABky?=
 =?us-ascii?Q?aeqKnj3+MDkH55Fer8PHK70sXptnIhmYbRXMqrncdsaXmix2ixc41tzlVHLl?=
 =?us-ascii?Q?fQqN5e4fRW3ICQJ7EA4htmUm4jDnY+TRoDV0et6qr3XUvEOYsbgVFQ3Gippb?=
 =?us-ascii?Q?NyC0/tWlAsHiDMp19vqEeH2odmzwFrtyuu5cK02s9r4ASSHMmWT46wqvrfc3?=
 =?us-ascii?Q?ccc9hH5sIB4cvAIN4f2ENw2LW+bm8OZIGWzieCpimS+HF4VF16FRNQSdOKed?=
 =?us-ascii?Q?SJ1oQXO5t4vXkEH8yzScpwCmK0nZXyNop5ihZo/aWDAofwRk1jeL?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c67359f-39fa-4c60-6f5e-08dee259aed6
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 10:13:15.0112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZiW7WFbNHV91PodRwOA+IyfidZoaxqKILjRaUB9xU3XxdSnnckYgavN+TWqChUeQmbU19cbibA7OFEtSaAyBHPbM6qJeqTKsqoK/2UDTXY+R6QDC+ehrpItrIBZ1R+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10965
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35252-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lysator.liu.se,bp.renesas.com,axentia.se,pengutronix.de,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:peda@lysator.liu.se,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:peda@axentia.se,m:p.zabel@pengutronix.de,m:ulf.hansson@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:ulfh@kernel.org,m:josua@solid-run.com,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid,renesas.com:email,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 654DC75CDD3

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v11->v12
 - No changes, just rebased on top of next-20260714

v10->v11:
 - No changes.

v9->v10:
 - No changes.

v8->v9:
 - Fixed driver comment year (2025 -> 2026)
 - Switch from devm_regmap_init_mmio() to dev_get_regmap().
 - Drop unnecessasry include bitops.h, of.h, property.h and
   drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
 - Collected PZabel tag.

v7->v8:
 - No changes.

v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig             | 11 +++++
 drivers/mux/Makefile            |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 6d17dfa25dad..7f334540c189 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -70,6 +70,17 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_USB_VBENCTL
+	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
 endmenu
 
 endif # MULTIPLEXER
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..3bd9b3846835 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
new file mode 100644
index 000000000000..79197fddbf74
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbenctl.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/regmap.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
+	.set = mux_rzv2h_usb_vbenctl_set,
+};
+
+static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
+				       const struct auxiliary_device_id *id)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = dev_get_regmap(adev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_usb_vbenctl_probe,
+	.id_table	= mux_rzv2h_usb_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.54.0


