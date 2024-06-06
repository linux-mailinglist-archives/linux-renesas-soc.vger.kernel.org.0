Return-Path: <linux-renesas-soc+bounces-5933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 879808FF572
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 21:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4310B24628
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 19:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFAD4CDEC;
	Thu,  6 Jun 2024 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNuBtyDW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15344AEF6;
	Thu,  6 Jun 2024 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717703301; cv=none; b=DgUPAC23GFGQpYGLrNfPbTiwOXnhlnNuFRyInP5e1DRV3I4M2hr/pEOUU/MAjySW6pMVmz7AtkWrZad5iTNS2exfUztbwB15Ee8E8Fot8XVIfRttMJ/TS1ut/0rRZn6MyEarxPO/WXCvW5Gscbnk9gKBAO1XXcRk8s6tHCGd2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717703301; c=relaxed/simple;
	bh=xPMHflPdbksHj5PGoMkKEru9ufl0KWX8adQp+i3GW0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eR6R347kCTsT4K2q+4SIIpTQxjTFJOyCd8fNROz6FmqVC5ZFHRjY6tZDzdEuejyLSk3XVuuOFRD9zyzyfiNa8ULv4r6sIyk4VAyox7rvly8FT19pTkx/xXEZhbG4tYVNmGqvcoEJWW79aP677vSd8KKhWV0D9kVenHRfW5XzXT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNuBtyDW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b936c958dso1675078e87.0;
        Thu, 06 Jun 2024 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717703298; x=1718308098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mNodoFmAbhZZRCDW0JBnKHX4e0v+tvTBYJa+POEfh54=;
        b=aNuBtyDWnckl8sa3ROneBhSEDPZfTfFoEhI9lqG+jzrpJtPwjyapFRKJhcWkurjWLv
         BPdLB+fPPv/raE9ZDi5O3INKYj3onUqhH6uJKoP2IfmDDiqVEcEx1xVdI3lxssmoO19V
         YqRpjWarG4W/jylNmoLABtsLaPbH5UvNnDS+9N4413kd0z9bVUBGy74F2kcJ0wvsvAPZ
         jhBI6OaOxmk50WIuIFu0WRsn3D/JVtc4OJPGq+EFeDewDcZHiSTc4FfR7OiEesANh/74
         GjvWGElxQ2AO6BvJz/2Xhb1MJx6ZQSaGLHGQatpnMhIbUiVeF/P5ldG+AI+M0fThARR0
         DhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717703298; x=1718308098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNodoFmAbhZZRCDW0JBnKHX4e0v+tvTBYJa+POEfh54=;
        b=e7SqEENqAJfekg88mFKeSNhbVihd4pWKcoRy6T//VMOoPuDol1gZ+DbvfpEnMAxIsc
         ubZdPeKS7H8B32UZE5clxnWOqNOEHNwXrsq7Iq0Es1OtTnBKhrfd5GIOGf93ys/O27Fc
         uMrbgXdEswEnQ7NK2rIEj9mx8d/E9AEHIs/hqX8Mc8cfArZdijpAOC3wk+FbGB2DGm8Z
         9nJzJvveiD9JVvWb5rowpeHBGcPf2Nf5ZJU55OfUs0NxEiO8ySELOTeaPEdrq5EPHj3o
         sWpplvViABhLtI8BvqD/6jKJ6DLddPTzTlOUEIyUTqzxfqpZtk0HaxRvGr4AWil9rUPa
         jb2A==
X-Forwarded-Encrypted: i=1; AJvYcCVpNWCuxISekQq8UpS2PZ8/4Tj/fcuNjmxJfx+T1oYJNnY14SRoGRp40W+v6Ddsg2QUgiySoDUWMu45QVFIZT8XLTimWS10aCirnue39hhyfCs=
X-Gm-Message-State: AOJu0Yz9jsJm3Ge6PScxaoE7Yl0vmT9Y3bMbmZc6S0QjVYQJzEGlbGf0
	kBNLPnpravcmdLz65viSGMkfvPg7lPsQUZABtOl1Tlvtpgmob1zB
X-Google-Smtp-Source: AGHT+IHucfKP2uAyE3xKSwyzZCnbwLmqBsOht+E3ZPWPr1Ql2D6yHovj3IYG2MdH901lYz35BtTJJg==
X-Received: by 2002:a05:6512:34d4:b0:52b:8843:b084 with SMTP id 2adb3069b0e04-52bb9fc95a6mr334590e87.47.1717703297800;
        Thu, 06 Jun 2024 12:48:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42161147811sm17262735e9.18.2024.06.06.12.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 12:48:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] irqchip: renesas-rzg2l: Reorder function calls in rzg2l_irqc_irq_disable()
Date: Thu,  6 Jun 2024 20:48:13 +0100
Message-Id: <20240606194813.676823-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The order of function calls in the disable operation should be the reverse
of that in the enable operation. Thus, reorder the function calls to first
disable the parent IRQ chip before disabling the TINT IRQ.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 861a0e5a3e97..693ff285ca2c 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -271,8 +271,8 @@ static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
 
 static void rzg2l_irqc_irq_disable(struct irq_data *d)
 {
-	rzg2l_tint_irq_endisable(d, false);
 	irq_chip_disable_parent(d);
+	rzg2l_tint_irq_endisable(d, false);
 }
 
 static void rzg2l_irqc_irq_enable(struct irq_data *d)
-- 
2.34.1


