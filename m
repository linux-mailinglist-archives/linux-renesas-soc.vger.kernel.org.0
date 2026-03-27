Return-Path: <linux-renesas-soc+bounces-30499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BO6AfvkxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:13:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE9034AB08
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82AFA30DC637
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48224391846;
	Fri, 27 Mar 2026 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HNst5lEK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0BF3914E6;
	Fri, 27 Mar 2026 20:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642247; cv=none; b=DODhjeKbpTlkCDmEO4aqVeNK/QSnabJ8qtYvyKOhhmVelvVvgNLttT4RqcD/okytm+NSSht84uAxHSEBqlvjI+rSEKnS6ghEWJ0mcpg8DXF31uyhp1NJ5EngX4EqVRUg8jXUz/ks//6VqhwP1b3IyoPMRtKrKpLjpZQOJOd6ldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642247; c=relaxed/simple;
	bh=V2Ucjlnq6F7T0l1eyGdxDcz1FFk7mZXmicOeOjM5NZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+6phyB4pty8mAutnEvOBrumqmsuK4uO4OM22efVwfMOy1sOdsGiKkprO1CTz6xh6ZGYgv29D9AZHTfmW9OkDCz2Pb/AO+WHQesit4DIwkj2D00APL33DEsvWRelHE2El9WpbcxQm50j0XPBFWCZ8BjUt7f5T8ELwBiw1Gh5f6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HNst5lEK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 62CA51A3031;
	Fri, 27 Mar 2026 20:10:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3703160268;
	Fri, 27 Mar 2026 20:10:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE32310451AF7;
	Fri, 27 Mar 2026 21:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642243; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PoWhX1f1C+/gL0C9rOWynwwHI1wiltSKnP2Q+IJsRlQ=;
	b=HNst5lEKiU6j6jYNf5TaNlJQO7ylUMFm6BpTeLa6X2AxcUDxa41pZPcl33ijbUWMSUN3Hm
	2SKatKsxzVN0pB6U3B+zfCTMZDGt6rhMjs3vU+FNZbFoZnc8EqgZ1Vzce94XtOSgjE4792
	dgV2Yl/qMppGHeILzS+KUeAM/MztHIAzxNwpl70KGgODuzpC7nNrSk4C58TcIhryossGXv
	tnJ5EDdu3A33EiXOmDfO/d32nnlURrQ4O12pv+KVNmMZGFeVMceVI+9g755NWnyAuTOaNN
	bknzHx87mggu9E4zp8lSIPSlM0pv+xSrCvJZVUw26iZH9mkhq8ILoLKRAjhdKg==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:28 +0100
Subject: [PATCH 06/16] clk: tests: Add clk_parse_clkspec() Kunit testing
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Jayesh Choudhary <j-choudhary@ti.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Antoine Tenart <atenart@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30499-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9AE9034AB08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Create a new set of kunit tests to make sure clk_parse_clkspec() is
working as expected. We currently verify if we get a proper device when
using indexes and names. If we make an out of bounds request we expect
an error.

For testing purposes, we must ensure of_clk_get_hw()'s symbol is
exported.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/Makefile                     |   1 +
 drivers/clk/clk.c                        |   1 +
 drivers/clk/clk_test.c                   | 124 +++++++++++++++++++++++++++++++
 drivers/clk/kunit_clk_parse_clkspec.dtso |  21 ++++++
 4 files changed, 147 insertions(+)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f7bce3951a30..97b621456bf5 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -19,6 +19,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_zero.dtbo.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
+				   kunit_clk_parse_clkspec.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df3..1795246b10a0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5312,6 +5312,7 @@ struct clk_hw *of_clk_get_hw(struct device_node *np, int index,
 
 	return hw;
 }
+EXPORT_SYMBOL_GPL(of_clk_get_hw);
 
 static struct clk *__of_clk_get(struct device_node *np,
 				int index, const char *dev_id,
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb..b814b45f1f7e 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3541,10 +3541,134 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
 	.test_cases = clk_hw_get_dev_of_node_test_cases,
 };
 
