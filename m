Return-Path: <linux-renesas-soc+bounces-7349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E629315F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 15:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664A428256E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 13:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7B018C180;
	Mon, 15 Jul 2024 13:41:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8608418C169
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jul 2024 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721050895; cv=none; b=bjdB/3AT3sHGHpyFbcVkdnmz6iQiBpajEGBVy5UV5p38kLmKfBQJmdC7jyuCWeJIJlkvjsjhLtLnJwsD9RQFDOfYalHPDM1Y9lgXJxV9KGUtQNnh40p86Jqr8SXUogDFwmCA5ceFVB+7eiUdyl76SB7RSM/3JFuGH/CkdCqbot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721050895; c=relaxed/simple;
	bh=8/SezJrZnsUE7UfYxH8WPPMvJU8eTz9IGHpI8JT7aVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QbU+P4jiOGz0jmDrl7PG+TNv3/M5XvSN3DFef5pudLfIxV8uGVJkLkULV+2HCi87xIzpnuvVQzoaF1QtIoG9a1RL1McXywLkSm4uJvNJIkPFtAP8TsVDAcJsfDttBOXFx1/uN9bHf2hhtaxnm7e/fLlHCNtLDkNgDG3Le+9Algg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,210,1716217200"; 
   d="scan'208";a="211378407"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jul 2024 22:41:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EA9F5434F834;
	Mon, 15 Jul 2024 22:41:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: renesas-usb-vbus-regulator: Update the default
Date: Mon, 15 Jul 2024 14:41:12 +0100
Message-ID: <20240715134120.312610-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the "rzg2l-usb-vbus-regulator" platform device is only created by
drivers/reset/reset-rzg2l-usbphy-ctrl.c, update the default stricter by
replacing ARCH_RZG2L->RESET_RZG2L_USBPHY_CTRL.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/all/CAMuHMdX5ayWbLEEa6nAipECVB6H9eCpRg21pu3zYrTdiER0F+Q@mail.gmail.com/
---
 drivers/regulator/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index e6a9027773fc..c9ec3068cab7 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1664,7 +1664,7 @@ config REGULATOR_RZG2L_VBCTRL
 	depends on ARCH_RZG2L || COMPILE_TEST
 	depends on OF
 	select REGMAP_MMIO
-	default ARCH_RZG2L
+	default RESET_RZG2L_USBPHY_CTRL
 	help
 	  Support for VBUS regulators implemented on Renesas RZ/G2L SoCs.
 
-- 
2.43.0


