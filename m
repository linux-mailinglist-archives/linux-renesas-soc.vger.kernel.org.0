Return-Path: <linux-renesas-soc+bounces-24684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071CC6318D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 10:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D703366F65
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Nov 2025 09:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5369E32936B;
	Mon, 17 Nov 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TYcdfTTO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5200A328B45
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370578; cv=none; b=KyVIkhJcPhjv4T2rfrUl57ReupThlZsUzBecXd9R1KibU5n+uKUKYewKRyuWidI7+DZhPLOOGkqNJkxqk1BAW22orXpub/Pkix33UC/Y+2gM+dQCe7yr0eadU6jg4USPedTX3wEmipUXaHmYwAFG8dZXPonHHnRgJ6sU61AcI2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370578; c=relaxed/simple;
	bh=JjljQgas7DGEcN8zVwFliJCqA/9CipeGEbRjGs4wc9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1kq2uWz5Upp1RjpSxfD8Tvt+f1IH+3CV09iH/GnPV5pysCLdvgjsvM5xIQblua1WzfaSeFTP7z6KB9oXV+bTGB6VUv9iWP17T+PlevKpJC0lhM+iXlF/3sVDZ6nleA7ziIeAlyB9PZT5ftAoyC8C/v0UA8LX+IEpgT7brgHPTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TYcdfTTO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso5892095e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Nov 2025 01:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763370574; x=1763975374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFJ2erejpxbkIEQhqGIz++SG+xOYypR9geXcoZY+s9w=;
        b=TYcdfTTOJsvxDi8xipaqV0ATgVgZkhlGs3Bf/fyfIAGVJGtAUryixVII44/sQP08fp
         ZKd6iFtq98dDFPzN7WfDLEhtvv9MR1t380QqnDI6NtG2y2JQO3yeKMdj8hqIojWNoWTy
         9eonE+iF8A2H6GNIfvyCoMTi/kfmcYtP6vsu6b437h/sCACsLJh6dQ1hfUTUlAE5FsMM
         7Ez+pktOf7gS61RrMEsXsWiHrnXGryiNXMwICLEVqJvN3cti9xbN8u+bmiKSE8PTQUIw
         kbgkRFIasBTTt7sCa/MZdtHCNs5eptLNfVyOIRK8hzL+DDg7XfecFHK4rRQoxtaHF7As
         Edhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370574; x=1763975374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFJ2erejpxbkIEQhqGIz++SG+xOYypR9geXcoZY+s9w=;
        b=F77H5fRDyxp/PrnhPReRWQunDIHVgVvPnwHLpoXCgz6Ma9AAQiw8Cks/GOOmFfYApz
         ztWrmMueOcJeEQgsC2a1tLsyN4+4N488N4XU64+M99sfb6ZGHKl7ufBOqHG84fAiS75+
         hisKWhi3i1U8RPNW02pyMOgSRvgEbOJtJxnCVBb9oRKha9IVBiWen7T4gRERabAAxlLy
         N/IbH1Q8KtOtw73Lm2FtQFU+hVV3veskN+SQCMgxjiuo4LkCMX2QmpImJbfm46PurrVg
         9AFjvLaASy7k2DtpisPV4KlzpjrO6mpjjvN8IB+vYLmkMDEV6nGBhK3p1X1Cw5umAU6K
         e4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXAXKUH3fGkBfaar0EMjMukbsgxBD3NYGGLJj1SRWm5o07USXDpQ78C8dmn/YNPGsF9lJtWyJN8w3fPD6w9mhfByA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2+ByXeebz0Q/v/XCy3/4hgcjcgIhkH58GtdvNhBFI4qGzACDO
	IvsdhyiYO4sHgTcEvWtlIORkCXfzIkRF0EpK9xH7XP6Pxoe4TpR6zxRzn89OdONe8Bk=
X-Gm-Gg: ASbGncuoIhaSFowfNohExn7zUUQocwAubuJgSLBWyfeXZYCxI6XyQYyWEQTyxEEa9mG
	vOMt6Q+aCY4KdfdNIj3Ghp0n7uKKjJLqrbO2GG1BPOMpoPdx8C6S5HjRmgZ7Gd2gQkFKxDqBhi3
	JhoStz6JaCfJHFQ+sIaanRNXvfEHWQmX4YejRbZOP6atLSBRrAVOF+FgcFwNpU/ZT63L9HLcWJ7
	KbslhSVNhTUCIOj0bIKOYdzLzGPIQWL/foIyZB9ku4Q+6c069wu9hOHS0Y4Y3a9zcQz+yD+Isz/
	VJNPkV+Casc/ZTpOyTYehy8b1WM4wwLZNwdof0np/jmdQE9n1x7VrF/Wc4PgdX96TklPLknyAwv
	8ijUDy7d1r3Bk9sU9+X7ebkukteZxetFh0dVylRbT7Nu2thEXt3o/iPttS3mUvf/m0TMNJz2dLx
	hScAJNKgra1ydA2snngmn2ddiWXKhVm/CRpZ2enXZB
X-Google-Smtp-Source: AGHT+IFE6UJWcV5X6YeeIc6kAalNdpdQ69L4bDzZB4HRy7rqCESHG0voUX9snlDb2jiivpyhIFWW0A==
X-Received: by 2002:a05:600c:1549:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-4779ce2a4ffmr60130715e9.0.1763370574325;
        Mon, 17 Nov 2025 01:09:34 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm25703786f8f.26.2025.11.17.01.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:09:33 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v7 6/6] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Mon, 17 Nov 2025 11:08:58 +0200
Message-ID: <20251117090859.3840888-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117090859.3840888-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251117090859.3840888-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- rebased on top of v6.18-rc1

Changes in v6:
- collected tags

Changes in v5:
- dropped Tb tag

Changes in v4:
- made it builtin

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..54fd09317edf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -230,6 +230,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=y
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0


