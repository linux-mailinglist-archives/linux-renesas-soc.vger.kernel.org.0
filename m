Return-Path: <linux-renesas-soc+bounces-9782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1EC99F7CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501022854E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420981FE10C;
	Tue, 15 Oct 2024 20:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emz5YJnd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75611FE0E8;
	Tue, 15 Oct 2024 20:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022558; cv=none; b=n45E7bnOxNvHf93w/yRctOehCL3TR59i4BQsWzDKPdrEToglZxu/sMf7gwf53ba/25OAQXNOgR02PgR1SqCYTleDK3c8+5kMWyJ8IAbcYLbxRXJVaionTU30xtw4mb7aTrKYNmUXIDgJPP6/UDhwMjFBl4boX22mfnAe8nw+Rfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022558; c=relaxed/simple;
	bh=MxcjwNRsJEkibeU9qt9Ob1eMqP5pSgwTyK6ABqwj2lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=afSF1QKkVEyg7shI9R+xU2y3vdAwFO/esPI8Uvmfi+vaIUi4L2IkFmK5GYTouttHVCesU0z2I38f/BHQyV5eN7YrAMx5uSJIvtGLWCL1kec81Q/PGY61GUuNIb8gkVA+oRCIJoYreYN9wlhfJJ8njyoLhRu6LTUKbuPUAlQwp90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emz5YJnd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e5ae69880so2355705b3a.2;
        Tue, 15 Oct 2024 13:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022556; x=1729627356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQoU6YjRXNNAK08rrFMt8U2srpp4T9KT027SMoMKFg8=;
        b=emz5YJndoO6GuCdB3eZCSvMYU+TbGtE+D71NMcuJITL5XWfrJXTliUnWXFibx1f3dx
         5LtMng9RzhNyKNsPDEHOgMwHDnxHqQJQ3nrrNzJjmuyJgqOMBQhr9mYXelWi/yURhleR
         U2LPk0neTgVtj/YydQ0zpI4I4uPECnOROmqUdpyHwTzva/kzIk5uOctxU1oxrC0vY3s0
         9XRzvYBiWCTAgbA3M1+ChpymAxhXPAkyBqj/xq6iskZrLmLo2K2ZrHwOZnrkY+7UK06w
         kHf04g0y4uUYP5UMnbsBSs4cywua0d5IbYAgBPBr0ltYkeUtgFz4hrxirsnYcN5XFloi
         CLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022556; x=1729627356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQoU6YjRXNNAK08rrFMt8U2srpp4T9KT027SMoMKFg8=;
        b=uKkB/Y5tuql4AvIHyktpHvvO6V77WArqQfCIv5EZwQJM7YynfkLcQvlYYEDQYtzpQ3
         WprHwN+v4WSkE0YljFnTennYvTuanQfSX/v14Z2bfaM3a9vAhCA1c49jKnrKuPa5Hc15
         C3FUtjRqWsM5wMJdPS1hd0f6olidkDm0EKLDLkgktlr7S3N7oFgEO78L6FPx8GCnAyQJ
         rK1NikT+l0nHnDdve8mqnea2p/IcdWUrLlVQdo0w6ZYt9OqQOye4rSE9tXo84eDfgdBh
         TogZ3b0+6zBTeL0dyKBo+Qk0tkqprrHcGsWkQaipM4068ZIDA6l6+me3DGXTUCvj/eQJ
         rydA==
X-Forwarded-Encrypted: i=1; AJvYcCVi7vlq9GTQhAXNT+1bHQmdC//SdhBbDNsje3l3VkqQ3zk+DZwYp2/l1kbx/N8elswGMzMQRDfuPs5bbB/Quv6bhxQ=@vger.kernel.org, AJvYcCWryy4GQ6njJnzYPcaZ6cOu7Ux8cSUGuYrO+DNfNeu5O0tlK89jklRNi0afKOCK2Aa6vd5FNERWdxE+Sik=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywohu4Qf1bBimBbzgiabI67GKPgUy4LMwANYoU5IAO2i2SsA+RM
	2lWj/xicoJhcadEiDoi+9oYY23Qfh4iVAgACWVrVsrV0jxXDbyIBPp4KG73E
X-Google-Smtp-Source: AGHT+IEywEDsjqBaxDmLL/0uOwFhMks8HPSdKV76o0jiRzfmJgSM44EjZk2oiS/fIAzSoL7OLmtQSA==
X-Received: by 2002:a05:6a00:4f8e:b0:71e:634e:fe0d with SMTP id d2e1a72fcca58-71e634eff2dmr12688917b3a.12.1729022555712;
        Tue, 15 Oct 2024 13:02:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:35 -0700 (PDT)
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
Subject: [PATCHv7 net-next 4/6] net: ibm: emac: use platform_get_irq
Date: Tue, 15 Oct 2024 13:02:19 -0700
Message-ID: <20241015200222.12452-6-rosenp@gmail.com>
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

No need for irq_of_parse_and_map since we have platform_device.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ibm/emac/core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 438b08e8e956..f8478f0026af 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -3031,15 +3031,8 @@ static int emac_probe(struct platform_device *ofdev)
 	if (err)
 		goto err_gone;
 
-	/* Get interrupts. EMAC irq is mandatory */
-	dev->emac_irq = irq_of_parse_and_map(np, 0);
-	if (!dev->emac_irq) {
-		printk(KERN_ERR "%pOF: Can't map main interrupt\n", np);
-		err = -ENODEV;
-		goto err_gone;
-	}
-
 	/* Setup error IRQ handler */
+	dev->emac_irq = platform_get_irq(ofdev, 0);
 	err = devm_request_irq(&ofdev->dev, dev->emac_irq, emac_irq, 0, "EMAC",
 			       dev);
 	if (err) {
-- 
2.47.0


