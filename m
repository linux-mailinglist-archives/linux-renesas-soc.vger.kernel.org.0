Return-Path: <linux-renesas-soc+bounces-30672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6m+fKCLUzGnnWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:15:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 399E237690A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7024E30514BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 08:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E7F38F939;
	Wed,  1 Apr 2026 08:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VTZ03DSH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392436164A;
	Wed,  1 Apr 2026 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775030717; cv=fail; b=BvcJniu8KRESW4K4k+EKOBEBJyXPMMzEitTu+jkn+yZDrvrA4RyXtmlMmSBN8/KM76uwM6YziZ6okQLkrU0b+c85Zv4gqaq5mhYvCLZZj8L0xEd3eCa1CgMAJdzV+MHYvyqkangkWt90tPJSAmS74J2qS3lW8VFGXyDOx0euRco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775030717; c=relaxed/simple;
	bh=JskkNTdCD5HMca9KyO/0WWjkNphA+/SvPoNfG7BKvNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MkOP4c/ESJ7ENVK+rkWIxPl7J1FSoVDTDeAZhKffk8JxzB9Sbgo0QU+v7mhhWwiRX23OOiHm1WwIfjXgnunWuUaiY+ZC3mdfOvJwxwqMHoFNQLGwTaEx7ixQZDitnU0aulp/yTpO9jfTpeilScU5aqmJ1R2cVCIF2oUVEoyFrqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VTZ03DSH; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLHPu+ptv69e0lnG52TufEv5l5k4VvDV9Jm5T6LEXuVFVcF0V1kiJ8Me2SZs0eGyimKlmSJ/X0cm9AQsNSaeUmJRA9dmzzHGvCQDPmY5YtHI3EsKOOr+6mUt3lXrzunZfY4B+N9bz/ZLxi6bGHpKwhlJWDc34jAVK/PJ+iGXY2hv5gp9h+CxkJscPTf7hqsetNlT90tUH2mW6QR/RWzfTP9S25Xx6rSExBjxECuUKz5Zg2cRCygmFAOQga93qEMjB8A18rOPfw3H1MvjpJN++UfXGNm96wnqNpPkejEOjZCVGc/iU4YAhHzeuKml7Ae2BVzTMyRmhOBIu0NawxsMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoGq3ZnPs1GuuPUi1t/SUaSM2YyKEq0B/yqf5CEFjiU=;
 b=xGFryCajtkhbcx2N3mad5k59/iGd0xMP1XfDP8anSjkrV8Cil2YcYgUwqI4ReqTlSHe68A3poVR2WQGXuSlkAvZ/j4yvLUaJRcxKjOd4S3H7eN0rBjiwDkbtwmj32ym/H+rWWWnnKYJVz4nGMPgGhQoepxqrHMugaw76aTfnfch91UvCbY0GRmN2lHAKfQblufiXsen14Yf1ax8k3hKId7yX0rbSkD/PGKbjiXstkFKQdltCPxe6b0EWmGPeploigLYKGUHsbU4KpIf+oDTwfJHrFnB0QNEezjdvmmOqzF8AZ8W/C4CV+KcTdQ30viUFRUMhlIkV+3q16q0bcJB8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoGq3ZnPs1GuuPUi1t/SUaSM2YyKEq0B/yqf5CEFjiU=;
 b=VTZ03DSHo5q4L/MyoS0q616GtsoYbClhuhkn6dmNCZrFr+sXExx717mLw/EwfsfzQ5jCkxGx4Dy2OlRuOvpYINmfdmWFiqw3lrHXDLgBpbbZSF/7a1V4TNMxWRa0HEabeRVF669B2sf7jg7/EddGr9E7xFLVYSCAXm/HDjU5M/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB14537.jpnprd01.prod.outlook.com (2603:1096:405:23b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 1 Apr
 2026 08:05:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 08:05:10 +0000
Date: Wed, 1 Apr 2026 10:04:51 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, peda@axentia.se,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/6] reset: rzv2h-usb2phy: Convert to regmap API
Message-ID: <aczRo8HVUFqXKfG_@tom-desktop>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
 <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
 <283a6336658045be8906ee219620c994e85c7fb8.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <283a6336658045be8906ee219620c994e85c7fb8.camel@pengutronix.de>
