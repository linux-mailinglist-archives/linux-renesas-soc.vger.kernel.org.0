Return-Path: <linux-renesas-soc+bounces-3133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8852861190
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 13:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06B6C285765
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 12:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86E626289;
	Fri, 23 Feb 2024 12:37:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206081EB37
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708691822; cv=none; b=cp+1PMg1vunu1/Pi6vX/fKoiLyZsat/WEydl6HoqUooh/rKaHqZI4pEqpDPQMFbKOm3hz5WFmR0gE9an/IgIADX9itrrNDBd8jWMTxMeyrAMAxQxAyaV+dyVjckoJQPWoYdf/95BhzkrzYArV39MU048EJFcLLPjKrJEnNYbZsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708691822; c=relaxed/simple;
	bh=nvzuFuAEyDrqz88BJIbtmyGFXzwFRlZ4LMc3FaBet4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bgGzL/iEOyElP/pYGUosxccM7Xizp49DUaqjafi9Ivw1IHYhY/J/QgEDj6SLXnFfuNxOInXiAMmVX7HDATY0ZdLCzxfpWJyNS+tbP14EnyDV4vZgT3Ve+I+P75ANo9uIntovki3K5pR7lmFDaH4VCQQRKJnV+BSlbGH6pivSpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,179,1705330800"; 
   d="scan'208";a="198972954"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Feb 2024 21:36:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.113])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 025ED4218D4B;
	Fri, 23 Feb 2024 21:36:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Renesas RZ/G2L display unit DRM driver
Date: Fri, 23 Feb 2024 12:36:46 +0000
Message-Id: <20240223123646.245655-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the RZ/G2L display unit DRM driver used in RZ/{G2L,G2LC,V2L} SMARC
EVK development boards.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 34681284043f..099ed9b61e83 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -851,6 +851,7 @@ CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_RCAR_DW_HDMI=m
 CONFIG_DRM_RCAR_MIPI_DSI=m
 CONFIG_DRM_RZG2L_MIPI_DSI=m
+CONFIG_DRM_RZG2L_DU=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_SUN6I_DSI=m
 CONFIG_DRM_SUN8I_DW_HDMI=m
-- 
2.25.1


