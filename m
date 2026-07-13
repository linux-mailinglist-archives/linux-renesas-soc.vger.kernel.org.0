Return-Path: <linux-renesas-soc+bounces-35152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8IHtAXggVWoZkQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:29:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 571EE74E045
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=PHr2I2ce;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39EAD312721F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC7026F29C;
	Mon, 13 Jul 2026 17:26:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E5346ADE;
	Mon, 13 Jul 2026 17:26:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963582; cv=fail; b=PI61kh+AgNctEkdWinUhYIrVV5ca+xsgDDmu7jYxrvNmzbcv0VZzNWyz9ZbyWRjglVz4Oz3cf7OnSr3yRzrAAqA54XF7CUeWPDUzUa+EYBuj/Ngngxz7P/BxSQCceQXjVWa8uESDCfXEti6njcHlozMFj4uk8QsJ5IIkMxN53uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963582; c=relaxed/simple;
	bh=QY9HzFtq/F3BXQ31KLqq/sF3XgQMyThLa3mz0e+5uwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=biNdl0i8ZPoq9zPELg3XkRa8xJ838Tn8YVELUPnhcr4eQFPyB04PwgB7ZX+ujKiG+2grYnf4a7e8XDuYV10/Cjiv2duMIfTw6RuIb1BM8FE/Wc19Avaizf1gZE+oNCr3jvnCJ9tg4AtB912rmvBDJM/U1alBehViVlGVP1vbpig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PHr2I2ce; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFTqB1Q3K/akpT0cSYWiDSnklgU7rS29wzHnFYG4joz6fII3MERqqOGwgpRMRYfuickwSdV6LQ0zshEQNpD3fkqyOnQj+eAudf9SiOHLq8AD8YkwnzIu92mPl0Wj0tr03sS8w2DRkTDscF74D5ZLX17MV36Itw5qBYjndmvQzGvEaAL9mcjFOpcKdB6jTiCf4Lx77Lchx7U4PyxPy4+9yD1Lzq9y4Ib2TDrnv8GHEywel+yRBcmLrgWnfPh5uLd6Hv46ErFdefeYrpTlSZ3RbyNl2QNyYVMdEmkFp9P3EDY/GL5+dMPc0DPoAmWCYaC/POiLhuO/iJQ++NU1fSTQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trC6GHm3Elzrgi2Afw482SX7coFh+iAeuf4AVeYmgm0=;
 b=GkUFYBq7fgc60DCq3dnY7EQl2p/bZu4m03eN9XWGhk9zvHmTfP1IUHA7DUC8tT31wE2d+aSLuyWIcxwKJYOO36vAbas3dNr+Nzp+3bPulxPQU75A5Jm+jddZQQuMgiMZZ6ZFSd4uChQgSecJpt4M+G3ysVGZyJRcF7gTHf/63j90GLYPq8MbBcifhU03Chwj+dY5gpEr2RnQD9Tw46Dv+XCbNnd9i/Y8INGjm7iVq9B+Wz7hw5/lZfyUPOkFWeAYMgHNZFXh7CPQPBVWR2IQc5xKJ/BJvBi9vNKp3oReUqVGViHWr3wKupZYTeouMxnbRdPMUzs1cNNagbBslYQ8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trC6GHm3Elzrgi2Afw482SX7coFh+iAeuf4AVeYmgm0=;
 b=PHr2I2cep4u51O+5SOZ0On/GIODnYY5MfbH8QFyjM5kiZfzmIOu9j98Xzl6H5o/8xdPtA74DiScAWqFM0rDf4H/2JsMzgFZgmH53BQh0MKwKr/z+tl3RI+e/x7giQxiRUB9MqDqwdnigfU+0AUdrpejDUryMkmaYdoECP20cmfM=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB18075.jpnprd01.prod.outlook.com (2603:1096:405:391::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:26:17 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 17:26:16 +0000
Date: Mon, 13 Jul 2026 19:26:02 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, p.zabel@pengutronix.de,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 00/17] i3c: renesas: Suspend to RAM with power loss
 and runtime PM
