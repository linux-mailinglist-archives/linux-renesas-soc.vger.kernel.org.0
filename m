Return-Path: <linux-renesas-soc+bounces-9750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 941DC99EDCE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 15:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6E31F24C80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092E31B21A1;
	Tue, 15 Oct 2024 13:37:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4401B2186;
	Tue, 15 Oct 2024 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728999422; cv=none; b=A7H2YSZXN8uSIGa2/Ssth9AvbjIKkhbmAmys2Bn3QF0nA/se9fDdRQ/muioU4v3mew4tmWClpopHEvOe+SQEncD+4gC/mKPVjowmDfWswUPKo92hrEsE6lY/Nbwz1JJaMjhhrs5ThRYnbh9f+aXGMrroWwTnfwpQEs1/VE8pQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728999422; c=relaxed/simple;
	bh=P3L57nX+ko8t5TS/eBuVpC/lpxOJcUmp6kjrLXmEMHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G85aP61rNpXx30ieO4IsL1H/vMOi+dPJdf2Tcb+dUqijLYkEwQ1HaFtvsqzOHRxtPqH7DBdoUkNlruK+qf2z4Y3syhpnZk4brieOptzrZRFLQN+gr/tzl0dLu3xqRFpL0QXgiACLCiqTTk2XN57ypiYH8EV/kVBuvzu1cgjo4uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,205,1725289200"; 
   d="scan'208";a="225980117"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2024 22:36:53 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.176])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7C2E04007529;
	Tue, 15 Oct 2024 22:36:46 +0900 (JST)
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
Subject: [net-next PATCH v2 00/10] Extend GbEth checksum offload support to VLAN/IPv6 packets
Date: Tue, 15 Oct 2024 14:36:24 +0100
Message-Id: <20241015133634.193-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GbEth IP found in Renesas RZ/G2L, RZ/G3S and related SoCs supports
hardware checksum offload for packets in the following cases:

 - there are zero or one VLAN headers with TPID=0x8100
 - the network protocol is IPv4 or IPv6
 - the transport protocol is TCP, UDP or ICMP
 - the packet is not fragmented 

To complete the support for all these cases in the ravb driver, we need
to add handling for VLAN-tagged packets and IPv6 packets in both the TX
and RX code paths. Handling for ICMP packets in the TX path is not added
as it cannot currently be tested.

These patches also do some refactoring/tidy-up, drop unnecessary checks
from performance sensitive code paths and disable unnecessary IP header
checksum offloading.

Changes v1->v2:
  - Use get_unaligned() to access hw_csum in ravb_rx_csum_gbeth().
  - Dropped patch "Support ICMP TX checksum offload for GbEth" and
    simplified TX checksum offload path.
  - Moved last_frag into if condition in ravb_can_tx_csum_gbeth().
  - Dropped unnecessary check for skb->vlan_proto in
    ravb_can_tx_csum_gbeth().
  - s/HW/hardware/ in "Simplify types in RX csum validation" commit
    message.
  - s/null/zero/ in "Simplify UDP TX checksum offload" commit message.
  - Specified TX/RX direction in "Enable IPv6 TX/RX checksum offloading
    for GbEth" commit messages.
  - Dropped unnecessary whitespace.
  - Added Sergey's Reviewed-by tags.

Paul Barker (10):
  net: ravb: Factor out checksum offload enable bits
  net: ravb: Disable IP header RX checksum offloading
  net: ravb: Drop IP protocol check from RX csum verification
  net: ravb: Combine if conditions in RX csum validation
  net: ravb: Simplify types in RX csum validation
  net: ravb: Disable IP header TX checksum offloading
  net: ravb: Simplify UDP TX checksum offload
  net: ravb: Enable IPv6 RX checksum offloading for GbEth
  net: ravb: Enable IPv6 TX checksum offload for GbEth
  net: ravb: Add VLAN checksum support

 drivers/net/ethernet/renesas/ravb.h      |   6 ++
 drivers/net/ethernet/renesas/ravb_main.c | 101 ++++++++++++-----------
 2 files changed, 61 insertions(+), 46 deletions(-)

-- 
2.43.0


