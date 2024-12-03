Return-Path: <linux-renesas-soc+bounces-10825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9AC9E1BB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 13:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C019DB26E60
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0A11E25EE;
	Tue,  3 Dec 2024 10:51:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2781DE4FD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 10:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223070; cv=none; b=kaLg0XenCy8yk4LVDArJJA24fo0nbB4jbvfGqCJS321EIOqgvLcYI+pqNIP46P984XwEvmevoUSvpH4wxP18QUrLGd9H+rg6KUoqEVR5KK3yToxxJ48kv8QP8pHQYK5Nlc4BbWTryhn2Nf/VkHYgXxZf9u6eWRIEXjgeD227WJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223070; c=relaxed/simple;
	bh=fAoVZOONDdq7jeJxMjmWzsDc/11bWlARMdxT1HpjmZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZzENnUQ69Xn/TzYD8MHzJtXw5Q59qlwNg3wItqV96TebJfpyFXcnRuYO6oLi4ekQ241dHw+QnuAZrxPfL7X8evNtaFLxV0KkjR+XwgA7uMbaZVXX+LHeRpeu1t3LBLFBxDVt5E6ZeKfC35pZACfx3kQWJoDN16wTnZVqp1Sd3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: dnEh4QHzS/G6FrHe7XWF3g==
X-CSE-MsgGUID: vrghDf0tTNeQ1BHutAf9/w==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="226779526"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Dec 2024 19:51:07 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 773DE40031FE;
	Tue,  3 Dec 2024 19:50:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 13/13] arm64: defconfig: Enable R9A09G047 SoC
Date: Tue,  3 Dec 2024 10:49:40 +0000
Message-ID: <20241203105005.103927-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for the Renesas RZ/G3E (R9A09G047) SoC in the ARM64
defconfig.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..a14d48444bd8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_ARCH_R9A07G044=y
 CONFIG_ARCH_R9A07G054=y
 CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
+CONFIG_ARCH_R9A09G047=y
 CONFIG_ARCH_R9A09G057=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
-- 
2.43.0


