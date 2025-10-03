Return-Path: <linux-renesas-soc+bounces-22624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85810BB66AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 12:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341E33C7F01
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 10:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7738F29BDB3;
	Fri,  3 Oct 2025 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LxDeHWEL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BA42628D;
	Fri,  3 Oct 2025 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759485837; cv=fail; b=MB/EfIo9l2qcjrY7A1b2kUcXc+D2mOT2Hsntaus9m4tyS5R7ycGerojt3MSuNnVfH5ZdFzIM9KeVAXrrpnJUSiY8bjQG00OJXFNuHAQylBIjh6XUH6GAHh6TvhJwvSz2aHbp49xQGg/8l+J2rfVX2YZmdH7ZVMOUlJQuJQZfRfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759485837; c=relaxed/simple;
	bh=6YbiY4ZO/DSlbveGxK+ofvlkDE7Azea9fsgw+dyDZvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VqudMKn+ZLRayLrtfrKDHmlzekve/Y0hZ/+gp/drFQglYAduRrnb2ooNZOUhxBi7hcTfmKkMtyvAllZEIOG0zhL7vHRFvaynuQCndryiLJZCW7xWs8Wf4/Pq9EFYcYkiZsJ+cdTIVXlVArlaQ0am+XGFbmuynBOjHeWpWOGAHM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LxDeHWEL; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqF80Oa7NNIr9wjPmnuXPhmhf9a3h9UK89bu49rW3yo4bKwrraIuEw1wtBC3xVCdMbkgi6eHGfgVMM/Uz5RQKFesHkNDV1x8WCQm9ybQ0PIUxVD0+0fGhgsHIE9vWTdtPvrv8hcGuAsDZaRDdeRAksTZRhgB1Q2+/rBZfwmGeCZXqfRGpSTibzgqsaCiBfpjY0tWeqgMrJhg6r9m/T8mkgUa+dnV+y06hRNnI46YxBmXZnjHnrMwYlBRa/S6G2Vw3apGbdIUpPhhl2egFXT0ZfTP631OurL/UKMIS7SsOKfZXBWVJLTPJHXepNgNlypLVYDGFi+5RRGoWNWliaMClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wJ+3SZSK0WpFZkWMxAmTt5Qo4UUOOxHna/SO7j5l68=;
 b=MztqME1e7W4ipSiLJM3l4u2sXCADWG6wYrWZ+xTU7N4wPY61ovia85KMCufgTF/k4enwCJuFI3Dlvd2d7ZVlVySOlYKhkUgTYAekJejXr37PwPUnwaO9OJbvnBE1hZH3oyX23hVkG8DKpkHzdIjaUnDs4fz4CoKW/q+Co8REinwb2MOombAsymr0w6+2RI3nTwWeqklyMQaj+Q8Wj6F1aagftjQj9Xj0B/o4IXUkz/xLXnP4BOCdT3t1TAscWBdUur35jUl1f25aPlUhZQESgtjD4OX9bAJhX/NAULwuQQ4ezSzyktUe1lP1eQ1cA7MzTawy219yeOnci28X/XDdOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wJ+3SZSK0WpFZkWMxAmTt5Qo4UUOOxHna/SO7j5l68=;
 b=LxDeHWEL52wgc7fCNMuXkcfhADuh+FJQqi71LDLJIyBok+7VwuSbYr4mIPWr5ES16Oqf5QjkhemI1uM3ZN50UzB1oFkxISQa0NcLezcVDABXPshoZguTEpBuqwFVzYcMWzkFDfer8r+w6wv/8arOgLxk8xSn1NfdAstkYVVhPNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB10305.jpnprd01.prod.outlook.com (2603:1096:400:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Fri, 3 Oct
 2025 10:03:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 10:03:50 +0000
Date: Fri, 3 Oct 2025 12:03:31 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] Add USB2.0 support for RZ/G3E
Message-ID: <aN-fc_v1nxInFNml@tom-desktop>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
 <20251002-mystify-idiom-0273ef40b4dd@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-mystify-idiom-0273ef40b4dd@spud>
