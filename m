Return-Path: <linux-renesas-soc+bounces-20574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724CB28CD9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 12:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938331CC5129
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 10:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9A1291C09;
	Sat, 16 Aug 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CfL6pN4Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849628FFC2
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755340115; cv=none; b=e0IN1Am0uHhMTy27Dh3c9YcDj33yBERMOpCCcmT1GxT/D9FGWhhngDAseSORmycoOAwljr+5kce7oEt3LJ5AorYubqtfIb2BwrZR4Jiv8g4UzMuK0QyhTYbNqcPPspiCTu0D0DHrUmfhcfvOsJ4Wyz1iGbquazkajZfDnf4dltU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755340115; c=relaxed/simple;
	bh=M27dDn9ubdQQdmD+XfPR8sXcJOZh8/obVDeIaeOJP/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dCRRojiZ1J/R4Ke3Iee8IEwWtfe5jt4kPv6xOafxbG+f2W1wbTyJsFwJfo56o0w2V6AOp+9OYEFMRbaJuUCURGs2k01y+RHs8TSJ5reh/I9QauTmeVUNC7SCz4tcPO5nnB6vE1rey/lZSwVMMjZbQUDsPHKydseRLCPA4nNype8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CfL6pN4Z; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9170db547so1579693f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Aug 2025 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755340111; x=1755944911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oXh81VKf/4Dbcz4RJiYvjkoUvnAUmKw8U6C7gKFu26o=;
        b=CfL6pN4Z97zlxaWSAEIIkUAi4Q7aehjNll5ZIxE9PbdP89iaNrOTE7KrQoR9iovf3r
         heJHrQN3MnMIWgi4XwsgBmWpS8i6guPJiu7RDKx4ol81PYurMEXCAdjwSKfpXmlMRo7b
         IDLYp5NeTC5DL6b1Ob//ALcqRMGAHG52wmejYxUBiCYisIznz7SpGKQ1lZa3OVEEdwZj
         L2EZFTAhF9cfMlUOnbOxc6u6KTe21L4TfIdu/aikuTs14AyuoUTF4zpGn+ACt7t2FOtx
         aAqDIkBfy8pB/eWNwFG0bIhQK698WSqVn5vRAIwUjPFzE7kFQndgGH05DAibVTisbMcI
         eOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755340111; x=1755944911;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXh81VKf/4Dbcz4RJiYvjkoUvnAUmKw8U6C7gKFu26o=;
        b=tvHPHRPm724L8FBO54yHwQvMasmSZXkUMZ1WGx7SiNaKHJ6F7WBgUjzSHIbEET0FjJ
         Y4/OqejTFt8xxPCLjAgwqOOarzm7OI5qu6da5g2s6VQKtTlIvfRXqh8zE3bfgWVqD6z9
         fvo7P1Ll637qpReEsqyNO+FK2uRjWBfgIh2kLnBdSprPXujZcfqJR8rd1HU0Bh5ZWOaU
         qUB1ETDJEYgvk9NnqJlNl91aR8Ge+yYCeWuKY78wNpxp3y3spLM4auAA+0V4mQeSXjZn
         XD1dbZGCTGsh3XfZrTWBAbaN083rbobtt3JNQ9ZU3d8w7twN65K/nbbPo9KGV5JimJlN
         FZGg==
X-Forwarded-Encrypted: i=1; AJvYcCV62AR/RV72zaY1JiPNUD1WpQ1g5rH5WPx/BEGhiizqwgiVDKpuRoTqCktuJ1hJKLtwKnbKipQtQeygzOU+dK+C1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl9eWpthMVrWiiEPPt5v8IGU107R3/8hGEAiza5W6x6k501MWQ
	te/XuyDdrSC7zVcJwcEcX1+CWN0E16asyL2T+gkxrMHefG99zcG43GSajc8b7w/dqlw=
