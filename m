Return-Path: <linux-renesas-soc+bounces-23500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3704C012A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0381A3A5B99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7682831281F;
	Thu, 23 Oct 2025 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="veccFRIk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Gj/YYY8O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE592D73B5;
	Thu, 23 Oct 2025 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761223033; cv=none; b=N3RSAscUfaigjyFlpKsRDDBUSvZxzfsAj1+YL9f/cra/IAj0yDtNzzluvecS6L8gmeYISJL2C3x6jRvUW54UUlgD8k1Ad5OR6rBQo8HqaliwXemf8DvwGIdATP7ohBDNLhTYvgAgN2GTT7YqgPq1JUNq1QvknNlqaHRxpMSNNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761223033; c=relaxed/simple;
	bh=Wr1oYdTzqRo6YQvotcE6dn0MHELFzWmzxAJ6vQ9urfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P42s6c16EIqoVzEyEg5mRjgVYBs3t8mz/o0IIpUYR+fWut9h9r0DGdjeDmEZ3M0sDSwUhcYA0hCzRSGvbNq6s2H3rBiqOStYEavSUtP2y275LBV/yTzHeRULDUApR7mkyHieEZvynrVdD83ddZ9DXUsf4E+lLKIAbxdm6GLkyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=veccFRIk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Gj/YYY8O; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cslsc23bsz9v7B;
	Thu, 23 Oct 2025 14:37:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761223028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUEq6RcBull/ifTwaW/9nwH/7Wp6ZcVLJhxbPx8UOdM=;
	b=veccFRIkToJfX8y40KMHb5BiKmUwtqvyUz7rOZ04WEABQXng1Zonv7CZca9i9Ul7APNFIV
	nIlGm76JGl0pW6FRy5EVDV8bZsYKSTVEDfYtR0MWZrswo7z7c8gS6KVp+eR6myaEQ+KA/h
	O1x1g3Xaw3E2KUaag+S58N/zSiZ4KKJvegrvc9Ag5Y5ERVoAqu+QKDO68PMqN8VK5mzGMb
	BrIbVbbJQ4mwAU0pIEzDXWh2GCk6m3Y7HyS+WBIS2B1hgffNJke0sZB9uCtbhICO3wu8by
	xkCY2JlZkA8t2nduJoeXCFJ+/f4omtQSSxiyCsVXA1avjbzMIwQl0xfW4zqYkQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Gj/YYY8O";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761223026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUEq6RcBull/ifTwaW/9nwH/7Wp6ZcVLJhxbPx8UOdM=;
	b=Gj/YYY8O8vtWy8wwezsfQTYQuW9119m6jWJKZelGuxZ1OgbLqVx06DWDRTSrUrvg4BH3rm
	qMXu+KepFL1cKaelxO/vRXaC/zoE1TQ/gE2j92u6AyAQUQR8lbTlUn7R5K0BKSIKM2fGhx
	q+WT+/OvPlR556k0D3TWn18FLj/hzqpeE1SFixUS6wWn/NSiZ1ExJtXOdxZ3AIpHo8TkXA
	Gbq6GItSOmuPyyrOGtL96UEIHIkZslJh0PIxqm5gvSLMs0ZP+kPEThfB1qla6zaWpTTu25
	vY4658q6+pzyH8Fdyrgl6wEqhvgnR9r34k8mPUPZmL7DtgM1Lz2h3yGvOqv7zg==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] firmware: arm_scmi: Implement arm,poll-transport property
Date: Thu, 23 Oct 2025 14:35:58 +0200
Message-ID: <20251023123644.8730-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: dbe5eedace6910ad7e8
X-MBO-RS-META: xycoz5xf7zpasbqw5mb4s1gwgb6s5hbw
X-Rspamd-Queue-Id: 4cslsc23bsz9v7B

Implement new property arm,poll-transport, which sets all SCMI operation into
poll mode. This is meant to work around uncooperative SCP implementations,
which do not generate completion interrupts. This applies primarily on mbox
based implementations, but does also cover SMC and VirtIO ones.

With this property set, such implementations which do not generate interrupts
can be interacted with, until they are fixed to generate interrupts properly.

The SMC transport is modified such, that it ignores interrupts described in
DT in case this property is set. This is an edge case, where the SMC transport
may use this property to ignore broken interrupts too.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/firmware/arm_scmi/common.h         |  4 ++++
 drivers/firmware/arm_scmi/driver.c         |  4 ++++
 drivers/firmware/arm_scmi/transports/smc.c | 20 +++++++++++---------
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c35c95fddbaf..7c9617d080a02 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -235,6 +235,9 @@ struct scmi_transport_ops {
  *		      to have an execution latency lesser-equal to the threshold
  *		      should be considered for atomic mode operation: such
  *		      decision is finally left up to the SCMI drivers.
+ * @no_completion_irq: Flag to indicate that this transport has no completion
+ *		       interrupt and has to be polled. This is similar to the
+ *		       force_polling below, except this is set via DT property.
  * @force_polling: Flag to force this whole transport to use SCMI core polling
  *		   mechanism instead of completion interrupts even if available.
  * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
@@ -254,6 +257,7 @@ struct scmi_desc {
 	int max_msg;
 	int max_msg_size;
 	unsigned int atomic_threshold;
+	bool no_completion_irq;
 	const bool force_polling;
 	const bool sync_cmds_completed_on_ret;
 	const bool atomic_enabled;
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 5caa9191a8d1a..1079c84608a2c 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2677,6 +2677,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	cinfo->is_p2a = !tx;
 	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
 	cinfo->max_msg_size = info->desc->max_msg_size;
+	cinfo->no_completion_irq = info->desc->no_completion_irq;
 
 	/* Create a unique name for this transport device */
 	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
@@ -3092,6 +3093,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 	if (ret && ret != -EINVAL)
 		dev_err(dev, "Malformed arm,max-msg DT property.\n");
 
+	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
+							      "arm,poll-transport");
+
 	dev_info(dev,
 		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
 		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index 21abb571e4f2f..85bfab650f100 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -177,16 +177,18 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	 * completion of a message is signaled by an interrupt rather than by
 	 * the return of the SMC call.
 	 */
-	scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
-	if (scmi_info->irq > 0) {
-		ret = request_irq(scmi_info->irq, smc_msg_done_isr,
-				  IRQF_NO_SUSPEND, dev_name(dev), scmi_info);
-		if (ret) {
-			dev_err(dev, "failed to setup SCMI smc irq\n");
-			return ret;
+	if (!cinfo->no_completion_irq) {
+		scmi_info->irq = of_irq_get_byname(cdev->of_node, "a2p");
+		if (scmi_info->irq > 0) {
+			ret = request_irq(scmi_info->irq, smc_msg_done_isr,
+					  IRQF_NO_SUSPEND, dev_name(dev), scmi_info);
+			if (ret) {
+				dev_err(dev, "failed to setup SCMI smc irq\n");
+				return ret;
+			}
+		} else {
+			cinfo->no_completion_irq = true;
 		}
-	} else {
-		cinfo->no_completion_irq = true;
 	}
 
 	scmi_info->func_id = func_id;
-- 
2.51.0


