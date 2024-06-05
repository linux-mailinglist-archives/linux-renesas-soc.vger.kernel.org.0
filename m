Return-Path: <linux-renesas-soc+bounces-5884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC78FD22B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 17:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1478B281263
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 15:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B9745005;
	Wed,  5 Jun 2024 15:57:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2B73B298
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Jun 2024 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717603055; cv=none; b=IPslEwXE1NGk8ztfcla4uK36Gf0whHluy0KWWsoBOZlaLXJe97CKBWXCUrvUq4rf2tk5HrBnq/W9XA5syc9uGOiIm84dd/qwF9NVHPbAGvk69J5+k8eNbN4t95u20KByAR9LBGrcgMlJh08WGxJFZt4rw2WrpJ/mKbZlpNh5EnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717603055; c=relaxed/simple;
	bh=D3FJyp1NUydndWgS1GEZOOAcv0RD/h8Va87InHXawd0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KTiXq1jCCkZATs+YCNJC5qMCRCK1ZvRSB1HPZ42iqODhyYRmxMSFit0Oz/1hpFevhcO7vHsqofKphAmnTQaYlI+z7+UICHS4F9zhJhi10xz1BfYWUoiput0T1slVmsjny3EgpEZKc3digwXpowV3xjJii9N06F0OoZxQq7gW2EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,217,1712588400"; 
   d="scan'208";a="206833191"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Jun 2024 00:57:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.154])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C21944008C4F;
	Thu,  6 Jun 2024 00:57:29 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Create entry for Renesas RZ/G2L TSU thermal drivers
Date: Wed,  5 Jun 2024 16:57:26 +0100
Message-Id: <20240605155726.264004-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create entry for Renesas RZ/G2L TSU thermal drivers and add my self as a
maintainer.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 332f452645d6..6deeae42a3d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19112,6 +19112,13 @@ F:	Documentation/devicetree/bindings/thermal/rcar-thermal.yaml
 F:	drivers/thermal/renesas/rcar_gen3_thermal.c
 F:	drivers/thermal/renesas/rcar_thermal.c
 
+RENESAS RZ/G2L TSU THERMAL DRIVERS
+M:	Biju Das <biju.das.jz@bp.renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
+F:	drivers/thermal/renesas/rzg2l_thermal.c
+
 RENESAS RIIC DRIVER
 M:	Chris Brandt <chris.brandt@renesas.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.25.1


