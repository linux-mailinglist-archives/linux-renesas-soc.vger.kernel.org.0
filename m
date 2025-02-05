Return-Path: <linux-renesas-soc+bounces-12865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3DA28A88
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 13:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C5081888847
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 12:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2B022D4DF;
	Wed,  5 Feb 2025 12:42:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7909E22CBCB;
	Wed,  5 Feb 2025 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759376; cv=none; b=V8VduFdHZcxdRbufE9SDc3+/PUQQhi/NCpDL7E7I/OcYzJlpM7RPvEFnGoZFdEhHOCOy8z6gjpo7MSUS0yTYF273m1EwzNgNvElCcuwhDuIeKytWJxISA5sEMkkSOl90YKTw5XuXcmLxn6Oj0q4UIYOPN73N4ibvfsorPK5EGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759376; c=relaxed/simple;
	bh=Y+PbL3g5MHWDusedvGVDe9KvRFajozz29XVsuVVdSl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ckIGqqKROtHM0Joam5tKGJkG/H/oQbpsiP4Y0tlv8hHmwGCZI1rJXU8gtEz9zJchv208re1NRFSSl9fPa4RWXlKOT3RbFTvD7kVRz0UPTJxjTyZreRq48y+oQ/y5EfQ4HYw2o5/Ub27eNjmiq7z2zlImXUNx2v653bpty54ZuuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZYBSvqR2SPypyda14ZjJqg==
X-CSE-MsgGUID: iVy0GdVoTqan1oKXy0U8xA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:42:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 268DD41F8497;
	Wed,  5 Feb 2025 21:42:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v2 0/7] Add of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:20 +0000
Message-ID: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are lot of net drivers using of_get_child_by_name() followed by
of_device_is_available() to find the available child node by name for a
given parent. Provide a helper for these users to simplify the code.

v1->v2:
 * Make it as a series as per [1] to cover the dependency.
 * Added Rb tag from Rob for patch#1 and this patch can be merged through
   net as it is the main user.
 * Updated all the patches with patch suffix net-next
 * Dropped _free() usage.
 
[1]
https://lore.kernel.org/all/CAL_JsqLo4uSGYMcLXN=0iSUMHdW8RaGCY+o8ThQHq3_eUTV9wQ@mail.gmail.com/

 
Biju Das (7):
  of: base: Add of_get_available_child_by_name()
  net: dsa: rzn1_a5psw: Use of_get_available_child_by_name()
  net: dsa: sja1105: Use of_get_available_child_by_name()
  net: ethernet: mtk-star-emac: Use of_get_available_child_by_name()
  net: ethernet: mtk_eth_soc: Use of_get_available_child_by_name()
  net: ethernet: actions: Use of_get_available_child_by_name()
  net: ibm: emac: Use of_get_available_child_by_name()

 drivers/net/dsa/rzn1_a5psw.c                  |  8 +++---
 drivers/net/dsa/sja1105/sja1105_mdio.c        |  6 +----
 drivers/net/ethernet/actions/owl-emac.c       |  7 +----
 drivers/net/ethernet/ibm/emac/core.c          |  7 +----
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  7 +----
 drivers/net/ethernet/mediatek/mtk_star_emac.c |  7 +----
 drivers/of/base.c                             | 27 +++++++++++++++++++
 include/linux/of.h                            |  9 +++++++
 8 files changed, 44 insertions(+), 34 deletions(-)

-- 
2.43.0


