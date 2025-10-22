Return-Path: <linux-renesas-soc+bounces-23422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9ECBFB71B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D987C563238
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 10:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8D4328601;
	Wed, 22 Oct 2025 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h0XqAQ2v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC5325489
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 10:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130163; cv=none; b=a+NIF10os1SUeA7JQKfKIleZCvlhZ6NWB1vyFnKE4Dwa5z6qI3nJFF20jpsPba4S4bfpNWVNIS+jl5v8a5wP9LmejctfPxioRDZ/gVN4dNdlijzePqyppkpE5XAN4DUJc1Yqjv3LhbXuWnN3dJlGBRtrkn5GtrR2kMwYs4EtGOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130163; c=relaxed/simple;
	bh=J26Z9D1vT4AHlG+7HePuGaJBpStTnOVExBXnz/HFoT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fgTYPaxS2ue8j4VI2orYjsUB8TtGwW6T1OKq6CQ3Fi1B994tuFhWTM0Jg6GWJslEAitW9Gvmc6QpyMtaXudAg5+Eo5Tv81VDqhNJZDJoHoFjPQJBwbgNs9CG0aBqX0lyFQ+LZBKO7RNvL76edEW+peXZIr/Bj6dlTtZYbgja7VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h0XqAQ2v; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761130155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WJxY2mOEgsL6GRvP8mJCFMLO+Hk8CymaXvBDnFqEOyk=;
	b=h0XqAQ2vfdtj0smaatDuQZgDwA7aHqUVLwFXQEOeDJ7Zr9EeKnxqc8TOF80zCrtvWnWqQO
	4/5wgPHpiU65bx41D9QNqasO4HI3ZV/0Oq073wU+2i3Vp4M/y+fcz/YFRoiIfASTBBZgVv
	KmPp/hiaFOX18x8K6V2gFi0WAwVrkLY=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	netdev@vger.kernel.org,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [PATCH net-next v4 0/6] convert net drivers to ndo_hwtstamp API part 2
Date: Wed, 22 Oct 2025 10:48:54 +0000
Message-ID: <20251022104900.901973-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This is part 2 of patchset to convert drivers which support HW 
timestamping to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
The new API uses netlink to communicate with user-space and have some
test coverage.

v3 -> v4:
 fix commit message in patch 6
v2 -> v3:
 use NL_SET_ERR_MSG_MOD() variant to report errors back to user-space
v1 -> v2: 
 hns3: actually set up new ndo callbacks
 ionic: remove _lif_ portion from name to align with other ndo callbacks


Vadim Fedorenko (6):
  octeontx2: convert to ndo_hwtstamp API
  mlx4: convert to ndo_hwtstamp API
  ionic: convert to ndo_hwtstamp API
  net: ravb: convert to ndo_hwtstamp API
  net: renesas: rswitch: convert to ndo_hwtstamp API
  net: hns3: add hwtstamp_get/hwtstamp_set ops

 drivers/net/ethernet/hisilicon/hns3/hnae3.h   |  5 ++
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   | 31 ++++++++++
 .../hisilicon/hns3/hns3pf/hclge_main.c        | 13 ++--
 .../hisilicon/hns3/hns3pf/hclge_ptp.c         | 32 +++++-----
 .../hisilicon/hns3/hns3pf/hclge_ptp.h         |  9 ++-
 .../marvell/octeontx2/nic/otx2_common.h       |  9 ++-
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  | 56 ++++++++---------
 .../ethernet/marvell/octeontx2/nic/otx2_vf.c  |  3 +-
 .../net/ethernet/mellanox/mlx4/en_netdev.c    | 62 ++++++++-----------
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h  |  6 +-
 .../net/ethernet/pensando/ionic/ionic_lif.c   | 17 +----
 .../net/ethernet/pensando/ionic/ionic_lif.h   | 11 ++--
 .../net/ethernet/pensando/ionic/ionic_phc.c   | 61 +++++++++++-------
 drivers/net/ethernet/renesas/ravb_main.c      | 61 ++++++------------
 drivers/net/ethernet/renesas/rswitch_main.c   | 53 ++++++----------
 15 files changed, 211 insertions(+), 218 deletions(-)

-- 
2.47.3

