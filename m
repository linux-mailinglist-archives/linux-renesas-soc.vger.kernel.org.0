Return-Path: <linux-renesas-soc+bounces-7267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A4392E7AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 13:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98C90B28454
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 11:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F046A16C68D;
	Thu, 11 Jul 2024 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QqOPNyvX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E216B72E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698763; cv=none; b=EkXLAVh+V+GDMQDHCqBy/9TJNMlLFtWK0ajn+QloWnsd1PWNvwBzSJpcDn5hrjeb0k2MNJ1JeaevcoDhRO7ZEcdWAzAsFGfly3d6GhkeyKOnV7hSYmeWNGs3enpJB3RvTX/weSYK+D6aWGAhliG/cpBnyTLdRux8bhwdkfnghmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698763; c=relaxed/simple;
	bh=A0olck8xmt91kpHf3Gqks+7X7VhqbfLSRQr3kvyb9/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rlV3rW3WDskas4VhvETYlzKREIeo5C+/hmvjw/GLcvkacb9pCiXrNMlik4tr4zlWdtxBQ7sb0hcpw6GmQgiqp/pFzDw9S0mYde1bHJqEfxCGdjJpTiWZ1tPdqb5lFnNEt7Q9FFG5zT2itdjOHM0nYaK9AGy+NyH+pND4cB6FOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QqOPNyvX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-367990aaef3so405930f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 04:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698761; x=1721303561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23JHMztdqyVYYAjIp7U+2QZVKMehlsQx0vaIwQy1Uh0=;
        b=QqOPNyvXIOORGpBVnySxyd0qCN6SRdb0veGgKY5jbF3eqk+0srNMnEMubPMqIIEMGN
         s58ym7IshD1WweTdwXseHQcIZIMDGttuAa9fNkNi9wR+z+5ZirufN5FlAhCkBLm22prM
         oZl7Cv95gPeiXlevuWlFdCuDgH4KnV/h4lAw8zC+Gi6RglCMx4mAjWuGlF9Hpk4GwY5f
         mvmEnpAnOyhkcRQ16SW5l00RpcRbBqshLnd/EWZTdnSaKF83c0KWoteheZKrhQn2U/hN
         OE+birFt8t37gRElAHIbDWdbluASlSXPUfV5/dpENfRif4HklpX5w6T2/XpAYnmlWDe3
         w7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698761; x=1721303561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23JHMztdqyVYYAjIp7U+2QZVKMehlsQx0vaIwQy1Uh0=;
        b=EHjDJrKIboIdF1lA4ZUnEYOlyGpBCZ7YdLY8m9LnNrkRJMtZ1C9wyJLFFwNF2BlgJj
         TIyqJLq/ffB4Qz3KWqRM28zkDRnJMw5xC/TOnMNGdQvGNG8bJWEgwPc0zfHGgNJrvagg
         UqfdFXOFljjEMTjcHkJB7mdecIvJvyMdBNbE6zk3EnF74Q6FwhDPspYn2xqLk13s3pa1
         k8mym0xkJPkFtpUxi5TQe+Wc9vHLsI9W6a8U3stfxsIs36rUpREp3BLjYXJ4edMSDHf3
         m0CFnDsmv5XJBpX/O+VsceQVe6S7ee1wb82WeL61gU7rtij5ngX4f7VYjfdgJ6Lgz1of
         QVAA==
X-Gm-Message-State: AOJu0Yzg9HQmWjYdmsQOJ6sJKdjqxnl070TKGCb8pfA9fZodbQFfNGf8
	cUtbTMEvGiCYisummCliwfNckBaanRhgtYXCM3vlhf3C1QcS22+rX7LMwlWkm3o=
X-Google-Smtp-Source: AGHT+IEGSAph+omnuZzg+uESoOH9Ojh+B4Qxya+Yp/LFOJWoFwzZN9bd/zH+TlfWF72r7coXWyfImA==
X-Received: by 2002:adf:f004:0:b0:367:96b9:760a with SMTP id ffacd0b85a97d-367cea96903mr5200725f8f.41.1720698760771;
        Thu, 11 Jul 2024 04:52:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
Date: Thu, 11 Jul 2024 14:52:07 +0300
Message-Id: <20240711115207.2843133-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c1 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 8a3d302f1535..21bfa4e03972 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -32,6 +32,7 @@ / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
 
 	aliases {
+		i2c1 = &i2c1;
 		mmc0 = &sdhi0;
 #if SW_CONFIG3 == SW_OFF
 		mmc2 = &sdhi2;
@@ -150,6 +151,10 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&i2c1 {
+	status = "okay";
+};
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.39.2


