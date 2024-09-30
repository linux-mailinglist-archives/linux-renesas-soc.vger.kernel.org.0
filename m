Return-Path: <linux-renesas-soc+bounces-9213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D298A958
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2197F1C2042F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D11190482;
	Mon, 30 Sep 2024 16:09:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE51235894;
	Mon, 30 Sep 2024 16:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712556; cv=none; b=F+rlRmyTLWY5g127/BHFyZc9pIVqPHMk4nd3ww2mEVfNtGd9+1O8ZUeJBwrrpuN3sgUYcMQ+GKuYVVvNoZlbFZCH2ipYvCmCdJanltpn2Q7P0ubSkC0AiK9lF40Pg13m77audRX60crFdPegCQhB0gJQqYimz1CSWMwxVmN1HQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712556; c=relaxed/simple;
	bh=FyK/Mzd+tY6qVJFWXiALuT8RBko0XuRXwKjMSp2eVy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m/SD29gYUxaTmAqxqX6x/D746n1Jhgp5c8zUpOFuYw0yQBU5Bwz4Kt0abDLWJb6Ek3U7Nd1kAAa+XdkdeXkiX8dLHytCpaJ6N0b+LOz1hxhI3uKV0Oz0pIzU5Q0w/zSRxP/5U3k8dh4uSzbIbjMuyo7dfGCBURi+/5zZzSL3E34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="220371929"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:12 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B37674014DA5;
	Tue,  1 Oct 2024 01:08:57 +0900 (JST)
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
Subject: [net-next PATCH 00/11] Extend GbEth checksum offload support to VLAN/IPv6 packets
Date: Mon, 30 Sep 2024 17:08:34 +0100
Message-Id: <20240930160845.8520-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

The GbEth IP found in Renesas RZ/G2L, RZ/G3S and related SoCs supports
hardware checksum offload for packets in the following cases:

 - there are zero or one VLAN headers with TPID=0x8100
 - the network protocol is IPv4 or IPv6
 - the transport protocol is TCP, UDP or ICMP
 - the packet is not fragmented 

To complete the support for all these cases in the ravb driver, we need
to add handling for ICMP packets, VLAN-tagged packets and IPv6 packets
in both the TX and RX code paths.

These patches also do some refactoring/tidy-up, drop unnecessary checks
from performance sensitive code paths and disable unnecessary IP header
checksum offloading.

Paul Barker (11):
  net: ravb: Factor out checksum offload enable bits
  net: ravb: Disable IP header RX checksum offloading
  net: ravb: Drop IP protocol check from RX csum verification
  net: ravb: Combine if conditions in RX csum validation
  net: ravb: Simplify types in RX csum validation
  net: ravb: Disable IP header TX checksum offloading
  net: ravb: Simplify UDP TX checksum offload
  net: ravb: Support ICMP TX checksum offload for GbEth
  net: ravb: Enable IPv6 RX checksum offloading for GbEth
  net: ravb: Enable IPv6 TX checksum offload for GbEth
  net: ravb: Add VLAN checksum support

 drivers/net/ethernet/renesas/ravb.h      |   7 ++
 drivers/net/ethernet/renesas/ravb_main.c | 108 +++++++++++++----------
 2 files changed, 68 insertions(+), 47 deletions(-)

-- 
2.43.0