+static const struct clk_init_data clk_parse_clkspec_1_init_data = {
+	.name = "clk_parse_clkspec_1",
+	.ops = &empty_clk_ops,
+};
+
+static const struct clk_init_data clk_parse_clkspec_2_init_data = {
+	.name = "clk_parse_clkspec_2",
+	.ops = &empty_clk_ops,
+};
+
+static struct clk_hw *kunit_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	return (struct clk_hw *)data;
+}
+
+struct clk_parse_clkspec_ctx {
+	struct device_node *prov1_np;
+	struct device_node *prov2_np;
+	struct device_node *cons_np;
+};
+
+static int clk_parse_clkspec_init(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx;
+	struct clk_hw *hw1, *hw2;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	test->priv = ctx;
+
+	KUNIT_ASSERT_EQ(test, 0, of_overlay_apply_kunit(test, kunit_clk_parse_clkspec));
+
+	/* Register provider 1 */
+	hw1 = kunit_kzalloc(test, sizeof(*hw1), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw1);
+	hw1->init = &clk_parse_clkspec_1_init_data;
+
+	ctx->prov1_np = of_find_compatible_node(NULL, NULL, "test,clock-provider1");
+	KUNIT_ASSERT_NOT_NULL(test, ctx->prov1_np);
+
+	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov1_np, hw1));
+	of_clk_add_hw_provider(ctx->prov1_np, kunit_clk_get, hw1);
+	of_node_put(ctx->prov1_np);
+
+	/* Register provider 2 */
+	hw2 = kunit_kzalloc(test, sizeof(*hw2), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw2);
+	hw2->init = &clk_parse_clkspec_2_init_data;
+
+	ctx->prov2_np = of_find_compatible_node(NULL, NULL, "test,clock-provider2");
+	KUNIT_ASSERT_NOT_NULL(test, ctx->prov2_np);
+
+	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov2_np, hw2));
+	of_clk_add_hw_provider(ctx->prov2_np, kunit_clk_get, hw2);
+	of_node_put(ctx->prov2_np);
+
+	ctx->cons_np = of_find_compatible_node(NULL, NULL, "test,clock-consumer");
+	KUNIT_ASSERT_NOT_NULL(test, ctx->cons_np);
+
+	return 0;
+}
+
+static void clk_parse_clkspec_exit(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+
+	of_node_put(ctx->prov1_np);
+	of_node_put(ctx->prov2_np);
+	of_node_put(ctx->cons_np);
+}
+
+/* Test DT phandle lookups using correct index or name succeed */
+static void clk_parse_clkspec_with_correct_index_and_name(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	struct clk_hw *hw1, *hw2, *hw3, *hw4;
+
+	/* Get clocks by index */
+	hw1 = of_clk_get_hw(ctx->cons_np, 0, NULL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw1);
+
+	hw2 = of_clk_get_hw(ctx->cons_np, 1, NULL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw2);
+	KUNIT_EXPECT_PTR_NE(test, hw1, hw2);
+
+	/* Get clocks by name */
+	hw3 = of_clk_get_hw(ctx->cons_np, 0, "first_clock");
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw3);
+	KUNIT_EXPECT_PTR_EQ(test, hw1, hw3);
+
+	hw4 = of_clk_get_hw(ctx->cons_np, 0, "second_clock");
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw4);
+	KUNIT_EXPECT_PTR_EQ(test, hw2, hw4);
+}
+
+/* Test DT phandle lookups using wrong index or name fail */
+static void clk_parse_clkspec_with_incorrect_index_and_name(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	struct clk_hw *hw;
+
+	/* Get clock by index */
+	hw = of_clk_get_hw(ctx->cons_np, 2, NULL);
+	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
+
+	/* Get clock by name */
+	hw = of_clk_get_hw(ctx->cons_np, 0, "third_clock");
+	KUNIT_EXPECT_TRUE(test, IS_ERR(hw));
+}
+
+static struct kunit_case clk_parse_clkspec_test_cases[] = {
+	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
+	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
+	{}
+};
+
+/* Test suite to verify clk_parse_clkspec() */
+static struct kunit_suite clk_parse_clkspec_test_suite = {
+	.name = "clk_parse_clkspec",
+	.init = clk_parse_clkspec_init,
+	.exit = clk_parse_clkspec_exit,
+	.test_cases = clk_parse_clkspec_test_cases,
+};
 
 kunit_test_suites(
 	&clk_assigned_rates_suite,
 	&clk_hw_get_dev_of_node_test_suite,
+	&clk_parse_clkspec_test_suite,
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
diff --git a/drivers/clk/kunit_clk_parse_clkspec.dtso b/drivers/clk/kunit_clk_parse_clkspec.dtso
new file mode 100644
index 000000000000..c93feb93e101
--- /dev/null
+++ b/drivers/clk/kunit_clk_parse_clkspec.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	kunit_clock_provider1: kunit-clock-provider1 {
+		compatible = "test,clock-provider1";
+		#clock-cells = <1>;
+	};
+
+	kunit_clock_provider2: kunit-clock-provider2 {
+		compatible = "test,clock-provider2";
+		#clock-cells = <1>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clock-consumer";
+		clocks = <&kunit_clock_provider1 0>, <&kunit_clock_provider2 0>;
+		clock-names = "first_clock", "second_clock";
+	};
+};

-- 
2.51.1


