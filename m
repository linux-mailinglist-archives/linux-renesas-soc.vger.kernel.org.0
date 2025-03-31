Return-Path: <linux-renesas-soc+bounces-15098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BEAA75D6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 02:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9221E3A75C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 00:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC5918D;
	Mon, 31 Mar 2025 00:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S9hJeBCF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4B2F29;
	Mon, 31 Mar 2025 00:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743379508; cv=fail; b=TrWxJGCvhIdU+oK3I4AGF+nVjYPlx/6j61AghdshEEG3CU+5UVRDNQL3URhGwwGvl1MO+xYSqNzOj5Z0hDxN8NsclTxStApbFaQqjt1YBZA4tFqom+HUBGQfqnq7ivu1wKwpnPghvk0GAVEKtuJ7AK8zjCHhWOJfkpI7/I2L3sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743379508; c=relaxed/simple;
	bh=kreHL7cK2nvQW/3RbgMytCrNb8nx0IRuVJBNZtGbtXw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cv+JPcxVWQeD10r7elilJ3NjDLwDM3CEbVlplt6+syy51ctOan1Ivma77bBPhPP9O4ZzizJPgWnZ/yFSdB3HU06fF/0/qyUkadco0s7oRe91+GQOqdGmUtL8Y0iWF5hqkuBb4UuC+/zslO1sZMRpRzTbFTApVRaZ7TufvDv7PvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S9hJeBCF; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7Bz7P6GXYD3WOJbZ/b/jVLHYNArF5/yoqeqQWw01o5hqFls+gWG0iAlmRM9tMJMEFgCuVqfWgZfu6hc6vDeBKvEDXCoItkjLsUtd/PuhSloR6sRKIE7Oke0sDKeQDxlrSBEa2bmCuGud0Rvcga+xaE1wScqi2XnXjyZh9AZogrSebLtVWo3ODh7zYitBwi5fSFHrzZENFQn9nf0TdmcRJ0pz3xh2Eb8TNpcfhvDCJvgXCt6R/+qAcvXGvpKB/mfV/uduC35s2brZyEHicSL5h4jQOuhtebMjIHOPzIl28mLQbIk6nz/irk4xN+hH914l9IUXabhGZ1ofCdYt+a5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGYCoHKKEAlOmm//ATibMQQZJIGH7ajp5UggB/AGFjI=;
 b=DnV4520Y5ICFTuSNpDFRUfi1A0PcwzveOA4U6F0SyiAR8O8h9urWTnflYE0TuS8LFLSdJk3zKoYZiVOIhktbMSsw2lROdc9LTXhLbRt6l9bOhg/CDeitrDS8M22t3//nNc0PmbALLBxCTQ7kBQP5A3rlpdhkXPbQW26LJx85GS4k93dHYgHUagJ9/9LND/BBTTALT4b6S6apSiLVooABeLhYFzD4LLyiVLlmjWUazaoqRMEXIaP9Zzf+sejP/Gv4iMVOM93LB0zNbvGvS1fyMVLcMMCULnjmcpOHQ/TL04gfPOIcoDtX/t9RDdA7iOnzVb2ASIqKngYfw2ybD32tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGYCoHKKEAlOmm//ATibMQQZJIGH7ajp5UggB/AGFjI=;
 b=S9hJeBCF17eUTb/SQ7huhDtVcmBtUUANEZ7ZocfeAeRO26eS0mdoM27L17mm383U00u+6z5u4+wllsio6HIrxRbCotXhtbeXcGU7s6AtBLXFxFQqqwT1Iz4yJQ56G/ZZYbMsvx+SCu5dQ3M8ogi2r1kk3TBVuKl9WxSagE/tepk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5629.jpnprd01.prod.outlook.com
 (2603:1096:400:44::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.36; Mon, 31 Mar
 2025 00:05:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 00:05:01 +0000
Message-ID: <875xjq12vr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] usb: renesas_usbhs: Reorder clock handling and power management in probe
In-Reply-To: <CA+V-a8uwJasrQZ+3Y1vgTKz+b_SBULXpXdGYxULUOpPkZgXjFg@mail.gmail.com>
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250327120737.230041-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<87zfh6yoly.wl-kuninori.morimoto.gx@renesas.com>
	<CA+V-a8uwJasrQZ+3Y1vgTKz+b_SBULXpXdGYxULUOpPkZgXjFg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Mar 2025 00:05:01 +0000
