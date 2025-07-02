Return-Path: <linux-renesas-soc+bounces-19011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D2AF0D6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 10:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE71E1685AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 08:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B22722A1E1;
	Wed,  2 Jul 2025 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEd7A31B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D7722A1E6;
	Wed,  2 Jul 2025 08:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443383; cv=none; b=RkfHWhX9zEpIFW6LjRpe2LHdXWzFNUn4Z7Pkmv7SU1bgC7z/9B7kme1OqMQl5OqD43H2wKRjxOjmnVVtPxNkZiN0hYXepaKvDn4j5GPUeSEkPsyPTrlF2m/TumA8Hxm+wzFJNfg96gSw9WgHmD2EHGB+Hegvb0r98e6vuXnEg3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443383; c=relaxed/simple;
	bh=ffWQ6O38v/x/gxv3LUGu99DY+WZqho8Of4jNbG4Mh9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZDD0nxKsGmcKrT4kvCQFGaHepoImUuHSVjxyCNtv/O/fLmKenIVNaEJXIxRspSeXJtQjrmxJ52cIjsQBc3YXJ+V0XUMhcmHwa6JvZk9Xubp9xTzzv+LUmDOmZoHtQjeByYtRlMDa/XtclZgLKe+CMQ0V+0hch9cScG5CG0egZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEd7A31B; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso7329975e9.3;
        Wed, 02 Jul 2025 01:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751443380; x=1752048180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgFaDugDrTNr1qllBEB2czmYTDrkllakFBrtkgwbdUg=;
        b=EEd7A31BpIrgCCF2Jfiy40LytUrA2uhyFFJ0ZPuLthBK9sAbLGCw/svcDfGiMs4zCw
         OfXYNJydvqgmim98Is6rnTT6cavFTh5+e42v7GHAjBx4Epoe37GQVsYcbPM3I4P8ubXp
         mSkgfvKZRUAsrGIBMwMjNth5yyngOzqzsTymWkQwnr2gns8b7EzRp6zll19sE85Xn+Pz
         eiGWNd3u/5S+7xGx1bzE99wes8vzBjkd475SfC3UrRAELqP9z/9ECxC2t8/Fe+jDKSwt
         w/3XTKrWK9N3KFfD9Ha4Db2lB8vAuJfSn4lo79Af76SbWoLmuUiDz0OIAQKO29D6V/Nb
         /pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751443380; x=1752048180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgFaDugDrTNr1qllBEB2czmYTDrkllakFBrtkgwbdUg=;
        b=rfYPXESQQhNhKxvLS1WxXPGU1vfw7rTzqQKJoYIVPxmJdr1X798jNZYhPdukFlU32C
         mupAIFMBO5EHzfa92ew07F/BT8TqCG+d4YT9oVfeZ0BBMRWuZNy09/479UW65gu/H4Rh
         0FSVhEahNSzQ/PGrjfujg7THTLELqxtVQHm5+8IcSstRhhx6eq1+1VXa7/FgatLQz2aS
         4AK6jQume8qA8bH90qQXq8tuK3YxBGGaghzAs6EwmaKfmx/X8s1rm0YOnFD7b2n1ZFYd
         5sm7e/PMwGsUMdEiqJdLI5P/jWciFboxGz3TSzPYZAnsW1NzfukortI1VG+LnpLrQhF3
         IbQw==
X-Forwarded-Encrypted: i=1; AJvYcCW1DJ7NwjN/SOLMzUB6OUbtV/hDmBZ9YrHQtylj+GF67Ec/BGw9RknVP+WPjMzUbCMRVPDg5/+P44+fmlBynjWAUDE=@vger.kernel.org, AJvYcCWVp1N03tMiSq+zcVVWCfxVCdiultb7ppmxiVIzRpvkRjyMkimaWoV62cfBdfLMyFL3PqcRk+8k@vger.kernel.org, AJvYcCWc6ZYl3JXnRzncxOoI/nrTPlEDVq9aoZZHiKt1CY7+b+J2TGmsUUZdjbGv0LYqbR5EiVowocad8fg+298=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJUVTRhYenY8AsJB9EJdKiK6Xya+xqOkk8bjB6fy3ObR52ol3
	AjGjmBDnXqnZIWa5fGm447Lqv5ENU+vkbFsi2KmwkVqgZVKL9op3BUXr
X-Gm-Gg: ASbGnctr1cG5LcgiATSEWlmhu6azmwY/WJEZJIyQIMw6epSdhaGmJYxArqxl1S3FsTQ
	d91CxYZSXmvZ8XYBSHf448j7qd1sjNOz2jSo9qFmfz/oMRQmcXZp+HTaB0IJ5frodIK+PZIoCru
	dTckJP4eBypfJrlj9/IUFfdYj0mXfogXd8YHkNuyUzuMWT6plCkDblSZ6Wq4A20/pQ3eEeJQLFB
	aXbZS3qOCf8XiuhQMiH0CTr82LpcN41mWEiAfzIPYusfXYl7RQwChSXETdL/9WkKZipCODXYDmc
	ePVed2wOJHgNgXturA8qGEE9+raf6qn0NYyWShUeG6beyrN16CrtxeHJk9NCUan/IAceJ1uomzg
	SRJFyCy66/DE501/d/eFGdnKTDhpUe5Nq
X-Google-Smtp-Source: AGHT+IHi4NOn49y7I9xWwftMlzal3wazSY9a434KghFoZe3qNhO3D7IEhjD0ok5Edxe7Zzc5jQUaPg==
X-Received: by 2002:a05:600c:c0c4:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-454a372ece2mr5565635e9.8.1751443379899;
        Wed, 02 Jul 2025 01:02:59 -0700 (PDT)
Received: from thomas-precision3591.. (eduroam-109159.grenet.fr. [130.190.109.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm194032485e9.13.2025.07.02.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:02:59 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: renesas: Add missing check after DMA map
Date: Wed,  2 Jul 2025 10:01:06 +0200
Message-ID: <20250702080110.46839-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.

Fixes: d8701fe890ec ("mtd: rawnand: renesas: Add new NAND controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/renesas-nand-controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 44f6603736d1..ac8c1b80d7be 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -426,6 +426,9 @@ static int rnandc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, rnandc->buf, mtd->writesize,
 				  DMA_FROM_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr))
+		return -ENOMEM;
+
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
@@ -606,6 +609,9 @@ static int rnandc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, (void *)rnandc->buf, mtd->writesize,
 				  DMA_TO_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr))
+		return -ENOMEM;
+
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
-- 
2.43.0


