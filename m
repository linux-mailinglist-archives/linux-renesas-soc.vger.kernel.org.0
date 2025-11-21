Return-Path: <linux-renesas-soc+bounces-24990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5EC7AC06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7B2043671D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E2E350A15;
	Fri, 21 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fShMtjHr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF95934DCD7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741337; cv=none; b=ekaitX8pby5FZ600d+Q2yE+ZqgdvDKSCYZeDDInBWBgGxam4RMMm9aI6XwnN88cMl2Y5b4hFud49SWAiaUjdgKSDN1IliAEhecrLfa8HmxqjODiWqXSmOLCuUsnJrhTsH2/WHGYzmUcp3gf4LiojdbuDqDrgeBbcpPpmWEOClr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741337; c=relaxed/simple;
	bh=SAs0PZaWPeFBSk4KcIri4avonMMoZK50murb/7C0qcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2knR8ahXn6K4ovEajm63ofYyvIkeUXjuFJ7DPxKpfk48w/mwCUuko/cLAtkgfevCbk+0h6tyTMdgoZs8E6slLaQ19ZeIIgTDN+F3tKuiHRi4XqMSwmfOAwZiYssrGka9calsgAmTLp0QsP83v1ZNhInnhh4C6d5xBKYl7JM44o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fShMtjHr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso10593485e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741332; x=1764346132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9C+Ue8cMcG+njUQyZUQmHV/igv+sYiQ8hcgoRvKYA4=;
        b=fShMtjHrfXjYqGlQ0l4rhnQdzjLDBKi3che+sZ84/eAXcdXSehHk+fopV7YwAv7CwC
         90Z0+yU7fZVIULSBvyCQe9nINzY8mJ7prjNOBqx24/vQe5LzYJ9RjqgvReiPpWzkdeno
         4gMsy5VaNTZ3lUVzpiDxp6r60Yc1Z/f3Yf+6+fBAUfpqe1iXv4QHhPSNJ5YG/0DO4hCW
         F/3M1Vt1qUQVX/nMQCxDPd5DPXYWUsFOTjO2gZiQ/fMn1vLERSmsHGmkIbI30+tqhMNa
         EFWiZIzB4K4V//LuBZkd0ve3QtPFWffl1naeHzFtcnUVJ4n3Q4LwEOvuKH2m/ppgVQVX
         7p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741332; x=1764346132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R9C+Ue8cMcG+njUQyZUQmHV/igv+sYiQ8hcgoRvKYA4=;
        b=Xt22r2uAMcYFH/AeO6v5AZbF0hB45VGr7w5j+S6YMuUn757tFY4vI2ijij3lSh/lI6
         9y5NhVJ3348mClVUG9crMgmzM5fgUQiFZ9p/1QESeu6v4jMzhsXhB4igdmyJwhzx4/Bf
         sHgpwd1Yf5CiUtE2lhanx1PbaMM/X18gZ/3JeqcwAi7MskhsHVX0UO5uxgsIbx0+kSuF
         MrKTbchdAUB4ULNaVKoUuVrqBGBuGgwVcvMk1et81JYRg4UTmhGB/44a9voodYKNJdib
         Y6KSBd9rUmVxNO4NpJP6YJqXAXB9VciD//KjsoAHwa4gLYtNHTFe6HEjUFBcggSuLMed
         QPRw==
X-Forwarded-Encrypted: i=1; AJvYcCWVK17Q079LEeJ+O9CoMxbCwsV6S9RRmjhT8CG0QGRvb3YP3D7ZQ526O3E5FSnxHGx1a2E592Z1MUlXM62oaNjeYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8SMCsWXybfRv3DkyrkMFj8vQgPe4psGdV9nmngZvljEu6kZmL
	reKkcIqVjJCzuVgXLSIEa1o1DL9wkZ33zM8eOiSZMQ/I6qLhUE3JTsjR2lNptA==
