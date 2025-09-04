Return-Path: <linux-renesas-soc+bounces-21407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 002DDB447F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0B045A5F7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B284F28D8DF;
	Thu,  4 Sep 2025 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gavCoNRc";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gymbp9Wc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CA28CF6A;
	Thu,  4 Sep 2025 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019737; cv=none; b=n8vtMUqQs67d//AGPVoXG/0aoSGgWqIJ+z1okSMpgqMwICyqlZZTsRbTPm1VX/AvXPwT8k9G1hCgmI1zxLgAeXUCAtLFyZTrBueEedmHjE66wMQg7laV+N8M69F7nqj8PL1klx7lVTD89GYPJhpHdjtrhIt/dY+ctRUb7/nxpsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019737; c=relaxed/simple;
	bh=QDeV9kWL4BD04relSvOoYv00dw0SLzqCbZmFAAt1Ueg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjtxMbp9HGW9haCSrMgcva3Xt0u7WePHkV8JliMnjAytpBdCYFaMvomLI2uv6nmMXUJAhDsmLBy7iKauy+LEaH7SG9rY6/T03kzmMQxgN8Icjq8fCzj6iKh1HWosSxvABsE3juDxmmUGfjIZ1j6Iy6qEIw9BKKfdrs2z03xTziw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gavCoNRc; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gymbp9Wc; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHsP10wcbz9t94;
	Thu,  4 Sep 2025 23:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=enyanXPtBFmvwET+1nBYKdUqcMiUsaALBQL3hCXhZJA=;
	b=gavCoNRcby2sss43VwqEqIOn+9WnjVAkA7bhyl6Ij74798NXmyqKvM01WfvhV1icuE1ZCO
	kFYJTm1Ybww9jQwBfucPvFGTP5Tf2IElp5Ny3PVH5L8S64h7TKbdrmy2Is9YISoOEJYvEp
	RVn2Xf13WH5RPqYWS5KVrHbRR34ItlyP3MM4PC+4TeI4SYLcfkG73fLKKNJNZ4DHYflBoR
	0pBKzpdIgZ27cbgJBNobapVLla14unrIbaWPR5+jTY7zYk2R7qMynM3IgA9c/qxFpGt1Jj
	P2NEqDVKJk9s6CZCVOBYBmSBUlViKk5xNsKbZbOdFW5EdzuYLE++9XBS5UAbWA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gymbp9Wc;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757019730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=enyanXPtBFmvwET+1nBYKdUqcMiUsaALBQL3hCXhZJA=;
	b=gymbp9Wcs4vrlPQ0ZUtoRSsWrSUXKewtxDlainAdYB8MbwwWTLPcYcx6zcskCLp4IkiXyB
	NJXD/wpn5FvdAJROnGsKJZkYvXheKcVIFq3l9dDJ0LGG6pmxZKiYyhnl5dcTZAqNegEYEg
	XSS0wMk6SAve0A8FQPaNipGTX3+F8ejcD0zJSwwbAIDS2yQwtV7ifJtrCh4ztCt0/ifrfR
	rfYCMTP2uygyEtvLkyBXpdrJcEvi4AzLiJVh3FHemdcrDvPLOeo6SxUCic8nQWBSHMLxPm
	DGtbZ3EvQ/KuHSOBDIIzgm00ZA/OEaf4ilyLVkw7Gj6+3BZS1QThzzdibx56uA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: renesas: r8a779h0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 23:01:20 +0200
Message-ID: <20250904210147.186728-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e195fcd41ba5856ebce
X-MBO-RS-META: wtihhgx1phfqxpoxwpjsqyrdxai74hcf
X-Rspamd-Queue-Id: 4cHsP10wcbz9t94

Rename dsi-encoder@ node to dsi@ node to follow node name pattern
in Documentation/devicetree/bindings/display/dsi-controller.yaml .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index ed1eefa3515d8..0f20a2d239834 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -2144,7 +2144,7 @@ isp1vin15: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779h0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 415>,
-- 
2.50.1


