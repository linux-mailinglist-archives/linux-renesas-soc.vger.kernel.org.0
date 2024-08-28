Return-Path: <linux-renesas-soc+bounces-8432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3509624B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B01A2862EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF8E16A94B;
	Wed, 28 Aug 2024 10:22:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDB6158210;
	Wed, 28 Aug 2024 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840565; cv=none; b=UGSK3X6NvSFUdkKTkxc7a5bmXPhFtZhrs1xjR5m2BIMMwQDFDJrEb11O4409fiMewW/c5KfW10QDpi3XoFEzZ1bprvst8iQzeoa4y4VJfeKXfv7tdF++6V4+qLlBeQ3OfILv5U+3COYM1ZvR2BGQSiLx8YDasvTWRxHc4RWrohc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840565; c=relaxed/simple;
	bh=Z+3aBQyXJmLtAAFxGMefG2tsQR01hdKFu9as6nvzYGU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=F1DpzspgUB8PfNljOe4EUvMTijOCOnMm9jLmRg9OUEs/jkyuBkc9I+dv2rl2VKLPXJ12+KH8H22OLoDw/1aMMsqu61aWHBcs3UjmzVhUy/Ww/5pV1el1cFaejSjJiFDYrrDxYcrIYlqgoMc1QP73MomjvD5IzTcGc2QxKNsh/us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="216828073"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2024 19:22:39 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.92.33])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 053B340061A1;
	Wed, 28 Aug 2024 19:22:34 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
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
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net PATCH v2 0/2] Fix maximum TX/RX frame sizes in ravb driver
Date: Wed, 28 Aug 2024 11:22:24 +0100
Message-Id: <20240828102226.223-1-paul.barker.ct@bp.renesas.com>
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

Changes v1->v2:
  * Rebase on net tree as these are both bugfixes.
  * Pick up Reveiwed-by tags.

Paul Barker (2):
  net: ravb: Fix maximum TX frame size for GbEth devices
  net: ravb: Fix R-Car RX frame size limit

 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.43.0


