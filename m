Return-Path: <linux-renesas-soc+bounces-26634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7DAD15DEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 00:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BEC030139B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 23:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C148D29E117;
	Mon, 12 Jan 2026 23:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="c3KoTaTw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hP4vqZBE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A1A2D0C97;
	Mon, 12 Jan 2026 23:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261737; cv=none; b=Kh4DiMUwmn8M1B9BvowOCKmZOvCtpc/VvvJ6MtBUGoLHJLYtvh+JlttvcaACJ5XMh3xhUT8ExLCih0+eg9KYPEi4n7OpAKcJ641vq2k3VIVqigQSQE2cyIv9wMOeszSPF2d1A5uAqi32soj6oPEeOImTR9aIGXEkk8CYqjccKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261737; c=relaxed/simple;
	bh=rESXTAbpHDHgkNNb/l07C3IUPmp4LOB4idoRYoCi554=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gk2JRvmwAqYv0u/2XNrHcPcn7XP0aBo/vyNq3Kcprp7nTiheXWn5Iw+Imu7/W2DFUap4l6od7w01/n8wALjMnRm/xdSD9lcXvE6hl/GFgHbn2LPhap62QgOAnOAZh6j/s7AvWvB2dILcgPhYwlYCBa3C3ti7oPY8F3rqj6GN7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=c3KoTaTw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hP4vqZBE; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dqpx93MyCz9tCT;
	Tue, 13 Jan 2026 00:48:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUbMXuVri41hcEdHLFuizo5f7hR7q4K8BFuRxgKtq7A=;
	b=c3KoTaTwFujL/xgizZKeM6BoupPDwEVqO+bbzak2gcbBG1wRnnLNkd7k20DKUhZtEefJEG
	tX5E5raM/UVkFE7OcrnQ6kuWc5xEgyfpZdPmlNnEuFjLQDdi2KtjLX+FK+8oZWtRBcBFMt
	xe0cyjt0ADwVZdQQlLXD0Moh1CdhOxIBgBMaf1slIww0fP8EIVtBqaf/90whGUv1DQYsyU
	Uu7bgM1AfyjrtkinEo273fc+iJ5LplfWlcidT0j8L/nRa6kvUkJ6FxoS0KwBPpFkHuuQ8y
	gw/tlaJLV/S3e3j5BOA7mMlYuGDe4wLjDfEnWcvTtjiB78m0ZmrkJqaY66tYEg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hP4vqZBE;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUbMXuVri41hcEdHLFuizo5f7hR7q4K8BFuRxgKtq7A=;
	b=hP4vqZBEc1SNC5xdJoBlhtifYNCPqa5I2iKsnAPN8ILmaUSP9w2G79BDjlIz2ehbfcUhwV
	fbbQ7D1VSdTI8ukn6o7IuDxjTtM1TwGAylFsUmN/TLpojADX8KQXAkJoelWcWTEitZKPIf
	GZ8yegGFMpFxuy0/OZKjz58fJcra1ajj/cZm6AcnsyxunW3hEKzgjlqCj3aSIQ2++sRsU9
	RW3nUOcUCHID9DrFet5MolTEc5Rv9E1RuP2otJb1/YoZCp1Qs9bM8OxLZQTcbV0r7ZQPoP
	4iAkFlD4ojFi32RH4Sxx0VtdDWZsvdlq3qfpKf5q4yNEu8k97Om6iej3SAtz9w==
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
Subject: [PATCH 1/2] dt-bindings: display: bridge: waveshare,dsi2dpi: Document 1..4 DSI lane support
Date: Tue, 13 Jan 2026 00:47:38 +0100
Message-ID: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 65d4d573ca4b3c32f46
X-MBO-RS-META: 4pi3w94uourscirswxd786cx76bany7w
X-Rspamd-Queue-Id: 4dqpx93MyCz9tCT

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


