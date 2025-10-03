Return-Path: <linux-renesas-soc+bounces-22631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03019BB749A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 17:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D4221B20715
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 15:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815FE1F1302;
	Fri,  3 Oct 2025 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VhlK3yba";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t69O1oGL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C60742A80;
	Fri,  3 Oct 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759504106; cv=none; b=PdMjk78YXm3mdAnd20yws5gecsEHbKOmcEB+DsGcu95Ujp0TZFkLiOmDMXzjNWYWbufl9ym+oClcGJwsu9XEPXrkb2PaBX3ARjoeKkyAuMGWBJktwThvB1HMUSqdw9kRwTeYkRXVBbCF8TRyhe66eviz2tPfBvfx70sdP/UFjUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759504106; c=relaxed/simple;
	bh=xchu3zkjff/yqh0XlrDCR8C58ZhukqzWo/y3lvTI5cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fv6G07LSuaGmUk8+d1rpk2Tw5asG5mwko2H3rS50OwK25Q+fenNckzF55h5Dl8k1DbkQkLUGIootAdK3gd6OdpUCTn050q9F+DTakV8mgeWYxY3NavzEBxDDBjqXEkGMTeEy0nmBOrbvODEsfn55FMAJQgedWoYHq5ev57t5dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VhlK3yba; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t69O1oGL; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 3CE1C1D0003B;
	Fri,  3 Oct 2025 11:08:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 03 Oct 2025 11:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759504102;
	 x=1759590502; bh=i270RD4VcI7ckhtO3vqu0AJfQn3RYqxv+Cfx//Wv2CU=; b=
	VhlK3ybaDdC/0tJW57ikF0I5RT/eaTbMaXc0+EDVU7d105JbXC5MW3xW5EN54AHq
	ScdjCzVSP3zxyePLdR4cFkp5jTs/RJWQFoEA7YAX2sTqUie3Tu3SeAlbV9HrSB9o
	BBAnAzClj6UyUiU3WcPDMQ/rHNjjtB5SAyTkZPdwjBF/+TU778amWIDrdAECZ5JD
	syS/B0j0LBSlwN++TdkworskzUUnd7qTFhUnn5KKMxCfYDjowSVM0NopLjBEb4Hi
	1N8jbAx2tTNRBjyDsM0q1nyKcWIiCdz0fOm34woD0wTIct/x3CPXJCISISvE34cY
	9q27cqdqC1A/6/l0yOPskA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759504102; x=
	1759590502; bh=i270RD4VcI7ckhtO3vqu0AJfQn3RYqxv+Cfx//Wv2CU=; b=t
	69O1oGLGZ7KbBQoDdjdViJuPPLqSxh4gPMHtQ7BWfIdgB2NU9+vtX7FowrlSEYsJ
	+AQ6pbE5lnLIxCRG8wkxBB2W/USLo2+WKEXrF8yE+ZjOCsc+TNIk9asuu3zTM4L0
	imE9MoLEgzBwwLKFc8wVsWTYobzLpLcqc5EaoH3CZmJRiaJHS6z3teePFxiQRcpA
	TGHjkz926cXlSIIQTTvjR6rgE79bVFjoTMe5UYOArXGg7/SwOwfpfz9E+EIqt1Ip
	DoREsyBC7Y5UGiGKU346rDuSF+VdcEUeoeHKtWQIxHKYCLIeOMV9aQMu85WSJlRc
	LyKMwb3vlcMTlDuf2g8jA==
X-ME-Sender: <xms:5ebfaAdA4nQwTJLZUyRYm9oL3a9HxuVDJ_0aSB5RAqvULjpphq19tA>
    <xme:5ebfaLj8PAaTs9Sn76dr80mQLBtz5KTr0U8Ib_npDjjZO8Ll3OMyEEV1Cc6DbEyTm
    4RSXZRssy0qpCBGLFMQF1u6hAd-sGxNVUaa_JA3NHo56s1da9kPJyY>
