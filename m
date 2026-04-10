Return-Path: <linux-renesas-soc+bounces-31114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED7NNNy62GmmhQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:54:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51A3D45C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D311301370C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 08:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF633AC0C5;
	Fri, 10 Apr 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LFykxjZw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B284039;
	Fri, 10 Apr 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811281; cv=fail; b=lMlxCeVaw6QPsAwAWqaZpfNkk5Ud/IFcbJ4KKni+VyblcQD8ufUxUB/k+nysGHuB4ozpQMdUbTPvSgWpzJFEOOi3pLpZRGTetea78ljXIysiLa4pdmw1+fgQR1huYrc8ep2sJ1JD5Pifihyl+BINCtNwFgclXACyx0TcW3Ey1Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811281; c=relaxed/simple;
	bh=9IMmRUzdHDQ5mMIdCySg/LHDTrGPLNH5/9191x7rZHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gTGN9OD+FAv3X8eKbrFkS9AlQaU/1lNixZMgV3kfM1xLu3MiMb0P4mLKNxhaR/KGMCqM3Rq7pkgdv2ZMlCfIOh3Au5Omc4wseIlEyaow2SnP8VIsmwgSCaIgO/TF28ouxMaM+iHjfz9dinWd86/clIxeqFUVCMhvWrpHiZ2+al0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LFykxjZw; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvxzXdD8P8lNDUb5Hg4WGwONTNfb1qxC0K9ZCc3RKjmWIMVMNIMucKmYLdQvaVl8XdMMVftPGLwZcy/XO0sZgWxtjR4MjK3E5FmIZnNJR6iJIhamFQZ624NkhneUpewTkn6DZyvKhEKp+nQc5PTn8Fa+PDY1AhgeNgvMSCyD/6ktSAARrcHyWsah17oiyOgXHONvaKJDRTCXdGiJaC26S/7Q7ORWfWNvktc46QtQcoAv34HPHuRnNtWWDYY7p+k/OM28aStIcbqPbS9JmHPPHPtIWPhDoujisSydtrn6nyT830oKZLGtXkglqwuI1Hs/+/3x09eysCnLNSDowTG/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+edu5NjAp5NjFBEDStcMfhMvqwe/mCgJ45H0w4+UmAU=;
 b=kjG96Ij+x3UcW6Xothl9lfryoaF9qzYHMq3et1BjOZKQ9SSuS+LNJkFaj2HJaXlfoOU4ICKh03csgxdWOSL5wHLkXEMD4GolglWo2GE9aTZU1vvuIsCqD6fE/8WrmMA80nQU1HvjEqg7AbMAL48joYUCVXWnqYh6Lx8/e9Hu6iiEbZoE+CxsTv5j/7qtIrEwjqkeB7PXrTw7VWYfomWUO/5s05E3KG1lZwhhlGAwVu/n9bIIno6kV7spVT2ErvBtxEW1qZ7QE6Ejr4WXiDp27KwcMDtVbNnJwhX+SbqRFB5vlyW1+7AgG2S0ENnkRccz9g3xHQBb1E96z3Is1A+GPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+edu5NjAp5NjFBEDStcMfhMvqwe/mCgJ45H0w4+UmAU=;
 b=LFykxjZwIQsK6gE0jGLPgaA3fDQt+orQSDa6AYTLBXYUVASHYcQi6w4q+qFClTBgnmKxfvAX0sy0VayUdKlMqy2mFIxIRq7QNKB3DIOlYWDjnV35bkvKfz6xcyZjl2m5Ahd/r4jlhNA/VJp01ZQ9awFODOECDgJv0Fczl1PzzcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB9951.jpnprd01.prod.outlook.com (2603:1096:400:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 08:54:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 08:54:36 +0000
Date: Fri, 10 Apr 2026 10:54:23 +0200
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
Message-ID: <adi6v-8b5-WG3pvR@tom-desktop>
References: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
 <20260330104450.128512-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330104450.128512-3-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB9951:EE_
X-MS-Office365-Filtering-Correlation-Id: fc94c2c6-8930-4671-ca44-08de96deca9a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OQH5oDyTTHsc6p2ub6d2CPZfbLTx+V5s3Ax+whyjibgcgPMf/oLV+qGlRZPd4eFFvlCDAPrayC7mImn318aXdDzAFBK9nVADZUT0PKr/621gSZa0o3sRMrzrUxlOUALBoLWNufFJE+YwnNxTk2KE6vvTu2PoI7o81flYkB9yBStK5vt/QT0VySEOvmTWodQI8hmwSM56aHSXxrmREL3cPG+yO8+kQcnxh2y2/z9jDmsvBuAy+sPGnggErz0NIcZl+9NyqzV9r9jGBXFYfwRVllX4n42jQLuSxIPQEDFdeQSY6ZwG1RjixGiHLltPwtL3EZ50gh7a0pF5se8Ui5Qrsbo9m8e/dGBn5NCp/6cbPd6DwiG0okivs9QRO7zHoOrXxo/BUCte25WvGFvSg56UOqXymA+wGfD1s8lZCaoQ4cwGZjFLcEid83evGnA5nZT9PYzwOlTlYYQtLnZki7xOC3Q4FNBHHThahaRj3vkjjYUnXe1cFpZa+Zm5qpXh2I3WnfEwpfW/GRgVJwCh+xzfSN4MP1fGxJVlFU/XXorPnsoBzUUC16JAoRHOsz4/JRKzLSpPmOcRF6wMO/5xU1dk60VSfOZYHMIjP746MyfYt36jRVTrzuTitc/MF4xzv/kM6NHeHp3FHBEGaS7f65AD+gjaLKHYrmSPemd+hQwzG6MxXr1bN9jYEpyPBrw20hpVldDetjGsv0v2tYFlvCvbrTut4GwC6g1t44iIGXg9MkpHmDg7u2AlSI6yuHJje5mN+oUP5n62TAb8THVGJed9Lo6ci4b/cpncVz8JwOQrTw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OP33R9ftE47QBWzvyOBS0wlMFOiBHf4RB8eMF0sLQj5yyzkIa+dLXfelivfR?=
 =?us-ascii?Q?JucTqSNTYYVhSqf0kgriaDqq5IVTEnZaGTFwcoebSkIOAiLR5SeD5FDIhf6U?=
 =?us-ascii?Q?15u0WKGDU0niatrGV04tySq0wAhiABLWBSD78iPF3nBbBXXsxU3jokIMCVtk?=
 =?us-ascii?Q?WpH7GcBL/HVIDaJDICbMXmxxUpo55s9KphuevBiU0WHuHncR7VXfLFbhJfrD?=
 =?us-ascii?Q?hsEsEdTOG+IQSJ+QhWMBN0W3N/bcQH+njuSfVjBWYd3K6mxzKeHfMoe+lvQ2?=
 =?us-ascii?Q?M+0TNaM9GormYZtY8gX5+gwnw4nOzEnP5p6eEvaiFD3PoO7C48N0/xNJM2nC?=
 =?us-ascii?Q?7iR5Ho/YDPRwT/PxzwK7CTDc/VKD2ASHzoLdltT6DV5Uk5PSLp/r8c8KmmX5?=
 =?us-ascii?Q?T0ri+p7fUf5+naaJ+CFE1jUYP+lDeCxqJ0sS8h+Eq5H0OluJy3vmleAY3sa6?=
 =?us-ascii?Q?V4qsGHLRMkmnQV9jlIX6BlzBWr5aqlEnMbm6rw8+A78S19Xr0BR/qvzpEtze?=
 =?us-ascii?Q?NKuubGRCISKRog0Npdvb/rdVzej/uhH8oy9+I5bXXWavr35j7kTYUg59pb/P?=
 =?us-ascii?Q?3mnaKp/xhxZ1K9fctyQKvsm1qEbloD7Q3/LqshyZ3WhIHP1RT/H3RCol2ok/?=
 =?us-ascii?Q?dGFfBcA7H/U3iL5XT7JZ62EFYeuHtN1IqSRJ5yGTB6JFhan3bVsAyYJzlnbg?=
 =?us-ascii?Q?DBAS2DmyFinJthBM3t5+iQQmfbJ3JB9XAiGKnjYmjF9luLDG1ePULmSTIg/k?=
 =?us-ascii?Q?yCdQbFAfCj5gxJSTHIjoQPzvOrRmop9NrlYSlX9cl5bnTojuXGCH8y3Pd48M?=
 =?us-ascii?Q?0+A42MUrwnjEkZl+08nYREBrtyt4mCLtwE82XMFhBJyFoB2QBCHAPebXSM8M?=
 =?us-ascii?Q?oGa6UWrMMdpUhssVEA2tonjxBKLd34jKhBE1iZ4a8z0mVre2zJkOy6KtTbpo?=
 =?us-ascii?Q?BFFT7gQYZXyUBNvPjmEu3MWYxc3f/XPRpZUxu8BqKE/JBsrRUua37AqV6crj?=
 =?us-ascii?Q?bASxiPPy5/x9t1Tn1qX+MPuWbYd8W06CLL+/ozIWw7V4mw/hHb6tt4dnKsu6?=
 =?us-ascii?Q?Ybg+uIbkvNmvjQ49JyTIF3tFciJVz8VjVMTkVXUoFM2RKl0iFHDEZ6f8BqvA?=
 =?us-ascii?Q?WTkQJvURDIAJlhlGS5OuIUxgGV3Ma7X8KheU9zUcLTzs6jIwMZEaCSD9mh+J?=
 =?us-ascii?Q?BBd7gNr/gZ4hP+Ewnw8NsRuwg7xCZCf5MLGeTLOe9ojHPH9w5gUrXC/DvBJ3?=
 =?us-ascii?Q?cTKm8BuWeMNDk3BXKSiIiZ5fdIonXEcQjsfbbHz9Hv61mPTdeAoMlfvE8meF?=
 =?us-ascii?Q?K5/MF/qbnMJbtQaQ2R8ALt4CwAxbZdHsLVL6GLJqCUdYbJTyyAsHY21yoL9w?=
 =?us-ascii?Q?Snp1vS10uZQeAg8m6MXJMlCSZa6rHwsh93CQcYw7By/py4ubYScNXmNUCmpP?=
 =?us-ascii?Q?syN7qiC9oVCObMg2RRSBowlmhFUykvtfEEqaAwBu74iiVj58LegOfv7WaApV?=
 =?us-ascii?Q?Z/C92AKQmvzgPXtJ06Qh9ZsYlLIqnA6NepurMyVz+ANuespleLy27N64mHS0?=
 =?us-ascii?Q?4oAoeSJpqrAJdYDnKjjeagCrSK+34OJbYElVGPDDbT7GUBmtN5t8nnx6dcpW?=
 =?us-ascii?Q?ljlveUof9kC909Hci0yszDVFw4j2iVPmjxEcL/A89lxglx323b39vsbm2U4d?=
 =?us-ascii?Q?AkvcUXcIe3fpo8Vf4vtO+8na4W6IwXEVTbxgCWuiIEnJ0NI2trRnWwIUgTzH?=
 =?us-ascii?Q?Bz6PuNI9AvXtlMiLUZAOOgYe25p3LirQLoCpDzb+ACypogOZnN+C?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc94c2c6-8930-4671-ca44-08de96deca9a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:54:36.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L95kxOU8sW/zVxr27MDLvXrUIgqX5lPX0Ceci/ce1Wu0Y3IBoZVW20ssEAqMoSa/6UYJ0CaVbVTVkmYCZgTGuLZpDfOlJ2r2zNo6qe0u8appFO+iV/+uOlJCKLbA0V1Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9951
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31114-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 8A51A3D45C6
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
> Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

LGTM.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso


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

