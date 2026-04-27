Return-Path: <linux-renesas-soc+bounces-31677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGALOntJ72lO/wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:33:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996C471CB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A4F23086C50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598D03B8BD1;
	Mon, 27 Apr 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j22EKtWh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C23B8BD4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289326; cv=none; b=MtdbsT5LDQVDIr2emgT6CB5Gs+u0/pFV0hcmco2MM+svXxpnqsiRm8J7+485mAAH9f/+Ocgfs1meQjmEYp8TvmGVUzjX1ibxX+TXbL0dd0SDHCzTQGZ5/HGfeEJ0OYeABQTvootRBkvYXZYtoEJADee85MLCSvTKsRUuwxne/+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289326; c=relaxed/simple;
	bh=604GKGZ2LMBnNnG2sD7aHeVbMINZqCZkzgKWWG7wcBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPIiCBVyvyhf9fAXdSzYmFsRqLuH0c5hk9EbYPZ1mv8B3LBWyWAGh2uN8UXOGT1/NhtAcj/Y5ndhUizUiomGB+6VJSg8WLF1go89N9rOQ83cFgsFrOKjYTAZY67fJQnITdO1lN3NQXyVTCWdI4oGWHqoDac7SOTd+Hy6k/zS424=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j22EKtWh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-445795cf6f1so289930f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289322; x=1777894122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03jq2FOnuh9qmdwhdZ2J0ZBVYWSyNXvDV4qpUXfZIHI=;
        b=j22EKtWh/OugspcOI2gbsnLWX7iyQnImVF5OgG1uuVvtR5FlsPNaUlv7xpZmMTwNRs
         uXOjWYR0LblsbWjhhM4i9sQYAeGAhjeuMlGoXbtMRdU42TMCexb5XrWXF2GWt65821jN
         HfZf3v6rsnnpsy8zOMlLoBpOwZILG6HwNy9F/XHD9TZfCJ+rZ/d4mKxeSN/CXnf+bJof
         xa3sA/WV4U4Ed9KA/Cw33VE0Ae0Nkuc/wqYqoKWZIZrzWJjSrxX1GClRr4rTh5sW5zLS
         ALgGAZX+IYjl1fT8+Aga/lxmdYpYtnYZ7CGjotk/9LbxHjh7SQoAvxkndzpmeY7XAq86
         2oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289322; x=1777894122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03jq2FOnuh9qmdwhdZ2J0ZBVYWSyNXvDV4qpUXfZIHI=;
        b=UkkVl0O9dthsZwh+Hhj/EuWY6N079SYucOOpmbRd6mOtW32jn2Ip3VsOcYud/HG+Bs
         UQMM0sRDWtiDrJbOoKmUP20x6cBXm9UVAg5z2Voum4VG0ToQWVW9ZiRbQnzqY0roFtAY
         v0K7dKbDloT3Wiz/4NiQIN3k3rTBVM1TbiRMwRvGNIli6JgmbOnmJYOsZ+Xc2uUMIazr
         ellITp/WRhXxPwAuKJi9dAvtpzeuHCwOkg6z49e6zocTajLiCkJtWLp5vAC2hYkZmqVR
         mPwJSm4O04Y+LrH7xJjEosp6DS5H4s/Tf29abhvl9/XdqSQ4DfpWH3O5bJRxP20HI6yQ
         KAjg==
X-Forwarded-Encrypted: i=1; AFNElJ+4UxjQQ0/IoMUukgHR3l5uZefpkx+ts4vrErWhKO+MhpDEvC6/cOvp1lARwcIanb3+e7jGrGL9hftJlrvIEOL6lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3XzTBVxxXTVUpt/Ju9axRE6XYXtxIpX4Xd0vIlWFd5ejxC7nK
	3qc8v+kS8RareY6KaLyLP+Mcxh+GPTf5qwpW1XKc3nLLpRU1sra6bfQe
