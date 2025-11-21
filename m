Return-Path: <linux-renesas-soc+bounces-25001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A45C7B161
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 18:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30DD43A2CEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DBB2E8B76;
	Fri, 21 Nov 2025 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="je+Sv7Ti"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED6A2749D2;
	Fri, 21 Nov 2025 17:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746569; cv=none; b=mRRQT/1dtVlNIC1w5WhLAshAr4wzIqX/bY+GytsGyPiJt/dVYZ0t6Nf5ItQwYuYI4Eb5nRsspNEMcRwsZJsDMQnPuvF4VpqvmfH3ELDx6XVT4cr7q/9RafYtlZu7cUZBAIBICKckFB7bzBo7mqFYPWE+K0BFXU9DvfefKf22fk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746569; c=relaxed/simple;
	bh=eUAP1Oaq48E7P0bj+xhylvpo9LLSTyoF4AuQpzSCXvM=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=KMN8AsNGDqIebtxGrgZFdPLOrSLpmAzj8KoSvLdXXOzdXeMAKjyqAUCfkXDhnAHlj+XHQlN1A201xK9SDHC7ti48YlX08mAJ0TIe0TSl0eB04zh7dY9cHzuBu3gIGmMJA4TePYDHVKrADZRHHCSGXRerryoiH5iEcK3WXhkBdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=je+Sv7Ti; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=oj6j8yoSghWyT13M0LSjHIg7myaVztNp8X5nJ/reww8=; b=je+Sv7TipNF0JwWCy5aq3oj6I3
	yAlqX4XAbIVil4WnW8O5qrBjkTzcpL46LBJEiwxhjJ4eAOBdThNiyo99wNfo5otuLx1jZNydRMWMK
	JJMRnHNmsOAEjd33adb3hzhnFv5LuZaCRMAl91rB07VCAFpkrnITnS9JS7pXraQfOEi4=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:44288 helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vMUVt-0005U0-SC; Fri, 21 Nov 2025 12:01:38 -0500
Date: Fri, 21 Nov 2025 12:01:37 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Message-Id: <20251121120137.e6ad0e6d98daa15d2a1d3963@hugovil.com>
In-Reply-To: <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
	<20251119022744.1599235-2-chris.brandt@renesas.com>
	<20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
	<20251119132235.795b633eedbb91f8544262db@hugovil.com>
	<OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
	<CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
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
	* -2.7 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Chris and Geert

On Fri, 21 Nov 2025 09:59:05 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Chris,
> 
> On Fri, 21 Nov 2025 at 05:04, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> > On Wed, Nov 19, 2025 1:23 PM, Hugo Villeneuve wrote:
> > > > +                           params->pl5_fracin = div_u64((u64)
> > > > +                                                ((foutvco_rate * params->pl5_refdiv) %
> > > > +                                                (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > > > +                                                EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> > > >
> > > >
> > > > Also:
> > > >   foutvco_rate (max) = 3000000000 (3GHz)
> > > >   pl5_refdiv (max) = 2
> > > >
> > > > so the result of (foutvco_rate * params->pl5_refdiv) could become
> > > > 6GHz, which is greater than unsigned long on 32-bit platform and overflow?
> > >
> > > I confirm that when testing with "COMPILE_TEST" as Geert suggested on a 32-bit platform, the results are not
> > >  valid for this combination (but they are valid on 64-bit platforms).
> > >
> > > I think that the kernel robot could potentially issue a build warning for 32-bit platforms (if they also build with
> > > COMPILE_TEST enabled, which I'm not sure about). Maybe Geert could comment on this?
> >
> > I've got no comment here.
> >
> > I can't image when someone would ever want to compile this code for a 32-bit system.
> >
> > So I'll leave it as it is now unless Geert wants me to change it to something else.
> 
> Pieces of code are reused all the time. So I think it is better to make
> sure it doesn't overflow on 32-bit.

Here is a potential idea for implementing it so that it doesn't overflow.
I tested it (compile and run) on a 32-bit platform, and also with my RZG2L board.
Note that I defined an intermediate variable to improve readability (extal_hz):

--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -22,6 +22,7 @@
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -583,10 +584,12 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
                               struct rzg2l_pll5_param *params,
                               unsigned long rate)
 {
-       unsigned long foutpostdiv_rate, foutvco_rate;
+       unsigned long foutpostdiv_rate;
+       u64 foutvco_rate;
        unsigned long hsclk;
        unsigned int a, b, odd;
        unsigned int dsi_div_ab_calc;
+       const u32 extal_hz = EXTAL_FREQ_IN_MEGA_HZ * MEGA;
 
        if (dsi_div_target == PLL5_TARGET_DSI) {
                /*
@@ -662,16 +665,16 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
                        for (params->pl5_refdiv = PLL5_REFDIV_MIN;
                             params->pl5_refdiv <= PLL5_REFDIV_MAX;
                             params->pl5_refdiv++) {
-                               params->pl5_intin = (foutvco_rate * params->pl5_refdiv) /
-                                                   (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+                               u32 rem;
+
+                               params->pl5_intin = div_u64_rem(foutvco_rate * params->pl5_refdiv, extal_hz, &rem);
+
                                if (params->pl5_intin < PLL5_INTIN_MIN ||
                                    params->pl5_intin > PLL5_INTIN_MAX)
                                        continue;
 
-                               params->pl5_fracin = div_u64(((u64)
-                                                    (foutvco_rate * params->pl5_refdiv) %
-                                                    (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
-                                                    EXTAL_FREQ_IN_MEGA_HZ * MEGA);
+                               params->pl5_fracin = div_u64((u64)rem << 24, extal_hz);
                                goto clk_valid;



Hugo


> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

