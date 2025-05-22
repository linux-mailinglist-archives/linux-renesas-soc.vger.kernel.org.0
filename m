Return-Path: <linux-renesas-soc+bounces-17337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A180AC03B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 07:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D47947804
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 05:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD411ACEB7;
	Thu, 22 May 2025 05:03:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E251AA1D9;
	Thu, 22 May 2025 05:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890210; cv=none; b=tJ0NotljneDJVE75CWBGkJZI3RFDMTH7QfmMX52+ka50D2ywldWBG2OgJMsEJSuUgDQ8LK1gf1NJVg25mrIh2cfwRhzooKd0kcd1MiXtW5wBNnReXtpiPuAaaSUDF8QKmKoK6KFgbN4U2rNWDqXWzHsLkHmIEeLmaQK1KFw8cv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890210; c=relaxed/simple;
	bh=GPav3Pqm9Ng7pwQWEz875jACXeJh8++mV+UVeB/+mTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4M57yEn4WB92FPHMvYcRWVPwlMQPj2et6uj5lucfBjv5EdsdRJt0C/Rr3UTi177OVC08cPDpUwfcS27FqNQorLKD+zvVQ0OGclH3CZjXjNyM0R+/cLWpnro0lmY9UKqe/4IznlK0pSoQhFpSTkrXFKH/k+Ft9b/NB6nxCH+Z+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 159fb13836ca11f0b29709d653e92f7d-20250522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7f164c9f-baa5-4d50-a339-21cb64697b9b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:321115aeff15446721dda91ee448727e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 159fb13836ca11f0b29709d653e92f7d-20250522
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 85146597; Thu, 22 May 2025 13:03:22 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id ECF8B16003840;
	Thu, 22 May 2025 13:03:21 +0800 (CST)
X-ns-mid: postfix-682EB019-81249130
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id BBAE216001CC7;
	Thu, 22 May 2025 05:03:19 +0000 (UTC)
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
Subject: [PATCH v2 2/6] ASoC: aoa: Use helper function for_each_child_of_node_scoped()
Date: Thu, 22 May 2025 13:02:55 +0800
Message-ID: <20250522050300.519244-3-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250522050300.519244-1-aichao@kylinos.cn>
References: <20250522050300.519244-1-aichao@kylinos.cn>
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
 sound/aoa/soundbus/i2sbus/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus=
/core.c
index ce84288168e4..20a4c5891afc 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -207,6 +207,8 @@ static int i2sbus_add_dev(struct macio_dev *macio,
 			}
 		}
 	}
+	of_node_put(sound);
+
 	/* for the time being, until we can handle non-layout-id
 	 * things in some fabric, refuse to attach if there is no
 	 * layout-id property or we haven't been forced to attach.
@@ -335,7 +337,6 @@ static int i2sbus_add_dev(struct macio_dev *macio,
=20
 static int i2sbus_probe(struct macio_dev* dev, const struct of_device_id=
 *match)
 {
-	struct device_node *np;
 	int got =3D 0, err;
 	struct i2sbus_control *control =3D NULL;
=20
@@ -347,7 +348,7 @@ static int i2sbus_probe(struct macio_dev* dev, const =
struct of_device_id *match)
 		return -ENODEV;
 	}
=20
-	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
+	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
 		if (of_device_is_compatible(np, "i2sbus") ||
 		    of_device_is_compatible(np, "i2s-modem")) {
 			got +=3D i2sbus_add_dev(dev, control, np);
--=20
2.47.1