X-ClientProxiedBy: FR4P281CA0304.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB10305:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8a7105-9ee4-4234-d28f-08de0264267b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KZ7PYo5yqCvo2MHORfRGFKkuqIxJuyCawbpE5i+JCieyrvlSaTxBteWjJm81?=
 =?us-ascii?Q?vdSA/2dPAFgIm/jer/WO6J32x2viJ0yCoc6DvFWW9ZTeiG58ixhHfMi+yaOx?=
 =?us-ascii?Q?72yq+NNX/5xKZVcv6LrYmJ39qsr57h0YVWZGKmJfuOifQTNBxsC+D3AVH69w?=
 =?us-ascii?Q?R7TC4erhrPDITACoHe4Realy0WcsoIQkZ39sfwLGN0D+rKsKQ6xdJdKrr3/H?=
 =?us-ascii?Q?8K5p8EvJez5YetadRBd5iSqTikgAftzrYjeA2+KnklP1BM7+VF4/yBOnQl3c?=
 =?us-ascii?Q?tTnHLhqryheV1W0+u7MFG9XQLkots0ax4POy/4IeDIs7rbyG95MnKTe9SpoK?=
 =?us-ascii?Q?QqLXGrsoR7rfhDqKFigoT9uZ508P6ZOMoWYCJFL0xG1f+iDztUf8D/tHoRgs?=
 =?us-ascii?Q?MXfdLt6wnW4h4OZ2rmnHB4A/TWOE30boj+zgozaUvtu6A5uzN7s7X+YpDN1W?=
 =?us-ascii?Q?DttEvtl6OajzfwTP89UC9skW/uhFY1Q79TAwTfFL47hAWg1HX0/RapdFA303?=
 =?us-ascii?Q?VpKQzOqlEEYMrrR/VTD5n2Ktp9pNDOeKiMJSwMnoNoZBFia+PAtLjPoYl+oQ?=
 =?us-ascii?Q?mTB3yvJvKQ49Ozb29vFa33aNcQDd5242+WMGF+2djLS8X+74vmRPLW3tNQLC?=
 =?us-ascii?Q?/450MH7LzdRo2yhclhS/qP+VLCiIOSkqtUn2ER8In8sLfrjOy+lrtE02ODPL?=
 =?us-ascii?Q?zMVF++W4EvZbnGITN7G/I9RTXFo+Gto85aIy4EVt96L3NA7/6e9pooZFpBFM?=
 =?us-ascii?Q?He/AbmRVTw0UDTByWCfrnZTVpw4b8UVzCghgPdW+9MC2xVU8/gVEywWVspbd?=
 =?us-ascii?Q?obs1nFYgRcPrgK7u1ecCm4jYUTB79qbiFcpOMAq6hMgVDX4lePzbhMRBkjS3?=
 =?us-ascii?Q?eEv3BuxVbQfnNLE3QqLFGnoItbC5xQb/8AvlkNZBYpweNKzN3Od/7vMf3Ldl?=
 =?us-ascii?Q?EwrucDyN3n0u9yzFt1bBSyqYKE8BG+v3vzAUbBzuJ3QfH0+d+clBW48aBJwF?=
 =?us-ascii?Q?FcAOQwnTb4U0MU1tjVHsQgqapbsgYI2alpkyiOsnp0sbS9dblG/XeMylP8/o?=
 =?us-ascii?Q?ihuee04n8n80kWFpZR8kjZX1VeSQhJJKCWrdQ8b1xp/RSMB8jxs8obDenioS?=
 =?us-ascii?Q?pNzvpCtF0aJWCmrgAlWGWZgkpHmNin5trZKkoJK75hzOnE001tFXkfaK/PYg?=
 =?us-ascii?Q?HB55887198GBas0297jMZdWWNY72GhHryiMZWp2AEFSfBr8bH8VQtsIKIJB1?=
 =?us-ascii?Q?BhZJ/x5zZ2ouVqG+fMKEYox/8JRJr4Mvxf/eYckI96BQqitFfUDLClMC53RT?=
 =?us-ascii?Q?VErjgx3J8nCzjQj8bbCIx2yr+6LMWqA0OJkNe0yFKZDqwyl1RhAqeu5ybSGr?=
 =?us-ascii?Q?4R3/H7XsjP/1vl8mrQGRSW0ifbRTmpz+dJNsQ4cg4Boi7nELgLcT4U4zmdwx?=
 =?us-ascii?Q?vpfalKqd4ZiTcewiTqmDBea/JT+8KCOQmwGXZ8LkrkQmIu2kZ1c1IA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XXyuphgF5/9ftoWXTogSMAo28nDcifb20zg3iwKEj/s9dSyS6VYIKOpjRZsj?=
 =?us-ascii?Q?oEnhJsxH5zsYN2h82QrrMKaVE6qW8qlt8z81QQcfyYcstyQbRuut6tov85O9?=
 =?us-ascii?Q?jeP6Hd7zp3Z4uv2tO6tPcESv5tnKxb47nIwKT8l3hCg7MFgW+sNaVMYP717z?=
 =?us-ascii?Q?h8Cb8uCd83zur0MSsZD8DNI7X2uXT+WCGAazLF3gFp8wEo6IRLhR6B4PNl4T?=
 =?us-ascii?Q?ABC6ab6FJnogoYsUo+ulx5Vam/QXwRk6DvTh9QY97Ky38HjZ7dnvzf/0OUwU?=
 =?us-ascii?Q?vDDvmzHyg5ZBEW7BOSVEG3MGHnn1y+BKb9+i8kjksZrZFBwrm1WEaduhaZ4u?=
 =?us-ascii?Q?nNfljkzKdtJ614+BSBpepuIhYabs2YrSu+Srp6tg7Z6kF7vv+7WaaG3eHDwV?=
 =?us-ascii?Q?P0xQdfVUZ7H/27act3yTadjTNF0g7C+Jo7EfihLrb4SN+1V1WpyJEgy+krT7?=
 =?us-ascii?Q?ihnS0a/+U4KLT+e483XriqfslVYxU55qgA2xdFVQRNv80uYz1eXadQnGgrmc?=
 =?us-ascii?Q?qcQCY6uAHAI5cXwrhGoiJvZ6AOmMKF4Epo/WByuhKs6Fd3CMtf7MJsO1Pso4?=
 =?us-ascii?Q?K/y0fG7N8kI2qXxqGvNElXtknMVf1vbh2K4oT3AZAmi1q9vBfF1opp0sctdi?=
 =?us-ascii?Q?6uf/JT2JpIXL9r9eN4YZu6VhNyh8gP/lc1Vl7WvSsulur7LC1BSlWWpl2RpF?=
 =?us-ascii?Q?zo7ZKaE39bdRkdGc7aGEC9vosdatM5jve/oQVGP1kqqSRkulkMzFC0mGbeWH?=
 =?us-ascii?Q?YpLUtV6XMjnzsN01u8E9boZfYrXw/h+eMHxLbQuZRrqUhWY+egyOJRCvKbpG?=
 =?us-ascii?Q?Eb/82L7OG6v+Ruuyw372UOlfEWE46Q9JcDGDGmGgP9ZOTiISgIEfCdDjYSE2?=
 =?us-ascii?Q?zQBrgAPo1vpiP+35+Ro4vHmDicodOzvZIrrQ4O86BXuBDy9j6tw2Qysyut7o?=
 =?us-ascii?Q?Zbbo5SL30vBqli2K4OlgseMAqAH3oCC41TFHb/JbtpfNELlY0HC0Nk+fJpO8?=
 =?us-ascii?Q?fcVvdEGdRLCoB2weU6BEO0ByQEozug9c13s7wzEO6eAINVlM7DEzGy4jUhVT?=
 =?us-ascii?Q?GXdQSif9HCJ3+YJci96einndNa4WCeHh9ZYeE0Pk2AkquwWnW5sTP8G84cPb?=
 =?us-ascii?Q?NTWAxsyH+1n+W5ce0pP7MQu++TpLKEZ2/8GkWoSm5h4RG4ZbS8qm0l+PPuS4?=
 =?us-ascii?Q?JoxucX9nmnL52VsHcSr18vl0UPU/o113JPi0LBES5+ny3Bd1XFtednP7SQwm?=
 =?us-ascii?Q?zIAdSbKJBHCK3/N1pdqrkCBFwPjguwgZdduEB40vu3Uao7zkf+GtKsrccGIZ?=
 =?us-ascii?Q?3U8AvKVg7roWRhTfve9ShoPsY9AIZKwIA4g1pnu8/nHOvVfzJh27dVj52Cq4?=
 =?us-ascii?Q?hgH8Q9q8DDt7UqwSkw3yEb1AYZyW5T6kK9SB3U1trI27jZ2/o4A6tZd3KgHg?=
 =?us-ascii?Q?KeEmoHb2zi3vfW60Sgd3tN/7oWwVYp/3yfI/iEJUk4gTW9spBbXKYlXl5VU0?=
 =?us-ascii?Q?KE01gmYBG5wTE2+6Znn9ObfAdJIz2UKZqNTZwsjVDnOqRNETrnx8l2I9+UvP?=
 =?us-ascii?Q?zjUP7pj7Zrq+a5xC4oU1gh8BzU/D7Ar889AWYNRg7YlihNHe2qx8Fos7oM2P?=
 =?us-ascii?Q?+QI3Eu1ve0bexX7keL3E7cQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8a7105-9ee4-4234-d28f-08de0264267b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 10:03:50.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7J/T+KF9aDo/FxbzgTdrh5nFKx3RKwtMTikmgphE0oatPQkwEORHLrw1lKCCsCAsFgi9rzt9UEa1VfEFAEscU2BWUAfj72mMWcxbG/lkFoASAY4ieTfyXHLLUWP34td
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10305

