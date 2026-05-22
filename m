Return-Path: <linux-renesas-soc+bounces-33045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK0AA0e2EGpDcwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 22:02:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A85B9D7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 22:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CDC2300CB15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 20:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6646379C5D;
	Fri, 22 May 2026 20:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SyE8acUC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8046377ED2;
	Fri, 22 May 2026 20:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480130; cv=fail; b=l8CxvatdqsswaO8Ey2bnku/sqA0fSfApFKsI8olsYtjlJ55UxlsYdSF3OmYpR4N91a35SwmMjJjKZFzIqnO3apvDGjow1RcAjM8SM7ci07yv9251tDJ+y0MjfIc/CN/bzK2/x4YkWZryF4vPO/mz0RPVKnNiEr66lxngI+Pwu+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480130; c=relaxed/simple;
	bh=nFoGxM+tQLQOoa2UItHOA8FyufqXC5b5X4zd5Ds2zFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LBoz0t5P7x9gnO1pFWQI5OCJe6mrYQCsLBtZVpy6hptKR4L+eJD3DmoRZpZ/l1uFcGP6BT5Nowuhmw8Jhcd7RgW3PhvUNyrAtS2/ZfuFtUrwSU3xh/bKFfAD98WQvv/HRZGRb6oLW3IdSPO+s/vCbNvZ22a/9wmhWFhNzd9QNVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SyE8acUC; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEC+POpsS+P2L6MKR13rW5qyaXgk9X/a8OIJFYZT3p90nDr/l8MDOHYKrzDToec5M9qL6TSM+Fv/m5rSiF8rQcKziuMDSFGir1YNsrTL1EyHVmXyXHFkJV9raOX0vNoIM2no7pe6qKgmS6QDn/nBjx7EAOYdgDf8hepEWHKI36BuS+48619G7AAjikOsxkxU+DqkhxPsenSfzGMPVTyQkMZtUzI/XIuSazZ7wBX35juIcH1v9P9jOOo/xrpHK80EhkhaVzDr7yahtyH6L1Gk/Mj1hQmP1LGkvX5rjwoGlB+5kNZ1pFpK877aGNsfdxla9Q2b3JMz1LG2UyVf6OI0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyBhviY3ew9YYOH4hU3QEZN5ol+GvKY4l0qikqeaiyA=;
 b=DTff6+UkByFmYbjPtXgLSXTRRsuhwg6KqFJ/OJIgwc6YjqXKkaozYluMxW4ppmC+Y3l9gIpc0yetPzVyJ5cCAmQBmKUZhqBC55Z73rO6rtSgvkqwjVBL85xVHnP8gmibevgKBMgzXxf6MILvsz2yza2KMlcrwLnqy75R0GnVjMoAIIJrUFJWli5CzuyRHa2S/RIhIS+SFLsWUB9/g53rs7OZqsyH9nCSI7aoFUohN5caK0zfAd3LUUa2I5LwpHshxoyGtF05yPO/9ofclMp7csiL4xmzd+xCGfZxnupTVWiZguYiwJVXIHGZaJINyhmtW5IHw9GNsndd8wfSL6/Tmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyBhviY3ew9YYOH4hU3QEZN5ol+GvKY4l0qikqeaiyA=;
 b=SyE8acUCyLEYvEKbEpvvrkvXHvuGwY5BO1So1346ToXXyl0QSJGuEd8Cx41vy97YAFIpSL1gZDNb9T7Wf2qMwwFgCB4Jyy3jNNM3oFMSvZG27NfCRtZRQdxt1+twhfWQvtbyBeXD8sWXBF9BCYZfL2RjuUeqIVE0BOwtnwpY/xR/eAcqiIJaoTOU69tOWrQj2ETcRt+09lQCFzFBX8GxjmIPf1fy1fzTt9g81H268Dkcpy5a344IijMbZjGbHkcMYzzdOY2CZO1kMxPKDgEzjRU2QLWZLNTJfwXWt0u5jlmHoR6YvBMnJWMWuue4k6SSe/MYSMZxbGBJqrUJ0swTZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 20:02:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 20:02:02 +0000
