Return-Path: <linux-renesas-soc+bounces-30840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFTdM1ePz2mmxAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:58:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D8439313F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 11:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8A833123FB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D133B585C;
	Fri,  3 Apr 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYxKyvUU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F039F192
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209820; cv=none; b=OJQSQGMeZuzUKjmGm/R7h2SuFnvURQBSi7PRasYNgylAD4eK8vUuiTuSI3r0jpKZAnYM2ekpYolkztB69CzoGdj3kBxV5JDUoDVphRMcgKMHIq1ogr8ynlbCSiQwW/djIXTCFqz1wBb9E4wLYunbpPE2vtdklTeioxV4pur9zmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209820; c=relaxed/simple;
	bh=wBHTUA9/Q9wUcSwmgIxuQFvTHWzjq8YLywECfpWPKo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkZ2btq0DFzfo0Qt4uLCWFHk4RkWC2xfoBaIqdLg/oewdzBoG7JVOhgjzCjPWXoStWmbFufh5IqmddUdBdSZlGMYtPYiXSWAusYA0Ty6BOj6cCwyYM9NBsyhh9HrMOXavqi6yhSfDCdbkebWrWRt6xrTA00yuN0fz5wAquLMJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYxKyvUU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so13889605e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775209810; x=1775814610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENtFbNBqdLLLzbNzxsoOSr+1U0jkqzi5wmYuAW8qLKM=;
        b=MYxKyvUUbrqUIDCvWaTRkI2DxM/WBDHInVLHPzqdGwI+1lNRSfWcTjTQUYdKuVYDms
         s19WKB9pGZifP9jiyfBm94pvi3aWWtp+P3/l1tHyqzdkuwrSDJPd9/OlnunUY9FWY7PH
         L2uCBkNbFThefG7hbIh4q0xVAkIKhzGXCZ/GIBab9uz6LvmX/zlbFdZ/8j43TPdCTY6p
         cA8xVtH9uB4LSUy11//gP7RsHlcu/HNT3Kwo+6BW1UjoRxZuS/9fPwHlnN8NsRFeJ/KL
         k3hDnOs9chuxSHGObZyEZB1+cNZvWJ6etM+nz4bKpZqQKHZW5DbsxgqSYF0mc6Bz5ygl
         Yf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209810; x=1775814610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ENtFbNBqdLLLzbNzxsoOSr+1U0jkqzi5wmYuAW8qLKM=;
        b=QLgZjqlA0JAZkKHO8pGfNaB7nmNL5wWmy/lCq3rZita6uHz3gDi/SWiiKUb6hqx8DJ
         Pn7V+NTLYdZD900o8zq8zXbT/qqlmj7JHTSuOex5lvZr/rR+s8goEhhOMaew2W39fsPW
         D4d5zcB/xPEnqU7e2hdJZHFYkbXqqavGdzb7rX+rsR3EnosZbGOzgJXFyT1zUceb2l9m
         vlWctIByab/u2zOyYrsI1CptjdjqY3Vwr1XL2ilkT0dmByNjpVgITHmjtFMEdepluTSg
         qBqlO5mCCe8M9cz7b67W+KpTpb7UBjY8rFYmC+RUMkL1s3bLmuybNJMmT2wajftARQ6Z
         FTag==
X-Forwarded-Encrypted: i=1; AJvYcCXIMDVjmF9jYTyPG9S8tNLAB5FxrXjoxxfniLqYhJwYLhxDWL4tp2RIfD8tLhe1tauDNri0JO0tY+YK0QNKz3/mzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvzakDIfuEcRihiQvlGLiFSKFL8jfDT/7PA6dfNCie1CCKYxi
	08WQ+7IHQurvaghNfS+vsUoafLNpC9tC/+bgXLqZk5JjDbliwTy0kTSi
X-Gm-Gg: ATEYQzyW+C7sjkw7zE6wXzAUP3jYIr7qhn9Ct9UTgJFVWYjkXoJEZ25GbCRdxKIpqjW
	PCVdqb2OHFs/E/GVNnkujW0OH8l97RCPeHuc+2DglgnGQkYnjOWxtTFWBItMaXMsolaXKCAzhtO
	JvkZuOl4Ugl4qYlobM9JMQ7DY2plABjwpWkAXaV42q/202sEDN12k8G7wM1wnxGgGSIYpQo2Tmm
	Pz5o8ZM4KAZxzwsCAVwOpx8HhSH3V35oE/GIgeXusYWJN0IWpuDxQ4YbqjxXKa/spoiV6gGaT7X
	pjUI1D+Hiu0m4H43M6JyU5lZ/LZMTUGQ2yOjPFvOj+hBP8ddfMWCwd3CmIxsTaWPNkehhmC9ni8
	f3q74G17vGq9d0FPnXq5oqKoxTOCvEfUVUMzJyUs6rTVeiP1nR5TBU8AIrHCD/pqCKyXru9qFLD
	sIOl7PZxwUT70bhxJVX67ygz9mgJq0bQPThl9RdYOhj1eQtVuB
