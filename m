Return-Path: <linux-renesas-soc+bounces-26792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752DD21E4A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 01:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21C2A3026AF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 00:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26AE17DE36;
	Thu, 15 Jan 2026 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SF5CWzRo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I5ZfffJb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E76427456;
	Thu, 15 Jan 2026 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438180; cv=none; b=knMZUEI/vtVmmn3V8GiLqW7BWhaDjbMn5eTOi3d65ezxQtHnuFMWTWZCwLJcXTS/VilLE8lRKwRdZabtza4jVeRo9atIIpuMLcuELM3dSaSO1cU0gJnT7rbOIl3A0MRVQDDWybi23yyfGIgmslrWl+4ihJtCtrrsisf9Q7ogxz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438180; c=relaxed/simple;
	bh=wYCY1pxzKQkjbv4kdoUFNvWFBLbK7E2szQFk6tb4P8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ren70gAidBkD8pJQPlbFDxYZcJQWOhBHnrgPqCfzkr5jKK1zTJsEoGikKDhZjaQ4v5H3nTu8iS0poxP1V7MoullHn7w+xqgr5SCZ0VRLjQCfchhXycu5vN4k8MYfFkxpYK2oxka9EbwTh/2z/KIVsUADnX8XU63Fe/44MrmjYG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SF5CWzRo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=I5ZfffJb; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ds4BM2wF5z9tFN;
	Thu, 15 Jan 2026 01:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768438171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fibLDiv5UUGAgvXNRj0aodIc0SorV59XBE18JhLB0hc=;
	b=SF5CWzRo1YG4ooEsJ6xYhrzCeG/gfCXXHgPOf5wzIEguAXVS7S1aonpL0BltFW/edR8yb6
	P5cniITTV19GtlH86mKOn6H29RZyUbFXiJ5112rCHzZu8rYa9hwYQmrwh0Tzl2PzrKKbRd
	c27/AtPtD7MknuTIscZOsMekbEkraz7ECmOa5RBQueCs9aqHlXTqC5dJRfAM8SfmaOzSwe
	4HVYVPVlVabK7TxDPbsFylycVF1tm5bUp2cVstGKVFnCsLTXcEXvcSV+0MAXyyqQlMcV07
	K/Rg8JT10uWGypzyuLOqG3KGfRmqsWg0HLbVAB5uu5XjPX6kVwuHCEiyTCFneg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=I5ZfffJb;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768438169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fibLDiv5UUGAgvXNRj0aodIc0SorV59XBE18JhLB0hc=;
	b=I5ZfffJbwh0/nFUYO4qV4SOJCxkd/sVQFjkiyq5667RUPn2QlvzDrQ74ymcwsBCs7qiHHO
	lic1tjSmET0ZTp9erOh6t3OtLhhwcseeMN7ETE27oAlaZCaXDwSLQlDRYPJrwddpWgLhQ3
	ctUVzYI41846YOE7czCZcGt5r1QUphY81NrIhf8qe2dmVYQks/UI/DtVeSdv6/P6uAAFRq
	hHHVEz8kuUBgCVJYGaIfxgr83wALnomqeiLbEglZIZehz52m3xarGr8Jub40pZl/+ZC4Fr
	FpNnroCtkrVtOqDNqGnwkTf2l8q+rikVxJWN4y0YBoZp4G3SgEBgjsvBpXO2pQ==
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
Subject: [PATCH v3 2/2] firmware: arm_scmi: Implement arm,no-completion-irq property
Date: Thu, 15 Jan 2026 01:48:57 +0100
Message-ID: <20260115004921.548282-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
References: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 555a4aa9c6b107d7af9
X-MBO-RS-META: 9sd5h5jh3fran9x4bgwhrg1xhawsyszs
X-Rspamd-Queue-Id: 4ds4BM2wF5z9tFN

Implement new property arm,no-completion-irq, which sets all SCMI
operation into poll mode. This is meant to work around uncooperative
SCP implementations, which do not generate completion interrupts.
This applies to mbox/shmem based implementations.

With this property set, such implementations which do not generate
interrupts can be interacted with, until they are fixed to generate
interrupts properly.

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
V2: Drop no IRQ handling from SMC transport and update commit message
V3: Rename property from arm,poll-transport to arm,no-completion-irq
---
 drivers/firmware/arm_scmi/common.h | 4 ++++
 drivers/firmware/arm_scmi/driver.c | 4 ++++
 2 files changed, 8 insertions(+)

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
index 3e76a3204ba4f..f167194f7cf67 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 	cinfo->is_p2a = !tx;
 	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
 	cinfo->max_msg_size = info->desc->max_msg_size;
+	cinfo->no_completion_irq = info->desc->no_completion_irq;
 
 	/* Create a unique name for this transport device */
 	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
@@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 	if (ret && ret != -EINVAL)
 		dev_err(dev, "Malformed arm,max-msg DT property.\n");
 
+	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
+							      "arm,no-completion-irq");
+
 	dev_info(dev,
 		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
 		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,
-- 
2.51.0


