Return-Path: <linux-renesas-soc+bounces-9220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68998A96E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BF0D2865A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D53193071;
	Mon, 30 Sep 2024 16:09:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3334C19047D;
	Mon, 30 Sep 2024 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712583; cv=none; b=u5WBtdxZPfnx2l88Y1/Qrlt9tvPNqjoorzPcZuDxzVRn9fUSnGJvwE1x7NOwRqV4fn5gG7/ygp0ZC8PtRrIlXq4W5ivqOqp3qRdqztQj5BMRm0tpROBlcAyVpUSkpoCUfEmJbDsemsAggZAKByn35+dd8LDexlVOs+c1Pgcio4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712583; c=relaxed/simple;
	bh=9A8YkDTOwfteqY8P70Wmc2cQJanzyPRjU8BzLWsDmk0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MzNXzeuOWGWkiLaBudqN6blCqbkLDNTx6RKCTfzzW95f6Nc+f9ndzkj/ddBNgSE4dWjK9Q9f5+QMrmO3hWFguKdqBlp4/T4EdMldE6OcyRE750/e70rWTQKa1O6oLepvXdPNl5FcQotYIwbgGv3IxVWDsXSZRKYpz80FT6NaRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="224347970"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:41 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7E7D94014DD7;
	Tue,  1 Oct 2024 01:09:26 +0900 (JST)
From: Paul Barker <paul@pbarker.dev>
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
Subject: [net-next PATCH 06/11] net: ravb: Disable IP header TX checksum offloading
Date: Mon, 30 Sep 2024 17:08:40 +0100
Message-Id: <20240930160845.8520-7-paul@pbarker.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930160845.8520-1-paul@pbarker.dev>
References: <20240930160845.8520-1-paul@pbarker.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

For IPv4 packets, the header checksum will always be calculated in software
in the TX path (Documentation/networking/checksum-offloads.rst says "No
offloading of the IP header checksum is performed; it is always done in
software.") so there is no advantage in asking the hardware to also
calculate this checksum.

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


