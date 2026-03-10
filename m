Return-Path: <linux-renesas-soc+bounces-29149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKoFAwJnsGloigIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:46:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B4B2569FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 19:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0802630603CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 18:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C1C3DC4DA;
	Tue, 10 Mar 2026 18:41:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEF838BF87;
	Tue, 10 Mar 2026 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168068; cv=none; b=WUeMJlc+BzvlkeDMGArimko69EUq8powRkjOAiux6L2BCrr8sBgFhlbJ+CzBAZYZlBo1lX6hMPNr+/58Nkoxm3wSTW2bGNf1oHMz6NriV5vbtwOHNR20mRxwsQ343cyCJLmVvvt51S8JoMcxGEi0E7ssuoZERIgljXF1drSWyC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168068; c=relaxed/simple;
	bh=AxDBdwk/l4DP4oCMpuyPHG7biswl244Z7Wb0hlRCNKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqIGK1c7YM1RkfsNF4rm1mm24dpzqRXOFA2vr3jI49DX0/xz2ooNt299TfZ8AAtCkFaEYcEEbqQTxryCH382w0JlsBUKvi/vOZtYhVWGv79W7viqnjWJcRtTaZUPrnVobQXCjnqud6VlAWwHRg21FlKcLQKtamFj3F6JIdF/Uis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C1DD14BF;
	Tue, 10 Mar 2026 11:40:55 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 080643F7BD;
	Tue, 10 Mar 2026 11:40:57 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 05/13] clk: scmi: Use new simplified per-clock rate properties
Date: Tue, 10 Mar 2026 18:40:22 +0000
Message-ID: <20260310184030.3669330-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 60B4B2569FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29149-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org,nxp.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,baylibre.com:email,nxp.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use the new min_rate and max_rate unified properties that provide the
proper values without having to consider the clock type.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v1 --> v2
 - Collected Peng Reviewed-by tag
---
 drivers/clk/clk-scmi.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index c223e4ef1dd1..7c562559ad8b 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -202,7 +202,6 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 			     const struct clk_ops *scmi_ops)
 {
 	int ret;
-	unsigned long min_rate, max_rate;
 
 	struct clk_init_data init = {
 		.flags = CLK_GET_RATE_NOCACHE,
@@ -217,20 +216,8 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 	if (ret)
 		return ret;
 
-	if (sclk->info->rate_discrete) {
-		int num_rates = sclk->info->list.num_rates;
-
-		if (num_rates <= 0)
-			return -EINVAL;
-
-		min_rate = sclk->info->list.rates[0];
-		max_rate = sclk->info->list.rates[num_rates - 1];
-	} else {
-		min_rate = sclk->info->range.min_rate;
-		max_rate = sclk->info->range.max_rate;
-	}
-
-	clk_hw_set_rate_range(&sclk->hw, min_rate, max_rate);
+	clk_hw_set_rate_range(&sclk->hw, sclk->info->min_rate,
+			      sclk->info->max_rate);
 	return ret;
 }
 
-- 
2.53.0