Date: Fri, 22 May 2026 16:01:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 17/17] i3c: renesas: Add runtime PM support
Message-ID: <ahC2NfJl0bD1pFcX@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-18-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-18-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SA1PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: eb058774-a3c5-4ca1-d93b-08deb83cfd9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|11063799006|6133799003|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1BD0pWlBft5apUHCT0TirMAKZjkDF9aB3WYZvc7507hLurZCqhBeH2Cuyx2pHuz4qQTLp8ySthfW2zld4kb1CoGSs4qxdeLaVAOJ6tteD7zPan3bf+Ro7esRnc0mkGT7cSdi+iVtkABZBgo0ISTFHCpVNYnZG/sTVwdPFd5I/L76L7V2PQNZMzPrwktAU0yUcpTLWtw0yDXXDI4f49J+0JIElmPc38NpRw4xBoMtxuIpTtczVQaZOFTiTaxmuvj3vqaXMhjXIxWnW7vKDgE6l0sDVCHCo53nDl/CYRZoyync52G7KeWFp6b4B+L514fh71ecP8pG0o3xGqDc8ZedmdCYemRg6dEDyPO04r98q/NG14S4E3uWLRhcuFcqsrDTuWWYfTo6xi7g1C+iQfo3z2Il1nInhONIU97z0uK0ZnnA5f8gAJ8wa+cYoIhZ6d2jfkOlwkVLB3M9AgFYcecTXAJ1hsXH+zXwLZHP2EKz8KAXbocKUaOmn7FacrJIdAaSp+WvGZTN7RbP9bQW0TUBBsjYEK6GHAEAMe5HS/t3fHUiZpCIKlPF3zw4BtYsKKao9ylpMYxgOCMYDiOVwLrfV7ZBHim//I1rqMR/BmjpTzble4D7NpFvUyJd3blkddWZ2NS5yuzMeB6YTyGN8W3/ADZG7mfOLgoxQN3hnVPVefUCWzyyHMwz1AlDcsknyjN+f1paOk1QhFBLJqnj3jqieFE8+VvEURj0bPoy42LgNlnzVJdGSYE32Re8RxiVRdm4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aq/n4wYHuWw2po4YutgpAwX78FwUiUrv7p2Vr/j76IdMFNNZMZuG4AmOVf8V?=
 =?us-ascii?Q?DfXKRhglJBFs8hBOxSMVJVxo5h5B94vAbH5GT25nDIDoWkjJhvgKCY5gXd/W?=
 =?us-ascii?Q?mtQcpgYL3B8qL2gNPwIeJkJC1rNYEu8gQzzXujKh6fTIHH0ZhGqOGC5heA85?=
 =?us-ascii?Q?ArjnUoeg0XAypic/mmoqS66K1+QDK8CdqJZ32Nq7KdCehz0Rou11brYsvQjg?=
 =?us-ascii?Q?W93FgCxomHpSK+OdG8FLpEtpcZBQfT5lF8Lvd73SgbTtznxoTojBbRqXANPl?=
 =?us-ascii?Q?PQ2XLfFEcmf1fR+QRCx/MbYcAW8S6rHDe9eoMVXtQSYR+FZojz3gS6Jr0wS5?=
 =?us-ascii?Q?IPQQvkFlc8NrUEJ/6eZUbGBTNA+2AOtcwq8FmUYUppI/sN7+nCF65vpZSKIG?=
 =?us-ascii?Q?j2K90ZlyEwnCNhglZy6tfk8gpbvN4xfTESRK6SUWQAL4BzcBdneMe5QY5cp/?=
 =?us-ascii?Q?M9sdD+DS5t/CnQ38NxZ3GXPt5fnDHTBzsoY+iuQy9qgnktgdDU3Nk5zzS37D?=
 =?us-ascii?Q?C0CtJk08QscZEwtOSmOJtOsVFQQWvryuwTuxEpiqEnbk4hOvBzRwfCdjRxWZ?=
 =?us-ascii?Q?H9SWzKgTCnwJFsLMqLLTnX8Yd/9OBdw1JGqjHixaf2FFyjajr3o/71w3dpt+?=
 =?us-ascii?Q?8PGOnJ2LQkIASiNbV3XTTUAbjnkxKPhwzXafxjPOD5AtqPdGnppvhxzbj2NV?=
 =?us-ascii?Q?LRQfnEwDiL0d+hOkbF3fggg/sMEh6B14Nvm4czS9isdkhe1xubFXe1jZRZDv?=
 =?us-ascii?Q?lofUqcXdJ0KG8bH3PPPeADdXadcgrLodCkbDpGcIAuwdHcafGVWDwduSoiyT?=
 =?us-ascii?Q?pxn3o9eHRARrIg2hZ4E89hS9I/CxPF9+KO5FVrpe+BZEe+jVSBQK3KYtWxgF?=
 =?us-ascii?Q?dEBnPe6lIIAMKwQQQM19RdChgahdc7Vu7sedfV5+j0pXOTrctEwvtfnLhszx?=
 =?us-ascii?Q?yNfLxCpz064xpifkC9U43UBIgTIcveD33vNPW/U4OsHJ857DhOv9jlbG9xd3?=
 =?us-ascii?Q?n0lc93g6mtFert90jB0D2Xuj4dYqoVry/R9orjRi90+SRPuZBjVlvyeOu7KJ?=
 =?us-ascii?Q?kUE2yzIly9p+3tuFwgzR1Q/qqRW+57tTEdzpN/VET6KUaVmuc1YO7ItY2Cgz?=
 =?us-ascii?Q?4+AHChj6y44xEQulVLYTbyo26jrQY5jNCpQikKHA8Oxi7TKP/r73m5XR19ax?=
 =?us-ascii?Q?bg+tEkyQ/hSRiWmWD8rkmH9OX0enmeEJM9GLZF6bemrItP204mwZhsfmGTip?=
 =?us-ascii?Q?3ly52dgp2QtsmR/A3PTMR5o3PBgV0yaqDjnNMnA3YqlY33sKClOdo4wVRojc?=
 =?us-ascii?Q?f3D46mKE1t1P60/+vMsb+CKdig6OckJHGi7lX/USTjrp1HORq7pFZCYh6BFC?=
 =?us-ascii?Q?jzxTM9Us3Hn9txf2AS7019fuBHMJZwSspaSh7Err9HCWp3ImJvYTdPeoJkzr?=
 =?us-ascii?Q?F20K7dcfK1K5Q9FeJvfKArh5fS/j8RS5DtzKgghFh1bkyCE7waqvcXByglgi?=
 =?us-ascii?Q?HC7Ivf4g1OkmqV3RIHO+NSeNyHZ2ZYTNtuoBkBsiDfqqTTkDZNfkxqb//ojk?=
 =?us-ascii?Q?fvc4sHjW7fJt/U4sWChQwCZaMtnD2ZQLRYO+uR1oExOiUE00sLmD7KsupwY8?=
 =?us-ascii?Q?EC6IGfkTZpSdOmTwFpsLip5k1QYFkn8DATH+hjpADNjuPHXttIhFFFdNepO8?=
 =?us-ascii?Q?lXwWzRuTvZYkifpOrjbW8L7FGz7N6djomhxxhJP0crbv6Nw6SGbta72EBlL0?=
 =?us-ascii?Q?gt5D8x/TBA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb058774-a3c5-4ca1-d93b-08deb83cfd9e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 20:02:02.7161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKveY3EGwqpIMThgDj1Xy5uypWRQr1dtIM6t/vL3XuSHeEphlZjHBDlCXBhvAcTg49uBL5QBu71rTCw7ppFiMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33045-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,nxp.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8D5A85B9D7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:15PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the SoCs where the Renesas I3C driver is enabled (RZ/G3S and RZ/G3E),