X-Gm-Gg: ASbGncuSu7uI2gdQzKdtexgRQDoddC1LNFLBhUuWjmFbkg+aVMZlqK9ai3k7r5xRqMC
	giBeAu0DJ7SEWo5NnXL2o5Jnlywkmnh0ExHt6ahKemb8XNVopcibTRQS4Ome4G/3AFSXezhfrQR
	n676UXGHKe8JEtmx18kDMh4MLV+8HunPX4zYWAOVnJE9KNTV2GkfUUPCqcICqJyUmhGT1hqpeoJ
	ZHegHAmWCaHNoggS1SvY3ffLMpLuChgC89ZfPcpDJml7PggSJBE27dwBF8fppvJpOwREtnl/p9c
	KpVw82Mrvv5NolONJflUkuotSqXPp5VTSftGIDsyz7pPJDKOLwAoYO3zo0seZB+3ZdevJ3WLy2u
	sOpGa3ZyczYZL4muBys85gjMG64s5dyC9ye07+z986/M=
X-Google-Smtp-Source: AGHT+IGficK1F5saavRVPWTAr0TpxR29hX57+5MvmQ1Uy0vcX036uC8t1FcIRPlsb5Lhb78Ct3ryAg==
X-Received: by 2002:a05:6000:2f84:b0:3b8:d337:cc2d with SMTP id ffacd0b85a97d-3ba508eb0b2mr7593550f8f.18.1755340111506;
        Sat, 16 Aug 2025 03:28:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb676c971bsm5185226f8f.32.2025.08.16.03.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:28:31 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:28:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Biju <biju.das.au@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod
 clocks
Message-ID: <202508160958.ounSAlER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124832.76266-3-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju/clk-renesas-rzv2h-Refactor-rzv2h_cpg_fixed_mod_status_clk_register/20250814-205111
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20250814124832.76266-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod clocks
config: hexagon-randconfig-r072-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160958.ounSAlER-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508160958.ounSAlER-lkp@intel.com/

New smatch warnings:
drivers/clk/renesas/rzv2h-cpg.c:875 rzv2h_cpg_register_mod_clk() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +875 drivers/clk/renesas/rzv2h-cpg.c

