Return-Path: <linux-renesas-soc+bounces-23025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF522BDAEE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 20:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86AFD40194B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 18:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3571927F01E;
	Tue, 14 Oct 2025 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AW8Cls/m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A1024DCEF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 18:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760466047; cv=none; b=Z3S/rRLceSWAgYGgr0Ve4IF1AxE2z3bSz8DTPQNgWmw1u+TVp6UQWvo8lkLPNYQrcskO3WfVWZPDb+7kflPye0FnvbP/5Pic0Mtjy0sc9cpiSvKpJBM6lBdrPdThr/vEpNheXxdpWQ487LbdvPZB1uejEkwooKZn81iHUkElX8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760466047; c=relaxed/simple;
	bh=CUG6T+r/hfMhOw8rHMOtfZw23pJjarr+bxDbxbOdKBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNfNIvvS30JG5h2MvNPMF9tTwBSmtSmeqZ8oL+5kjw3S18OlZd7woSCXBMJwemf1I8ldqQTjuoj5NO1oPLEktaVshKJaSsp/uTzJILT0RwFvGpVyf4emaokJHUFjeXMuqfonKCbxdG38Du60Ufl6rEfwYI4975r+VMnvjU+Gt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AW8Cls/m; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b57bf560703so3683512a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760466045; x=1761070845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=peXcX1ppZ4e00pH7Z4pOcPmB5An4hWwhyX+wypJtg6s=;
        b=AW8Cls/mk+2T/r48yailjIUe+i1sDh00iNDdtaZSg39G4C+z+PynMvuJO6QoAW7kkH
         7Ptr5vAwusJW4/WM/FM9T+NuPybHTl3gxpucK4qQ9X/dMmVPEhXAaz9Wujn+YUSR5+U9
         Hq/P9zYEgd9FWEOuO40G92XUjftOyDdEFLY9ePrcsWyw/6wCRfME59KRecQi5xmQjw7j
         RljwfpLqpqIIrXr/HKpDudUkbT+MHLcEAyFS38H/D48zPDLUqqEkGzroLvT16UMi/c0j
         gNOg0z4miiUXMwbYgYz72xLCWTi/YWWMwn1pcU5XoHUfZ+sggcT9K0CiwqVWAaDJSrUf
         iZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760466045; x=1761070845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peXcX1ppZ4e00pH7Z4pOcPmB5An4hWwhyX+wypJtg6s=;
        b=DjZKBxRvB2W62Pd2T4dBTheD/SZl/mFA/Ltdo/+Cxk57urQe4AzW0XrM2PqOiM8K65
         CaVUzOQwK5mEBozdzg8hE4MlsOy0wpljhOFojGRgAUWm/oqXblvLSuWdKzOBuWmlGmln
         HSCXlql6DdOEUvxJHzxkYzxSOL7iwpRET1RSIJLSF+OfPNcxCQlNBbmimq8pgX0RCKvi
         F4OFhxUQRcX5t50QXhN+Kedl2D5SMNM8a4hjHuUpT5OHX6bP//EUCEVlzV7fpvU8I+xb
         hRF7+kFOpVGFDMBTIZb0jHFplA/qYa4wp3wCK28cR8blC3eG2xBJJu0/RilhaySji5r3
         nWkg==
X-Forwarded-Encrypted: i=1; AJvYcCVr6t5Aa8qUbV71kGlXci7Gx/Z/ifR0pieg57jyYyZdfIEtlStEPInbakXfbgveAqGUkMtWOQubFFAG/vNx/8pnTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLK79D1NjKVRQgo+m2Nck+isp6dHm9zsankZnwJvuuROnWoSaV
	fpbM7bEwDvxz1TmVkUxGAbjlxK7IJI7MVmfNdnbIbxPTgXdnB6o5gpWK
X-Gm-Gg: ASbGncuhGgokP/lwm/CPfsTfxTBOLpMjxfqBwwUZB+aubejQnQM3+0+kPjEl1tvI9lG
	NG4E/OIEM/cYGE0V6ApygjVSPLyeDhF0Z8ooFjz+XTsVuijIyNWly0X3xDHUTfNj+xsDtcopAFk
	aL3sK3LqtoWZSEqJJBCwVzO/XNd0nDT/L7PUIQTUmJRPBMhcGYxAFTQ38icZVCT+R4XD3GIiUne
	IK6cIOTegY0y5btY3Os8xLPuHppgYVasfhuzLYu0elIpPD8MyO7JxEWHniNo1A/gzKKmuNRddwc
	UbG4/ZGZmBXQlid/nu7QSNAZwnQOBfd67FknxSmQrOm/azYLI8S4/GBxlXlUelWV6uFgMMHIYxS
	+jjwtjmj6wpzMz64+d/VoJNblNEkxfDT6tVIUQAzMGH1NpOHTGTt2Lbzc7BKD19x0ovx8/br5kw
	==
X-Google-Smtp-Source: AGHT+IEm4RK8/f0buMj4SrH2mJYbC2pmx4tgbD6W7/Sd4CDFLw57bVndhNrBr7LEAGTVcL+wXU3wIg==
X-Received: by 2002:a17:902:e785:b0:267:d2a9:eabb with SMTP id d9443c01a7336-2902739ad39mr313529185ad.25.1760466044665;
        Tue, 14 Oct 2025 11:20:44 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:c338:e681:47e3:e797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f07253sm172244795ad.62.2025.10.14.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 11:20:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: defconfig: Drop duplicate CONFIG_OMAP_USB2 entry
Date: Tue, 14 Oct 2025 19:20:35 +0100
Message-ID: <20251014182035.239956-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

CONFIG_OMAP_USB2 is already enabled as a module in the default defconfig
since commit 8a703a728a745 ("arm64: defconfig: Enable USB2 PHY Driver").
Remove the duplicate entry to fix the following warning:

    arch/arm64/configs/defconfig:1705:warning: override: reassigning to symbol OMAP_USB2

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e401915e2f2f..478ca72c0aeb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1702,7 +1702,6 @@ CONFIG_PHY_UNIPHIER_USB3=y
 CONFIG_PHY_TEGRA_XUSB=y
 CONFIG_PHY_AM654_SERDES=m
 CONFIG_PHY_J721E_WIZ=m
-CONFIG_OMAP_USB2=m
 CONFIG_PHY_XILINX_ZYNQMP=m
 CONFIG_ARM_CCI_PMU=m
 CONFIG_ARM_CCN=m
-- 
2.43.0


