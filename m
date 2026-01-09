Return-Path: <linux-renesas-soc+bounces-26545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F12DD0B367
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 17:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2F323148368
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 16:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8921366DBA;
	Fri,  9 Jan 2026 16:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LPCNu0Xc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6236405A;
	Fri,  9 Jan 2026 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975392; cv=fail; b=sZbBvB/DkFI7Ux96AvQFFMDS27ppsYi+QYwd7BCjjEtidfadk+V56CEzEsjzfplxV+ViUDrMrw5KV4ZwBvWwXL8Wt2bmAXL3l31niePltIJJa9gyDYOldUl5aY8LYpKf4nSmS/sV6CedMux8x3qKefoZ3eVHGMpyKqZQ54nISdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975392; c=relaxed/simple;
	bh=IQVvN/HVGZIKVUl/DEB62PRukXothDewsT5Di4c2fVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KLUg22g//uU8qwSPDHffQRChrohkIvc/vhGFO4OGo8EDX6dR0+5WrAq80y/Io+dQOISD/X/DeQEo5wtO1UwO8NFElze3nu3E91N1kBHOXBXu8gI1iVAuxvcAJKYhMKQvNO+T7czca0B/mvGP3x9IQKwgp1BGZLM1SAiIeAs0dik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LPCNu0Xc; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow+Rgm3ySQlqmOnWwSUmevnNq++XxhHVyY2W/4g1BSP9JgUcOe3Ha2OslatwQRVZ9hNkDNO98+QIfMYGp8416QIhaFGpIj//y2Lp9v90PRYgP/r+0++LKlI/cj9+5Q9QMRYmC8atBMoubBjEoeWPcdoFCgWyiq7e9OqA6DrwXejUHpGcjUhS5bFmW7uVlJEa4BlbP445WZrYGsF7qUzK8ZFDKB04JJwIALYAEOiH/TSwz+bG1bCPioPg9eLDOCE0zzHe/Q96tfHvpzQjXbOYdc6w/OMUGHoOk4r9kQ+oHfVtTZQX3v0cDqT4rD6Xk1pKI6hymdJbSXYcJXBPVpN1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TVc0j1BkrUDywixGYiMcNBwGf1z9ZUTHPLae22RLy0=;
 b=KiZc65IAcPsVzI7nvRakT83c1Q+NRQz2+PBmRrumQKhetWXKQIQwxEEaEJ1sN0nGOwvXSH+GSUiYSCDpuMBr07Ypd31iNC8pcMqun90vSupcakCuKeVbp0ydYE/w+M4aJyPiVejuG+99Ym7GCsVLaEufPNwOQhJdfB58ibDpQVlUQ4zsyGqLp3vvTul2Y0u7/NBJRlfh2DgHrEwNx7B4F65prTmKF2lRsnf0jPSEi0Y1gWmhae+3FyCnq+ZzsycBYDPG9gxt+nG5IIfCZ+lLfaNj8aMm9qAhw7teYZ0SZFUUIk7RbdrZg5riUN4eOj0G7g1h/2J9y9nrr3cqOplhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TVc0j1BkrUDywixGYiMcNBwGf1z9ZUTHPLae22RLy0=;
 b=LPCNu0XcOkKq9aEYEQCH5WRk6KeT6uXm+qY0ROQlg7bHwNXevaxMZ+6H9XrqyK2w6Ye3g4Y9dzLh21wzZCbfXjqWxcg1pDb8jCaO0ySbd9NH9+H08EwiuAOfZS2IbyhFirWKAY0NLX1ghC7eXv/cwIGMIHqqOdiamcvpxV/ZQQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB14699.jpnprd01.prod.outlook.com (2603:1096:405:251::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.2; Fri, 9 Jan
 2026 16:16:27 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 16:16:27 +0000
Date: Fri, 9 Jan 2026 17:16:11 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] i3c: renesas: Add suspend/resume support
Message-ID: <aWEpy4oEd8FwZ4ah@tom-desktop>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
 <c469ef89e0156d37746a85bfc314232847d1185a.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
 <3d448d3d-ec1c-4be1-ab98-c1e47511f299@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d448d3d-ec1c-4be1-ab98-c1e47511f299@intel.com>
