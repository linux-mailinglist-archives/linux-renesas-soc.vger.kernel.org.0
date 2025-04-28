Return-Path: <linux-renesas-soc+bounces-16426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37325A9F8C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 20:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB63D1A82800
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 18:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785292957CF;
	Mon, 28 Apr 2025 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF2nGNz3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9F11C54A2;
	Mon, 28 Apr 2025 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865728; cv=none; b=RKx+c2ts+tFsPW9zQ/JSqkhI1Qy7jpg/vF1iTaIFZ1NHhCYFb3V4iwy63OsO2exQWwLpPCp80VQzwTU3Dsa8hwFAFOkvy1NgLQB8oPOnuzodD+7RVXdfS2BkqjE52xKodiVq7h/FShOWT017+onLJOz/KaVG41F9y7Uo/ppXF1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865728; c=relaxed/simple;
	bh=uevCTF1l154m+gQ19oUx6M/hw4B+uV+TdY2Dq5bqnKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9V4mEwWCQ2gO4x4JVC52E5EaRESf9g+wS8LoODaOb3UlsiDfRWmNQ/nLTibYq7zmuNrDBD6qUODnCWpjlP//qNogOYGaaKMxCTRo0puVYo5uCzD+iWXvEsCvAivV3PEGbMXlQYlna80qeJPxNAlDaJzCVCJTNeGQ+7QstuInXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF2nGNz3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so45690335e9.3;
        Mon, 28 Apr 2025 11:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745865725; x=1746470525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrGI3OosBOEcQI7FUenYpYpOxqk+WWvfPU2YLh3D6qQ=;
        b=jF2nGNz3HCOc59wVABguWbyMyhOfcsGmqzd9I52HQZhSevplWGl4nxlsFtwbP10ICD
         ZkIhmefvo2/1T/s1I0c1gmr+68fGKm0wT2cDlFmVswt1xwEA0YXV7VVjvQ92azBzZi1l
         w7GH5qzlnU/f+W0WpYNwfjvnlVZO2HJf7bq1MbHlnkk9+LvOlxSrVYDpbRAjdTUz62X8
         GxN9KlV6Ma1+gsFIo3DHbRt62SgVhNo9GF0MkLyE0z3CRJxIRs1SgTyxPTxh6PNW335Y
         PH3tTvRTuDroQg5kJxsSvZdgJl2+RqFYDmqoXEq5uKVecUUEHznfDrwjjT1ZNIu+VOtE
         EmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745865725; x=1746470525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrGI3OosBOEcQI7FUenYpYpOxqk+WWvfPU2YLh3D6qQ=;
        b=KYnEJWan/KrABEKorverFXT6eHpahhCMHKaO+k2ZZQ5JUeh2+7zChcNGrTjFK7QRKo
         Q7THL3Js6L2TRp/0CZ+DXWmJw1syFezYIJI3JWtMUsMHoJBWBAqueYK6hbTKoIuzceH1
         XBZav0PnJlVr44NrKml1xzvcHfCF9xig3ZxDIfRthFDy6lla2baziHWtvzs0wOVag9al
         vpwFd0wFHvQY9bvN9Dbz6nmZweHWjapRziDoQqkbksnk06A1HNjsQxZBeZ38snWW82rh
         gC464K6q1ymu2IDLAUEwaQ5Qh3xcM8IRee+13VASF2G85CcYr9vVDzWXqnBjaAwpLpPd
         6F2w==
X-Forwarded-Encrypted: i=1; AJvYcCVIcIsCrsMcMM56Km4y+eZnI2v52q1ic00opsDOlRrF76BcWS8t11MQbJkXUFII8ylQITZuj7mapbQhzVDM@vger.kernel.org, AJvYcCX8uWZYt/2079isguQLGcXe+O2MrA2rnrxYC/4lSD99SbWEteIHRLrhNuOAc6mB83ur69VJK+xa+T4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAaz0o11HOMPwivG2MPKrX97Uo81+FKH2EOAIqt0L5XzIvaGV
	CHa/wn3R93NfLIt5fuqWGBUp0/gFqhUKkSJW2/HwPZfrbWJXVOGI
X-Gm-Gg: ASbGnctc2U8VKaNgPzS+8zJ/A/S3NAmYgHuOduAVllUGAUJrATH3buWn2iGrpFSkk5C
	eIpWKUD3Gm6QE50eTXzKk/R3rMwfNYvWIqyg8ekLIjNR+EpYlnBweDxRt6RCfVFRUkENQtH77Ux
	Yx4OOHOnzC5hFpfUg4ldE6dRrAGSiW2NWZ4mZkRdDD83diuITit5j21lez7NOGgouj9HmZSrOBT
	kTUjPf9ZgBBIQEf8Fz0L3sbrxDLOuRhaYV/tZKGYYIltQ0GsGEUT7+DW94KmWjlFvnf4EuFLVTj
	4juvC8AOkG0Pp712sw71KyWzL1LMZcKXHkBd2ywc4+2vW7UNdW7w6nsPZcyyj6FLf0dD41NquQ=
	=
