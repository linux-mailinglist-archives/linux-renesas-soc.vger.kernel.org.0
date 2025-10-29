Return-Path: <linux-renesas-soc+bounces-23886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D053C1D20D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 21:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F3BE4E0F4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 20:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E003D312804;
	Wed, 29 Oct 2025 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iRMSb9PE";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZB75Bc6r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995723D7DC;
	Wed, 29 Oct 2025 20:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768337; cv=none; b=kKh4NccV9Xc3sfHZ8w0lmTs4Qb3w/z+gjlxa40i9Su7IJBCtK+1HQBNVjeB5Gej9LfDbSYq8O20105PSDsBA+wbLq/7Wtkzph1pE33a/BNQ1qweAp8V2kcDe2v93sAv45Q+Aj5/fug9VNZZ5BUdjx5ANW/gL8jPI9d4sRlzvSHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768337; c=relaxed/simple;
	bh=kp6ZDIC/iGVnuBxTaZmqRqVWyyOmYss4wwclZT5JwL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEU/oR2yY/3H0PIPJsQYjabpfRgwrXsWUW/mB6MWqa/aNYusDeiwex70CndX7yCiibPdW4e3FskaYS4jzZiK7Rv/QKne4UcQSQCnaw+4R5UtG9dQXnp+hfzoF3K9AezqIzdnRtTkyXzOKgJ1eSE+FDCrTA4dbuxOVfdBVJltXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iRMSb9PE; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZB75Bc6r; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cxdXF1JVrz9ss2;
	Wed, 29 Oct 2025 21:05:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761768333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3pNwVsn1YqvWlBCh6sQol9F7GLrxYIj+kVcupG+FwpU=;
	b=iRMSb9PEUco2rUc7M/zK/kzwrSwI3GiG4teT50Iyp/nqX9R6qay38Jahe81zAPnvYsCPEf
	DCArAt/smeKS7itB8wNzxZEwlg7RV7WsT8OooCQVN+FQL/R5lIb0e53KEWTb5zKsrf2d07
	KulIUg9EcjAPmhv4r04IxSaBjD6kLtZwTGVQZw72UT1MOXmynmeCRmQYNB5BhrK7aq/php
	xPlZQ7/98HM6InYvHRuaE0DzGdxzK3gBvA/NfKs02DR0e1RtBsMZ83n57yVCmWS/IdJ24b
	XpKZlIeV9D4wNU0qQZEhkJ/m2TTn5cEueBX5iOVFgMGvYxYgwq4Yfs8Y6/MpmA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761768330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3pNwVsn1YqvWlBCh6sQol9F7GLrxYIj+kVcupG+FwpU=;
	b=ZB75Bc6rWBLS3CZBWHHXVIlzA8rxBjbYoeSl1k9zby5gCnbV6mscq/XvPMlEJdWDR/SysF
	VgBugZvDI+3JW7d4PQw49ahqXevj6rXBgmgwdF4sJ0BjfvSkcydv7sY3ezwJnnP8AlADdY
	+KnRJK83ld43KYVaG8uzRf6aY1Yymqz3bfJvV8hv7Nu3Z9vS5ixbryhEv5tNzxjc+F6gDl
	bGC8CSk0oax3IWuiGJQzSF1oX/qNI1be967DGAEHD7fakimiSWU4x46vBjCAYkjQWcXdbW
	BX1Ket1Pc7WT8hXjb8T9/qjJO6RUUJgslMJB8epI7LdrrV+kXf6QRjCyWPg8bQ==
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Align panel example with ili9881c binding
Date: Wed, 29 Oct 2025 21:04:48 +0100
Message-ID: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: eaf32140336299c8802
X-MBO-RS-META: 96ui4nfkdngs31aq7hepkrbh97awsb37

Update the panel example in this DT schema to match requirements in binding
display/panel/ilitek,ili9881c.yaml . This fixes the following schema check
warnings:

"
/tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch'] is too short
        from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
/tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
        from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
"

Fixes: c376a6943741 ("dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index 51d685ed82891..b95f10edd3a29 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -157,7 +157,8 @@ examples:
 
         panel@0 {
             reg = <0>;
-            compatible = "raspberrypi,dsi-7inch";
+            compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+            power-supply = <&vcc_lcd_reg>;
 
             port {
                 panel_in: endpoint {
-- 
2.51.0