X-ClientProxiedBy: FR4P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY7PR01MB14699:EE_
X-MS-Office365-Filtering-Correlation-Id: 6575790a-82ba-4130-6c0f-08de4f9a70a6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gRWWq/rlonpMFQAwoFrNt/XEVa0zwj5SWKHJ+q7C7qDA1m8l3HH9kEKvMVP7?=
 =?us-ascii?Q?FkFbI3CWpd3F81XfPzi4Nrv1cPjCFoLT7ipVoRQe0zlbQSxDQ8By1Djmzl41?=
 =?us-ascii?Q?83yPkhudmKOdF1fD9AviJnwcJ2S7vkZ2B25tdxPs7c+5ntAHiqyekapOlwPg?=
 =?us-ascii?Q?uxcmEYQpKlu5WWTHe7KS2BgnjpUDm1G9NW6JO1jcbumnVDXOho//XeF4DrhU?=
 =?us-ascii?Q?XjBe+/BpfJz4+6qMlPWp6N68tYolQHmL8tQquGtbU0iHuOo5M+xGPs31jE2j?=
 =?us-ascii?Q?YwjWZ6OwDLlqkkJLliAmwK7BtYpAopsZSxbI2htNJtp159iMpQvXrFNlLTDB?=
 =?us-ascii?Q?+GFPPHvF3XNg/nOMG+ylw832dsweyE4Tt8ExGKYpmCseFMerbF/MTOeq9PAw?=
 =?us-ascii?Q?0o1qTQpORKADZRZQlCNXVsUQpD97kg2g0YT7TtNuDHa9yr7uCQh9Kortoeld?=
 =?us-ascii?Q?uGA3sAX1/jlAanImJcKWpNJJtF9jNNjnWYsxBa20+pwU2CVnTKSVrYGgUSms?=
 =?us-ascii?Q?Z5jovy/wbgoAnJ4rjO99CROglWReUnGibeRtK7zRgamzHNpnyUCDlArvT2hQ?=
 =?us-ascii?Q?a3Dt73KQAmtCx3a1YBktsU8IrU3ScQvx2A5oGZzO4gwuxv1IV3fLJfb+zpr4?=
 =?us-ascii?Q?pPWHJ+SjyuKlxJL9Tur3TTbTT60vIXDVd5URi1ss8fAHufXCj+6nyQo4t9Ko?=
 =?us-ascii?Q?fiRKYYA4Y+9SFgtsbQA5cIvxRJEg0Vnr1QTbeRzz4PfQdLIi4T6niUUPRVWK?=
 =?us-ascii?Q?FxJaVSY7gUwbvp4WKLWI18/R+KMOZrymfB0oa5DC8ZprQkQ+v20f0g15N1XS?=
 =?us-ascii?Q?h1H0Jthq6F4eoQlkRMufnYjXSYVIQ8CFrEPWYSZuIpxuebpeKeoxJroIhZqA?=
 =?us-ascii?Q?H2W5989XpPzFqGQeGT9hGH5REJUrbYQfzSZhoPKLblBQpR0fnKlnOMSNBS7N?=
 =?us-ascii?Q?u9jtwbIDGEC11PF00k10nk0V6zntm0Tb9Maa2fwlO9SFLWUXanzyz5V+/xTM?=
 =?us-ascii?Q?bzCZSbL6iSar0PTfEqVlTAezpxGphaSfWlTfHukEsFYw0jkdSoI+gef+dWD0?=
 =?us-ascii?Q?tuSSHNWa9jNA8Fl9cfb4DMSX+QIypNmGfmZMOGS6ki+A790Tk06s/9lnmN4T?=
 =?us-ascii?Q?hJjk4OCpFVTUabirIcyDR2PFfBwoeqAjCyGPn6Ppe5AGbhG7XPT7tvNC1INQ?=
 =?us-ascii?Q?r7JHVwpUL5ESDDAM+qL7kJvepM9EVEqdUNqyCJW2LrmgOI2nbHzVuHOV6pJq?=
 =?us-ascii?Q?rr452HDQGakmXLXu8tI+b7mqKnWiVYB4QJ08RNLZv6iDwKtle40TprwT6Rm+?=
 =?us-ascii?Q?QgwoZscQyhooZHRBLKCUOx98u40Q9mRkyw8DOhJdY8BmdVECm/HVtsTPvDvp?=
 =?us-ascii?Q?cmjd0CGFgzzBI+REwao2/A20YRBck3E2cx+SvQxqUKcTeaSHdZfnc3RNxGjY?=
 =?us-ascii?Q?N+avhoIKGHWAhna36zSkN9R2TebXiNW2eh3ovU1+4yPVVnwG2uRTYlyweGY+?=
 =?us-ascii?Q?6qslcU6sVHDFvphpDqRiFl0K3zVpWQ1R0owZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JxBlBRw6UwQO3ZvaogtIzaFPPxSg1Fp0G0nPSTVExYFv23IYPJC6phLy5DeL?=
 =?us-ascii?Q?jFmok69veYrdhOFzzH+/47yAjki9JO2h1dCFjPXb+21soB6LHufLR8JgBEFO?=
 =?us-ascii?Q?sdhTXXuoC8AkN4o5JB6VZM5AUk0VIya0sklgdMQwoXAa7SOqMutgYB4YaPlO?=
 =?us-ascii?Q?CSF+l/aQ5piVZR/CdECWsSqc1B8QqqxLEM+hrJ2lknqj39O656lnGw4e5p3S?=
 =?us-ascii?Q?OKt6TNMCn2YdnmLdbVYpAaBi8e5+acn9YmC+m35j9NV9pJ7sLPMrNP5OtvME?=
 =?us-ascii?Q?bDSNO2iPAUJuRBC8M9isDqcEus9rNFSU9M75XjeR53iUdEntDJb4Dk0Caq1T?=
 =?us-ascii?Q?AwhfWtcQ78y5KB5mHNyBPA6NIsCJ4k6gh+dV/ZiNw32o5BU3/e+AqFlyZxip?=
 =?us-ascii?Q?keaYFWFA3gd1BhI0S4WNpLBOEJ33248CDZIi06OrUAiUV10YOKNvKgd5+/im?=
 =?us-ascii?Q?RjyT1kF2dbB4aLXW2BgqrZHLjuRoCNQyeHr9CXlD4STfNXWj8uwCY09gi12D?=
 =?us-ascii?Q?U4ce+eAIw4gnaLFPcQ9wG7KHjd5Sm1VxwH1o5qXVorSdzGzYOD9arPdvaRXd?=
 =?us-ascii?Q?2iyQ8kL6i3dSU0GbSSLwofZ0XFdPkbq5XzzDvTblOyrCHhTYw4hlr33Q1z6u?=
 =?us-ascii?Q?kQ+tmX5s0HMIZ31tEWseTkom4jr2lSkI26839Vr29z3Td9N9zHX/qvvWH5YG?=
 =?us-ascii?Q?FaDuFJFmnxaETxg9EdhkOrNkNYnNYcJ+7QKqH3A+0y5jcXv8T0Ce/dTEOQWT?=
 =?us-ascii?Q?clVbrozpYNJZb3Z6xUx9cX8umWa2eomx0lYiGwScPDWjjJo+9PYq+kZk/PpG?=
 =?us-ascii?Q?K+jYpYDJ+EFi5ePxnSzwdqc0EPbXtzZHkWvqs3JmriXXyt61xqWl7bjRS2J8?=
 =?us-ascii?Q?JU7UcTz53kekSYrFmNyMGq9JaDmSSRNexXkyw6sviOAQAcezxSoNulhrjop+?=
 =?us-ascii?Q?v6yDNEmHvUP7Lbgsl/YpGpOopphzUJcZQyROtMsbuRbOI8RJEwSVME0XJtMy?=
 =?us-ascii?Q?JZbItXWlSpvdDVDR+lZZTGiB1l+sUnrdIzuiRozkW0+2uuslT/YlgWlddKP8?=
 =?us-ascii?Q?2bwqDqx4QCBE523V1haPCzbnbT4yuOUO+Jmc100W6Mzvf4Dku9IYMBZ3/XRa?=
 =?us-ascii?Q?STO4SIaSPWRNir92MGIyHEUmmeYr86sGxORjYB5vj/aBNtlwfP3JBxAcnDBf?=
 =?us-ascii?Q?yLz/iyYYtbXtgWLwp+0MJlH/yXNPGRyNzX8C4OzB7WnZibK9MhJempiX9zsa?=
 =?us-ascii?Q?jl3Hn77YPf6I/fUhgiRR1kc3jgRlHX+vSkwwVGJUdqn+lO4DVFWR5p5K0vUg?=
 =?us-ascii?Q?qRm34clpPkK2UuFoaktBTYuj+NCYftRHiWJ1QBCQ+zPO/ZUgiORTHBjG8WS3?=
 =?us-ascii?Q?qAEcYzcUp1pJFfRHcZA5TVlFqvAIx4CNZGEUR8uAzSrrbwk5FAqBm5xuQel7?=
 =?us-ascii?Q?4B0joAGss2Yt+4ySPl6ZgzrcubYXO9p11il6xKmwWRdIuieXJ/vXOuT+8JJ8?=
 =?us-ascii?Q?YP46cP5HUNhdg6vz8/OXA04Dy4vgsk0qzcyRO1Ih0mnIFBKYBPuUxcIyYgYj?=
 =?us-ascii?Q?eHVtbIta/Q513JzEOIpoeb0BvWA0JLvdbplzQngkZgl0Opj128nA5JgpRI2B?=
 =?us-ascii?Q?JBkXQMh9/NPts5+rG0lKZzIFA4veQlDuTyysqH3hMzaERSEZ6M2F0MhOujgX?=
 =?us-ascii?Q?M2HlnyJCU8wsRQDynyaL2EylL+WXwBfVVXZuTHEuUYZ1BbnBecGufT37gp+0?=
 =?us-ascii?Q?wrk7OJn5J9qlYNrvEO91ZieOUr7GjXrKTas/0CMfNvN9AOMTU70G?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6575790a-82ba-4130-6c0f-08de4f9a70a6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:16:27.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VN9bd3fca1ttQm4q3xJrT6GxsAK7/bq5wNTjA7dGxFdm1rvx0kAKwv8qArxO4Ri2tidt8XYGANNzD3GeW9HfRrHNGlaRnvq5xh3D0003Nt2IPjwdJ0x/TF+Ls+/cXBRP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14699

