Return-Path: <linux-renesas-soc+bounces-27211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOxPCnj9cGmgbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:23:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C163159D61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 17:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 200DD78A5F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B2B4ADD9E;
	Wed, 21 Jan 2026 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHg3TiUT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284484ADD86
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007718; cv=none; b=MBvIpOMcd6uD0l4uL6CyBg4fMBX2EfaJ9NG6nPAEU6H0UOK2UG+KDhUrspr7q8DG5LxOt0hr9Qm36WonWUheXpP3RVy8hEExXe8Nr7c+WV/1KU22947Uk3sO8Vu8aF+Ht/vTmpVYb8gU2y4Cp6VDxkRlZ0UOC2kKYTSWTbH68+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007718; c=relaxed/simple;
	bh=Lp2YJ0PezC4nKDv7MELIBjmb1QIoCP8pUas3MujftBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFrps882ZSUb68IWkX2YbqOKeSlWT5OV0JwEz78an8h4Nz9AuMeXil6ozx3HumF6Juqm40TWM3h4zi14ThQ/NaY6wf9a4X1aXR25HufaHUDCSnPgubtAxOsHA0/EynUzthELyBfVebofOanC/s8dMr7vw9eVgDWg59WnFvZgTvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHg3TiUT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so64595635e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 07:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769007715; x=1769612515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqJ5YCB+4/8IUCK8PTW5lk2KQTAlqq5CiWq5HltU7kM=;
        b=YHg3TiUTaflUdxAQvnEA5+DDGEx2tzdXthfz1cFEeiNS9vMsVBriRN1OSWceh9H/m9
         SeO2eo1c6PP9ZS4xYhLiyizHLfMWOIElJT1JcHZln7/GleBjIDEfqO7EngDh4d+iQaq7
         H4akfZud8SGQ9P3oHZmERDOAW0JRrtDIl7e/kTt/h6blt8eYNtuyI3GVaI0KulksGS8t
         w6QeBYiUv7Dyl+s8/R4t9jkIFolVv1ApUhiHlb7QhkjWRq9rUBpmLnAXYYE7jUwF1OLO
         RN2dySFH5GhZIFyYTdAezlc9J3UKFbeu9GGloFKrwZiwKp7KJ33zp+sEjjaJPxfI3a68
         MLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007715; x=1769612515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqJ5YCB+4/8IUCK8PTW5lk2KQTAlqq5CiWq5HltU7kM=;
        b=qp6TBsOEg6N/Z3s8svNNvBePg/kRz9G3khC+R/GzzgfL96rIY/UmVd0HAfrERBL4et
         RtqMhjAi0SJYPfFOCBq4ytxjBGdzI8+X7gN+Dk2tuZhZtsqDbIVPHNns8lAIrzEgBA6g
         begq6q9mSv7QJ5ruoTS05KD/ekXyMwf8ge1EVf/CpOlW28BoRthP6beEfJHe8I4l93sx
         vEb0nnqnOuf9+inTPxAv5mlY7L7wkEAHJLDw7B7kMBrAKLxZnH2vgPuGYbN+c1n+bEiy
         eftc7qbUEnVuJ5scxbMHGnTYNqvsmRK5aPuLy9hIVPy2Na15cE0PQQYF9S43Atw6oPLh
         Yfbg==
X-Forwarded-Encrypted: i=1; AJvYcCVj13FxnORAtqNEPgDfv/nfPqG4FKYB3X2mJRhbl/ua8l1uRvzZgba1XpfJuKbqv+A/e95UPCocgD9xdjckbEbjKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiBRFh3IUsA+3hJv5sjliGpTaE1KIn2XLhpZh3V1AYBo9WdtO
	B/SwAYYAQMGKgEsv4kdPGLbfb8ZngJHyTRHOrc/IcKGaIw/ItZcR88wx
X-Gm-Gg: AZuq6aLReO2ezgSSvUg+mezZyK2S3FBydd4bzHWIVyR97qpKNG1QoefHLfQzL/QWMOD
	ruqpbkWPDfx8p7kYJWn6gfKtIJJLYjh5EZHKQTRVbW7PiZNPBvguoUWnCQN4k7Yh/vKr4IUxC8d
	RvGnnv5QHddoiRd5Zy4OJ9mSfh4w+aKqvS7jVSjyWcft2F9eThtZ/T9GqKSbtcpQ5KQZJByBrH/
	emjeIBrrXElZo5vcy44geaA0P+cv/BX37CbkH5VmgQBgQ9Jwt4bHhsuNYNKQ1/kxa6EXVcCuNTb
	Li/kCfFbUoBGzNNwo8uwrceuoNWkm1kSVA0giDIT86MoetdLLNnILUBeKGMH1zCR08jox5sWdOz
	2Wxb4N7vqnmoK7Vs1E1VJp4F89/81FYH5NJmgS01tsvOWHEMQ7kTtd5+RGeBqt8nbZjAXQLHkJb
	k71bgRS/K+X8Ytb9gdOHN+wLEOg2VxHjIoeEQsX8FgdfWk0ao7HpTZc8dxFDir0+YlQvgbfBA4D
	5q2wtetOiXOani1A5jvWhrgep67a8T/
X-Received: by 2002:a05:600c:6098:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-4803a7253d1mr123453625e9.30.1769007714877;
        Wed, 21 Jan 2026 07:01:54 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:3190:c653:bb13:4ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042b6a3e2sm24787585e9.1.2026.01.21.07.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:01:54 -0800 (PST)
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
Subject: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
Date: Wed, 21 Jan 2026 15:01:35 +0000
Message-ID: <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27211-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C163159D61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWINT)
that allows software to explicitly assert interrupts toward individual
CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
interrupt.