Message-ID: <alUfewDdZ8cmGszy@tom-desktop>
References: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713130545.568657-1-claudiu.beznea+renesas@tuxon.dev>
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB18075:EE_
X-MS-Office365-Filtering-Correlation-Id: d3943f25-9830-4c00-aeff-08dee103d828
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|6133799003|56012099006|11063799006|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xXVWBM8CTRl71YBMv19+k7H84B3Virbl/CajVIrhh9BmLfwBCS0d1kprqvkooA8cCX7DRF4p37l8swqrfhF1p4udqXeD1KM/ZODS0cCKWyDQkNnCLXgO124hepxCFTIjvLgiYvorRojl9PZLrs2OEilwQ+vaqZMPcbmzdy53mh70GhZdg5vfvmO7Fsf+9OymjmKS2ArbHh688Gfd9JuPOFv5JzkhS0Xq1jiLy0xkHmTPaafFnaiev7Jh56f7oqgGSdDRhoE3EvjfWXyTjRraW/F9B9OInj6nTt0c45JVpAP0JbF52u/4HvzaicG4eacJ+OBHyiK0hpLuqo2G98ztfw0K/eoTthXzPmSJwQu68nGlN4E0eOhFIkJYwC2adrqKYeK3QwTgBUDbKPxC96CH4SlF97dnpnq3n4ThjHoD0Y99MmVk24PfDNNXtHRd8SQpd58SajqPscysWN7GIXd38jsL495vZilUQpoQciyu6OE5nXPjPGQQUBxFgXbq5ST+SbUg1C/nB0d5nOKkpUfZIhe3kaDvdGtKXuYiWydCM2jOkIrbH8U5tP7VNqz5J4GN2ZT0aetrk+Ybvd8S5MJRklyHD5uoytZGcmaioc7ipiGNVF7ndtHzMnKTz7TzzJ6dje1NtaOzPoLemR/ynze0a2ktyitCVcWEHlquMWufDP8yopkUbSdVH2dKOuKLwfmCghCpqSU4u1a6r36/a/0jRbv0PkrhBeitjlvm9GCp0Ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(6133799003)(56012099006)(11063799006)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WJbmMk15qxXEleEsuy5+JzcMJ2eHZGz87SCB+jrOzGf4MDwJEGYhK/yhEFUh?=
 =?us-ascii?Q?Yrd2RHHjFZG5fp7MQVJZ1j5agZC/evIKw62obZOsc9ghJYkv3ZAM2PkvEr3e?=
 =?us-ascii?Q?+oOAWXc5JdCua/TnOFfoeLtsgS9oZjEElOxjmngnRWOscdOwNtwQAHb9umUs?=
 =?us-ascii?Q?E5Bwpn/MN/FrL+NNyfOUXn9alunOq8SVfe1CL5oga6nIDcdxyIElsfehrpDm?=
 =?us-ascii?Q?TXz6qwXsTUOAuCAc/xicrpkKN1vv8CKnX+P76RYOFZsmeZtB8ONQkw7twiKv?=
 =?us-ascii?Q?lWhMebU4Db/S7zE63ogDT72ykdsp2ox8/b66hxmiz7X+BApesw3IDsrJdFVU?=
 =?us-ascii?Q?Hw4jJu60QOcGbEWUNFkkB5ammbjYqD2mEtFrxeu9L+v5bkn6FY68WvGcLEiG?=
 =?us-ascii?Q?+TmbeqJxUt0N6WIWlZ2Jm7JJMos2LSpCoTik9aYsYh4ZzIgPdusS0j25aiEV?=
 =?us-ascii?Q?8CfD1H3HeqLYELzPNHqH8DHzRBwYrrwqp5qJIuQE/KnXi3x78PO6ZXJSkUua?=
 =?us-ascii?Q?sEc0hcPcFq/GbMb+snTs1RdXoR0OF/BzLiJlTDiKWlKXpcFrd1lYT2d/dY7f?=
 =?us-ascii?Q?yB94sBqzrzjju+a4lBHfdwU13mxDDbpuCKJKgyFy8QydIPYDS9qye5/tAPpI?=
 =?us-ascii?Q?kv42toQnCxPm73i0L50qAoyCzG882zHqocq/QrJ/KPxYuIJeZn3bhlmJ13y3?=
 =?us-ascii?Q?2qL0voBSq4llT22oPozP7ayLzSs7pk1mVPsZPhLaFmV6cfFp/DUE1Qliajz8?=
 =?us-ascii?Q?F0l6dIo10djttlOua1JU7lAxXsnK4GmA+wI0WC7wnLDV4/3WA9pfiBg+dkXn?=
 =?us-ascii?Q?+Cbc8npviZb9e/MDan+JN16w2hpI1kZnpdz3lo723V/oN72OTnp3+xGlmhMT?=
 =?us-ascii?Q?W1z453XGCXTK1Qp+pNDeMkw+RTTcBwkcVIajyG70+ECz0yyP0NfUO5fmH1uC?=
 =?us-ascii?Q?Z3O8egIsufE6lAZ+IR20uKjn1dRjifsDa3HlW3tqeEsBf8ELu0gMNtKgfmc2?=
 =?us-ascii?Q?nNCkWX8Gz7h30ZUeM1YUgOpUsdyBP/NBuxdjPo6hCE5qeft0AhIlQT802dWq?=
 =?us-ascii?Q?AkZXcPLXoZLyp9qtpUyJZDAwerKmf9w5j6FdtsjiTTn6hsQad3iY/pzjfoFF?=
 =?us-ascii?Q?SPqkse3aF8wleI5l2tVhepztYljZ4FVAy8Iyq/7FD6WfwxOj0HMAQ1UNL04k?=
 =?us-ascii?Q?w2CxM7RCLp78ckfEoPDNxumGZHeIZE5i4jOR+hiSZMynnX5Ref4LNds5OpqE?=
 =?us-ascii?Q?FsLzGZFkTn0uRMqAihH1f1XEO7xAHXNaAYdZGrYwAoby8RUCH88DNs5Uu45f?=
 =?us-ascii?Q?6x+uKDCPVm3g7mKzMuWOK6zgleNPlWpO3gjYSeKzwZrRu4QGT95LflY2FXqx?=
 =?us-ascii?Q?mUNCUHghggHNrRqfMO18wjP10ka2jkrLepKcg8D6kspFh3HQuofxt6cdWcz5?=
 =?us-ascii?Q?l3jK04kULENuBPOa11X5WKCDHLZHw/RrrlLSTGQ0zarQfmwRKLV8lkaI6feU?=
 =?us-ascii?Q?q6Z8857OEQxAiQvXPgdsO6zx+poHqVcPamEiJbLbZX+TG8+ioX/pmdFuOmHp?=
 =?us-ascii?Q?gCj3x1x5s9H/APyLu5anRRZwhFGPlhlJOQHf8t4H6dnOVuVnfvq824vv6ki5?=
 =?us-ascii?Q?S9W+jc2J4Ok4rR8mvM98LYvwnrp7LUuWY7utiE1LjL97THMfUyUFHZl7PVR8?=
 =?us-ascii?Q?SlAT692BLl88ry4YkYFwbI0BZvihYanzi6n4rA4WiCqWpFEOw+4J31Q2dWf2?=
 =?us-ascii?Q?OwsNiVpVJ+UxPWAF1wA/sn47gTJQwERH9xY3moBwtnBF9v9ygNEN?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3943f25-9830-4c00-aeff-08dee103d828
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:26:16.4675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtRR4L5p1RqVut37idgVvkYKNrweWn4+kIemLSXuqFR1cDalbZG3CWWQ/vHkRRJ0DsO/CiRK2yczR44u/E9UleUaaiDPZs2TanMXFpNYNpOJeTUzLW7AeX7L0hsf9okX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:wsa+renesas@sang-engineering.com,m:alexandre.belloni@bootlin.com,m:Frank.Li@nxp.com,m:p.zabel@pengutronix.de,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35152-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tom-desktop:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 571EE74E045