Hi Adrian,
Thanks for your comment.

On Fri, Jan 09, 2026 at 04:50:00PM +0200, Adrian Hunter wrote:
> On 07/01/2026 12:33, Tommaso Merciai wrote:
> > The Renesas I3C controller does not retain its register state across system
> > suspend, requiring the driver to explicitly save and restore hardware
> > configuration.
> > 
> > Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
> > 
> > During suspend, save the Device Address Table (DAT) entries, assert reset
> > lines, and disable all related clocks to allow the controller to enter a
> > low-power state.
> > 
> > On resume, re-enable clocks and reset lines in the proper order. Restore
> > the REFCKCTL register, master dynamic address, and all DAT entries, then
> > reinitialize the controller.
> > 
> > Store the REFCLK divider value, and the master dynamic address to restore
> > timing and addressing configuration after resume.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v4->v5:
> >  - Collected tag.
> > 
> > v3->v4:
> >  - Use clk_bulk_disable/enable() into renesas_i3c_suspend/resume_noirq()
> >    instead of clk_bulk_prepare_enable()/clk_bulk_disable_unprepare()
> > 
> > v2->v3:
> >  - Fixed error path into renesas_i3c_resume_noirq() and
> >    renesas_i3c_suspend_noirq() function.
> >  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.
> > 
> > v1->v2:
> >  - Updated commit as v1 has been split into smaller patches.
> >  - Use clock bulk API into renesas_i3c_suspend_noirq() and
> >    renesas_i3c_resume_noirq().
> > 
> >  drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> > 
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 008b6ee60e26..528bccc2c68e 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -256,16 +256,19 @@ struct renesas_i3c {
> >  	enum i3c_internal_state internal_state;
> >  	u16 maxdevs;
> >  	u32 free_pos;
> > +	u32 dyn_addr;
> >  	u32 i2c_STDBR;
> >  	u32 i3c_STDBR;
> >  	unsigned long rate;
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > +	u32 *DATBASn;
> >  	struct clk_bulk_data *clks;
> >  	struct reset_control *presetn;
> >  	struct reset_control *tresetn;
> >  	u8 num_clks;
> > +	u8 refclk_div;
> >  };
> >  
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  					   EXTBR_EBRHP(pp_high_ticks));
> >  
> >  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> > +	i3c->refclk_div = cks;
> >  
> >  	/* I3C hw init*/
> >  	renesas_i3c_hw_init(i3c);
> > @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	i3c->dyn_addr = ret;
> >  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> >  
> >  	memset(&info, 0, sizeof(info));
> > @@ -1363,6 +1368,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
> >  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
> >  
> > +	/* Allocate dynamic Device Address Table backup. */
> > +	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> > +				    GFP_KERNEL);
> > +	if (!i3c->DATBASn)
> > +		return -ENOMEM;
> > +
> >  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
> >  }
> >  
> > @@ -1373,6 +1384,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> >  	i3c_master_unregister(&i3c->base);
> >  }
> >  
> > +static int renesas_i3c_suspend_noirq(struct device *dev)
> > +{
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> > +
> > +	/* Store Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> > +
> > +	ret = reset_control_assert(i3c->presetn);
> > +	if (ret)
> > +		goto err_mark_resumed;
> > +
> > +	ret = reset_control_assert(i3c->tresetn);
> > +	if (ret)
> > +		goto err_presetn;
> > +
> > +	clk_bulk_disable(i3c->num_clks, i3c->clks);
> > +
> > +	return 0;
> > +
> > +err_presetn:
> > +	reset_control_deassert(i3c->presetn);
> > +err_mark_resumed:
> > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > +
> > +	return ret;
> > +}
> > +
> > +static int renesas_i3c_resume_noirq(struct device *dev)
> > +{
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	ret = reset_control_deassert(i3c->presetn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_deassert(i3c->tresetn);
> > +	if (ret)
> > +		goto err_presetn;
> > +
> > +	ret = clk_bulk_enable(i3c->num_clks, i3c->clks);
> > +	if (ret)
> > +		goto err_tresetn;
> > +
> > +	/* Re-store I3C registers value. */
> > +	renesas_writel(i3c->regs, REFCKCTL,
> > +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> > +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > +		       MSDVAD_MDYAD(i3c->dyn_addr));
> > +
> > +	/* Restore Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > +
> > +	/* I3C hw init. */
> > +	renesas_i3c_hw_init(i3c);
> > +
> > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > +
> > +	return 0;
> 
> Is it assumed I3C target devices do not lose their dynamic addresses
> during suspend?

Testing with the following setup:
NXP P3T1085UK-ARD connected to the RZ/G3E SMARC SoM
via the RZ/G3E SMARC breakout board.

The dynamic address is not lost during the suspend/resume cycle.

Kind Regards,
Tommaso

> 
> > +
> > +err_tresetn:
> > +	reset_control_assert(i3c->tresetn);
> > +err_presetn:
> > +	reset_control_assert(i3c->presetn);
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> > +				  renesas_i3c_resume_noirq)
> > +};
> > +
> >  static const struct of_device_id renesas_i3c_of_ids[] = {
> >  	{ .compatible = "renesas,r9a08g045-i3c" },
> >  	{ .compatible = "renesas,r9a09g047-i3c" },
> > @@ -1386,6 +1474,7 @@ static struct platform_driver renesas_i3c = {
> >  	.driver = {
> >  		.name = "renesas-i3c",
> >  		.of_match_table = renesas_i3c_of_ids,
> > +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
> >  	},
> >  };
> >  module_platform_driver(renesas_i3c);
> 

