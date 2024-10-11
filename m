Return-Path: <linux-renesas-soc+bounces-9716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFE99AAB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 19:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAEFCB23305
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 17:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BE719EEC4;
	Fri, 11 Oct 2024 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CItoddPt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8960195811;
	Fri, 11 Oct 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728669234; cv=none; b=MCLezlG01+RIunWJMxztVkPB9BLQnYPRasRZxoDyklaiLp11XwQ/FNMyXQOsVX6ZyAhXW5XX1gS7qKxkYToc1krpCUh6TXqopAIqOWmCZWwoDWlYg2IJ9qufHvqWhhZFMd9wO15YbymI8CRB0AuXxbFI/lR2ecvyvzCRk3aOOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728669234; c=relaxed/simple;
	bh=sMROR4bvAmoZRlyGcAQoX/Rf440iGOcrPpqc15iOgcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mgf/qSkteaeW5aoaYl/MAQhrez2b5qoAoFnTO01GSp0iqdTLSoLihh60zt1DrbkmQUO4FRr+BNVybFA+wiTLPCpgX6T03T4bxqTj05eByz+lFckd1GE5UstiP6LupQNZFJWpojNJRg55iEXCLl0pfsyRgCEiCsbA5sBEF33qcmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CItoddPt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4ec26709so1234197f8f.0;
        Fri, 11 Oct 2024 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728669231; x=1729274031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ci1c3uIbysslDczEe12lDguOg4G6dXqtM4CXMZUK/Hk=;
        b=CItoddPtyIbpjb0eDbLtZvAC3ADaRtI/ELJawUS2QqmAuEAASVvv0T5FCiLH/iN4Bi
         cYDq/85q8CHaVziZ0L93ksakutGG1CMSy7o+lERwPCB8M2JcofCecDHWC7nTpsbPqInR
         HxIr4i1KXgNuQm8v+Je50YR8QpdbWg/FTLhz29R9KwfxI3UCUOI8yCm9KxntTtoJJXNy
         5xVmMmxiCM0AdaMvyyqjEgyLv3CaTlwmOPFXX2zDxq/oESxdLpJZ4aBlWZPSAxp6H/3O
         k4Xip34O/ptWMCR2zCB4TGgDI0G+t9N37UG2ZLVsXvXgcfz5iFqQHuYe8x9EUhoS2X5K
         nFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728669231; x=1729274031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ci1c3uIbysslDczEe12lDguOg4G6dXqtM4CXMZUK/Hk=;
        b=ktbOETTv9pky32d0/0AOXelizplsF+wXg5FGoIsWWzzavzIGRFu/ohGvli4uoZM7ZC
         xKW+eotsDABKRX+bYeTl4FemhJ6+y5B6LAR4ZYe/L+WGmHmJfYhg7SekbBhJxVsL1vFJ
         8KojTCIHCl3vwaH2U+v6zMWPDwzJf1dhkHqYY/ztn67xWtGaLUjzwNK3nfu1G4+eMbKP
         cwY9yPXQ/ljbllMCEYADZaZlEHSDaiF1EbNCbBFV49j3y4L0O5PFDvTGAMzN6CniN7Ki
         lnpGrb9eWeO6eReoJvDcSIbQ+XeMJBE2sRvrCPh43lqAXCwmp0hulfb37csC48rnDW39
         2xcA==
X-Forwarded-Encrypted: i=1; AJvYcCVf+DI4/YYJncd54fCOQgDSLiFYzHJXggv7ReQDeS5czJ1AUVLnmGpCb4973F+yyO5f2Her+ajGD5nx5c8=@vger.kernel.org, AJvYcCWwHObqqYDdmoY2ZuS5wih4ZTNUJU9xk4zr6JH/J8lBjUAghrddfyf/c2XzSf1h0REokrzN34iaFjO/6QJq2aEyemg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSP+uu4/zLgE3ipHd+Y1S/dQtSTbfBtoDJ8K/rGaholSSJC4h8
	Gqz/tCuMrseXYIxFjhviHq3jNb9t56klRqb7PqgK1+9E+Z7lKkiI
X-Google-Smtp-Source: AGHT+IGgc2PLd8xMAdDKm2awjb5Ou0yqMmygvCIIutttnqDXOrOjdhw6ujWNWc7qmb97bZ9dVB+XIA==
X-Received: by 2002:a05:6000:10c5:b0:374:b5fc:d31a with SMTP id ffacd0b85a97d-37d551fb375mr2239677f8f.25.1728669230945;
        Fri, 11 Oct 2024 10:53:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ef4f6sm4489323f8f.107.2024.10.11.10.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:53:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ASoC: rsnd: Refactor port handling with helper for endpoint node selection
Date: Fri, 11 Oct 2024 18:53:46 +0100
Message-ID: <20241011175346.1093649-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the code responsible for selecting the correct device node for
audio endpoint parsing in the rsnd driver. A new helper function
`rsnd_pick_endpoint_node_for_ports()` is introduced to handle the
selection of the endpoint node by checking whether the port is named
'port' or 'ports'.

This change simplifies the logic in both `rsnd_dai_of_node()` and
`rsnd_dai_probe()` functions by replacing repetitive condition checks
with the new helper.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, this patch applies on top of [0]
[0] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
---
 sound/soc/sh/rcar/core.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index eca5ce096e54..c32e88d6a141 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1233,6 +1233,19 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 	return i;
 }
 
+static struct device_node*
+	rsnd_pick_endpoint_node_for_ports(struct device_node *e_ports,
+					  struct device_node *e_port)
+{
+	if (of_node_name_eq(e_ports, "ports"))
+		return e_ports;
+
+	if (of_node_name_eq(e_ports, "port"))
+		return e_port;
+
+	return NULL;
+}
+
 static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
@@ -1278,12 +1291,10 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	 * Audio-Graph-Card
 	 */
 	for_each_child_of_node(np, ports) {
-		if (!of_node_name_eq(ports, "ports") &&
-		    !of_node_name_eq(ports, "port"))
+		node = rsnd_pick_endpoint_node_for_ports(ports, np);
+		if (!node)
 			continue;
-		priv->component_dais[i] =
-			of_graph_get_endpoint_count(of_node_name_eq(ports, "ports") ?
-						    ports : np);
+		priv->component_dais[i] = of_graph_get_endpoint_count(node);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
@@ -1488,15 +1499,16 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	 */
 	dai_i = 0;
 	if (is_graph) {
+		struct device_node *dai_np_port;
 		struct device_node *ports;
 		struct device_node *dai_np;
 
 		for_each_child_of_node(np, ports) {
-			if (!of_node_name_eq(ports, "ports") &&
-			    !of_node_name_eq(ports, "port"))
+			dai_np_port = rsnd_pick_endpoint_node_for_ports(ports, np);
+			if (!dai_np_port)
 				continue;
-			for_each_endpoint_of_node(of_node_name_eq(ports, "ports") ?
-						  ports : np, dai_np) {
+
+			for_each_endpoint_of_node(dai_np_port, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
-- 
2.43.0


