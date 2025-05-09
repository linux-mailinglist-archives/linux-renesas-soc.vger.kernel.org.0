Return-Path: <linux-renesas-soc+bounces-16907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D3AB19AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 18:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9CBD7BED8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517BB23C50E;
	Fri,  9 May 2025 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pj2ynAPo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2B7234963;
	Fri,  9 May 2025 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806492; cv=none; b=fjvhLO1tyakqJftw3s78xtzDfSpwu1OKYDaQ5a5KQHl+EL6mPqaD0vNYZENJM9ysUD3H8szqmqkHdkvyuoCgCrQJNNx+CKNzU03t+sJqW0v82tpgTdb6lvkL9a8jipOkWnCYSnAqEFpLCeIHKV6X96Crg1iF/77Ik7NAAt+Md60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806492; c=relaxed/simple;
	bh=eQIrze0jz0EvbjxbFrC0VFPtZEWt21mD/DOg57gfK3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERibxGuoSbHAq4eED2RvB603n+N6Z6uaNXjzgplbcqbvzW6rr2cfuhmS6bJb42gkZEHL7q8Bl28sLfZ4B2Cpxd7WW97nTZaN+OeXw/Uxmd+oM0nwBGeq5F3Vbl1YmV8ywkTX9iT6aH8zK1WAZRVTrEokiwMYJzBfCbY6gElzFwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pj2ynAPo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edb40f357so15386385e9.0;
        Fri, 09 May 2025 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806488; x=1747411288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJ6saQ7qIUfM+N2A7SWL/TBeypbGkiU0nwAzmg1zqkI=;
        b=Pj2ynAPoNdRkYZdz4Ckz0b8gXZs3MwQwTObnWS9Xh/KMAFmr5MNC70PV0IQS2E+D4U
         /LdVl596N9ksuww1icyqeaKLPPG60Y0UtKnmL+544MzBj+ahsnwokI/Dr7H5/nTg5vQi
         R2O96MFqbWrglsmYjtA/SeMMgAyDKGUcmrpBkNjsiD/LOJdZvybqZVT5AmKGsM5l2jYV
         cN8Q93wmuh1DDr7bjEDTMOVvnnip0jziehek4w5CHt3B7smkwXjKeRCpUEEXk6CujzjR
         XJMpSM6E/Z7ayOwqrR31Mz2jre4a9vdN/x1pkezci7SNfNf1/3a6r0gFsJwrvmAbbPHC
         Qucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806488; x=1747411288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ6saQ7qIUfM+N2A7SWL/TBeypbGkiU0nwAzmg1zqkI=;
        b=nGSRPS5u8Pu0DNa97Eed05Zy3KCw85gHAXI7/7g87OP/E07i3nh0Cu10URdMnNF/3b
         4t9/cTnzpwG/8P5vGBpj/n1SHbx1bG8g8wRBoE3fUw4QhuWFU8vEHBALSaAIiFkzm1AB
         RlEO8IDu2ZO/h+D6pq+ten1syN21mp1eHDWYNyT0OZa5F7rIxkYXqFY/Rda7jqap6yZW
         rXaOe1tJQ1kAoBr/qJtC8WxDA3auKNrH7lskoeskBnVLptYVxQydX0kw1SunHW+WWyVn
         AWudMHIcrUYhUlWC2WqetvAIFaD5J+LRq4uJNCfp6/k9y7konCNdMbt7PBEo9URo15lf
         OOwg==
X-Forwarded-Encrypted: i=1; AJvYcCUFpx6wmGVFHjJuWMpd9pVAzmXeHulPt+5FIW7wIFhAQ8LGZFH3TMwwAXfW+F5Ni2eYfExa4aHtoZvNDY+g@vger.kernel.org, AJvYcCWemRE80v2Zvs/uYZccKONOyUwviEgVwoMYhUoMabIgiyHM1w6yxbKBfswIToOXBK8GUw7BSbIcWpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAyclguVqRkS54uzvrKM/IXu5kVOYs/ZBCftdcd9colxakcXD
	bHc1or2UAkE7AOBOO0QijJynVNHsRm0P+8XiilCmGfzP9QSo6yR1
X-Gm-Gg: ASbGnctVo0EPY+WA03bsafkCuFwwOImsYi0e5lKt7cqaiFxgArHXvn+xhp4U413LmvW
	SIk2SgiGeasr9U8nfTg8WZZNtrlUGuClvcZ2ThhYX5Xze0PsUVsika+1QX4MRAPzHFQLJCSGI1g
	PGFnQ8nzUQ2c8I1mWNB8caynPdyt/WbAi6dQwf66RkdhYJVEAyCm+m0pXFtP2G+9jIjZXL8gNLf
	8/s5VqA1rZrjtFdT/Oe8jiZXj2Rd8KJqJH+Mr1nNFX6Y9IRKkq0C9UZ/H7ZKS8IlAmZkOZWXtdJ
	5/rWYUX8fBPrIjPT+I2AYm61qQhm7X/X06NabfDsldH1hgjuo3XjNFSa+21oDEf1o309BafRKjO
	w
