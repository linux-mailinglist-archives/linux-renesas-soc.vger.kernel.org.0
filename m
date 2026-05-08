Return-Path: <linux-renesas-soc+bounces-32293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HnFAX0C/mkTlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:34:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE284F8BEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76378301DF5A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 15:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508E83FD135;
	Fri,  8 May 2026 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NcmY0dKo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2F22D0605;
	Fri,  8 May 2026 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254426; cv=none; b=ZJJHJ0mxOLsvfuK9QbiJAd2DT32iFOnCZp4Qr7AJWQ3JJEs8C8uUXBLgGLsx4BohxWOPIpQ+1H5GtnAUtqBsjiRVMmwfPuxAgTp6mXtVZhTbihxSGA16JzajWmHJ8NvSzzrlQ2PmbLfekULUZv0k03UOmmQEiLZhWV7cdVKOZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254426; c=relaxed/simple;
	bh=AxDBdwk/l4DP4oCMpuyPHG7biswl244Z7Wb0hlRCNKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvEI7aPvZwZ1Gm9HzaKtfQt29wgpPzb1zz753t83FjEy7nHFPRpY2Oku4NyTojZgfmWXfpgiFyn2WTWdZhYAtifgRUU6eZfaSCxvbRFhD1cJZL1Rcn8aDKhl8+/uuMpUP2hreaorzK0HsMjS1sUMtiP+0W2O/vNznulV8fWfq8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NcmY0dKo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D975335A1;
	Fri,  8 May 2026 08:33:38 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0303F836;
	Fri,  8 May 2026 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254424; bh=AxDBdwk/l4DP4oCMpuyPHG7biswl244Z7Wb0hlRCNKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NcmY0dKovz8e70ZeF/T913vLKpW75cT/hlc79E4C8Q7GquaaXcXhY8NZB/0W5WHUt
	 ixXfTstzv/RfRPzP5zp9M3MD3ZWngMxWBsM59t+1pJNDIms12ghNlSTCuIAHVjTy5F
	 OpyoJL1ALFGmXDpWSvULZungsBFQvNl18snw6Iaw=
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
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 05/15] clk: scmi: Use new simplified per-clock rate properties
Date: Fri,  8 May 2026 16:32:50 +0100
Message-ID: <20260508153300.2224715-6-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9DE284F8BEA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32293-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,arm.com:email,arm.com:mid,arm.com:dkim,baylibre.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
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


