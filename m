Return-Path: <linux-renesas-soc+bounces-1723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F45839277
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 16:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6737328BC24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F8E5FDA5;
	Tue, 23 Jan 2024 15:19:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9351604A2;
	Tue, 23 Jan 2024 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023175; cv=none; b=pfiwr6HBElK7k544B8siFgPTKgR7RmM9AmGC3t6qkI+5XkipJ4lSyg6P17QRuYxpFCJhMClwll2eRDNDmx15OQjI7Phe96zFxi6GrYmwgWRa7iEKjE/nXaQCb9aejZvhlPH9tSnDqBASSo+vKEC2MiHhrMh3p1GF4fYoCxAx8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023175; c=relaxed/simple;
	bh=+yJL9KDj0aMIFbT4y6ud2q83ukmRwjDWwnHtE9ShxMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JT2Cved2s1Z1h28lzSD1k1hSBO8734gEEe4KgvgAl7xUUpNWyaunkhvw1J0HS6eNizXEb15QbsQ2lvWKRjHE5C/LVWS7AMofmdE5WdHWhJOEntshJvt5BCOo63KI+mynKTAxetCx4TqdjqgRRYQwuzicS9ZMjoteYF3P5ewRt6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195354997"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jan 2024 00:19:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ECB4E400CEED;
	Wed, 24 Jan 2024 00:19:26 +0900 (JST)
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
Subject: [PATCH net-next 0/2] Add HW check sum of load for RZ/G2L GbEthernet IP
Date: Tue, 23 Jan 2024 15:19:22 +0000
Message-Id: <20240123151924.373917-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

TOE has hw support for calculating IP header and TCP/UDP/ICMP checksum
for both IPV4 and IPV6.

Add Tx/Rx checksum offload supported by TOE for IPV4 and TCP/UDP protocols.

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

UDP(Tx/Rx) results With check Enabled: 909/946
UDP(Tx/Rx) results With check Disabled: 903/907

TCP(Tx/Rx) results With check Enabled: 922/928
TCP(Tx/Rx) results With check Disabled: 882/629

Note:
 This patches are tested with reverting 
commit b3edde44e5d4 ("cpufreq/schedutil: Use a fixed reference frequency")
as it impacts network performance.

Biju Das (2):
  ravb: Add Rx checksum offload support
  ravb: Add Tx checksum offload support

 drivers/net/ethernet/renesas/ravb.h      |  35 ++++++
 drivers/net/ethernet/renesas/ravb_main.c | 137 ++++++++++++++++++++++-
 2 files changed, 170 insertions(+), 2 deletions(-)

-- 
2.25.1


