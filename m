Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3575F2DFE4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgLUQ5x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:57:53 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:36459 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgLUQ5x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569701;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=y4tyG5sT6MxlF/DbSxJr93OeVXvJ7o4Gzl9oNns7zwg=;
        b=tWM5EiGzzEjoNOICs8tKbEPLOcu/n3RUzdT2qdFCbpYzBRW9kat1Vt9USwGJXuf6Kx
        0Qjn4nLpQoPdSFOIIPWrvfVysDMjtQXoAtXlerqx184q095zAA04aShv0FeOzspvZM0J
        0fFkgxb4DTEqnN8dUe8421UAiw4HDIzF+td/qbu7gukVzx7zsxEP5Lxg6P1IhEdSLLri
        Y53ehgGc3Ok3xn2fJs10TicRySVFwIyFmmUxH57HUI+ktS3k7SNjeGwcFoJMH0whGYPz
        7unIhIYjgz+VMggENG1LYhpLpJfzu41FiKANpl24CZciscmAshnNVeCX8ONjdUZjIxoA
        8myg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGst0KB
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:54:55 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 3/5] pinctrl: renesas: add PORT_GP_CFG_{2,31} macros
Date:   Mon, 21 Dec 2020 17:54:46 +0100
Message-Id: <20201221165448.27312-4-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165448.27312-1-uli+renesas@fpond.eu>
References: <20201221165448.27312-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/sh_pfc.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 00bfda90a7b7..747dfdb331bd 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -460,6 +460,11 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	fn(bank, pin, GP_##bank##_##pin, sfx, cfg)
 #define PORT_GP_1(bank, pin, fn, sfx)	PORT_GP_CFG_1(bank, pin, fn, sfx, 0)
 
+#define PORT_GP_CFG_2(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg)
+#define PORT_GP_2(bank, fn, sfx)	PORT_GP_CFG_2(bank, fn, sfx, 0)
+
 #define PORT_GP_CFG_4(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg),				\
@@ -581,9 +586,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 	PORT_GP_CFG_1(bank, 29, fn, sfx, cfg)
 #define PORT_GP_30(bank, fn, sfx)	PORT_GP_CFG_30(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_32(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_31(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_30(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 30, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 30, fn, sfx, cfg)
+#define PORT_GP_31(bank, fn, sfx)	PORT_GP_CFG_31(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_32(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_31(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 31, fn, sfx, cfg)
 #define PORT_GP_32(bank, fn, sfx)	PORT_GP_CFG_32(bank, fn, sfx, 0)
 
-- 
2.20.1

