Return-Path: <linux-renesas-soc+bounces-87-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E357F3D27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 06:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D702CB21747
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 05:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BD7C8C2;
	Wed, 22 Nov 2023 05:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CB68F4;
	Tue, 21 Nov 2023 21:11:49 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,217,1695654000"; 
   d="scan'208";a="183829209"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2023 14:11:48 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9A47D4173A12;
	Wed, 22 Nov 2023 14:11:48 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net v3 0/3] net: rswitch: Fix issues in rswitch_start_xmit()
Date: Wed, 22 Nov 2023 14:11:40 +0900
Message-Id: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is based on the latest net.git / main branch.

Changes from v2:
https://lore.kernel.org/all/20231122012556.3645840-1-yoshihiro.shimoda.uh@renesas.com/
- Keep reverse christmas tree of local variable declarations in patch 1/3.

Changes from v1:
https://lore.kernel.org/all/20231121055255.3627949-1-yoshihiro.shimoda.uh@renesas.com/
- Separate a patch because fixing 2 issues.
- Add fixing wrong type of return value.
- Use goto for improving code readability.

Yoshihiro Shimoda (3):
  net: rswitch: Fix type of ret in rswitch_start_xmit()
  net: rswitch: Fix return value in rswitch_start_xmit()
  net: rswitch: Fix missing dev_kfree_skb_any() in error path

 drivers/net/ethernet/renesas/rswitch.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

-- 
2.25.1


