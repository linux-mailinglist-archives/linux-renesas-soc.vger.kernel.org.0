Return-Path: <linux-renesas-soc+bounces-12209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1EA14194
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 19:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A55E188D518
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 18:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC73B22D4F3;
	Thu, 16 Jan 2025 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z0Rz5TdH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871EC190685
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737051785; cv=none; b=DgaA6kPVu+soTD50LxKKZNr6cOG2HhakY+7d+HOXwOkeiPJtMwrB3J7liyXVQ7s3b/yKFpjVg1mvrQVQZ/v9Jf9HkTMrFcL/8+UfPWRbgkTywH1cOVJ9vbRBm2uiSbAGX6ol4oRtgTt8/56zCGvf3ymD+bXHyY4guNWyFwEs3o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737051785; c=relaxed/simple;
	bh=OwX0MEmBGHpg5bhCw6tUfaBb3F/xkJXnfYSkUVfbveM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qWh+DwgHLH0opaEV2OXv+EVU/Cjt/C0ndkm6XtNQ60bl4WsfTu6a+c8NTCdfYqbwvj7GYcuA8ryyrhW/CIl9FUIq9VBPSXdT9yxFeeoYZTLKyrI2I6+kuiTh7GkXU4UM4mqDTQRbohgdlmiVUCGVw0/ngOUEsqBMLQt6ew/LVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z0Rz5TdH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso739821f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 10:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737051782; x=1737656582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aAPRbHfyxaeTRN6at4Eq4c1feMoRRI7T6P9QuC4/ttU=;
        b=Z0Rz5TdHRKGhTLOAJxn/42V3gN1gcLgEwff+vtouyV68DqVH0k5w/grIT5dY2QiU1H
         DZf/iqghLqhvuIJhpQhvqX34Fln2AnJUdVLHo4LDyojTtFiQZk2eoSKL7PnDNbcVB9si
         FvtUzuKfh37fvnoxl0XL3kc/qgG1fPovr8Md32JlOFGassSwt1yhyPKZEZ4XenqcqlbQ
         JRlz7c4lInolx5uJ9xgNtmK8ozr3dgJy3uXsxCvoaOjrvjAoG2M7ckJfgEmDObepDWLB
         3jupFTK4khVlHoS5imaSZrsZhZSG3tm9hdEcie/ihpKJyBaSvDGJ9OUccgM5jWPz0X+I
         71Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737051782; x=1737656582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAPRbHfyxaeTRN6at4Eq4c1feMoRRI7T6P9QuC4/ttU=;
        b=s1XpYftH1HvP8ZlHjoCixIW6bopWQdhLn49dhJ0vVFfyRvnWq29uEtvkVaD5XLsjn/
         OS2QDGM2LerYtpE9+5RcUjK3gCtUsQ2kLzGlrJB5v+8+iFOZj0f/BdN1SgO6O2qOsiP+
         ArgQ4Xlb2Mus1oli6MpwpYv+AsjFngTZO80hnp9Ri7YUAljQQ3xq8vHHBB4Wz0RcfUJE
         PhE7c0dLg0ffqbsPeuvNjBAtD4/DDyXPig7AVsTMUGRZ8LfpDG2VBnwZKs4xJhjehL8l
         wyO2y7oqv/prSrDguT+KXvkivwoSJmWUnggXrHuVMYlLBzt43XyoC3LGTOAzh0kJE0lR
         iI7w==
X-Forwarded-Encrypted: i=1; AJvYcCVkxn3d5WUT7IsCldkzTZccDf/9unqiLqq9qsTGYZxNM21wcNbnuAOoNugvKXeMHaJ7IYE0JiDFIi5yyd46UTIadQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuiB4xe9+OZbzdTQhXUaVtoYGyjBs13gDEkg8bcDVvqT/iQjFg
	xVGA31q47kS8Nak2tW2p+sIJVCW/X/zehuafgwUmnWC+v0L5BiJhihG9HZR0CSg=
X-Gm-Gg: ASbGncvy6CEzWYy/GFV4MN0LT/+weWFcaPqM0anzWVPoTM8C+Cdn2TVYdVGTvVo0rek
	fH9+X/sLIYGkvVKhko4L+SH+rSM2Xc9bvYSXGBQW7NhRm8RHs8WG4AhfjvHI0duyYCEr6TbKVE0
	qtlTyRZ6J40JlLZoC9M8rTpSvvzWHHaVfi/ZDCMnsdBBAlw/D6HHgXvqO8m52LrUTzLGCI5HX56
	ZcBsMzyJU9YNPFQ7BXkSrwT5Ap756I9hRY2vMW6DWa2bPevJl1HFtV2J2QIZ3/+/KeXnQHgaBbe
	aaan6GxpNIM=
X-Google-Smtp-Source: AGHT+IEbbWS+5FcmutXAoXuYh25F/7EUf2rywm4G8Zg7Ww6kMySq2k45dMXvPOz2eIXImkYcoRwoOA==
X-Received: by 2002:a5d:6489:0:b0:38b:da32:4f40 with SMTP id ffacd0b85a97d-38bda325049mr15381555f8f.2.1737051781547;
        Thu, 16 Jan 2025 10:23:01 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm495942f8f.48.2025.01.16.10.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 10:23:01 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ysato@users.sourceforge.jp,
	ulrich.hecht+renesas@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/5] serial: sh-sci: Fixes for earlycon and keep_bootcon
Date: Thu, 16 Jan 2025 20:22:44 +0200
Message-ID: <20250116182249.3828577-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds fixes for earlycon and keep_bootcon on sh-sci driver.
All these fixes are prerequisites for the Renesas RZ/G3S SCI support.

Series was tested on the boards with the following device trees binaries:
- r8a7742-iwg21d-q7.dtb
- r8a7743-iwg20d-q7.dtb
- r8a7745-iwg22d-sodimm.dtb
- r8a77470-iwg23s-sbc.dtb
- r8a774a1-hihope-rzg2m-ex.dtb
- r8a774b1-hihope-rzg2n-ex.dtb
- r8a774e1-hihope-rzg2h-ex.dtb
- r9a07g043u11-smarc.dtb
- r9a07g044c2-smarc.dtb
- r9a07g044l2-smarc.dtb
- r9a07g054l2-smarc.dtb
- r9a08g045s33-smarc.dtb
- r9a08g045s33-smarc-pmod.dtb (not integrated in the latest kernel tree,
  but the device tree was posted at [1])

in the following scenarios:

1/ "earlycon keep_bootcon" were present in bootargs
2/ only "earlycon" was present in bootargs
3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
   bootargs

1, 2, 3 were tested also with renesas_defconfig on
r9a08g045s33-smarc-pmod.dtb.

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20241115134401.3893008-9-claudiu.beznea.uj@bp.renesas.com/

Changes since RFT:
- dropped patch 1/6 as it was applied
- dropped RFT tag
- updated cover letter
- collected tags
- addressed review comments
- the changelog for each patch is detailed within the individual
  patches

Claudiu Beznea (5):
  serial: sh-sci: Drop __initdata macro for port_cfg
  serial: sh-sci: Move runtime PM enable to sci_probe_single()
  serial: sh-sci: Do not probe the serial port if its slot in
    sci_ports[] is in use
  serial: sh-sci: Clean sci_ports[0] after at earlycon exit
  serial: sh-sci: Increment the runtime usage counter for the earlycon
    device

 drivers/tty/serial/sh-sci.c | 93 +++++++++++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 19 deletions(-)

-- 
2.43.0


