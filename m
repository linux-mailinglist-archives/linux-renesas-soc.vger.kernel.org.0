Return-Path: <linux-renesas-soc+bounces-9656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E420998947
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 16:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1C6E1F28B96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Oct 2024 14:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED991CB501;
	Thu, 10 Oct 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gvbjgmpl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E23B1C9DF6;
	Thu, 10 Oct 2024 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569711; cv=none; b=jZPMCzQH9eX1j6VT72pNUf5ZfxdaSLP4GJYn0iYXfOG1E2/ctaqn2eCKMISvG0SSRsgOohjuUnpcYcLqU79ZDia+kH2hD4zemznp2n9GChe0FLDx8GpHnJLkYLJ6+hGv49HlN7Xxyr8zUambTSX7XeypoV5vfa0UBymCoBg2dmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569711; c=relaxed/simple;
	bh=2INkBWXW27HJCXiErjqURJrmSzXXzHkDKgEdSz1K6Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCOFESD4P8/DpwL4DRWQ/jgC/X0F2BheiT9uNtTbvVP9Qr5SowaFdB1Avds+yqc8tvUm/Me3uikHerIfDL3icGe5I3w5PLWuDdeDmp0LQnMDXtP5EP5cA6FayH7DnQPwkTT1euYAE3UmNRlJ+6xykoka9y7clTVEMlZ659Sa0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gvbjgmpl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d5038c653so284296f8f.2;
        Thu, 10 Oct 2024 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728569708; x=1729174508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7q2FZumu2G20wy1lC59leHuwf1R4fBFyhN95QyjItZo=;
        b=Gvbjgmpl0T8XaJkocrXuLGPvt9lYYiPYeaEPCctjCGOK9ZWTQhnlhsNWIUEp6UDJ84
         zzP1/EjWIqvRsIZiNNz+WI0PAUevNcj/i6AET4IYA2cYd/CghTpCd11EUjFXHk2BptAU
         iXM8omZxwNSaWABnfXC39l65/BqSO8KENDc4pd2qxqaq4duGdvrHaFNc1Wegjr4aeacb
         CAlTOr4EAyRcM5E+38CmprDgCzrum7RsmZi3lVQhTnGhonzLMdp0uJmnEknSg5YHQHFn
         8WSsqYumpznTq8jgTa5QeTCMozNighrLnhI4U+reeq8Wo7qseUmmkjnMVf9cUiHgQbk+
         y7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569708; x=1729174508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7q2FZumu2G20wy1lC59leHuwf1R4fBFyhN95QyjItZo=;
        b=pSr3fIL/2SNUPgfs7ZVxt1FOVuCmFYOjhu+oO+5nnGp/PU3I9cYDSUihQTkt+CUf1v
         PVS9PdKWE5z4vOGuciElE3DBn6GoQ+Xn5tOKVt7uCW/fwmOwSQv/Zhg6qoHF1WMmuzQ4
         NOv1XaA8wpjH/WPgHKu/Ek2pywwwC/3YMHmMOujwij9U0wX0FMN880Sugh5dJ/Gc7Lsz
         jMkHpP6q0lH9W5S6AkvhkiwphxmykGhl+LPfR1J3rq9RGe4/iDrXYriEJA1uBYESVT4z
         M1DrPXkG9YgTqOxwiYtZ33m5Gfj0UiIycb2jEAjGAKrlm4y0yUtvr4H2GYv1GTK+tXNe
         p/7w==
X-Forwarded-Encrypted: i=1; AJvYcCVia0NAXoRa6NEvlEOCzKa5WJjLDbtd6rt275i1BY1tvGLGBbIKhkkI96U5r1icmZTdcULOTw1/gMh1LokxzmPAzVw=@vger.kernel.org, AJvYcCXqJjJI0fMdnka6YRjQ8suwzYhH1ccjC5J52SzerhhUnkWnRzI1gC6Ywfv/CWI1anx0yQc9gJlalPFXcDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRWHKf0OqCaKA0cjItUG6M8jRZqTVK58f9Ib0Sr5AkW1W3vgR
	ElWAfStIJ88rMVSuOwgBmxLFaUWBrM9FaLFBaC34E+dlgpmiVQpN
X-Google-Smtp-Source: AGHT+IGWlJsgC0hO9WtdgVosxWy7j7K1ygTeLaOoc8OonbSc8sUa5VLZwnekUXshOwS0UkFj46WxcQ==
X-Received: by 2002:adf:fe12:0:b0:37d:4f1b:361 with SMTP id ffacd0b85a97d-37d4f1b043amr1044509f8f.25.1728569708181;
        Thu, 10 Oct 2024 07:15:08 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cfcdbsm1681797f8f.58.2024.10.10.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:15:07 -0700 (PDT)
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
Subject: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to endpoint parsing
Date: Thu, 10 Oct 2024 15:14:32 +0100
Message-ID: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the HiHope boards, we have a single port with a single endpoint defined
as below:
....
        rsnd_port: port {
                rsnd_endpoint: endpoint {
                        remote-endpoint = <&dw_hdmi0_snd_in>;

                        dai-format = "i2s";
                        bitclock-master = <&rsnd_endpoint>;
                        frame-master = <&rsnd_endpoint>;

                        playback = <&ssi2>;
                };
        };
....

With commit 547b02f74e4a ("ASoC: rsnd: enable multi Component support for
Audio Graph Card/Card2"), support for multiple ports was added. This caused
probe failures on HiHope boards, as the endpoint could not be retrieved due
to incorrect device node pointers being used.

This patch fixes the issue by updating the `rsnd_dai_of_node()` and
`rsnd_dai_probe()` functions to use the correct device node pointers based
on the port names ('port' or 'ports'). It ensures that the endpoint is
properly parsed for both single and multi-port configurations, restoring
compatibility with HiHope boards.

Fixes: 547b02f74e4a ("ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Geert,
I was intending to rename the sh folder to renesas, do you think that should be OK?
Cheers, Prabhakar
---
 sound/soc/sh/rcar/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 9784718a2b6f..eca5ce096e54 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1281,7 +1281,9 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 		if (!of_node_name_eq(ports, "ports") &&
 		    !of_node_name_eq(ports, "port"))
 			continue;
-		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+		priv->component_dais[i] =
+			of_graph_get_endpoint_count(of_node_name_eq(ports, "ports") ?
+						    ports : np);
 		nr += priv->component_dais[i];
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
@@ -1493,7 +1495,8 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 			if (!of_node_name_eq(ports, "ports") &&
 			    !of_node_name_eq(ports, "port"))
 				continue;
-			for_each_endpoint_of_node(ports, dai_np) {
+			for_each_endpoint_of_node(of_node_name_eq(ports, "ports") ?
+						  ports : np, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
 				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
-- 
2.43.0