X-ClientProxiedBy: TYAPR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a68881-e301-4296-5426-08dd6fe7ae8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7DdIGVL+wQ+07JoDmK/0bgfHQS/QalfxIrOOjJbh/AmNjQd6gEFKdU/ufEO8?=
 =?us-ascii?Q?hLR3Xi+MSsrrjOiQVM492uvbpAfYRDNBlhERXl9OuHF78P45dlmobqgj5ZTv?=
 =?us-ascii?Q?w4UdJ8UgrjkuvIg3ugADSFn9t1McQhqNRNDAw461de81WfCJHwt/KXIAdKj8?=
 =?us-ascii?Q?WISndB1mdPO+Ah6JyArB3cO1TsrZjqOXXIlLyU5EIy22b2UQfCHV4iiMbzd/?=
 =?us-ascii?Q?73Eqs3vgDftk9F2w5PFmcz9CajnOvJr0M2gc1gHJml+9tfh8x7ZwqHoIbzrt?=
 =?us-ascii?Q?VRLjNCaeDukU3Du8yfPBoeH/DvOP7Gf0Irpn2cM2qn+t9eSqwAdP7m+MgMrN?=
 =?us-ascii?Q?35o7RiGAA37i09vfnZn4xbZasdeCQT9WaPHm1GaErI51OqLXlY073gHkFzhl?=
 =?us-ascii?Q?Tk+LIaiMPbSyCikn/Fif9LXWBxu/IMq7EMO7UZXQ99KsJ8eaYwgj+ESmBW94?=
 =?us-ascii?Q?3a5PsHrcnMkEtd0XmOuGzUnSs6N5f8uGFMlQ2wgrCAQfT+xXvNpatdLzVzJG?=
 =?us-ascii?Q?9p2fVGXKZrPIAYft8uhd4ZPIOW08+P4gFGfNIBObD2VUGQgtxIE0YRMp2lCm?=
 =?us-ascii?Q?JR5AaY7/DD9uOzuIw/irRd1SngV1dmIafd5MlLm33+R7cpDY3SrRAvCdwH1d?=
 =?us-ascii?Q?EmSvfXePzzgRZYx73Uz6PJmVlmNXhWrkx5P9COnScRuroiGEK47/Uk6DiU/5?=
 =?us-ascii?Q?+dq3R1ALpWSTOkox8PAGvsiWoalRBsgWu2zoDWU0DjgiF0cxpGzZqTIk7pjP?=
 =?us-ascii?Q?uQr34Kb/Vb3IqCu02hOqjf2samn38sYjh+vArPw6wfjUo1RQupNkpPLBgb/x?=
 =?us-ascii?Q?khGrtbFk0DKoKYwaxtLmClbcrBEiOeTt8FKnUlpj+X3XUOaRiz62TuAZ+9aB?=
 =?us-ascii?Q?L9Q5jCmOI/fbXHaSwNbNV92/AEr1y3bFiDp2a7qdQMu9JbsnZcKqDib88mSo?=
 =?us-ascii?Q?zpoNe5x5Kel0LvlhZiaTuj5+q+A4cqk/jghrEDWp8yfpcb0dxiIAyWBEZZjD?=
 =?us-ascii?Q?lqgRAGVJY+h/rk+xj7UjzsEfDwBEuK19KAFP0DR9JNZNUF4BDC/xe39XglfB?=
 =?us-ascii?Q?K4s43aGMM0Dnyxhw7Veza3P5/GxDii1Gol2asYaf6nQvSbQag7nz4ggrxfB+?=
 =?us-ascii?Q?LrTD28qqvPEOHe9kBI5NTpBxHdkSl2qnOy/myC2uEAFmUdnanv8G55QEOn25?=
 =?us-ascii?Q?LpE4Uu8B3gSB/dd+f3/HXaLat+XIQT6wpwXDRvOEcad3plSw3vEyFosWilZ1?=
 =?us-ascii?Q?RjqVwXE1DzHZAaIh9M1FRM4C+bbgTK6lVr2p4/hWWfZ4HhecBBz3iVpHltrc?=
 =?us-ascii?Q?zvbvwLXq82lStok/ILByyWV0KK8W3yX+gwxJ+7kz5Ez31QjAprC+d4hCDrfG?=
 =?us-ascii?Q?eYO7BpDOL8ltOmWIuogXOFv6n3nC5qTbaifgPWdxPPnTA32uiruqEUmpU/4u?=
 =?us-ascii?Q?m+uaL8HmGCskpmucSo8pQbuaH7urD33w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NlTlseV23B9IN6NBiFRlKWvx+hL3aiLojyoJOwkGPSWQC+89LobPDeHjjhuh?=
 =?us-ascii?Q?x5zZWt/ppT8qQusb5X8qg/mT7RwdNm8jmHElcRaEhdJIu1yTbp6+0rQtA6tH?=
 =?us-ascii?Q?jis2KhynQ3kzytVqCthh/49pmiAfYvEoPGATNnZgyxFCfKAkh+oIxhCmI8D1?=
 =?us-ascii?Q?wyS3tBl4vyaYE4Wj3hypCHkZLuHyglCQ4frjsiEBd5Lt3yIMCXXaW/Xn9ngF?=
 =?us-ascii?Q?gytamdAZwsCJjDFPvsF+5WGf6J2wrH6Ae1u++uE0uikX1lmdWH0Xoin1SRme?=
 =?us-ascii?Q?hXs+/yLu2NY6hjpJaGEl0AIENcWS5nPgJ8xrKa0N6KwjZ+1yppk4fljcXvLj?=
 =?us-ascii?Q?Jz+AvZJZTfJtFn4gTIoFfrL1LDfBml9yjygrHiPRqrjxzirWLx+YQOjGGRlM?=
 =?us-ascii?Q?Hr3qsIZde+RgXWFrizEz/Hhue6kLbQmtNPP5tBfvEFGbeD9ZRP2ch8UHPEOT?=
 =?us-ascii?Q?brhJtDZrJS329DMVS4Ltjop5/bVSWy649uqEEnQh1cmNkCcuH8nHFU2jPRZy?=
 =?us-ascii?Q?uqpugfFABJNI9IE0Y6+TMaIE+IzvhSNcujCHk582J31gNneCeBOimhVvqJlI?=
 =?us-ascii?Q?Oi8PL/dYbtXYzA+n5ikGB2FS44pFZE5gJZdrFRYcycMM94TXVAij02zgJOeb?=
 =?us-ascii?Q?EvUJh0xKfKr7woj09x6rZx6UvljUb2HcEtx9dWnymZr0V+/yfBBwFwSC24Rt?=
 =?us-ascii?Q?s04niUzX/FDQ3hN8u3dVBNEKfpxAju2PsPWRiuxsjHTqHeaTCMBCQB8V9nHs?=
 =?us-ascii?Q?fdh1Yp6rHGDN3L7u/TlaxX6EcxrJ6l6wGlgcvX+bOk5Sk8R6w+8bRnfaXALp?=
 =?us-ascii?Q?Cwo7Kj9jCITB+WocMzDNV/A+5CoYzZej7Ran91lAQjZgzeTS9icUEKW+hFtX?=
 =?us-ascii?Q?Sc33NTpJRIPlaPQHg4hzan8yBmvb7/p16ackG39u+Wuzthot0bvhTB/UG+ac?=
 =?us-ascii?Q?ucrXCQLurRJXLMdjlL0G/83naYREcPdCXLz0FJ9F9CdZIiqak69po1X/4B9f?=
 =?us-ascii?Q?U5fUMQ9JtVxhkWqdiTFdjpFIPtGIoEQt1FQ78+e/1MoAvH1Cc4f8WvMnBRue?=
 =?us-ascii?Q?Nho35ueAFj3migbrM1xC7jA8CskBBAYqaHVLjQ6kR78oSo1clzC9HXItc9em?=
 =?us-ascii?Q?PI2uNrC3KkhchaYdtZP7M5Gwy1rmxZTBZYcky7ArrVVhKFkVggDUD/fET0Zt?=
 =?us-ascii?Q?PcUNmKgJ1XtqdFUwD7I6pQUoFI3c8Z4H9ECXr8Bebgu402BvePM/ymB0M5r0?=
 =?us-ascii?Q?Jq0elMrA8rxCdrCFtQB51w3+dotE8ybot/WZdscoGtaLrrs8yuEhJXmGnosJ?=
 =?us-ascii?Q?l7XYaf0smSWXdWvonAMp+wMF7JhnKsQc8Th0YivfMVo3JcQSzA/f1jmCjBsE?=
 =?us-ascii?Q?+suVfOIXKP2grXnPwc/zdarUR3OHIF68XYenhx/hyVU8XRcblGWSKmOdxXH7?=
 =?us-ascii?Q?rwODzfzFf6FokERevauYdXQvIt3V7UE3nZrKPaGklZMH5vUMz/k6Do7A8sBT?=
 =?us-ascii?Q?P9B47/ZRj9NAAtcHJle1by+4K9DHLsAG5LBvoNVbnnIWCRINuHvxALL2SrZX?=
 =?us-ascii?Q?e6nF7eQw4OgXL6V6a94VhaQRABi72OYsyhOgR5z/+mtSXvU7NQySLIQbhMbO?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a68881-e301-4296-5426-08dd6fe7ae8b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 00:05:01.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnuQuGq0Or2eDYfBTsP4G3O8OqL3RwDtFvrK5GsR5NunzwxBypwdUvtskoXwP1FSoVbgaAb1RkeLTJ1GBzX1YBStm7oVn1pD3Z+/pvnke7mp0lOEqo9cOoQvkr6A4gGb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5629


