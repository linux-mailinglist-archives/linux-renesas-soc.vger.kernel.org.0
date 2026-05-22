Return-Path: <linux-renesas-soc+bounces-33040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN8hAZqyEGpWcgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:46:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8565B997C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 740CF3036BC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002F4390985;
	Fri, 22 May 2026 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CcI/8gaj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D1538E5D7;
	Fri, 22 May 2026 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479000; cv=fail; b=oXmUuWikb3ShQ1tBmS9hZkdOxPJutxaDqeGi77g6Gt5vWb/X4b2WSnu5iWeMmlZhoKDXUJafkO3XUZBxyGt5jm4Q2Mq0SBJm0KXYk5X8WrH/F5rHV5vQRrXQPWQwhMonfcUhKBlu4U2AofCTxCSiJUlbJ7rNrYOdiB0EeU+LBgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479000; c=relaxed/simple;
	bh=ja16jWIfvvIiwKtuUDuKP/JFBH/GHJMImGTwR+Nhz3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ff946IEoiT9nDqADf6VjeXmwyGfd0W5lX0RfHLYVJa9znqT10gJ+tarkegdVApFra4zMOgvC+R+jMZF/rxVwBjCfsjGl0AQNK2MJnpV+M8TN85LIqr4Z0KXHBntEu6NJ3ziZHo7M8zVlV0MAHaFcva9DG+qRavQ0k1mi4lQsK6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CcI/8gaj; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0rOujKih0WaSMdQ8JLnI+EW5uevBbzsLkx6tdX5s/apNUXrllJMfLnVEbX/I6ToJ2FJCpvphdMGaEk6M+qSbZ7bE0JBFDppzWxuaAoYYiMv9gfDMg5r3PojDhNd6b5ZksFcmfQF9Z7id7SDdvKXagOusxR0EdCoDPAGTBvVmntmfI3UffM5bOhJ3R6r94mr+yU6Fun6YHCcIC7MBU7EI+F4t+Wmz6zDt/QpdJsdRvefxjoqevJKSefjsPaWZsOoqAZiGLEbnk2ODq18G/tA+Tss/lW+9bqmbJ0BoZCMmOzYf/fSD/g0t2GpKKvGRjY0B0YNhZji/OGLZJGhEZLIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVwuF/29oQ7C+XuW3H29jFSrOC9zb4tUZ6SkucpspdI=;
 b=hQeo6lAFaxj8gDXbQxqxkV1N+AWcdXE6yrIdgNbzzDtgjCnXCmo0DGLusiyP797KgdqwvbZY/3LE+RoTNcUDgaWbKCQT1EaILxqgbVMYH0qxWG3GogtXZXDu/4M+hNYgaG/gdX647IwSRTIjS18ypuNgmuH47e4ChLKzA1++UDUSa1YKxpiZLZ/p4n2Yczn+WCBKJVZLAihBq1Bpps+oSviYRr7wih74fkMCtZ4Bjn92vietWOG17oXYB4ur5Kl84rLbc/jWp9XFb4KzMVR3rmD7S1e5FgUDSJoLDNhzsvmA58RfHYcTw2sTLld2T7OV3zJnREuiriIIWZri+2VobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVwuF/29oQ7C+XuW3H29jFSrOC9zb4tUZ6SkucpspdI=;
 b=CcI/8gaj5hCzva5TYTZuziYHu62+f/YQcAKC2qy1NocT8IPIHL25jldyTSvZcrzLUCbQGXPj6qEwadJHDlJBE1/kbxV0fFXYVAHOnWpo4hEbj+Rb9WsjviTT4w8fwelWe8eSNBd2W9pMcRyfbF7SwAvOPZUh/aoPuT23omyXd3vHiTc/UTcaaSFDvXWK6mRAJWP6DNqFZSQNtZn7fBKXpQf0IG4njugc7cmE8+GxGAArCjpJRXECbglp62SUiDuX0nIs5SQ2YPepfqhrwbEfYIG1j+b6CufUKGj2d6L7KWMzAY4PTmFZxfK4c5DI4N3Oe27WuSeYLHtfHjVlpAP1cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:43:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:43:11 +0000
