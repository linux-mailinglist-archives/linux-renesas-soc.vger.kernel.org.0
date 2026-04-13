Return-Path: <linux-renesas-soc+bounces-31243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFtOKRrn3GkZYAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:52:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E3E3EC38C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C48BF304C10D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD08C3C9442;
	Mon, 13 Apr 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROVGCJMc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA83C8711
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084563; cv=none; b=RytskhcpyKV67s79E+5CUV0eo1w9RgvTsY9XuonLns+lYJ4uH4OFJcnWhWEU2U2brMWuVllhBCeLNDtQEumr7AM+ESxJvRcrrMVtWugxfJf2VJkr0XiVf7yRZRTr1voiT+uWQ1piIlftqtIbt+xx/1AmYO/Ri3F6RBRunKtUWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084563; c=relaxed/simple;
	bh=/L73E0ZuOj9b7tO+qUXm2BUgZmzJx25hqEciKe/Vffs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsVC9HaOoSCp2d377phJ3JWJ35iUfgQh10bzVUGMjv6iM9PeFWFx7SiUbpaO/7SeZxazOPO2McCqv6W+JNT34n6/NCbqHIVbnNq8cAy59CifS25mymA1AI8QSGV3VjDs5RfwloKf+mdK3BiXq9N14u5EvV4wPZa4S9/nx7XvDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROVGCJMc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7645adbdso658462f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776084560; x=1776689360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zILI3bSq+qhFMWUMzmmHd5z5cGi7XjJl7b2Gmvd6Z/4=;
        b=ROVGCJMcqqzajsQBcnW50RKB87WorbNTkqQzl6mqk53sVqF8MQUiL89QiRV4IvYCJM
         ae+IwO09fzaUn4S2B3V/bfHFYTFtXIN84cBe6QTCXIxDOytR/yv7nc0tlOfUDvFQzHqe
         y6cwocoSkmw6YenkAdQPKIVLM2Nud+FZUPtxJD6JrKdwzhb8eBCu/VWj2wBlbq6fYy1X
         1l/D9wYmVyLK1Y0pFAcRderTOgwjOkr0e6BZQPwaPvHZSo0Na+BosMyZPiL1Gb9h5BRw
         HDLguF8QZM9p91zc5mt/KQfDA8LHfkYLnWb1IwplXY7W9JS0eADMFz0s/b7mav3+ik+l
         Le8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776084560; x=1776689360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zILI3bSq+qhFMWUMzmmHd5z5cGi7XjJl7b2Gmvd6Z/4=;
        b=gTVEdOm9lT1BS3py1xEZmsr+03lFVfSlFazD9UPCsx+pUbeTgGsFgZ67ns/yp6KYPe
         QW8vXBlD5kaQZdiqt3K8mehkoSaRd6+9E+ADc6TyNDMfxS3CRtktc26j643v5WNh/JNf
         7+l9gblYv7Paef4Cw+w5jxE+Vnj9Ts74+zksvabSSq+oneflZKcE668u18Bt6mVPAayZ
         HX5A5mgMDThLZgEKGF0l2rW/VqQxyWFMOiXFRwSRndPz8G+D4MzWpj/W7VZOki8T9tlb
         o5r5Vt0SlQ+EUkcDUBlF1rLunzolbPC3blz/GSu9KfcgDxlr1enZZOXuEwSSrgU2PWAE
         iCag==
X-Forwarded-Encrypted: i=1; AFNElJ+aSHVgQ3hw7w5xuP+f0TBj3uEqdtFj3wt1wRjnWr3OxMIR4ioNTzPqt1Z1843UFqc0U0ZQaFFiE5/lMQjkQ5hA6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV32B1bnfyNe5Ow7q9BuSGlDmUBiWm0gXHxtVZFM6JVKST0YhS
	70gpKvYuA1o2BID28Gh7jCJn9tO9lUgbKTOyUdjeJv+NN6+HDXEIhIzg
X-Gm-Gg: AeBDietP2jXER/ION4/wP6ubkjgFFlNbwlMsIbdrJ6lx9OVaY8OQrKJ5e1gz7DiQy7n
	I3PdL+gXzGwMygIl7HZsUPNqNR1hTb4l2bLA2ICfFXJPrsrhpZ/ec8Tsb5DjDHzjQirHdYjc1sQ
	RIf/B789KogLwWuxh/RK4Lz7IvUbmZg83n8ef0LFkYCud78rCezZXe3sorX2lWR+GrIP4XIyRU8
	CyR+YXZreuTrKHU1mYsDVays8/FoFelWrH2C2mHH+STdLbiy+lcpQJQ1zYpDsO6LTd1YhAH/W1d
	AkMY6z0qcX3AV11Fg2mJRmIqxP2QveM8MKjmgJZb7KIoannFIlPQWErWUye17SVOAzkjwK/Uy5Z
	xZtQZumSpw0+fMClpxcTiq/f1KBjuSDqECxqsT+HNMUltr3xEngS0h5JO4T6SLiQpEtwHl3zh0E
	ronxHIFnPR8VEe0kUcU8lWBfD5ClK3mrjz03m7nosxIR4Agd/JFufNUJ8msaYpNtOFQSA8s6lwD
	THr0SS/yOLEymSwW5QF3WNxwsQ3x1p54fx2EJaOZ60qB2k=