X-Gm-Gg: AeBDieveJqNftMhWZzjhSrO5pMvPQCwIamOw6RiVpD81y+kMCXzxJcX/nfzro9g/JS9
	o77jHm53fxZDCeQM3ZYYI7DlRBaWnWuJ5dacHBIACjCNytzqOnpQwCkeyd+j/NoSF3s4ORrJi9T
	uT/4XDbp/HwUJfeOr4Q6U1SNKnaJSFifCH1SPw+3DYb9jpQpYaBcxo6M/YuLwjAV5dQm3JqMkMp
	8KUGfTg5WGWOD/P6tNmqJybM87pcy2uLXaku/D4lJWZTgDurzAkFIYZg5Eg1mXqcn9hx/xHm2jR
	dvBTo8vQTFgMCg6UopWY97sRH2T8/lyXmUqNo0PatR6haZS4xpjAw9uQjE/B4mlZtVlkBTcgDG+
	wQaRy0J2mkjtgcqfiK36Nuot9mrs8tIYUrqdOmFPGfwXC4sSqkm5UnQilwQOvwBtCmWmCbBSLIg
	CIdciCSRZZIy6b1g9Xluj9ic/YZGGNBEDA2J5zXUs/ITI9uE9sZvc1dl3CVManRUH/bca8CMgFE
	p4X+8uzHD9eZ79CiRGSjTNLbu2CVuEvcacqxSKzumNAzqeXhK07n9CoZg==
X-Received: by 2002:a05:6000:2307:b0:43b:3e40:2223 with SMTP id ffacd0b85a97d-43fe3dcc52cmr67755277f8f.19.1777289322002;
        Mon, 27 Apr 2026 04:28:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3f97:a47d:8f30:c055])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm85759519f8f.6.2026.04.27.04.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:28:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/2] clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX handling
Date: Mon, 27 Apr 2026 12:28:23 +0100
Message-ID: <20260427112824.231150-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8996C471CB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31677-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
clk_round_rate() is called with ULONG_MAX, which is the canonical way
to probe the maximum rate a clock can produce.

Two test cases are introduced:

- clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
  fixed-rate parent driving a table-based divider whose smallest entry
  is div=2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_MAX)
  and checks the result.

- clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-input
  mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead of
  the same table-based divider to verify correct parent selection under
  ULONG_MAX.

Both tests use an explicit clk_div_table with a minimum divider of 2 so
that the pre-loop maxdiv clamping in clk_divider_bestdiv():

    maxdiv = min(ULONG_MAX / rate, maxdiv);

clamps maxdiv to 1, causing _next_div() to return 2 on the first
iteration and skip the loop body entirely. This makes bestdiv fall back
to the maximum divider, returning the minimum rate rather than the
maximum.

The expected values intentionally reflect the buggy output:
  - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
  - test 2: 0                      (invalid, loop never populated bestdiv)

These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / 2
respectively once the fix to clk_divider_bestdiv() is applied.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Dropped unregister_fixed_rate/unregister_divider/unregister_mux wrapper
- Added entry in .kunitconfig file
- Fixed reverse christmas tree order in
  clk_divider_bestdiv_ulong_max_returns_max_rate
- Updated MODULE_DESCRIPTION() to be more specific

v2->v3:
- Added false positive expected values
- Updated the commit message
- Added dependency on !S390 in Kconfig
---
 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   8 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider_test.c | 152 +++++++++++++++++++++++++++++++++
 4 files changed, 162 insertions(+)
 create mode 100644 drivers/clk/clk-divider_test.c

diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
index 8a0ea41934a2..ea05b9a28c80 100644
--- a/drivers/clk/.kunitconfig
+++ b/drivers/clk/.kunitconfig
@@ -4,6 +4,7 @@ CONFIG_OF=y
 CONFIG_OF_OVERLAY=y
 CONFIG_COMMON_CLK=y
 CONFIG_CLK_KUNIT_TEST=y
+CONFIG_CLK_DIVIDER_KUNIT_TEST=y
 CONFIG_CLK_FIXED_RATE_KUNIT_TEST=y
 CONFIG_CLK_GATE_KUNIT_TEST=y
 CONFIG_CLK_FD_KUNIT_TEST=y
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2efbe9f6acb..fdeb87ff8fd9 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -573,4 +573,12 @@ config CLK_FD_KUNIT_TEST
 	help
 	  Kunit test for the clk-fractional-divider type.
 
+config CLK_DIVIDER_KUNIT_TEST
+	tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on !S390
+	default KUNIT_ALL_TESTS
+	help
+	  Kunit test for the clk-divider type.
+
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index a3e2862ebd7e..dc653b458f56 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -21,6 +21,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
+obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
 obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)	+= clk-fixed-rate-test.o
diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
new file mode 100644
index 000000000000..b1bc802f38e4
--- /dev/null
+++ b/drivers/clk/clk-divider_test.c
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for clk_divider_bestdiv()
+ */
+#include <kunit/test.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/limits.h>
+#include <linux/units.h>
+
+#define PARENT_RATE_1GHZ	GIGA
+#define PARENT_RATE_2GHZ	(2 * GIGA)
+#define PARENT_RATE_4GHZ	(4 * GIGA)
+
+static const struct clk_div_table bestdiv_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 4 },
+	{ .val = 2, .div = 8 },
+	{ /* sentinel */ }
+};
+
+/*
+ * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achievable
+ * rate for a divider clock.
+ */
+static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
+{
+	struct clk_hw *parent_hw, *div_hw;
+	unsigned long rate;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
+					       NULL, 0, PARENT_RATE_1GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  (kunit_action_t *)clk_hw_unregister_fixed_rate,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-div",
+					       "bestdiv-parent",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem __force *)fake_reg,
+					       0, 2, 0, bestdiv_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  (kunit_action_t *)clk_hw_unregister_divider,
+						  div_hw));
+
+	/*
+	 * ULONG_MAX is the canonical way to probe the maximum rate a clock
+	 * can produce.
+	 */
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
+}
+
+/*
+ * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximum rate
+ * when a mux clock sits between a divider and its parent candidates.
+ *
+ * Topology:
+ *
+ *   [fixed 4 GHz] --\
+ *                    +--> [mux CLK_SET_RATE_PARENT] --> [div {2,4,8} CLK_SET_RATE_PARENT]
+ *   [fixed 2 GHz] --/
+ *
+ */
+static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *test)
+{
+	static const char * const mux_parents[] = {
+		"bestdiv-mux-parent-a",
+		"bestdiv-mux-parent-b",
+	};
+	struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
+	u32 *fake_reg_mux, *fake_reg_div;
+	unsigned long rate;
+
+	fake_reg_mux = kunit_kzalloc(test, sizeof(*fake_reg_mux), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_mux);
+
+	fake_reg_div = kunit_kzalloc(test, sizeof(*fake_reg_div), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg_div);
+
+	/* Higher-rate parent: the mux should select this for ULONG_MAX. */
+	parent_a_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-a",
+						 NULL, 0, PARENT_RATE_4GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  (kunit_action_t *)clk_hw_unregister_fixed_rate,
+						  parent_a_hw));
+
+	/* Lower-rate parent: should not be selected. */
+	parent_b_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-b",
+						 NULL, 0, PARENT_RATE_2GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  (kunit_action_t *)clk_hw_unregister_fixed_rate,
+						  parent_b_hw));
+
+	/*
+	 * 1-bit mux register selects between the two parents.
+	 * CLK_SET_RATE_PARENT allows the divider's rate request to
+	 * propagate into clk_mux_determine_rate().
+	 */
+	mux_hw = clk_hw_register_mux(NULL, "bestdiv-mux",
+				     mux_parents, ARRAY_SIZE(mux_parents),
+				     CLK_SET_RATE_PARENT,
+				     (void __iomem __force *)fake_reg_mux,
+				     0, 1, 0, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  (kunit_action_t *)clk_hw_unregister_mux,
+						  mux_hw));
+
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
+					       "bestdiv-mux",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem __force *)fake_reg_div,
+					       0, 2, 0, bestdiv_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  (kunit_action_t *)clk_hw_unregister_divider,
+						  div_hw));
+
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
+static struct kunit_case clk_divider_bestdiv_test_cases[] = {
+	KUNIT_CASE(clk_divider_bestdiv_ulong_max_returns_max_rate),
+	KUNIT_CASE(clk_divider_bestdiv_mux_ulong_max_returns_max_rate),
+	{}
+};
+
+static struct kunit_suite clk_divider_bestdiv_test_suite = {
+	.name = "clk_divider_bestdiv",
+	.test_cases = clk_divider_bestdiv_test_cases,
+};
+
+kunit_test_suite(clk_divider_bestdiv_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for clk divider");
+MODULE_LICENSE("GPL");
-- 
2.54.0


