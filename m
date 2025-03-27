Return-Path: <linux-renesas-soc+bounces-14908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8EA72C08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 10:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6253B3847
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 09:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027442054F7;
	Thu, 27 Mar 2025 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICTIewpQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12215B546
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066214; cv=none; b=NznhhdDFeN6k/7NfAIhXdVsxuPWqfLSk90cO4MKnWw0DoCnyXbZ6D95oxAl++FnkwM3ZALnQL40AuCm3fU6vewXSgEyDcMsbhkpi4VzD2sEya3KLgl6Fme7EPGskh+YwD0Px1jY+lRlYvvAKbtiSfUMIvbbCa/tev4nRzhxhUJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066214; c=relaxed/simple;
	bh=2a6I5b0fhAQgGBztQdjjNt8KfF4yVDkOu5LtaOEU2cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ve1M05xyToo+w1mZlcuWos1/vhdEz/v5q+32pf3jiQl21XSp37AH9uQ99XzSanxJydhwR/IDfAyPdvKGIrwEwsZrjiWdD/1ZK+4mRTu8MJqBuR4Yn69+05yH19paNkb0cNdObKX+ZRubRRe3i3J9BxxxafUXdU9O1LSDqpsNtzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICTIewpQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso543335f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743066211; x=1743671011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoArmsFdoyGgrobWTJvlW4FClTlm9eokAAhKDCnb1og=;
        b=ICTIewpQKDS2GEqpS8wWGIdOzOLz6vV8FiJQq0jebE1zVuaL0lNGpPU/eNMEgVaq5x
         7vtgzXs5ZFQ2R59oTaR51FPt6XZ/cGrDHHo3Q/w6MiTlsOGL/a2iu/ZZHZ9WAM6kxICh
         fUqAuORjbvFzrvfh8X3d//b6bTaHv9uAsUP4wRJAOeNEjJcQ52wKlYZ9z2INN6LMuUwJ
         CPyDo2nREPOXdnFsyFx3Bt/WiPYWJ3N4L+d+sZaQEMbUp67qBoTAdaSgWX+Tb2BXZ8nM
         U6DumW1xuQWXowxzL79yzEQs0O8/8WV0IU/LtT4PYwJRwFlbF1nANFhLnpd5dX7hyRL6
         JQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066211; x=1743671011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoArmsFdoyGgrobWTJvlW4FClTlm9eokAAhKDCnb1og=;
        b=UKuLjufk+l56QwSXi5IhOP0D+dLPOh7UjOYwD/I1RcmlKwGGjYs7KjMEPqm8jM0UYw
         wKl5CwS9zzPGweRWeUB85cW5SarKWRlyYhJaQlZlLBAYIsjE41Nj0cde7X15K0/MlrSC
         QGTu8Orw4BAOFA9hG2oAF36uIK4ePeUBgXF6Dlm62jTqlNkj8sY0406mihGWOwX08SMO
         0SrcR95RLCAtvWcES6hTAT9ETtjYoRxXuqxmHWNPYZmfZa8mlkjZU+XH5R8pDDaMBDpP
         TXtNH6xiGPCEx6Md1riuTO3Q2Uod3O6dejopgMQyJFigsBvjnumcYKJIJCAsPzgwiyOH
         Y/Ww==
X-Gm-Message-State: AOJu0YyiKUuOMCrLLJXXUcEwQaifCjpu4dLlNaUDkehflH+nUcCDZ1ps
	OrGZ5oEGfc9opI4ABRKNhWzGwjhmiLbqnvSOZgq7LkD1qjg8sS6N
X-Gm-Gg: ASbGncuxUx1rWmH+5lZU0CMR8sLn08GqOO7onQ16GOXGGduwp0jd9EVSOYVXEB2LRyh
	/elrNEgd9IZeQolHl9pPuw//tnlAriktY3LU+QSSLBaWpgVZB3G2zDqEMGBrCS9Riy7towutodg
	0W/R2SmZmri+MXGTH4ZxIarr2kgssZqa3gUiWUl9eNSzKNdhGnU92bS2Hl6+LeFHSsQ2zT6u2sE
	UBhwGKvc6AvgjZWO8BDElKkHTGEW/2iSH0IsrA7uQUBn/krMibRVC9TPv1vS+jI1yNTLVfUDZ4a
	PXN+78K4vTYTyO2aAL6mVayaruDdsxrnRrj2rA6Tu4rv11w2tR+DELHoGP5Oxem5qtsWGg==
X-Google-Smtp-Source: AGHT+IG/HCvNM4jT6HPfy6fsFCe8rGci0FaBBCr3rOVczrcC+sqE/K79iGtLJZlPr+wBoe0JtwzdJQ==
X-Received: by 2002:a05:6000:1a8d:b0:39a:ca59:a626 with SMTP id ffacd0b85a97d-39ad174a4f4mr2098230f8f.28.1743066211421;
        Thu, 27 Mar 2025 02:03:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efca6sm19490682f8f.93.2025.03.27.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:03:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL 1/2] soc: renesas: Add ARCH_RENESAS_ARM64 Kconfig option
Date: Thu, 27 Mar 2025 09:03:20 +0000
Message-ID: <20250327090321.15394-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce a new `ARCH_RENESAS_ARM64` Kconfig option to simplify the
selection of all ARM64-based Renesas SoCs. This allows for easier
configuration when building kernels for multiple Renesas ARM64 platforms
by selecting a single option instead of enabling each SoC individually.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 49648cf28bd2..8a6c429965b7 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -195,6 +195,32 @@ endif # ARM
 
 if ARM64
 
+config ARCH_RENESAS_ARM64
+	bool "Select all ARM64 Renesas SoCs"
+	select ARCH_R8A77995
+	select ARCH_R8A77990
+	select ARCH_R8A77951
+	select ARCH_R8A77965
+	select ARCH_R8A77960
+	select ARCH_R8A77961
+	select ARCH_R8A779F0
+	select ARCH_R8A77980
+	select ARCH_R8A77970
+	select ARCH_R8A779A0
+	select ARCH_R8A779G0
+	select ARCH_R8A779H0
+	select ARCH_R8A774C0
+	select ARCH_R8A774E1
+	select ARCH_R8A774A1
+	select ARCH_R8A774B1
+	select ARCH_R9A07G043
+	select ARCH_R9A07G044
+	select ARCH_R9A07G054
+	select ARCH_R9A08G045
+	select ARCH_R9A09G011
+	select ARCH_R9A09G047
+	select ARCH_R9A09G057
+
 config ARCH_R8A77995
 	bool "ARM64 Platform support for R-Car D3"
 	select ARCH_RCAR_GEN3
-- 
2.49.0