Hi Claudiu,
Thanks for your patch.

On Mon, Jul 13, 2026 at 04:05:28PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> This series adjusts the suspend to RAM code to handle cases where power
> to the connected devices is lost during suspend to RAM. The fixes
> included in this series are required for that support.
> 
> Along with suspend to RAM support, runtime PM support is also added.
> Cleanup patches were included to prepare for clean runtime PM support.
> 
> Thank you,
> Claudiu
> 
> Changes in v5:
> - in patch 1 introduced renesas_i3c_irqs_mask_and_clear_locked()
>   similar to what was present in v4 in patch
>   "i3c: renesas: Add runtime PM support" but without locking; use the
>   same function to mask all the interrupts and cleanup the status
>   flag in case interrupts are triggered after the transfer completion
>   timed out
> - introduce patch "i3c: renesas: Fix out-of-bounds access for newdevs mask"
>   to avoid failures when there are no I3C devices connected on the
>   bus at probe
> - patch "i3c: renesas: Perform Dynamic Address Assignment on resume"
>   was restored to the v1 variant; kept it simple to fix the
>   suspend/resume for the moment

Tested on RZ/G3E SMARC CARRIER II + RZ SMARC BREAKOUT board with one
P3T1085UK-ARD board connected.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>


Kind Regards,
Tommaso


