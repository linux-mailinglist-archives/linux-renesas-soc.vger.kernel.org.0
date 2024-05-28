Return-Path: <linux-renesas-soc+bounces-5546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD88D1F97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 17:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D0A1F242C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 15:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE3617106D;
	Tue, 28 May 2024 15:03:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DDA17084F;
	Tue, 28 May 2024 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908639; cv=none; b=phnep9cKzLemFFSJsBfnynU23LcwXdhIVtRn4auZrFBIvqfR29wKg19JOjpPtqPukSnNpmM+dyA18Hvkq0NAKtt9SvsbCaaHH3eXpzi9gJlTc5bLBAmXN37BLiRjqJxdTa1kzChxaX1MLXNTWo9gdKcWdWDqKe5MK1Hs3Mf213o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908639; c=relaxed/simple;
	bh=IqXn63ATSMk8dqT8udNaBaPif6MJcisz7HDxf9hrH4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OvVh9AhqlBcuijCeFOs5qxGdpPNuvuxWYFS2tPhOr/BauNCXX/et+FbkUGESSD5Eoo7qQreEetw08A8qYYdUHsx+WLq4WvUbCpqkdCmMvh+LeT3/nhwyAt+z3sn7DBcQI234Spgd61iPaGc9KCs+6B8qw/OCtFJpPkED4OWz+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,195,1712588400"; 
   d="scan'208";a="205944517"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 May 2024 00:03:49 +0900
Received: from renesas-deb12.cephei.uk (unknown [10.226.93.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7FB73400CF19;
	Wed, 29 May 2024 00:03:44 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v4 0/7] Improve GbEth performance on Renesas RZ/G2L and related SoCs
Date: Tue, 28 May 2024 16:03:32 +0100
Message-Id: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series aims to improve performance of the GbEth IP in the Renesas
RZ/G2L SoC family and the RZ/G3S SoC, which use the ravb driver. Along
the way, we do some refactoring and ensure that napi_complete_done() is
used in accordance with the NAPI documentation for both GbEth and R-Car
code paths.

Much of the performance improvement comes from enabling SW IRQ
Coalescing for all SoCs using the GbEth IP, and NAPI Threaded mode for
single core SoCs using the GbEth IP. These can be enabled/disabled at
runtime via sysfs, but our goal is to set sensible defaults which get
good performance on the affected SoCs.

The rest of the performance improvement comes from using a page pool to
allocate RX buffers, and reducing the allocation size from >8kB to 2kB.

The overall performance impact of this patch series seen in testing with
iperf3 is as follows (see patches 5-7 for more detailed results):
  * RZ/G2L:
    * TCP TX: +1.8% bandwidth
    * TCP RX: +1% bandwidth at 47% less CPU load
    * UDP RX: +1% bandwidth at 26% less CPU load

  * RZ/G2UL:
    * TCP TX: +37% bandwidth
    * TCP RX: +43% bandwidth
    * UDP TX: -8% bandwidth
    * UDP RX: +32500% bandwidth (!)

  * RZ/G3S:
    * TCP TX: +25% bandwidth
    * TCP RX: +76% bandwidth
    * UDP TX: -9% bandwidth
    * UDP RX: +37900% bandwidth (!)

  * RZ/Five:
    * TCP TX: +18% bandwidth
    * TCP RX: +212% bandwidth
    * UDP TX: +2% bandwidth
    * UDP RX: +inf bandwidth (test no longer crashes)

There is no significant impact on bandwidth or CPU load in testing on
RZ/G2H or R-Car M3N.

Fixing the crash in UDP RX testing for RZ/Five is a cumulative effect of
patches 1, 2, 5 & 6 so this is very difficult to break out as a bugfix
for backporting.

Changes v3->v4:
  * Dependency patches have merged so this is no longer an RFC.
  * Fixed update of stats->rx_packets.
  * Simplified refactoring following feedback from Niklas and Sergey.
  * Renamed needs_irq_coalesce -> coalesce_irqs.
  * Used a separate page pool for each RX queue.
  * Passed struct ravb_rx_desc to ravb_alloc_rx_buffer() so that we can
    simplify the calling function.
  * Explained the calculation of rx_desc->ds_cc.
  * Added handling of nonlinear SKBs in ravb_rx_csum_gbeth().
  * Used Niklas' suggested commit message for patch 2/7.
  * Added Sergey's Reviewed-by tags to patches 5/7 and 6/7.

Changes v2->v3:
  * Incorporated feedback on RFC v2 from Sergey.
  * Split out bugfixes and rebased. This changed the order of what was
    the first 5 patches of v2 and things look a little different so I've
    not picked up Reviewed-by tags from v2.
  * Further refactoring and tidy up of RX ring refill and
    ravb_rx_gbeth().
  * Switched to using a page pool to allocate RX buffers.
  * Re-tested and provided updated performance figures.

Changes v1->v2:
  * Marked as RFC as the series depends on unmerged patches.
  * Refactored R-Car code paths as well as GbEth code paths.
  * Updated references to the patches this series depends on.

Paul Barker (7):
  net: ravb: Simplify poll & receive functions
  net: ravb: Consider busypolling status when re-enabling interrupts
  net: ravb: Refactor RX ring refill
  net: ravb: Refactor GbEth RX code path
  net: ravb: Enable SW IRQ Coalescing for GbEth
  net: ravb: Use NAPI threaded mode on 1-core CPUs with GbEth IP
  net: ravb: Allocate RX buffers via page pool

 drivers/net/ethernet/renesas/ravb.h      |  13 +-
 drivers/net/ethernet/renesas/ravb_main.c | 459 ++++++++++++-----------
 2 files changed, 247 insertions(+), 225 deletions(-)


base-commit: 5233a55a5254ea38dcdd8d836a0f9ee886c3df51
-- 
2.39.2