X-Received: by 2002:a05:600c:5292:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488996b021fmr40270225e9.3.1775209810200;
        Fri, 03 Apr 2026 02:50:10 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:58b8:b4b6:c8e1:8690])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fc89c0sm25965355e9.1.2026.04.03.02.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:50:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/3] can: rcar_canfd: Add support for Bus-Off recovery mode selection
Date: Fri,  3 Apr 2026 10:49:59 +0100
Message-ID: <20260403095003.104542-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403095003.104542-1-biju.das.jz@bp.renesas.com>
References: <20260403095003.104542-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30840-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 79D8439313F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The CAN-FD IP supports the below Bus-Off recovery modes:
1) ISO11898-1 compliant
2) Entry to Channel Halt mode automatically at bus-off entry
3) Entry to Channel Halt mode automatically at bus-off end
4) Entry to Channel Halt mode (in bus-off state) by program request

Add support for Bus-Off recovery mode selection via the
renesas,bus-off-recovery-mode device tree property. If the property is
absent, it defaults to RCANFD_CCTR_BOM_BENTRY (entry to Channel Halt mode
automatically at bus-off entry) for backward compatibility.

Replace the individual BOM (Bus-Off Recovery Mode) bit definitions with a
single GENMASK-based macro RCANFD_CCTR_BOM and use FIELD_PREP to set the
BOM field in the channel control register.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/can/rcar/rcar_canfd.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index eaf8cac78038..1d6d667b8816 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -114,10 +114,7 @@
 /* RSCFDnCFDCmCTR / RSCFDnCmCTR */
 #define RCANFD_CCTR_CTME		BIT(24)
 #define RCANFD_CCTR_ERRD		BIT(23)
-#define RCANFD_CCTR_BOM_MASK		(0x3 << 21)
-#define RCANFD_CCTR_BOM_ISO		(0x0 << 21)
-#define RCANFD_CCTR_BOM_BENTRY		(0x1 << 21)
-#define RCANFD_CCTR_BOM_BEND		(0x2 << 21)
+#define RCANFD_CCTR_BOM			GENMASK(22, 21)
 #define RCANFD_CCTR_TDCVFIE		BIT(19)
 #define RCANFD_CCTR_SOCOIE		BIT(18)
 #define RCANFD_CCTR_EOCOIE		BIT(17)
@@ -135,6 +132,7 @@
 #define RCANFD_CCTR_CHDMC_COPM		(0x0)
 #define RCANFD_CCTR_CHDMC_CRESET	(0x1)
 #define RCANFD_CCTR_CHDMC_CHLT		(0x2)
+#define RCANFD_CCTR_BOM_BENTRY		(1)
 
 /* RSCFDnCFDCmSTS / RSCFDnCmSTS */
 #define RCANFD_CSTS_COMSTS		BIT(7)
@@ -470,6 +468,7 @@ struct rcar_canfd_global {
 	struct clk *can_clk;		/* fCAN clock */
 	struct clk *clk_ram;		/* Clock RAM */
 	unsigned long channels_mask;	/* Enabled channels mask */
+	u32 bom;			/* Bus-Off recovery mode */
 	bool extclk;			/* CANFD or Ext clock */
 	bool fdmode;			/* CAN FD or Classical CAN only mode */
 	bool fd_only_mode;		/* FD-Only mode for CAN-FD */
@@ -891,8 +890,7 @@ static void rcar_canfd_configure_controller(struct rcar_canfd_global *gpriv)
 		rcar_canfd_set_bit(gpriv->base, RCANFD_CCTR(ch),
 				   RCANFD_CCTR_ERRD);
 		rcar_canfd_update_bit(gpriv->base, RCANFD_CCTR(ch),
-				      RCANFD_CCTR_BOM_MASK,
-				      RCANFD_CCTR_BOM_BENTRY);
+				      RCANFD_CCTR_BOM, gpriv->bom);
 	}
 }
 
@@ -2110,6 +2108,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	bool fdmode = true;			/* CAN FD only mode - default */
 	char name[9] = "channelX";
 	u32 ch, fcan_freq;
+	u32 prop;
 	int i;
 
 	info = of_device_get_match_data(dev);
@@ -2169,6 +2168,11 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "renesas,fd-only"))
 		gpriv->fd_only_mode = true; /* FD-Only mode for CAN-FD */
 
+	if (of_property_read_u32(dev->of_node, "renesas,bus-off-recovery-mode", &prop) < 0)
+		prop = RCANFD_CCTR_BOM_BENTRY; /* default */
+
+	gpriv->bom = FIELD_PREP(RCANFD_CCTR_BOM, prop);
+
 	gpriv->rstc1 = devm_reset_control_get_optional_exclusive(dev, "rstp_n");
 	if (IS_ERR(gpriv->rstc1))
 		return dev_err_probe(dev, PTR_ERR(gpriv->rstc1),
-- 
2.43.0


