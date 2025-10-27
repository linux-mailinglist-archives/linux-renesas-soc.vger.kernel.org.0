Return-Path: <linux-renesas-soc+bounces-23662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7DC0F1CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 16:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 563D54FBAD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AED331326B;
	Mon, 27 Oct 2025 15:47:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182C331CA7B;
	Mon, 27 Oct 2025 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580021; cv=none; b=QzUbL2vj1h2L6HM9/9/KHDRM2eDL0uPNJOOqjztSFkATZseIqP6xhzD2bLENNB2B5J/RUzKErtnZ4ZctDPQik6FeZa+6QV7z3PT+qTFGNYhrlrTOSuEXxo89VyZFnoVTjPmAwHGzjVMDkrIprSOpClEveMtRnACR9+4EIbuR5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580021; c=relaxed/simple;
	bh=f4Niae8Y2I/zrtcf2aZiQXm1cUA2JJ4lmgCCOSGG3dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L45fVTWBL4kJ5St99++cDdUnxm2M0JYnnXTaNxr9Xnt95kk0YS9g2sBdf+gidt53BZahbXZI1Rbbvbey5VIUsjM7fP2fh7/McHw4H2/dWOdBypBilrvTdVzI94JpBRVZtzMkhzRTtLo4ZbaBewzIYuAgYxG7TFZsOtve63wmZCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: U21n4GkZRDWvrVfM9o6ZeA==
X-CSE-MsgGUID: i7X2cI07QTyc9R+tABBVOA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Oct 2025 00:46:58 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5E492400A67C;
	Tue, 28 Oct 2025 00:46:55 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 09/19] serial: sh-sci: Use devm_reset_control_array_get_exclusive()
Date: Mon, 27 Oct 2025 15:45:56 +0000
Message-ID: <20251027154615.115759-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 699c39b81c4b..4bcd886de75d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3537,7 +3537,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 
 	data = of_device_get_match_data(&pdev->dev);
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
 	if (IS_ERR(rstc))
 		return ERR_PTR(dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 					     "failed to get reset ctrl\n"));
-- 
2.43.0


