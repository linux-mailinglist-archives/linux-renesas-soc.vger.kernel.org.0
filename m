Return-Path: <linux-renesas-soc+bounces-17335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F93AC03AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 07:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84DE5947412
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 05:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2DC1A38E1;
	Thu, 22 May 2025 05:03:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED39126BF7;
	Thu, 22 May 2025 05:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890205; cv=none; b=nk0SXULxkBISNKPWsL7FjRIUN/0DbzdFV8gYvYYeJ8V2/oWjDh3OfwIMhkFeAyQmd3ax87QVhklLsdlZrru8e33WtthnhZdfjAo0VC0w0/he8diBCfmJLOPRkIPC0mMr8TV/7B7ddhmaum7U0zOrBKgnT/2krSsd53QegERPCzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890205; c=relaxed/simple;
	bh=J5wbx4tchgCrNGvrO3n8c3r3SVGSlCev1Ux14CexXaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rG/A45/4bVXkYEeyat2FIEs/Y6/apefoGAFM3q/sbIWzBtyrumCK+9zAVYT6SSDxZzRhagPn/xVYJj/luvaUwsua3EMur5aLKGUG2ltDNph6qaQgY/fl9vEbTwVNjcEQ/2c1SViaaA1o4pZn5JbflOuIFKRvpljoHrxq+MnI1sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1102de3436ca11f0b29709d653e92f7d-20250522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:caea8ce9-09dd-4521-979d-605f8377a2ce,IP:0,U
	RL:0,TC:0,Content:36,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:36
X-CID-META: VersionHash:6493067,CLOUDID:4791b0832b2718bd027ade75e2fe48ad,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1102de3436ca11f0b29709d653e92f7d-20250522
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1157435395; Thu, 22 May 2025 13:03:14 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id DB01116003840;
	Thu, 22 May 2025 13:03:13 +0800 (CST)
X-ns-mid: postfix-682EB011-73870328
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id A87ED16001CC7;
	Thu, 22 May 2025 05:03:08 +0000 (UTC)
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
Subject: [PATCH v2 0/6] Use helper function for_each_child_of_node_scoped()
Date: Thu, 22 May 2025 13:02:53 +0800
Message-ID: <20250522050300.519244-1-aichao@kylinos.cn>
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

Thus, use this helper to simplify the code.

Summary:

 - Patch 1 ASoC: ppc: Use helper function for_each_child_of_node_scoped()

 - Patch 2 ASoC: aoa: Use helper function for_each_child_of_node_scoped()

 - Patch 3 ASoC: renesas: Use helper function for_each_child_of_node_scop=
ed()

 - Patch 4 ASoC: meson: Use helper function for_each_child_of_node_scoped=
()

 - Patch 5 ASoC: imx-card: Use helper function for_each_child_of_node_sco=
ped()

 - Patch 6 ASoC: qcom: Use helper function for_each_child_of_node_scoped(=
)

---
Changes in v2:
 - Fix error reported by kernel test rebot
 - Keep "node"
---
 sound/aoa/soundbus/i2sbus/core.c   |  5 +++--
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
 16 files changed, 46 insertions(+), 104 deletions(-)

--=20
2.47.1


