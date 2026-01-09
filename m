Return-Path: <linux-renesas-soc+bounces-26536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC17D0B0FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 16:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEE0330C2C62
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 15:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5FF35C19C;
	Fri,  9 Jan 2026 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="RgqZxjHV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030535CB9E;
	Fri,  9 Jan 2026 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973631; cv=none; b=m32GU/wruHritw9M5oXUzQeKMAqbu2SGqXBSzpSvoXBjBSbQq+5fy7Qz0YHpvXKNzezFSuAq5eYI4AUf7YNS05efx5XHviop6KGC9cU/KlUmQmGvYMUKafZoc1pXQx5orGx7VcTIgMx0WpFgYneMmGbDeG3AN/m1glm3k94+8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973631; c=relaxed/simple;
	bh=lHGhOz83jxTSQ/GpN7VXl0Vqal3UprDmMlla2Qkm7+I=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=YJ141GzWQOds+CwoCO8AlqEUZTpi8f3f1ZQM+wqG7EmObGv5VLTUHLOvV9qFRATr6QWxRd7mq6ZDASKzzFmwnoIPZLGsVsjdmZvCsqWyEin+DqhuC/0oycPmpVQBfIETdBPPDP9dFYSoA0y8adFumVsX69ddjUiUy5BCp110p4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=RgqZxjHV; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=CpcA2IZyojKZsMfkNyX19rE5IA0g6n/bkKNz/08jVm0=; b=RgqZxjHV9kpC6Q1RmCfgbNnqnv
	+jP2Zo6BJUzMrCRDxFzd3kODaAZUQjMNB9LGQ0MYvT/iRqigeh9YJB7e3exgty6jLQRoSkSSjxr4e
	gTaY/oGRNnkcgHLi99UmG4qqWVpeTz+nwyZndXkqI2NZWXvlQPbcJ6aACx/POi50kb8E=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:39428 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1veEhb-0003ld-Pd; Fri, 09 Jan 2026 10:47:04 -0500
Date: Fri, 9 Jan 2026 10:47:03 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Biju Das Biju Das
 <biju.das.jz@bp.renesas.com>, Chris Brandt <Chris.Brandt@renesas.com>
Message-Id: <20260109104703.98d8ec6fd6b482b94d103f0c@hugovil.com>
In-Reply-To: <02e48c5d-439f-4292-9df9-c0bba6f44f16@tuxon.dev>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
	<f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
	<20260108105319.6bef21d3fc60b261792d07c6@hugovil.com>
	<02e48c5d-439f-4292-9df9-c0bba6f44f16@tuxon.dev>
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
	* -1.6 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Claudiu,

On Fri, 9 Jan 2026 11:49:23 +0200
Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:

