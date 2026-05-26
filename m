Return-Path: <linux-renesas-soc+bounces-33131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBtdGINGFWqLUAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:06:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B14265D1776
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 263D2302411A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 07:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D522A380FE3;
	Tue, 26 May 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="txwEtoAM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D26B2DB7A3;
	Tue, 26 May 2026 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779078; cv=fail; b=Yf2og+ZFynhzAd7f64dsruqM2O/8EPtAljP9O6eIxy/rWm8Trs+X8dQjAV8v2jMwP5w6v0SgJpuFDRdELjhoM+/0mJid7invbkWPjHZJmfS+ujxqtG/TdNcWsSLOj02VVtO1TTJq5icqLIyg6l9SsROSCuzF1Xj+bs3tvBabIDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779078; c=relaxed/simple;
	bh=cl8/gXWarAN/krS1B1S26g/t5sOLon8vTIcaH6CymWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eu+jVaY3n746RiHb6Zd0fIteb8LqhjUwsEDmia1i4f0AD4auHRkE210NA1v7C2lmclDn9uUFQ8ozUC93fm6qQMFw9qFTVU669eJycNQ+r4n5zp49/7mkTIsEubjlzcLO232ukIYFMUYF8MqaERRzCidMgvYFpaqzL74cJbEz5tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=txwEtoAM; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MddDCRdxb3OXkF7uGJhJWfDoXRdpcXQA6AD9YI82cD7q67jzdWK40EZi+a2jxMrpYze+O1IBedwzh8AvHj34u6MxyWVdQ2t3l2vgHd8QktfvenixclW7aiZqxnB+oZxEX3u8q61cjEbanM2Br1EuItkUNesFrfIm1ZJqXGgAZB58/gLaXTFtq2xvXCCs6iWLQ+LeQZPouFzhIN2NoyUBUH3dCw+VsDX7RYkOxeWRcoroWkdn/1SmJZpdiOLlM5ZELipuFj05AEscInmmni2bhzZzMWTxDlWfMejfH5GBC/wGAEAZG3qGCdvXeqJaVfzeD5aCMafmb3y0qZgG4gvyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRL9Fmcwm+P7T0CH6TYgretqFVNb7TLITdcU/WxLzKE=;
 b=gNsjepNW5g3HokGV4nfSSYTLiNlC+9LT+CNs/t1gZvB/y4yVxCMfoGx/Sx9uuULvzNWnREU3MEZJJDG3enAnTt12f0/KBwyevUpT5+7h1/2Gpr/t/YtB0DskmZ+7xysZDWGMoLDXFg6fG+tKkVDLrykUD4fmwXyTyWvG4FXvWscQS4Us08qL2G5L76kUOQl2UrSavLsy4GlXgMJxwm/qsh1H6BFijWqvcPHKkC2EtxDOQLTY7PAi38MZWVBEO1S0wZQE/4ZrV/rCARd4zblGpZaHu2ulbt/5BIE3r9DHasI+DPdqWYe17tKVFX9OENttMDQHi5JDRK8nxTQ6Ve1Tgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRL9Fmcwm+P7T0CH6TYgretqFVNb7TLITdcU/WxLzKE=;
 b=txwEtoAM18NLu7mHwlb+gSVkhA6CQ2gEJ0SAlwL3Zro/dj/V+rRjcPDsXwh+YiE5ZjvRfER61v3Z1200q5yoz1RbUcavOVMwbuANYJ/khtwcfagoD5XF1FGMu0iwR43cd8U9MtBUv0o1ccESr1G87FuoHQGbZ4VCdjke4dYFpq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8637.jpnprd01.prod.outlook.com (2603:1096:400:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 07:04:32 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 07:04:32 +0000
Date: Tue, 26 May 2026 09:04:13 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Message-ID: <ahVF7V3s1kF3VeDn@tom-desktop>
References: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
 <20260524194457.479681-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524194457.479681-3-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d91613a-6da6-4940-dd2c-08debaf5096a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|3023799007|22082099003|56012099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	BQm11hWY2vaHULyfDzM/kcD7Yd8CxHYI+dD6ctOEHnE00J1XJCv5tVPE0mqW4qXEaWbZZk3Gnvrd/CO/lfr0bQUvwyO+bgqhWhMI6RMywEhGaWgYcMj0LEjKp6miqe9tHIUudxrsxXReD38Kjyi3/LrARnoRy+923fHxo/BOCPmlk29aG7FFRVb01vU6DCuFXiRDW/x3y/mEdlOvgSFrHRwZbbJen1GRS34PLspGRxMfJ0Linyf9Amfmlw+L6D66rH7U72iF8zKrfxpXRUDetc09syeQgbJdvrS532JYopr2KaMTJbwuu/9ZpGxyYziAIhlrDrK+exKRmLA08rDhk841Q1V73slOmPYPiM0WCJWkBqB7fXESU+W7AWS8oZL5cA8DUhBedAYIQIdphKJKLlyoCix4HMY0M+3YSCNnrDjc00zx5tghvxTkth5ackW6b9E3WFYaWi9H8mWLLaSG11gNQqpzaufVPMqCYLNHCMfQBQhzN11NPHxm+UkPg/1IwX+pXtjU2SJ4EZ0Hv8xsN+Pb0DxPgJjiYdsg7RBoFaqQVa8fDFOD1lo+1iGm/jHRcb781EOwQFpbF8J0MvOCvdZQheCJXkP9aCgV2cFgN9vwaU3SaFbG0xnbKBSJjyAd+5mCtD3MvY+ePDJnhGcAmncN7Vc2CBK9amvqUchHIPxfZ7BCbrBLUAa+9hsRnNv1KIuH3veXAQk9hcS8M/YqlI29pnyU4IDLXcE+PvmDidD3AEgOiZ7tS9jvLxbU58Qv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(3023799007)(22082099003)(56012099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IUwSYQmRleIXHTu58qcwmHif8zWTYRFfX/d9M/T1chU8we7Ce9sxapBwaDog?=
 =?us-ascii?Q?a6qbd2Vs4UUx52i7lJm42F+4DuEAMj06IkoBoTprAMx8Q+ClcM5rTS74xRfZ?=
 =?us-ascii?Q?zuymVDAXPmZbLSLvKjuAIVOcnaYAK/r5XziOjkMYldwunFwjjt19DiQi3+Zx?=
 =?us-ascii?Q?aCWU+nXS53B5p+gL/4lm1xt5cdqVHK7XM2vXfusTVSahPg5hMZ2xxaJuPBtG?=
 =?us-ascii?Q?L2Dhqo5YKkm9m8EzMuwqJsLkXo0IXPwatxbjgt9P8F7RnLxOg4fK4Cl0vUVN?=
 =?us-ascii?Q?ytpRO2Www80v9tTGRBUZmQM+ICdwE5+CLfN3Lx8JPs5c40E8agj5YTpDJaGV?=
 =?us-ascii?Q?VAD+12EL1Q2jWMknwlAB9dKwGeZRHEpCL0s1eICF1srSDExpI5z7tttlykaj?=
 =?us-ascii?Q?GRmpgTYT/WT3InOv3vPQCrwHsydis+YOd0wPQqVhbO4Q7xhDfp8nwQQlooSJ?=
 =?us-ascii?Q?eYowgfG4/m1tKhMJ3M6K1i/886Ay5SWM18xIUoRzbe5TNa6zrrI3ciZjjgu0?=
 =?us-ascii?Q?0FG0ujv84Uz/NSUrgUjvpya3C3X2tu6HzNT9MeJWMarSHOKKUj0iPBczmAIk?=
 =?us-ascii?Q?D0dVQohDGTF56DtYuvhYkukDS+UsMovvq4O422ge0We8MXH7FdLVkf4OCccs?=
 =?us-ascii?Q?gB4oilQ6kb1F2f7BK7ddeNlkglXca5+PO4LaX4kqVs7LLp+x5qPpVIo4uXvk?=
 =?us-ascii?Q?V5xrZsyFbbroQ3TsgLKsKtZMwYXrWFJivEHpbmH9IRWEBqTVz/Mc85RWtJ2E?=
 =?us-ascii?Q?V8EabTC2zOGCjsdrG3t+ZuM5FBLHQH8MwdhJHaRzxRdIVYdo0ZeBopSFusGO?=
 =?us-ascii?Q?vqLqf2Xv1408J3LYKQacxe3dR5FD3uipBZY4CXkRcKHxvGMR1L4Lw1yMyAHB?=
 =?us-ascii?Q?hxeibxu5fyoM7hpClMN9iEo6gl6yRWa9GTZQQf8TUrmOOHLX6UhN/AQZXGIu?=
 =?us-ascii?Q?fMOY1Q4/cRLjpdQ1SUuIQcG5/arsQz2wtvDbclxMiscxLAujHC30b5whzXjx?=
 =?us-ascii?Q?nxN6FEQ0qO9UfilutKoYMKNkDPFuv6Q1iIpjNL34DulpcNue2rwYw5mLltoA?=
 =?us-ascii?Q?ALDqk11EKvuWLsAS6+jFOfaVCQCRrmxi7fVFdsVEAVcY0+298OFc7Q7ZVmfu?=
 =?us-ascii?Q?awHxO27C91yNlgzBkSa3ZfSV/c53lbAwZmhsmnOLO/jDyCHbVlvw3KjYTBnn?=
 =?us-ascii?Q?mQgL8fzDVWRUcx6zVrspBsgOZ2W7Z48vVX71U+wqaOTlwAfh7/a62dQaMcRR?=
 =?us-ascii?Q?CBceL4ZhUkM2NFhaa5iAQgPZuHJDpGFryuXekqTt1kHh2H3g+3+wcMSpY4ue?=
 =?us-ascii?Q?vaOnoQ0eEQ8iWsuqUH6OhWNkl1NFGAtckB3DaQEjhhXMHmZOHTQpsCumvKnB?=
 =?us-ascii?Q?YXEMgYCtERhmgoiIu3KCcPp9CvGA6DERAvHAgfTZEnog5Lx0OHjq0jHmA/JJ?=
 =?us-ascii?Q?QivsBEEODtMdutt2h8pUhSQGCZlq6nbAmeL6TKwJyLo5Jus/Icwl5kbBb30d?=
 =?us-ascii?Q?ajmQo1D0QwVDvdJ5UL6Bti6l/BDPA7yXTjh+7FK+kRPrdvW7kvi7KCMPr/2o?=
 =?us-ascii?Q?le+LNcUAZqX1DXyk+F3A8AZnQzQajzEpNUqmi2FEMeh9JBBWQs9Us5vMejwW?=
 =?us-ascii?Q?sQLYCPGLG+wzEf3HLPY/806ezrD1wq2n4VsVz/um3SC9ir2qIiKPvCaKj4Xq?=
 =?us-ascii?Q?xcMwhr3ohMFRmf8Q35dYZhdgjSjmur7McvB6VOzfp7GBesUBJm0/psajAhly?=
 =?us-ascii?Q?QZC75iyxtZDs+xxWoUMdxKmmd9xju3FbND9ZyuH1XnOANsM/yNLn?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d91613a-6da6-4940-dd2c-08debaf5096a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 07:04:32.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y1usgP71AFT/zBlwY7lgzJTMNXOa1AffGXbyKCeEdyASvuj+qDdxs2VL/tlLjwZCMzPir0+Tp3KOK1lFHzObCGQO+HTEcXmFfVTtBUnO9vTZwHN5ZrwqXICi7g2lJf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33131-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B14265D1776
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thanks for your patch.

On Sun, May 24, 2026 at 08:44:51PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
> mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
> from 25 to 87 MHz. The LVDS module cannot be used at the same time as
> MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
> the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
> MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
> module.
> 

I thinks this should be v3 instead of v2.
Apart from that patch LGTM.

Tested on RZ/G3E LVDS ch0.

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Replace drm_atomic_state with drm_atomic_commit in
>    rzg3l_lvds_atomic_{en,dis}able().
>  * Drop local variable ret and dev_err() messages in
>    rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
>    capture unexpected failures since atomic_enable should not fail.
>  * Drop local variable next_bridge from rzg3l_lvds_probe().
> v1->v2:
>  * Dropped unused function rzg3l_lvds_is_connected() and removed the 
>    corresponding header file rzg3l_lvds.h
>  * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
>    next_bridge.
>  * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
>    atomic_enable doesn't fail and for each enable there always will be an
>    atomic_disable() call.
>  * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
>  * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in probe()
>  * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspend,
>    resume}()
> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 277 ++++++++++++++++++
>  .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
>  4 files changed, 317 insertions(+)
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 7f2ef7137ae5..cbfc7b6bccb8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
>  	def_tristate DRM_RZG2L_DU
>  	depends on DRM_RZG2L_USE_MIPI_DSI
>  	select DRM_MIPI_DSI
> +
> +config DRM_RZG3L_USE_LVDS
> +	bool "RZ/G3L DU LVDS Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	default DRM_RZG2L_DU
> +	help
> +	  Enable support for the RZ/G3L Display Unit embedded LVDS encoders.
> +
> +config DRM_RZG3L_LVDS
> +	def_tristate DRM_RZG2L_DU
> +	depends on DRM_RZG3L_USE_LVDS
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
> index 2987900ea6b6..46decb7ac4f1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
>  obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
>  
>  obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> +obj-$(CONFIG_DRM_RZG3L_LVDS)		+= rzg3l_lvds.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> new file mode 100644
> index 000000000000..a51c3e5a2efe
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3L LVDS Encoder Driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rzg3l_lvds_regs.h"
> +
> +enum rzg3l_lvds_mode {
> +	RZG3L_LVDS_MODE_JEIDA = 0,
> +	RZG3L_LVDS_MODE_JEIDA_MIRROR = 1,
> +	RZG3L_LVDS_MODE_MODE2 = 2,
> +	RZG3L_LVDS_MODE_MODE2_MIRROR = 3,
> +	RZG3L_LVDS_MODE_VESA = 4,
> +	RZG3L_LVDS_MODE_VESA_MIRROR = 5,
> +	RZG3L_LVDS_MODE_MODE6 = 6,
> +	RZG3L_LVDS_MODE_MODE6_MIRROR = 7,
> +};
> +
> +struct rzg3l_lvds {
> +	struct device *dev;
> +	struct reset_control *prstc;
> +	struct reset_control *lvd_rstc;
> +	struct regmap *regmap;
> +	struct drm_bridge bridge;
> +};
> +
> +#define bridge_to_rzg3l_lvds(b) \
> +	container_of(b, struct rzg3l_lvds, bridge)
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +
> +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_atomic_commit *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	u32 fmt;
> +
> +	/* Get the LVDS format from the bridge state. */
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	if (WARN_ON(!bridge_state))
> +		return;
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		fmt = RZG3L_LVDS_MODE_JEIDA;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		break;
> +	default:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> +			 bridge_state->output_bus_cfg.format);
> +		break;
> +	}
> +
> +	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
> +		return;
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
> +	fsleep(20);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
> +	fsleep(10);
> +
> +	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
> +	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
> +			   LVDS_0_CTL_FMT_SEL_MSK,
> +			   FIELD_PREP(LVDS_0_CTL_FMT_SEL_MSK, fmt));
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, LVDS_0_PHY_CH_IO_EN);
> +	regmap_write(lvds->regmap, LVDS_CMN,
> +		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
> +	fsleep(100);
> +}
> +
> +static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_atomic_commit *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, 0);
> +
> +	pm_runtime_put(lvds->dev);
> +}
> +
> +static int rzg3l_lvds_attach(struct drm_bridge *bridge,
> +			     struct drm_encoder *encoder,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	if (!lvds->bridge.next_bridge)
> +		return 0;
> +
> +	return drm_bridge_attach(encoder, lvds->bridge.next_bridge, bridge, flags);
> +}
> +
> +static enum drm_mode_status
> +rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
> +			     const struct drm_display_info *info,
> +			     const struct drm_display_mode *mode)
> +{
> +	if (mode->clock > 87000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops = {
> +	.attach = rzg3l_lvds_attach,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_enable = rzg3l_lvds_atomic_enable,
> +	.atomic_disable = rzg3l_lvds_atomic_disable,
> +	.mode_valid = rzg3l_lvds_bridge_mode_valid,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Power Management
> + */
> +
> +static int rzg3l_lvds_pm_runtime_suspend(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = lvds->lvd_rstc },
> +		{ .rstc = lvds->prstc },
> +	};
> +
> +	return reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
> +}
> +
> +static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
> +	struct reset_control_bulk_data resets[] = {
> +		{ .rstc = lvds->lvd_rstc },
> +		{ .rstc = lvds->prstc },
> +	};
> +
> +	return reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(rzg3l_lvds_pm_ops,
> +				 rzg3l_lvds_pm_runtime_suspend,
> +				 rzg3l_lvds_pm_runtime_resume, NULL);
> +
> +/* -----------------------------------------------------------------------------
> + * Probe & Remove
> + */
> +
> +static int rzg3l_lvds_probe(struct platform_device *pdev)
> +{
> +	struct reset_control *rstc, *arstc;
> +	struct device *dev = &pdev->dev;
> +	struct rzg3l_lvds *lvds;
> +	int ret;
> +
> +	lvds = devm_drm_bridge_alloc(dev, struct rzg3l_lvds, bridge,
> +				     &rzg3l_lvds_bridge_ops);
> +	if (IS_ERR(lvds))
> +		return PTR_ERR(lvds);
> +
> +	lvds->dev = dev;
> +	lvds->bridge.of_node = pdev->dev.of_node;
> +
> +	lvds->regmap = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(lvds->regmap))
> +		return PTR_ERR(lvds->regmap);
> +
> +	rstc = devm_reset_control_get_optional_exclusive(dev, "rst");
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get rst\n");
> +
> +	arstc = devm_reset_control_get_optional_exclusive(dev, "arst");
> +	if (IS_ERR(arstc))
> +		return dev_err_probe(dev, PTR_ERR(arstc),
> +				     "failed to get arst\n");
> +
> +	lvds->prstc = devm_reset_control_get_shared(dev, "prst");
> +	if (IS_ERR(lvds->prstc))
> +		return dev_err_probe(dev, PTR_ERR(lvds->prstc),
> +				     "failed to get prst\n");
> +
> +	lvds->lvd_rstc = devm_reset_control_get_shared(dev, "lvdrst");
> +	if (IS_ERR(lvds->lvd_rstc))
> +		return dev_err_probe(dev, PTR_ERR(lvds->lvd_rstc),
> +				     "failed to get core reset\n");
> +
> +	platform_set_drvdata(pdev, lvds);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
> +
> +	lvds->bridge.next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(lvds->bridge.next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(lvds->bridge.next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	ret = reset_control_assert(rstc);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = reset_control_assert(arstc);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_drm_bridge_add(dev, &lvds->bridge);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register drm bridge\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id rzg3l_lvds_of_table[] = {
> +	{ .compatible = "renesas,r9a08g046-lvds" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, rzg3l_lvds_of_table);
> +
> +static struct platform_driver rzg3l_lvds_platform_driver = {
> +	.probe		= rzg3l_lvds_probe,
> +	.driver		= {
> +		.name	= "rzg3l-lvds",
> +		.pm	= pm_ptr(&rzg3l_lvds_pm_ops),
> +		.of_match_table = rzg3l_lvds_of_table,
> +	},
> +};
> +
> +module_platform_driver(rzg3l_lvds_platform_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/G3L LVDS Encoder Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> new file mode 100644
> index 000000000000..281b7648f168
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RZ/G3L LVDS Interface Registers Definitions
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + *
> + */
> +
> +#ifndef __RZG3L_LVDS_REGS_H__
> +#define __RZG3L_LVDS_REGS_H__
> +
> +#define LVDS_CMN			0x00
> +#define LVDS_CMN_RST_PHY0_SEL		(1 << 24)
> +#define LVDS_CMN_RST_PHY0_SEL_CH0	(1 << 24)
> +#define LVDS_CMN_PHY_RESET		(1 << 0)
> +
> +#define LVDS_0_PHY_OFFSET		0x10
> +#define LVDS_0_PHY_CH_IO_EN_MSK		(0x1f)
> +#define LVDS_0_PHY_CH_IO_EN		(LVDS_0_PHY_CH_IO_EN_MSK << 0)
> +#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
> +#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
> +
> +#define LVDS_0_CTL_OFFSET		0x14
> +#define LVDS_0_CTL_FMT_SEL_MSK		GENMASK(23, 20)
> +
> +#endif /* __RZG3L_LVDS_REGS_H__ */
> -- 
> 2.43.0
> 

