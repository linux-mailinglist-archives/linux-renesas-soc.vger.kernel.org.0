Return-Path: <linux-renesas-soc+bounces-3613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF4876A85
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 19:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56AA2282988
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 18:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A36354667;
	Fri,  8 Mar 2024 18:09:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E40950251;
	Fri,  8 Mar 2024 18:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709921382; cv=none; b=e+FgUijRNCtm8mb7ZP3U3xccGjl5kZawlPi8vApANsHdXBNuZ5+e09sWwaJmWELGQNRDUmBYvIGo5R/kVwQG4Wy15GDNxht763qf1oC6Q4vY1RGzO4MVjvI9/G2UVz0C3EqXQ9DBsj9vFYZYNeGNdpE4TnBN/Mr0ez4DiURzjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709921382; c=relaxed/simple;
	bh=Zr6zzX8zyrUcnqW0M6au7J1N1WCZ1A1Gz3sOHWw9etY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s/hzZzDz1plcoGxj6gXPzPoHQXS8cQH8hQcAbNhKgoWHCC4XQk0eXbGYx/ppDySJsM71itWmnPDMSmWc8QH7Gz5LemFAC4yw23HtorXsPhaj8jf+8Q2i9k954+BOFrn/rDqALHlwVFlwSTDskiz4iFkuDTCsQF1DeNCIA9OJ4dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,110,1708354800"; 
   d="scan'208";a="196951386"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Mar 2024 03:09:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D84E940158E6;
	Sat,  9 Mar 2024 03:09:35 +0900 (JST)
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
Subject: [PATCH 3/4] usb: renesas_usbhs: Remove trailing comma in the terminator entry for OF table
Date: Fri,  8 Mar 2024 18:09:18 +0000
Message-Id: <20240308180919.6603-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
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
---
 drivers/usb/renesas_usbhs/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 030ec36deb64..7f8fc86fc687 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -599,7 +599,7 @@ static const struct of_device_id usbhs_of_match[] = {
 		.compatible = "renesas,rzg2l-usbhs",
 		.data = &usbhs_rza2_plat_info,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, usbhs_of_match);
 
-- 
2.25.1


