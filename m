Return-Path: <linux-renesas-soc+bounces-3738-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8230587A504
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 10:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1632C1F2284E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E62208A2;
	Wed, 13 Mar 2024 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RETG+2Ov"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BFD20309
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710322258; cv=none; b=ejxEftuXeCbygr5MEfMAF7Nv+psRYbMoHRGA4DvKvMAZOzZ4tegxUhDe4JlD/U4t6E+2QPu2PsPaD3mhtNBk+BPrnSzf9P2MHNxna1/lcn9CVe5PgIH83QxcaXmO+Qw9WCDFFhXBw8w+d57b9dXoIP1tKzFqVtr06UP64RMZRXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710322258; c=relaxed/simple;
	bh=YF7fTtdvfzFITVVZ7CSzpov04FdfNLIQqExickCxZeY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=faCk7yb8L4ly9AdZ/iJ4LTFm67H9ZP2KEEwl22mtFH5YaAshXMOSqW0PMnH3q+z0lusRmUTzdcU2ka4CH3tNO4wQFS9oWr1EGkg4vkR++3CC2bFVD2U3HwfwxDJc8VRYNuWb6bco8IxMTLNFmmEZlz8MmXnklTjJS+K2ZHA9UmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RETG+2Ov; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33e162b1b71so6115987f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710322253; x=1710927053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iaQ6hYyfIjuTV/f0JHvHCFbfoBb3uN3YSYBT/944sI=;
        b=RETG+2Ovv1zAj9PIIkkOw5sRzu14cdI8VB2AIPUtjnjlay1wYb+w2gB5GYSr3ujWPl
         XXt4nmVXrgjwTtqsPi56MmocNydKDqQOmpeP4ldMLiT7dJz+tn6bDxyYEZrRdg63DApX
         IBOqpbv2eu2lkFwiPWIesFtM7P5qJ6RnSJ5g4tt++/UhQY5JufHzhEmRz/o/82hjsUXd
         tpC9Pm/0JdT5xnIORBITPwrkx4aLuZkffAuCFYkDHghtge0R04AbSL9+IR0VTChRJT7/
         dQZ5KsgMQpzbFbqxNsizT0NoNpWAdwzJxYpKHVMMzn+dC6/9iTmd44//QWse+zCIb/zj
         2fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710322253; x=1710927053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iaQ6hYyfIjuTV/f0JHvHCFbfoBb3uN3YSYBT/944sI=;
        b=Iy3aCNziTVDz2tcXEQW+6B4uakz/qIVVewFiZy6xK41YSq89WreIKXYitgFX8Vjyp6
         eHCt1M2UE3UNHZ88lVUB2mwbMg/znUcEcohScykFHXcZ/qauO/AMndj+q/4t7CP10iM2
         UDh9qnRzoOMRV4AX5w6rktg62oJIf4BkZyUP7abyQkb7DTeX2NJsH577tBteJha/kvMV
         T67nB6K3cNV3e/PRR/N6ZuNwfoWMc/1HEZXg3EyQ478Z5ogUUKEE6uHVVpE0eqpJwS8A
         CLXS9QoJYB/1mxutySyzUBP6xB1KPiUYWYAWlfQjFUzzqZ6+GSpUdLoNwK5vJu6joVMx
         +MGA==
X-Forwarded-Encrypted: i=1; AJvYcCW8gXTSlwqQBrqdQXxB/KZ9drM6qzV35hFRbkq04pUdjSwlLgfNmJxWsJ9K0gJ5CMNFY5wpAaG2JDGhUsAaEXCYmIb5nZBotKKyr+8DwfSy2lc=
X-Gm-Message-State: AOJu0Yy2sQX2HL/C1IotS8bWCMb1WQadfTrNigdiKebbepTOGimfPqGC
	Rx5ns7TCunJGNKAislpfhDIpxMZ6M7ZuolgiT3WEZ9O+f+o8n5ySnrcs0PPn9qA=
X-Google-Smtp-Source: AGHT+IHOxW2fc6sifUNboDvsgW2TAK2bJxYdUATmykFu8/IURNo6dLiw5NA23jNocx0yffVbPmsmHw==
X-Received: by 2002:a5d:6189:0:b0:33d:269e:132a with SMTP id j9-20020a5d6189000000b0033d269e132amr1388116wru.15.1710322252904;
        Wed, 13 Mar 2024 02:30:52 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id q18-20020adf9dd2000000b0033e90e98886sm8630674wre.71.2024.03.13.02.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 02:30:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH] mmc: renesas_sdhi: Set the SDBUF after reset
Date: Wed, 13 Mar 2024 11:30:31 +0200
Message-Id: <20240313093031.3507979-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

For development purpose, renesas_sdhi_probe() could be called w/
dma_ops = NULL to force the usage of PIO mode. In this case the
renesas_sdhi_enable_dma() will not be called before transferring data.

If renesas_sdhi_enable_dma() is not called, renesas_sdhi_clk_enable()
call from renesas_sdhi_probe() will configure SDBUF by calling the
renesas_sdhi_sdbuf_width() function, but then SDBUF will be reseted in
tmio_mmc_host_probe() when calling tmio_mmc_reset() though host->reset().
If SDBUF is zero the data transfer will not work in PIO mode for RZ/G3S.

To fix this call again the renesas_sdhi_sdbuf_width(host, 16); in
renesas_sdhi_reset(). The call of renesas_sdhi_sdbuf_width() was not
removed from renesas_sdhi_clk_enable() as the host->reset() is optional.

Co-developed-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index c675dec587ef..b51e04fa5445 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -589,6 +589,12 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
 			priv->needs_adjust_hs400 = false;
 			renesas_sdhi_set_clock(host, host->clk_cache);
+
+			/*
+			 * In case the controller works in PIO mode the SDBUF needs to be set as its
+			 * reset value is zero.
+			 */
+			renesas_sdhi_sdbuf_width(host, 16);
 		} else if (priv->scc_ctl) {
 			renesas_sdhi_scc_reset(host, priv);
 		}
-- 
2.39.2