X-ClientProxiedBy: FR0P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB14537:EE_
X-MS-Office365-Filtering-Correlation-Id: 871be85e-6544-4136-7b23-08de8fc5652f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|7416014|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ozBXxhJrf3VnsdCPHHrIkV/htxZfxAWqdYUOh9A6z7/rTcnnyAFZN6t+9t4aTWWqNvnTu4yQ/oCZ9dn7ZAnC/I7JMisXJN/avhYBkHrvGaVvHBmXDPaiBw+yUZPlGweXKK0QmQcvUS9KRGIoaIF2mh7BFEn1VJdcFDaJNHJt8d0C92+mRHZRygrEUCUXz728OBqZ7x7hwCGUWj+UrnGuhRrdmzEhbrehbkWxgczMbXME2zHDxi9NujGqWYRqdeeQRgFtvvoIBbjjp1++c7h8RIcGyfj0uo+PoRa0jhF/jH/untXq7FsKyq/HlSdHweZtnwthU5o+5Flh/F7L2kUTMocv+QQNGREu0zwDTpJwiTT8eA39m8jCIJ81xVv3hIpZD75R405Akl//+xQZ6xAy7sXvX9Re11s+XlV3E794KN6oFDuGcx/rlqy2pcf1hf+YU+bRfV+i/25dYuy04Z1nLFYJotnyZ5kbvy1dKB/cwrwuK1CNf3w7eRaRTdKmiEg3DybBVu5DpePeyHIZ1yHgsHlqYnlemAfua0l6CpxrJuMIRDml866bJnlU/gEPbpboBv5Ajcx4eLXjt5g/z7bfM6Bmymqye+fAY+7kfsQUDeK2G6koDPbI4fSxTwHI7orATeCYrS7Mm7pM9j2PBtVRrlYJ1ZBsd/wxHonXD5mpLBA0QcP5QQa7W3wU0p0uk8PqgXWn+Sdz1dFe9+PU7w28HE1OwmlceGu+kNxPqjwi5ESU9xQtiIXBML7nsmPVDv+OpXNPinhW/KfGWpCm5ewn8xOTP5OqpugRCsQLD3Nfd8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(7416014)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0lUxIWjnOwU7YGSx2Ww3lRA/Y1qosU5XN6k0vRUPidlCW0WUZkeYK5F4uqaH?=
 =?us-ascii?Q?IYSELFwuICX5hIRP1bLiKsCr/Yg0Km8dZMvKNaQx9atg94SDy6yz/csZDjHt?=
 =?us-ascii?Q?ALFXZ+x+rFwHf7B99w005feUVPgWGOyB28FiJ6pnMGOJ0nFrA/+pyLKaJBQb?=
 =?us-ascii?Q?ToCgDZVt2UWt6IqQrwE5Bs2JEezvx41KaKX+i+unX9mCGIyFbLmBcU6+XfA9?=
 =?us-ascii?Q?HfUmAVEeD4Tw0R4t7dQvUw1UZKLRixqhWzQGFqJ7BY9yCAGKwUoxh3GkclJV?=
 =?us-ascii?Q?2v5pnhOJegmI/FtqKBWE4KXPWbmW1os1s8fwLatKbH/pERrgVfTHWN8hr7yV?=
 =?us-ascii?Q?n7ovbQ+81/JrWntGq9oznd3lEboxqNs4OKeAFzxWkbkol1WN1hRSNhHVr1Jw?=
 =?us-ascii?Q?dODMSmOksOzf8We3El3PGas/LXGqZGrHW+1Kj1OS+G2kCzDaiEZn4hx5dqBP?=
 =?us-ascii?Q?8OwmMMKPbHAvBuQBqJQYXRPEar2eh3cYRqmlT1ZJsq+APEq2nNr1da9whkdj?=
 =?us-ascii?Q?1DONDpUJAVDfiq/3BMYEHUG0G9poG/Tx408Q2n3doqnB1JTh47TmPxTS58zE?=
 =?us-ascii?Q?M1R4LZcNFT1I7O7uT340YfVm/T0WSRRCoxmuvDK9c7btBtoAX41FBjbufd5/?=
 =?us-ascii?Q?lcDgfS122dPJdBkuKeRQw1NUkhLoG71v+jSU6SwVez4pM93d6XxqZn+vQMEC?=
 =?us-ascii?Q?M8Nh/dwKzw5UVqS4A0pyShh0Wp//5OuITpUqmD60aRf+jU3nHkjC+X2McW5j?=
 =?us-ascii?Q?IJA0yTBTpZRo+xNwIanYiS4eZZkSdESNZvgqIMlPIKZLz+z9su+BjnCroCgr?=
 =?us-ascii?Q?kmgxKMyItECGFwqkO6FBrTpMzk/bkYA6I5dVU38bTN40cpcTXqleBUXhOCIy?=
 =?us-ascii?Q?tve0LUzhvXl7HdUqKSwXlskF4sK9hqygITzenR3d31Vs0zX0qCtQX9pXovGU?=
 =?us-ascii?Q?wSeDobi2qBl53e/IJtE2/leF6SBCr/6Hi2K2JlmBQa8cQcS9LBl+3+irAy5a?=
 =?us-ascii?Q?EBZAff1VQ5wgWrZf81jn2SqDx2qNn5kxS32p97CFp58XH5fPKwlSREs7QqmS?=
 =?us-ascii?Q?AQX+82uldlc4DZCiNA7HrH90d4GNrf+NkCgIaN1o20nI0Ln/57qnBiIETGj2?=
 =?us-ascii?Q?mioDq+Iu05thn4GqUH/I0/gkJWN9ZTHkXTiQHF873WZpSEem5+sIBkjGszDN?=
 =?us-ascii?Q?WqugDIYd4NqouTPYxvtRpH115YLcZX8wYoU54ykoOuu1qky/9E4JBf70LPiu?=
 =?us-ascii?Q?DWGROGrMqHt0SMpP4eyewPEjOLbZgRBv9fHTV7R3hCA1A8EykPjZy62q7avu?=
 =?us-ascii?Q?l2jATTmrYp9Kf89VJTBHr/Ln1ExMTaSuqYrIxfQ7Lk2Lf4lh5EKerA0QpeNm?=
 =?us-ascii?Q?y6WWFJBliHZ12iw07cdUEoRKSPUc8CiCxV1cAi/3x8Fm0vJv34lrJmCEc6+d?=
 =?us-ascii?Q?qIo4Mb0uJtgn/zagbNEweqsOtrZK9lLtRR5KliOSi9VRgMubq5SjnuOMQpD+?=
 =?us-ascii?Q?BPg4/qE+7T/tI7iOiocdVmt1RCM2dzSKQVyKRy08tLpZgiXUKRmVr/cZQ8yv?=
 =?us-ascii?Q?XvqHAQoONYDagFRWte4FC/1Ma6UcDyRVYiG71Fe9JLmBsqDKodhqWhWbePdr?=
 =?us-ascii?Q?Kw2OTBgRWl+j0ztB7+WtCCXrac/f++QPJY9aXLeDhfjThjrTDZe7kj2J4YhT?=
 =?us-ascii?Q?n1w3bp4GuL9gT0DyU8OUJGNsQOlsx3N6X17u/s2U8cOP5AKw1Anb4ld0Azgg?=
 =?us-ascii?Q?GzvYXIIBrHbLcQIPECuqmlpwN9iAkhoB+lmTgVw6/a666osOm6/u?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 871be85e-6544-4136-7b23-08de8fc5652f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 08:05:10.5688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8Qp7QnEXg+BUhyIumgjtS/QZM20mJSnBq7SVbKv6IwjMSbYtFoZJHu5hfCQrfk/b0xbV7XVR3r4UM9UiTaD4iU+GYFLAeNUtGOIEvhEGiL69qmNQhOnpv3sJrsYxFow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14537
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30672-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linuxfoundation.org,solid-run.com,linaro.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 399E237690A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Philipp,
Thanks for your review.