X-Received: by 2002:a05:6000:2486:b0:43d:7518:b0fc with SMTP id ffacd0b85a97d-43d7518b2a1mr7508526f8f.43.1776084559589;
        Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm34634318f8f.27.2026.04.13.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] clk: divider: Add some kunit test suites
Date: Mon, 13 Apr 2026 13:49:12 +0100
Message-ID: <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-31243-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.986];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22E3E3EC38C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add KUnit tests to verify clk_divider_bestdiv() returns the maximum
achievable rate when clk_round_rate() is called with ULONG_MAX, which
is the canonical way to probe the maximum rate a clock can produce.

The first test uses a fixed-rate parent driving a table-based divider
with no div=1 entry. The second test places a two-input mux between
the divider and its root clocks to verify correct parent selection and
that the divider loop does not make redundant calls to
clk_hw_round_rate() for each remaining table entry after the first
overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/Kconfig            |   7 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider_test.c | 151 +++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 drivers/clk/clk-divider_test.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index cc8743b11bb1..c8f9eaef6f6b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -573,4 +573,11 @@ config CLK_FD_KUNIT_TEST
 	help
 	  Kunit test for the clk-fractional-divider type.
 
+config CLK_DIVIDER_KUNIT_TEST
+	tristate "KUnit tests for clk divider bestdiv" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Kunit test for the clk-divider type.
+
 endif
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index a3e2862ebd7e..0c915c6cf3fa 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -20,6 +20,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
+obj-$(CONFIG_CLK_DIVIDER_KUNIT_TEST) += clk-divider_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
new file mode 100644
index 000000000000..3a5e3adccb2e
--- /dev/null
+++ b/drivers/clk/clk-divider_test.c
@@ -0,0 +1,151 @@
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
+static u32 fake_reg_a, fake_reg_b;
+
+static const struct clk_div_table no_div1_table[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{0, 0},
+};
+
+static void unregister_fixed_rate(void *hw)
+{
+	clk_hw_unregister_fixed_rate(hw);
+}
+
+static void unregister_divider(void *hw)
+{
+	clk_hw_unregister_divider(hw);
+}
+
+static void unregister_mux(void *hw)
+{
+	clk_hw_unregister_mux(hw);
+}
+
+/*
+ * Test that clk_round_rate(clk, ULONG_MAX) returns the maximum achievable
+ * rate for a divider clock.
+ */
+static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
+{
+	struct clk_hw *parent_hw, *div_hw;
+	unsigned long rate;
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-parent",
+					       NULL, 0, PARENT_RATE_1GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	kunit_add_action(test, unregister_fixed_rate, parent_hw);
+
+	fake_reg_a = 0;
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-div",
+					       "bestdiv-parent",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem *)&fake_reg_a,
+					       0, 2, 0, no_div1_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	kunit_add_action(test, unregister_divider, div_hw);
+
+	/*
+	 * ULONG_MAX is the canonical way to probe the maximum rate a clock
+	 * can produce. With a parent at 1 GHz and the smallest table divider
+	 * being 2, the expected maximum is 500 MHz.
+	 *
+	 * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
+	 * minimum rate, because the search loop was bypassed entirely.
+	 */
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
+}
+
+/*
+ * Test that clk_round_rate(clk, ULONG_MAX) returns the correct maximum rate when
+ * a mux clock sits between a divider and its parent candidates.
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
+	static const char *const mux_parents[] = {
+		"bestdiv-mux-parent-a",
+		"bestdiv-mux-parent-b",
+	};
+	struct clk_hw *parent_a_hw, *parent_b_hw, *mux_hw, *div_hw;
+	unsigned long rate;
+
+	/* Higher-rate parent: the mux should select this for ULONG_MAX. */
+	parent_a_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-a",
+						 NULL, 0, PARENT_RATE_4GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_a_hw);
+	kunit_add_action(test, unregister_fixed_rate, parent_a_hw);
+
+	/* Lower-rate parent: should not be selected. */
+	parent_b_hw = clk_hw_register_fixed_rate(NULL, "bestdiv-mux-parent-b",
+						 NULL, 0, PARENT_RATE_2GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_b_hw);
+	kunit_add_action(test, unregister_fixed_rate, parent_b_hw);
+
+	/*
+	 * 1-bit mux register selects between the two parents.
+	 * CLK_SET_RATE_PARENT allows the divider's rate request to
+	 * propagate into clk_mux_determine_rate().
+	 */
+	fake_reg_a = 0;
+	mux_hw = clk_hw_register_mux(NULL, "bestdiv-mux",
+				     mux_parents, ARRAY_SIZE(mux_parents),
+				     CLK_SET_RATE_PARENT,
+				     (void __iomem *)&fake_reg_a,
+				     0, 1, 0, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mux_hw);
+	kunit_add_action(test, unregister_mux, mux_hw);
+
+	fake_reg_b = 0;
+	div_hw = clk_hw_register_divider_table(NULL, "bestdiv-mux-div",
+					       "bestdiv-mux",
+					       CLK_SET_RATE_PARENT,
+					       (void __iomem *)&fake_reg_b,
+					       0, 2, 0, no_div1_table, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	kunit_add_action(test, unregister_divider, div_hw);
+
+	/*
+	 * Expected maximum: mux selects the 4 GHz parent, divider applies
+	 * the smallest table entry (2): 4 GHz / 2 = 2 GHz.
+	 */
+	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
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
+MODULE_DESCRIPTION("KUnit tests for clk_divider_bestdiv()");
+MODULE_LICENSE("GPL");
-- 
2.53.0


