Return-Path: <linux-renesas-soc+bounces-8989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F197B93B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 10:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC5F6B29F8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2024 08:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A22E188A19;
	Wed, 18 Sep 2024 08:19:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743D717A5BC;
	Wed, 18 Sep 2024 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647543; cv=none; b=TlZ0Q4J/+pPNalw5UEw++XXBMxnzAI149BzMiFySVAe8VtyOEJmE1CUxsWMeeLQ5oyXoP/JxR0O7aHFwsvx5LycdJAtsk+RBSwkh2//ON6oWsmuOOeZmMS7GKYuhjgtWTMKFB018PcrlTD1Vi3/As8t4Un5PxZ96Qyht3m5LhdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647543; c=relaxed/simple;
	bh=J2qxE7LcctaThLnmvdscvX9EQ0/8sUTGAH5Tr/VsKbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Af/w0zGyVuhRxUPJmihDLUmF2Ju2OuZiuFGMLQMl8GGVIbTUaeVLmDlyd5KfPgqvGaZPBlgiE2+/1/kFTYlMKSwWhNk11FmnQaKEbyR8p9Lbe5dPi1Lf7dhnUKPCfoBoPQuQNa3wGEp3t+yvbAV2fElO3iN09OiwbeiynfMSNbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,238,1719846000"; 
   d="scan'208";a="219067069"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Sep 2024 17:18:54 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.61])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 646B24005630;
	Wed, 18 Sep 2024 17:18:49 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net PATCH v3 0/2] Fix maximum TX/RX frame sizes in ravb driver
Date: Wed, 18 Sep 2024 09:18:37 +0100
Message-Id: <20240918081839.259-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches fix a couple of bugs in the maximum supported TX/RX frame
sizes in the ravb driver.

  * For the GbEth IP, we were advertising a maximum TX frame size/MTU
    that was larger that the maximum the hardware can transmit.

  * For the R-Car AVB IP, we were unnecessarily setting the maximum RX
    frame size/MRU based on the MTU, which by default is smaller than
    the maximum the hardware can receive.

For the R-Car AVB IP, the maximum TX frame size should be 2047 (not
2048), but additional work will be required to validate that change so
it is not included in this series.

Changes v2->v3:
  * Pick up Reviewed-by tag and suggested comment improvement from
    Niklas.
Changes v1->v2:
  * Rebase on net tree as these are both bugfixes.
  * Pick up Reviewed-by tags.

Paul Barker (2):
  net: ravb: Fix maximum TX frame size for GbEth devices
  net: ravb: Fix R-Car RX frame size limit

 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.43.0


