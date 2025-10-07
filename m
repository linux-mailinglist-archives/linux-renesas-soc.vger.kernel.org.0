Return-Path: <linux-renesas-soc+bounces-22756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3AFBC188A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 15:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D26319A3853
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 13:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991F12E36FB;
	Tue,  7 Oct 2025 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kWLdZvJr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB62E2663
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844248; cv=none; b=NxF5hZ0I/Ekjq7GEKn8+Kxkl5yKK9FWFE+rCRPDlw2V7i+JJA6HBGziAWwplcLmvCFEGwHFERtbP5W0ZgOSjHHRomGYTSifFKaQTFpsGwlEsVjVWDW19oPxmkU7dsqOAsREKUopqyu8acTnzJcX5nlVwMxBB1kjbZ6YsOeUN7t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844248; c=relaxed/simple;
	bh=SlrBBpX7XFA4K8jiRjYNYq/rnOvVx1EIF4UCFXLAU9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbrfxDE4pI33/jlPgjYmR05LNF2LvVd+2QGhd8KnvV2Ws4qcG/+Tnw2aYlRSmuSCtert7Lm+5ryoC2wNlvu+RAL9D3Ya1Edbe4yZu2cxPA0oO8T/SFAqWjdkRyew17vFbqnSPMvLholp4hesAmppRGAo9jmXHZw9Byrr8UKv8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kWLdZvJr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so55250955e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1759844245; x=1760449045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXLUY6O3ALE+kss75XVolMctp4DQQxT3EVfm+7GyHeg=;
        b=kWLdZvJruCwqnhmr0yLlSWfi24iPBQFtfWCtg6QHt94afuaIkbCPzycj06r3p6+ct/
         ymo40DMkFSjS+ljpcZOLWx9swxyO2pvg7K/0iZrQr4vaphyMiZTdat3ZurIUrAgbbpqp
         UwVAAukZdwRhna6JQPsds8vjKPV2/ji3stMa4anS6c+7uPlgCHF9/DjUld0ZS5T2IwHt
         jmDTdCmv5lUM7cgYxNjZW84eXTLYyHqLzQtU2y5DO/aZMVd2xCAJWS+x3erqHCfobRhT
         OyZMjtvnWn6NnTsNN/tYQHxIDCbTkmRIk76qOa1WATEBLgtFK3NHmcLJ6KNDxfnjd3Sn
         LliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759844245; x=1760449045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXLUY6O3ALE+kss75XVolMctp4DQQxT3EVfm+7GyHeg=;
        b=ERUUv0+gfFk3FDgkHNPDPX8Lp5NWoa6gYU230GIZp/sk1Lgq0vG7J0stHBx4ZnqO+U
         7LQQ0GHBNrM7eXvxSKdoaoGkdtofnyRCCsjb81+reh8Ahyq2ogW5ugyhs/K1r5rXhy8I
         gBClZNNGJ1AVI3lGlmSu0ROt2X0lBotFPLy8N+noSB7BeT1taAljmMX+dhuoWOy2ialW
         Kv2BN4Ey/Q3V3esAdbCM6nQoSsA4yjVwJ1YNt+RbnBUe9sWysOQNtczrQ/MMbpkVDXK9
         YuqTdkO9hu5zLSorK/ry8QYC1gx6xne0/N2uqO+BGrOyho54eU5LwHZqg+YGchuEO+UI
         x5IA==
X-Forwarded-Encrypted: i=1; AJvYcCWeID6piHitRSq5ZVfsKvlp+8lzrSaV32B+Y68Aq0kAIfjQHp+YUD8hV4cKR9XWtak2Aw4PtdL45H2yaz3znINghQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/10fEjmE/8rFCJXg8vaU2ZLAG7xV9TtYUqIC6HxnRZjpRg4cY
	uLzdRcp8oyoc+7k3hxKyHtkPh5Fk2uk9WEPmTTyAie3Uf0Gr/F1+cpRuPZpdEtpCaA4=
X-Gm-Gg: ASbGncsYVAM1h4GgtGZzGhJLavML+4y1ecekap7p9tN0KSnzC2j2Wag/8emyad3C2gh
	ENAKAWYRCrmd0ODOiTRREsvOPAY/HukV2eNcEBGlH4Y6Vh90v//0xGGjs1OCqg4z3nkJoI0gpzz
	qHVT6S+KFElLiOFTUQXsRxaAdyT7UsD8cVa8EVyMzZpjzufdMcLy0ma6x8GRb14tk83RGuA5oKb
	tr6+RewxmzvzSyijmM2/uV/cJBwHJNzCBPhtC3w9+KextJfd+sBLtTmUo8lj3dTnZGV1b0f4uP2
	STKZFI6P6JouU3Adz469kmDrjIFyVylt5M/+NWIQCplWKyuJC9KlxtyeV+YHmghPTczX2q9aGw4
	98uoGzhrvKh+6x47p20zud68Fye2XrMfB
X-Google-Smtp-Source: AGHT+IFUMsIWmk0AdblJ1v0CAZflHye79n+otg2nhOCKiGVeiOkUM0AyVJvRyVI3KKsBIXxIN2lCmQ==
X-Received: by 2002:a05:600c:5406:b0:46e:47cc:a17e with SMTP id 5b1f17b1804b1-46e71101ae7mr95191315e9.1.1759844244701;
        Tue, 07 Oct 2025 06:37:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e674b6591sm272189625e9.4.2025.10.07.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:37:24 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
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
Subject: [PATCH v5 6/6] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Tue,  7 Oct 2025 16:36:57 +0300
Message-ID: <20251007133657.390523-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251007133657.390523-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


