Return-Path: <linux-renesas-soc+bounces-14180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE37DA583F7
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 13:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79C547A5D37
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Mar 2025 12:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229441DC9AD;
	Sun,  9 Mar 2025 12:13:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BD41DB361;
	Sun,  9 Mar 2025 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741522437; cv=none; b=GBgJwL5zfSsKwsRw5iWSlcim6aK55VJaJUk2EJzpTAb6Jiih9j4bQGtRKemk01VkVUxsmxlkwzhUC3qXiSir1Sz8iqGqRnuLueq646Kuwmhv5b1c0YIYmKWNb8x/uJIJIiTHvd7M4By95yK23in7huxglZxyzeM/b0tmokfiUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741522437; c=relaxed/simple;
	bh=BZIqVhFldRu0MXwGZ+xSi1VUrvTS3QQ4keXtdkpfwX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQJGFy5LmGzexYBV652T5pipEOY/mZ29FAFxkqn706N8ICXhg/ht+rp++ysUfme+70e0byaHuzBbHBL2d5xyjYCkqf7oxkGuDgVnZ4LknSu3l+zNbsp8RALH6Ezmsyna+gV8q3WK7aAelSyN39pS16xLoihvfOQsAhwxqfu7aYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: mNpHyZmVTZaWFJXA4+piyw==
X-CSE-MsgGUID: w0tJLpXRQiCKj0N5dApAEw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Mar 2025 21:13:50 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.42])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 671534222E44;
	Sun,  9 Mar 2025 21:13:45 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	niklas.soderlund+renesas@ragnatech.se,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org
Cc: magnus.damm@gmail.com,
	claudiu.beznea.uj@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	rui.zhang@intel.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	linux-pm@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [RFC PATCH 3/3] arm64: dts: renesas: r9a09g047: Add thermal hotplug trip point
Date: Sun,  9 Mar 2025 13:13:23 +0100
Message-ID: <20250309121324.29633-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309121324.29633-1-john.madieu.xa@bp.renesas.com>
References: <20250309121324.29633-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add CPU hotplug trip point to shutdown CPU1 and CPU2 when exceeding 110°C.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 93b57d7ad7b9..06bd394582e2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -533,6 +533,13 @@ map0 {
 							 <&cpu2 0 3>, <&cpu3 0 3>;
 					contribution = <1024>;
 				};
+
+				map1 {
+					trip = <&trip_emergency>;
+					cooling-device = <&cpu1 0 1>, <&cpu2 0 1>;
+					contribution = <1024>;
+				};
+
 			};
 
 			trips {
@@ -542,6 +549,12 @@ target: trip-point {
 					type = "passive";
 				};
 
+				trip_emergency: emergency {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "plug";
+				};
+
 				sensor_crit: sensor-crit {
 					temperature = <120000>;
 					hysteresis = <1000>;
-- 
2.25.1


