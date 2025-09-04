Return-Path: <linux-renesas-soc+bounces-21377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311BB446EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C00555A0837
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0848279DDA;
	Thu,  4 Sep 2025 20:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wKkdMKr+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ht8buZKJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B9E27A93A;
	Thu,  4 Sep 2025 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016298; cv=none; b=PFuwjNsjj/gVlBgpznBf+iJQMqp2kUN208P2Iy2ATCH+qFdNVTvilq3TNstQX5tq1RhjZIgAsnUYBaZoJIS+m4HjMGjeDFr5+cQTqojp1G2mKHITKBL1jXa6ozchETtNohSn8a/7b5uBXO1MSuQT0HaDrre6VHXV9PBRhmxvabU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016298; c=relaxed/simple;
	bh=JqVg50uTvOQO0gY2SVr3zZyGkcpKwKq7y0mfkde9658=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIxrjByzz+Z/ZraRc4eS1d3rOpVr07rgLLl/WtO7m2K7mcg+60Tu7iK9FoUq3LrVVTe65wed3/BPl3KREbH5MjDgrOToTsoulMQJumt04BssnRf4fUUiVSZidF/fV7777IAGG7bToM/zm3m08dKw9pt2jeoF5Im9ku0wrzL3pfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wKkdMKr+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ht8buZKJ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHr6v3lLTz9tFV;
	Thu,  4 Sep 2025 22:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laoGGEVO+Nzxj153VQlyUvl8GS6WXFC6jR/xWNH0R9s=;
	b=wKkdMKr+7B0Cy62ni773W4TSsAfK63kketfLjxrrSg/NVj2rchJygMzCU7qNgZRMCOHNrp
	cq3KdHrM1LLejQhNtINYxzCqzGWT58z1sgqiZpm1buZhitvEUxPo6H8MB4BsGSVeX6cDZE
	5zjlaSJjPXmOWI54b5HwdzV63CpshUeTKjXJtEwYvHL9/CJXEmTCCTQnl+CNl4jS55heTF
	SnZ3rJaLg5ZVy09meDrrzndlE4HMwmx+ghUoJcUMl8qJOz26A9X4dFjycZh3V0XfECjdwe
	NgK4m4hbjXGitYoOZt1RNdhiYp/9KpQDnLQW/qnNrOQEdn8puzveOSEB8QhdlA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Ht8buZKJ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laoGGEVO+Nzxj153VQlyUvl8GS6WXFC6jR/xWNH0R9s=;
	b=Ht8buZKJynSs5acSPh9eLlgf9Aix/WrZj66Nh/zYQ3EG0MymY4YlT8FOXRlZhx74FmFXLT
	8weQET6B4XP1kVcpHLvjIJ5xWFTv13pgrp/HeoFoKley+NpVPwukE1EtLQu127YTi1P50G
	u+Ak3aTZ0hIveG3TjY0ORgTOuEHRzF6uZkkomg3LeIKljIYzibIF6B6wQzrJxypjC8S1Sl
	VEqLQi07ns84C/JkUW4msY4PF2TlCfGuC5DzCV88hj2eE2DLk8/YFS4JWDjVgYyDO7mcdN
	nFIJvGVEa7gHeKpjYmeCg1eEqG8SsLZN1NZmwWrZRTfysKfZicdhqa1DyoiwQw==
To: linux-arm-kernel@lists.infradead.org
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
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: renesas: r8a779g0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 22:03:06 +0200
Message-ID: <20250904200431.168363-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: zif16n154yhntpkif6dd91yozr1xs9fx
X-MBO-RS-ID: e07c121d75dd1735519
X-Rspamd-Queue-Id: 4cHr6v3lLTz9tFV

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
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 8d9ca30c299c9..4fae063bf91b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2476,7 +2476,7 @@ isp1vin15: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 415>,
@@ -2505,7 +2505,7 @@ port@1 {
 			};
 		};
 
-		dsi1: dsi-encoder@fed90000 {
+		dsi1: dsi@fed90000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed90000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 416>,
-- 
2.50.1


