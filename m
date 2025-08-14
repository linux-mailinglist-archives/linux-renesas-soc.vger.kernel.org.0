Return-Path: <linux-renesas-soc+bounces-20517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E42EAB265DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 14:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF6B85C7262
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 12:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32CC2FE057;
	Thu, 14 Aug 2025 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnAy88km"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B561D24293B;
	Thu, 14 Aug 2025 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755175720; cv=none; b=a74GKiNaBOAb/4tFZxyl7lU5eYFeaAUKFN0YIMSVIBuqdex9fCaBa1uIr4Yfrf729m1YfhINdDP456GjHciYtj1pyoXEOP4nOqzE6LeQzX/s+r5dP97+N8zlN/A7ETrvp78IXMhOKZp9d7JZ9VQfF+BdqlDWG6vmFXPpYjzzTjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755175720; c=relaxed/simple;
	bh=XSe0V8MLhH2HlFlJvwyMfNeYoe+2+dS5ILUTWSTsNPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kU01kDsS+7VDTEH4ihbr46QkB9Q0iAl5ovUQoPXTtt5JTVzCAPTCWUhzitSndpSX7HoYned+HaQgksRSZmOqj3r6QRM5fNGjcM+oGpBZ4NFA7hv6kg3DvL0TfxjkFoN2evBFQLEZv5pqN/cRQfirilwrtBQ4UfKkCD5Ao/cK/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnAy88km; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9dc55d84bso642455f8f.1;
        Thu, 14 Aug 2025 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755175716; x=1755780516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IOsYpuc+gFahPrqV4W2kmQzQr0ECc1GeZgnVfqjGic=;
        b=dnAy88kmqlLZj7SULeY1VZ7+fGUCL8LtZzb3a3lIEzPRPPnDERxKrr0JbwjrElp7FN
         m8yqXA/bsiFe0Zk/Pseigu5n6kIp42o9I8esJGoBYxZxd46GP9vNZhA7gxFTiV8l4nMr
         lepDvXFvvy/2dhA9ssS02KHTwj0eaLba3Tsx02CJaoq4bDaQXDiEl1QtI1xK6aji4Ywh
         BchdkQ8rKvC5RaHUISVkK6AvHrGZQB1BbC08GDKk5iXxl3Dba4MRugskLuItTiYoCfTn
         vL3acKI2NwXD7affFKTdXPJSdcmOQyEc2Sn+ekgAJzHvtobfgasKwXC4FtJp0z9yGcl0
         O0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755175716; x=1755780516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IOsYpuc+gFahPrqV4W2kmQzQr0ECc1GeZgnVfqjGic=;
        b=Qtl2kb3aV6IL7RzaIX0CJili7DuCYCMzED8N4wJhzqBYAKolcxqKWd1oGn+YJ8OO89
         0KrwgZzhZWaGbHQ5HMQ/II8U10cUnX+RMYcDjoxAPODCL5juOhITmemZDF19LYCD932Y
         hA9wn+ajgw9Xfj/9pzTtCC/CfUENmmqiJss+Oet74icd1IyT0V7HlZwMqH2BrzrMHgwm
         5SQiCsrEv7qnvJeHqtxPP25AvZ/uCQC6Bsj379n8XgCvMom3bPPpJ43X3v6c/1qMa8Ad
         unvOfo1y8McNuP19UuLgXvo+ks9VavCW1ylnVFWGiig+omiXucMoxa22sLrbKlX7PXZ+
         aphg==
X-Forwarded-Encrypted: i=1; AJvYcCU4BVXkE21Xeo6h4jNcP3mj4pvOT7ydxMAr8rI58M9MWFw8+qprkh/doF0qnxuL8PW9khXQN/+L7MvvJ51yOU7Lyr8=@vger.kernel.org, AJvYcCVRkpBcauKPc8n9LlA6RJWtDVI/KjadkMAn5CYQi1Rx2ZicXxC3H+Qq+hg2RmGy41TqWauJTm+Ox/tGlRBC@vger.kernel.org, AJvYcCWbXHk0YJFEvp80fITmwkA203Rl3DDh0YK+LGP7HVyKdcFEem0olnoEgX+2gueIRf/YSCBodKQjN30=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/yOGgOVFI3ZFKx97aQNwXjYp8sUEXS5WxL35NdSnzeqI9hod
	hclxo4VTF8afBA+uzgghJdHUC3GBJk+PC0okMo2uTxtbCTaH+FBie/kO3CvyXIAlNLs=