On Tue, Mar 31, 2026 at 06:36:45PM +0200, Philipp Zabel wrote:
> On Fr, 2026-03-27 at 19:08 +0100, Tommaso Merciai wrote:
> > Replace raw MMIO accesses (void __iomem *, readl/writel) with
> > regmap_read/regmap_write via devm_regmap_init_mmio(). Regmap
> > provides its own internal locking, so the manual spinlock and
> > scoped_guard() wrappers are no longer needed.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v8->v9:
> >  - New patch
> > 
> >  drivers/reset/Kconfig               |  1 +
> >  drivers/reset/reset-rzv2h-usb2phy.c | 42 ++++++++++++++++-------------
> >  2 files changed, 24 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 5165006be693..c539ca88518f 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
> >  config RESET_RZV2H_USB2PHY
> >  	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
> >  	depends on ARCH_RENESAS || COMPILE_TEST
> > +	select REGMAP_MMIO
> >  	help
> >  	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
> >  	  (and similar SoCs).
> > diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
> > index 5bdd39274612..4014eff0f017 100644
> > --- a/drivers/reset/reset-rzv2h-usb2phy.c
> > +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> > @@ -5,13 +5,13 @@
> >   * Copyright (C) 2025 Renesas Electronics Corporation
> >   */
> >  
> > -#include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >  #include <linux/reset.h>
> >  #include <linux/reset-controller.h>
> >  
> > @@ -37,10 +37,9 @@ struct rzv2h_usb2phy_reset_of_data {
> >  
> >  struct rzv2h_usb2phy_reset_priv {
> >  	const struct rzv2h_usb2phy_reset_of_data *data;
> > -	void __iomem *base;
> > +	struct regmap *regmap;
> >  	struct device *dev;
> >  	struct reset_controller_dev rcdev;
> > -	spinlock_t lock; /* protects register accesses */
> >  };
> >  
> >  static inline struct rzv2h_usb2phy_reset_priv
> > @@ -55,10 +54,8 @@ static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
> >  	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
> >  	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
> >  
> > -	scoped_guard(spinlock, &priv->lock) {
> > -		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
> > -		writel(data->reset_assert_val, priv->base + data->reset_reg);
> > -	}
> > +	regmap_write(priv->regmap, data->reset2_reg, data->reset2_acquire_val);
> > +	regmap_write(priv->regmap, data->reset_reg, data->reset_assert_val);
> 
> What is the spinlock protecting? acquire/assert registers being set
> together, without another acquire/assert or deassert/release register
> access pair interleaving?
> In that case you still need the lock. Or use regmap_multi_reg_write().
> You could even directly store the sequences as struct reg_sequence in
> rzv2h_usb2phy_reset_of_data.

You are correct. Thank you.
As per your suggestion I'm planning to use regmap_multi_reg_write().

Plan is to have the:

static const struct reg_sequence rzv2h_init_seqs[] = {
	{ .reg = 0xc10, .def = 0x67c },
	{ .reg = 0xc14, .def = 0x1f },
	{ .reg = 0x600, .def = 0x909 },
};

static const struct reg_sequence rzv2h_assert_seqs[] = {
	{ .reg = 0xb04, .def = 0x303 },
	{ .reg = 0x000, .def = 0x206 },
};

static const struct reg_sequence rzv2h_deassert_seqs[] = {
	{ .reg = 0x000, .def = 0x200 },
	{ .reg = 0xb04, .def = 0x003 },
	{ .reg = 0x000, .def = 0x000 },
};

static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data = {
	.init_seqs = rzv2h_init_seqs,
	.init_nseqs = ARRAY_SIZE(rzv2h_init_seqs),
	.assert_seqs = rzv2h_assert_seqs,
	.assert_nseqs = ARRAY_SIZE(rzv2h_assert_seqs),
	.deassert_seqs = rzv2h_deassert_seqs,
	.deassert_nseqs = ARRAY_SIZE(rzv2h_deassert_seqs),
	.reset_reg = 0,
	.reset_status_bits = BIT(2),
};

With that I can use:

static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
				     unsigned long id)
{
	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
	int ret;

	ret = regmap_multi_reg_write(priv->regmap, data->assert_seqs,
				     data->assert_nseqs);
	if (ret)
		return ret;

	usleep_range(11, 20);

	return 0;
}