> Hi, Hugo,
> 
> On 1/8/26 17:53, Hugo Villeneuve wrote:
> > Hi Claudiu,
> > 
> > On Thu, 8 Jan 2026 11:12:54 +0200
> > Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> > 
> >> Hi, Hugo,
> >>
> >> On 1/7/26 23:48, Hugo Villeneuve wrote:
> >>> Hi,
> >>> when issuing a reboot command, I encounter the following kernel panic:
> >>>
> >>> [   36.183478] SError Interrupt on CPU1, code 0x00000000be000011 -- SError
> >>> [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> >>> [   36.183504] Tainted: [M]=MACHINE_CHECK
> >>> [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> >>> [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >>> [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x458
> >>> [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x458
> >>> [   36.183547] sp : ffff8000813db860
> >>> [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c0 x27: ffff000009dd7450
> >>> [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd7450 x24: ffff800080e1f7a8
> >>> [   36.183573] x23: ffff000009dd7400 x22: 0000000000000000 x21: ffff000009dd7430
> >>> [   36.183582] x20: ffff8000813db8e8 x19: 0000000002050028 x18: 00000000ffffffff
> >>> [   36.183592] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000813db220
> >>> [   36.183602] x14: 0000000000000000 x13: ffff800081255bc0 x12: 00000000000009a2
> >>> [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d0 x9 : ffff800081255bc0
> >>> [   36.183621] x8 : ffff800081399000 x7 : ffff00000a042600 x6 : 0000000000000000
> >>> [   36.183631] x5 : 0000000000000805 x4 : 0000000002000000 x3 : 0000000000000028
> >>> [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b40 x0 : ffff800081780000
> >>> [   36.183652] Kernel panic - not syncing: Asynchronous SError Interrupt
> >>> [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G   M                6.19.0-rc4-arm64-renesas-00019-g067a81578add #62 NONE
> >>> [   36.183665] Tainted: [M]=MACHINE_CHECK
> >>> [   36.183668] Hardware name: devboard1 (DT)
> >>> [   36.183672] Call trace:
> >>> [   36.183675]  show_stack+0x18/0x24 (C)
> >>> [   36.183692]  dump_stack_lvl+0x34/0x8c
> >>> [   36.183702]  dump_stack+0x18/0x24
> >>> [   36.183708]  vpanic+0x314/0x35c
> >>> [   36.183716]  nmi_panic+0x0/0x64
> >>> [   36.183722]  add_taint+0x0/0xbc
> >>> [   36.183728]  arm64_serror_panic+0x70/0x80
> >>> [   36.183735]  do_serror+0x28/0x68
> >>> [   36.183742]  el1h_64_error_handler+0x34/0x50
> >>> [   36.183751]  el1h_64_error+0x6c/0x70
> >>> [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
> >>> [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> >>> [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
> >>> [   36.183792]  ili9881c_unprepare+0x38/0x88
> >>> [   36.183802]  drm_panel_unprepare+0xbc/0x108
> >>> [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x60
> >>> [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/0x4c
> >>> [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8/0x100
> >>> [   36.183845]  drm_atomic_helper_commit_modeset_disables+0x2fc/0x5f8
> >>> [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x7c
> >>> [   36.183865]  commit_tail+0xa4/0x18c
> >>> [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> >>> [   36.183884]  drm_atomic_commit+0x8c/0xcc
> >>> [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> >>> [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> >>> [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> >>> [   36.183920]  platform_shutdown+0x24/0x34
> >>> [   36.183931]  device_shutdown+0x128/0x284
> >>> [   36.183938]  kernel_restart+0x44/0xa4
> >>> [   36.183950]  __do_sys_reboot+0x178/0x270
> >>> [   36.183959]  __arm64_sys_reboot+0x24/0x30
> >>> [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> >>> [   36.183979]  do_el0_svc+0x40/0xc0
> >>> [   36.183988]  el0_svc+0x3c/0x164
> >>> [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> >>> [   36.184002]  el0t_64_sync+0x198/0x19c
> >>> [   36.184020] Kernel Offset: disabled
> >>> [   36.184022] CPU features: 0x200000,00020001,4000c501,0400720b
> >>> [   36.184028] Memory Limit: none
> >>> [   36.495305] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
> >>>
> >>> The problem is present since linux-6.18-rc1, but not in linux-6.17. I also confirm the bug is present in linux-6.19-rc4.
> >>>
> >>> The bug seems to be happening in rzg2l_mipi_dsi_host_transfer().
> >>>
> >>> After bisecting, here is the first bad commit:
> >>>
> >>>       commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L")
> >>>
> >>> Reverting this change makes the bug disappear.
> >>>
> >>> My limited understanding seems to indicate that the MIPI/DSI host may
> >>> no longer be available/on when the panel tries to send MIPI/DSI
> >>> commands in ili9881c_unprepare(), maybe because the MIPI/DSI clock has been stopped...
> >>>
> >>> The exact same board with two other panels (jd9365da and st7703) doesn't have the bug.
> >>
> >> Could you please provide the output of command:
> >>
> >> cat /sys/kernel/debug/mstop
> >>
> >> for both cases?
> > 
> > Here it is for the panel which has the bug:
> > 
> > ----------------------------------
> >                             MSTOP
> >                       clk   -------------------------
> > clk_name             cnt   cnt   off   val    shared
> > --------             ----- ----- ----- ------ ------
> > gic                  1     1     0xb80 0x0
> > ia55_clk             2     2     0xb70 0x0    ia55_pclk ia55_clk
> > ia55_pclk            1     2     0xb70 0x0    ia55_pclk ia55_clk
> > dmac_aclk            2     1     0xb80 0x0
> > dmac_pclk            1     1     0xb80 0x0
> > ostm0_pclk           0     0     0xb7c 0x10
> > ostm1_pclk           1     1     0xb7c 0x0
> > ostm2_pclk           1     1     0xb7c 0x0
> > mtu_x_mck            0     0     0xb64 0x4
> > gpt_pclk             1     1     0xb64 0x0
> > poeg_a_clkp          0     0     0xb64 0x20
> > poeg_b_clkp          0     0     0xb64 0x40
> > poeg_c_clkp          0     0     0xb64 0x80
> > poeg_d_clkp          0     0     0xb64 0x100
> > wdt0_pclk            1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> > wdt0_clk             1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> > wdt1_pclk            0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> > wdt1_clk             0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> > spi_clk2             0     0     0xb64 0x2    spi_clk2 spi_clk
> > spi_clk              0     0     0xb64 0x2    spi_clk2 spi_clk
> > sdhi0_imclk          1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
> > sdhi0_imclk2         2     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
> > sdhi0_clk_hs         1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
> > sdhi0_aclk           1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sdhi0_clk_hs sdhi0_aclk
> > sdhi1_imclk          0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
> > sdhi1_imclk2         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
> > sdhi1_clk_hs         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
> > sdhi1_aclk           0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sdhi1_clk_hs sdhi1_aclk
> > gpu_clk              1     1     0xb80 0x0
> > cru_sysclk           0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pclk cru_aclk
> > cru_vclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pclk cru_aclk
> > cru_pclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pclk cru_aclk
> > cru_aclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pclk cru_aclk
> 
> > dsi_pll_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi_aclk dsi_pclk dsi_vclk dsi_lpclk
> > dsi_sys_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi_aclk dsi_pclk dsi_vclk dsi_lpclk
> > dsi_aclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi_aclk dsi_pclk dsi_vclk dsi_lpclk
> > dsi_pclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi_aclk dsi_pclk dsi_vclk dsi_lpclk
> > dsi_vclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi_aclk dsi_pclk dsi_vclk dsi_lpclk
> > dsi_lpclk            1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi_aclk dsi_pclk dsi_vclk dsi_lpclk
> 
> I was expected the MSTOP for these to be set to anythong other than 0x0 
> here. But I presume, they are somehow set in the reboot process before 
> exectution reach rzg2l_mipi_dsi_host_transfer(). To be honest, I don't 
> know the rz-du code.

Maybe Biju can shed some light on this?


> 
> [...]
> 
> > 
> > I do not have acces to the other panels for the moment to run the same command.
> > 
> > 
> >> Also, could you please check if the following diff solves your problem:
> >>
> >> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >> b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >> index 5edd45424562..62957632a96f 100644
> >> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >> @@ -1282,6 +1282,10 @@ static ssize_t
> >> rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
> >>                   value |= SQCH0DSC0AR_FMT_SHORT;
> >>           }
> >>
> >> +       ret = pm_runtime_resume_and_get(dsi->dev);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >>           rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
> >>
> >>           /*
> >> @@ -1322,6 +1326,8 @@ static ssize_t rzg2l_mipi_dsi_host_transfer(struct
> >> mipi_dsi_host *host,
> >>                           ret = packet.payload_length;
> >>           }
> >>
> >> +       pm_runtime_put(dsi->dev);
> >> +
> >>           return ret;
> >>    }
> > 
> > I confirm that it fixes the bug, altought I assume this is just for testing and is not the "proper" fix.
> 
> To me, this, or something similar should be done anyway. Previously it 
> used to work because there was no MSTOP support available.
> 
> The MSTOP is now set when all of the clocks sharing it are disabled. 
> With the MSTOP set, any master accessing a HW block that has MSTOP set 
> will get sync abort. That wasn't the case previously, when the HW 
> registers could have been accessed w/o generating such exeception.
> 
> Thank you,
> Claudiu
> 


-- 
Hugo Villeneuve

