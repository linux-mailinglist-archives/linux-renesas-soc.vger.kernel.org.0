Return-Path: <linux-renesas-soc+bounces-22963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC737BD5641
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 19:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D0E480027
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0C12FB614;
	Mon, 13 Oct 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s7zh0XDF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B462E6CB3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373377; cv=none; b=u4pe/CkFmsJsjOKPcVApQz3xBTaDULUlJO6YXO4KQh1AwNYYq9mnmnMAlD7SVY0DTLEfrnw44QLms+tYnHcaeT7JmT1Qty3Sx+TP1DWhVXk2S66Q+KLkwXjQUMqEuM+vNu8pBksrEkJJabcR4zDLi9oXhx9yJNjM+0e6inoS99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373377; c=relaxed/simple;
	bh=kfFy/xwFbRX75KS4DeBBL40T3AGe2KOlcKsVvlby4SE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/rE6Kl2e3lif5JnMjVrquJAwUrkz3qFVtb49BnI7IhHxIKpZ5FuAF66upCh3+i7nJiPe9J1KXWqBdwAd1+dE2A3WYWAJly+uez2r4f0Adn3FFMfeo7yqSNCzS3Nrnp4uW9vCXKX0//8CvfvmvsqUnQc69/zelLWf+fWUiGagTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s7zh0XDF; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xft6FnP3M7lgS82tMmSoqJUtpE/xTspDflOwthoAG68=;
	b=s7zh0XDFuUTh6yk/7bjkHoivnVZPZhgoaF1ZdocTfO8TNqWlTlC9FiHT46+N3wrthl66PF
	D5Hpr3aMxTJbr8hT/QYqZ8+jDiCw3cZEcE1ifhb+64Lv+vSOdBMY1VperSHQxwDkGtDeKM
	NVsRcoDXMrrmVCJz8BcPJIuEQQeXIPM=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Igor Russkikh <irusskikh@marvell.com>,
	Egor Pomozov <epomozov@marvell.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Dimitris Michailidis <dmichail@fungible.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [PATCH net-next 00/14] convert net drivers to ndo_hwtstamp API
Date: Mon, 13 Oct 2025 16:34:15 +0000
Message-ID: <20251013163429.4984-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Convert drivers which support HW timestamping to use
.ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks. The new API uses
netlink to communicate with user-space and have some test coverage.
There are some drivers left with old ioctl interface after this series:
- mlx5 driver be shortly converted by nVidia folks
- TI netcp ethss driver which needs separate series which I'll post
  after this one. 

Vadim Fedorenko (14):
  net: ti: am65-cpsw: move hw timestamping to ndo callback
  ti: icssg: convert to ndo_hwtstamp API
  amd-xgbe: convert to ndo_hwtstamp callbacks
  net: atlantic: convert to ndo_hwtstamp API
  cxgb4: convert to ndo_hwtstamp API
  tsnep: convert to ndo_hwtstatmp API
  funeth: convert to ndo_hwtstamp API
  octeontx2: convert to ndo_hwtstamp API
  mlx4: convert to ndo_hwtstamp API
  ionic: convert to ndo_hwtstamp API
  net: ravb: convert to ndo_hwtstamp API
  net: renesas: rswitch: convert to ndo_hwtstamp API
  net: hns3: add hwtstamp_get/hwtstamp_set ops
  net: hns3: move hns3pf to use hwtstamp callbacks

 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      |  24 +--
 drivers/net/ethernet/amd/xgbe/xgbe-hwtstamp.c |  28 ++--
 drivers/net/ethernet/amd/xgbe/xgbe.h          |  11 +-
 .../net/ethernet/aquantia/atlantic/aq_main.c  |  66 ++------
 .../net/ethernet/aquantia/atlantic/aq_ptp.c   |   6 +-
 .../net/ethernet/aquantia/atlantic/aq_ptp.h   |   8 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |   2 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   | 154 +++++++++---------
 drivers/net/ethernet/engleder/tsnep.h         |   8 +-
 drivers/net/ethernet/engleder/tsnep_main.c    |  14 +-
 drivers/net/ethernet/engleder/tsnep_ptp.c     |  88 +++++-----
 drivers/net/ethernet/fungible/funeth/funeth.h |   4 +-
 .../ethernet/fungible/funeth/funeth_main.c    |  40 ++---
 drivers/net/ethernet/hisilicon/hns3/hnae3.h   |   5 +
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   |  29 ++++
 .../hisilicon/hns3/hns3pf/hclge_main.c        |  13 +-
 .../hisilicon/hns3/hns3pf/hclge_ptp.c         |  32 ++--
 .../hisilicon/hns3/hns3pf/hclge_ptp.h         |   9 +-
 .../marvell/octeontx2/nic/otx2_common.h       |   9 +-
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  |  56 +++----
 .../ethernet/marvell/octeontx2/nic/otx2_vf.c  |   3 +-
 .../net/ethernet/mellanox/mlx4/en_netdev.c    |  61 +++----
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h  |   6 +-
 .../net/ethernet/pensando/ionic/ionic_lif.c   |  17 +-
 .../net/ethernet/pensando/ionic/ionic_lif.h   |  11 +-
 .../net/ethernet/pensando/ionic/ionic_phc.c   |  59 ++++---
 drivers/net/ethernet/renesas/ravb_main.c      |  61 +++----
 drivers/net/ethernet/renesas/rswitch_main.c   |  53 +++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  44 +++--
 drivers/net/ethernet/ti/icssg/icssg_common.c  |  47 ++----
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |   4 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |   6 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |   4 +-
 33 files changed, 441 insertions(+), 541 deletions(-)

-- 
2.47.3


