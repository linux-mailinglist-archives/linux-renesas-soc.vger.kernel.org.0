Return-Path: <linux-renesas-soc+bounces-17240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF05ABD2D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 11:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A5FE1689DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA434266B59;
	Tue, 20 May 2025 09:11:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A2C265CAF;
	Tue, 20 May 2025 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732313; cv=none; b=HYOpVabVhV+R5UzZR9u4nIpcblkTKi/GpJjKd/aDSeT8T/0sRPcztgY/1V5sfZ0zl7Fgr68IOZvjqHRDYpiJJHb2y7O3FuNOZwLxE/P7caclOAlutSbanSuCSAKtoAskmTMQcjS7RSzqjxNFtnTNCfgm1b1sD5JiI5TuwAbnkQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732313; c=relaxed/simple;
	bh=IvLR8yZS+D6mKrd0DI6pDluppOn6eKtfkIRPLs4fZFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ruN8h19K1NI+R7knMa+hZgM+wNDEfJ97Y+MSINKtAn0zz/N5V/D0nuL4qoIeWk9/TuHMrPso5ucDwOCDTkNJtNeJz0Sw+3mZh3G74BSy/pYLxw1g2tdbvnAEhwctOAUUrhWvwUGiMyJ4oGxKFWf9jOzWyL4qjlE3q3+ASxf5Vmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 725ad2b6355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:87f64f3f-8ff6-4a5d-836f-e892fc7371f5,IP:0,U
	RL:0,TC:0,Content:39,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:39
X-CID-META: VersionHash:6493067,CLOUDID:fd4d755d8717728699b6f10f854a64c4,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 725ad2b6355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1902263896; Tue, 20 May 2025 17:11:43 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id A477B16003840;
	Tue, 20 May 2025 17:11:42 +0800 (CST)
X-ns-mid: postfix-682C474E-846621685
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 3F67B16001CC7;
	Tue, 20 May 2025 09:11:36 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	srinivas.kandagatla@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	zhangzekun11@huawei.com,
	krzysztof.kozlowski@linaro.org,
	ckeepax@opensource.cirrus.com,
	drhodes@opensource.cirrus.com,
	alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 0/6] Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:25 +0800
Message-ID: <20250520091131.4150248-1-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch series introduces wrapper functions
for_each_child_of_node_scoped().=20

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

 sound/aoa/soundbus/i2sbus/core.c   |  5 ++--
 sound/ppc/tumbler.c                |  5 ++--
 sound/soc/fsl/imx-card.c           | 13 ++++------
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 14 +++--------
 sound/soc/qcom/lpass-cpu.c         |  3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c   |  3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c   |  4 +--
 sound/soc/renesas/rcar/core.c      | 39 ++++++++++--------------------
 sound/soc/renesas/rcar/ctu.c       |  8 ++----
 sound/soc/renesas/rcar/dma.c       |  4 +--
 sound/soc/renesas/rcar/dvc.c       |  8 ++----
 sound/soc/renesas/rcar/mix.c       |  8 ++----
 sound/soc/renesas/rcar/src.c       | 10 ++------
 sound/soc/renesas/rcar/ssi.c       | 18 ++++----------
 sound/soc/renesas/rcar/ssiu.c      |  7 ++----
 16 files changed, 47 insertions(+), 105 deletions(-)

--=20
2.47.1


