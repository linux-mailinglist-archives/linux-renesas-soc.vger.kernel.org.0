Return-Path: <linux-renesas-soc+bounces-2417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5384C74C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 10:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79DAF1F221CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 09:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9590120B14;
	Wed,  7 Feb 2024 09:28:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F76522309;
	Wed,  7 Feb 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707298135; cv=none; b=dEDbnCNQCUlcvsci8urVlsLCHukW6Hy90Zv8mjfKmzvW+ZikvUdknjUEeEAaR4SmEXrOmr/f4ogq1lqDt6ssnVVX6gacpHU4xzDQW+2Ox7b1oE4gK3EeJdpTKYe/40l/aGBAEnFkXfj+VZikl5BQ9tIGOoAvvW4f2M+CwuMb3v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707298135; c=relaxed/simple;
	bh=H9olFn1CjXqG2xHdmCfKMcenbpktFbx6qs2BN8vgGV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VVwwYAL4A2/d7gMGs484WPhUj0pRVfSNQCcq44LLpF3zeQWY7br9DeftX1RrzfBJECvWv0ZGgW2wNN9ZX92PPKQTSfAj21Naw9pbyTMZmnyxZWy3vNsnMU24I8LEsjZf8nL2st3yHhsQLktEdKAL1kT1MS9k0ugwB+fbVGf01qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,250,1701097200"; 
   d="scan'208";a="197109700"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Feb 2024 18:28:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.232])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3380441B4127;
	Wed,  7 Feb 2024 18:28:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 net-next 0/2] Add HW checksum offload support for RZ/G2L GbEthernet IP
Date: Wed,  7 Feb 2024 09:28:36 +0000
Message-Id: <20240207092838.160627-1-biju.das.jz@bp.renesas.com>
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

v4->v5:
 * Updated comment related to TOE register in enum ravb_reg.
 * Dropped CSR{1,2}_ALL from enum CSR{1,2}_BIT.
 * Removed setting unnecessary bits in CSR{1,2}.
v3->v4:
 * Add separate section for RZ/G2L TOE registers in enum ravb_reg.
 * Dropped enabling IPv6 specific bits in CSR2.
 * The comment "csum" expanded to "checksum" in ravb_rx_csum_gbeth().
 * Dropped unnecessary comment "Hardware validated our checksum".
 * Dropped reading CSR0 register in ravb_endisable_csum_gbeth().
 * Restored NETIF_F_HW_CSUM and associated changes.
 * Dropped enabling IPv6 specific bits in CSR1.
 * Dropped enabling ICMPv4 specific bit and associated handling as linux
   does not support it.
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

Biju Das (2):
  ravb: Add Rx checksum offload support for GbEth
  ravb: Add Tx checksum offload support for GbEth

 drivers/net/ethernet/renesas/ravb.h      |  34 +++++-
 drivers/net/ethernet/renesas/ravb_main.c | 149 ++++++++++++++++++++++-
 2 files changed, 179 insertions(+), 4 deletions(-)

-- 
2.25.1


