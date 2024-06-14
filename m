Return-Path: <linux-renesas-soc+bounces-6195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF3908492
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A786B2437A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 07:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD4914A62F;
	Fri, 14 Jun 2024 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ha4MDP2v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1A18756D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349619; cv=none; b=uhgjTWf4ao1fpXtTl0E605OPzxSET6i29T8W88zLR+4G1QbTbrEYj3Wxy++C0xed3cxR8xFDyjwhcJ84qg5+3GcMm3CPwTH1cnmrpiOSIRKinSCCwrnEcYrYRrZZwOoFa4yx53gVdV11w7vRgQSs1kJBY0yTf1KtOyoo5VWlffM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349619; c=relaxed/simple;
	bh=IpLUG766k09WvJhc+aQ2V6g2kms7np+GuxaR8CPa+T4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWVI1/kRbui3oGszVSR9BO7r6VFdwpXQ8qdR9KRtcUn6veHn6R/twlUXi1vk9ZD3J91wPn7PCibC6GPSu3Y4jI2rDfEXeihh/VBRiL1cJU5XxCQKKc21hH9KcvptmUgTE75CRnxXB34oG6hpwN1y+oM6ALq6Ljfhv8pPBQmYmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ha4MDP2v; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso1987319e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349616; x=1718954416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLVszOBXKdCsK5qaPuAoiXu9R/5md9OnkOvi6MZ6Vqw=;
        b=Ha4MDP2vI4Mq+10X40LO7bC8rY/fmhrlqss89nOVRzxWXVx2quhGE7vAY5nb+gm67U
         PS1h5jSaVbD0/I0d7LCEU4S/Xubj71OmH0utFEdOmnPYBqfDOQthsCyrPFYLxY/nXI5r
         PpBf2uIhAEQWCkGJH2oVNYnjj0kvQWm6j22OQ0TcuQUgMvQdoOQDWv6enQTNDcYC5cKF
         HOpT0qp27rz8cuhUQRRvGqyMgvkiaL4k7No0atObYAeSvTaMSRYspq5tjmY4nag0xavL
         97TTUAeO929Gsl+Y4ZmLm0kRDTGsj71fuD2m/zYjQeQ8ytSAp+ODSz16h0fz5GPrutZZ
         uNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349616; x=1718954416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLVszOBXKdCsK5qaPuAoiXu9R/5md9OnkOvi6MZ6Vqw=;
        b=C6wGugsvWooabLnG3cxl/EKH03ENuFbeRA74D1hn2cM7mf4OQDl7pyaugYskHyfCwQ
         0syC4PGeikUFl14frHuWJG3gd+ZSKQtj5c7Uag8ZkXw0pf8tSzrBuqsyeqQrhmEcoRhZ
         FrL0vgsn9a5FeoSQ5PfiMOgeKFy0/N+G76GTW6KnIAPWaFa7N5THJ3AqabV6KawKNFFj
         wsTBCNW05W70Y5KyN0ff/xYhSEFuTwYzex+efdiiyoscL7+Rj1gQddHpSFNMAg2ps3vf
         9TMAfVP/BB2U9iuGhPa8uGV+cDLnQxb17iZlkLUr/Edha0NtLPsGB1xtUrPfX5hA8xoz
         i/dg==
X-Gm-Message-State: AOJu0YyNvdBh4YZX64y4lhCLJew5kvZMC688b7gtCvTqUdEK9biGv1N8
	LYLC4OIZur+u6u5EbPyFWQUcQq7cK3Jv9ecKUbj3piEjle6Cp5bCGs6cpDmXKCk=
X-Google-Smtp-Source: AGHT+IElxpc841rHD2Xiu2oaf6mrTuypBvT7Rrfq0KAuW6+UruOfjHi/qGNE1rhY2ZoG24NezULOsQ==
X-Received: by 2002:ac2:4181:0:b0:516:d219:3779 with SMTP id 2adb3069b0e04-52ca6e99397mr1027545e87.58.1718349616181;
        Fri, 14 Jun 2024 00:20:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:15 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/12] arm64: defconfig: Enable Renesas RTCA-3 flag
Date: Fri, 14 Jun 2024 10:19:32 +0300
Message-Id: <20240614071932.1014067-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable Renesas RTCA-3 flag for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fcb0c7ee8769..86e74da7a9c9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1202,6 +1202,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
-- 
2.39.2


