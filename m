Return-Path: <linux-renesas-soc+bounces-3867-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDAD87EEFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 18:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8931C2212E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 17:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5204556762;
	Mon, 18 Mar 2024 17:33:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D35B56470;
	Mon, 18 Mar 2024 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710783230; cv=none; b=UOyPk3PNwsphDdfXqyrKL9fawimz684HHeyPcfyqTU7tr2ka8dGhVV8XYaeFR4RfzXfXGvNxk77YxgaP8Ng7Amg1/QF46I4obCRavcaW3bOmWeZsijt6jDwTwa3VUfS9HXIMIjnoEkdnfRT2sVwTi1RN715FQKa1uP6Z61zsbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710783230; c=relaxed/simple;
	bh=GfJDDBIkHGCJcvR5+gC5D60z78PI35H4CBxN2kgXd4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oGCDdE2vG71H4bUfYbD9nXQj6ku7yck5AwS2Ha0ujA6yNSsXf8sIUxs3Nfeo5p4DTyNK+648jukk2fLdTY+/lEo7YnkMK3Yv2nKKsJl+hDv/ikJNgFvzzrnPswsNNo7uoLWZXcZG7gd0bbAwPa1uH/t2myDiTFNDeOKzMgfWkJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,134,1708354800"; 
   d="scan'208";a="202167619"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Mar 2024 02:33:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.20])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2934740359E9;
	Tue, 19 Mar 2024 02:33:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Huy Nguyen <huy.nguyen.wh@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 5/6] usb: renesas_usbhs: Remove trailing comma in the terminator entry for OF table
Date: Mon, 18 Mar 2024 17:33:18 +0000
Message-Id: <20240318173319.201799-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
References: <20240318173319.201799-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the trailing comma in the terminator entry for the OF table
making code robust against (theoretical) misrebases or other similar
things where the new entry goes _after_ the termination without the
compiler noticing.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Added Rb tag from Geert.
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index df94375f6c23..7ec1ab90fef3 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -597,7 +597,7 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rzg2l-usbhs",
 		.data = &usbhs_rzg2l_plat_info,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
 
-- 
2.25.1


