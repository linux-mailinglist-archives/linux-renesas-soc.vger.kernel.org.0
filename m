Return-Path: <linux-renesas-soc+bounces-10256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C49CF9B8E6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 11:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A51928102A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2024 10:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5AE199FC9;
	Fri,  1 Nov 2024 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DfXQFLSs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A074119EED4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455079; cv=none; b=cgjOXYt7D9colzTJ+XLoxoZZNzGJKJ+YFBvOjYSl4CGSbhuEyYiCISSyP+vNcHrsTBnTaX81utQ2EzHpgmRnE+BO69qNSbnLwuEXpJtn2F3Bm3CG4NllYFkySf6L+nHsGbU1EbHoSSN2mitSS1IyIGvUOU8eDtNtIeooiX+SJUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455079; c=relaxed/simple;
	bh=Pf9k322Noul/AUoZF1lcvPKEcxZYOYxw5S5eT2YDnXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/UrndwWq38c+9rHtKFhBUGaiWFx9T4i4VHwa/5mlfYKGz+kxVmB55eUz5DfMsHR/06NLINbQ+ke2081/XMTyMhYwNQzppAZhWFUfzmu8BkEVD/izjX10DP+SFFKHHdtaYYf0XoNVQ9UcEP1ePu1mGo8aqrHmnlvZMGcVeSICPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DfXQFLSs; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso2534448a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455076; x=1731059876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=DfXQFLSsrbMNA5VOknfWfhySdFrCjvu0tDgwrTEWF1sUtGqbT8H2o/gCGINS0nfl7j
         nouq6LwZH23a9x2wml4xQCO7kR5XuND8zx1qG4+OwTqPart8LGYYvU///slPG0xfhNRz
         3iGfjI65SIjGdrP6opiRuR27K2hWE3QtrLCR6ZdSmbeKwAVCGhYio8n4rqw9VdZCHmJc
         SbCp6ML4isJAZ4q0w80/ROUfyOvxpRSM+mZwYUVUxnWEf2Za4rbFiVXnZO/X2SiJmFRV
         lKCrJsV+lA9gi1SEv1bh8fr+HWB1HJOU5aSTYsUeATkfWePam0hr28Fg989jaizKmSfM
         WDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455076; x=1731059876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsdPZF9emf18XQgtgS7Xp71XPblYsQ7NBPKTENRn3uQ=;
        b=MOj7PRuMummizXRYp3fLTzM7Rhy4KyPZEGn17rLLISPbqvtMOdJQlHeuwhQBhQ7139
         +pQPMC90+Ye54C9l3d7FeCqGvHffA9unPjmmWDuh9U31yOsXeLNWfwuZ+T1OWvmTG0RN
         eUvz1LIwSix4eMkB3e1J90Ev/bgseFJkhMWzg3blSopbHNtevk5lGXSfoUXvR7veewFz
         91v1zZPujN68bsG2k/Xyw+D7YbpnDCr029AdcpC0mwLEAYSsrATbAc98MQzN6qFrMn+z
         h1XQzsNXx3Xo5P3QT+cRcqheX4NDGj3ht8KtUUKYCmwdSbLLrPiiu5W9QPYhPo0pKpyP
         o2Jw==
X-Gm-Message-State: AOJu0YxLACZujsZgoStjW35KEvSCt1TprS9zknaFCOjCYy3YYLqfhl0B
	pO14RkSB80LdCKKiHxc5zVUHTKIrxGkSOHn4nwzK3UeKlSdxm4yHlW5e2i9irRI=
X-Google-Smtp-Source: AGHT+IHIInFyvvZ21N4w9XKZUzECowUn+aG9F5+oWwykmTnOmG6gYMfAOXIH3hB+PUh/16T6BdSrwQ==
X-Received: by 2002:a05:6402:518a:b0:5c9:76ca:705b with SMTP id 4fb4d7f45d1cf-5cd54afde73mr7392400a12.34.1730455075953;
        Fri, 01 Nov 2024 02:57:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:54 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 8/9] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Fri,  1 Nov 2024 11:57:19 +0200
Message-Id: <20241101095720.2247815-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 30bb4f5a7dfd..2ed01d391554 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -345,6 +345,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb {
 	assigned-clocks = <&vbattb VBATTB_MUX>;
 	assigned-clock-parents = <&vbattb VBATTB_XC>;
-- 
2.39.2


