Return-Path: <linux-renesas-soc+bounces-27212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPv5E2rycGk+awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:36:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFBF59457
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 16:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E9764ACAEF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CEE4B8DDF;
	Wed, 21 Jan 2026 15:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kd1Cj9+J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8FC4ADDA3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007721; cv=none; b=Aya0ey1G1p2Mklpm+O73Q5q7EgTaXTo0+gtdKS8gXeOUDr9FBwH1uXjOG0C1t1kQpeZ+4eJO8CpjBOajqR5r7AtppSjOGWhXqSP+ReJfPM6XmCB2hLjUTie9EYpEVCbiODx5wHaW5PqmrvfPyyRmPSEYk4u7iC0gELPei7i8UH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007721; c=relaxed/simple;
	bh=ZHgJbN8Xpa/1C1FZZKvYY2GnxRx8RIG+qmp7yJymjys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FD02kMFxxKBg15QCI5rQWYM6VrFtg9leYyLgntk45hYf1sph96nBVme3JlqogfYzFZM1K463gPiwjSrTlb45PDkQhbPPRSVSV9wIiNu6K31qCbvOhwbZf7VbxVANYzjkJJqKk2JvU2EkV3sFcNP1Eht/L2CJKwHzeOOyrGsol6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kd1Cj9+J; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso15370915e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 07:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769007717; x=1769612517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5DmHDY3DPc4B0A5rMMRb7kro45hNcXliNwW1gu8UJU=;
        b=Kd1Cj9+JKpECLnNm+pvyHrwYWUA+jaRlXHfGG4231NpWn4bgVgmR8VbdWb9R2G6+nz
         mEOYEiWLme8wcnkue7n0JLQHs5DhOFQuyOPp1gjlbs14C1r9jPGbOp30NXDo7J43q95i
         pgv3GPSG349qCW60fQkWlaJRh1lbt8kmuyvZgqLX952T+c9Z6wWXIr8GGDLioDsmtbMe
         1a5wAsMffvRJjpUfWAo6VNfkiNvYiz2tOaUNzJZKc3M89+QLvfu3CYoIWlHo3DevazUE
         UB0HYqP71N7tsYRrTsMPQZs0EtAP6JMiUwCDNfqcqriVmEkE0tl2myyo7C42pWllVYdU
         ajPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007717; x=1769612517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5DmHDY3DPc4B0A5rMMRb7kro45hNcXliNwW1gu8UJU=;
        b=b91rioXOMlfwhuSI6GwuKQ4bNJNrepSCJo3KZm6bC1ZjkxhBRQ96EdY3sfa/aJRsPf
         836WkadCHD0Bd0BxCZIuVp5Cg/PiM6ZOQWY3suYMEg4EgzvlTeVEPQKWVBP8JSCxRBn+
         /lryqv6fAkofKN5OGOpxUSdgAbMqVAiPSfBM3BOmCwZ/qXz6PeDnDqRWRfQmXPIzJluV
         BhxtfDk4vpn3bUk6CxvBdIuLH5dupzmHdUIlkM1Jv8IQe+gTPhBy5OUYCoqJ01dP+3jk
         420gDkhsZuoCn7Iui2z5GQcUgjxCycK31GfqFgmR3uQzIGBHfshIapM3vMFu3J46zoUW
         awEA==
X-Forwarded-Encrypted: i=1; AJvYcCX54vlDM+27lYEqKamCKtvIrWE4VJUHWjy8ojTZB7rikmY/MW3d71EWRnVctzfwLv7aD+H/dlpXMBXU0aY60K/cDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXiMBc3EF65LwZAL269cBVkJUR8Y7ovE2lHxV8ZFyp/6HYtwFG
	lVJVjTxwmwFNjq5Vt6rqx6EsdX2Zmc4XHwuE6m//FaLPVUmCJF3dP18B
