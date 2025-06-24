Return-Path: <linux-renesas-soc+bounces-18678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22FAE6F7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 21:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3A82188E01C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C802E8893;
	Tue, 24 Jun 2025 19:23:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87C22E7F2D;
	Tue, 24 Jun 2025 19:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793021; cv=none; b=Zi3GvfQ5otHDrltRATwCevcATzOCLhg/37gPuBZUCQyXcC4foyCHgNMEsq9I9eq2Ukk+uNDhJoB5RCo6u0fJ2FSgjNwSnxxU1vUU08/RH1sPIGNbyzOSAzdZlXsmfi0cyl7GTGBY3c8kOn9rPLF9PP3bqUQOCflFerU3oB73mH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793021; c=relaxed/simple;
	bh=PDJpiD77z0skldwDKf4SRzGInU4+zqTVkZ+Ltk5hwrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VS+UUZasUDOXEMrWqDBGOVUKV1+fMZb/m0C3B3CDazvPrPw/lsqdRuHt7coYrV2ctHt0rVAs8ChOsJ5CRUInXt32dToXGYtPoqWzDrOtKNmvjwNFb7UiBf/gqf+5QgOjaPBOv/6ibsB0sfJdYqCQXqftWXlLh5J3tm7Yr30t3D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: HHyCfxgHQG6urX94NMWHEA==
X-CSE-MsgGUID: vv/z5tRNTHez4vIuHO4g8w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2025 04:23:37 +0900
Received: from mulinux.example.org (unknown [10.26.240.23])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A27F4003FBF;
	Wed, 25 Jun 2025 04:23:32 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Nishanth Menon <nm@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eric Biggers <ebiggers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/6] arm64: defconfig: Enable the RZ/V2H(P) RSPI driver
Date: Tue, 24 Jun 2025 20:23:03 +0100
Message-Id: <20250624192304.338979-6-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Renesas RZ/V2H(P) RSPI driver for the benefit of
RZ/V2H(P) based platforms.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 42ec6e4ce407..64e7fdad51fd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -575,6 +575,7 @@ CONFIG_SPI_ROCKCHIP=y
 CONFIG_SPI_ROCKCHIP_SFC=m
 CONFIG_SPI_RPCIF=m
 CONFIG_SPI_RSPI=m
+CONFIG_SPI_RZV2H_RSPI=m
 CONFIG_SPI_RZV2M_CSI=m
 CONFIG_SPI_QCOM_QSPI=m
 CONFIG_SPI_QUP=y
-- 
2.34.1