X-ME-Received: <xmr:5ebfaIy5GmOuxi5Jye7xZPlU9yD4IYlAnVIkWtpfEXuhtHHH7bXdhVG75vDfwYvXVulCBoui5hWMSdBEup_hkPfhwQqlSuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekledvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhr
    ghdprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphht
    thhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepsh
    gsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgr
    shdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5ebfaHPnVDmv-MGUMvtyu7UK7qmkowJqqHHbNnC74F7SRojVOXEbLw>
    <xmx:5ebfaJVUJNcw_1doWvxYYZWfy03xznaw5uptbtV9IFXGocuFoNs8gg>
    <xmx:5ebfaL3ln2womImDc2B89GeanSCDGBumtLQewhQNKddvrrhb4Q92tQ>
    <xmx:5ebfaHp7_IP5IZbP0WYxomJJmCvqZGpHNYaaLAGR_wp9xDBrRPDg8Q>
    <xmx:5ubfaCi1VApX0OpRqpB-V5InT1RDeiHuODA97aUW8q5mjdgYDfp46CAb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Oct 2025 11:08:20 -0400 (EDT)
Date: Fri, 3 Oct 2025 17:08:19 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
Message-ID: <20251003150819.GC344149@ragnatech.se>
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thanks for your work.

On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> after reset has been asserted by writing a matching reset bit into register
> SRCR, it is mandatory to wait 1ms.
> 
> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> whether S4 is affected as well. This patch does apply the extra delay on
> R-Car S4 as well.
> 
> Fix the reset driver to respect the additional delay when toggling resets.
> Drivers which use separate reset_control_(de)assert() must assure matching
> delay in their driver code.
> 
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index be9f59e6975d..65dfaceea71f 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>  	/* Reset module */
>  	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>  
> -	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> -	udelay(35);
> +	/*
> +	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
> +	 * On older SoCs, delay after SRCR has been written is 35us
> +	 * (one cycle of the RCLK clock @ cca. 32 kHz).
> +	 */
> +	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +		usleep_range(1000, 2000);
> +	else
> +		usleep_range(35, 1000);

I rebased the R-Car ISP work to renesas-drivers today and it included 
this change, and I seem to have hit an issue with the switch form 
udelay() to usleep_range() I'm afraid. I can't find any other good 
reproducer of the issue however.

THe core of the issue seems to be that if a reset is issued from an 
atomic context bad things happen if you try to sleep. I get this splat 
and the board is completer dead after it, needing a power cycle to 
recover.

If I revert this patch things work as expected.

