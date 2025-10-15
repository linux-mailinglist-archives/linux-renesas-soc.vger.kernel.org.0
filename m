Return-Path: <linux-renesas-soc+bounces-23081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A27BDF3F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8D119C626F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C9F2E9ECE;
	Wed, 15 Oct 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QO/Xyg0w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4102E6CA3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540453; cv=none; b=KAl/6CvsDQ9NBHH9cop+zj2Ei5OizWhJvuq5391QaL6+q72MO2Yj4DQDPJvfqWU3hXd9LR3uzSw/XDy+Rs+eB0I9oshoPngAOM/vi+EKhcCpfafHqGar/jJs+FtnJDCFlNEzEIZUsWYyV2LCiwQWE68+kLUucFllGQieDiSQGYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540453; c=relaxed/simple;
	bh=RwSzv+8gQB1+H127TYDuoUR0wJ+1TmPyBKKgVRzUJEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PophhWLG+VipxYZ7DgsiOl29qXlfsiiw2maN6dGV0pGvAtF+yUL65QMaLIiwfukSh7l9MQva/HPjE7OfRPXlkBq5Zq5XoM1GM8rJJeDfJtYR/+2mo7foK3Lf8uO7lFL+x30lA39/khUgg9H2jkPOYsx70P2L2Qj8L7mkPrHbTtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QO/Xyg0w; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b63148d25c3so770877a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540451; x=1761145251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm72wEzVMr9IsZ30OMPLzaYiRU5ZuIof9e+ZCzfB2E0=;
        b=QO/Xyg0w4qeP5j4izl1rOx+O+69bickpQlD22a2hPrnBnbJ5ooWh71q7FCvmyoiXcZ
         KyxmElcCQMqyga8p/IS75BR3BVDkxaLeHqYfyB1PBOropWz+V4YZoeT3p0EkRdsGmQoe
         IqsmlKZAeHppZt4LJ4qab4AG5K4yTPRTSv9GjR1fZdbVSaobVbGwA0LRGaD9GnM9LbIS
         TW9W1MBRHH3QLmKZfrfohf+2rWYX2AEUnsMyJpSaj5nZb1Ku7sTYcpCv3E2mqPfacRPX
         CVKJGGagmhL4qCkBvVmqdgqXAreaX60RqGl4U4kMxdjEomeaYe7fiRsxDx1dBJFaiHFE
         NUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540451; x=1761145251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rm72wEzVMr9IsZ30OMPLzaYiRU5ZuIof9e+ZCzfB2E0=;
        b=QqWBYgVC+D3ay2U2JNccr/76UBD1jSq8Zpu9lVyYUNd0oNlUCv5oTK9GAg/b0Sou0V
         tnWPtOw4kBAjip2JIFbPPuVJMfRamKrT+cR8jHEky3+H5lHOtj2q2SU0xd4/3BypCfRx
         MgZ7UV9qOPKp/rS8qRpAyZ8YMYgJGRBbLiJXEfV7yaH36HgH/EU4cpSUf39HdLVfcWXr
         Fd9G0TwekEMnG2V1XPYDmqQWggxsV+R0Ygw0mjYoCke23bkjIbQ3JgM/JBdNi7l3bANz
         n29Dwak5eiNXn6FiC8DTMg97YNrE7jm3Su9TfV26oPQ7fdn2xjgKubaI6UlSlECv6F2J
         ml4A==
X-Forwarded-Encrypted: i=1; AJvYcCXIDgwndO7KfXbhlB32qhDh23/Rd63tmNKcxTeXEShdoWguZ88q6lbhrmlJKX5HrJMViWKxhiIJibFXliiWAaswjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZuDBsC2i+P0qgOuaexwnJBr4MKbpA6GEN83VwBQRgxPCEdh6n
	/pvwIdOeLa4DNsq8Qkq/Sq79CpAuD5wd/cJ2KvetBFvRCsBayq3qS1NvsRI5/g==
X-Gm-Gg: ASbGnctuA735tMPC6TqNGsxEonDvFIXq2Al44Iv5z46dQMT6fad6jwNZhV7lJ+rj+5E
	yx7f2F4hjcb51AcIllophZkvixF62Jbx4XgWt1ZARvDYPpJjAd57BmYVmrcUazSwO6ueUvnvvfD
	3Mhq+MdZQVTqJcTq4PHTMamcQlNQVHOHEai5ufN2PJqwRmUWq2z6DVz6oNYMs1Rs3NuVUySxf31
	ZFF64xrCKM/HcD/Heiw3U0DnG+Ld73uI6spw3JILNXl75DaCh0cjuCKoC2DrI1D8CajnELeH8uT
	1QSEZ4rXVTq48/Zl8sCLUOLSaDxM/UZTnoGJP9/zqWu1f9l+0GJdq4HxDvifqL2hLK0TpysZvcO
	Cp6sRzJMLe7H8qoNaqzU6eCDpOIIbch/Khe81WzmUPuOZxlzpR4BSEEfL/4WeANDsG26Y6HsORA
	==
X-Google-Smtp-Source: AGHT+IHL1rGxPYL4gon+pNH5suaietGYpXTK0qY/tw1k5qOqO1eGaSYosHoMCad+WaJfRavoeJ3/NA==
X-Received: by 2002:a17:902:d4c2:b0:274:506d:7fcc with SMTP id d9443c01a7336-290918cbc9bmr5514205ad.6.1760540450611;
        Wed, 15 Oct 2025 08:00:50 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36408sm199642265ad.91.2025.10.15.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:00:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] net: ravb: Allocate correct number of queues based on SoC support
Date: Wed, 15 Oct 2025 16:00:25 +0100
Message-ID: <20251015150026.117587-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On SoCs that only support the best-effort queue and not the network
control queue, calling alloc_etherdev_mqs() with fixed values for
TX/RX queues is not appropriate. Use the nc_queues flag from the
per-SoC match data to determine whether the network control queue
is available, and fall back to a single TX/RX queue when it is not.
This ensures correct queue allocation across all supported SoCs.

Fixes: a92f4f0662bf ("ravb: Add nc_queue to struct ravb_hw_info")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 69d382e8757d..a200e205825a 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2926,13 +2926,14 @@ static int ravb_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 				     "failed to get cpg reset\n");
 
+	info = of_device_get_match_data(&pdev->dev);
+
 	ndev = alloc_etherdev_mqs(sizeof(struct ravb_private),
-				  NUM_TX_QUEUE, NUM_RX_QUEUE);
+				  info->nc_queues ? NUM_TX_QUEUE : 1,
+				  info->nc_queues ? NUM_RX_QUEUE : 1);
 	if (!ndev)
 		return -ENOMEM;
 
-	info = of_device_get_match_data(&pdev->dev);
-
 	ndev->features = info->net_features;
 	ndev->hw_features = info->net_hw_features;
 	ndev->vlan_features = info->vlan_features;
-- 
2.43.0