X-Gm-Gg: AZuq6aJL4Chd6kxyrqO4IjNGLOpvAXFv6LggOZhMtx9OC00b4x0Obm+zMn+jqxdZK4w
	WKGef3QPzWt8usqRQ2ktFw4bkhAy7zPG5g9askk0WERGdN09IGQTs6t6FDNO/wccg0G4m03jV6S
	XzI8hU4A6lBw/8PWe5GeM8A0nOnxnvsIIiuMZV1BumFUUJ2RLMe6u+qxiBSy2P/thd/PMkVrXqT
	v3/9EJJ3SfCu22FJEMzAgLm7OLZyKevV6d1K4DZHXyiVMmSVzX+VOrOrheNeTIhKc2kzGJz3FKu
	4GLiaRcFdD4MSUOaQ1HiaZHrvXUUVBe/MYRQgPUioR9garMAK9EhNu6ksl+mrWT+Laf07n4AZNC
	GmVXM7p9daFXAsX/ieh6VZjnTYoPY/8zgBNp6ttnNewYOBoJrm+e1VySVmEtZCsXdGk3OG4ONpR
	ZXZrF8Ars3csEtuOWd9qx4mJVsZisZ6s5KcmnPlMpROnw9uKK8HcFjhSkMYzR7aI3fli8Hm08Mm
	qCkOAKzC2dbKwyj4YFgaXFV8/yJmJKO
X-Received: by 2002:a05:600c:528c:b0:47e:e61d:b8d2 with SMTP id 5b1f17b1804b1-4803e7f18d4mr75543255e9.27.1769007716605;
        Wed, 21 Jan 2026 07:01:56 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:3190:c653:bb13:4ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b6a3e2sm24787585e9.1.2026.01.21.07.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:01:55 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add SWPE trigger
Date: Wed, 21 Jan 2026 15:01:36 +0000
Message-ID: <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27212-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: DCFBF59457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Handle the RZ/V2H ICU error interrupt to help diagnose latched bus,
ECC RAM, and CA55/IP error conditions during bring-up and debugging.

When debug support is enabled, register the error IRQ handler and
provide a debugfs write interface to trigger pseudo error generation
via ICU_SWPE for validation.

Account for SoC differences in ECC RAM error register coverage so the
handler only iterates over valid ECC status/clear banks, and route the
RZ/V2N compatible to a probe path with the correct ECC range while
keeping the existing RZ/V2H and RZ/G3E handling.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 141 +++++++++++++++++++++++++++-
 1 file changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 7d3ce1d762f0..6dc297220f05 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -21,6 +21,7 @@
 #include <linux/irqdomain.h>
 #include <linux/kconfig.h>
 #include <linux/kstrtox.h>
+#include <linux/minmax.h>
 #include <linux/moduleparam.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
@@ -47,7 +48,15 @@
 #define ICU_TSCLR				0x24
 #define ICU_TITSR(k)				(0x28 + (k) * 4)
 #define ICU_TSSR(k)				(0x30 + (k) * 4)
+#define ICU_BEISR(k)				(0x70  + (k) * 4)
+#define ICU_BECLR(k)				(0x80  + (k) * 4)
+#define ICU_EREISR(k)				(0x90  + (k) * 4)
+#define ICU_ERCLR(k)				(0xE0  + (k) * 4)
 #define ICU_SWINT				0x130
+#define ICU_ERINTA55CTL(k)			(0x338 + (k) * 4)
+#define ICU_ERINTA55CRL(k)			(0x348 + (k) * 4)
+#define ICU_ERINTA55MSK(k)			(0x358 + (k) * 4)
+#define ICU_SWPE				0x370
 #define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
 #define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
 
@@ -99,6 +108,9 @@
 #define ICU_RZV2H_TSSEL_MAX_VAL			0x55
 
 #define ICU_SWINT_NUM				4
+#define ICU_SWPE_NUM				16
+#define ICU_NUM_BE				4
+#define ICU_NUM_A55ERR				4
 
 static bool enable_icu_debug;
 module_param_named(debug, enable_icu_debug, bool, 0644);
