Return-Path: <linux-renesas-soc+bounces-13954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D228A4DB4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 11:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A77F163641
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 10:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE671FF7B4;
	Tue,  4 Mar 2025 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VB7c72yz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AC1FF5E6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085320; cv=none; b=gn1T1kkqaQrutH6mM+2iU09QsHNj2jB9SHpCXsc4LHgIO7iUMfL7I1zRW9/xlCm47tOewB2okrBXPzR/SC7fs0wgT2CWxgaUT9yxQZdKvyvCKtjcNxxvRfH3jFZfdui6iSPNJi7AcIWmNgKGomnTBIodptxRrtt/zeBtudzG8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085320; c=relaxed/simple;
	bh=Ed0whvbRiPMkWLTpCwW5FbR8zUZHMT6ELFO54H5wtf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRprJkstrHRtlvKK6dQggJ9tYFrf3l7nif+DbpxBKiSqcgjHGTuqqsLIx0nC9vWaFlFuYihPO0O1/o8giJdqQ4pm5sjaiviW78XzSCoED2GoVo4mSK+tvx88TIa/nHTWUqjIbfMahW+RGlKPClSz1hBfY1u2NEATmGIbg8aLYK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VB7c72yz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390ec449556so4281467f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Mar 2025 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741085317; x=1741690117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5a4oKKcOuJdLssc/zk2DHBl5Am0SwZ1rfHw8fwtygc=;
        b=VB7c72yzwAXsBnycwcZ3P+Aw15MMmvOJ64ZgY8zKuVeNAdgJmfu5dp0c6of5864ePZ
         FRTNyPveMvc07XSfYpTJC1FRQ8uIaaT2NsNw/Z5rDwkIaKAAttA9/06VbHXyE4Z0DbdQ
         xYmZ50Oq4DSC9pJZzuW2pEy7Cntq4zOCYffPQ0VSX46nLigzr5FCa5dOkGHXaOKGDPgD
         m9kVxX0eJf+Q+QB472g4kWSeG6Tt+wfqpBxs11SV9gpEHG7RgCIDQWgppX9usnQs647I
         fDfhYVU5D6quiVHSQnhFgPXDvUdlW2V0bLTRfAT//VcxdySYvPcohyzydn+RLqjE5wz6
         oqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085317; x=1741690117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5a4oKKcOuJdLssc/zk2DHBl5Am0SwZ1rfHw8fwtygc=;
        b=HgrADv478FrMBVh44X4Y/BhwbVvfUqVCXWmipvR9g4/SDQJW0c9fHL4oUkaEUKAdeS
         WCfHUuMTbctMyn/+t3lx5s4gdJE/XYqgZwWltTxjny2gnvBgglyXRtmY6hNojn2mk6jY
         njroUK+HVFEmFBe7huAYAmsyjJrZ19pN9rnAz9N19QGj/dlgYJ3c4UBSN/wM4nJPV5C9
         +56oN18XGjNEJQabecu7K9BoI1lCmxvBl5Jpw24c+UAo+REkQZiHONKnZJxGTlgjLGvA
         DFnqu5bURPt2CxnkhbYy4W4ch1RQEfABVbr81W2DYN4FMYcQsPiP4NxSLbxF8Hebs9T6
         kyAw==
X-Forwarded-Encrypted: i=1; AJvYcCWZD2Ow2I5jzFYs6sO3peHgtTRZ5lO6WPWtGcyP0Av/2XNoBvNXNW8zr9YFtr9IIphXsHloEolYPOG4Aa9PvoJV7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YylQTO0LmvTSPn0HTC6EBRRbAOZ1icc2GpXR41u9IO0kp26SXsP
	wXJIdJeZLFKQ0ge4pmx46iVp9FhRcMCXYzu3mgjBxH75RvKTWVOlEOD+GN9ebm8=
X-Gm-Gg: ASbGncv1yy5NDf3yymPz+mHcFleV+tbSRE5S5FvJyW2yNWlyF1grssVcjNhq9OgznNc
	4YTr1es8H7zOY/jTMjSnRfxap7D2PSUuEtojWYKYeH6XZZw2oMHWPwGkwA20pRXFVO7zbLK+j/8
	BHccygQgjQXHkxthX3T/m7kjwr/oB80jDO3YMxGvCRdhvYLYpHrheAulYJhvkd/Rimn3+eZYpxW
	IW5x9kXEJgysc6+kpueABcdPVLKZVdVeE0SEzO8YhX0Jr8HpdfvUvEXUa916dQAkwyhupntCawR
	u+qQ0y0ECqG0FnxIazr0TIDL1Tcqz3h645mOSAMNw8NFAtR0QrWeqA2X2GHGFSBWgCjgbBa4XXM
	=
X-Google-Smtp-Source: AGHT+IEe/y6XNr+Pufr0eUp0xR/8PGJhWQHFkFpwqwZ0egi8lWAzXxHeV34fKxnQfAGSlETNCc8Irg==
X-Received: by 2002:a05:6000:178a:b0:391:1458:5af7 with SMTP id ffacd0b85a97d-39114585b3dmr3675285f8f.49.1741085316629;
        Tue, 04 Mar 2025 02:48:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a38sm17445161f8f.75.2025.03.04.02.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:48:36 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
Date: Tue,  4 Mar 2025 12:48:25 +0200
Message-ID: <20250304104826.4173394-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304104826.4173394-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250304104826.4173394-1-claudiu.beznea.uj@bp.renesas.com>
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
index 39c73399b039..c663910d6163 100644
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