Date: Fri, 22 May 2026 15:43:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 12/17] i3c: renesas: Drop the explicit memset() call
Message-ID: <ahCxyf_jbzzZqMcn@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-13-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-13-claudiu.beznea@kernel.org>
X-ClientProxiedBy: SN1PR12CA0058.namprd12.prod.outlook.com
 (2603:10b6:802:20::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a9b56a-1f18-43e6-daeb-08deb83a5b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|6133799003|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	coSaaM+LVxmpIFcD0ylYTs+USG2b0AgVIJZ1/Q/9NQd4HDek6zjVUjlGdd/CRS1+DfMI/dAqEkTJ/pYwrHMQyvPP9OvYm7vt2hoCZHQnzDNLfzYLysjlF5YDms7yqYJgvkuTzh1Yz5lecWGiK8w6RVPRyp4jqituZBYBKoHsKN+10c8bPky9LZPbIkDe90R8vxPHJUPr5MAU10kAW1VkgdIAlw8OsXIEbcb2Rck5SRviMHqscaqEa8LYxyWGECx0mfjOS7iubm9Ve/4i8RGEWGDb9NtFzYBplLk/zbVjD87qV2pAO0kve2myBq1943VMlEfwXoiT0bfb1+HJN5LY+2+svzG5EXeCXHG62JmAyv6t5hPR33moLEyXymfvlu87a2O8FMbvWO3mHxKqMlGV4L6aJ1EoCbsPlNEEDXCbIjuKgRZcBgt7I3YKQPXFEHrsvU9ylvPB0WHY/cFAQ2Tk/FGSxY+hOXjCTMeiRfL8QDUUX8hK1/N0TFYLD1B1ESkvF3GQuUALouDI3+d0RdoiWhppQcfDcg+N3b08O+RHyiQjSCSc1NxZQ6puYpIChTS4If6xe7R78KY3jopKtbDu+lewVvGGRTZ8iTilF2+XMrLf1SEMuRMXbAHrC/T7FYLNJHsSmB957DizPRrtAT8Yo//wvt/x63qvosQ76ROW0VLiFQwP4zY0BsO3IPvZ0tWnXLMXpuRFywpZuSO/RJkoH97c3IeQe651ifgXP1FHv51ctqYxnkrLrn5f6kty8m8Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(6133799003)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ctYxd44fBLwrl+M926RY/oBlLysIexc7o0yMliZFcA9UlV8eTO5z77/Jw8+x?=
 =?us-ascii?Q?38GWG+Rt3WU9aZa2zkEZnbxfYPZmcOj6/JEs06ZkaoB15WW7dA/NmyJgbZkI?=
 =?us-ascii?Q?SuZA8PCA8/gNqhNfrKj9ks3HrxX2LX1Nx4B1TxEvqLVwXpDdHWPRvFTJnuEQ?=
 =?us-ascii?Q?RdAPgw1iL5HruyVXTJrpR+SiXCp1CDSm2GF6jXIq3Zypfgb9szboOYBS+Mfz?=
 =?us-ascii?Q?MhFEwhSBAthAm7kQ35Vm+GgJLR15i8Yp6KQ+KQIxLWJBBtUEP8jSibqRLqOK?=
 =?us-ascii?Q?82Gp8PMg2BH70kVqEwdoUOIiar8CJE6ZaQn/Y742miNomI0xRryE7nj88uUl?=
 =?us-ascii?Q?HfxznDFEg/k5u8HX9/qKMy+3mRRl6uWU1qioxftcyBDZkhb8F8ad+DK9Kkbx?=
 =?us-ascii?Q?QfxyaGkd8PmJeEZCbiiRnArvXlZkjkYmUakZ5k3oqXIAEs6Dug91ttDHUZdc?=
 =?us-ascii?Q?4zxLu7GU6U1DoppD37tsYLL6pNW90Md4JUJBlSwhmMgc7G7C1un93sey9XO+?=
 =?us-ascii?Q?USz/Z3cIH9lecjVObGpG51//jp+GCrGEtuMJXiwl5hPfXUbe4jlTBdW2XIGA?=
 =?us-ascii?Q?aKrCklCVWEKYeid52+myNYKw1sVQDSgyRLieTS3vNIihCAaISOFnzULijXc3?=
 =?us-ascii?Q?6WzoPkjkujcJ+8vwQOo2YnxlPjwoe3y+WP7f9khddA/OgOhi5mrfq17gpB4G?=
 =?us-ascii?Q?nhES1YgkLwK5rRx7ApsFRAYpJYBnw4PxBIqD3oupJeFC0DyNTg95GV34KiWM?=
 =?us-ascii?Q?K9OHmJyE6qolngyIU65K1F0sHxuOnmFHlwXjafqJw2Nw7L5Ct7T+YgH9J+Io?=
 =?us-ascii?Q?JuLDRRPU287diWgEp91uyD0qprSgfDtjYbjKmup0IqBQ0KZPMeTv3TwrqNrG?=
 =?us-ascii?Q?emlmQ2EzKQBkSylAxWf2akX1LunnuayuS27icH5e0KuRfAva70AGvpjWnvpI?=
 =?us-ascii?Q?Tzvq0bjGUi9qRK/qZ40MkUttuOgsOnTnviXmDbIv/1y5cE0oznp3ATEYiTEC?=
 =?us-ascii?Q?+0VB5FbTuq+Aiq7hCYmWw4XzIlPXPXHZrPL8pf69D6tGNvo45Vj0FGXK12an?=
 =?us-ascii?Q?5GBpDalngAr3uO/Y8/10yjIMut7EOCApbTNCKz2sDyYtDeLdNiCKZAje4D7v?=
 =?us-ascii?Q?qco3wUPUab9I1vlOcwa05Oix216OPVBzcBSZC2rV6vw1D7iIdyDLH0whzdfd?=
 =?us-ascii?Q?WFoSg9NfRGUK37vDEpyZJMyd7k5jkXRDs5YXVLlg0y7jZ1deyo/VQ+v2XOMU?=
 =?us-ascii?Q?IsqBKDN6+W8/9leZXOZQ5bKnJxXOAykFuyki3tMTG9VhIrHSrYNEdfmxHQDO?=
 =?us-ascii?Q?d+s8OR/npoDbt3p2i97IRcSQsODkVDPIKDzE7ryfeFgb2Z1JIJZkPW7BJJGO?=
 =?us-ascii?Q?diGoa1fCeAbRT935sbzG18DUhAz1gdCkys/2hbgo4qsVavU40vSkKntgazkj?=
 =?us-ascii?Q?dX62+WNxIRnfe8HsluKshSVO4oangUci3GSrNbXxKuw9PkPfsOS0uf/FXXMv?=
 =?us-ascii?Q?iEWZCJ+Z+0AyI4NCbFu4IvilYJhJptYoVh2TMXk5WJ6nDYqTIvkU9tKQE9rt?=
 =?us-ascii?Q?bD3YQoc6despb42PZj2vlzr7hEBNaLP0mYOttX9ksnsaF6megLVK5gj5bHQD?=
 =?us-ascii?Q?gPYQ/x4sozFi3ynS7n6jF/uM0U0zJdNbL9ZZwnbkO2U9T7XDhsMM9mSz6f+m?=
 =?us-ascii?Q?P9Wk7w9aQP4ahLEK7mIxLS7Q76fbqkzR1ANmmAVJNkqOzc8H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a9b56a-1f18-43e6-daeb-08deb83a5b5b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:43:11.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cK4cURsfqgQyoMav7qMzHsI79pGccQ1xzhbizSkfyfJbIfoooTotMJ/qc/l83kd+nEYklH4yHV0FdlY8Swws9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753
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
	TAGGED_FROM(0.00)[bounces-33040-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 9D8565B997C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:10PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop the explicit memset() call on struct i3c_device_info object, as it is
> already initialized at declaration through compiler initialization.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 12bf4797a70d..865e67ac0fd2 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -624,7 +624,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
>  	i3c->dyn_addr = ret;
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
>
> -	memset(&info, 0, sizeof(info));
>  	info.dyn_addr = ret;
>  	return i3c_master_set_info(&i3c->base, &info);
>  }
> --
> 2.43.0
>