X-Google-Smtp-Source: AGHT+IG8iQFeXZcjrmehWFT/QUbj2bBVH7TJEoQ24jX65isuOiZLtfmHYxDkoZNNv+xYeadD+VKHpw==
X-Received: by 2002:a05:600c:3d10:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-441ac856fe1mr4015175e9.0.1745865724360;
        Mon, 28 Apr 2025 11:42:04 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:593b:8313:b361:2f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f89b2sm137745995e9.8.2025.04.28.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:42:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/2] clk: renesas: rzv2h-cpg: Skip monitor checks for external clocks
Date: Mon, 28 Apr 2025 19:41:51 +0100
Message-ID: <20250428184152.428908-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce support for module clocks that may be sourced from an external
clock rather than the on-chip PLL. Add two new fields `external_clk` and
`external_clk_mux_index` to `struct rzv2h_mod_clk` and `struct mod_clock`
to mark such clocks and record the mux index corresponding to the external
input.

Provide a new helper macro `DEF_MOD_MUX_EXTERNAL()` for concise declaration
of external-source module clocks.

In `rzv2h_mod_clock_is_enabled()`, detect when the parent mux selects the
external source (by comparing the current mux index against
`external_clk_mux_index`) and skip the normal CLK_MON register check in
that case. Update `rzv2h_cpg_register_mod_clk()` to populate the new fields
from the SoC info.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
 drivers/clk/renesas/rzv2h-cpg.c | 31 ++++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h | 23 +++++++++++++++++++----
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index bcc496e8cbcd..e03c9801d2e9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -119,6 +119,8 @@ struct pll_clk {
  * @on_bit: ON/MON bit
  * @mon_index: monitor register offset
  * @mon_bit: monitor bit
+ * @external_clk: Boolean flag indicating whether the parent clock can be an external clock
+ * @external_clk_mux_index: Index of the clock mux selection when the source is an external clock
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
@@ -129,6 +131,8 @@ struct mod_clock {
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
+	bool external_clk;
+	u8 external_clk_mux_index;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
@@ -567,10 +571,33 @@ static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
 {
 	struct mod_clock *clock = to_mod_clock(hw);
 	struct rzv2h_cpg_priv *priv = clock->priv;
+	bool skip_mon = false;
 	u32 bitmask;
 	u32 offset;
 
-	if (clock->mon_index >= 0) {
+	if (clock->mon_index >= 0 && clock->external_clk) {
+		struct clk_hw *parent_hw;
+		struct clk *parent_clk;
+		struct clk_mux *mux;
+		int index;
+		u32 val;
+
+		parent_clk = clk_get_parent(hw->clk);
+		if (IS_ERR(parent_clk))
+			goto check_mon;
+
+		parent_hw = __clk_get_hw(parent_clk);
+		mux = to_clk_mux(parent_hw);
+
+		val = readl(mux->reg) >> mux->shift;
+		val &= mux->mask;
+		index = clk_mux_val_to_index(parent_hw, mux->table, 0, val);
+		if (index == clock->external_clk_mux_index)
+			skip_mon = true;
+	}
+
+check_mon:
+	if (clock->mon_index >= 0 && !skip_mon) {
 		offset = GET_CLK_MON_OFFSET(clock->mon_index);
 		bitmask = BIT(clock->mon_bit);
 
@@ -687,6 +714,8 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	clock->mon_index = mod->mon_index;
 	clock->mon_bit = mod->mon_bit;
 	clock->no_pm = mod->no_pm;
+	clock->external_clk = mod->external_clk;
+	clock->external_clk_mux_index = mod->external_clk_mux_index;
 	clock->priv = priv;
 	clock->hw.init = &init;
 	clock->mstop_data = mod->mstop_data;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 449f8c82e8fb..687587033688 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -192,6 +192,8 @@ enum clk_types {
  * @on_bit: ON bit
  * @mon_index: monitor register index
  * @mon_bit: monitor bit
+ * @external_clk: Boolean flag indicating whether the parent clock can be an external clock
+ * @external_clk_mux_index: Index of the clock mux selection when the source is an external clock
  */
 struct rzv2h_mod_clk {
 	const char *name;
@@ -203,9 +205,12 @@ struct rzv2h_mod_clk {
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
+	bool external_clk;
+	u8 external_clk_mux_index;
 };
 
-#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
+#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, \
+		     _onbit, _monindex, _monbit, _external_clk, _external_clk_mux_index) \
 	{ \
 		.name = (_name), \
 		.mstop_data = (_mstop), \
@@ -216,16 +221,26 @@ struct rzv2h_mod_clk {
 		.on_bit = (_onbit), \
 		.mon_index = (_monindex), \
 		.mon_bit = (_monbit), \
+		.external_clk = (_external_clk), \
+		.external_clk_mux_index = (_external_clk_mux_index), \
 	}
 
 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
+		     false, 0)
 
 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit, \
+		     false, 0)
 
 #define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit, \
+		     false, 0)
+
+#define DEF_MOD_MUX_EXTERNAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop, \
+			     _external_clk_mux_index) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit, \
+		     true, _external_clk_mux_index)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.49.0


