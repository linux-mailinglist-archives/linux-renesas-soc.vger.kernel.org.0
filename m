Return-Path: <linux-renesas-soc+bounces-17241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E056ABD2D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 11:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AAD13BCB72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 09:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB4F267720;
	Tue, 20 May 2025 09:11:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5F9265CAF;
	Tue, 20 May 2025 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732318; cv=none; b=VryRKYg76o+C7OI5SC+8PnlkRVq3vvNdrT6apaqJyGXKJH9V2kZX+Jx9uzKuBGhrYw0f1IVfC4TSw96w8NBnYdFdpZ8NszHTz9/ntdIU+8WYZ8wwD+7mElnXWDDHi7rgJTnN03hXJYfRlB3N3JBBMqCdEEcMQgm6YeCeLpHxFEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732318; c=relaxed/simple;
	bh=8it8DcLAcMd9yJVwUvKvFf4a7Jf2S2WgE8Gao82xrWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jn9hn3ZD4z0XQH1QeZHNJuDCXuWW2y6a4XDydlof7KWlK5io6NYVDFu+4AN05sQ9k7XlB3pMUCuAD3st2/hRCYJ41Nb0F9QpYDsj8WtR/2xMhD5WDx9V+h+ukPY0CVVlHh0W7nEdXfa2OiDcMjlXewc4ujnIGe8xZGuNaYgtHc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 757b0272355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:68cf80e9-f6df-4ae8-a4c4-e154af910e76,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:10bc6103bf10933b841a276bd851824d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 757b0272355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2001862829; Tue, 20 May 2025 17:11:48 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id E6C5A16003840;
	Tue, 20 May 2025 17:11:47 +0800 (CST)
X-ns-mid: postfix-682C4753-2146811686
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 80A5816001CC7;
	Tue, 20 May 2025 09:11:44 +0000 (UTC)
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
Subject: [PATCH 1/6] ASoC: ppc: Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:26 +0800
Message-ID: <20250520091131.4150248-2-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520091131.4150248-1-aichao@kylinos.cn>
References: <20250520091131.4150248-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The for_each_child_of_node_scoped() helper provides a scope-based
clean-up functionality to put the device_node automatically, and
as such, there is no need to call of_node_put() directly.

Thus, use this helper to simplify the code.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/ppc/tumbler.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/ppc/tumbler.c b/sound/ppc/tumbler.c
index 3c09660e1522..b81d0789b9fb 100644
--- a/sound/ppc/tumbler.c
+++ b/sound/ppc/tumbler.c
@@ -1343,7 +1343,7 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 	int i, err;
 	struct pmac_tumbler *mix;
 	const u32 *paddr;
-	struct device_node *tas_node, *np;
+	struct device_node *tas_node;
 	char *chipname;
=20
 	request_module("i2c-powermac");
@@ -1358,13 +1358,12 @@ int snd_pmac_tumbler_init(struct snd_pmac *chip)
 	mix->anded_reset =3D 0;
 	mix->reset_on_sleep =3D 1;
=20
-	for_each_child_of_node(chip->node, np) {
+	for_each_child_of_node_scoped(chip->node, np) {
 		if (of_node_name_eq(np, "sound")) {
 			if (of_property_read_bool(np, "has-anded-reset"))
 				mix->anded_reset =3D 1;
 			if (of_property_present(np, "layout-id"))
 				mix->reset_on_sleep =3D 0;
-			of_node_put(np);
 			break;
 		}
 	}
--=20
2.47.1