X-Gm-Gg: ASbGncu78CtMdwmKwQKm5Fix+aTVxVRT1Cne3uykCv2qiGXal/xlIfvRSJxlrP2KIhO
	yj60y4eRYkPM5jGDzRvjadr+MOaAxr3hzHMMiMDxcv3OmspznWuCXEaZeVBiva/zbeAU6rWa5po
	Yb1d71fkS27BaLReQ/wCtIUQLug3Z4cUXguBl59zakLy2mHzRry4shgvTM8I001Ta7RlshxEGwF
	1QiVo3+KiXPIhqKsLkULRX1PpFXNpVZmx3CinIplW0Tn+XK0GGdcqGJluniNE0o2H17vRRIJU2+
	cyYExRsYhfyXs2eslqlMjzdkMrKPbMn7WH4wYGHdWVlLc18CXYLSVdmuygY2KzDhnTfms56ixBH
	zKHIy/fu6qaCI0CSKs8RAJJy3kaU5LXZ59q4iu/JvUHIndmTMKs0a15RSfoDYxHpMS3QSmD87RA
	plKUe92ckFkVl54mfIwldZe1MQsg1CEeDu0AwERM/2iNRUWCeL0gCKFlpEmbKzpsog8CwtSTI=
X-Google-Smtp-Source: AGHT+IH4jxNoAr2KGBsMthVy7F6coCsto3BqmhfkVqtdBgcmZbZrjs/t5yrDang5WvrNZ5Prs+SrBg==
X-Received: by 2002:a05:600c:4f46:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-477c1103099mr28244585e9.2.1763741332216;
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY PATCH v8 10/15] pwm: rzg2l-gpt: Add support for output disable when both output low
Date: Fri, 21 Nov 2025 16:08:17 +0000
Message-ID: <20251121160842.371922-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch adds support for output disable request from gpt,
when same time output level is low.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pwm/pwm-rzg2l-gpt.c   | 9 +++++++++
 include/linux/pwm/rzg2l-gpt.h | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 8006c62068b6..a0100e1b948d 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -85,6 +85,7 @@
 
 #define RZG2L_GTINTAD_GRP_MASK	GENMASK(25, 24)
 #define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_HIGH	BIT(29)
+#define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_LOW	BIT(30)
 
 #define RZG2L_GTST_OABHF			BIT(29)
 #define RZG2L_GTST_OABLF			BIT(30)
@@ -493,6 +494,14 @@ int rzg2l_gpt_poeg_disable_req_both_high(void *dev, u8 grp, bool on)
 }
 EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_both_high);
 
+int rzg2l_gpt_poeg_disable_req_both_low(void *dev, u8 grp, bool on)
+{
+	int id = RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_LOW;
+
+	return rzg2l_gpt_poeg_disable_req_endisable(dev, grp, id, on);
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_both_low);
+
 /*
  * This function links a poeg group{A,B,C,D} with a gpt channel{0..7} and
  * configure the pin for output disable.
diff --git a/include/linux/pwm/rzg2l-gpt.h b/include/linux/pwm/rzg2l-gpt.h
index 718aaeca39f2..adb5b9cfc8b3 100644
--- a/include/linux/pwm/rzg2l-gpt.h
+++ b/include/linux/pwm/rzg2l-gpt.h
@@ -7,6 +7,7 @@ u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp);
 int rzg2l_gpt_poeg_disable_req_clr(void *gpt_device, u8 grp);
 int rzg2l_gpt_pin_reenable(void *gpt_device, u8 grp);
 int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp, bool on);
+int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp, bool on);
 #else
 static inline u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp)
 {
@@ -28,6 +29,11 @@ static inline int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp,
 	return -ENODEV;
 }
 
+static inline int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp, bool on)
+{
+	return -ENODEV;
+}
+
 #endif
 
 #endif /* __LINUX_PWM_RENESAS_RZG2L_GPT_H__ */
-- 
2.43.0