static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
				       unsigned long id)
{
	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);

	return regmap_multi_reg_write(priv->regmap, priv->data->deassert_seqs,
				      priv->data->deassert_nseqs);
}



> 
> >  	usleep_range(11, 20);
> >  
> > @@ -71,11 +68,9 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
> >  	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
> >  	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
> >  
> > -	scoped_guard(spinlock, &priv->lock) {
> > -		writel(data->reset_deassert_val, priv->base + data->reset_reg);
> > -		writel(data->reset2_release_val, priv->base + data->reset2_reg);
> > -		writel(data->reset_release_val, priv->base + data->reset_reg);
> > -	}
> > +	regmap_write(priv->regmap, data->reset_reg, data->reset_deassert_val);
> > +	regmap_write(priv->regmap, data->reset2_reg, data->reset2_release_val);
> > +	regmap_write(priv->regmap, data->reset_reg, data->reset_release_val);
> 
> Same as above.

	return regmap_multi_reg_write(priv->regmap, priv->data->deassert_seqs,
                                      priv->data->deassert_nseqs);
> 
> [...]
> 
> > @@ -149,7 +153,7 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
> >  		return dev_err_probe(dev, error, "unable to register cleanup action\n");
> >  
> >  	for (unsigned int i = 0; i < data->init_val_count; i++)
> > -		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> > +		regmap_write(priv->regmap, data->init_vals[i].reg, data->init_vals[i].val);
> 
> Not required for locking, but this could use regmap_multi_reg_write()
> as well.
>

And here we can use:

	error = regmap_multi_reg_write(priv->regmap, data->init_seqs, data->init_nseqs);
	if (error)
		return dev_err_probe(dev, error, "failed to initialize PHY registers\n");

Will send new version hope later today.
Thanks again for the hint!

Kind Regards,
Tommaso


> regards
> Philipp

