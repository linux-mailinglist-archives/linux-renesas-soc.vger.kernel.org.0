Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BE91CD59F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 11:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgEKJp7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 05:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728209AbgEKJp7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 05:45:59 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0D0C061A0C;
        Mon, 11 May 2020 02:45:57 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m7so3720467plt.5;
        Mon, 11 May 2020 02:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcK4SfwbcLr+s8byI3BvwLALcx36TKx0SQI4h58vtQ0=;
        b=VVK7xaej2/0RPV3c4V4ArF7OVCfQ4fH9AkRwZhFkkBH+6+glMD4+/ZXpzVGLto+KqP
         ablwhPYEpXojQgHEixGyehvIvKOPCi89nHLe5TjtBlPtR0Qh2jSwLD5r0ukFeAJAI2Tn
         Q6igwr0nIKhx9hIiw/3ixpR/+r5RBE2S0G0V/KHUCyx0d9/Od1kxu6HpwPv3hJJgvg6D
         YHNgbgQvea0pvEf4nUaF6IpSe6pttQB3c4DsNF1a5Nx54y7XmZKBPQF0biYL1y4ugoQr
         Vv9D8FexwQAQ77uVRuMyW+Se8iCoTQw4kwdJ01T6We8WyR2Sn3qoQEYIRixnfM2v74XW
         7NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcK4SfwbcLr+s8byI3BvwLALcx36TKx0SQI4h58vtQ0=;
        b=eO39T0VV31IbNL1FMWZxt/ew39/z+zae5SqmTKjN7Gkse82XkNWsdBVT6FqSqC07gG
         Q4PjjBe9LDBnfw9/lAnXc1hUVBCaOEF7EoPfbcDlmgRUy7Bd41KGlN9jA0awInibFxlC
         sufitl6YzamBvsJzEWkkfU/PI9PtMUXTPWeDepkQdW3OG09LnBhQ72oLq3tI8Ug1M4ap
         LDUaR5f2wppWklvKK4ym5seZjdticSyY35vm42o8Aj/yvMxlhUY7lRgFj/VvOCiyzWOI
         ebG0g3yD9L1EvHzunmEd11cJJRtJlsaxV0G3YqF93KjGv6BUlDB8ph+xmtSybcSF7xfE
         ng/A==
X-Gm-Message-State: AGi0PubEh6S125lE4004xaUI63m3Se2wI4Y2ZOcr84GtbBx8V+vnGMbg
        avR4dyaJam0I9B0lY9dOEi0=
X-Google-Smtp-Source: APiQypLAsE8fvF5iJDqhY9NuQzwixWxZrqAfTfhheqUAorPs61gCHf4xVs9ll7wFXFHfN+38W/ZlAQ==
X-Received: by 2002:a17:90a:c293:: with SMTP id f19mr19714450pjt.96.1589190357257;
        Mon, 11 May 2020 02:45:57 -0700 (PDT)
Received: from localhost.localdomain ([124.156.210.110])
        by smtp.gmail.com with ESMTPSA id i3sm623798pfe.44.2020.05.11.02.45.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 02:45:56 -0700 (PDT)
From:   Yongbo Zhang <giraffesnn123@gmail.com>
To:     broonie@kernel.org, lgirdwood@gmail.com
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongbo Zhang <giraffesnn123@gmail.com>,
        Chen Li <licheng0822@thundersoft.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Date:   Mon, 11 May 2020 17:45:20 +0800
Message-Id: <20200511094520.4648-1-giraffesnn123@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SSI BUSIF buffer is possible to overflow or underflow, especially in a
hypervisor environment. If there is no interrupt support, it will eventually
lead to errors in pcm data.
This patch adds overflow and underflow interrupt support for SSI BUSIF buffer.

Reported-by: Chen Li <licheng0822@thundersoft.com>
Signed-off-by: Yongbo Zhang <giraffesnn123@gmail.com>
Tested-by: Chen Li <licheng0822@thundersoft.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/gen.c  |   8 +++
 sound/soc/sh/rcar/rsnd.h |   9 +++
 sound/soc/sh/rcar/ssi.c  | 142 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/sound/soc/sh/rcar/gen.c b/sound/soc/sh/rcar/gen.c