> the clocks of the IP are managed through a clock PM domain. To keep the
> I3C code simpler, the explicit clock handling was dropped along with the
> addition of runtime PM support, in favor of the runtime PM APIs. Only the
> code for getting tclk was preserved, as it is necessary to compute the
> I3C clock rate.
>
> All the APIs provided to the I3C subsystem through struct
> i3c_master_controller_ops are guarded with runtime PM APIs to
> enable/disable the controller at runtime.
>
> As the Renesas I3C driver implements an asynchronous transmit model by
> preparing a transfer and waiting for its completion through the ISR,
> renesas_i3c_abort_xfer() was added to disable interrupts and synchronize
> IRQs before runtime suspending the controller. For this, the interrupts
> were saved in struct renesas_i3c::irqs. Along with this,
> renesas_i3c_wait_xfer() return type was changed to unsigned long.
>
> Along with the clocks, the controller pin configuration is changed
> through the provided "sleep" pin configuration.
>
> Add runtime PM support for the Renesas I3C driver.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 183 ++++++++++++++++++++++++++-----
>  1 file changed, 156 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index a070db4d2440..3b9807a89b54 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -21,7 +21,9 @@
...
>  static int renesas_i3c_probe(struct platform_device *pdev)
>  {
>  	struct renesas_i3c *i3c;
> @@ -1360,12 +1448,21 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i3c->regs))
>  		return PTR_ERR(i3c->regs);
>
> -	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> -	if (ret <= RENESAS_I3C_TCLK_IDX)
> -		return dev_err_probe(&pdev->dev, ret < 0 ? ret : -EINVAL,
> -				     "Failed to get clocks (need > %d, got %d)\n",
> -				     RENESAS_I3C_TCLK_IDX, ret);
> -	i3c->num_clks = ret;

you can still use devm_clk_bulk_get_all(), if need tclk, you iterate clks
to find 'tclk', in case in future, need more clocks than tcls.

> +	i3c->tclk = devm_clk_get(&pdev->dev, "tclk");
> +	if (IS_ERR(i3c->tclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tclk), "Failed to get tclk");
> +
> +	i3c->dev = &pdev->dev;
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	ret = devm_add_action_or_reset(&pdev->dev, renesas_i3c_dont_use_autosuspend,
> +				       i3c->dev);

do you cleanup resource in renesas_i3c_dont_use_autosuspend(), look likes
needn't it.

> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
>
...
>
> +static int renesas_i3c_runtime_suspend(struct device *dev)
> +{
> +	return pinctrl_pm_select_sleep_state(dev);

Only change pin state, don't disable clock?

Frank
> +}
> +
> +static int renesas_i3c_runtime_resume(struct device *dev)
> +{
> +	return pinctrl_pm_select_default_state(dev);
> +}
> +
>  static const struct dev_pm_ops renesas_i3c_pm_ops = {
> +	RUNTIME_PM_OPS(renesas_i3c_runtime_suspend, renesas_i3c_runtime_resume, NULL)
>  	SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend, renesas_i3c_resume)
>  };
>
> --
> 2.43.0
>

