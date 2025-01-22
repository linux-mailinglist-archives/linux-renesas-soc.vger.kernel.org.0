Return-Path: <linux-renesas-soc+bounces-12329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BB7A19000
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48153188A575
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13067211703;
	Wed, 22 Jan 2025 10:40:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02425211499;
	Wed, 22 Jan 2025 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542433; cv=none; b=syVL5cA4/yynyCqJCzJX+/UnG/dMmvgn4KjiWgF/SHQl90ZqiQE/mvaYlTHtEDgYwLylhwHRHPqwyuyXn1iMSPq7ZfVAXYUlUfzHRE47mngXUwQryqZC+LRDUtqVFgODFuXppmp36IRciGVWhcoLhKglVJmkBbaCocgb5QCzHuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542433; c=relaxed/simple;
	bh=z6IOhJDVuM2aTEnSolKR4WjaZxBsbyVQqStYbnEgOks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COQlCKNba5xNIP+AqEc6iGZdqQZyNcKxNcWG9Un4n/J/Us8n6os5sBpB+IYSmaiuHIzuEOL0WQdADBqZDC2420zxRt2A3JuMrcKtDxJtmtGEgo5lJlAKDHbTpmr14o/fEiCbrk0a5EVXQzfNyb/85lyAxLVa4FcJs1bZTmrMgLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: peCLAoABSsmYl01ouvlUqw==
X-CSE-MsgGUID: bAOyWgzETMWICReeD6I93A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Jan 2025 19:40:28 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.193])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6417A400562D;
	Wed, 22 Jan 2025 19:40:22 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	robh@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	john.madieu@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Subject: [PATCH v3 7/9] arm64: dts: renesas: r9a08g045: Enable the system controller
Date: Wed, 22 Jan 2025 11:39:09 +0100
Message-ID: <20250122103911.517484-8-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
References: <20250122103911.517484-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the system controller. It is needed for SoC identification.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index a9b98db9ef95..d1e228b439df 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -443,7 +443,6 @@ sysc: system-controller@11020000 {
 				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "lpm_int", "ca55stbydone_int",
 					  "cm33stbyr_int", "ca55_deny";
-			status = "disabled";
 		};
 
 		pinctrl: pinctrl@11030000 {
-- 
2.25.1


