Return-Path: <linux-renesas-soc+bounces-20415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEAB22ED6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 19:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42477188DB56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 17:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204082FD1B9;
	Tue, 12 Aug 2025 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJI4Edkf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0E2F8BC0;
	Tue, 12 Aug 2025 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755019053; cv=none; b=Phl1RWPtB9GC1/ryqnCvYNwbu7SIs6SptV9okVb0sZx+FyItGJ0t+hKVNnPxvbRj2OSjWIGAbEZ1JgbOo8g54xRJgia+7B2/EJoyp1GES6BvTEdFPK9/ui9Aw5JJN2ZCk/MnXJ616a/QzhS0A0llUJ37zFC5f5ympa6aKFBgk+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755019053; c=relaxed/simple;
	bh=/RHJOjmuT+Ca7LzoAWEN1lgwyx4tKfXhHlsAs5ydQns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qT01qWRw1u3Vd4zL5q3J3JweVd8BH8WjgiSdu3XqvB3b9pjmmjZoFnmJ9MDhh65NoMrz/L0fcio1kB4OfBxKCkifbUYqVRc2CV9j3xdT/eXHwAf9w6cjRMRnnLvM7JdnBV9H6XJVbL9+sSgOIcnNuzTk04e/8UFmsBt2YeEPeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJI4Edkf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-455b00339c8so37465145e9.3;
        Tue, 12 Aug 2025 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755019049; x=1755623849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vatX4yzTNm88aU3OFacG9YpbAOq3gMjW3vIZ/fmYNzw=;
        b=VJI4EdkfnK3GW0H5ae0T4jhPelsRtlqE8ANUD2MoJJSdObFzvJ1wq9XxDlINFIufZy
         eONgppLOFWh3L04vsOqK1fjpHqSUwyjz0qm6RMoIVWI1eJvwaBJjHyh5ahkUgilqGuDL
         a6mjAaiB2ajtF99OczdpspORh0kZQN1aULBC7rR/qaNrvHQ6X7ehJuaxSk2PzWW2MXZw
         3BJ29Nswyo4JcTKLm8P081oOw2ekj7yE+lHATZ9MST555ckAi/8BfFmVmEFIZuvO6+Ry
         1W3U+Oy0/NfEVAR9OkErWvl6DPIZOPfRAZxhfTeZgSkdLDUConuF8FKLGDniXn+9JbBa
         /4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755019049; x=1755623849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vatX4yzTNm88aU3OFacG9YpbAOq3gMjW3vIZ/fmYNzw=;
        b=ieP6P6r6NVIssF3jHk2T8iCb/9Cn58dgwRZ8qyrC3USKyP2/a9PNV99+EJe1xcxwHV
         kOQAwdXYlqimW+2JAzzIlTwSsfjoWdax6xEhghSJCwTssuwAyVjHda0RSVc6/tpmVGIQ
         4UOiZX6HqqEqGfOAfTR1yM6PUJNDPOx9Q3ReVB3ixyT7n+F6JDzpKVnO5eY4LH8yYNPc
         ynhcK2yZns+J5z3cUPpAjNsHFBRYmj8KaQBnIS8as+I4CTV7588RH8Vsi0hBwaldSnx3
         gDZ2Md8eOhl1bnm+qCozk19rq+XPcyfKGNI3xLXJaG/oNzBrAfF+ubGNw2E1O0BzWqcc
         qw4g==
X-Forwarded-Encrypted: i=1; AJvYcCVRvTpDcD8CLlxYPXhiny3nA2y3Flc5nFK6IZ8a/h/OVQ6w67XfkMk64Tnalxj5QokDnQ0PP71227k=@vger.kernel.org, AJvYcCW/bIBC+lwAvMT7SbZrxbCJckt8rDfwLw/bsSYCZ8hS1SIlnztGk1I7KdR3nreZ9FZHrcTyX+6i7+Ymw4fN@vger.kernel.org
X-Gm-Message-State: AOJu0YzS12ofWJ/jxys/hZHGKOLunJxPSPS29HIr6Tb7i0Op/xCm2M8G
	Z/tfPFBCVGDfWbTZe559bwIPJusm78aT1k7iRWFAoap1COIGrFHvx/QI
