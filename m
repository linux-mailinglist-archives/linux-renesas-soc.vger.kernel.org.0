Return-Path: <linux-renesas-soc+bounces-29255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGnwJ+PCsWmdFAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:30:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4C2269581
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 20:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 225263067FD3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 19:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ED53EC2DE;
	Wed, 11 Mar 2026 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvxTfiuT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43533EB7FA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257115; cv=none; b=gpsT46tXA9fsp7QhNX/jXEW2Kaakzh4OY0wUB39UfXKcnFAEeGRxYCwTG1iRyph7riWeAYkNMVgGt104MV9EdI16E4WbCmeDaqoQQ2PIBhJIiEZu+Y4TedeuEaTdX4lq62BbMfVg7d1WXW64wfLp8uhxeASgekLPIqy226BnCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257115; c=relaxed/simple;
	bh=H3rzEFQSDOGae6QaVHaLmijR/DQxOf7GZIaAiT8p0zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B80/cKu2sEFtIPVxv0TznEjypHHZOWxFe8I4eP/Ymj4CbKbjfC/uPCERbsDxWQLnIScgc1vt5z+qYiTfg0o+ziDSAPR5/eyzH8gn1F+vn8W0NEAciBNO4IqOKWwGWIug26IxBN+FRoIcY5zgmFxdcGgCvhqrMudNatnhQ7gOgDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvxTfiuT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c4a93841so185511f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773257112; x=1773861912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlNbQH+pkHfGHTB/Vhm2Cynf/0nQUPkfJv8h+H5KpnM=;
        b=UvxTfiuTykYWRbwx2K8DmjBOKCzZ1BBJbrxXbL6cMQ8rZ8DKFt7Ja/MGP8vA73DJmH
         eo90WsIxk3pEwljyZJ6WsBb/aqp5mt8U9P5h8N0dZF4fsLDLDOv6DIyJfzdiIAWP7Zi/
         FpV2IvMXG9OGdHwj6+yp3ErGEOA+ceZNIfAPu6Iise+4xMrmSP2g0HGnRk/7VYlV4sdW
         rbsNxgTkOvZCEEb7UnyvOiIZHJT471uw0vYxMcpj7q+Oa+XNcYXp9nnvWlLCwH2hxIkv
         ENkCsINPlugf9AdFN5tjgCVVBdiqDQo9a+GjadTJqc+wyrVprADWObXj8ovNKUBSfUCS
         JNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257112; x=1773861912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FlNbQH+pkHfGHTB/Vhm2Cynf/0nQUPkfJv8h+H5KpnM=;
        b=JF2D8/f/MMeSYO5SXzAwtKqAHBXq6XGXySAPOWBgkDH6RiW9fxEFNl+Q7QZo3hovni
         ntw42E9l8PSX1eh2rQH+ubzkJeeqWWHmlxlGKZ0mDap42O48gANIUYP7o0cZJsQa5daW
         fN4IadrrG15iRyrwctF+PurKBLB9raaaKY5amQSu+1T+Y3ph81yt7gNTwplSQVTfFBHH
         o9Ijt+kCB0nLaPazKD6S4bG9V4XIxOa92B4AulGGza/RWFTKZ5O4OQiYYg//o3n3DiJ5
         NG+EEBx5BSgdRzwSZshDcFWgBjYeZG4mzsO32Li0ur3eyuhgVC5KifbMRBuDrai1saHQ
         xdpA==
X-Forwarded-Encrypted: i=1; AJvYcCXMw0NsbrdibVSZXzUkkg++cNXqFVxI5PCSMt7CAe/i5rByMTfidOMAN4gsc9klFbSSqo2FNBGEMQ1laQ+rJn96Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwMfjWfzMhD1dQUQLNXT9kHKCv1jATDuAVFVObhq24yDtuSXB
	RcTMIZ3EunaqSW3A3Q3g2V6SWZWUfzCqZCGbagn+BYU8ypzY/cvzJPTO
