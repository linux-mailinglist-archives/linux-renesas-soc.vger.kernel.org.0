Return-Path: <linux-renesas-soc+bounces-26230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB14CEC953
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 22:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA57230072B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 21:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23C22C234C;
	Wed, 31 Dec 2025 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="V+PrdWEb";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nSq15YkJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C69D1B0F19;
	Wed, 31 Dec 2025 21:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767216641; cv=none; b=a/Mv7lh6h6y9nSFmSckl4ZBOI7m6RkcXYlZO/UbqCp2k4ugqYdXWRiR/mLYHMNfYsv4Fjc5yxWF4StDiOz1LhPnCIJuiaqvgM7fzKoQLH3Uf+eOhohy8vAsvcamgDoVfEWta6EWA0GvueJQ5383RvG+2q+fGGYQLeFuxYGedC7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767216641; c=relaxed/simple;
	bh=f+ynSIbzgRnAeUsz9VXAkIxubDjjcfeN0BsWGw4ZEzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyIs7QxjAASuFgypfJuGkjHoYjdMjDlBiRRSCbH/TOU1Iwj9FcGb74GwExxYExblCvdfM9LN6YCCS5wtqD2opVn8VNz943C2vEyxMfmlxzxhh5Om4K4B07bpDuaRY0KSYoobayNb+yoTi6x/nyg8xyR/lZ1nc3L864Ej2WNU0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=V+PrdWEb; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nSq15YkJ; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhNRD2Kz2z9thH;
	Wed, 31 Dec 2025 22:30:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767216632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQXAEmY/Vvhl0fyeDwyL8OMowe+zB8+6FttAYmG6UeU=;
	b=V+PrdWEbTiF7xbU00WLbMvdOycdJu0DASygQ4zJ+fR3JaCoCwG2CZ1HUusCF7ukMp9MlTB
	LgaVNm8iX4WTf8v19TWvLNu5KzlJ9gMcIWZdR4eI4JoFbKG3Rvid4Y5cbTVENj5OWm176+
	lddZuPp2H9GqlPhifcfscv34VOF7CllsQNh/n6CAccpAIxeOstf9gC5dZW6cUKNzPc/hDG
	inaUS7L49HDZTMiPYgnmAwjCuq0ac4xDH1y9KyfwfLxVCmXyf0POrPNUIXtkt9WHMZFBDz
	WdjxwwN9hUSCEuy1l364xuPc0J0YNnTTu1PjNov100UtaD5FNh60waFITexeVQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767216630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQXAEmY/Vvhl0fyeDwyL8OMowe+zB8+6FttAYmG6UeU=;
	b=nSq15YkJjGweuoPykVvsdMDTDo/cHF7hqE9PD4K9V+CTgx14YRNZ2M8FfdJU60ZN5gj0Qr
	fDiFmySMF4bWwlCkShgnsi+nq3z0/0ANUbv6pMxDuItGWtP3Bd++FHC+qcj0cnBIIq9rlL
	ZB6T7P5djDbYsa6G5tJ7ID85XlniYT7DNFx8Se68PcPNaDrv/dDkJN2gmudeQYRDubxkNg
	flxuY+CSQWFD/j3JX1z3aboV1iZunVJ8JD36ay2hSf9PUtvr/9Pm/himuM5eozJZcUi8bd
	qtKymntlz8065dr8E7ZGl6MKrs7MqZbz5kZ/eGHaPfHSSlL5e6wZuNAr2xtXxg==
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
Subject: [PATCH v2 2/2] firmware: arm_scmi: Implement arm,poll-transport property
Date: Wed, 31 Dec 2025 22:29:19 +0100
Message-ID: <20251231213016.185575-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
References: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: c3g4jjx5wuiwq1jho4hnwdag4u7jhfzu
X-MBO-RS-ID: f8e5ab9604735278ab4

Implement new property arm,poll-transport, which sets all SCMI operation into
poll mode. This is meant to work around uncooperative SCP implementations,
which do not generate completion interrupts. This applies to mbox/shmem based
implementations.

With this property set, such implementations which do not generate interrupts
can be interacted with, until they are fixed to generate interrupts properly.

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
-- 
2.51.0


