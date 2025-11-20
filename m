Return-Path: <linux-renesas-soc+bounces-24888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2DC75270
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 16:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ECE03361E10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2FC376BEF;
	Thu, 20 Nov 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="bYupM6gz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636AB376BC7;
	Thu, 20 Nov 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653605; cv=none; b=NdwIFDnX2FejfDeOxs71vM9ZEYeAS8qPtOKPcGaQihBa21t5NmDwQATH244ixmKXD6VIWncZDEIolVhKQ+SMhPxWPfoFDJH0gZCpYJ0RHb/od8aQKYzDmzzSNq8erqME6ooSwaAHetmWeG8bo8bWsaPzi6sErzIUA7OCrmXn5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653605; c=relaxed/simple;
	bh=w7egqwPdkyRdAP9QQTS3eajdxLTnnPbZmLlB1b+bgCE=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=jG94DUEtGVg8bnJzDANZr6EQr+BB9Vpv/PgiMopLJ2AN9Ipw9u/PfS3VIPa2mmP3vM0R+XfageCnAWY3d2UsK6V+FXCHW9Fkh418AMZ35arY897ZbjSsE7rKIOgjoMlP7PJmdGfNNWBhVXDmoov+uWlY1mVEMaETekQP80jFIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=bYupM6gz; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=F5kUcCCA3MnU06v/xhs6ElwS8RfrplKyFjcTm1nO0v4=; b=bYupM6gzzW9+NphKdhGS+z+ZJw
	fK+dOqOh0/PKpHF0ridnKt3jZ0Tm8l6jEgiHLzstvWlyI9o/65BB5FAVm2ubMbR/j0gAPCnw02kwq
	rK84VhNVaWAhksu3+kZOyzWJO/fdZL5olY4xc2ob+Uy24+ZMeEAgSuXxKmyoDWr3sH8I=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:48600 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vM6rf-0005hZ-MY; Thu, 20 Nov 2025 10:46:34 -0500
Date: Thu, 20 Nov 2025 10:46:31 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-Id: <20251120104631.b60230d06055a2611ed67760@hugovil.com>
In-Reply-To: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
	<20251119022744.1599235-2-chris.brandt@renesas.com>
	<20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
	<CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.7 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Geert,

On Thu, 20 Nov 2025 16:18:49 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hugo,
> 
> On Thu, 20 Nov 2025 at 15:47, Hugo Villeneuve <hugo@hugovil.com> wrote:
> > On Tue, 18 Nov 2025 21:27:43 -0500
> > Chris Brandt <chris.brandt@renesas.com> wrote:
> > > Convert the limited MIPI clock calculations to a full range of settings
> > > based on math including H/W limitation validation.
> > > Since the required DSI division setting must be specified from external
> > > sources before calculations, expose a new API to set it.
> > >
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> > > --- a/include/linux/clk/renesas.h
> > > +++ b/include/linux/clk/renesas.h
> > > @@ -16,6 +16,11 @@ struct device;
> > >  struct device_node;
> > >  struct generic_pm_domain;
> > >
> > > +enum {
> > > +     PLL5_TARGET_DPI,
> > > +     PLL5_TARGET_DSI
> > > +};
> > > +
> > >  void cpg_mstp_add_clk_domain(struct device_node *np);
> > >  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
> > >  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> > > @@ -32,4 +37,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
> > >  #define cpg_mssr_attach_dev  NULL
> > >  #define cpg_mssr_detach_dev  NULL
> > >  #endif
> > > +
> > > +#ifdef CONFIG_CLK_RZG2L
> > > +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> > > +#else
> > > +static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
> >
> > Maybe use:
> >
> > #define rzg2l_cpg_dsi_div_set_divider(...) do { } while (0)
> 
> I assume you are saying this in the context of the kernel test robot's
> report?

Yes, but it was not to fix the warning.
The report simply made me realize it was an inline function, and I was
not sure if it was the right way to define an empty function/macro,
especially in a header file.

> Static inline functions offer more safety. Just s/u8/u8 divider/ should
> fix the W=1 issue.

Agreed.

Thank you for the infos.

-- 
Hugo Villeneuve

