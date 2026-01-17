Return-Path: <linux-renesas-soc+bounces-26947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 419CAD38AFE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Jan 2026 02:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 351B3302BF5D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Jan 2026 01:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A7314A4F9;
	Sat, 17 Jan 2026 01:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yWW6bQ22";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ipvjzjmm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439A135A53;
	Sat, 17 Jan 2026 01:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768611782; cv=none; b=GcKGs5DHSo0pfM87dtsbJFLNkfp6G7bXIwivQpf4EMXn/BFPNP73tGM+thfqpQJq1K80Fai+o/XCVovtCOwFXbe2t7o0jgYjewVYPa/8C6DcIxYdT0UzAzj0TRwdLhUUtECIBOrxLX2IMqvI8RD9bFR65s9DEWrvR3hzQ0oAIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768611782; c=relaxed/simple;
	bh=f8fo0SvAOjbxMGp/InDAGLFeXKZCyNo/Izhim/CrExA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSbDl3LUckWxKiadcTsGnaeMO6Qs/y+b45lSPFE47BD7KDy+lSXOnIeNSsJhd3VN2C/PU4MkmcsldlfKpmKVxKIDRgadlHyNaD9VIXKW9F15Yl4Om2H6DaqEIr9mwO6NIN38sqgp42PdmUDSsS1c4Xr6Ep5Oy1IkQIWmao/2V9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yWW6bQ22; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ipvjzjmm; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dtJNr5XH4z9twH;
	Sat, 17 Jan 2026 02:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768611772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BIMy8yDIZFc3vCLph+L6vr3OpFe2zAoNw7tBRg23UQo=;
	b=yWW6bQ22rNO399AsGIyNquA/5yUDhjk4871WbI0ndxjI21zX/U/20JfowCPr30lOKN5Ezn
	xkp9zGD76rJkjnXhtSJ7hfF8tg0KciyCcpHwuGqmlVaKmu4UdV7aGuKcl45dORVWAwpVit
	b/s1lNY+TOGe8kzgakW2th0S2l79M+nBsDD8S5l7AcWoyRy3DUmvI7/9QKpqvSfqrHEDnS
	CaKSptbCBYy51jFlnJjFtOyphFS5s+glQPkuL/ehlj4rvPeENdFoS2Y6DoqTVnINcpGAnx
	dEr+CWT1DI7gvh2WcHOZOCXW8Ef4K2C6k65GFJBCKoj1DYjTK4C18S352Re8ZA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768611770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BIMy8yDIZFc3vCLph+L6vr3OpFe2zAoNw7tBRg23UQo=;
	b=ipvjzjmmdftndG9XdlrNtvIj6v/mK/pfvyPRJF3yQV2htLpt5LWS6I0zNjCZSP3/3Pua1v
	9GXbaJdGb68ouG4aIsMCHvkqeKg6u+1QYi4cXXt8IMswIW6O0wBJIuZxdItyqWJYhcWDXz
	2TXRZvT5RbqmpH7O/E8DL87pbQEZoK46UHQpOLIKzkvm6EmQ9z63A4xa5X3gUn9nKlzfpN
	NGm7XVz3uMVul2p4tB2c0BoujEKzLqkNTwerdvLDaMMlC6aAM5TC6eeUiXbFYlDzuOyLBO
	1sy4UfaDQwN7dnZTz10N0eYvFR1zf0cT5PKwLSTWQvGENPvhgCuQLaryImUhSA==
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
Subject: [PATCH v4 2/2] firmware: arm_scmi: Implement arm,no-completion-irq property
Date: Sat, 17 Jan 2026 02:02:29 +0100
Message-ID: <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 25a0f1a54ec24069373
X-MBO-RS-META: qfujatekmmsnu1b9r7pn4z7uf37ihcqt

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
V4: No change
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