Hi Lad, Prabhakar

> > >     usbhs_probe()
> > >         usbhs_sys_clock_ctrl()
> > >             usbhs_bset()
> > >                 usbhs_write()
> > >                     iowrite16()  <-- Register access before enabling clocks
> >
> > This patch itself is not so bad idea, but basically, we should not assume
> > the power/clock was enabled since kernel boot.
> > In this driver, register access happen only during power enable <->  power
> > disable (except your issue case), and this is good idea. So, the strange
> > is usbhs_sys_clock_ctrl() call in usbhs_probe() (without power enable) I
> > guess.
> >
> > According to the comment, it is just caring boot loader, and
> > usbhs_sys_clock_ctrl() itself will be called when usbhsc_power_ctrl() was
> > called anyway. And more, if my understanding was correct, Renesas clock
> > driver will stop all unused devices clock/power after boot.
> > So maybe we can just remove strange usbhs_sys_clock_ctrl() from usbhs_probe() ?
> >
> 
> After dropping usbhs_sys_clock_ctrl and removing the clock enabling
> done in this patch and with  `CONFIG_USB_G_SERIAL=y` I hit the same
> issue.

Ah...
OK, not only usbhs_sys_clock_ctrl(), but other initializer also
missing power in probe(). Thank you for reporting, your original patch
is reasonable.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

