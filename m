Return-Path: <linux-renesas-soc+bounces-24498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37DC52AE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 880F4501C72
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 14:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C18733FE27;
	Wed, 12 Nov 2025 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKuYFh16"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8921133F8BD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955883; cv=none; b=GIs39JBFpqEC0g9R9gQhV049l4SJyejNKqgzgPnCfRqZiZz1v6JH1xOu1aFwmDUyJafhO4DwJmB9PuNZh4CiKZ0d/s0cBLDFdIrg7QmJdsFXwPGT0a8AoSEY+SfHgNYm2B1BSUg0MG+tobfLXBhZKtLoYimxWlzEPk8K1GBHHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955883; c=relaxed/simple;
	bh=TVib8KoMScZCb+KPT85+QmKKvlCH8lixAtnRmNJ3Neg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IaHxFYlrs/z/MqqnN2ukYTdEU+qARC7ovDYuEZPp3excZ+Z670tJKgpDWLnVapv6ZIK6mG2OQfZNdtr2hvjyeE7jajz0mdF4AMMrRZ0TwS4+yusYTq+ByC0IJrIzF3n46XO38Xeqs/yHHQiF5XH1aADdTaj2wgSF72f/3P/27YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKuYFh16; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so1074676b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 05:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762955880; x=1763560680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1/MI7fuOzyKPjB007+f1We8KvicofZrvdYQ3ilyzeo=;
        b=lKuYFh16/6rkyavH4eqTg6FQaEhDKqJQ9T7YdWTLOsH2HVZAG4cmn6wTPORrzSaa76
         YZv6hKrXeQrk64ik8lj1cD1PduE4FtX/J2EjCEOTboCTi0XqeA3/yJ80z98r58pNfCup
         8bLYppRSnhhG4vLiT+SlznkSaqncHb7c/r9j8GQUwBCn3AFtai4U1CmbLVw8C+7HcqMf
         E0TGmlGCAlvSpnJrk5+YtYmEaYjhLblAGsTkRdjtnuBPS0Nq05cpKSYJ2YMee+hEvovE
         kqqdDLSbQttumlkIt4DWZLGexew1tmzChcqLiNfKf/7sIbkOINlRQBsjU8R2VTt+Ky0t
         Rf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955880; x=1763560680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1/MI7fuOzyKPjB007+f1We8KvicofZrvdYQ3ilyzeo=;
        b=MKLXtWwnGX0kyZNeFFG4aIWpUFU6BPGodoPwcC8B5N+w1sH7s+kIbMiXpZ9hhiG4MY
         NNSMYBnXUMOJco8WC2mY+eJyWUG5A9OWn5RoOs7VwVrkKxBOiPpUDsUcvyvdA5L/BAXN
         /RXwy9ZjjBQfZTt5H9PLHwrcssqHXxFLSUvqg2gYliRTb9EpaekanPxRBEKmNij08U9Q
         VNLyPIPyVfIWmyjkRsRO9KuvdYAqr1mU3J8+oQwiK9NzzTieQWoRxCiW8BxKN4Rj7DO5
         NG9PFM7vYxwDshErcW5KeY29iZjXFQ8xaNaEbzlRI1dtaHmnyA0fEW+fElaB+l6PA3ME
         0zZA==
X-Forwarded-Encrypted: i=1; AJvYcCUCBRtrR7UJo5594+rBy/xltMo5Dw+6BejOIVYrbOXlzswTJTFjrb68UtBii9YAzC00BXYMa7U00Yd1tFdXjlb1SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy3KZXXAw+uvk7HrvgHc3dJb6n+OSaMP1BrGP8wZb1utGJAtoR
	r/H1wplx8Tuku6zpMXuVZD4dN6c8BHnW85sBQ0aDrAZOvf3gDC/se7bD
X-Gm-Gg: ASbGncu8mLtC9ZNr/Yjxb72BZyDgVA2CPwk/ftCnp8RZmUSlnibxbimHw79NdNe0Jxq
	w9s0hI8qpbCDeyICbLJjNv9lNZ09XMuEOxhdsCgbxVJ8VOzZwpeTT4Up7qtkdhluF32zS2P5Ob/
	O3P9rRLVz6d7CBN0eMagHJuRY5WMl57l60wm76hBIBHufrbOAPlUok8M+Ewse0pvGYdm85NYSrL
	L6IlfpZrB8dg+5wS68syzuPOVv3rzNwY7nGcXFy4a1U5uq3DPLRmwR0jhGhckOkv7nU0r74c8Iq
	Bx4bVZMG9qAPf8w+L0qSqlvtd/+lP1dBdx3GXeKLiim4QlzgLr4JME/Xnvnq7JaZp/BFpzgJfS7
	PHuxTXMfOPXY/plVIhGIp2fq+r6KRNxQNy8cJ+hh+xdfjc98+m/nsU6WbM63JsDus2rp9J/1ZU3
	BkxJyK2QkKKeV7/ZB812Pq
X-Google-Smtp-Source: AGHT+IHyp9NWySH+cDzcnVvq8I6ZIzBl9JYoz2ufTq/3+N/RimV2Z+kLAg6PlRzSKztugHPQfUdG5g==
X-Received: by 2002:a05:6a00:88f:b0:7aa:d1d4:bb68 with SMTP id d2e1a72fcca58-7b7a46ff44bmr3401593b3a.20.1762955879820;
        Wed, 12 Nov 2025 05:57:59 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5748:1c6:5ce6:4f04:5b55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0f9aabfc0sm18361299b3a.13.2025.11.12.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:57:59 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Parthiban.Veerasooran@microchip.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 4/4] net: phy: mscc: Handle devm_phy_package_join() failure in vsc85xx_probe_common()
Date: Wed, 12 Nov 2025 13:57:15 +0000
Message-ID: <20251112135715.1017117-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

devm_phy_package_join() may fail and return a negative error code.
Update vsc85xx_probe_common() to properly handle this failure by
checking the return value and propagating the error to the caller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- New patch
---
 drivers/net/phy/mscc/mscc_main.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 21fcaf07bc6d..2b9fb8a675a6 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -2264,8 +2264,11 @@ static int vsc85xx_probe_common(struct phy_device *phydev,
 	/* Set up package if needed */
 	if (cfg->use_package) {
 		vsc8584_get_base_addr(phydev);
-		devm_phy_package_join(&phydev->mdio.dev, phydev,
-				      vsc8531->base_addr, cfg->shared_size);
+		ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
+					    vsc8531->base_addr,
+					    cfg->shared_size);
+		if (ret)
+			return ret;
 	}
 
 	/* Configure LED settings */
-- 
2.43.0


