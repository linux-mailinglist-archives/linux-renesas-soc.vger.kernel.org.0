Return-Path: <linux-renesas-soc+bounces-17819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E8ACBFC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jun 2025 07:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEC317A445B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jun 2025 05:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58E11F4CAB;
	Tue,  3 Jun 2025 05:51:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67290137C52;
	Tue,  3 Jun 2025 05:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929887; cv=none; b=cwwhdjUEY5mBVvZR/SYMvFVAH27DpkceHVdaHOFb3k6F2gW+8iS9LagM08M4Y5rKNDtTheorFOma87P2f1H2FM6Ib+5Fq/ek4dWDZ4Umr19nm10AKMohYlr61vvmmZoyglKnV+DgAuCs40cQsjnyjyz048DgTJimvS202TItLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929887; c=relaxed/simple;
	bh=n5BjHU0sJZzgoIfQXD0y0/OV4wC2/rt+U/E5IJFAGnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVErC4TJfL3aDdzDDe2AQZKEsZz1JQk6wVyRK/ETBHak/CwzjxlKtm8wMg6p/4zMyds42a4yjiI3Qv2sRoRfSwvrUMTm/CxqElX7icy0A4SZettE/P41S0dPwT4YRZJgItOZQS/cWhnv2l27ggWOSGjeGlN8mGBoLJRkBORy5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c44b1a9c403e11f0b29709d653e92f7d-20250603
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:36da481d-9628-499b-b408-b3ee3ad83ee2,IP:0,U
	RL:0,TC:0,Content:32,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:32
X-CID-META: VersionHash:6493067,CLOUDID:fc49a494d89cd9d5410e466ec1068e3b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c44b1a9c403e11f0b29709d653e92f7d-20250603
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 576421780; Tue, 03 Jun 2025 13:51:17 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 0A62516001A03;
	Tue,  3 Jun 2025 13:51:17 +0800 (CST)
X-ns-mid: postfix-683E8D54-83035764
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 070CF16001CC7;
	Tue,  3 Jun 2025 05:51:12 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
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
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v4 0/4] Use helper function for_each_child_of_node_scoped()
Date: Tue,  3 Jun 2025 13:51:05 +0800
Message-ID: <20250603055109.3154061-1-aichao@kylinos.cn>
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

 - Patch 2 ASoC: renesas: Use helper function for_each_child_of_node_scop=
ed()

 - Patch 3 ASoC: meson: Use helper function for_each_child_of_node_scoped=
()

 - Patch 4 ASoC: imx-card: Use helper function for_each_child_of_node_sco=
ped()

---
Changes in V4:
 - Remove patch ALSA: aoa: Use helper function for_each_child_of_node_sco=
ped()
 - Remove Patch ASoC: qcom: Use helper function for_each_child_of_node_sc=
oped()

Changes in v3:
 - Change Patch name ASoC to ALSA for patch 1,2.
 - Change commit message information.
 - for_each_child_of_node_scoped() instead of
   for_each_child_of_node() in i2cbus_add_dev().

Changes in v2:
 - Fix error reported by kernel test rebot
 - Keep "node"
---

 sound/ppc/tumbler.c                |  5 ++---
 sound/soc/fsl/imx-card.c           | 13 +++++------
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 16 +++++---------
 sound/soc/renesas/rcar/core.c      | 35 ++++++++++--------------------
 sound/soc/renesas/rcar/ctu.c       |  8 ++-----
 sound/soc/renesas/rcar/dma.c       |  4 +---
 sound/soc/renesas/rcar/dvc.c       |  8 ++-----
 sound/soc/renesas/rcar/mix.c       |  8 ++-----
 sound/soc/renesas/rcar/src.c       | 10 ++-------
 sound/soc/renesas/rcar/ssi.c       | 18 +++++----------
 sound/soc/renesas/rcar/ssiu.c      |  7 ++----
 12 files changed, 40 insertions(+), 95 deletions(-)

--=20
2.47.1


