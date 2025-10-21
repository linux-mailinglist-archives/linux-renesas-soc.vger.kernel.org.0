Return-Path: <linux-renesas-soc+bounces-23372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA0BF5A15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 11:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5ACC5012B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAAF2F656D;
	Tue, 21 Oct 2025 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tz35rc9l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03C2ECD05
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040118; cv=none; b=PwtnfnnDvWbOrSQvI+OZ9LXTqohSvCmqRP3Eoxt1zAglqVEekWmO3PbAxj18dT22dAfagTCGfLN1/n26iDkEbPEsTv3JAgLKQuysnnjeDXAqVntZN+EgRciNKwZZpnjtninNz3DmiYEKERWQ7rjkLPsOU83jWKV3SQnVsYDrtqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040118; c=relaxed/simple;
	bh=BeRkcYdNuRP9VtAYS7+2+hIhdROOZ2RLTiuy7nQekzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TcGmOOdk7sXBtEMmLP8JJj9XzfbuBT6vSLVhvMlqB3CqiLJJiwW8EFsU301AWnFaFKUI9G8sUWOrYYNSru1bpid3RSA5VW30uvBEXQlwhTI4kh4YIYKlgny99Nv//EyiqxmprYai/arApJj8O5TGBkFl0xjdwBkM1V2vYuUH2VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tz35rc9l; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761040103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0prnOTx0qdT5A7vnEONNMuy2PWCa/37sN43he+oZ48M=;
	b=tz35rc9lYZ24KZZPYmVND7+5MNZC3J01XZCqJXbt7gO+szf+3361vGEF4q+i3FXOoOJ8yJ
	V8868sQFnVnjyv+sqXtLiY8cHSri+vjlVeIuJ+fxGprnyly57mMGyM3+ggYhYEfjMP2/ZN
	yUX5fspPMp/X1aS4gTLyLsBGHBQQfw0=
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
Subject: [PATCH net-next v3 0/6] convert net drivers to ndo_hwtstamp API part 2
Date: Tue, 21 Oct 2025 09:47:45 +0000
Message-ID: <20251021094751.900558-1-vadim.fedorenko@linux.dev>
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

