Return-Path: <linux-renesas-soc+bounces-24341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1B2C4162F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 20:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAA2C4E3C5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 19:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FB62D3EDC;
	Fri,  7 Nov 2025 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="knlbwKss"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151F2877D2;
	Fri,  7 Nov 2025 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762542485; cv=none; b=gBumPV20xwXJ07e5Fns0toyBcf90GBvP/211jhVmGpLBnxRzg2+yxuGeF8/ER/oggoMQB/NLP3IS31YoSmCOpJF8M4rbAT9RccyhB0obsMmlWmY1Kc/kYO2hjMDsgq2Eji1tgt5og43mGJVros9YYf5F4ItOVx2DXrny+RC4+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762542485; c=relaxed/simple;
	bh=pDkgsq6PK6UH+iz6ColUvj0tCRATe+ASfJkhfla7JoY=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=VK5grzdkU5o2+VV8Vi3zxMCu5A5Ir7FHkv+nLg51jvXqTcmyx50gKYA+o29ZR1gSbDbTWXAnSCAqsag2o/0R1lexB78f3UsLxcdXeig10xPfVjtwRX3SgTW8JRsUBjPLU77XKH/nHDtkOzJ8LKnH3M/ReojjoM87El2Nw1VHZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=knlbwKss; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=B2YvgcCMt5tmIfe2GmRK2C3L8OlLTXrg19Buak8KA50=; b=knlbwKssPG5AATNsNp46rCIOBr
	/cn57zM9ph+2/4AuASu1k2Y1pz6EI7j6/hIkaRskLp50DvDDA6x/YalQTU+dpT/ygCfZ1m9jR80or
	eSIo/zZOzM11sLzGFGIekkfQJQQlYYONIpZcxhq9B35HPHj6EIQ1Me/LInMG/wY5V4b8=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:59072 helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vHRoN-0003uW-Ne; Fri, 07 Nov 2025 14:07:52 -0500
Date: Fri, 7 Nov 2025 14:07:50 -0500
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
Message-Id: <20251107140750.00bf68e4b2f5354015e65ad4@hugovil.com>
In-Reply-To: <OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251105222530.979537-2-chris.brandt@renesas.com>
	<20251107113058.f334957151d1a8dd94dd740b@hugovil.com>
	<OS3PR01MB83195AF3F1964548E1512FBE8AC3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
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
	* -1.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris,

On Fri, 7 Nov 2025 18:36:24 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you for your review.
> 
> On Fri, Nov 7, 2025 11:31 AM, Hugo Villeneuve wrote:
> > > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > > +				    params->pl5_intin > PLL5_INTIN_MAX)
> >
> > Your patch comments indicate that you removed +1 and -1 for kernel test robot issue, but I do not understand why.
> >
> > pl5_intin is still defined as u8 (max 255), and therefore the result of "params->pl5_intin > PLL5_INTIN_MAX" will always be false because PLL5_INTIN_MAX is 320.
> >
> > It seems to me that pl5_intin type should be modified to account for its maximum value (u16?), and this should probably goes into a separate patch (with a Fixed: tag), that can be backported (if necessary).
> 
> You are totally right!
> INTIN is a 12-bit register value.
> It's a bug.
> 
> Good catch.
> 
> I'll make that a separate patch so I can CC stable.

You can add the "Fixes" tag (not "Fixed" as I incorrectly stated):

    Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")

This is the commit that added the pl5_intin field.

Original Kernel test robot message also suggested adding:

    Reported-by: kernel test robot <lkp@intel.com>

(See https://lore.kernel.org/oe-kbuild-all/202510240111.DvVTqUEp-lkp@intel.com/)

Hugo.

> Chris
> 
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

