Return-Path: <linux-renesas-soc+bounces-11063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AC9E8615
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 16:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EECF1650F0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 15:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3418E17277F;
	Sun,  8 Dec 2024 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="x0Wk2VkA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F991581E0
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Dec 2024 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733673173; cv=none; b=AxjYspFjKb4KfdKZ4QZ+onujSezqfx2qwyodHeao0PvFspRRluLulTNuyr0+PYDrGlnfEEBGlDFwZeChwYJqk1Q2FXMC4YiP5Ccde/enqiyEwrAJTfA5W00+l5wg/Z+sgxEK8DnjmkwQ37RNFFdYXAJVxC9b306KvrRfYjvmVSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733673173; c=relaxed/simple;
	bh=HyyWUkVImKTbnfUbDT8H94jFhoM3eDYkpcrXi4gTshE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z5FqyDjrcFYTC1D1pVC07scsGvlz45JkRdLLrdhYFWPqxV2o/4siJoZCR5dE6h5SXvfpBnY1ShIbfaxG1H4d8KxYTYQ3f2K/xy1pFUbfGakEqHH3FshE4LR6wKZsa8z+v3aERHakZYD45Q9NDwvopZBzZPIijstCK4xxRirybKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=x0Wk2VkA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30219437e63so5976821fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Dec 2024 07:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733673169; x=1734277969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJl98tLA1KqA94ObFzxMBXTp9IXq9js5q87hBKbnvrg=;
        b=x0Wk2VkAF0goOOK9oA5ZQyOFU7541kKbRDUhCxBiBiP13EQpMeUSKSrSqThZcm7wFG
         BWCNbrThqdrJDPbgzoBc9XjN9x7/eh2pNT/HErJPJNx6yoLK5EnADw/7DozfAyWyNPvE
         h8/3n5yfZ2TYGY2rVOnVDzttFCE8SYVwib1Kirq+v2558bEIRb0SEc43PKJNSjvLi8AJ
         tG8SCmRhCdSw0YgX9/0wII4vH9fCU6CAoHNQo3qvAby1iZiV+RMvFbhdq8FPnNicYaDw
         DsGrcwjOxml7PyNKBnJlLCxLf2FbuttzNP+gEB5Ix2zZUGdwaJeOwDHzDBss6BwuUDHT
         i7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733673169; x=1734277969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJl98tLA1KqA94ObFzxMBXTp9IXq9js5q87hBKbnvrg=;
        b=RxPUfooHJd2z1jJyIzH5KupaNUlpqpZ+V0TAEHeEiCtJj34XkM8aNf1JhBBLwSUt0U
         RjWVoxTkLFmHeqRPNLRwAaltiwWEjwbiQaQ2ukugPiNcyh0/6WtMN0y48xL0XRc0EhHL
         V7muPSj0SteNoPmk0cbrogbx/RSku4rYXSdFPlYGatrntLRPDiI9pVK8EabjSVfWs/fW
         Tb0NdNUY+0GS8/1x9bq7iaecG/LuPl1ttweWRTVYZP5tx72zw3gmFLhupsnN/kn0Zx1/
         P1OLw1daDuI+nlYg30vG9u4vaRtQQwUH9gi3BCEBwUv8bDgWRiSfiuS2gfO2hugExEF/
         dMSw==
X-Forwarded-Encrypted: i=1; AJvYcCUUdCaopuJfxtYZTU1ClpD1I9f0cm6hCHycBJtnjYJooCndnatl1AOuPuas/G/9JGDMkVbd4UrD1vrxfdKeczSFrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Ztvx2nBFFLM131t3RYHULJGsQ65XCunIgiS4UqHwoY+AzeNw
	6/CxsozVcOlN2uifQG4f1bBw6CNPOn2QOdm67XXKhpHIGsfLHrubr1gvMpBNPHY=
X-Gm-Gg: ASbGnctd3jGqc0dl0pf6zQsPF0FPab7r8L9Med4MLVeTajvEp3vuuLzrq3yODl9VAWz
	izUY5uk78mchzDG6Y8pi5DPTq6fSnZ8kJ0xZeD0o7VnkKw7TGTWSgARInrb+5vkPo/QX0/sanqf
	fYKs9E6JVWhE/H8zGNUX0wa+OQe3TlSlKH5xpHLfFhEPROxn36aHu/ButOoZdcnMjzo+cccVW0/
	xgblHgrbks7kXXmtSVJRzdoeqowG7daHyHteZB4gUKW9naHNRQDM9qu875rMkOG
X-Google-Smtp-Source: AGHT+IH3PSTZTHavCvoa1I3kEsvmuL+iD0caZGd6QozHV+KkfcwNGoYPhdqy84lNEnLmvIZv5Ekjcg==
X-Received: by 2002:a05:6512:6d2:b0:53e:16eb:d845 with SMTP id 2adb3069b0e04-53e2b7328d9mr3358489e87.18.1733673169476;
        Sun, 08 Dec 2024 07:52:49 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3a1ce70bsm580882e87.66.2024.12.08.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:52:49 -0800 (PST)
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
Subject: [PATCH net-next 4/4] net: renesas: rswitch: add mdio C22 support
Date: Sun,  8 Dec 2024 20:52:36 +0500
Message-Id: <20241208155236.108582-5-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
References: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic MPSM operation added by the previous patch can be used both
for C45 and C22.

Add handlers for C22 operations.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 8dc5ddfee01d..444e7576b31c 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1225,6 +1225,23 @@ static int rswitch_etha_mii_write_c45(struct mii_bus *bus, int addr, int devad,
 				    MPSM_POP_WRITE, val);
 }
 
+static int rswitch_etha_mii_read_c22(struct mii_bus *bus, int phyad, int regad)
+{
+	struct rswitch_etha *etha = bus->priv;
+
+	return rswitch_etha_mpsm_op(etha, true, MPSM_MMF_C22, phyad, regad,
+				    MPSM_POP_READ_C22, 0);
+}
+
+static int rswitch_etha_mii_write_c22(struct mii_bus *bus, int phyad,
+				      int regad, u16 val)
+{
+	struct rswitch_etha *etha = bus->priv;
+
+	return rswitch_etha_mpsm_op(etha, false, MPSM_MMF_C22, phyad, regad,
+				    MPSM_POP_WRITE, val);
+}
+
 /* Call of_node_put(port) after done */
 static struct device_node *rswitch_get_port_node(struct rswitch_device *rdev)
 {
@@ -1307,6 +1324,8 @@ static int rswitch_mii_register(struct rswitch_device *rdev)
 	mii_bus->priv = rdev->etha;
 	mii_bus->read_c45 = rswitch_etha_mii_read_c45;
 	mii_bus->write_c45 = rswitch_etha_mii_write_c45;
+	mii_bus->read = rswitch_etha_mii_read_c22;
+	mii_bus->write = rswitch_etha_mii_write_c22;
 	mii_bus->parent = &rdev->priv->pdev->dev;
 
 	mdio_np = of_get_child_by_name(rdev->np_port, "mdio");
-- 
2.39.5


