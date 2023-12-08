Return-Path: <linux-renesas-soc+bounces-842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A2809AD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 05:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B73381C20A5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 04:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7111C4C90;
	Fri,  8 Dec 2023 04:10:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE4F41712;
	Thu,  7 Dec 2023 20:10:38 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,259,1695654000"; 
   d="scan'208";a="185740749"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Dec 2023 13:10:37 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 56903415E8F2;
	Fri,  8 Dec 2023 13:10:37 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v5 0/9] net: rswitch: Add jumbo frames support
Date: Fri,  8 Dec 2023 13:10:21 +0900
Message-Id: <20231208041030.2497657-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is based on the latest net-next.git / main branch.

Changes from v4:
https://lore.kernel.org/all/20231207081246.1557582-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on the latest net-next.git / main branch.
 - Drop unnecessary change of Makefile in the patch 2/9.

Changes from v3:
https://lore.kernel.org/all/20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on the latest net-next.git / main branch.
 - Modify for code consistancy in the patch 3/9.
 - Add a condition in the patch 3/9.
 - Fix usage of dma_addr in the patch 8/9.

Changes from v2:
https://lore.kernel.org/all/20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on the latest net-next.git / main branch.
 - Fix using a variable in the patch 8/9.
 - Add Reviewed-by tag in the patch 1/9.

Yoshihiro Shimoda (9):
  net: rswitch: Drop unused argument/return value
  net: rswitch: Use unsigned int for desc related array index
  net: rswitch: Use build_skb() for RX
  net: rswitch: Add unmap_addrs instead of dma address in each desc
  net: rswitch: Add a setting ext descriptor function
  net: rswitch: Set GWMDNC register
  net: rswitch: Add jumbo frames handling for RX
  net: rswitch: Add jumbo frames handling for TX
  net: rswitch: Allow jumbo frames

 drivers/net/ethernet/renesas/rswitch.c | 377 +++++++++++++++++--------
 drivers/net/ethernet/renesas/rswitch.h |  43 ++-
 2 files changed, 295 insertions(+), 125 deletions(-)

-- 
2.25.1


