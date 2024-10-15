Return-Path: <linux-renesas-soc+bounces-9758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F599EDEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E461C1C23A47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801691FAF0A;
	Tue, 15 Oct 2024 13:37:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913C41C07DD;
	Tue, 15 Oct 2024 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999460; cv=none; b=dluPKKDt7Xoab4Qu92WjzJ96MXfTZ2FfXNLzp6mzk06KxBI/+e2KronnfcVinX2pczRRAXb7bZpNYFIBEYVHF2pOeCZICsSO8pYEX5+ZSh8HhvasHxpjQyJjMCmy4/CSB/ruW+mhtGYnJ/4kFJ4QRO1TgncebV60EB5ysmsrRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999460; c=relaxed/simple;
	bh=txyR+mA932jM1LipFmOg1u9e0+KitNu/lcqvX6Nf22M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CJQu+r0rP7haqQGFZfNLfBHO//E83Tiv6BuE2JGddOfFsVpNwdOJSMZ5cWXctgRc5cGkjUt8AciNvUHKUlnUWp3bKUu1rwKRcZyNgZRAvuZ+Keq9fneRJ/wqmjcA0bF56dRBJvTL4tPciyKY0ejiRYGxZwiTtleBZ20iOEQkUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="225980157"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2024 22:37:37 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F6D04005E3A;
	Tue, 15 Oct 2024 22:37:24 +0900 (JST)
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
Subject: [net-next PATCH v2 08/10] net: ravb: Enable IPv6 RX checksum offloading for GbEth
Date: Tue, 15 Oct 2024 14:36:32 +0100
Message-Id: <20241015133634.193-9-paul.barker.ct@bp.renesas.com>
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

The GbEth IP supports offloading IPv6 TCP, UDP & ICMPv6 checksums in the
RX path.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index a5b4f4fe77b1..e1e55e677215 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1014,7 +1014,8 @@ enum CSR2_BIT {
 	CSR2_RDHD	= 0x08000000,
 };
 
-#define CSR2_CSUM_ENABLE (CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4)
+#define CSR2_CSUM_ENABLE (CSR2_RTCP4 | CSR2_RUDP4 | CSR2_RICMP4 | \
+			  CSR2_RTCP6 | CSR2_RUDP6 | CSR2_RICMP6)
 
 #define DBAT_ENTRY_NUM	22
 #define RX_QUEUE_OFFSET	4
-- 
2.43.0


