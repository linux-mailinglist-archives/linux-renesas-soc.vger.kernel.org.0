Return-Path: <linux-renesas-soc+bounces-28681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CUQCMVtpmkaPwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 06:12:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E30F1E9223
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 06:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86B503053082
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 05:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FECD201278;
	Tue,  3 Mar 2026 05:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="bK4kYtko"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020124.outbound.protection.outlook.com [52.101.229.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8B826D4F9;
	Tue,  3 Mar 2026 05:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772514732; cv=fail; b=Pst8Efbln0bFVktiwKYyMyRzj8xA5/ft6hh2YJeSZ2o/GcNM+hvc+UTpcRmukEFGIq3Zcd1fZL7eEFnbwhjeEuKCSP2cbQwRXJt7mg6MVmad8yRZQTzjNDP/0HI7x6lte8yNc8FC2vhtWIuDWtX3LOIrAnWsIsmeID7C7WtXMZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772514732; c=relaxed/simple;
	bh=W1JzMkHpvNTsEJNdt5M79PJs4uAPjxn+lTGJ1tpWVfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CyaolIzMCz9y5RUADMTwpM+eNHcI4kr1RQZqv9846k8eZSqJSXvPrE8U2FhqxJL3qlBAbKzlKgiYzJehDzHHAN7SzBIYAh9SB7X6aQZCY2k071PEQilqcrSFZypWCKT5vm4XBslPrT6lFoy6mlidpn90bcXU4TFHlYOLZ1HUBLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=bK4kYtko; arc=fail smtp.client-ip=52.101.229.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFjr3gPg6IIl+XmjTHqM0UQ3IZtEViWOvuxPX2cQlE0QHQ30SlkEP1UkO8kzqwrseXxtmUFtMaJftwBLZO/faVreQ2Jnef85M/+pNmgaVW6juHXF2Ak8ApczUanXO/YmkVoKCrv7hJYVW5cxBUVg1zWY1ucF1hLvmFVvyVtBKtHG4PZSdIt8okZwk4PvDAJ99vzJK5BINFfN29FOheLzepjK9N91fUaTgPWm53Q68Pn9FBNZQ+yn/w1qrdUI/oLkC4BAAHRyYNdcToogCrwldVpvhIyFNU4Yt7Gf/AplxpD2xTUgbojedctRZni7TX9UsWXkzOtsJcIFcxTzVMIjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf5v5GN0WURnZWuddxeGz68djR0/ekeUPD0tXrmpllA=;
 b=cZ5pLZNpNcPgr/ZmFGcH/7XNrqF7ZGkWtMGn6rYT8MbednIaRwnh88iNsw+ZhkSBfbBCR9MK87t+dzA4+55l/6N83XBnX5q//ViTT+M2+d1NB0rXr6wTrGSrhgzrR8MKoJVeebgmmVwT9PfsJgF8CLfY/DhzKMh9SiZofMxJlHRdB1KxQ2SSAIBbOHNJmqIrTOpfSDgPYAwB5RG30Mddd+IqsrqWIhnkD3CzamSj1X39yDGtWZsBD9beKyKk+co0dSjnUQjVQQrUI8C6hoOpLTY08MCbb20PlzldVYjZtsO4xbZIeKMtA7YQF+KItUcpPyR5TJ3bPL6xQv2KrHD14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf5v5GN0WURnZWuddxeGz68djR0/ekeUPD0tXrmpllA=;
 b=bK4kYtko25fXvzzcCAEQOs2jTlgEAWVbdD14GNP7Ex3NvoMIMZd0vvAlXxAW+DoOgdZHgBpiTD3rVNg2dcJaGYHBiA4fkjYiY187DGf1XxAQAzwRJiwefJTDjTbmh89OyktL2OX5hsDBzPli1Z+FZLmuTyE1jj/iaKZfaFjHleM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:468::22)
 by TY4P286MB6767.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:342::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 05:12:07 +0000
