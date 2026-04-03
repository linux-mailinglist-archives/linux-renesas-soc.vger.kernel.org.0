Return-Path: <linux-renesas-soc+bounces-30874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCGmOgT9z2nt2AYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 19:46:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E567239723B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 19:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BC393009F37
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 17:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBA138D684;
	Fri,  3 Apr 2026 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="f1yT73xc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79D35AC00;
	Fri,  3 Apr 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238399; cv=fail; b=QRsHiskpKnyvSVTEhfetAL1pQi6oWcJFVK6ME93rUBlHZLC05Ndr7Gbz2sQRdXrQQFLGOKltJwnECtPwiqdxO0YAlN2iR9hzIAPYctnaJby/00JQ2ZnajA/Coc5RRGAWZCNLzLfeQLu+vHhgDwxPtq6Z0nHMu/5zMDwYNGyGyiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238399; c=relaxed/simple;
	bh=Lf0fUitiVdV7PwZVQ2e1IuJHW6fNCgzNvSRA38/3dRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GPsoPCGIDOJ+YIKjuTnQ5TqagWrVCQLeZfEQRDSrXeG8KLo6xXjw7LeE0GF02tdL0WoPCRzMKn5/pLpcajAChtzsF1S4fpkVfYBt27DdDDx6WTM4oIf5Y0AV8T1IV9eetc8Z8Txhy5dQWpqp/jpsyg963Xw/SmrMDoEuWuQSpEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=f1yT73xc; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbLURXKoLE/VWuSt9Tx4JYztN6idWpslMt+SyDA8jmGxenITIxfkQDDGLAj6FBhvjYiVTFJXgmezf1CgeniO5JqbJwqlr66v5j1yFJlqkS4dxd7NhCpWCaRMFOxn7bfjLC/uGykxn7GDl/LoKqeFh+Kk/8CAJUVVuEK7bVxO+aNkSx36sFJ82AlxJzlWJrgq14vg57Zde9XmIMEjqu9tEVSekZp23isb6lx70tGAF+pF90eO4VBsusaarMi7rzpklf/iaINwfQQypkzjavTHV7vu9E/e4h8NSBWAhtllskPQEFLEXum9D91fKEhjLJ/gu1iTQVGCWixGTiQniZVvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkxLY8ROdKMH9SzD2CwB9EmehMSmbK1qODpeNEWiHH0=;
 b=ByQ/nHatVA5BaaYRMkze2oxoaJIOax8BUon+NjUFNqjiZyxSvpMweTV2f/oNodbPDmguwXBp4Sm4+j5vorrN1K/PrKDjjz0srMrLKba3LTQ+2okmM6ZNm0gDVnSqFVoiRuHQqg3SYoW/uK5Rq4rifq7RnNNy5q+XPwx/hS+S1jIGCwXgWBX4555+LSq63x63zr/E8sxWi1bRRDTP2MRq3Gd0iPikFLMC0ALf5aK/OgpGZNVxfTmxE5cybsEG6nmLCmBrNFiAebvx5z1Zj99IQ5CqaXT8lpG8EUw1VwjFE/qcFdjolVMBR+itF2xcyohKKS/r5Dg2/QzMiuMVarr/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkxLY8ROdKMH9SzD2CwB9EmehMSmbK1qODpeNEWiHH0=;
 b=f1yT73xc7j51mT8aVV5XGEbxIXggxWCdvhgRBZcRGeTFGHb/wLFAFJCrla7mZ6Dn6Gj3AxAa6aIUeR6lI0Kx8giI0HRWn6u3Jwme1yrwS/e0mUjBP95OkwbKYlQ/1twECLA74h+wo4j4iA0tL1ibR6EgV/QcFy3oXWUM2nY0PIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13850.jpnprd01.prod.outlook.com (2603:1096:405:219::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 17:46:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 17:46:34 +0000
Date: Fri, 3 Apr 2026 19:46:22 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chris Brandt <chris.brandt@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm: renesas: rzg2l_mipi_dsi: Increase reset
 deassertion delay
Message-ID: <ac_87h-5d24BJmDX@tom-desktop>
References: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
 <20260330104450.128512-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330104450.128512-3-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13850:EE_
X-MS-Office365-Filtering-Correlation-Id: 5559d8bf-5805-4a2e-b433-08de91a8f284
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	KKEQtdrAde7q8SMvMQxcOpazMEv6WUSslYpw1nKOvliilGpUYsfzLodBSqZPRfZpw/t2PTyp0b5aDCMqm3IgTRML5meo7HmryHQSH9U/NbiJb18gZ9yXbx4Q+Y3ufovBNCf+OnVFF5BJ53ol+AIR+bWjroqDKbys7qN+oG1uR2ocIYCFBOOa1LhqXIJ43UEHlMRhq019EFO0TG+XB+ovR6Sl8paYRbCMs7n7zc7PLGDKebc4/OZe0vpt+WteWtyWmpoPGkoBiNavnKTedZ69Zwh4YltBLHeK4Ojcl3ENFSJ2ENqw3Cv5GpHzyRvf6hJkqKiv94xQuiR83EKA6iWDc9wQexg5Oh7Y01UqvRSVc+pU/RMtNWv4+HhVenoRelNgnAeDhDGvh27sohvE14RpQ8bwpRnbGH9PxYf08pNrbSjYrpQHEVjJ+OzAeIJpwLbGP7QeIMKH2bqA1xcdzLB8FWqSBavY4YIozJGGcinv9iy2PBuzvnMTVBqAnBxa5aqQIZ7u3eV7DgeL/auD5qCB7UzGBCitnjN5KEjgzQ3bV5RNO9H+USSKH+JnSclPZ0SL0T4mexmDwofOkplMedATkB3Hj9T/gYOpIcTes2G8mNqQmzDu9Qxb6WvBCgfaas34uBwOQpGVXB1a/Uk4OzQVFaw/BdPX9WpCiJD7seOiuTImdepHcPCHokMNs9nTe3pJbM0wG8kGvhBOeWaZVoYZOjwnOxEDEGyvy3SVrUdu4+SVtODQu0Cow7V2+zYzx5XGE0xUd8mVhMVK8nnQBDytE9O3A9YmwuhSS/y2wyAg3ig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?we1n50UZiYCIlY0tJPLRkk1lTK+Zn4ChSA/KSwW6UzDYUK+1DUwLpbREIZqb?=
 =?us-ascii?Q?wnpfIvHRbD+/g9lNBFGvbBcbgCzl0LH7ECAhR1R/rMipmsvzqGflVscYJKkM?=
 =?us-ascii?Q?LQgncdfXOzWrR+ZvuijSXMtO+Q6vJdiW2Z8J/amI9cW2wr0fQHxBT9oAHEAW?=
 =?us-ascii?Q?z6WbsEoyeE8DQblqyJNg7+xJkR8xMDZGA/o9QGNaVWkZ2xDaKxnQ0cbCKIH4?=
 =?us-ascii?Q?B+oTFvGNPPQAejLgt363d6J1kniUe8lUzuPfV77eZvK1erJGzWG+kmDhKM0J?=
 =?us-ascii?Q?EP5ife2UOXYhY3r/0NZSDUYFjtREa1O1GE718IVXys3KsVMuARUvebOisLM7?=
 =?us-ascii?Q?KJ0hu1EGRli6XfRRw2iMIwSDeNumtOP4uvaIJtZyjfbIPlHM7D+7JVp7FQpH?=
 =?us-ascii?Q?prUY1lbSluwawwvMhYxbt2UNwcyUinurwVHFl+dJqyWfrWynh5crIq0SrKh3?=
 =?us-ascii?Q?hjFa05/T09bH/iP64UK/DJwQngsnGRE3gTgwDvcSJXMcokgpvpCPuR2bdc5i?=
 =?us-ascii?Q?oOLEBm1oDM+T4VubF5njTqoEm3dJa8DE7C5Vl9fvgb0e16YEAlfo7UAwcmjR?=
 =?us-ascii?Q?ahT3S6MOckR8rZS4Xw06sidIZdgLH/qrcgK3F+L2gFazAJEqALf74ypxEuO1?=
 =?us-ascii?Q?PRIuy1GDSIs/rDPH0fNBwqO7qhiI2Yvefk9kQBRZUFO7ycHCPSXcJYThGgAd?=
 =?us-ascii?Q?SVpRv/Zo9EPM+jBGWhhuEHTzipKbE1+AXOWGy3HJTcUR24mXn0eQYbqb4hBZ?=
 =?us-ascii?Q?D0cT7F2iq+yd+ovWFhyfODUtwhQWBT9f9BqgdCKz69J3cKygybjR4tw0x+m+?=
 =?us-ascii?Q?piuQ4kk1owocpvXFpilMmeVv71d7KTjFfxPXIwKmoEQDK59DFbY+S1BUnFfo?=
 =?us-ascii?Q?PNTYYuDFT8Dw3a8yp/mTFZdAw54O1B56OjElct/gVV1iBqllS1oyskiLEVq6?=
 =?us-ascii?Q?CoKcgkko+ZjQLzYro2czET6dLFDsAVkkK8CO26zUUkeUjO69dXct82JSZOS+?=
 =?us-ascii?Q?FFY2z3fWjSIi5CCNayrdnCS2QWLr+htRaKJ7GCiYK1a+eFGh5g0SOr+tt907?=
 =?us-ascii?Q?M/u8jPJUe8+k86PYmhnfe2laeRAYR2ZxJ+4mH8fPsT+bxw0ThCfvZrIwkeMf?=
 =?us-ascii?Q?16mifUoaDcPRx1pRLBdcDgxhx31eTMU3IbBW0Nt2Vgces8NRw8JBkBIDrpy4?=
 =?us-ascii?Q?HBtuTVE5rRuB9yBZmBz5RMEl30b6yMEN2xDWeD1pmi0++Apl2VeL/zEzyJ0j?=
 =?us-ascii?Q?QUEsRcPQ19u9MEs9HdzL8EUv7Q6p+P3KjVo4TXTigQZiZDILmJH5kGDWwSyT?=
 =?us-ascii?Q?SRzD4HKmi67Qd5HZbIMafLR+bHM5CibWQEOkG9pl034S/EdWYDnkgR6/SYWz?=
 =?us-ascii?Q?lv/lX3DT/W5iN3TJ/9CWkmcs/j7BLGzykYBehRX1VhH9a/Z/0bR6UJOOPxI8?=
 =?us-ascii?Q?eIjABK1i1Gbih8XIwvV+Dk+a/RY8cYBWo//DCkXdY8Q8ffhBD0Tkj9C22i+i?=
 =?us-ascii?Q?W7lAneopRBdGqsbVCBwEo9UlQKZ3ved8PSG2/xw6w6eb/9zybSVJKkUE3Oa4?=
 =?us-ascii?Q?2wga/APo011Jy79yxVmwmgEJjGVOX8FWe4GXY/igLKUiI8tm6K5qVZUSU/yY?=
 =?us-ascii?Q?iPilQPtM067V1x5gQ4shWHXqx/r11uLIl3Z25dnFMmhgRv6z2BEg8s/akmpN?=
 =?us-ascii?Q?u7TsCHTqYQCs3gOjWxLVYLvmvsUT/QgUkvc+bWQdG/XevH9H91XfvMRQ4O3Y?=
 =?us-ascii?Q?6JRy47Na4LKELbIUlnPwzCLWGzVYfVQk6HyFv2pgnkws6mbY0Zw1?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5559d8bf-5805-4a2e-b433-08de91a8f284
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 17:46:34.5965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oc0w7JSfxxJS7cmbo2u64JvUtXrmbcwsR3yLh9W88ZSWGmoW1hSus5i64rNyaDxg/jiN+79Z0toKzt5W+vJq087gatkIFdxGccuHDJtH8cjhlBuZiEJ8zffymHDv4qLx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13850
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30874-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E567239723B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thanks for your patch.

On Mon, Mar 30, 2026 at 11:44:45AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
> requires waiting at least 1 msec after deasserting the CMN_RSTB signal
> before the DSI-Tx module is ready. Increase the delay from 1 usec to
> 1 msec by replacing udelay(1) with fsleep(1000) for RZ/G2L SoCs.
> 

Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Moved the patch from patch#4 to patch#2.
>  * Added fixes tag.
>  * Updated commit description.
> v1->v2:
>  * Updated commit header and description.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index ff95cb9a7de5..9d9f77d8f949 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -528,7 +528,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>  	if (ret < 0)
>  		return ret;
>  
> -	udelay(1);
> +	fsleep(1000);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

