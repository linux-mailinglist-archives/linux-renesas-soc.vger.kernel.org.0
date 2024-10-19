Return-Path: <linux-renesas-soc+bounces-9897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 699BC9A4C2B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 10:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F7F31F22FFA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 08:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6B71DEFD5;
	Sat, 19 Oct 2024 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KI8O+Xu9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A11DE3B8
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327675; cv=none; b=JZHU5fr1rDvZAaV5XWEQwDTz7hLM6t8sxU5abLh4JrWHIeDfs8IVMWtm6yIVTZoBXfWKCIeAS/JhNgvi0euLCuyMchv5TQTLVT8HUzZZ25UhvspzcKrCYRQvIJcw8iTSaTIChyVcQwvXtkUap3Mk+BFxwpar1NkYsQyjdgxP7LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327675; c=relaxed/simple;
	bh=ahdC9mXtPPw1Uxn8nDtb+CMcMP8D/4SxmKSmZOn/ffE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzOlqTLy+0gn8t72YyAukqbmfD/Z7pHRVOCs5Fvl4gYCoOnIj4qsRp1c56r527Fvy3a6UaxnICeuC+GxatqrRN65Uhm0MT1jmF+NvyANx1+aBy67BG5P2c+cFyefnVRmDkU7lHXBr1xCn3qrhHJEjY5NNp89YPxtRSM9uMpF3Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KI8O+Xu9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so20527645e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327671; x=1729932471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkq0jg3ZngL6XTBvF8fzLqW6TSLbi1vjTdZAT+9I8fA=;
        b=KI8O+Xu9lm2SWqYGE0SFq1Olk3gUwPXQtmHQwup9kxNaIyM2R+PUDQJ0gMeMJVKxoM
         OpLQUOs7FpbfIQpQmly4m0OxMwrWOFPNcln8X1GLC4MBocZGX00wfdaneRP/EWM2hoDt
         +Wov+EPCveO6ZcOeGgRrURr6/LMdV4/Islp8MlUloOGWqllUmA0bbJ5UjdImTTXhc72x
         d4v/KGejx8uueqL7v7iQQRVyvVQc0RmnE51E+Uk0LfxTvZyqiPbufnxmwovyzvLh39cF
         ji1lC8sPsJXmtyutt3cgvUT53h8RBREKaL4x9efZeQUO6zxJdv0/8q7oTVd5F5OisLAH
         cMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327671; x=1729932471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkq0jg3ZngL6XTBvF8fzLqW6TSLbi1vjTdZAT+9I8fA=;
        b=V/mBsmHq+eIkZ/WBvVtQovtBalT/P7jH6lcJWPzGE7dJyfuLW7Kh79qyDIRto126uv
         wz397eDE88NG4cfDq6ZsnZETtBd1yc/C2U4xMsxm93ffWettjJ5r4zbba7Lk8mOkCRHE
         +t3AToUBtuQEeUtcfILCX0vIqAC6iLRCJC3e4kpR44M0jUICM5smhrgqIaPf04I4U99A
         0WunVffx+0gqlO+6YWIVJnkf1XHx58EA9yMSI6XKlnf5Pm7lRp8v0tV7h+IsDPwfcj3j
         4wun0XNMfNeWQJTXssS45NHBl9BDQdX/E0BAlOBf0O635fGnROg6SgnoLJAfPTLclwtz
         y6Mw==
X-Gm-Message-State: AOJu0YzYG8hq8k4OL1he+zuStVzcQnUmDvMbvWwniiB5IVup85JziS1m
	5K/sGG5TQPY+3u1+tXLxq2Obx17944Tq5IDd5ozN+pq0LOWiMM6BG0LGSG0ZEUM=
X-Google-Smtp-Source: AGHT+IHRZnK+N802z9QG6sCXyGXCTufshJSq5kkVCxqZoVZd38I0PzQdwSftPArhYs9fPwGvWT8gSQ==
X-Received: by 2002:a05:600c:1c95:b0:431:594b:8e2b with SMTP id 5b1f17b1804b1-43161657e14mr36978455e9.12.1729327671331;
        Sat, 19 Oct 2024 01:47:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:47:50 -0700 (PDT)
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
Subject: [PATCH v4 01/12] dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC
Date: Sat, 19 Oct 2024 11:47:27 +0300
Message-Id: <20241019084738.3370489-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RTC and VBATTB don't share the MSTOP control bit (but only the bus
clock and the reset signal). As the MSTOP control is modeled though power
domains add power domain ID for the RTC device available on the
Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none; this patch is new; after discussions w/ HW team internally it
  has established that the RTC and VBATTB shares different MSTOP
  settings

 include/dt-bindings/clock/r9a08g045-cpg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/r9a08g045-cpg.h b/include/dt-bindings/clock/r9a08g045-cpg.h
index 8281e9caf3a9..311521fe4b59 100644
--- a/include/dt-bindings/clock/r9a08g045-cpg.h
+++ b/include/dt-bindings/clock/r9a08g045-cpg.h
@@ -308,5 +308,6 @@
 #define R9A08G045_PD_DDR		64
 #define R9A08G045_PD_TZCDDR		65
 #define R9A08G045_PD_OTFDE_DDR		66
+#define R9A08G045_PD_RTC		67
 
 #endif /* __DT_BINDINGS_CLOCK_R9A08G045_CPG_H__ */
-- 
2.39.2


