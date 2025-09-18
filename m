Return-Path: <linux-renesas-soc+bounces-22041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CAB85A80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 17:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 597E47B6314
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 15:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4634D31282B;
	Thu, 18 Sep 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="vOB2VMKe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B8312830;
	Thu, 18 Sep 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209709; cv=none; b=H+rg3bNuWAX1MFTwL0kFyYb7s+65knS5kHj2RyoWuHYKLCswXspfbwlNU4gaVlzXbGXrjcYjmKvKL9atXX3stvqvNJzxPMUggFyr28nbYlkiKSeouvh4LsrRcbIgLH+gxPqpb8E+DC9QGbmowxQw9ho+5S4KZFyw0JJzNkfNMU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209709; c=relaxed/simple;
	bh=NztaOUsSCnDXOzioZ98y9HEmzoTvXBnvEUxhKkPC9RI=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=kyH6LBSiDRTJcWS5msXVe9ztC/tMnmCa0wcZs7x2gVlsLmUyw5mqfKU8T0xUT8FwzKlEmcl+vmyYfcEvR58Revh95m10bpg1srN+1lYEvCAVjxIygQm5VPpByhMJyH7tF+0/I4kp6Q0Gt3Z4LNoEcpJamvLdDT2ne8DggBCtmsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=vOB2VMKe; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=ktV39ZW891V7Z77BCOOj+b74VuWUKu/l31kKWMEBxlg=; b=vOB2VMKees5K/QqAbrhyk+sYbE
	UMAhvmeFX7FnsTo2TrjTUStadkx9yxEVBhirMGT6AmNFS5cnHYNF5rp20RxqykorQpk0PJPY2l1Fi
	SBBLMrF72znIqFijKvC5fUPRhnhr+4mXaNEFbsIEbhDQFEwK218NqtuMCqHchuWdWy/c=;
Received: from [184.161.19.61] (port=56528 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uzGej-0002kk-CN; Thu, 18 Sep 2025 11:34:46 -0400
Date: Thu, 18 Sep 2025 11:34:44 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Message-Id: <20250918113444.65155654f1e16416a492273f@hugovil.com>
In-Reply-To: <OS3PR01MB831915ED0F0E2452BEBC37098A17A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
	<20250912142056.2123725-3-chris.brandt@renesas.com>
	<20250917162832.02100f4bbe896c878eccca8e@hugovil.com>
	<OS3PR01MB831915ED0F0E2452BEBC37098A17A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Wed, 17 Sep 2025 21:45:55 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you for your review.
> 
> > > +rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->forma
> > > +t) / dsi->lanes, 1);
> >
> > What is this "1" value meaning? This is hard to decipher.
> 
> That is true (unless you know to look in the other file)
> 
> > If it is related to PLL5_TARGET_DSI, then these PLL5_TARGET_* macros should be added to the renesas.h header file and used here.
> 
> I was not clear how much I should be adding to that renesas.h file. But like you said, it would make the code
> easier to read.
> 
> I was also waiting to hear what Geert thought about adding a new API to the clock driver.

Hi Chris,
no problem.

Just to let you know, I tested your 2 patches on our custom board
and the panel is still working well.

Hugo.


> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com> 
> Sent: Wednesday, September 17, 2025 4:29 PM
> To: Chris Brandt <Chris.Brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Biju Das <biju.das.jz@bp.renesas.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Hien Huynh <hien.huynh.px@renesas.com>; Nghia Vo <nghia.vo.zn@renesas.com>; linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on target MIPI device
> 
> On Fri, 12 Sep 2025 10:20:56 -0400
> Chris Brandt <chris.brandt@renesas.com> wrote:
> 
> > Before the MIPI DSI clock source can be configured, the target divide 
> > ratio needs to be known.
> > 
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > 
> > ---
> > v1->v2:
> > - Add spaces around '/' in comments
> > - Add target argument in new API
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 
> > ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c 
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index f87337c3cbb5..ca0de93d5a1a 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/clk/renesas.h>
> >  #include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/io.h>
> > @@ -732,6 +733,23 @@ static int rzg2l_mipi_dsi_host_attach(struct 
> > mipi_dsi_host *host,
> >  
> >  	drm_bridge_add(&dsi->bridge);
> >  
> > +	/*
> > +	 * Report required division ratio setting for the MIPI clock 
> > +dividers
> 
> Add missing dot at end of sentence.
> 
> > +	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
> > +	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
> > +	 *
> > +	 * pllclk / 2 = vclk * DSI divider
> > +	 * pllclk = vclk * DSI divider * 2
> > +	 *
> > +	 * hsclk = (vclk * DSI divider * 2) / 16
> > +	 *
> > +	 * vclk * bpp = hsclk * 8 * num_lanes
> > +	 * vclk * bpp = ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
> > +	 *   which simplifies to...
> > +	 * DSI divider = bpp / num_lanes
> > +	 */
> > +	
> > +rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->forma
> > +t) / dsi->lanes, 1);
> 
> What is this "1" value meaning? This is hard to decipher.
> 
> If it is related to PLL5_TARGET_DSI, then these PLL5_TARGET_* macros should be added to the renesas.h header file and used here.
> 
> > +
> >  	return 0;
> >  }
> >  
> > --
> > 2.50.1
> > 
> > 
> 
> 
> --
> Hugo Villeneuve
> 


-- 
Hugo Villeneuve

