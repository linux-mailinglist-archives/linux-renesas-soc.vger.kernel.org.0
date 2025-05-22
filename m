Return-Path: <linux-renesas-soc+bounces-17383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35001AC0E6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2945171BBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CF128C865;
	Thu, 22 May 2025 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="kmMxV6h8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9828A402;
	Thu, 22 May 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924775; cv=none; b=WZ6B0mxU1W7JfN7B+dQnWFuM8/lVFy8TZmD9B/wyKhZj0ebSIPureZUPwuCXHhHO8yYW5fRaSa336rknlAzSRasQSOBmjPHKM6UiaJ6Q78TfpKVrGofoVFv6gO1ft9P7QXW2RMEMoVSlcBTqsP5Y5f8mvcZ1CFVv9HxnzqyNQ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924775; c=relaxed/simple;
	bh=Q54gcv8GTTG3n+DbOFd2Nu8bCCMUkr75rkCiPxbFzEY=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:MIME-Version:
	 Subject; b=OOBL/c8XM0XpWHu8PnjFhDc9Gz1V5pZuLUDHAmyQ9R9meSzru+9fxZ6LUfwSQjTE7StNNM3+IPKnU7VtE1xtMJowcZa/P/5CEWmSXgMoGowhxa5Z3rYfyTeQtmQ9rzYl7wa3KMj7zOYlkpojHxQ05Eo6aNbsFp9LPVspn89ELLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=kmMxV6h8; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=37ltNrDm/SQxtBtReU+dzvAvwRTeydEOy/6HO4fUSEY=; b=kmMxV6h8CX6wWpsfmwF5Jl1o/c
	my7Q40vkqUzyx2Wcq+t0inyd950IfjagSp1WVY2a6c7z+42N9KDxfzn1elwidC2jI9uLj1LRnQUvx
	HyCSpoOG39SOw0aTDjVCCo0kAU9OVM0/LwQM94MqxkvQ1i/3ygMNiFiY66ipIi62sXOY=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33178 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uI74x-0006Gk-RM; Thu, 22 May 2025 10:39:28 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: biju.das.jz@bp.renesas.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Chris Brandt <chris.brandt@renesas.com>
Date: Thu, 22 May 2025 10:39:11 -0400
Message-Id: <20250522143911.138077-3-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522143911.138077-1-hugo@hugovil.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH v3 2/2] drm: renesas: rz-du: Set DCS maximum return packet size
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The default value of 1 will result in long read commands payload not being
saved to memory.

Fix by setting this value to the DMA buffer size.

Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a048d473db00b..745aae63af9d8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -549,6 +549,7 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
+	u32 value;
 	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
@@ -561,6 +562,15 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
 
 	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
 
+	/*
+	 * The default value of 1 will result in long read commands payload
+	 * not being saved to memory. Set to the DMA buffer size.
+	 */
+	value = rzg2l_mipi_dsi_link_read(dsi, DSISETR);
+	value &= ~DSISETR_MRPSZ;
+	value |= FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
+	rzg2l_mipi_dsi_link_write(dsi, DSISETR, value);
+
 	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
 		goto err_stop;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 0e432b04188d0..26d8a37ee6351 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -81,6 +81,10 @@
 #define RSTSR_SWRSTLP			(1 << 1)
 #define RSTSR_SWRSTHS			(1 << 0)
 
+/* DSI Set Register */
+#define DSISETR				0x120
+#define DSISETR_MRPSZ			GENMASK(15, 0)
+
 /* Rx Result Save Slot 0 Register */
 #define RXRSS0R				0x240
 #define RXRSS0R_RXPKTDFAIL		BIT(28)
-- 
2.39.5