Hi Conor,
Thanks for your review.

On Thu, Oct 02, 2025 at 07:48:57PM +0100, Conor Dooley wrote:
> On Wed, Oct 01, 2025 at 11:26:44PM +0200, Tommaso Merciai wrote:
> > Dear All,
> > 
> > This patch series adds USB2.0 support for the Renesas R9A09G047 (RZ/G3E)
> > SoC and enables it on the RZ/G3E SMARC II board.
> > The RZ/G3E USB2.0 IP is identical to that used in the RZ/V2H (R9A09G057),
> > so the existing support has been extended accordingly.
> > 
> > The series applies on top of [1] and [2] and includes driver cleanups,
> > VBUS/OTG handling fixes, regulator improvements, clock/reset additions,
> > and device tree updates for RZ/G3E, RZ/V2H, and RZ/V2N SoCs and boards.
> > 
> > Thanks & Regards,
> > Tommaso
> 
> If you're not gonna CC me on all the patches in the series, please at
> least CC me on the cover so I have an idea about what is going on in the
> rest of the set.

Sorry, I made a mistake when I sent the series.
I only ran ./scripts/get_maintainer.pl on some patches, not all.
My fault.

> All the bindings are
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your tag!

Regards,
Tommaso

> 
> Cheers,
> Conor.
> 
> > 
> > [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1001788
> > [2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1006104
> > 
> > Tommaso Merciai (18):
> >   phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
> >   phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
> >   reset: rzv2h-usb2phy: Simplify pm_runtime driver handling
> >   reset: rzv2h-usb2phy: Set VBENCTL register for OTG mode
> >   dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
> >   phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
> >   regulator: devres: Disable exclusive regulator before releasing
> >   dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2 PHY core clocks
> >   clk: renesas: r9a09g047: Add clock and reset entries for USB2
> >   dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
> >   dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
> >   dt-bindings: reset: Document RZ/G3E USB2PHY reset
> >   arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator
> >     node
> >   arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS
> >     support
> >   arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator
> >     node
> >   arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS
> >     support
> >   arm64: dts: renesas: r9a09g047: Add USB2.0 support
> >   arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
> > 
> >  .../bindings/phy/renesas,usb2-phy.yaml        |  10 +-
> >  .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   4 +-
> >  .../bindings/usb/renesas,usbhs.yaml           |   1 +
> >  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 122 +++++++++++
> >  .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 +++++
> >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   6 +
> >  .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   5 +
> >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   6 +
> >  .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   5 +
> >  .../boot/dts/renesas/renesas-smarc2.dtsi      |  23 ++
> >  drivers/clk/renesas/r9a09g047-cpg.c           |  18 +-
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 199 +++++++++++++-----
> >  drivers/regulator/devres.c                    |   8 +-
> >  drivers/reset/reset-rzv2h-usb2phy.c           | 105 ++++++---
> >  .../dt-bindings/clock/renesas,r9a09g047-cpg.h |   2 +
> >  15 files changed, 478 insertions(+), 85 deletions(-)
> > 
> > -- 
> > 2.43.0
> > 



