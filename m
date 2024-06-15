Return-Path: <linux-renesas-soc+bounces-6274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A5890979E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 12:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F041D1F219AC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Jun 2024 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9873821340;
	Sat, 15 Jun 2024 10:30:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6384012B71;
	Sat, 15 Jun 2024 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718447453; cv=none; b=SVdqRBjBsSvVrKHFBI0CM1Ny6pwY59ElIxUYQe5KYyUogjF1zNOQy/KhAeJiugC3UIq+QVxLqDn3cQ+cK9sqrGYb5AkGMMok0F5QFZai8mULuKnP7fmxgPs5PglvQZmgw4hERWUVA+VwUeIGTvleBclsM5WQt/q7m4H519A2+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718447453; c=relaxed/simple;
	bh=/QTqkDIUIoqmFannI1bKDDiuqqyIYMJ1Yn8pBNx5fGY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mx1aG85J5+9pXRvEY4BHABFvcnhqD7ImWeWJuP3B/LNrzehaMdYFHmZb3Xd1gC8K6MQCtp2AbVfxDMhGAuuaH336wZ44QjgtLZGkqlyOOi9HqMuJoWNUg9vk79hdz4eOk+S3qlqV6oqJ+fXUfxxjs3A7UM1gWL5g99nRoruteqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,240,1712588400"; 
   d="scan'208";a="208029880"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Jun 2024 19:30:48 +0900
Received: from renesas-deb12.mshome.net (unknown [10.226.92.58])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DBF1B40071E2;
	Sat, 15 Jun 2024 19:30:43 +0900 (JST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH 0/2] Fix maximum TX/RX frame sizes in ravb driver
Date: Sat, 15 Jun 2024 11:30:36 +0100
Message-Id: <20240615103038.973-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches fix a couple of bugs in the maximum supported TX/RX frame sizes
in the ravb driver.

  * For the GbEth IP, we were advertising a maximum TX frame size/MTU that was
    larger that the maximum the hardware can transmit.

  * For the R-Car AVB IP, we were unnecessarily setting the maximum RX frame
    size/MRU based on the MTU, which by default is smaller than the maximum the
    hardware can receive.

Paul Barker (2):
  net: ravb: Fix maximum MTU for GbEth devices
  net: ravb: Set R-Car RX frame size limit correctly

 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)


base-commit: 934c29999b57b835d65442da6f741d5e27f3b584
-- 
2.39.2


