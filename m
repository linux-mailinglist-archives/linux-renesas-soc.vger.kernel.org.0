Return-Path: <linux-renesas-soc+bounces-26796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A8D22277
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 03:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A35D03026BEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 02:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F73218ACC;
	Thu, 15 Jan 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NNCyICxZ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="J68BUYdI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D2C27703A;
	Thu, 15 Jan 2026 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444822; cv=none; b=OclYEqiPVZeWtQS4wLZnvtmUQtrDYztsawE6acepRTUn3QvjNhBqNGD2+s7WRBrkyADqrYJXc3K233J5Cy4s6aUGF84/AxP0URD6Gic4SYp8huXXJB3jUf0borMQ2UwbxDPMLmycZMrj7zypk60qejNazt0+iA5MUpsLLV2O7wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444822; c=relaxed/simple;
	bh=x+1pfqPvP7BaM8zQ2Vh+exaVrBGYjuu5J+nMM1/T8bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XV9VqG7DpzvqC6eZagIu1Jqy+5YQbm98eg7vlh79DOIRkdqtWvQMa2UTmXLiX3OUJ+ygcT67MrBOq6o3ePaUDD0jFqBsNVde8pt7YYTxOyf36E+6AgNWLRUPbTMOTvT98AHQluZtgJ42Yx1KOFoxQoaUS02W0Lyr62M5wUUVCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NNCyICxZ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=J68BUYdI; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ds6f929Jrz9skw;
	Thu, 15 Jan 2026 03:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DY9N5zfPsUiIrMcqb786BHFeYZkJaYbr4L78RPOSExY=;
	b=NNCyICxZnDtvjEh+E8IIZmRP5WqUIUFeMIO4Venn4RluHw5HtyxJ2z1InEiEh0CS83Gfo7
	I4y1GXfyz6wI+kNI5LuFs1iKV4NDys+2CjaXLJ4UxFpQIOkM1vvAfUbN04em2CPOUaJeu2
	zTtWs7wpx9vOuGISC8uCFyQpVK7dFVOgj/5qvOsBxDfC+N8MIp1OfcNapO1gYjQqf72GTF
	26dUjEdoBEK8cO/uReu5Cjc2xn7Xi194kqIteFtngaH9KLEzX4A7R2K3+RPQ3VHKBmNJuQ
	9CtWdrbnf3duNMoeqCvo7y4RBCFniRy6Xz/Qv4YopzsI680B7In1usb2m2LlIA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=J68BUYdI;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DY9N5zfPsUiIrMcqb786BHFeYZkJaYbr4L78RPOSExY=;
	b=J68BUYdIa9JK3614IYkp1dtxkd+wKMJYEbKPnGXWlyqSoY+ZCPeb9xbCquDIIDnfDK2ncX
	/UArnkjaJcVoLEYwisOsH7ema4BQTR9DcFz/4LxGAbyJtCZ0D/z9jzsVLzbInrUJv8qAyT
	gqaAHnRVI/p937IlfZOSpqYo93C5CjxJ2crhLKvA/WvXV22nDBBV2N7R2I8qBJdD6cNPZy
	QUmzJYRVzwblEZmmtUGZlV4rnMUt9eW21PgZ9oB226qWo7K9wlVZz2a1U1EAqQeOred4ty
	FqHZBGPyqn+2w0wpGNewrCjLVqaGghHRkEXpLvMgHZvtoIop6x2E8smjvAMXGA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Joseph Guo <qijian.guo@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: waveshare,dsi2dpi: Document 1..4 DSI lane support
Date: Thu, 15 Jan 2026 03:39:42 +0100
Message-ID: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a750a70089b9dae80a6
X-MBO-RS-META: zdrd3tfd9bmjrwo7jtrebp59u3qpn6u9
X-Rspamd-Queue-Id: 4ds6f929Jrz9skw

Describe 1..4 DSI lanes as supported. Internally, this bridge is
an ChipOne ICN6211 which loads its register configuration from a
dedicated storage and its I2C does not seem to be accessible. The
ICN6211 supports up to 4 DSI lanes, so this is a hard limit for
this bridge. The lane configuration is preconfigured in the bridge
for each of the WaveShare panels.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Joseph Guo <qijian.guo@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 .../devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
index 5e8498c8303dd..3820dd7e11af1 100644
--- a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
@@ -40,9 +40,12 @@ properties:
             properties:
               data-lanes:
                 description: array of physical DSI data lane indexes.
+                minItems: 1
                 items:
                   - const: 1
                   - const: 2
+                  - const: 3
+                  - const: 4
 
             required:
               - data-lanes
-- 
2.51.0