X-Gm-Gg: ASbGncvkAAJmdynS1rvNsznaRSWW2bQrdsjD72T1OUGKQs+DYalFC0Jf8Ko1FGYCxqS
	iutQF3da0snjRtUMV8nCdi8vNf2V5SV9pZQrnjykC26fnRDQk8X/wtSe/1NC/PKT2EQLvBO7OtN
	ea0vast9fy6ix2OoympbiTuRj6KNSR5sdZlC0uQFWfx7K1Rk3gdtFsBqnPS6GmP6HgZCJNTcBSO
	wgI0t4vDFLOTZHz+eP07t8bgupZ8jzjrvn4FIve1g0ySI1wmmKcD0O91dFrWf76bl5TKaZSeeBM
	BS3PjI0x2cFUXZecOCOuZuxqOgJUgOdJRJmzaTPQSVsqtGTC6R2V7QcdQk5juRlHJdWKCodHKGO
	PUkpu+mpqwx6k+mD2Bi2jHVwIsG4lfZmqITnqcP71IL9/qeOJKP1bGnYTjf+N00QQYBfiNZTg9t
	eHd+x7NRBFgNjBuypKrg==
X-Google-Smtp-Source: AGHT+IEsshI0tvSYgz/Ty9G09+4xV+KQOgC31lcAYOu0ls6Fsq/2QMX/kvgJJGQTLvgY8t6cmBGVLA==
X-Received: by 2002:a05:6000:400b:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b917324b9bmr183297f8f.44.1755019049294;
        Tue, 12 Aug 2025 10:17:29 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm18616038f8f.51.2025.08.12.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 10:17:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a09g077: Add module clocks for SCI1-SCI5
Date: Tue, 12 Aug 2025 18:17:20 +0100
Message-ID: <20250812171720.3245851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add asynchronous core clocks and module clocks for SCI channels 1
through 5 on the RZ/T2H SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 704d14d31e87..408247efd905 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -48,6 +48,11 @@
 #define DIVCA55S	CONF_PACK(SCKCR2, 12, 1)
 
 #define DIVSCI0ASYNC	CONF_PACK(SCKCR3, 6, 2)
+#define DIVSCI1ASYNC	CONF_PACK(SCKCR3, 8, 2)
+#define DIVSCI2ASYNC	CONF_PACK(SCKCR3, 10, 2)
+#define DIVSCI3ASYNC	CONF_PACK(SCKCR3, 12, 2)
+#define DIVSCI4ASYNC	CONF_PACK(SCKCR3, 14, 2)
+#define DIVSCI5ASYNC	CONF_PACK(SCKCR2, 18, 2)
 
 #define SEL_PLL		CONF_PACK(SCKCR, 22, 1)
 
@@ -84,6 +89,11 @@ enum clk_ids {
 	CLK_SEL_CLK_PLL4,
 	CLK_PLL4D1,
 	CLK_SCI0ASYNC,
+	CLK_SCI1ASYNC,
+	CLK_SCI2ASYNC,
+	CLK_SCI3ASYNC,
+	CLK_SCI4ASYNC,
+	CLK_SCI5ASYNC,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -133,6 +143,16 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
 	DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
 		dtable_24_25_30_32),
+	DEF_DIV(".sci1async", CLK_SCI1ASYNC, CLK_PLL4D1, DIVSCI1ASYNC,
+		dtable_24_25_30_32),
+	DEF_DIV(".sci2async", CLK_SCI2ASYNC, CLK_PLL4D1, DIVSCI2ASYNC,
+		dtable_24_25_30_32),
+	DEF_DIV(".sci3async", CLK_SCI3ASYNC, CLK_PLL4D1, DIVSCI3ASYNC,
+		dtable_24_25_30_32),
+	DEF_DIV(".sci4async", CLK_SCI4ASYNC, CLK_PLL4D1, DIVSCI4ASYNC,
+		dtable_24_25_30_32),
+	DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
+		dtable_24_25_30_32),
 
 	/* Core output clk */
 	DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
@@ -155,9 +175,14 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
+	DEF_MOD("sci1fck", 9, CLK_SCI1ASYNC),
+	DEF_MOD("sci2fck", 10, CLK_SCI2ASYNC),
+	DEF_MOD("sci3fck", 11, CLK_SCI3ASYNC),
+	DEF_MOD("sci4fck", 12, CLK_SCI4ASYNC),
 	DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
 	DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
 	DEF_MOD("usb", 408, R9A09G077_CLK_PCLKAM),
+	DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
-- 
2.50.1