X-Gm-Gg: ASbGncv8jDltnwocyUbM4vfESBuRp6fJ3YkkoqmHgT3enONRDPgtGi4np7AmEgCRF1y
	g+9IM4vKPsjNBvgrK1GFXlIK9Lg+S9q8DW9EX+7Sali/JtsTEZJ6Bjaic5X3AT5hvR4Lk1a9CR4
	LuVUVSgSeTcqZ+u/sqHeGbkKlemt20awZ7Ft2x5yqoJbjeGtpr5x20TPCk6G3n1IazD8OQz1RH9
	m8a9+GnEhMO/rpNkW8J8xCmCxna6xH/gI2MbdlG24hRaQWjnGTxyCWjpGnZ1/A5tzn8Iet8t5lZ
	s056PS1CkSHrr5IoAF1r0ehn5znrAOelCMt8NB4VATXXK00xsLc4ttvYupapjgLHYvYPGQIkTHD
	aFi2WwLyA7MOpE+W1sZIQxA3RMF2lzf3lpgIX7+HpXy3jhSH+tcYWNcozT+F3zWnWzx/87kxFhg
	==
X-Google-Smtp-Source: AGHT+IH3gxPmXCwnz6UNFaUhSxOE+0j5Fw1d2yI0ksz9X1Chn/AtX++SdWMdU0HXyhRJLstSJVQKoA==
X-Received: by 2002:a05:6000:18ad:b0:3b4:9721:2b2b with SMTP id ffacd0b85a97d-3b9e415b2c7mr2880594f8f.12.1755175716355;
        Thu, 14 Aug 2025 05:48:36 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c466838sm53497380f8f.49.2025.08.14.05.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 05:48:36 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod clocks
Date: Thu, 14 Aug 2025 13:48:25 +0100
Message-ID: <20250814124832.76266-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
References: <20250814124832.76266-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for parent mod clock to register core clocks that has a
parent module clock on the Renesas RZ/G3E SoC (eg: GPT has two clocks
bus clock and core clock. The core clock is controlled by the bus
clock).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 11 +++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 22 +++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 8511b7154e90..43fd3fadc5f7 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -823,6 +823,17 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	}
 
 	priv->clks[id] = clock->hw.clk;
+	if (mod->child_name) {
+		WARN_DEBUG(mod->child >= priv->num_core_clks);
+		WARN_DEBUG(PTR_ERR(priv->clks[mod->child]) != -ENOENT);
+
+		clk = rzv2h_cpg_mod_status_clk_register(priv, mod->child_name, mod->name, 1, 1,
+							FIXED_MOD_CONF_PACK(mod->mon_index,
+									    mod->mon_bit));
+		if (IS_ERR_OR_NULL(clk))
+			goto fail;
+		priv->clks[mod->child] = clk;
+	}
 
 	/*
 	 * Ensure the module clocks and MSTOP bits are synchronized when they are
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 840eed25aeda..c4205c8fd426 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -235,8 +235,10 @@ enum clk_types {
  */
 struct rzv2h_mod_clk {
 	const char *name;
+	const char *child_name;
 	u32 mstop_data;
 	u16 parent;
+	u16 child;
 	bool critical;
 	bool no_pm;
 	u8 on_index;
@@ -247,11 +249,13 @@ struct rzv2h_mod_clk {
 };
 
 #define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, \
-		     _onbit, _monindex, _monbit, _ext_clk_mux_index) \
+		     _onbit, _monindex, _monbit, _ext_clk_mux_index, _childname, _child) \
 	{ \
 		.name = (_name), \
+		.child_name = (_childname), \
 		.mstop_data = (_mstop), \
 		.parent = (_parent), \
+		.child = (_child), \
 		.critical = (_critical), \
 		.no_pm = (_no_pm), \
 		.on_index = (_onindex), \
@@ -262,18 +266,26 @@ struct rzv2h_mod_clk {
 	}
 
 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, -1)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, \
+		     _monbit, -1, NULL, 0)
 
 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit, -1)
+	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, \
+		     _monbit, -1, NULL, 0)
 
 #define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit, -1)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, \
+		     _monbit, -1, NULL, 0)
 
 #define DEF_MOD_MUX_EXTERNAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop, \
 			     _ext_clk_mux_index) \
 	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
-		     _ext_clk_mux_index)
+		     _ext_clk_mux_index, NULL, 0)
+
+#define DEF_MOD_PARENT(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop, \
+			     _child_name, _child) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
+		     -1, _child_name, _child)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.43.0


