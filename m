Return-Path: <linux-renesas-soc+bounces-1756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3983A69F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 11:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE8D01C21A4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 10:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590021AAA9;
	Wed, 24 Jan 2024 10:21:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CFA19472;
	Wed, 24 Jan 2024 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091693; cv=none; b=EZxDo0vONyqERv9JAiLk4krn8cYpVK6VOxq94nRSxdyBNY713kPWwnPm2sR9I/DH/buQEzB4r4mihZj4RZmyO0Upspv1LTok1R778xvBrVaT+CrZyV0EjzQj91CJXCXWUz7Nr/j9BnnBe7c1aoK3QvciaJ3d5Vl+TD/GyWK0G3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091693; c=relaxed/simple;
	bh=LTUEp7JLeokvVlW0fptCkC8WRf3FTPmcDMu0z4OiVa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VQEdxG1khIh1oDpjfeGNMsZTukz8jrYUxL/6YMk1qXgKg8YRMQ5qGR01G7y1gAgaSH54j4ir7L1RBN3mB5KjKhT0gk74SWJLX/7J7mGgVx1EMjQAgiEU1JIuGhDCARCxszTxGC2wQ+ryZLyJrfYPS9nprjTcFsWq6bLLTBbdcs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="191560311"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jan 2024 19:21:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.243])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 918F340083C4;
	Wed, 24 Jan 2024 19:21:17 +0900 (JST)
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
Subject: [PATCH net-next v2 0/2] Add HW checksum offload support for RZ/G2L GbEthernet IP
Date: Wed, 24 Jan 2024 10:21:13 +0000
Message-Id: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series aims to add HW checksum offload supported by TOE module
found on the RZ/G2L Gb ethernet IP.

The TOE has hw support for calculating IP header and TCP/UDP/ICMP checksum
for both IPV4 and IPV6.

For Rx, the result of checksum calculation is attached to last 4byte
of ethernet frames. First 2bytes is result of IPV4 header checksum
and next 2 bytes is TCP/UDP/ICMP.

If frame does not have error "0000" attached to checksum calculation
result. For unsupported frames "ffff" is attached to checksum calculation
result. Cases like IPV6, IPV4 header is always set to "FFFF".

For Tx, the result of checksum calculation is set to the checksum field of
each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
frames, those fields are not changed. If a transmission frame is an UDP
frame of IPv4 and its checksum value in the UDP header field is H’0000,
TOE does not calculate checksum for UDP part of this frame as it is
optional function as per standards.

Add Tx/Rx checksum offload supported by TOE for IPV4 and TCP/UDP protocols.

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

v1->v2:
 * Updated covering letter and results
 * Fixed the sparse warnings for patch#1 by replacing __sum16->__wsum.

Note:
 This patches are tested with [1] without the CPU performance is not good 
 [1] https://lore.kernel.org/all/20240117190545.596057-1-vincent.guittot@linaro.org/

Biju Das (2):
  ravb: Add Rx checksum offload support
  ravb: Add Tx checksum offload support

 drivers/net/ethernet/renesas/ravb.h      |  35 ++++++
 drivers/net/ethernet/renesas/ravb_main.c | 137 ++++++++++++++++++++++-
 2 files changed, 170 insertions(+), 2 deletions(-)

-- 
2.25.1


