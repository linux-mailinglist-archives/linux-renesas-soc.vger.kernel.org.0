Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07FCE1CD5D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 12:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgEKKE1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 06:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726013AbgEKKE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 06:04:26 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B631FC061A0C;
        Mon, 11 May 2020 03:04:26 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 18so4529610pfx.6;
        Mon, 11 May 2020 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6HT+D8qGn5FQvMIC1CwK3hsMFH61xpFNDbWjTu3VMM=;
        b=aV4EhMc7Ex2nZyKOnKYis3JOGkQ6hJ7bimcFJGgcCvzYbateTJvRhV4bM62Qr4EMvp
         ffy+ofog7ncjWMiELxAu0sp8ACiCD/oLCH9ApDT9RBmsrH5UEmpq74gwRlKIXHq/mVI3
         bSfxDTmiMhCSBFMv+lLqFpWgAnsbY6/i6xiUKZs3K4KTuObwrnBxvwpNinH8Ae1CuCbY
         Gv18Nz/cdjraGtTLUKi/md6SQqAP5wsXjoeLb3ZTmwGPSIFRUnPKPODLopLwioUdCKit
         KscshjVaP1MYFXpBcIz/wXtS0ezMw5Z00cZrXUqgxpIUve0NclYB1sT+GRASla6dL+8u
         w9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6HT+D8qGn5FQvMIC1CwK3hsMFH61xpFNDbWjTu3VMM=;
        b=ZtQSe8DgeJo1Se5Br59QcHvjZcze24/tIYWQxwQKnEQQAvPNewz2qKHbKksug86q5K
         NbAkkQjV8G3TzNYZzmY6od8FT8aMHXUjR5v8yaWadubcng0lndTYgZkm3AXLaYkeGlZS
         izKD3SQuQvPMbBeWB6cVAEqCiqyPOwT36CVI84z+UUvyiW59fbVKQ6KA5Xuvb2J+FV+h
         WWnNk6f2r/aGgrBJ2vOSJeMUfy3BzNWyeCLEH9+gku3qVKjA5IreTU2gHGNCAoBqxaVQ
         1c/DWQqCE30WnsJSLyR3K643QE1mYb0nhDnubR/wqn7/8mbXSH0e2ZOnMkbDwLrC9uZW
         JKAA==
X-Gm-Message-State: AGi0PuZm8QBugfCCJYUCKwgD3KQHY77GGQ/ykrq+HWrxz0JlPLJYBTDE
        3Yy1o1kpJNX1HROcpIBzWpQ=
X-Google-Smtp-Source: APiQypJRT688lN+LkhYtMoC8Y+XZooe5DzxiOdeQOKkorCqUrZivoS4hIBDf/JO62tX33ylrqZDiGQ==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr12657061pgj.2.1589191466154;
        Mon, 11 May 2020 03:04:26 -0700 (PDT)
Received: from localhost.localdomain ([124.156.210.110])
        by smtp.gmail.com with ESMTPSA id s136sm9015319pfc.29.2020.05.11.03.04.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:04:25 -0700 (PDT)
From:   Yongbo Zhang <giraffesnn123@gmail.com>
To:     broonie@kernel.org, lgirdwood@gmail.com
Cc:     alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongbo Zhang <giraffesnn123@gmail.com>,
        Chen Li <licheng0822@thundersoft.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v1] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Date:   Mon, 11 May 2020 18:04:15 +0800
Message-Id: <20200511100415.12502-1-giraffesnn123@gmail.com>
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

Changes since v0 (thanks for the feedback Morimoto):
- Replace the value of a register variable
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

