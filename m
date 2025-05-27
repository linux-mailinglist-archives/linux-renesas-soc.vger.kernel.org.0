Return-Path: <linux-renesas-soc+bounces-17533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 412CFAC4A3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 10:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A84F917C0EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 08:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA37A24C669;
	Tue, 27 May 2025 08:25:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2DC24BC09;
	Tue, 27 May 2025 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334336; cv=none; b=dEbb+97HXKGCQSlQmdpXpZAdGeo1LLjr2FoNA5uitKqppGdfyODYgVFpBg3F8N5O9npe4yoYkMW6jnRSoUtM3jjTrrSU6BRVx2WJJSKyf0Ao6/6Ii909tzCHqAF4T0T40IyUsFKv5N1aTYe+7vpe81251VvEJxznyYbLd60d1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334336; c=relaxed/simple;
	bh=lF0fH/CcTAKBcrZbNRqHAOvKHyMZ3rKqL2ZNyw3DfZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJetO38wYiBdY1DFPScaPdgkbtUgWlyrv9Ok8wct78sDmOFhwkJJa54sXsaZFJx5i2ruR6LHMIWhwGouHZP2irsb0mmA3UskfOH/5WzuYM2peGAe1OIiMBat0NOs3sXfArFE9TMc4t1KNGJ3CATMTgwQmGoVScKT/t6+Fr0pt3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2590c2fe3ad411f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0172e8e5-1cbf-4d9b-a76d-b519d316b39c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:9db441d4c2ed8449c5036e642977de72,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2590c2fe3ad411f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1846934354; Tue, 27 May 2025 16:25:28 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id C228016001F52;
	Tue, 27 May 2025 16:25:27 +0800 (CST)
X-ns-mid: postfix-683576F5-5122252692
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 7548716001F49;
	Tue, 27 May 2025 08:25:23 +0000 (UTC)
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
Subject: [PATCH v3 6/6] ASoC: qcom: Use helper function for_each_child_of_node_scoped()
Date: Tue, 27 May 2025 16:24:46 +0800
Message-ID: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250527082446.2265500-1-aichao@kylinos.cn>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The for_each_child_of_node_scoped() helper provides a scope-based
clean-up functionality to put the device_node automatically.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/soc/qcom/lpass-cpu.c       | 3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..62f49fe46273 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1046,7 +1046,6 @@ static unsigned int of_lpass_cpu_parse_sd_lines(str=
uct device *dev,
 static void of_lpass_cpu_parse_dai_data(struct device *dev,
 					struct lpass_data *data)
 {
-	struct device_node *node;
 	int ret, i, id;
=20
 	/* Allow all channels by default for backwards compatibility */
@@ -1056,7 +1055,7 @@ static void of_lpass_cpu_parse_dai_data(struct devi=
ce *dev,
 		data->mi2s_capture_sd_mode[id] =3D LPAIF_I2SCTL_MODE_8CH;
 	}
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret =3D of_property_read_u32(node, "reg", &id);
 		if (ret || id < 0) {
 			dev_err(dev, "valid dai id not found: %d\n", ret);
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6af=
e-dai.c
index 7d9628cda875..64735f2adf8f 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -962,10 +962,9 @@ static const struct snd_soc_component_driver q6afe_d=
ai_component =3D {
 static void of_q6afe_parse_dai_data(struct device *dev,
 				    struct q6afe_dai_data *data)
 {
-	struct device_node *node;
 	int ret;
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		unsigned int lines[Q6AFE_MAX_MI2S_LINES];
 		struct q6afe_dai_priv_data *priv;
 		int id, i, num_lines;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6as=
m-dai.c
index a400c9a31fea..d7680dd3a3bb 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1236,10 +1236,8 @@ static int of_q6asm_parse_dai_data(struct device *=
dev,
 {
 	struct snd_soc_dai_driver *dai_drv;
 	struct snd_soc_pcm_stream empty_stream;
-	struct device_node *node;
 	int ret, id, dir, idx =3D 0;
=20
-
 	pdata->num_dais =3D of_get_child_count(dev->of_node);
 	if (!pdata->num_dais) {
 		dev_err(dev, "No dais found in DT\n");
@@ -1253,7 +1251,7 @@ static int of_q6asm_parse_dai_data(struct device *d=
ev,
=20
 	memset(&empty_stream, 0, sizeof(empty_stream));
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret =3D of_property_read_u32(node, "reg", &id);
 		if (ret || id >=3D MAX_SESSIONS || id < 0) {
 			dev_err(dev, "valid dai id not found:%d\n", ret);
--=20
2.47.1