[   29.256947] BUG: scheduling while atomic: yavta/597/0x00000002
[   29.257783] 2 locks held by yavta/597:
[   29.258268]  #0: ffff000442a66418 (&io->lock){+.+.}-{4:4}, at: __video_do_ioctl+0xdc/0x3f0
[   29.259356]  #1: ffff000442a66e18 (&core->lock){....}-{3:3}, at: risp_core_start_streaming+0xec/0x440
[   29.260555] irq event stamp: 3916
[   29.260983] hardirqs last  enabled at (3915): [<ffff800080fb4e04>] _raw_spin_unlock_irqrestore+0x64/0x68
[   29.262205] hardirqs last disabled at (3916): [<ffff800080fb43d8>] _raw_spin_lock_irqsave+0x78/0x80
[   29.263366] softirqs last  enabled at (3848): [<ffff8000800c2478>] handle_softirqs+0x44c/0x4a0
[   29.264476] softirqs last disabled at (3805): [<ffff800080010270>] __do_softirq+0x10/0x18
[   29.265529] CPU: 0 UID: 0 PID: 597 Comm: yavta Not tainted 6.17.0-arm64-renesas-09711-g5173b0d6549f #52 PREEMPT
[   29.265536] Hardware name: Retronix Sparrow Hawk board based on r8a779g3 (DT)
[   29.265540] Call trace:
[   29.265542]  show_stack+0x14/0x1c (C)
[   29.265551]  dump_stack_lvl+0x6c/0x90
[   29.265558]  dump_stack+0x14/0x1c
[   29.265563]  __schedule_bug+0x64/0x78
[   29.265570]  __schedule+0xcfc/0xf90
[   29.265574]  schedule+0x48/0x154
[   29.265577]  schedule_hrtimeout_range_clock+0xd8/0x120
[   29.265582]  usleep_range_state+0x84/0xe0
[   29.265587]  cpg_mssr_reset+0xd8/0xdc
[   29.265595]  reset_control_reset+0x4c/0x160
[   29.265604]  risp_core_start_streaming+0x100/0x440
[   29.265609]  risp_io_start_streaming+0x74/0x108
[   29.265614]  vb2_start_streaming+0x64/0x168
[   29.265618]  vb2_core_streamon+0xd0/0x1b8
[   29.265621]  vb2_ioctl_streamon+0x50/0x8c
[   29.265625]  v4l_streamon+0x20/0x28
[   29.265631]  __video_do_ioctl+0x344/0x3f0
[   29.265635]  video_usercopy+0x2e4/0x870
[   29.265639]  video_ioctl2+0x14/0x20
[   29.265643]  v4l2_ioctl+0x3c/0x60
[   29.265646]  __arm64_sys_ioctl+0x88/0xe0
[   29.265653]  invoke_syscall.constprop.0+0x3c/0xe4
[   29.265659]  el0_svc_common.constprop.0+0x34/0xcc
[   29.265663]  do_el0_svc+0x18/0x20
[   29.265667]  el0_svc+0x3c/0x2a0
[   29.265673]  el0t_64_sync_handler+0x98/0xe0
[   29.265678]  el0t_64_sync+0x154/0x158
[   29.268217] BUG: spinlock wrong CPU on CPU#1, yavta/597
[   29.282715]  lock: 0xffff000442a66e00, .magic: dead4ead, .owner: yavta/597, .owner_cpu: 0
[   29.283783] CPU: 1 UID: 0 PID: 597 Comm: yavta Tainted: G        W           6.17.0-arm64-renesas-09711-g5173b0d6549f #52 PREEMPT
[   29.283790] Tainted: [W]=WARN
[   29.283793] Hardware name: Retronix Sparrow Hawk board based on r8a779g3 (DT)
[   29.283795] Call trace:
[   29.283797]  show_stack+0x14/0x1c (C)
[   29.283812]  dump_stack_lvl+0x6c/0x90
[   29.283821]  dump_stack+0x14/0x1c
[   29.283825]  spin_dump+0x74/0x80
[   29.283831]  do_raw_spin_unlock+0xfc/0x104
[   29.283839]  _raw_spin_unlock_irqrestore+0x2c/0x68
[   29.283848]  risp_core_start_streaming+0x30c/0x440
[   29.283858]  risp_io_start_streaming+0x74/0x108
[   29.283863]  vb2_start_streaming+0x64/0x168
[   29.283867]  vb2_core_streamon+0xd0/0x1b8
[   29.283869]  vb2_ioctl_streamon+0x50/0x8c
[   29.283873]  v4l_streamon+0x20/0x28
[   29.283879]  __video_do_ioctl+0x344/0x3f0
[   29.283885]  video_usercopy+0x2e4/0x870
[   29.283889]  video_ioctl2+0x14/0x20
[   29.283892]  v4l2_ioctl+0x3c/0x60
[   29.283895]  __arm64_sys_ioctl+0x88/0xe0
[   29.283903]  invoke_syscall.constprop.0+0x3c/0xe4
[   29.283908]  el0_svc_common.constprop.0+0x34/0xcc
[   29.283912]  do_el0_svc+0x18/0x20
[   29.283915]  el0_svc+0x3c/0x2a0
[   29.283922]  el0t_64_sync_handler+0x98/0xe0
[   29.283926]  el0t_64_sync+0x154/0x158
[   29.283952] ------------[ cut here ]------------
[   29.298904] WARNING: CPU: 1 PID: 597 at kernel/rcu/srcutree.c:732 __srcu_check_read_flavor+0x50/0xe0
[   29.300062] CPU: 1 UID: 0 PID: 597 Comm: yavta Tainted: G        W           6.17.0-arm64-renesas-09711-g5173b0d6549f #52 PREEMPT
[   29.301538] Tainted: [W]=WARN
[   29.301913] Hardware name: Retronix Sparrow Hawk board based on r8a779g3 (DT)
[   29.302810] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.303689] pc : __srcu_check_read_flavor+0x50/0xe0
[   29.304307] lr : device_links_read_lock+0x20/0x60
[   29.304904] sp : ffff800083c438a0
[   29.305322] x29: ffff800083c438a0 x28: 0000000000000001 x27: 0000000000000001
[   29.306225] x26: 0000000000000000 x25: ffff800081751db8 x24: ffff800080123160
[   29.307125] x23: 0000000000000002 x22: ffff800080726a90 x21: ffff000440c56968
[   29.308026] x20: ffff800080726a90 x19: ffff8000818bc240 x18: 0000000000000010
[   29.308926] x17: 202c3739352f6174 x16: 766179203a72656e x15: 0000000000000020
[   29.309826] x14: 0000000000000000 x13: 00000000ffff1060 x12: 00000000fffffffd
[   29.310726] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800081777de0
[   29.311626] x8 : ffff800083c437b0 x7 : ffff800083c438c0 x6 : ffff800083c43870
[   29.312526] x5 : ffff800083c437f0 x4 : ffff800083c44000 x3 : 0000000000000000
[   29.313426] x2 : 00000000ffffffff x1 : 0000000000000001 x0 : ffff8000818bc470
[   29.314326] Call trace:
[   29.314636]  __srcu_check_read_flavor+0x50/0xe0 (P)
[   29.315254]  device_links_read_lock+0x20/0x60
[   29.315805]  __rpm_callback+0x14c/0x210
[   29.316294]  rpm_callback+0x6c/0x78
[   29.316737]  rpm_resume+0x50c/0x718
[   29.317179]  __pm_runtime_resume+0x48/0x88
[   29.317698]  vsp1_device_get+0x1c/0x84
[   29.318175]  vsp1_isp_start_streaming+0x7c/0x198
[   29.318761]  risp_core_start_streaming+0x318/0x440
[   29.319368]  risp_io_start_streaming+0x74/0x108
[   29.319942]  vb2_start_streaming+0x64/0x168
[   29.320470]  vb2_core_streamon+0xd0/0x1b8
[   29.320976]  vb2_ioctl_streamon+0x50/0x8c
[   29.321484]  v4l_streamon+0x20/0x28
[   29.321925]  __video_do_ioctl+0x344/0x3f0
[   29.322433]  video_usercopy+0x2e4/0x870
[   29.322920]  video_ioctl2+0x14/0x20
[   29.323362]  v4l2_ioctl+0x3c/0x60
[   29.323781]  __arm64_sys_ioctl+0x88/0xe0
[   29.324279]  invoke_syscall.constprop.0+0x3c/0xe4
[   29.324875]  el0_svc_common.constprop.0+0x34/0xcc
[   29.325469]  do_el0_svc+0x18/0x20
[   29.325890]  el0_svc+0x3c/0x2a0
[   29.326289]  el0t_64_sync_handler+0x98/0xe0
[   29.326819]  el0t_64_sync+0x154/0x158
[   29.327283] irq event stamp: 3935
[   29.327702] hardirqs last  enabled at (3935): [<ffff800080fa655c>] irqentry_exit+0x3c/0x180
[   29.328755] hardirqs last disabled at (3934): [<ffff800080fab110>] preempt_schedule_irq+0x70/0xa0
[   29.329872] softirqs last  enabled at (3930): [<ffff8000800c2478>] handle_softirqs+0x44c/0x4a0
[   29.330958] softirqs last disabled at (3919): [<ffff800080010270>] __do_softirq+0x10/0x18
[   29.331988] ---[ end trace 0000000000000000 ]---
[   29.332579] ------------[ cut here ]------------
[   29.333163] WARNING: CPU: 1 PID: 597 at kernel/irq/irqdesc.c:666 handle_irq_desc+0x3c/0x58
[   29.334207] CPU: 1 UID: 0 PID: 597 Comm: yavta Tainted: G        W           6.17.0-arm64-renesas-09711-g5173b0d6549f #52 PREEMPT
[   29.335683] Tainted: [W]=WARN
[   29.336058] Hardware name: Retronix Sparrow Hawk board based on r8a779g3 (DT)
[   29.336954] pstate: 404000c9 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.337831] pc : handle_irq_desc+0x3c/0x58
[   29.338348] lr : generic_handle_domain_irq+0x18/0x20
[   29.338975] sp : ffff8000824d3fd0
[   29.339393] x29: ffff8000824d3fd0 x28: ffff000443a9cf80 x27: 0000000000000001
[   29.340293] x26: 0000000000000000 x25: ffff800081751db8 x24: ffff800080123160
[   29.341193] x23: 0000000000400009 x22: ffff80008016c294 x21: ffff800083c438a0
[   29.342093] x20: 0000000000000000 x19: ffff800081684cd8 x18: 0000000000000010
[   29.342993] x17: ffff80063d8b5000 x16: ffff8000824d0000 x15: 0000000000000020
[   29.343893] x14: 0000000000000000 x13: 00000000ffff1060 x12: 00000000fffffffd
[   29.344793] x11: 0000000000000058 x10: 0000000000000018 x9 : 0000000000000040
[   29.345692] x8 : ffff000440013918 x7 : 0000000000000000 x6 : ffff0004404004b8
[   29.346592] x5 : ffff000440400490 x4 : ffff000440400588 x3 : ffff800081751db8
[   29.347492] x2 : 0000000000000000 x1 : 000000000a032a08 x0 : ffff000440100c00
[   29.348392] Call trace:
[   29.348702]  handle_irq_desc+0x3c/0x58 (P)
[   29.349220]  gic_handle_irq+0x48/0xc0
[   29.349683]  call_on_irq_stack+0x30/0x60
[   29.350180]  do_interrupt_handler+0x78/0x7c
[   29.350710]  el1_interrupt+0x34/0x50
[   29.351167]  el1h_64_irq_handler+0x14/0x1c
[   29.351686]  el1h_64_irq+0x6c/0x70
[   29.352116]  __srcu_check_read_flavor+0x54/0xe0 (P)
[   29.352734]  device_links_read_lock+0x20/0x60
[   29.353285]  __rpm_callback+0x14c/0x210
[   29.353771]  rpm_callback+0x6c/0x78
[   29.354213]  rpm_resume+0x50c/0x718
[   29.354655]  __pm_runtime_resume+0x48/0x88
[   29.355174]  vsp1_device_get+0x1c/0x84
[   29.355649]  vsp1_isp_start_streaming+0x7c/0x198
[   29.356233]  risp_core_start_streaming+0x318/0x440
[   29.356839]  risp_io_start_streaming+0x74/0x108
[   29.357413]  vb2_start_streaming+0x64/0x168
[   29.357941]  vb2_core_streamon+0xd0/0x1b8
[   29.358447]  vb2_ioctl_streamon+0x50/0x8c
[   29.358954]  v4l_streamon+0x20/0x28
[   29.359397]  __video_do_ioctl+0x344/0x3f0
[   29.359904]  video_usercopy+0x2e4/0x870
[   29.360390]  video_ioctl2+0x14/0x20
[   29.360832]  v4l2_ioctl+0x3c/0x60
[   29.361252]  __arm64_sys_ioctl+0x88/0xe0
[   29.361749]  invoke_syscall.constprop.0+0x3c/0xe4
[   29.362344]  el0_svc_common.constprop.0+0x34/0xcc
[   29.362938]  do_el0_svc+0x18/0x20
[   29.363359]  el0_svc+0x3c/0x2a0
[   29.363758]  el0t_64_sync_handler+0x98/0xe0
[   29.364288]  el0t_64_sync+0x154/0x158
[   29.364751] irq event stamp: 3935
[   29.365169] hardirqs last  enabled at (3935): [<ffff800080fa655c>] irqentry_exit+0x3c/0x180
[   29.366220] hardirqs last disabled at (3934): [<ffff800080fab110>] preempt_schedule_irq+0x70/0xa0
[   29.367338] softirqs last  enabled at (3930): [<ffff8000800c2478>] handle_softirqs+0x44c/0x4a0
[   29.368422] softirqs last disabled at (3919): [<ffff800080010270>] __do_softirq+0x10/0x18
[   29.369451] ---[ end trace 0000000000000000 ]---
[   29.370033] ------------[ cut here ]------------
[   29.370614] Unexpected interrupt (irqnr 26)
[   29.371159] WARNING: CPU: 1 PID: 597 at drivers/irqchip/irq-gic-v3.c:875 gic_handle_irq+0xb4/0xc0
[   29.372278] CPU: 1 UID: 0 PID: 597 Comm: yavta Tainted: G        W           6.17.0-arm64-renesas-09711-g5173b0d6549f #52 PREEMPT
[   29.373755] Tainted: [W]=WARN
[   29.374129] Hardware name: Retronix Sparrow Hawk board based on r8a779g3 (DT)
[   29.375026] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.375902] pc : gic_handle_irq+0xb4/0xc0
[   29.376409] lr : gic_handle_irq+0xb4/0xc0
[   29.376915] sp : ffff8000824d3fe0
[   29.377333] x29: ffff8000824d3fe0 x28: ffff000443a9cf80 x27: 0000000000000001
[   29.378233] x26: 0000000000000000 x25: ffff800081751db8 x24: ffff800080123160
[   29.379133] x23: 0000000000400009 x22: ffff80008016c294 x21: ffff800083c438a0
[   29.380033] x20: 0000000000000000 x19: ffff800081684cd8 x18: 000000000000000a
[   29.380933] x17: ffff80063d8b5000 x16: ffff8000824d0000 x15: 0720072007200720
[   29.381833] x14: 0720072007200720 x13: 0720072007200720 x12: 0720072007200720
[   29.382733] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800081777de0
[   29.383634] x8 : 0000000000057fa8 x7 : 000000000000031b x6 : ffff8000817cfde0
[   29.384534] x5 : ffff0006bef28448 x4 : ffff80063d8b5000 x3 : ffff000443a9cf80
[   29.385434] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000443a9cf80
[   29.386333] Call trace:
[   29.386643]  gic_handle_irq+0xb4/0xc0 (P)
[   29.387150]  call_on_irq_stack+0x30/0x60
[   29.387647]  do_interrupt_handler+0x78/0x7c
[   29.388176]  el1_interrupt+0x34/0x50
[   29.388630]  el1h_64_irq_handler+0x14/0x1c
[   29.389149]  el1h_64_irq+0x6c/0x70
[   29.389579]  __srcu_check_read_flavor+0x54/0xe0 (P)
[   29.390197]  device_links_read_lock+0x20/0x60
[   29.390748]  __rpm_callback+0x14c/0x210
[   29.391235]  rpm_callback+0x6c/0x78
[   29.391677]  rpm_resume+0x50c/0x718
[   29.392120]  __pm_runtime_resume+0x48/0x88
[   29.392638]  vsp1_device_get+0x1c/0x84
[   29.393114]  vsp1_isp_start_streaming+0x7c/0x198
[   29.393697]  risp_core_start_streaming+0x318/0x440
[   29.394305]  risp_io_start_streaming+0x74/0x108
[   29.394879]  vb2_start_streaming+0x64/0x168
[   29.395407]  vb2_core_streamon+0xd0/0x1b8
[   29.395914]  vb2_ioctl_streamon+0x50/0x8c
[   29.396421]  v4l_streamon+0x20/0x28
[   29.396863]  __video_do_ioctl+0x344/0x3f0
[   29.397372]  video_usercopy+0x2e4/0x870
[   29.397858]  video_ioctl2+0x14/0x20
[   29.398300]  v4l2_ioctl+0x3c/0x60
[   29.398720]  __arm64_sys_ioctl+0x88/0xe0
[   29.399218]  invoke_syscall.constprop.0+0x3c/0xe4
[   29.399814]  el0_svc_common.constprop.0+0x34/0xcc
[   29.400408]  do_el0_svc+0x18/0x20
[   29.400828]  el0_svc+0x3c/0x2a0
[   29.401228]  el0t_64_sync_handler+0x98/0xe0
[   29.401758]  el0t_64_sync+0x154/0x158
[   29.402221] irq event stamp: 3935
[   29.402639] hardirqs last  enabled at (3935): [<ffff800080fa655c>] irqentry_exit+0x3c/0x180
[   29.403690] hardirqs last disabled at (3934): [<ffff800080fab110>] preempt_schedule_irq+0x70/0xa0
[   29.404807] softirqs last  enabled at (3930): [<ffff8000800c2478>] handle_softirqs+0x44c/0x4a0
[   29.405893] softirqs last disabled at (3919): [<ffff800080010270>] __do_softirq+0x10/0x18
[   29.406922] ---[ end trace 0000000000000000 ]---
[   29.363758]  el0t_64_sync_handler+0x98/0xe0
[   29.364288]  el0t_64_sync+0x154/0x158
[   29.364751] irq event stamp: 3935
[   29.365169] hardirqs last  enabled at (3935): [<ffff800080fa655c>] irqentry_exit+0x3c/0x180
[   29.366220] hardirqs last disabled at (3934): [<ffff800080fab110>] preempt_schedule_irq+0x70/0xa0
[   29.367338] softirqs last  enabled at (3930): [<ffff8000800c2478>] handle_softirqs+0x44c/0x4a0
[   29.368422] softirqs last disabled at (3919): [<ffff800080010270>] __do_softirq+0x10/0x18
[   29.369451] ---[ end trace 0000000000000000 ]---
[   29.370033] ------------[ cut here ]------------
[   29.370614] Unexpected interrupt (irqnr 26)
[   29.371159] WARNING: CPU: 1 PID: 597 at drivers/irqchip/irq-gic-v3.c:875 gic_handle_irq+0xb4/0xc0
[   29.372278] CPU: 1 UID: 0 PID: 597 Comm: yavta Tainted: G        W           6.17.0-arm64-renesas-09711-g5173b0d6549f #52 PREEMPT
[   29.373755] Tainted: [W]=WARN
[   29.374129] Hardware name: Retronix Sparrow Hawk board based on r8a779g3 (DT)
[   29.375026] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.375902] pc : gic_handle_irq+0xb4/0xc0
[   29.376409] lr : gic_handle_irq+0xb4/0xc0
[   29.376915] sp : ffff8000824d3fe0
[   29.377333] x29: ffff8000824d3fe0 x28: ffff000443a9cf80 x27: 0000000000000001
[   29.378233] x26: 0000000000000000 x25: ffff800081751db8 x24: ffff800080123160
[   29.379133] x23: 0000000000400009 x22: ffff80008016c294 x21: ffff800083c438a0
[   29.380033] x20: 0000000000000000 x19: ffff800081684cd8 x18: 000000000000000a
[   29.380933] x17: ffff80063d8b5000 x16: ffff8000824d0000 x15: 0720072007200720
[   29.381833] x14: 0720072007200720 x13: 0720072007200720 x12: 0720072007200720
[   29.382733] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800081777de0
[   29.383634] x8 : 0000000000057fa8 x7 : 000000000000031b x6 : ffff8000817cfde0
[   29.384534] x5 : ffff0006bef28448 x4 : ffff80063d8b5000 x3 : ffff000443a9cf80
[   29.385434] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000443a9cf80
[   29.386333] Call trace:
[   29.386643]  gic_handle_irq+0xb4/0xc0 (P)
[   29.387150]  call_on_irq_stack+0x30/0x60
[   29.387647]  do_interrupt_handler+0x78/0x7c
[   29.388176]  el1_interrupt+0x34/0x50
[   29.388630]  el1h_64_irq_handler+0x14/0x1c
[   29.389149]  el1h_64_irq+0x6c/0x70
[   29.389579]  __srcu_check_read_flavor+0x54/0xe0 (P)
[   29.390197]  device_links_read_lock+0x20/0x60
[   29.390748]  __rpm_callback+0x14c/0x210
[   29.391235]  rpm_callback+0x6c/0x78
[   29.391677]  rpm_resume+0x50c/0x718
[   29.392120]  __pm_runtime_resume+0x48/0x88
[   29.392638]  vsp1_device_get+0x1c/0x84
[   29.393114]  vsp1_isp_start_streaming+0x7c/0x198
[   29.393697]  risp_core_start_streaming+0x318/0x440
[   29.394305]  risp_io_start_streaming+0x74/0x108
[   29.394879]  vb2_start_streaming+0x64/0x168
[   29.395407]  vb2_core_streamon+0xd0/0x1b8
[   29.395914]  vb2_ioctl_streamon+0x50/0x8c
[   29.396421]  v4l_streamon+0x20/0x28
[   29.396863]  __video_do_ioctl+0x344/0x3f0
[   29.397372]  video_usercopy+0x2e4/0x870
[   29.397858]  video_ioctl2+0x14/0x20
[   29.398300]  v4l2_ioctl+0x3c/0x60
[   29.398720]  __arm64_sys_ioctl+0x88/0xe0
[   29.399218]  invoke_syscall.constprop.0+0x3c/0xe4
[   29.399814]  el0_svc_common.constprop.0+0x34/0xcc
[   29.400408]  do_el0_svc+0x18/0x20
[   29.400828]  el0_svc+0x3c/0x2a0
[   29.401228]  el0t_64_sync_handler+0x98/0xe0
[   29.401758]  el0t_64_sync+0x154/0x158
[   29.402221] irq event stamp: 3935
[   29.402639] hardirqs last  enabled at (3935): [<ffff800080fa655c>] irqentry_exit+0x3c/0x180
[   29.403690] hardirqs last disabled at (3934): [<ffff800080fab110>] preempt_schedule_irq+0x70/0xa0
[   29.404807] softirqs last  enabled at (3930): [<ffff8000800c2478>] handle_softirqs+0x44c/0x4a0
[   29.405893] softirqs last disabled at (3919): [<ffff800080010270>] __do_softirq+0x10/0x18
[   29.406922] ---[ end trace 0000000000000000 ]---

>  
>  	/* Release module from reset state */
>  	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
> -- 
> 2.51.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

