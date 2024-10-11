Return-Path: <linux-renesas-soc+bounces-9683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340999A49A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 15:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4742858CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 13:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F7F2185B3;
	Fri, 11 Oct 2024 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5AuFerg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A423216A3B;
	Fri, 11 Oct 2024 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652314; cv=none; b=dLlBew2vSHxDilgaEkdxczHpD0eYPtNiKzqKFbDCSj5tKw6R6xxKgmR5Inx4x/NokAne9m8aHeJvYPUVFIEUdxtnCtiZ8TueVJ844u99cNtAUnRag2MXcZP1877ZwE9N/TqgBFQ/VR7f/ddZ2fegCbRPWCrZqwQJS/fpnhX17WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652314; c=relaxed/simple;
	bh=CRdM9+7MZZqcFi+ijeiqGXWXZ0vqd+EhrlKqzTgUHq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2WCyLMIeVbCevCRPU5C+3014YZM2ap/RIvY0kzlJKHVoY9/uGUaYSziraOn4UAOUu3wJGM+NGjTxU4YE5h9e0AKe6T2TbHnSzpx8LJEhzrAZ+n1KxMdrRpzqt7tajgGASIW2EmeUAqXqZBtM9aUDZ/8vt7EYf5OvZ/GZZ1KNB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5AuFerg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d39d9f782so1253778f8f.1;
        Fri, 11 Oct 2024 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728652311; x=1729257111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzIhAn2tTcX9dvci0vNq77FW+h13AP/SOK9t5jT/+As=;
        b=c5AuFergj/WuZo40HoU341tsLU4cNh4EeftdfWLrkLDasaGDGIbvfZc4ndSHtPp4Gb
         AH9TbjTrGKh2RHWBv0gS/9KmCyxbJnjFAjMj7a2hcB10h6XYtZM6Vw7+fH2AvmnH6YBW
         8uxXhRkVY7SzmRZYTph/4QgneojF7A9aIpeec3cfX86yvQ7ieIwdjih1vunBbEDMMi9h
         B2kvUqNOZBXnvU5hKASOipj5S97u1bsaKnK3N/wpHa3Z4pI4u2+nVU8RoNADKyIbYfMP
         tiaQYZI7mQ4krnuwLC0EA3vrqIQ1UrBysCBNby+viATUvbnMWVjK7Lbnw1MkmwgXaKdH
         31pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652311; x=1729257111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzIhAn2tTcX9dvci0vNq77FW+h13AP/SOK9t5jT/+As=;
        b=IpWcL5ANt4VmVBDRDNLiXxQm1wFFM1sBJXUIJr0MvMxI+vNpWdGk4gegfJ8h/qL3E3
         t78PnEJSYRpf/zCAoWRrVmWpmGeEWWBcJP8brEzbzfDvHLPAy0SGLZFis1Piuy2tHXoB
         hjFqA/KHXU3YLk8/EUCAPXQWcCnVc+0XBDH9JNmE4ac6VBE56tYLbrStL2A3m2iKVwP+
         biP8m+xNXduohSWwsWmuwiCF3ZfvI5GZCuinQGZhOMoN4GS28ov89J9dMribdm7jYGHa
         U/GgX/KiBLpLWKpb4v2z+NIGq2AT1gjgQYc2/myDj3Ap7RJfo4AaqyTyx0e3nwQw7FAh
         3xbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo83/cMq9n7h1KiFzU9Mb0Z1rnwYtqq6J3ZjQzkkTrpJyhfswK3rLYevvbuR2Ul6BrB24dz8c7hQmKH9M=@vger.kernel.org, AJvYcCX3/6JdJgL8t6zRu696m88XlC1G3orGjcF9UudUXd0xbpjCkhUSEZnOVddqXNXJaeKlgY+R1K3Q1lBRsPWQs/n7AKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeRMKoGuxH01y/7znDCRN6o1afjxaWnNGWY2EO5uODb5hiSNH
	0dB9wpbDVMFsZI2R9f/moZSNoY2/5ur9TFD+h72mQKvQ7uPwJYU3
X-Google-Smtp-Source: AGHT+IEc7QnSsEmYN9KRSEJk2GsFcjXE5wjkyJOlckXT1cchZfsRChDr2vsMChNzV2WIGOiu03tjWw==
X-Received: by 2002:adf:f189:0:b0:37d:5338:872c with SMTP id ffacd0b85a97d-37d551afa0emr1668230f8f.1.1728652310520;
        Fri, 11 Oct 2024 06:11:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd1b7sm3925025f8f.37.2024.10.11.06.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:11:50 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: rsnd: Fix probe failure on HiHope boards due to endpoint parsing
Date: Fri, 11 Oct 2024 14:10:40 +0100
Message-ID: <20241011131040.1059130-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On HiHope boards, the audio configuration uses a single port with one
endpoint, defined as:

    rsnd_port: port {
        rsnd_endpoint: endpoint {
            remote-endpoint = <&dw_hdmi0_snd_in>;
            dai-format = "i2s";
            bitclock-master = <&rsnd_endpoint>;
            frame-master = <&rsnd_endpoint>;
            playback = <&ssi2>;
        };
    };

Commit 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Audio
Graph Card/Card2") added support for multiple ports. This caused probe
failures on HiHope boards because the device node pointers used to
retrieve the endpoint were incorrect.

This patch resolves the issue by introducing a new helper function,
`rsnd_pick_endpoint_node_for_ports()`, which retrieves the correct device
node pointer by checking if the port is named 'port' or 'ports'. The
`rsnd_dai_of_node()` and `rsnd_dai_probe()` functions are updated to use
this helper, ensuring proper endpoint parsing in both single-port and
multi-port configurations. This restores compatibility with HiHope boards.

Fixes: 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Added a helper function rsnd_pick_endpoint_node_for_ports()
- Updated commit message
- Dropped ACK from Morimoto-san
---
 sound/soc/sh/rcar/core.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 9784718a2b6f..b74061b04968 100644
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
@@ -1278,10 +1291,10 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	 * Audio-Graph-Card
 	 */
 	for_each_child_of_node(np, ports) {
-		if (!of_node_name_eq(ports, "ports") &&
-		    !of_node_name_eq(ports, "port"))
+		node = rsnd_pick_endpoint_node_for_ports(ports, np);
+		if (!node)
 			continue;
-		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+		priv->component_dais[i] = of_graph_get_endpoint_count(node);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
@@ -1486,14 +1499,15 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
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
-			for_each_endpoint_of_node(ports, dai_np) {
+			for_each_endpoint_of_node(dai_np_port, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
-- 
2.43.0


