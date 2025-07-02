Return-Path: <linux-renesas-soc+bounces-19008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C2AF0C65
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C092B3B0518
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 07:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28020223339;
	Wed,  2 Jul 2025 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bF5Yyc/t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CD0634EC;
	Wed,  2 Jul 2025 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751440791; cv=none; b=M3Wh8zbdBTNjWFZ8mwRkNT824ZQKq/lEdKoXNYUtG/fCFpOEcM7mZfVfRJFZVqHbHVMuouxD65xWBExauMR+7AjD9gF2Lf2YOUIXyG6eKF9wol4mJVCGgK0/vTz+I0HqsIMEwhtpxtelHyOop4C9imNTCY039Eu6kO7Wb7ThAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751440791; c=relaxed/simple;
	bh=HZwQzes1s0dCeXQ80X1zgZSKLvoJz6waGynj8z/p1Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQzv2Yx566Z9/6ZAPeVce4HyUlzJnUth7Z3AS7Ix+1KXq4D8vo33e5hq2zGvTqROp23Ts5RBPvdj7woYMPxxOOzG7ZBiwv6Z7F9bnxK5ikZZz1F9Xpad0avoWmi7GLAnw9I176A/0mtz3y51m5uvVrmH9lvotNNiqeScOXN0BZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bF5Yyc/t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so878242f8f.3;
        Wed, 02 Jul 2025 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751440787; x=1752045587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29Ak/ncEpBZr7ANmY5PCAbSSEdsdCcghSMWZ9aad75g=;
        b=bF5Yyc/tRQz+JkdV7OjYCWVLyqY3ddBsBBkFmAlmyeQkYOvCwVMJM08TYBlTRipPRt
         CEZpJL2vQ757pu5ChCEy+XyqT8/wwcPVDOrPi9rQX7KQGlCDskayuWM0FbCNQyKSxrVf
         jPYCYZv/8rZkHvcUMzA8hee49WxuITYun7mofSh//6+VTC1ZsjdonxXgVWmUjBJe238L
         oLOvpdtmuU7kuanczTjyvXS79yMTb1jZrlcffQE6pVvxQz4gz1GJSz+4e/wgqknmlybU
         akrDpQksXPp4G+cfsPRyoGDVqwA+vrajMazjCS65afvV53ZfbC4pNKwCUmTnyW3mgTZM
         F+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751440787; x=1752045587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29Ak/ncEpBZr7ANmY5PCAbSSEdsdCcghSMWZ9aad75g=;
        b=dedW+PMutUk3s/s0jLW6uyk2uVNuMoLuDGiFAaVSpR63oA91BQuRlw8ZMCru3Ie84i
         B3/+nqDEpcQ+xHRjWoJpxisGSzT+96NoHUT3171D+RrOh+qvUQsH0HZBG8taDxgKz5qQ
         kN6R8cOaU2Sl2s7Gpjx0XqQdz5OFyY9keOJRdYr8+V/6B+W3WBTEAMLud3LMMQsrfz7E
         biP+OLNuv/CtdpBAH6kGfgr0Fc0/sZ2//dHC5j0ZTO0jV9pxCLJSidGnjudhJgl2IBF1
         q92AQ1HS9W9ZPFDrbuiu5P8Q3+wjjhrOo+dTFQrVZX/og6gM44p7lgHnE5qeqK1mK/8o
         Z4KA==
X-Forwarded-Encrypted: i=1; AJvYcCUWhSozJHXtibnMugPn9gwozApr5JxEh9sFya3Pb+PaUma5KqGrzQSEiPN2Npbf3Q02oWrZraE041jjKVs=@vger.kernel.org, AJvYcCXCzyzmMyio+w8P/rV4488GisnthQjy850IN1k05hmPJoYfjqVysx40DPHhx3xH7aXwf7ZlQRXu@vger.kernel.org, AJvYcCXFlXYmjpO7PfT2PVI4XcnxZIPibHYEe1k1/CqRlhKtjhJ2+Xyza4nhJFz0YnAjGXMKIsDKF0nFg0sSlpJHUTGrYIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHsG87buLfQ+Wo5+iFRT8pGBNG0cXMJM7zkkW/Yw2ALsFnjBS
	XrH/ac+LOK1udie/GiV9CxtZLsb8x7iGcOGFlrhWhFBKXWEpn3CWiPBE
X-Gm-Gg: ASbGncsgnlvhwJWmAbb63Dvl2nWfpyyQg5ILy1KPcUwkYkXUvOZzRMQTN04fsq14MpI
	DNTDhcxWn3tPvf6nMdXX1vxhpFeL8eUdBY97IL9fQiUqPqoXWNZcJ7ZFNTLjTO/Doo7woadfL5/
	PDqP9yV9INi87+LMlO7rJAAHLvQqa3ACM44OCnncic7xTgIjuR8wUDuhqCsXkWVXpggdA3drW3U
	0X5t3+aGclpU7EWFIvvCvvg5gWp/+e+azOuFGUSfcCrmJ8vgbCa2v7tpW+sHhhiaZ/bgGF7MVWy
	ed8n/WTFIlVjw86oftCzwTmJeC6Ap2Ve61AlVPcl87HOwV0q2iBf494g7erK7paQbqiapkLJKs5
	ePyyLkghysVNz
X-Google-Smtp-Source: AGHT+IFvEc/YQH0iMY9kuno2iXyUVs1TvRbucMzr5iCCWzoq4QGjRiP5liXmGKiCZcU1DHEwPw2+Hg==
X-Received: by 2002:a05:600c:358f:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-454a370c4d7mr6204995e9.4.1751440787221;
        Wed, 02 Jul 2025 00:19:47 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:9d5:215:761c:daff])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823ad0f3sm223424525e9.19.2025.07.02.00.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:19:46 -0700 (PDT)
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
Subject: [PATCH] mtd: rawnand: renesas: Add missing check after DMA map
Date: Wed,  2 Jul 2025 09:17:22 +0200
Message-ID: <20250702071722.24921-3-fourier.thomas@gmail.com>
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
 drivers/mtd/nand/raw/renesas-nand-controller.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
index 44f6603736d1..f4a775571733 100644
--- a/drivers/mtd/nand/raw/renesas-nand-controller.c
+++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
@@ -426,6 +426,10 @@ static int rnandc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, rnandc->buf, mtd->writesize,
 				  DMA_FROM_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr)) {
+		dev_err(rnandc->dev, "DMA mapping failed.\n");
+		return -ENOMEM;
+	}
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
@@ -606,6 +610,10 @@ static int rnandc_write_page_hw_ecc(struct nand_chip *chip, const u8 *buf,
 	/* Configure DMA */
 	dma_addr = dma_map_single(rnandc->dev, (void *)rnandc->buf, mtd->writesize,
 				  DMA_TO_DEVICE);
+	if (dma_mapping_error(rnandc->dev, dma_addr)) {
+		dev_err(rnandc->dev, "DMA mapping failed.\n");
+		return -ENOMEM;
+	}
 	writel(dma_addr, rnandc->regs + DMA_ADDR_LOW_REG);
 	writel(mtd->writesize, rnandc->regs + DMA_CNT_REG);
 	writel(DMA_TLVL_MAX, rnandc->regs + DMA_TLVL_REG);
-- 
2.43.0