Received: from OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71]) by OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 ([fe80::b7ab:6af2:d18e:4a71%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 05:12:06 +0000
Date: Tue, 3 Mar 2026 14:12:05 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, geert+renesas@glider.be, magnus.damm@gmail.com, 
	cassel@kernel.org, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as
 Resizable BARs
Message-ID: <ns62mpoyrskr5q3uoy7gfjzideede2xqpixsllwhc3ozkz4us3@ltdzzshbgxla>
References: <20260210160315.2272930-1-den@valinux.co.jp>
 <20260302223150.GA4022590@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302223150.GA4022590@bhelgaas>
X-ClientProxiedBy: TYCP286CA0145.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::9) To OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:468::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOP286MB7730:EE_|TY4P286MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff8cadd-9fd9-4aad-37eb-08de78e36a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info:
	U86ZkTGs5qXrK1qTPMq2OixoGTvzVLhdhSOEDf4SrV35kAQp0Y5e7cz1+q0jtsemczUKqdpoDHSLc7MpzwxQFdt0CxWjVO3Jtd47hV8kLIkaXIZIaWVsr/LdNyYDvZG1JmePTBPPEdBJercoeA942HRgNFlab35FvU5zFB3pSezn1W2xh2sH04AU0espfcPU0ZnZ/1WHwWdE6I9sk0GUbQ5rCeLHU1eIFC0c5DWKtHFkptStTYhTHuz68d7iKKe+pLub5Rd3sv/nk8QQ0NPIm2fMDBhzbrJfYKRgnkJSVRUe2ItUb0/su/7PDXdW94ZqkfpL9DLeldk5HQTUUCbbLkyyxPWdlpD42NfvU560h8FsJ6FCydtSQcbr8BmwZMNi9MBZjUnUdBsjP+4g9+w/KhV2JEAGsewHP7xMeEGjhg4yozrttxcv0zzfb9l4KrfFC2UPAWAxdGIbFYy1hD6uXO/EMsZw/0d5OfTWUdrkBDC8fY7aTplkbZ0VT0lGV3RY/R5AomEicsiP7MMnDVS3Yry9AYidUl7HcZqrBjsrcmy7J8DiTk+4LeGm6R9fJHZLmu66nUO4ZB0oZLFMUevw4qvGGsFGE7Yco6VgRrYN8fg77yITvcVdQ96uM121jFSC9YkDTRkLmFJUEZH5xLWW7tJawup51h1wVMOyo4YpA3+9geUv6+K7ClVWgl6jdDOpbd7wYkwmQbUB5oXMbSDF+NrSODjxfInS7i7iRrAP/TGTHZ493okb14JTNkVvKF//Y2KxWjlErIvDf8c5Pu287BKOTuhAp57SnYeQt/lYG8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(27256017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XogV5TO9qdox1CougMk5A7vjK+B13XjNPCEXGMoHDYQ91YXlhxjmIcOTyKRM?=
 =?us-ascii?Q?Uk4m5tOdEwLjRMBE68tInsuRFCtclmCgWQwTqOFeyDwm2614FIP8gRSPc+Xc?=
 =?us-ascii?Q?T7lod0IsaaXRBuqbmxPL8cioOS8IZxvY5JN2VEiW+deTLFjrnbceCPe+b7Kf?=
 =?us-ascii?Q?WBNF2kGNhYeMNu4IhFh3ncaSBqxO8c1UVjYpdPQadTybKILjAnnIjidYnlhx?=
 =?us-ascii?Q?QhaEeRix9diHD0blrrDgmE4djayNHD1qFTHC5h3M8ZXP2t7iNzAy0cjMBG0W?=
 =?us-ascii?Q?W0Y9jrGyxsPjLbf0LulILl7lYmGZ3ESu1jA/cEm05GhYFGG6bEvDc8c32d4u?=
 =?us-ascii?Q?Q0ZUkxvw5f9kfarSkTCszsg/IW1igqAnMyQnBeWSBOnKKi7t3iUGGtJR61Ci?=
 =?us-ascii?Q?0CkugyFBRyEmdXC6ajayw8k6ZzbFgcogAlK5YkE7Qa9TmNi1d6gtzVWqdeOy?=
 =?us-ascii?Q?Ct4DSWsFvJAB8nRpLpC2qrgqYYOe3G1zqHfFDcxNEXz1nkLrSb7R6dZzSRFh?=
 =?us-ascii?Q?MS/kOxyMmnQvjc8Pwt0BiRcG//e42rGuNPuhoa4CgeuwjKJCekHSr3cWKvq/?=
 =?us-ascii?Q?RvdvFWTbl7a2GiiOUbGxAh4RkuG/oF07wt6PBQLnO7x4whd9/weZy1fw7AiK?=
 =?us-ascii?Q?oDqNj6XSQgYrFPl6NJqFfOXuPu/kuF5YtAGcjSNnhyjdpos4N1ABL9ekgZDv?=
 =?us-ascii?Q?1xgyx1g7tuS0Phlaz1FCUqUBiHFuPRh3tB4nt8vbqRg+YaJx1o/reSryKh8d?=
 =?us-ascii?Q?a6/GTOxxo71+UTtAHeqWJJAcLIRQWHS7hBRPxf06WjemKRTK/tQ4xD2dZsRp?=
 =?us-ascii?Q?f4cNXpekwZScIUX3Gmm32TUqiYhrs5WNxGlsNVQVPwfNqltree2s8x7BNy81?=
 =?us-ascii?Q?N6mRb6IxKHWYypRS7lcrSHQwwH7BaqkF9QEYy8qdWradNrYk1aDyMBcBRBJ2?=
 =?us-ascii?Q?O/IhImZwX/aO84z9w6OjNyWJdRQ/NZO4xhj5kgGga5DSk0zLUumfZEJ4au0m?=
 =?us-ascii?Q?k1xGxsKhN+ottNWHHuwG9sSxMbpuyRwE5R8ioLZrdMy71DrUjvsFQjQdSIi5?=
 =?us-ascii?Q?nb8zwb4IVM0SkwBY2uNVkgn2PpXrooxgrEOHWvSWnQr2SMZBOdhqbaWumZdn?=
 =?us-ascii?Q?iwQIvm/TK/8u3PsOMVcx4zZgjSBBb5jXjiybgz1BvEmXfBHoFUq/3SHfJ5jE?=
 =?us-ascii?Q?NcoR9sAjIJ/HOE1suzo8G6UeunZArrCPO8MHzgnWvolY9rLwk/0vSjHdrMbU?=
 =?us-ascii?Q?w+3rYzyUkTNmfmlp35OgNqoMUwQXrvEUC3R71SkqLyEF2r4M+dTYSWsxAU0m?=
 =?us-ascii?Q?wRv3TE/XwEwRot9OPW6VfPmRdHA3WEyB76Z6g0jwTi0CGHrtpdRgpqfViUVR?=
 =?us-ascii?Q?JpsvGIdf0De88Rxq5+fQOW+ezUdM+fhiW/yBGl5w4PqKH3xCfMrkdv0bU3wd?=
 =?us-ascii?Q?Vl1Zix5fxIluoloFp4N70fuOpeHFh9S8WdBoIrRIeImuZK97QxHEnDlKhk7b?=
 =?us-ascii?Q?V2q3X3C3AjUIxHCsjk+pULlDkdyx0C5VDkTkidjOmNWPmwd7J7X+qtaL/Kor?=
 =?us-ascii?Q?tRAQR6QmAFXtd4IRWOSkaZ6ZFsquQidfjKA+bfQ5Sa5LSonPTo8/lmjOZLwN?=
 =?us-ascii?Q?DKvqwljbciVevchMxMUHtbEodwLK5/RSKrJCyjg8MmvBJGZ908XZyOuXlEBH?=
 =?us-ascii?Q?/I7a6Ggci5Ki1X4Exq4ud9W0FG5An0qvvp7P9BTbVMs5GDS7nwCLzFKiPt46?=
 =?us-ascii?Q?UN0hcxkow1R3J98QLzLoFi/DlUqTTu1D6/PcWudKGA1cxy+uZhr+?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff8cadd-9fd9-4aad-37eb-08de78e36a13
X-MS-Exchange-CrossTenant-AuthSource: OSOP286MB7730.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 05:12:06.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pEfND7ODbkyiJaRVQsR64IR2uvmraPWfQdoU0JPNBdo8IyqD7iKRB7LUwomZDjy1U8dgdBjnTeY7H0TGVcJGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6767
X-Rspamd-Queue-Id: 6E30F1E9223
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28681-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,vger.kernel.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,valinux.co.jp:dkim,valinux.co.jp:email]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:31:50PM -0600, Bjorn Helgaas wrote:
> On Wed, Feb 11, 2026 at 01:03:15AM +0900, Koichiro Den wrote:
> > R-Car Gen4 (S4) implements the PCIe Resizable BAR capability for BAR0 and
> > BAR2. Advertise them as BAR_RESIZABLE so EPF-requested BAR sizes are
> > reflected to the host.
> > 
> > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> > Changes since v1:
> >   - Reword commit message only, no code changes.
> >   - Rebased onto pci/controller/dwc as of 2026-02-11
> > 
> > v1: https://lore.kernel.org/linux-pci/20251023072217.901888-1-den@valinux.co.jp
> > 
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > index a6912e85e4dd..3d4a889e38cc 100644
> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -422,7 +422,9 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> >  	DWC_EPC_COMMON_FEATURES,
> >  	.msi_capable = true,
> > +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
> >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> 
> I guess the "Resizable" property is not something that is discoverable
> at runtime?
> 
> You mention the Resizable BAR Capability, so I wondered if the driver
> could use that to figure this out.

As I understand it, it should be discoverable on DesignWare EPC, since a BAR
configured with a resizable sizing scheme results in a corresponding Resizable
BAR capabilioty/control pair, and the BAR index is there.

> 
>  * @BAR_RESIZABLE: The BAR implements the PCI-SIG Resizable BAR Capability.
>  *                 NOTE: An EPC driver can currently only set a single supported
>  *                 size.
> 
> Is this comment about the single supported size still accurate?

Yes, I believe so. The comment still seems to reflect the current
implementation.

Niklas, please feel free to correct me here if I'm missing something.

Best regards,
Koichiro

> 
> >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> >  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> >  	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > -- 
> > 2.51.0
> > 

