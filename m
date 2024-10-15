Return-Path: <linux-renesas-soc+bounces-9781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DD099F7C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 400F71F21FE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EAE1FC7DB;
	Tue, 15 Oct 2024 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWo4tPMl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB51FBF6A;
	Tue, 15 Oct 2024 20:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022556; cv=none; b=TEdMH8ensv+m8DvK53n5qfxnAJc4r8fENNV/OGo61++ELudNeIj/nR3mDnZqGd/yGb6RqdZVyVrVKEFeWjXxoAHfMkt8C3c7A7sujMZ4vardM6nIbbLXVkg6fFUdFwrJE4uwcoUpXtzcllhKuoekcPSnbBTQuOg3pJh9gO4A0fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022556; c=relaxed/simple;
	bh=kpfwe+fvowXcGzmJqpdKyJMDtf4fb+tX8OFMZdBRE3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPkZX4Dnk4bDst5dw2geXA6GbCe9/1zLTeGE2nX9PbZ8YTpWzO8oV1g198tj2WtJ8350PhRIDgsZjFZOpVxkThUpyStHTG6H2Buj0PliUjkmROB8vpi26gcKx5EoITtHENzAk7h+TwhsQagwk4jK1fr61Al2tS+V07bsAtppMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWo4tPMl; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso627863b3a.3;
        Tue, 15 Oct 2024 13:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022554; x=1729627354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a9VUDfAgcqpZiCfPNq4jXdzK+N7TPauvAcKBYTOtR4=;
        b=HWo4tPMlc2JWSwqeqSGJW0W3B2OZLd2gFXQzZi7eVzHcrYkYWJR6x9ZTFo4NVj+QvI
         Vyaa+go3tLPUkmCBGfFJDZENXEQw/nkqdVSdgiBx+rsEEggspDsR/z3GZR1+EDQlno70
         8RSx6TdL2IzPIqj4TUbRLwHEqQoEjOyk63QjXDJwgsT8aAoZyEhe0guzFbpSpOOKsqvk
         nO+Z9JQJ+vkeD/lzJORBp45omkeF0tIFKRBHUzIzpTD91/VfYIohQHoW5giPWNk2DkKg
         I1nIaI2SlusLhWHE8V3MFASLuEcKpKGWtjklaVyceAsQDQO4yqrj5C30fKuLWmsJXVub
         bT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022554; x=1729627354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2a9VUDfAgcqpZiCfPNq4jXdzK+N7TPauvAcKBYTOtR4=;
        b=rxH3y3dfLSKbF46bqsfqcH016JwXMlnmX4dqIliVHa1vGxiG3ZloruFW4krsa/bFr8
         0RkFMgsTf49brzqRG7NqE9gc/Sba4Ej48SeLzUZSlz10mAaRGPMmiFjPR5FOb+vFx9cM
         IVnaIVo6H6SEPupZH8JBA5gNisdaq07xZr3vGfOc9zbGtqkuKobJdl1qnqN4SLPTHHk1
         pHeUCE/Cq89mXrVwNG9RDuvISH/wB8BUcCcsgl02YrYZsHhON5OeFVwHD7eyMK4+ekv1
         XYCQUlG2V/DVm0y4nNe249d7mzQxRp6JIDfnkGVqQTtifp87mw2CU6D8oELDla7KBrhJ
         YgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy5TXA8ShDwEF56dVa4cXkE8+/pvuMF7e3w/WUKtkrk5ep5v/yE6NPjSj6j0ns8iV+QIBlGk1Rq6hG22c=@vger.kernel.org, AJvYcCXFS9/m0gZ//f0ERhPjMdred42B46NEGkZ7LyuNYRuzEOhDbDJ1Nv1lk9y9IqnMcGxQwbYlU6fFukdfRtOQT6k5x2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMh9dWLUn7+j4dnkT1c25gpHPIWurs5lrF0FzFCG8jV1iLwswp
	0XOFJrstbZDE24yLYq0KVR7RmuwpCfWZwGRhjTZ5p4SJ8DNoXnhsefrg//iA
X-Google-Smtp-Source: AGHT+IELspwjwMAi6GQ1tPEVnlmyu5/Vbdj26aLViYHWoDdgTLetyOAF0oSQLCMTAUGIxqmJP1ABaw==
X-Received: by 2002:a05:6a21:8cc8:b0:1d8:a759:525c with SMTP id adf61e73a8af0-1d905f63a39mr1581237637.39.1729022553614;
        Tue, 15 Oct 2024 13:02:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCHv7 net-next 3/6] net: ibm: emac: use devm_platform_ioremap_resource
Date: Tue, 15 Oct 2024 13:02:18 -0700
Message-ID: <20241015200222.12452-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015200222.12452-1-rosenp@gmail.com>
References: <20241015200222.12452-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to have a struct resource. Gets rid of the TODO.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ibm/emac/core.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 644abd37cfb4..438b08e8e956 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -3050,12 +3050,10 @@ static int emac_probe(struct platform_device *ofdev)
 
 	ndev->irq = dev->emac_irq;
 
-	/* Map EMAC regs */
-	// TODO : platform_get_resource() and devm_ioremap_resource()
-	dev->emacp = devm_of_iomap(&ofdev->dev, np, 0, NULL);
-	if (!dev->emacp) {
+	dev->emacp = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(dev->emacp)) {
 		dev_err(&ofdev->dev, "can't map device registers");
-		err = -ENOMEM;
+		err = PTR_ERR(dev->emacp);
 		goto err_gone;
 	}
 
-- 
2.47.0