@@ -123,12 +135,16 @@ struct rzv2h_irqc_reg_cache {
  * @t_offs:		TINT offset
  * @max_tssel:		TSSEL max value
  * @field_width:	TSSR field width
+ * @ecc_start:		Start index of ECC RAM interrupts
+ * @ecc_end:		End index of ECC RAM interrupts
  */
 struct rzv2h_hw_info {
 	const u8	*tssel_lut;
 	u16		t_offs;
 	u8		max_tssel;
 	u8		field_width;
+	u8		ecc_start;
+	u8		ecc_end;
 };
 
 /* DMAC */
@@ -565,6 +581,48 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
 	return 0;
 }
 
+static irqreturn_t rzv2h_icu_error_irq(int irq, void *data)
+{
+	struct rzv2h_icu_priv *priv = data;
+	const struct rzv2h_hw_info *hw_info = priv->info;
+	void __iomem *base = priv->base;
+	unsigned int k;
+	u32 st;
+
+	/* 1) Bus errors (BEISR0..3) */
+	for (k = 0; k < ICU_NUM_BE; k++) {
+		st = readl(base + ICU_BEISR(k));
+		if (!st)
+			continue;
+
+		writel(st, base + ICU_BECLR(k));
+		pr_debug("rzv2h-icu: BUS error k=%u status=0x%08x\n", k, st);
+	}
+
+	/* 2) ECC RAM errors (EREISR0..X) */
+	for (k = hw_info->ecc_start; k <= hw_info->ecc_end; k++) {
+		st = readl(base + ICU_EREISR(k));
+		if (!st)
+			continue;
+
+		writel(st, base + ICU_ERCLR(k));
+		pr_debug("rzv2h-icu: ECC error k=%u status=0x%08x\n", k, st);
+	}
+
+	/* 3) IP/CA55 error interrupt status (ERINTA55CTL0..3) */
+	for (k = 0; k < ICU_NUM_A55ERR; k++) {
+		st = readl(base + ICU_ERINTA55CTL(k));
+		if (!st)
+			continue;
+
+		/* there is no relation with status bits so clear all the interrupts */
+		writel(0xffffffff, base + ICU_ERINTA55CRL(k));
+		pr_debug("rzv2h-icu: IP/CA55 error k=%u status=0x%08x\n", k, st);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
 {
 	u8 cpu = *(u8 *)data;
@@ -611,13 +669,47 @@ static const struct file_operations rzv2h_icu_swint_fops = {
 	.llseek	= noop_llseek,
 };
 
+static ssize_t rzv2h_icu_swpe_write(struct file *file,
+				    const char __user *ubuf,
+				    size_t len, loff_t *ppos)
+{
+	struct rzv2h_icu_priv *priv = file->private_data;
+	unsigned long swpe;
+	char buf[32];
+	int ret;
+
+	len = min(len, sizeof(buf) - 1);
+	if (copy_from_user(buf, ubuf, len))
+		return -EFAULT;
+	buf[len] = '\0';
+
+	ret = kstrtoul(strim(buf), 0, &swpe);
+	if (ret)
+		return ret;
+
+	if (swpe >= ICU_SWPE_NUM)
+		return -EINVAL;
+
+	writel(BIT(swpe), priv->base + ICU_SWPE);
+	return len;
+}
+
+static const struct file_operations rzv2h_icu_swpe_fops = {
+	.open	= simple_open,
+	.write	= rzv2h_icu_swpe_write,
+	.llseek	= noop_llseek,
+};
+
 static int rzv2h_icu_setup_debug_irqs(struct platform_device *pdev)
 {
+	const struct rzv2h_hw_info *hw_info = rzv2h_icu_data->info;
 	static const u8 swint_idx[ICU_SWINT_NUM] = { 0, 1, 2, 3 };
 	static const char * const rzv2h_swint_names[] = {
 		"int-ca55-0", "int-ca55-1",
 		"int-ca55-2", "int-ca55-3",
 	};
+	static const char *icu_err = "icu-error-ca55";
+	void __iomem *base = rzv2h_icu_data->base;
 	struct device *dev = &pdev->dev;
 	struct dentry *dentry;
 	struct dentry *dir;
@@ -654,6 +746,36 @@ static int rzv2h_icu_setup_debug_irqs(struct platform_device *pdev)
 	if (IS_ERR(dentry))
 		return PTR_ERR(dentry);
 
+	ret = devm_add_action_or_reset(dev, rzv2h_icu_remove_debugfs, dentry);
+	if (ret)
+		return ret;
+
+	icu_irq = platform_get_irq_byname(pdev, icu_err);
+	if (icu_irq < 0)
+		return dev_err_probe(dev, icu_irq, "Failed to get %s IRQ\n", icu_err);
+
+	/* Unmask and clear all IP/CA55 error interrupts */
+	for (i = 0; i < ICU_NUM_A55ERR; i++) {
+		writel(0xffffff, base + ICU_ERINTA55CRL(i));
+		writel(0x0, base + ICU_ERINTA55MSK(i));
+	}
+
+	/* Clear all Bus errors */
+	for (i = 0; i < ICU_NUM_BE; i++)
+		writel(0xffffffff, base + ICU_BECLR(i));
+
+	/* Clear all ECCRAM errors */
+	for (i = hw_info->ecc_start; i <= hw_info->ecc_end; i++)
+		writel(0xffffffff, base + ICU_ERCLR(i));
+
+	ret = devm_request_irq(dev, icu_irq, rzv2h_icu_error_irq, 0, dev_name(dev), rzv2h_icu_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request %s IRQ\n", icu_err);
+
+	dentry = debugfs_create_file("swpe", 0200, dir, rzv2h_icu_data, &rzv2h_icu_swpe_fops);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
 	return devm_add_action_or_reset(dev, rzv2h_icu_remove_debugfs, dentry);
 }
 
@@ -759,12 +881,24 @@ static const struct rzv2h_hw_info rzg3e_hw_params = {
 	.t_offs		= ICU_RZG3E_TINT_OFFSET,
 	.max_tssel	= ICU_RZG3E_TSSEL_MAX_VAL,
 	.field_width	= 16,
+	.ecc_start	= 1,
+	.ecc_end	= 4,
+};
+
+static const struct rzv2h_hw_info rzv2n_hw_params = {
+	.t_offs		= 0,
+	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
+	.field_width	= 8,
+	.ecc_start	= 0,
+	.ecc_end	= 2,
 };
 
 static const struct rzv2h_hw_info rzv2h_hw_params = {
 	.t_offs		= 0,
 	.max_tssel	= ICU_RZV2H_TSSEL_MAX_VAL,
 	.field_width	= 8,
+	.ecc_start	= 0,
+	.ecc_end	= 11,
 };
 
 static int rzg3e_icu_probe(struct platform_device *pdev, struct device_node *parent)
@@ -772,6 +906,11 @@ static int rzg3e_icu_probe(struct platform_device *pdev, struct device_node *par
 	return rzv2h_icu_probe_common(pdev, parent, &rzg3e_hw_params);
 }
 
+static int rzv2n_icu_probe(struct platform_device *pdev, struct device_node *parent)
+{
+	return rzv2h_icu_probe_common(pdev, parent, &rzv2n_hw_params);
+}
+
 static int rzv2h_icu_probe(struct platform_device *pdev, struct device_node *parent)
 {
 	return rzv2h_icu_probe_common(pdev, parent, &rzv2h_hw_params);
@@ -779,7 +918,7 @@ static int rzv2h_icu_probe(struct platform_device *pdev, struct device_node *par
 
 IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
 IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_probe)
-IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2h_icu_probe)
+IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2n_icu_probe)
 IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_probe)
 IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
 MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
-- 
2.52.0


