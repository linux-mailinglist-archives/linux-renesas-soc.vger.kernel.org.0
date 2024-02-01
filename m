Return-Path: <linux-renesas-soc+bounces-2236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 127E3846141
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 20:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C224C292D36
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 19:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354C48527B;
	Thu,  1 Feb 2024 19:45:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2947512FB04;
	Thu,  1 Feb 2024 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706816739; cv=none; b=nJ+gJcbbMMP0LC3KPFHb7xmNpXw+U3EZz3BYtW6dzr7S+Yve4w1hU8vkNT1BYyYOKfsxKfvb+JMAqFD3zOa0I2C3EgrPOaAYgNC83JZIZBmzZMEyWHK00MI0QY2+fNEht2+gn5yIJmkrE1OuAyRJ2CYYUkFGI/rZygv7B7J62uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706816739; c=relaxed/simple;
	bh=iJaro99ft/rn9D29nCEh9feu3ZBlTXcz75nD6N1enaw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZtNEmxToni3ufjAtIrGszKqOWbFXuQegDQnHnPuyJ82WmAK8ylJ46B78hgwtWquS4b+p7+HKz1Kw5znSIQSc7qlI+RAZIyzxMdk4Fwz80qe8ZoszS9I5LUsEh6bHI7GdBgZtjji7qZYq+sRHPcSWCeTk2RASc8WeL++vEh3fiW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="196462669"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Feb 2024 04:45:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5DE6340741B5;
	Fri,  2 Feb 2024 04:45:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	peterz@infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 net-next 0/2] Add HW checksum offload support for RZ/G2L GbEthernet IP
Date: Thu,  1 Feb 2024 19:45:19 +0000
Message-Id: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to add HW checksum offload supported by TOE module
found on the RZ/G2L Gb ethernet IP.

TOE has hardware support for calculating IP header and TCP/UDP/ICMP
checksum for both IPv4 and IPv6.

For Rx, the 4-byte result of checksum calculation is attached to the
Ethernet frames.First 2-bytes is result of IPv4 header checksum and next
2-bytes is TCP/UDP/ICMP checksum.

If a frame does not have checksum error, 0x0000 is attached as checksum
calculation result. For unsupported frames 0xFFFF is attached as checksum
calculation result. In case of an IPv6 packet, IPv4 checksum is always set
to 0xFFFF.

For Tx, the result of checksum calculation is set to the checksum field of
each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
frames, those fields are not changed. If a transmission frame is an UDPv4
frame and its checksum value in the UDP header field is 0x0000, TOE does
not calculate checksum for UDP part of this frame as it is optional
function as per standards.

Add Tx/Rx checksum offload supported by TOE for IPv4 and TCP/UDP protocols.

Results of iperf3 in Mbps

RZ/V2L:
TCP(Tx/Rx) results with checksum offload Enabled:	{921,932}
TCP(Tx/Rx) results with checksum offload Disabled:	{867,612}

UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
UDP(Tx/Rx) results with checksum offload Disabled:	{952,920}

RZ/G2L:
TCP(Tx/Rx) results with checksum offload Enabled:	{920,936}
TCP(Tx/Rx) results with checksum offload Disabled:	{871,626}

UDP(Tx/Rx) results with checksum offload Enabled:	{953,950}
UDP(Tx/Rx) results with checksum offload Disabled:	{954,920}

RZ/G2LC:
TCP(Tx/Rx) results with checksum offload Enabled:	{927,936}
TCP(Tx/Rx) results with checksum offload Disabled:	{889,626}

UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
UDP(Tx/Rx) results with checksum offload Disabled:	{949,944}

v2->v3:
 * Updated commit header and description as suggested by Sergey for cover letter,
 * patch#1 and patch#2.
 * Dropped TOE_RX_CSUM_OK macro.
 * Renamed ravb_csum_offload_init_gbeth()->ravb_csum_init_gbeth().
 * Moved enabling {RPE,TPE} in ravb_csum_init_gbeth().
 * Updated the error message in ravb_csum_init_gbeth() as
   "Timeout enabling hardware checksum"
 * Introduced ravb_endisable_csum_gbeth() for enabling/disabling CSR{1,2} registers.
 * Replaced NETIF_F_IP_CSUM->NETIF_F_HW_CSUM as we are supporting only IPv4.
 * Updated the comment related to UDP header field.
 * Renamed ravb_is_tx_checksum_offload_gbeth_possible()->ravb_is_tx_csum_gbeth().
v1->v2:
 * Updated covering letter and results
 * Fixed the sparse warnings for patch#1 by replacing __sum16->__wsum.

Note:
 This patches are tested with [1]. Without the patch [1] CPU performance is
 not good which impacts the network throughput.
 [1] https://lore.kernel.org/all/20240117190545.596057-1-vincent.guittot@linaro.org/

Biju Das (2):
  ravb: Add Rx checksum offload support for GbEth
  ravb: Add Tx checksum offload support for GbEth

 drivers/net/ethernet/renesas/ravb.h      |  32 +++++
 drivers/net/ethernet/renesas/ravb_main.c | 149 ++++++++++++++++++++++-
 2 files changed, 178 insertions(+), 3 deletions(-)

-- 
2.25.1


