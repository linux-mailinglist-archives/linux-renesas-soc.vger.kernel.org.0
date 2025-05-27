Return-Path: <linux-renesas-soc+bounces-17527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AED17AC4A26
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 10:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D7F63A6963
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 08:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AC1248F5E;
	Tue, 27 May 2025 08:25:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1949E1C6FFE;
	Tue, 27 May 2025 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334315; cv=none; b=demPUzongfV197+aHNgyqa1y6TTClhRCmV6CD3e7MgDPBJ+YoyEdspoW4W0R1B0rHJYQYZRfXlPR2wt7SCmk6HSIMFNFuEbc/TrVEEuLHli0facnPeJtrBqCD1HrngrcOzVkeBFFoR8LCMJfN5nQwEOlidOaHkHAvjamAj+YnrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334315; c=relaxed/simple;
	bh=MNVQFRdgVR76J2FChLUD7YAoquGb8Y9eYaiMckwgG8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Adfbv9CM07dMVXJ/pFGTR+449o01TdLRfhuo9nYct7fapz7d0vi01gDcEvU0VXlC1F/xIapDBieAWqa/3q1UWv4qxQptLCCezQAXaf6+RxQYewLCwBTm8OjZVyWBSVtgChg57YwD0ZQ908bfO/GA0dbiaDJrR/Q6ymHxdmSUWN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 16b3a29c3ad411f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:52dbf973-d560-4d92-ab36-debd7af511ff,IP:0,U
	RL:0,TC:0,Content:33,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:33
X-CID-META: VersionHash:6493067,CLOUDID:76905b17bcdc2d36468f4541233e31d5,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 16b3a29c3ad411f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 756001150; Tue, 27 May 2025 16:25:03 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id F0C9D16001F49;
	Tue, 27 May 2025 16:25:02 +0800 (CST)
X-ns-mid: postfix-683576DD-9767322679
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id F384916001F49;
	Tue, 27 May 2025 08:24:57 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v3 0/6] Use helper function for_each_child_of_node_scoped()
Date: Tue, 27 May 2025 16:24:40 +0800
Message-ID: <20250527082446.2265500-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch series introduces wrapper functions for_each_child_of_node_sco=
ped().

The for_each_child_of_node_scoped() helper provides a scope-based clean-u=
p
functionality to put the device_node automatically, and as such, there is
no need to call of_node_put() directly.

Summary:

 - Patch 1 ALSA: ppc: Use helper function for_each_child_of_node_scoped()

 - Patch 2 ALSA: aoa: Use helper function for_each_child_of_node_scoped()

 - Patch 3 ASoC: renesas: Use helper function for_each_child_of_node_scop=
ed()

 - Patch 4 ASoC: meson: Use helper function for_each_child_of_node_scoped=
()

 - Patch 5 ASoC: imx-card: Use helper function for_each_child_of_node_sco=
ped()

 - Patch 6 ASoC: qcom: Use helper function for_each_child_of_node_scoped(=
)

---
Changes in v3:
 - Change Patch name ASoC to ALSA for patch 1,2.
 - Change commit message information.
 - for_each_child_of_node_scoped() instead of
   for_each_child_of_node() in i2cbus_add_dev().

Changes in v2:
 - Fix error reported by kernel test rebot
 - Keep "node"
---

 sound/aoa/soundbus/i2sbus/core.c   |  7 +++---
 sound/ppc/tumbler.c                |  5 ++---
 sound/soc/fsl/imx-card.c           | 13 +++++------
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 16 +++++---------
 sound/soc/qcom/lpass-cpu.c         |  3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c   |  3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c   |  4 +---
 sound/soc/renesas/rcar/core.c      | 35 ++++++++++--------------------
 sound/soc/renesas/rcar/ctu.c       |  8 ++-----
 sound/soc/renesas/rcar/dma.c       |  4 +---
 sound/soc/renesas/rcar/dvc.c       |  8 ++-----
 sound/soc/renesas/rcar/mix.c       |  8 ++-----
 sound/soc/renesas/rcar/src.c       | 10 ++-------
 sound/soc/renesas/rcar/ssi.c       | 18 +++++----------
 sound/soc/renesas/rcar/ssiu.c      |  7 ++----
 16 files changed, 46 insertions(+), 106 deletions(-)

--=20
2.47.1


