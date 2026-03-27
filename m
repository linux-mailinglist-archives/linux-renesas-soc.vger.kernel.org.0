Return-Path: <linux-renesas-soc+bounces-30505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBGtFq7lxmnrPwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:16:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCCC34AC22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 21:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1DB130465FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A52E396B9D;
	Fri, 27 Mar 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lAZZSD+a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD24392807
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642269; cv=none; b=RWSXluaebQp40jzihptXQMt1C1LuzYb05NEhc5mzozBA4yxgRFtmIk0Dh9rI99+uatbnSGg/yEZGWD2PpZlE5vKkFKHhrQ3y1tpPz5i8+I87BzcdIiVecshvRQ3ij0hsnBbVhELIjUHdMX/50aaaFbqOmfL28bcbnIRWR+LN4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642269; c=relaxed/simple;
	bh=Nf9fpJIFLTTMH1rqOO6JktpjV7GwoTEpWSNjp1wHe10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLH0pMo7cgXEp2GGnEK5ZY2cqFU5RwTRPJpK3fAD8Z87uxPAYkUU4QC5lObZYMRvxfn6cnb0+f+UzG9TJ38ProYcLgPUML7hLP50K7XJ7QAYPeHpmNZZKWB1bGTCGk1D6+yOxNvwb3Q+QwxMoR3bMvRqqPUZbk7hQ1KfReniog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lAZZSD+a; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A2FB61A3033;
	Fri, 27 Mar 2026 20:11:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7748660268;
	Fri, 27 Mar 2026 20:11:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5862610451AD3;
	Fri, 27 Mar 2026 21:10:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774642260; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BKAN+LocEYluLXRUx1tcZNSjXU8bGN4GDJ0xBETLZYU=;
	b=lAZZSD+aUQ6+1kWQY2aytAygS/CmcZVLMi1w0xa/kWoGH1zqv9MjUDpInFse7Z/y6tCS0p
	pjbaS0qWWaf9sN2VcP0poZKbZDQZ//zEwDzDuPBB0xnWu5MrKoUQP5RD7iPzn/zqSyMof7
	9xa3I1dm1Y242bhTu8dqo9uqLQ9Wy11YgXIiTAWGQquAxDLqqbwXBi3bgcuMShz1RIyaXv
	jF2wgHchNBynoPGGstX9/7PHL7mcg9+JsBvX9MAeXosZmf9aUy38Wa7kKmqYUr3mBBetSU
	S+DTJLsBRuJAsNua48F/wFk1RjkB41x3n/xIV/T4kEsJXZjcxH/rvUUKjt4eLA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 27 Mar 2026 21:09:33 +0100
Subject: [PATCH 11/16] clk: tests: Add Kunit testing for nexus nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-schneider-v7-0-rc1-crypto-v1-11-5e6ff7853994@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30505-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,clk_parse_clkspec_1_init_data.name:url]
X-Rspamd-Queue-Id: 7DCCC34AC22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a nexus node with a child requesting a mapped clock in the fake DT
overlay to verify that the parsing is also correctly working.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/clk/clk_test.c                   | 20 ++++++++++++++++++++
 drivers/clk/kunit_clk_parse_clkspec.dtso | 10 ++++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 8a17ad0d185f..cb0071955146 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3660,10 +3660,30 @@ static void clk_parse_and_get_parent_name(struct kunit *test)
 			   clk_parse_clkspec_1_init_data.name);
 }
 
+static void clk_parse_and_get_nexus(struct kunit *test)
+{
+	struct clk_parse_clkspec_ctx *ctx = test->priv;
+	struct clk_hw *hw1, *hw2;
+	struct device_node *np;
+
+	/* Get clocks by index */
+	np = of_find_node_by_name(NULL, "kunit-clock-nexus-child");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, np);
+	hw1 = of_clk_get_hw(np, 0, NULL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw1);
+
+	hw2 = of_clk_get_hw(ctx->cons_np, 1, NULL);
+	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, hw2);
+	KUNIT_EXPECT_PTR_EQ(test, hw1, hw2);
+
+	of_node_put(np);
+}
+
 static struct kunit_case clk_parse_clkspec_test_cases[] = {
 	KUNIT_CASE(clk_parse_clkspec_with_correct_index_and_name),
 	KUNIT_CASE(clk_parse_clkspec_with_incorrect_index_and_name),
 	KUNIT_CASE(clk_parse_and_get_parent_name),
+	KUNIT_CASE(clk_parse_and_get_nexus),
 	{}
 };
 
diff --git a/drivers/clk/kunit_clk_parse_clkspec.dtso b/drivers/clk/kunit_clk_parse_clkspec.dtso
index c93feb93e101..a4115216d2aa 100644
--- a/drivers/clk/kunit_clk_parse_clkspec.dtso
+++ b/drivers/clk/kunit_clk_parse_clkspec.dtso
@@ -18,4 +18,14 @@ kunit-clock-consumer {
 		clocks = <&kunit_clock_provider1 0>, <&kunit_clock_provider2 0>;
 		clock-names = "first_clock", "second_clock";
 	};
+
+	kunit_clock_nexus: kunit-clock-nexus {
+		clocks = <&kunit_clock_provider2 0>;
+		clock-map = <&kunit_clock_provider2 0>;
+		#clock-cells = <0>;
+
+		kunit-clock-nexus-child {
+			clocks = <&kunit_clock_nexus>;
+		};
+	};
 };

-- 
2.51.1


