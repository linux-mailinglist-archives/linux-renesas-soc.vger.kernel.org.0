Return-Path: <linux-renesas-soc+bounces-26174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B4CE897A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 03:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2BA03009F92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 02:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688FE24678F;
	Tue, 30 Dec 2025 02:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nFFs78Kj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742091AA7BF;
	Tue, 30 Dec 2025 02:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062908; cv=none; b=OrORoSyKUdaxsEvtfEL3JZme11lRijf/6I+jLVJWXuwuniu6vFAH4Y6dDQx9qQmHXK9JWZBeHnp+s5XszCB10MWTxoX1Oyj5v8/EczqIGxHkCWAt5ScA5C0G+HbFzo237zrWXtKd9rkjFGXF6pg5I6JBJDhLpyq22MoFEcZabsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062908; c=relaxed/simple;
	bh=aiplG+jeWv13uY69nZrnVyIdUmnkujRRtJX9xzcPdr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahKdTnqxPUh5sQDCSv7rAocp2Tq50tDrQme31eWsH8UJfE/4MRyzeS0kIq8mNaXoaHvXaFfx4AF9c5y/Ds5m7J3f2rcg+MwW/SZu/dpgxRCmGzv4aBJ7E9CJdC95ZOTIuAgKNOgfhyOPFCXhlqfxNRJPRVWdU8d2qChlNlGvzJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nFFs78Kj; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dgHZt46RNz9tWv;
	Tue, 30 Dec 2025 03:48:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767062902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwS0sCOL97hx9v2sIlHXx4kDZ6uLqIofr0CHKMWhvKs=;
	b=nFFs78KjTvQbuA19t2YBxfM+8syKGilJRaPpDzIOpo2rYsV/cSwr3qOoYRoSSEo77i/zR0
	4i09mb16dw9JkmEgBqvO1DlxK1/tgqo7FsY5OxdQmFqWxAJ2xgDqszzM5xGciJ5eBHDaaQ
	IXTIUJ7QR7XgLEpjStzI5eIkU2BNnxD0PmjRrmmi2PeQ+sL+zvRJGneAMbPSfZ5tIVG6cx
	7P6IoYEkwy8TIZ1WdOEiKN8rjPMCNvRrPKk5UatZxbnYJabXqlxDuqpTRmLc8zVg4suIyN
	sC/ji50OjW9y/M198D8eZCBhSrmiqltNSfDYZKlRwqfQbsFzbaRD8mNun8yRuA==
Message-ID: <84f21e62-c167-4b7f-8727-bdca04eede5e@mailbox.org>
Date: Tue, 30 Dec 2025 03:47:17 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value
 too large for the field
To: kernel test robot <lkp@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>
References: <202512051834.bESvhDiG-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202512051834.bESvhDiG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 091917b2a1cf2496b9f
X-MBO-RS-META: 8x7c11goit6xgfbuswjucqzfkpouwdh6

On 12/5/25 11:16 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2061f18ad76ecaddf8ed17df81b8611ea88dbddd
> commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> date:   5 weeks ago
> config: arc-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from <command-line>:
>     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.4':
>>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value too large for the field

[...]

>     rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
>        vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
>                   ^~~~~~~~~~~~~~~
I don't think this condition can occur.

In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
- rcar_mipi_dsi_startup() calls rcar_mipi_dsi_parameters_calc() which is 
the only site that assigns setup_info.vclk_divider this way:

  415         switch (dsi->info->model) {
  416         case RCAR_DSI_V3U:
  417         default:
  418                 setup_info->vclk_divider = 1 << 
((clk_cfg->vco_cntrl >> 4) & 0x3);
  419                 break;
  420
  421         case RCAR_DSI_V4H:
  422                 setup_info->vclk_divider = 1 << 
(((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
  423                 break;
  424         }

In case of V3U, vclk_divider is 1 << (0..3) .
In case of V4H, vclk_divider is 1 << (1..8) .

In drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c :
- rcar_mipi_dsi_startup() later contains the offending code:

  653         switch (dsi->info->model) {
  654         case RCAR_DSI_V3U:
  655         default:
  656                 vclkset |= 
VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
  657                 break;
  658
  659         case RCAR_DSI_V4H:
  660                 vclkset |= 
VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
  661                 break;
  662         }

This does the reverse of the code that assigned the value above, so:

In case of V3U, field value is (0..3) .
In case of V4H, field value is (0..7) .

Finally in drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h :

256 #define VCLKSET_DIV_V3U_MASK            GENMASK_U32(5, 4)
257 #define VCLKSET_DIV_V3U(n) 
FIELD_PREP(VCLKSET_DIV_V3U_MASK, (n))
258 #define VCLKSET_DIV_V4H_MASK            GENMASK_U32(6, 4)
259 #define VCLKSET_DIV_V4H(n) 
FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))

The masks fit exactly. For V3U the mask is 2-bit, or V4H the mask is 3-bit .

...

I can however rewrite the code in this way, which should also mitigate 
this warning. Do you think this makes the code any better ?

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c 
b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 4ef2e3c129ed7..20e2a4cae5b86 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -84,7 +84,6 @@ struct dsi_setup_info {
  	unsigned long fout;
  	u16 m;
  	u16 n;
-	u16 vclk_divider;
  	const struct dsi_clk_config *clkset;
  };

@@ -338,7 +337,8 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct 
rcar_mipi_dsi *dsi,
  static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
  				   unsigned long fin_rate,
  				   unsigned long fout_target,
-				   struct dsi_setup_info *setup_info)
+				   struct dsi_setup_info *setup_info,
+				   u16 vclk_divider)
  {
  	unsigned int best_err = -1;
  	const struct rcar_mipi_dsi_device_info *info = dsi->info;
@@ -391,6 +391,7 @@ static void rcar_mipi_dsi_parameters_calc(struct 
rcar_mipi_dsi *dsi,
  	unsigned long fin_rate;
  	unsigned int i;
  	unsigned int err;
+	u16 vclk_divider;

  	/*
  	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
@@ -415,15 +416,15 @@ static void rcar_mipi_dsi_parameters_calc(struct 
rcar_mipi_dsi *dsi,
  	switch (dsi->info->model) {
  	case RCAR_DSI_V3U:
  	default:
-		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
+		vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
  		break;

  	case RCAR_DSI_V4H:
-		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
+		vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
  		break;
  	}

-	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
+	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, 
vclk_divider);

  	/* Find hsfreqrange */
  	setup_info->hsfreq = setup_info->fout * 2;
@@ -439,7 +440,7 @@ static void rcar_mipi_dsi_parameters_calc(struct 
rcar_mipi_dsi *dsi,
  	dev_dbg(dsi->dev,
  		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error 
%d.%02u%%)\n",
  		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
-		setup_info->vclk_divider, setup_info->fout, fout_target,
+		vclk_divider, setup_info->fout, fout_target,
  		err / 100, err % 100);

  	dev_dbg(dsi->dev,
@@ -653,11 +654,11 @@ static int rcar_mipi_dsi_startup(struct 
rcar_mipi_dsi *dsi,
  	switch (dsi->info->model) {
  	case RCAR_DSI_V3U:
  	default:
-		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
+		vclkset |= VCLKSET_DIV_V3U((clk_cfg->vco_cntrl >> 4) & 0x3);
  		break;

  	case RCAR_DSI_V4H:
-		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
+		vclkset |= VCLKSET_DIV_V4H((clk_cfg->vco_cntrl >> 3) & 0x7);
  		break;
  	}

