Return-Path: <linux-renesas-soc+bounces-10775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28249E0400
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 14:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A103167638
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 13:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE90D2040A7;
	Mon,  2 Dec 2024 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="F8/07/rg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DBB203707
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733147373; cv=none; b=Z5Fdy756e/v83M/sCQvu6Q0IewWzgOLa/zwhyP+AvgD9YWEnmpVLluvjVYiUAChnCw4Ihn9HBPAecIu7mNgvIWW/LXy1jH+fMRNMULlxpcuBYOvZtZlm2E2/SaXmXRJK+OpanQUCVlbFEAYWVUq602V5qv825jFKIknDK5ctrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733147373; c=relaxed/simple;
	bh=CiFizkoZC96MbaXexVr7inWPwfe5IbT1lj8DVa6YGI4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XJXqMG/RLyuRGZHkHmjjLGovqcsMFirDkC6bHxuzZqh/AMIF2AXD11pes4S7LugDgsV8ZHAAioaTWWw/q4kz7h2ORaa9DVxGolOyOYHnSQcmMev3w7mwh2DSnQLB2/JEhDF16WiaKihrp8Y/6WOY9uZKFeYqE4ojUcT7EfQ28zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=F8/07/rg; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffbea0acc2so45146151fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 05:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733147370; x=1733752170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CpslHNkV2YabLsAqY6bUT0+pw/mS+82i2gGXOOdRhQ=;
        b=F8/07/rgvh5Yl/27rrroF8u/2iOYFCZMyru4a3SKjcp1W1fxnVUvuXZv8nlmFawmKc
         3PV45IGE9CLf7FNXbmJkE5RU1gapus+p6u118pS2ff9cCx+wH213UUP6Ffjy+k/AVAFh
         nY6aX+Ite08eSMNj2quAobcza8eVZcOAP+tEduBb/2KBZnwNQq5RIsCQC9kwEbneo2Gy
         lyBIvFExwk+h6rGqrLWxTEDwnlaSMfB/vy/GQGG4QMgNe/1h3EnGnaTbmyrckHoyfbFx
         XCQUij99dAUkujTg9O8M2Ku0pK5CytyOy8TAc9NkIxYKm4s6lzdclyfCRdkfctGBDksH
         dglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733147370; x=1733752170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CpslHNkV2YabLsAqY6bUT0+pw/mS+82i2gGXOOdRhQ=;
        b=AGYX0itZiVUmBUJ1waLJjJcoKTAXuV3e/sO7uMScBttceUAtczoFWsAKwheeTEjIQ2
         XLbdKkC40XWKTf/MF+3NhtVJWZ3FCC/2JEwu5TiwliuWymhOoKNcWd/rjxT01/QVsEE2
         /rYgQNegtAd0Ddc9ZFi+wNCpvVnCSz9BCsGaJtNCrtpR5NzRxhmKs93CE9nOS2QQpKid
         JGAlJZoByN9PtP7cmEvbVvv1K2fxBc8g2PH5cxp9vKRdgCkXywZ99tToFGk9PoQ8JhNr
         aARKv6k78cruOZ0+uGoUJEDvmMC55A2GItokR+tlM+nzeN/GOEOS13oxMkLFlQcnYs70
         9xKw==
X-Forwarded-Encrypted: i=1; AJvYcCURi9Oz69yw2GQthvfRuJsbCkTUm0x+oIG7sQ/G8zbt4RinYwB5zS3Lab9AvZ3KTpju/szzfiTRS0zAc7gkz+kY1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrIaKUX4crsZbm0EzZqmAMAMZQ35K915tEBEfKxOX0eZs5pS9
	87CgSsjbTMN5i2r4Fan64CjSj5sw35Iu3GlN8PbnKJcJSDlhJ5zHG3QdROh5VB4=
X-Gm-Gg: ASbGncvIJOKMcqThoGDlOB3r3EZc4Y7oWZ1bvmZFYVSSZDibYiFCzP5s5Xm+we6jYaI
	UzUsXSomwbVGsxkGAnDBlAS7sSjD7EJkmow/lUwSb3Np2LTMEfzEjgRuB/N6FjiS9p8r/cl5LSH
	0D/lg7nQp1zvFQYJ6Xs3rIIk6uduC/YmXwOUbSUZ9s+pUgygHVpNGVQWgOmMIKuicu5D1wB6NCg
	eAXDk8p6KX0+l9mqpf8l0VzWZEVVdHqGduhsLemKU/TZDeRr0+qcsfavgLoZmyk
X-Google-Smtp-Source: AGHT+IGOSgW0kQ/hZQdxpAEuxf3UJ+J6ThcTY+XhOdDP1TnARSGU6yBkX5H1G3ekAl2LQYW/fupQTQ==
X-Received: by 2002:a05:651c:2225:b0:2fb:45cf:5eef with SMTP id 38308e7fff4ca-2ffd6120fa0mr125832051fa.30.1733147370261;
        Mon, 02 Dec 2024 05:49:30 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb8f2csm12972661fa.15.2024.12.02.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:49:30 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH 3/5] net: renesas: rswitch: avoid use-after-put for a device tree node
Date: Mon,  2 Dec 2024 18:49:02 +0500
Message-Id: <20241202134904.3882317-4-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device tree node saved in the rswitch_device structure is used at
several driver locations. So passing this node to of_node_put() after
the first use is wrong.

Move of_node_put() for this node to exit paths.

Fixes: b46f1e579329 ("net: renesas: rswitch: Simplify struct phy * handling")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 3ad5858d3cdd..779c05b8e05f 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1891,7 +1891,6 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	rdev->np_port = rswitch_get_port_node(rdev);
 	rdev->disabled = !rdev->np_port;
 	err = of_get_ethdev_address(rdev->np_port, ndev);
-	of_node_put(rdev->np_port);
 	if (err) {
 		if (is_valid_ether_addr(rdev->etha->mac_addr))
 			eth_hw_addr_set(ndev, rdev->etha->mac_addr);
@@ -1921,6 +1920,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 
 out_rxdmac:
 out_get_params:
+	of_node_put(rdev->np_port);
 	netif_napi_del(&rdev->napi);
 	free_netdev(ndev);
 
@@ -1934,6 +1934,7 @@ static void rswitch_device_free(struct rswitch_private *priv, unsigned int index
 
 	rswitch_txdmac_free(ndev);
 	rswitch_rxdmac_free(ndev);
+	of_node_put(rdev->np_port);
 	netif_napi_del(&rdev->napi);
 	free_netdev(ndev);
 }
-- 
2.39.5