index af19010b9d88..8bd49c8a9517 100644
--- a/sound/soc/sh/rcar/gen.c
+++ b/sound/soc/sh/rcar/gen.c
@@ -224,6 +224,14 @@ static int rsnd_gen2_probe(struct rsnd_priv *priv)
 		RSND_GEN_S_REG(SSI_SYS_STATUS5,	0x884),
 		RSND_GEN_S_REG(SSI_SYS_STATUS6,	0x888),
 		RSND_GEN_S_REG(SSI_SYS_STATUS7,	0x88c),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0, 0x850),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE1, 0x854),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2, 0x858),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE3, 0x85c),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE4, 0x890),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE5, 0x894),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE6, 0x898),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE7, 0x89c),
 		RSND_GEN_S_REG(HDMI0_SEL,	0x9e0),
 		RSND_GEN_S_REG(HDMI1_SEL,	0x9e4),
 
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index ea6cbaa9743e..d47608ff5fac 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -189,6 +189,14 @@ enum rsnd_reg {
 	SSI_SYS_STATUS5,
 	SSI_SYS_STATUS6,
 	SSI_SYS_STATUS7,
+	SSI_SYS_INT_ENABLE0,
+	SSI_SYS_INT_ENABLE1,
+	SSI_SYS_INT_ENABLE2,
+	SSI_SYS_INT_ENABLE3,
+	SSI_SYS_INT_ENABLE4,
+	SSI_SYS_INT_ENABLE5,
+	SSI_SYS_INT_ENABLE6,
+	SSI_SYS_INT_ENABLE7,
 	HDMI0_SEL,
 	HDMI1_SEL,
 	SSI9_BUSIF0_MODE,
@@ -237,6 +245,7 @@ enum rsnd_reg {
 #define SSI9_BUSIF_ADINR(i)	(SSI9_BUSIF0_ADINR + (i))
 #define SSI9_BUSIF_DALIGN(i)	(SSI9_BUSIF0_DALIGN + (i))
 #define SSI_SYS_STATUS(i)	(SSI_SYS_STATUS0 + (i))
+#define SSI_SYS_INT_ENABLE(i) (SSI_SYS_INT_ENABLE0 + (i))
 
 
 struct rsnd_priv;
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 4a7d3413917f..87a2182a4514 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -372,6 +372,9 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	u32 wsr		= ssi->wsr;
 	int width;
 	int is_tdm, is_tdm_split;
+	int id = rsnd_mod_id(mod);
+	int i;
+	u32 sys_int_enable = 0;
 
 	is_tdm		= rsnd_runtime_is_tdm(io);
 	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
@@ -447,6 +450,38 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 		cr_mode = DIEN;		/* PIO : enable Data interrupt */
 	}
 
+	/* enable busif buffer over/under run interrupt. */
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+					SSI_SYS_INT_ENABLE(i * 2));
+				sys_int_enable |= 0xf << (id * 4);
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE(i * 2),
+					       sys_int_enable);
+			}
+
+			break;
+		case 9:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+					SSI_SYS_INT_ENABLE((i * 2) + 1));
+				sys_int_enable |= 0xf << 4;
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE((i * 2) + 1),
+					       sys_int_enable);
+			}
+
+			break;
+		}
+	}
+
 init_end:
 	ssi->cr_own	= cr_own;
 	ssi->cr_mode	= cr_mode;
@@ -496,6 +531,13 @@ static int rsnd_ssi_quit(struct rsnd_mod *mod,
 {
 	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
 	struct device *dev = rsnd_priv_to_dev(priv);
+	int is_tdm, is_tdm_split;
+	int id = rsnd_mod_id(mod);
+	int i;
+	u32 sys_int_enable = 0;
+
+	is_tdm		= rsnd_runtime_is_tdm(io);
+	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
@@ -517,6 +559,37 @@ static int rsnd_ssi_quit(struct rsnd_mod *mod,
 		ssi->wsr	= 0;
 	}
 
+	/* disable busif buffer over/under run interrupt. */
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+						SSI_SYS_INT_ENABLE(i * 2));
+				sys_int_enable &= ~(0xf << (id * 4));
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE(i * 2),
+					       sys_int_enable);
+			}
+
+			break;
+		case 9:
+			for (i = 0; i < 4; i++) {
+				sys_int_enable = rsnd_mod_read(mod,
+					SSI_SYS_INT_ENABLE((i * 2) + 1));
+				sys_int_enable &= ~(0xf << 4);
+				rsnd_mod_write(mod,
+					       SSI_SYS_INT_ENABLE((i * 2) + 1),
+					       sys_int_enable);
+			}
+
+			break;
+		}
+
 	return 0;
 }
 
@@ -622,6 +695,11 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 			int enable)
 {
 	u32 val = 0;
+	int is_tdm, is_tdm_split;
+	int id = rsnd_mod_id(mod);
+
+	is_tdm		= rsnd_runtime_is_tdm(io);
+	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
 
 	if (rsnd_is_gen1(priv))
 		return 0;
@@ -635,6 +713,19 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 	if (enable)
 		val = rsnd_ssi_is_dma_mode(mod) ? 0x0e000000 : 0x0f000000;
 
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+		case 9:
+			val |= 0x0000ff00;
+			break;
+		}
+	}
+
 	rsnd_mod_write(mod, SSI_INT_ENABLE, val);
 
 	return 0;
@@ -651,6 +742,10 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
 	u32 status;
 	bool elapsed = false;
 	bool stop = false;
+	int is_tdm, is_tdm_split;
+
+	is_tdm		= rsnd_runtime_is_tdm(io);
+	is_tdm_split	= rsnd_runtime_is_tdm_split(io);
 
 	spin_lock(&priv->lock);
 
@@ -672,6 +767,53 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
 		stop = true;
 	}
 
+	status = 0;
+
+	if (is_tdm || is_tdm_split) {
+		switch (id) {
+		case 0:
+		case 1:
+		case 2:
+		case 3:
+		case 4:
+			for (i = 0; i < 4; i++) {
+				status = rsnd_mod_read(mod,
+						       SSI_SYS_STATUS(i * 2));
+				status &= 0xf << (id * 4);
+
+				if (status) {
+					rsnd_dbg_irq_status(dev,
+						"%s err status : 0x%08x\n",
+						rsnd_mod_name(mod), status);
+					rsnd_mod_write(mod,
+						       SSI_SYS_STATUS(i * 2),
+						       0xf << (id * 4));
+					stop = true;
+					break;
+				}
+			}
+			break;
+		case 9:
+			for (i = 0; i < 4; i++) {
+				status = rsnd_mod_write(mod,
+						SSI_SYS_STATUS((i * 2) + 1));
+				status &= 0xf << 4;
+
+				if (status) {
+					rsnd_dbg_irq_status(dev,
+						"%s err status : 0x%08x\n",
+						rsnd_mod_name(mod), status);
+					rsnd_mod_write(mod,
+						SSI_SYS_STATUS((i * 2) + 1),
+						0xf << 4);
+					stop = true;
+					break;
+				}
+			}
+			break;
+		}
+	}
+
 	rsnd_ssi_status_clear(mod);
 rsnd_ssi_interrupt_out:
 	spin_unlock(&priv->lock);
-- 
2.26.2