> 
> Changes in v4:
> - dropped patch "i3c: renesas: Do not attach devices if xfer failed"
> - fixed the swap in renesas_i3c_group_devs_in_slots() for i3c->addr[]
>   renesas_i3c_irqs_mask_and_clear();
> - in patch 16/16 renamed renesas_i3c_abort_xfer() from v3 to
> 	
> Changes in v3:
> - re-based on top of series [1] to be able to use
>   i3c_master_reattach_i3c_dev_locked()
> - used i3c_master_reattach_i3c_dev_locked() on patch
>   "i3c: renesas: Perform Dynamic Address Assignment on resume" along with
>   grouping the I2C and I3C devices in the driver slot
> - collected tags
> 
> Changes in v2:
> - dropped patch "i3c: renesas: Use the divider 128"
> - adjusted the patches title and description where requested in the
>   review process
> - adjusted the DAA procedure after resume to still properly re-configure
>   the controller in case the bus was full before a suspend
> - added patch "i3c: renesas: Do not attach devices if xfer failed"
> - collected tags
> 
> Claudiu Beznea (17):
>   i3c: renesas: Check that the transfer is valid before accessing it
>   i3c: renesas: Restore STDBR and EXTBR registers on resume
>   i3c: renesas: Follow the reset deassert order used in probe
>   i3c: renesas: Reconfigure the DATBAS register on re-attach
>   i3c: renesas: Reset the controller on resume
>   i3c: renesas: Perform Dynamic Address Assignment on resume
>   i3c: renesas: Clean DATBAS register on detach
>   i3c: renesas: Fix out-of-bounds access for newdevs mask
>   i3c: renesas: Use reset_control_bulk_{assert, deassert}()
>   i3c: renesas: Return immediately if there is no transfer
>   i3c: renesas: Follow a unified pattern for transfer and command
>     initialization
>   i3c: renesas: Drop the explicit memset() call
>   i3c: renesas: Update HW registers after SW computations are done
>   i3c: renesas: Organize structures to avoid unnecessary padding
>   i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
>     name
>   i3c: renesas: Drop unnecessary tab
>   i3c: renesas: Add runtime PM support
> 
>  drivers/i3c/master/renesas-i3c.c | 375 +++++++++++++++++++++----------
>  1 file changed, 261 insertions(+), 114 deletions(-)
> 
> -- 
> 2.43.0
> 