X-Google-Smtp-Source: AGHT+IGuJqGf33e2N+9cCMRkVqe/TGxroajk7BrJlzeHHFVAr7w/p4c75693BzONKW7xk7xZgZDlhQ==
X-Received: by 2002:a05:6000:2902:b0:3a0:b4f1:8a63 with SMTP id ffacd0b85a97d-3a1f6427506mr2922879f8f.11.1746806488084;
        Fri, 09 May 2025 09:01:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:40e3:34f3:a241:140c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ac8csm33244475e9.33.2025.05.09.09.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:01:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/2] clk: renesas: rzv2h-cpg: Skip monitor checks for external clocks
Date: Fri,  9 May 2025 17:01:20 +0100
Message-ID: <20250509160121.331073-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For module clocks whose parent mux may select an external source, bypass
the normal monitor (CLK_MON) register check when the external clock is
active. Introduce a new `ext_clk_mux_index` in `struct rzv2h_mod_clk` and
`struct mod_clock`, and detect the current mux index in
`rzv2h_mod_clock_is_enabled()` to disable monitoring if it matches the
external source index.

Provide the `DEF_MOD_MUX_EXTERNAL()` macro for declaring external-source
module clocks, and populate the `ext_clk_mux_index` field in
`rzv2h_cpg_register_mod_clk()`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Dropped external_clk_mux_index and external_clk and introduced
  ext_clk_mux_index.
- Updated DEF_MOD_*() macros to include ext_clk_mux_index.
- Added a new helper function `rzv2h_clk_mux_to_index()` to get the
  current mux index.
- Dropped IS_ERR() check for parent_clk in `rzv2h_clk_mux_to_index()`.
- Updated commit description to clarify the purpose of the patch.

v2->v3:
- Renamed helper macro to `DEF_MOD_MUX_EXTERNAL()`.
- Added a new field `external_clk_mux_index` to `struct mod_clock` to
  store the mux index corresponding to the external input.
- Updated the `rzv2h_mod_clock_is_enabled()` function to check if the
  parent mux selects the external source by comparing the current mux
  index against `external_clk_mux_index`.
- Updated the `rzv2h_cpg_register_mod_clk()` function to populate the new
  fields from the SoC info.
- Updated commit description

v1->v2:
- None
---
 drivers/clk/renesas/rzv2h-cpg.c | 29 ++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h | 17 +++++++++++++----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index bcc496e8cbcd..882e301c2d1b 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -119,6 +119,7 @@ struct pll_clk {
  * @on_bit: ON/MON bit
  * @mon_index: monitor register offset
  * @mon_bit: monitor bit
+ * @ext_clk_mux_index: mux index for external clock source, or -1 if internal
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
@@ -129,6 +130,7 @@ struct mod_clock {
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
+	s8 ext_clk_mux_index;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
@@ -563,14 +565,38 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
 }
 
+static int rzv2h_clk_mux_to_index(struct clk_hw *hw)
+{
+	struct clk_hw *parent_hw;
+	struct clk *parent_clk;
+	struct clk_mux *mux;
+	u32 val;
+
+	/* This will always succeed, so no need to check for IS_ERR() */
+	parent_clk = clk_get_parent(hw->clk);
+
+	parent_hw = __clk_get_hw(parent_clk);
+	mux = to_clk_mux(parent_hw);
+
+	val = readl(mux->reg) >> mux->shift;
+	val &= mux->mask;
+	return clk_mux_val_to_index(parent_hw, mux->table, 0, val);
+}
+
 static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
 	struct rzv2h_cpg_priv *priv = clock->priv;
+	int mon_index = clock->mon_index;
 	u32 bitmask;
 	u32 offset;
 
-	if (clock->mon_index >= 0) {
+	if (clock->ext_clk_mux_index >= 0) {
+		if (rzv2h_clk_mux_to_index(hw) == clock->ext_clk_mux_index)
+			mon_index = -1;
+	}
+
+	if (mon_index >= 0) {
 		offset = GET_CLK_MON_OFFSET(clock->mon_index);
 		bitmask = BIT(clock->mon_bit);
 
@@ -687,6 +713,7 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	clock->mon_index = mod->mon_index;
 	clock->mon_bit = mod->mon_bit;
 	clock->no_pm = mod->no_pm;
+	clock->ext_clk_mux_index = mod->ext_clk_mux_index;
 	clock->priv = priv;
 	clock->hw.init = &init;
 	clock->mstop_data = mod->mstop_data;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 9104b1cd276c..68c223373916 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -199,6 +199,7 @@ enum clk_types {
  * @on_bit: ON bit
  * @mon_index: monitor register index
  * @mon_bit: monitor bit
+ * @ext_clk_mux_index: mux index for external clock source, or -1 if internal
  */
 struct rzv2h_mod_clk {
 	const char *name;
@@ -210,9 +211,11 @@ struct rzv2h_mod_clk {
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
+	s8 ext_clk_mux_index;
 };
 
-#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
+#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, \
+		     _onbit, _monindex, _monbit, _ext_clk_mux_index) \
 	{ \
 		.name = (_name), \
 		.mstop_data = (_mstop), \
@@ -223,16 +226,22 @@ struct rzv2h_mod_clk {
 		.on_bit = (_onbit), \
 		.mon_index = (_monindex), \
 		.mon_bit = (_monbit), \
+		.ext_clk_mux_index = (_ext_clk_mux_index), \
 	}
 
 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, -1)
 
 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit, -1)
 
 #define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit, -1)
+
+#define DEF_MOD_MUX_EXTERNAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop, \
+			     _ext_clk_mux_index) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
+		     _ext_clk_mux_index)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.49.0


