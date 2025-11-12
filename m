Return-Path: <linux-renesas-soc+bounces-24489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 796E9C50DBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 08:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D3774ED7D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 07:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25AD2E2661;
	Wed, 12 Nov 2025 06:58:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FAD24C076;
	Wed, 12 Nov 2025 06:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762930702; cv=none; b=OocyGC9JNN+I/KlhPdf+py+dH2IivEjdNU4PilAualr1eInXZp8WW+CqcfkNDdTp23vEOgCBFX2+GC3FThvfTDUzsyD2Bqa35NQyEbHnaQ7qZSRaZ25XiAm+42GAM1vFRXEa3VlGava2fHcnf0e1h8w+oPXbTcLXEXtY4szBwa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762930702; c=relaxed/simple;
	bh=Hin0DkjlRscjm/Jzcxyyon4GMA1Kyw8iTYefBGqeFfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1PXje2kU3M25/DGm/nuZBQUvHouqHkAv5u29Do1Z7yCpMEp8m2WgQbqx8Kd5rHmBp4ChAgxDXdC0YunZnf4ZAgCaWmQC7DPBffhzOWHb3E/RyWZ2JjR5jPbixQBdrg2QcEztypQmyu8kBimOA2Q2u1n+m0u9d1mYh8f5WDw8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAA3PW71LxRpV8hzAA--.30824S2;
	Wed, 12 Nov 2025 14:57:57 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()
Date: Wed, 12 Nov 2025 14:57:09 +0800
Message-ID: <20251112065709.1522-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3PW71LxRpV8hzAA--.30824S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF45ZFW3Xr4rGw4fGFyUKFg_yoW8Jw45pw
	n8Gay5Kr45Gw4vkr1Fqr4kZay0kayFyF43JF48t3WSywn3Ary3WFnFvFyUuw15JFWF9FW5
	Xryjgr1kAFWUuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjylkDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgEA2kUF81drAAAsV

rsnd_ssiu_probe() leaks an OF node reference obtained by
rsnd_ssiu_of_node(). The node reference is acquired but
never released across all return paths.

Fix it by declaring the device node with the __free(device_node)
cleanup construct to ensure automatic release when the variable goes
out of scope.

Fixes: 4e7788fb8018 ("ASoC: rsnd: add SSIU BUSIF support")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/renesas/rcar/ssiu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index faf351126d57..244fb833292a 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -509,7 +509,7 @@ void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 int rsnd_ssiu_probe(struct rsnd_priv *priv)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
-	struct device_node *node;
+	struct device_node *node __free(device_node) = rsnd_ssiu_of_node(priv);
 	struct rsnd_ssiu *ssiu;
 	struct rsnd_mod_ops *ops;
 	const int *list = NULL;
@@ -522,7 +522,6 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 	 * see
 	 *	rsnd_ssiu_bufsif_to_id()
 	 */
-	node = rsnd_ssiu_of_node(priv);
 	if (node)
 		nr = rsnd_node_count(priv, node, SSIU_NAME);
 	else
-- 
2.50.1.windows.1


