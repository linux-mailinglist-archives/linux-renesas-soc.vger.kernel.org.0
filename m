Return-Path: <linux-renesas-soc+bounces-479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C14F80032D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 06:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2839281586
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 05:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769508C17;
	Fri,  1 Dec 2023 05:47:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id BFA20170C;
	Thu, 30 Nov 2023 21:47:01 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,240,1695654000"; 
   d="scan'208";a="184959765"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2023 14:47:00 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3911B417F0F1;
	Fri,  1 Dec 2023 14:47:00 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v2 0/9] net: rswitch: Add jumbo frames support
Date: Fri,  1 Dec 2023 14:46:46 +0900
Message-Id: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is based on the latest net-next.git / main branch.

Changes from v1:
https://lore.kernel.org/all/20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on the latest net-next.git / main branch.
 - Fix commit descriptions (s/near the future/the near future/).

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

 drivers/net/ethernet/renesas/Makefile  |   1 -
 drivers/net/ethernet/renesas/rswitch.c | 374 +++++++++++++++++--------
 drivers/net/ethernet/renesas/rswitch.h |  43 ++-
 3 files changed, 293 insertions(+), 125 deletions(-)

-- 
2.34.1