Introduce a debug mechanism to trigger software interrupts on individual
Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
explicitly enabled.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 111 ++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 4aa772ba1a1f..7d3ce1d762f0 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -11,16 +11,23 @@
 
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
+#include <linux/cpu.h>
+#include <linux/debugfs.h>
 #include <linux/err.h>
+#include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqchip/irq-renesas-rzv2h.h>
 #include <linux/irqdomain.h>
+#include <linux/kconfig.h>
+#include <linux/kstrtox.h>
+#include <linux/moduleparam.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
+#include <linux/uaccess.h>
 
 /* DT "interrupts" indexes */
 #define ICU_IRQ_START				1
@@ -40,6 +47,7 @@
 #define ICU_TSCLR				0x24
 #define ICU_TITSR(k)				(0x28 + (k) * 4)
 #define ICU_TSSR(k)				(0x30 + (k) * 4)
+#define ICU_SWINT				0x130
 #define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
 #define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
 
@@ -90,6 +98,13 @@
 #define ICU_RZG3E_TSSEL_MAX_VAL			0x8c
 #define ICU_RZV2H_TSSEL_MAX_VAL			0x55
 
+#define ICU_SWINT_NUM				4
+
+static bool enable_icu_debug;
+module_param_named(debug, enable_icu_debug, bool, 0644);
+MODULE_PARM_DESC(debug,
+		 "Enable RZ/V2H ICU debug/diagnostic interrupts (default: false)");
+
 /**
  * struct rzv2h_irqc_reg_cache - registers cache (necessary for suspend/resume)
  * @nitsr: ICU_NITSR register
@@ -550,6 +565,98 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv, struct device
 	return 0;
 }
 
+static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
+{
+	u8 cpu = *(u8 *)data;
+
+	pr_debug("SWINT interrupt for CA55 core %u\n", cpu);
+	return IRQ_HANDLED;
+}
+
+static void rzv2h_icu_remove_debugfs(void *file)
+{
+	debugfs_remove(file);
+}
+
+static ssize_t rzv2h_icu_swint_write(struct file *file, const char __user *ubuf,
+				     size_t len, loff_t *ppos)
+{
+	struct rzv2h_icu_priv *priv = file->private_data;
+	unsigned long cpu;
+	char buf[32];
+	int ret;
+
+	len = min(len, sizeof(buf) - 1);
+	if (copy_from_user(buf, ubuf, len))
+		return -EFAULT;
+	buf[len] = '\0';
+
+	ret = kstrtoul(strim(buf), 0, &cpu);
+	if (ret)
+		return ret;
+
+	if (cpu >= ICU_SWINT_NUM || cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	if (!cpu_online(cpu))
+		return -ENODEV;
+
+	writel(BIT(cpu), priv->base + ICU_SWINT);
+	return len;
+}
+
+static const struct file_operations rzv2h_icu_swint_fops = {
+	.open	= simple_open,
+	.write	= rzv2h_icu_swint_write,
+	.llseek	= noop_llseek,
+};
+
+static int rzv2h_icu_setup_debug_irqs(struct platform_device *pdev)
+{
+	static const u8 swint_idx[ICU_SWINT_NUM] = { 0, 1, 2, 3 };
+	static const char * const rzv2h_swint_names[] = {
+		"int-ca55-0", "int-ca55-1",
+		"int-ca55-2", "int-ca55-3",
+	};
+	struct device *dev = &pdev->dev;
+	struct dentry *dentry;
+	struct dentry *dir;
+	unsigned int i;
+	int icu_irq;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_DEBUG_FS) || !enable_icu_debug)
+		return 0;
+
+	dev_info(dev, "RZ/V2H ICU debug interrupts enabled\n");
+
+	for (i = 0; i < ICU_SWINT_NUM; i++) {
+		icu_irq = platform_get_irq_byname(pdev, rzv2h_swint_names[i]);
+		if (icu_irq < 0)
+			return dev_err_probe(dev, icu_irq,
+					     "Failed to get %s IRQ\n", rzv2h_swint_names[i]);
+		ret = devm_request_irq(dev, icu_irq, rzv2h_icu_swint_irq, 0, dev_name(dev),
+				       (void *)&swint_idx[i]);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to request SWINT IRQ: %s\n",
+					     rzv2h_swint_names[i]);
+	}
+
+	dir = debugfs_create_dir("rzv2h_icu", NULL);
+	if (IS_ERR(dir))
+		return PTR_ERR(dir);
+
+	ret = devm_add_action_or_reset(dev, rzv2h_icu_remove_debugfs, dir);
+	if (ret)
+		return ret;
+
+	dentry = debugfs_create_file("swint", 0200, dir, rzv2h_icu_data, &rzv2h_icu_swint_fops);
+	if (IS_ERR(dentry))
+		return PTR_ERR(dentry);
+
+	return devm_add_action_or_reset(dev, rzv2h_icu_remove_debugfs, dentry);
+}
+
 static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_node *parent,
 				  const struct rzv2h_hw_info *hw_info)
 {
@@ -605,6 +712,10 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
 	register_syscore(&rzv2h_irqc_syscore);
 
+	ret = rzv2h_icu_setup_debug_irqs(pdev);
+	if (ret)
+		goto pm_put;
+
 	/*
 	 * coccicheck complains about a missing put_device call before returning, but it's a false
 	 * positive. We still need dev after successfully returning from this function.
-- 
2.52.0


