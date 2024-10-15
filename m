Return-Path: <linux-renesas-soc+bounces-9756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EA499EDE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B43D01F253B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484AF1F8911;
	Tue, 15 Oct 2024 13:37:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A83E1C07DD;
	Tue, 15 Oct 2024 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999450; cv=none; b=qXVFOugcBZ03g/1o8TDZbLiwdnGDR+5S8dp951pf6BXJEcG3oJir+GzPUaeiwgSMjImOB6GlucwadlQHT4KwSFmtMmKEuY1SK38HTI8cHL5zx2U+BoTgdLoXsFPMhMI9nqebzT3KYvt6qSeryFDp+RDvZZ58hwuNgXlPmMHVQHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999450; c=relaxed/simple;
	bh=+1CORkNEcU+tbqU4x8sfFFTSsiVLKAyf4utwrlBY780=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tW+7+LBTrHHrFjzTXeGW5AAQ7SdpJRAJSDqgrpLh1bFu1Ww6LuvtjYdABOv0gDDXSM7N+/MndHpxDzX5a/uvMPAm48k4tAh5gmk9Di7AcX0CkJL/UEabH3/A8f7cHU4BJn2sNtyi0hqlEPBySe1K9uIEufeQtUEr90ybSjD3Uac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="221998698"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:28 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E0D1940031EA;
	Tue, 15 Oct 2024 22:37:14 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v2 06/10] net: ravb: Disable IP header TX checksum offloading
Date: Tue, 15 Oct 2024 14:36:30 +0100
Message-Id: <20241015133634.193-7-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241015133634.193-1-paul.barker.ct@bp.renesas.com>
References: <20241015133634.193-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For IPv4 packets, the header checksum will always be calculated in software
in the TX path (Documentation/networking/checksum-offloads.rst says "No
offloading of the IP header checksum is performed; it is always done in
software.") so there is no advantage in asking the hardware to also
calculate this checksum.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 98496aa39f3d..a5b4f4fe77b1 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -998,7 +998,7 @@ enum CSR1_BIT {
 	CSR1_TDHD	= 0x08000000,
 };
 
-#define CSR1_CSUM_ENABLE (CSR1_TIP4 | CSR1_TTCP4 | CSR1_TUDP4)
+#define CSR1_CSUM_ENABLE (CSR1_TTCP4 | CSR1_TUDP4)
 
 enum CSR2_BIT {
 	CSR2_RIP4	= 0x00000001,
-- 
2.43.0


