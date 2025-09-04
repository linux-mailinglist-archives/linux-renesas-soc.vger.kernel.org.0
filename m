Return-Path: <linux-renesas-soc+bounces-21378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B24EFB446F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A191C8523F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098C327A92A;
	Thu,  4 Sep 2025 20:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="X6keGGje";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ejXENH9q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ECE2798EC;
	Thu,  4 Sep 2025 20:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016301; cv=none; b=ovdrNMeByYErNFULcUl7r7cqoeqFRBl9Zy4BxI2PHVjQyu35bU6WTrj6GXk+GdgdO5ddijkTKRP3bQDuDzOYH5ghDWkMIuFHoEoGgTw56fjINNwrnMQoWY/alW+FgBoV9TfsuBCDEes7/RU+GTRirgCxxDpb9SU7rpnAzOdHfW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016301; c=relaxed/simple;
	bh=KrwM6YJ0Nx2KtAKASZoIG6U4+z9VKGEriZzvnwgogsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExaS1aFRyhsjLlzW2m3NEiDLIliNQ0cDBpiOaPj+n9Hz0CVxFOo49obbHFNZFZHRgGxxZIgUabmUPKkhL54PslyoZPz8y+ypS5z7lU7b0oJL7MKamLUqlDHU/w2JVmSfnJkC4rz+STKofvE97LcIqSZweMwXeDAAKvmYtb6EsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=X6keGGje; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ejXENH9q; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHr6y4HMLz9tB1;
	Thu,  4 Sep 2025 22:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ajgl4VkcAvKSjVnpuARRFDOopjNfFzRrXajmAnDP0g4=;
	b=X6keGGjel+lKtjCAF2XKf2EdVmHMTrtJI2qc7yUTRfnr+9LyL0cRqgprgV+IuKHUVxGo96
	IWDY9fCRjikoCIii/GAiOiozzfCGqBai4HVYwiGc60HU6yBWBlvFXpBHr8FrECEN17e6oU
	nrZySrMXnA8VAXf8o9kRneRgawgbl126Z+9dhjLrMMpsdYHdQg3DBL5+w1NPcv3Gz6rmG6
	BrMLWNF4AFx+DwKhBMgt7cKKgrvQC9f3d46/hg9YWzyiA6mhxXMlWbyAU6bHSmJ+awxfb8
	90fTAc/LvDwTHClDNBUJoE+nY266iAFzoVMMOXRYjunmhzFIr5qdqR+rMUi47Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ejXENH9q;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ajgl4VkcAvKSjVnpuARRFDOopjNfFzRrXajmAnDP0g4=;
	b=ejXENH9qkowuOTQpyYJzNDSF++JA4mGaY3b0XEhUhS42/MJEycKsc6k7wDyzRp+jd1VB7m
	/2gdmNP+KmkVq2JyYMYEPuXyBmsXYFcemm8cBLg6MqrjxIeVVGoojZrQ9c1bFNdxkSVz50
	/yGeqyxCWrYZEtla1quz+isubeTXs24ueXkqfwZnFfic1Igosp1cBrGw0Eyxbij+TNkeuJ
	7ELni9ZHlJ/PgTxsIsjiQ6JOw5/HpXyB2W/sHetazFDYT0UpvC/gblWdRut4BdFwH1a9AL
	r6KIOqoJEBotHfo9tJT6Q2fu60HqaIcK6EV87xi2RQS1BR9fmSjpXYzfUuPiRg==
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
Subject: [PATCH 3/4] arm64: dts: renesas: r8a779h0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 22:03:07 +0200
Message-ID: <20250904200431.168363-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5mkbduokp49hwggqng9sp43kx7pzne5i
X-MBO-RS-ID: 75d0db906adc813bcf6
X-Rspamd-Queue-Id: 4cHr6y4HMLz9tB1

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