X-Gm-Gg: ATEYQzx8dekuowIe9oMsuWQMba2S+7HgfB15w/1qFGlFyKhDrAjkWRLDJ62EB2T8U2D
	k4c+wBafnPnnbm74uCZ8z4WpvW76l4/jAIqSkoyRiDoN0svLcL8+EfdOuCDYhAqAXiqzYILWgkl
	YEWibMBhJU5CGmosd8EhOklOr5grqn+oLYhCd7A3FzgzKYLFrCmL8eXZYzEXKGvnb7yiITMOjoJ
	o1CTS4UgZ7mq6Hxk8RpgiYz4yxv6vgaF8EKknd14acJfKq1Mcx3HvqG83ttzJRyLNy6LQUs2ovT
	qcdrAcAGPXtbhgKd2fXa7fEUkC9Mmt55tb+nV5ObMSZj/n/Ho5shNti/fToOBFhCabRXCvWSJm2
	OPppNYsSG6N1Q/BrOMI8vJVgz2hLObAhXgtaZU18bgmlCtbBFISHZc1KqEsyo1VRUbsJQ/k0HAN
	7CzjE/OucY2xDkxP175ztLGfpoTzyEFIt05n0vGf9yOUBipMlwpxEAgADX1f4=
X-Received: by 2002:a05:6000:604:b0:439:e334:426a with SMTP id ffacd0b85a97d-439f8435927mr7479105f8f.46.1773257112339;
        Wed, 11 Mar 2026 12:25:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:38b7:8ca3:cb55:d344])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm1323210f8f.21.2026.03.11.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:25:12 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 13/15] irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
Date: Wed, 11 Mar 2026 19:24:44 +0000
Message-ID: <20260311192459.609064-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29255-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1B4C2269581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of external interrupts in RZ/G2L and RZ/G3L SoC are
different. The RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8
external interrupts. Add irq_count variable in struct rzg2l_hw_info to
handle these differences and drop the macro IRQC_IRQ_COUNT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Dropped hw_irq range check involving info.irq_count.
v3->v4:
 * Updated commit description IRQs->interrupts.
 * Updated variable type of irq_count from u8->unsigned int.
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index ca495fb0d1ae..78744c21b45a 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -21,7 +21,6 @@
 #include <linux/syscore_ops.h>
 
 #define IRQC_IRQ_START			1
-#define IRQC_IRQ_COUNT			8
 #define IRQC_TINT_COUNT			32
 
 #define ISCR				0x10
@@ -68,10 +67,12 @@ struct rzg2l_irqc_reg_cache {
 
 /**
  * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
+ * @irq_count:		Number of IRQC interrupts
  * @tint_start:		Start of TINT interrupts
  * @num_irq:		Total Number of interrupts
  */
 struct rzg2l_hw_info {
+	unsigned int	irq_count;
 	unsigned int	tint_start;
 	unsigned int	num_irq;
 };
@@ -579,7 +580,7 @@ static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
 	 * from 16-31 bits. TINT from the pinctrl driver needs to be programmed
 	 * in IRQC registers to enable a given gpio pin as interrupt.
 	 */
-	if (hwirq > IRQC_IRQ_COUNT) {
+	if (hwirq > priv->info.irq_count) {
 		tint = TINT_EXTRACT_GPIOINT(hwirq);
 		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
 		chip = priv->tint_chip;
@@ -687,8 +688,9 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 }
 
 static const struct rzg2l_hw_info rzg2l_hw_params = {
-	.tint_start	= IRQC_IRQ_START + IRQC_IRQ_COUNT,
-	.num_irq	= IRQC_IRQ_START + IRQC_IRQ_COUNT + IRQC_TINT_COUNT,
+	.irq_count	= 8,
+	.tint_start	= IRQC_IRQ_START + 8,
+	.num_irq	= IRQC_IRQ_START + 8 + IRQC_TINT_COUNT,
 };
 
 static int rzg2l_irqc_probe(struct platform_device *pdev, struct device_node *parent)
-- 
2.43.0


