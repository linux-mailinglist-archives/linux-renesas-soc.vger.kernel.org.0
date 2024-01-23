Return-Path: <linux-renesas-soc+bounces-1709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 863AC838F25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 254041F27ACE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E63F60240;
	Tue, 23 Jan 2024 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JXk7pOBJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD625FB9F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014782; cv=none; b=NZWo6HgAVStuKmw7WCHh44k9lb9lWu1b8/wfSNloRzGBJFdJU5RjNcy3pEaGrCG0f88eyWbAnYu7ZwlR0x3hQIg9sjZEjslgoLUsPnrRwghHaZ1OxJ7HM7okWyraxv3mGMs6PDXf6lw4Lu0py4TC9r8444lkzgqfDza48fjNiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014782; c=relaxed/simple;
	bh=kAEoXOplVy5YWA3sBqf12QFlLVQhI4EiSxiILtHkle0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dRDyFRoB9q3kDZPiPwHHiignM5sGn6p/1QmOpByKkXut9tsaJluoa4mZxdO8VrIfd/tf/HklVma/8uadHeMKiSmDkhITxxEr2Y3Ccd9/WyCiE88erW30sNFAGrjIvtYjBSmmVgvrppX6C7Q/vxP8oyw+aNj5D6y1ag6rzSr+Khs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JXk7pOBJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40ebfb442fbso4170715e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014778; x=1706619578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puI8SNnunhmOcoJT+z8Q27MsKtmovJKKV09skkr2C8U=;
        b=JXk7pOBJdHeuCsBSkLiiUaOaaDjgQpUj5lg+5t3xin6EbtzFj+e6NvBi2/8q23bD//
         WNZj0BSHcr23MPad0jisNp99NIEcPDlGOf8MdrG/aep56qSPQ26p5iEOkE2FK3qUpM/b
         tIcwmc4Z9aqWEK2Bi9Uzsv7WcNxVrBe8EDnWBnz7z9UbcBTA7iDZg/e/4EmHUxlAzknD
         2TD3O6erJ32BOTtAqeiUKLHu5TFH8bgY0nnYvSvtf/L05h0oD9NrEUbViI8SuX1Ue0Kp
         Hc8wLl8af3HzkZUJY4qBQF330j7U2KiRYWwmkjE6gBZyFVeEx/Dp3BsutsdMLrspIN+C
         5WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014778; x=1706619578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puI8SNnunhmOcoJT+z8Q27MsKtmovJKKV09skkr2C8U=;
        b=nHZX4a8yU/CdL8gjXgtQeW4WFuUNNPD+BtnRCXZf2/9xv9EixAUX15R4RJR9JHmnUm
         PrhtwA6aV+PEH3oKm7poOuM3hsY/tDVaNFNQmZT2x3+dLNmC5JQ5X7q2Aufum4jKQGI8
         I6IKrTJhNL3+5Z6jQ5k59yg8xBWAIlCrr0z9dVNusH2Izprtx4YB+dbP3na5roCMzENs
         h4/S/BSaNQEoH3wXGiJtTqk9GP5W67DiLFQgAaolmghBTBcEJzZHaFeiyMCsT8UH+L/0
         eNPFMK9/WsFVqiEMJ1UW8zRnDMzo50QgaD9Vc2NTifB7WCKLtdtys0qVkKYsHPCgDux/
         LuMw==
X-Gm-Message-State: AOJu0Yz0lXEgqcqJ288BGj5yQwx6XP+eYJVaF2ulsMj5x3ydE16ozJL7
	8TfzGPLeqMVWiA4N1QcovhROLfxH0rASW7lkJAEzcXQAiWgy9NAR0sN3DSBL45o=
X-Google-Smtp-Source: AGHT+IH2MT/KO/WgG/1Z1dx74VNrUdB2LnMBhRP6NCOQ+c98dRC4Y02BkxHXVAp2wxLBtaGUGsnpyg==
X-Received: by 2002:a05:600c:5204:b0:40e:8e61:3202 with SMTP id fb4-20020a05600c520400b0040e8e613202mr266529wmb.148.1706014778411;
        Tue, 23 Jan 2024 04:59:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v4 05/15] net: ravb: Use tabs instead of spaces
Date: Tue, 23 Jan 2024 14:58:19 +0200
Message-Id: <20240123125829.3970325-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use tabs instead of spaces in the ravb_set_rate_gbeth() function.
This aligns with the coding style requirements.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/ravb_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d054d1405cec..0a27d2741e8d 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -96,13 +96,13 @@ static void ravb_set_rate_gbeth(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 
 	switch (priv->speed) {
-	case 10:                /* 10BASE */
+	case 10:		/* 10BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_10, GECMR);
 		break;
-	case 100:               /* 100BASE */
+	case 100:		/* 100BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_100, GECMR);
 		break;
-	case 1000:              /* 1000BASE */
+	case 1000:		/* 1000BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_1000, GECMR);
 		break;
 	}
-- 
2.39.2


