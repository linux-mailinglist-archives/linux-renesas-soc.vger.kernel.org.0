Return-Path: <linux-renesas-soc+bounces-16756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B77AADFBC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9E518900E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 12:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A00284B48;
	Wed,  7 May 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Lo4kv64Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78633283CBE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622245; cv=none; b=FnHh3cIzxxTxWu/ytRw5VHKtJr9gzkKokYL4NRFaEbvYnAfoA6U9C98RVWr31RWfMif4ThYQDaAV9YLcAFEOJw1oeIButNVtBew/AjZ6myr6WoTKoV5aUyBuJVBSz6xbIKXRTQMgiK95eUi+GUlme3rkmfXkKF2aVMY1Z82QBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622245; c=relaxed/simple;
	bh=cSM0SXbi9Fi+cYc6Hqvd1VUGwSL3FdGobsRiWjVTLxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=annz406zuyw6fNV2XTtCfzdmtx0OekEYuQ+LTDTWhdmQNjzknVPrI4/E/00mWJJdSB40zEF8qYl3jZA/gyWAocJZRrbZN5TYfHoYB5np4zD+j5wMwv+P48cM1Gbt9MSbCrDiB0PxLquD385AfLZwXl98CAvK4JHHvrDz6tMrNVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Lo4kv64Z; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1217824566b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 May 2025 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746622242; x=1747227042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II15ozzD5Ll5bPmianAxLgZ6qAOgIxXenrt045Eb9ZI=;
        b=Lo4kv64ZopQ0mXQOobY7q8w5WtWOeuwyKhu7i6D8uYw9eHObqv22iSMZburpsMq5DC
         vUqE+sB/aNbYyXDsBdSnUU9XaqTypjMR8nXgR3wVKPpuG3y88vuTLdYJB0w0TLOts1Tk
         KQ1VAXahhB3mjqEuPwkBQj/qLPBV+Uq5mCkdWPAclmZwIs1gmxihB7PWaSntNw2qIO5y
         OpWHTDgIa5PmEy7O/O7KDJGMGEeGknxsne+xD/IFjYeDIP4iy9c8UsZ+S+y1CYIGjlXw
         VtSL+22LegsWWWrghttxf0gbO5//1YsyFCEcPM4gZBpvOJYeI3rP9PenGjcYrG0/eyi+
         ThrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622242; x=1747227042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=II15ozzD5Ll5bPmianAxLgZ6qAOgIxXenrt045Eb9ZI=;
        b=clAZdR12QuMfOA6epXqWESBNNzZfUsTCuxTmh78YlWRKNxjd7MCsThQhFdTJfq2ee4
         2kHhPZ8ojWMqjBxNqjdJ3JvYcPzDgknfOWlGWRdkMMm8Eu7JeBc4wIjsJYH4LGF6tEAe
         zEvoxUZaPBVMq1SJBhQR+Er9bLdQ77v6hFll9HqZuCcSIzwPFJYumWq1fe3mje5QWHpl
         /DCEs/mLvOfoXO6KWub7nAK7Mb7dnex/dzJ0cXBg8PqLaftOFpTgvlLXhpvMfHTw25Is
         N6XTX2dwaIhB+ReBCT3fvnglfBZwIFQiRByu434Z49AkzE2H0ihpqHOcgiNPp0vmkh4G
         mdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfSwuYk//nRAdxKQhbSOIArTOryCeBWEeQtGqutjpx0N8b9FKw7a2uG+ItUqIX44KixyvXZFb92w5in9KRlziL4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCEhtwj63XdnoCrLxcJuNTCVsb/abA6EdGGmGEcfaVwO7a1SF
	v6HdrRzM3nqsDCnBUaW8jkq0G34qakwDoxq8Jee5WzMtrEMQMNN5NOUbQXfJZDXGlFeTc1+AmrQ
	k
X-Gm-Gg: ASbGnctKpOSS7deECOVi+JfkyIFVqu9cT8KTYqW2SUCuubT/Ym8+GSi3I5HwBuO4eHl
	76iFfOp59dO001yDH9Me/oQgBYmWWOtJ3a1iEoXTJU2SXXcp7uKr4InigOHL+MylZy767n1aXx5
	Z5ZSIzvodQMgZ226/KXWfo6S2vzbIMabzuEGFl5BZiz7R7/XiLtmBjTi5UVHIiLZhOxlv4aEb4B
	z8AnLkfKrHJE06zcwUbA0gk84J+m5MFJvn/wNBLU4Tr6A0F8NCxCcH5d1Qqm90Q1Z5iiWHeyVgq
	9Dri7kV29/mMUrpn7wF99EPWcGBYrgyKz9m8eeqetDvlXdoV6KfMisznXCcpwbEiE7/nFyA=
X-Google-Smtp-Source: AGHT+IFlk8miHuB42VMfUHBSf4Jai1MFWbXY60yj6sLC16sMrTufuU3xeUkiepwAWbCikXCtbz3w5w==
X-Received: by 2002:a17:907:9411:b0:ac7:391b:e684 with SMTP id a640c23a62f3a-ad1e8d9c78bmr295475866b.58.1746622241642;
        Wed, 07 May 2025 05:50:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm913182766b.10.2025.05.07.05.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:50:41 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND v3 4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
Date: Wed,  7 May 2025 15:50:31 +0300
Message-ID: <20250507125032.565017-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Assert PLL reset on PHY power off. This saves power.

Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
Cc: stable@vger.kernel.org
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags
- add an empty line after definition of val to get rid of
  the checkpatch.pl warning

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 00ce564463de..118899efda70 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -537,9 +537,17 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 	struct rcar_gen3_chan *channel = rphy->ch;
 	int ret = 0;
 
-	scoped_guard(spinlock_irqsave, &channel->lock)
+	scoped_guard(spinlock_irqsave, &channel->lock) {
 		rphy->powered = false;
 
+		if (rcar_gen3_are_all_rphys_power_off(channel)) {
+			u32 val = readl(channel->base + USB2_USBCTR);
+
+			val |= USB2_USBCTR_PLL_RST;
+			writel(val, channel->base + USB2_USBCTR);
+		}
+	}
+
 	if (channel->vbus)
 		ret = regulator_disable(channel->vbus);
 
-- 
2.43.0


