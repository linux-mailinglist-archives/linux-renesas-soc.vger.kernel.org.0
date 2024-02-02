Return-Path: <linux-renesas-soc+bounces-2261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F35846AF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F07E1F241BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DEF5FDDC;
	Fri,  2 Feb 2024 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="L6utNQ+u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F8060260
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706863319; cv=none; b=akglLgk4MqjsY081rL15iyZlGfkmx7DQFAnqlsVm6x3mN8hcybmSzi813U9pr2aq9ANenTHY4TZds3Gz+iW+xolyapnmXRf4MaU+MaYP2zgHlvAv/4nsTRnJY432O3m+99LdnzUaUbCUlc4wy/AX/xP+qwY2TjULJTCoVS4+vBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706863319; c=relaxed/simple;
	bh=b56D2CY5bgg4QkrVUzroUfj/0+2LJ8RI6nI9KNFOMcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+r77DEu9aGlXtpD5yj1oMB2ZCglWYiOtrZ7arnVK5tKgyysnkEbI3Mv19XTn7ZcfOfdOhlhWPJSjtxyBvJNxBRVi2DSnPAvUwPTVpPmyQis3o+bS7ajl9P21bSV1XzHA0rD28AQTpc5gRFG/ShFjhqU3IW8SszJpc1JBSI65hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=L6utNQ+u; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a35e65df2d8so245699366b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2024 00:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706863315; x=1707468115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzGt+E15n9CkIZ0b5NiVKi9D2q0/fFc8ybljSM9HrP0=;
        b=L6utNQ+utTtHZ1bk0qxAIouJtFmh7SFKayws8R2qWPQMEsljKB0NJ9I7IYU/kjG359
         12TBxX7EVyJDH4WPBNYCfhKpsc5NVRONP4VezyE3+Q3ihol1Rt8Xlnd6gPx3OesoctEw
         6ok7wAXO7KpFwuLkjEswenn5jz09+K1ddeeE+2lmH9KHG9vrkV9Rr8J67WBks+DEg9yM
         GUyLpnKqnND2IaUuR9Z1y1XNcrBpmKKUGtuP/kYbKR0FXXmHqnCYeVp8uVbTpCPwRmWi
         AJYfsKsOv5FQSVrNkG2c7dOccLlXzXjgWSkr+dgxSsZXTZD2BAbDZwTq86W+raOPz58Q
         9Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863315; x=1707468115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzGt+E15n9CkIZ0b5NiVKi9D2q0/fFc8ybljSM9HrP0=;
        b=wolzdH4AY5rslqY6RnHXW3pEJJc0+IYUZeQzTRsYYHPz5LN8JCfFU0nr6ONZq6x2tj
         HWWq4wWKzZAzBnAXyIYUAKZS/EtoZn6D3aI1cxriTORLjKKIVqmy7ZCaXzGz+qsgB9C6
         boxakwAFrRXfCAFKhOCgTR6IoKQWkC763FnN0huDgdv40p5x3PHnmXs/EFTEoK4WmRH9
         SFVrnrDbbEmGXSK1gVVXzS6+WjZQkRM1IbQSMgXfR/Pr5ImfqgCx3t3B6WtvCntAb3Uo
         XWUTBCWVrQZZgFCb7H+pUVjj+WomvF5r9OQdtV9OolWpSmonNYT/T7HiFR/PPPZBUkLz
         zxxA==
X-Gm-Message-State: AOJu0Yyua6QWVeOCAJFDVToRtBNjXlgzZle6b36zpyzaJqT7h6i3WL35
	tsaYU5rDeLh8J1K3kwSFdHSn0FZiadZtrtSEO5R6oDEgFpY6kDrbU4C/IPHnoEI=
X-Google-Smtp-Source: AGHT+IE/pWJ574ClsrBeTk7aSvxb2/16S2ptiIy1yUNi6iNmqVmV3gn75wwbIVLVtrT+d481lsT/jw==
X-Received: by 2002:a17:907:86a3:b0:a31:8b26:47ee with SMTP id qa35-20020a17090786a300b00a318b2647eemr1334170ejc.55.1706863315094;
        Fri, 02 Feb 2024 00:41:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWAqdCcHyQcWt8vvzEoffySZ6yJH3Lr1cgLPpEFkCZo7AA50MSHHvBLXjml76UBdsAwtcsz8MZ44TC3Z670P+HueNHtoFI4O5I8eRgQqFWAh53lHtohU1yz9uQmCdbbBqTY3HcQm6yJeCgrP1EI0S0LVc7u55iTIZONqU8Z8BwO5vcSF+GLI4Xs9WXsynqGq6BoOfMo2FaF48kNejkzz43DqSso7rUIVabixSi5nQK+YljHsTaEyrGLsSqoHeMBKtzVSnrpFlPj9spNeQ3kLA+SAWMCHZcnUqBeZlVVC0F8xXQ+Ez4YSKwIY5galpiKeJc1dMlPtiWJtYYea9Mxf0WOgwxn1d1eEl6VW9SkNkEtsWdMGjCjZhyl8b92rlKL+SMrYrijTj2yZMZM3Q==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b00a361c1375absm631642ejc.133.2024.02.02.00.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:41:54 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v6 03/15] net: ravb: Make reset controller support mandatory
Date: Fri,  2 Feb 2024 10:41:24 +0200
Message-Id: <20240202084136.3426492-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the RZ/G3S SoC the reset controller is mandatory for the IP to work.
The device tree binding documentation for the ravb driver specifies that
the resets are mandatory. Based on this, make the resets mandatory also in
driver for all ravb devices.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v6:
- re-arranged the tags as my b4 am/shazam placed the Rb tags
  before author's Sob tag

Change in v5:
- none

Changes in v4:
- select RESET_CONTROLLER
- dropped Geert Rb as I changed the patch again according to his
  indication
  
Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/Kconfig     | 1 +
 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index d6136fe5c206..b03fae7a0f72 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -34,6 +34,7 @@ config RAVB
 	select MII
 	select MDIO_BITBANG
 	select PHYLIB
+	select RESET_CONTROLLER
 	help
 	  Renesas Ethernet AVB device driver.
 
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 3181fa73aa32..fd431f1a0b98 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2645,7 +2645,7 @@ static int ravb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 				     "failed to get cpg reset\n");
-- 
2.39.2