dd22e56217495e Lad Prabhakar 2024-07-29  770  static void __init
dd22e56217495e Lad Prabhakar 2024-07-29  771  rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
dd22e56217495e Lad Prabhakar 2024-07-29  772  			   struct rzv2h_cpg_priv *priv)
dd22e56217495e Lad Prabhakar 2024-07-29  773  {
dd22e56217495e Lad Prabhakar 2024-07-29  774  	struct mod_clock *clock = NULL;
dd22e56217495e Lad Prabhakar 2024-07-29  775  	struct device *dev = priv->dev;
dd22e56217495e Lad Prabhakar 2024-07-29  776  	struct clk_init_data init;
dd22e56217495e Lad Prabhakar 2024-07-29  777  	struct clk *parent, *clk;
dd22e56217495e Lad Prabhakar 2024-07-29  778  	const char *parent_name;
dd22e56217495e Lad Prabhakar 2024-07-29  779  	unsigned int id;
dd22e56217495e Lad Prabhakar 2024-07-29  780  	int ret;
dd22e56217495e Lad Prabhakar 2024-07-29  781  
dd22e56217495e Lad Prabhakar 2024-07-29  782  	id = GET_MOD_CLK_ID(priv->num_core_clks, mod->on_index, mod->on_bit);
dd22e56217495e Lad Prabhakar 2024-07-29  783  	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  784  	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  785  	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
dd22e56217495e Lad Prabhakar 2024-07-29  786  
dd22e56217495e Lad Prabhakar 2024-07-29  787  	parent = priv->clks[mod->parent];
dd22e56217495e Lad Prabhakar 2024-07-29  788  	if (IS_ERR(parent)) {
dd22e56217495e Lad Prabhakar 2024-07-29  789  		clk = parent;
dd22e56217495e Lad Prabhakar 2024-07-29  790  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  791  	}
dd22e56217495e Lad Prabhakar 2024-07-29  792  
dd22e56217495e Lad Prabhakar 2024-07-29  793  	clock = devm_kzalloc(dev, sizeof(*clock), GFP_KERNEL);
dd22e56217495e Lad Prabhakar 2024-07-29  794  	if (!clock) {
dd22e56217495e Lad Prabhakar 2024-07-29  795  		clk = ERR_PTR(-ENOMEM);
dd22e56217495e Lad Prabhakar 2024-07-29  796  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  797  	}
dd22e56217495e Lad Prabhakar 2024-07-29  798  
dd22e56217495e Lad Prabhakar 2024-07-29  799  	init.name = mod->name;
dd22e56217495e Lad Prabhakar 2024-07-29  800  	init.ops = &rzv2h_mod_clock_ops;
dd22e56217495e Lad Prabhakar 2024-07-29  801  	init.flags = CLK_SET_RATE_PARENT;
dd22e56217495e Lad Prabhakar 2024-07-29  802  	if (mod->critical)
dd22e56217495e Lad Prabhakar 2024-07-29  803  		init.flags |= CLK_IS_CRITICAL;
dd22e56217495e Lad Prabhakar 2024-07-29  804  
dd22e56217495e Lad Prabhakar 2024-07-29  805  	parent_name = __clk_get_name(parent);
dd22e56217495e Lad Prabhakar 2024-07-29  806  	init.parent_names = &parent_name;
dd22e56217495e Lad Prabhakar 2024-07-29  807  	init.num_parents = 1;
dd22e56217495e Lad Prabhakar 2024-07-29  808  
dd22e56217495e Lad Prabhakar 2024-07-29  809  	clock->on_index = mod->on_index;
dd22e56217495e Lad Prabhakar 2024-07-29  810  	clock->on_bit = mod->on_bit;
dd22e56217495e Lad Prabhakar 2024-07-29  811  	clock->mon_index = mod->mon_index;
dd22e56217495e Lad Prabhakar 2024-07-29  812  	clock->mon_bit = mod->mon_bit;
03108a2614ecab Lad Prabhakar 2024-12-02  813  	clock->no_pm = mod->no_pm;
899e7ede4c19c6 Lad Prabhakar 2025-05-09  814  	clock->ext_clk_mux_index = mod->ext_clk_mux_index;
dd22e56217495e Lad Prabhakar 2024-07-29  815  	clock->priv = priv;
dd22e56217495e Lad Prabhakar 2024-07-29  816  	clock->hw.init = &init;
9b6e63a777ea5f Biju Das      2024-12-13  817  	clock->mstop_data = mod->mstop_data;
dd22e56217495e Lad Prabhakar 2024-07-29  818  
dd22e56217495e Lad Prabhakar 2024-07-29  819  	ret = devm_clk_hw_register(dev, &clock->hw);
dd22e56217495e Lad Prabhakar 2024-07-29  820  	if (ret) {
dd22e56217495e Lad Prabhakar 2024-07-29  821  		clk = ERR_PTR(ret);
dd22e56217495e Lad Prabhakar 2024-07-29  822  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  823  	}
dd22e56217495e Lad Prabhakar 2024-07-29  824  
dd22e56217495e Lad Prabhakar 2024-07-29  825  	priv->clks[id] = clock->hw.clk;
18610e6bf54faa Biju Das      2025-08-14  826  	if (mod->child_name) {
18610e6bf54faa Biju Das      2025-08-14  827  		WARN_DEBUG(mod->child >= priv->num_core_clks);
18610e6bf54faa Biju Das      2025-08-14  828  		WARN_DEBUG(PTR_ERR(priv->clks[mod->child]) != -ENOENT);
18610e6bf54faa Biju Das      2025-08-14  829  
18610e6bf54faa Biju Das      2025-08-14  830  		clk = rzv2h_cpg_mod_status_clk_register(priv, mod->child_name, mod->name, 1, 1,
18610e6bf54faa Biju Das      2025-08-14  831  							FIXED_MOD_CONF_PACK(mod->mon_index,
18610e6bf54faa Biju Das      2025-08-14  832  									    mod->mon_bit));
18610e6bf54faa Biju Das      2025-08-14  833  		if (IS_ERR_OR_NULL(clk))
18610e6bf54faa Biju Das      2025-08-14  834  			goto fail;

This isn't how IS_ERR_OR_NULL() is supposed to work...  :(  The NULL should
be treated like success, it shouldn't print an error message, unless it's
something like:

	WARN_ON_ONCE(!clk); // rzv2h_cpg_mod_status_clk_register() is buggy

I have written a blog about how how IS_ERR_OR_NULL() is supposed to work:
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

18610e6bf54faa Biju Das      2025-08-14  835  		priv->clks[mod->child] = clk;
18610e6bf54faa Biju Das      2025-08-14  836  	}
dd22e56217495e Lad Prabhakar 2024-07-29  837  
9b6e63a777ea5f Biju Das      2024-12-13  838  	/*
9b6e63a777ea5f Biju Das      2024-12-13  839  	 * Ensure the module clocks and MSTOP bits are synchronized when they are
9b6e63a777ea5f Biju Das      2024-12-13  840  	 * turned ON by the bootloader. Enable MSTOP bits for module clocks that were
9b6e63a777ea5f Biju Das      2024-12-13  841  	 * turned ON in an earlier boot stage.
9b6e63a777ea5f Biju Das      2024-12-13  842  	 */
9b6e63a777ea5f Biju Das      2024-12-13  843  	if (clock->mstop_data != BUS_MSTOP_NONE &&
9b6e63a777ea5f Biju Das      2024-12-13  844  	    !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw)) {
9b6e63a777ea5f Biju Das      2024-12-13  845  		rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
9b6e63a777ea5f Biju Das      2024-12-13  846  	} else if (clock->mstop_data != BUS_MSTOP_NONE && mod->critical) {
9b6e63a777ea5f Biju Das      2024-12-13  847  		unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, clock->mstop_data);
9b6e63a777ea5f Biju Das      2024-12-13  848  		u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, clock->mstop_data);
69ac2acd209a15 Biju Das      2025-02-22  849  		atomic_t *mstop = &priv->mstop_count[mstop_index * 16];
9b6e63a777ea5f Biju Das      2024-12-13  850  		unsigned long flags;
9b6e63a777ea5f Biju Das      2024-12-13  851  		unsigned int i;
9b6e63a777ea5f Biju Das      2024-12-13  852  		u32 val = 0;
9b6e63a777ea5f Biju Das      2024-12-13  853  
9b6e63a777ea5f Biju Das      2024-12-13  854  		/*
9b6e63a777ea5f Biju Das      2024-12-13  855  		 * Critical clocks are turned ON immediately upon registration, and the
9b6e63a777ea5f Biju Das      2024-12-13  856  		 * MSTOP counter is updated through the rzv2h_mod_clock_enable() path.
9b6e63a777ea5f Biju Das      2024-12-13  857  		 * However, if the critical clocks were already turned ON by the initial
9b6e63a777ea5f Biju Das      2024-12-13  858  		 * bootloader, synchronize the atomic counter here and clear the MSTOP bit.
9b6e63a777ea5f Biju Das      2024-12-13  859  		 */
9b6e63a777ea5f Biju Das      2024-12-13  860  		spin_lock_irqsave(&priv->rmw_lock, flags);
9b6e63a777ea5f Biju Das      2024-12-13  861  		for_each_set_bit(i, &mstop_mask, 16) {
9b6e63a777ea5f Biju Das      2024-12-13  862  			if (atomic_read(&mstop[i]))
9b6e63a777ea5f Biju Das      2024-12-13  863  				continue;
9b6e63a777ea5f Biju Das      2024-12-13  864  			val |= BIT(i) << 16;
9b6e63a777ea5f Biju Das      2024-12-13  865  			atomic_inc(&mstop[i]);
9b6e63a777ea5f Biju Das      2024-12-13  866  		}
9b6e63a777ea5f Biju Das      2024-12-13  867  		if (val)
9b6e63a777ea5f Biju Das      2024-12-13  868  			writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
9b6e63a777ea5f Biju Das      2024-12-13  869  		spin_unlock_irqrestore(&priv->rmw_lock, flags);
9b6e63a777ea5f Biju Das      2024-12-13  870  	}
9b6e63a777ea5f Biju Das      2024-12-13  871  
dd22e56217495e Lad Prabhakar 2024-07-29  872  	return;
dd22e56217495e Lad Prabhakar 2024-07-29  873  
dd22e56217495e Lad Prabhakar 2024-07-29  874  fail:
dd22e56217495e Lad Prabhakar 2024-07-29 @875  	dev_err(dev, "Failed to register module clock %s: %ld\n",
dd22e56217495e Lad Prabhakar 2024-07-29  876  		mod->name, PTR_ERR(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  877  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


