Return-Path: <linux-renesas-soc+bounces-1636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF48361E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 12:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DBFAB2F357
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 11:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E4E4BA9B;
	Mon, 22 Jan 2024 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="efZ8CXDA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039F74BA9F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921919; cv=none; b=nTx+Ky5LSFi28eT4Kph8sAfNMEtOUNQRuNC37TLYPCTME7L30ar0q6DUWme3R24vpmZKuYPatDkJrwstIq3jn5V3OFCuvJtg/5dI/GtF+lI0MTeJbEXNWC2/gAcGwI1ItJBUxngE286plNb2DU3XT6bQHUGkFzMUMCZ4PHnFDEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921919; c=relaxed/simple;
	bh=ifaXXPlzQ7Cc0JIuS3Sr1nJdIEtZglhNMQ0Q1KYtPVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TbBtH2wAlMpsVzgJEkm/Bf14M3lkmiengjW8ejbvioSEvbLN7UGb+TvNrDEAuembwznrb/tj/NCgj6tgl3XZvXOXcylA7ooTAOPXxzCK7OSvJkYtL4lG1p8qzpAcQ57Tj/903DIrmRHXnxY2egBpc7NZpV2VJF7CJpPc5NggdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=efZ8CXDA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso4170523a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921915; x=1706526715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVHTL5RIY+bNimER8/uVEqIPwk3bXfvGHZ/DYHY7974=;
        b=efZ8CXDAowoAVM6HA9+9w0thUwU1A2Zdw3LGpPKDmRF3HRGK0Ac+aaDzVEW+WxwW0G
         uiCpKZ6A/8Svl92HuNADCy7qFAwwHOqu134KP/3iSVwDbjrHdNZpcCeOxS+pAIpPghfu
         CPhJj2g3IR29NP6+KxodcKiJyTnsdRQByT4+oFxRZzYvKnXBCa9s0NfFYrLWb+KuUjNl
         uzXqdHCzDSDDf/bhtqPIrCZH9TqlzXuv8BwT1QqBUbDUFQyeVjpkonk6II3kDkHR/jrt
         pGl+TQO+WCxusk+D7+krBRe6a6AYqOeW/E18RWblllUPb2v1K1mbEXHAGnpqbBXE2qfp
         0mPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921915; x=1706526715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVHTL5RIY+bNimER8/uVEqIPwk3bXfvGHZ/DYHY7974=;
        b=who/LM4t/F698lu+bYvXinhDg9dORN82WZdtmdtUESJbSONzLLGPyz0UAKknkSWdHk
         ErcOGqB+6V8zhIffD8/o2lgAH1BcTOFE6PIuCdJuZOOIvEOyCHtr3ma8fu/AhqNGpMiP
         AXXflHbPx8RFkXGJthAgxCYuAflRxR++YPJ6rQ2Gtp32Gk1EJithK9GysTKZ4fI7v8dx
         j+Petl0l0ZpalAqMxfQ2c0alSY/EEuF2LhBjK2bC3uMF59AI+JM/KzdqpWjCSgHpHPqe
         GJBeWTGoJgzyKXBQGfY2qNTTtpGICDIevpyJmEaQQHwpkV6tBGy2ml4ptMVytIXRyk3i
         HITQ==
X-Gm-Message-State: AOJu0Yw9hFRAszA5rYt7y7UkTHMfdxirf1191jtvOeXO+s/HyUtm/j0t
	xf8Xv3xoXBADy46K0wsvl3/3gG8O5axqifap0na9/MtM4d0mH3Xi8/YEf8P2gRs=
X-Google-Smtp-Source: AGHT+IE0QOOQauPyN7jiBB0wkj3vCQ/E4lksKRkdsglPNnpXOAnRbWLas218nPffKQxKybxy6Cr8AQ==
X-Received: by 2002:a50:e614:0:b0:55a:6dc3:59e3 with SMTP id y20-20020a50e614000000b0055a6dc359e3mr939510edm.139.1705921915306;
        Mon, 22 Jan 2024 03:11:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:54 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/10] arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface
Date: Mon, 22 Jan 2024 13:11:15 +0200
Message-Id: <20240122111115.2861835-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the watchdog interface (accessible by Cortex-A of RZ/G3S SoC) on
RZ/G3S SMARC SoM.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index f062d4ad78b7..2b7fa5817d58 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -336,3 +336,8 @@ mux {
 		};
 	};
 };
+
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.39.2


