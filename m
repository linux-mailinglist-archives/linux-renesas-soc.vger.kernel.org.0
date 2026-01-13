Return-Path: <linux-renesas-soc+bounces-26672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D6D18F5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 13:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9B403053832
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 12:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB2738FEE6;
	Tue, 13 Jan 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsvRq+6q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991238F24D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308802; cv=none; b=OtMnm3ZPZgi2Zm/yoPd2xVntu9xWsNBlMppdBXIk8Z7s9tXcSCD02Z1v8BdJ/I4vH2AZeZyF83LthzTsK/ZW+wvmtMZQqgWNepFUFTwgiehmsff1Xb9hhrw94f/MTiDSUt+1AkJWQhJJnm7NvmcyhfeL4biZrke0ZzqQurfSgnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308802; c=relaxed/simple;
	bh=BJHKSCr1cxM21LVV4FRlibkavTra9iuDs50eQLBusbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqoMgCKR5xUkYHTxxWybyaXyUONjPPN6jRzdcArPesu3APr2YIhjlYRZxmQdfgwSSUQXx8H2xJJYqf/YZ1wX9EO/PhKvXr1GDU0WRmvqZKXM2bQYtFMlh/+9+Zo3ao2ZI2guxPQf9Zlm7/SDVmY50wmN/hQv4HCff+UiD23w08Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsvRq+6q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee0291921so1632295e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Jan 2026 04:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768308799; x=1768913599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmjdiHpcgU48p4SZ15MSIb4LpXv8J6V5sUNbWmqB/8I=;
        b=TsvRq+6qOO8RZ6/lwld0HidAMtEgPFfZKe4LhxNxoFsSyE1TYbyyPwxzOX/YW3tCqF
         UbBTw49xI7wdzZzf4+j0mus+IRxFsw4hy4MF+06AAvWCWcfoVL7WHhEDzs+EuhKbemJo
         xLBcIWHnYVO9glUo5D3kdxJk+gr6vIBn2u15lXtZyXNcr9JVzHY2Q52TzEttx1krTOmT
         C0Z1WdCbuJLKnedkrcX3cIU+0KpN5TJwgYAPsOzLcXSzbTprKfZtCF3ZDgvFU7qTcBnJ
         QYG1XH1mYJoVHzBVPF6XwMNUf1vlWie+JMn6oUvBXRFq+wAVm3u/wEzroq41wXDdUlfw
         rs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768308799; x=1768913599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XmjdiHpcgU48p4SZ15MSIb4LpXv8J6V5sUNbWmqB/8I=;
        b=u2wLClG/yft8Y/Av58logjmvsJI9TIm8V0uB+IYqMHFYYOq7+juWp2mAuctXsEU342
         mOdzH1kZgJWoDJQ4rkSsfER59hCygyNy6jSh2/tI59lljfOC1bZXy0HV0UBKhRT+OJcm
         RTSV+j6jYb+405Pe/redmOClSrzeTCjgjSq8+JZXQQPt8TN+3lrH3bOSe5wxkloV2hCF
         3+Wx37l2T5au9MhiR9WZbzmiiXVLTTsezcuwnNv8euz8SyCOFd0hq9qk6B0U0iQnwOxG
         OynhKXe4WtMhyRJCMJifBZj8uugFt4fEksBUj5kvna64leWzBO/tPzYyKpJuJ2Frw0sY
         iN3w==
X-Forwarded-Encrypted: i=1; AJvYcCXOSq83dNfyNSsvEKL5InfRMUR69uS6EesrjkxrLLS2mIQjSsfHTqn/KIDtvWGCPDwQc4OzjKLnaNhVZMQ0NUs5/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJwV2no9aJZ6K9//Zu7P7qszsEw1c5+7SdsO5B12+d/jK3fYF
	keorMaKRSYUP3fgxzvfauI8zNjiwyTYQTOn7t4EC+oqoVIUf4mgznpAX
X-Gm-Gg: AY/fxX6txWO/xERMWgzSiydCGuXo399UEpC0LiSA7EWZ4A7Xvrse2eeQAEtje7t4d53
	BNa/6yjdWW9dJnitkljiM7mIilpGilZ0eja4EBngMJ3Z9LIYmlFxg6+IeL8Py82Vp0RMPcKL/28
	VE9iNg4wZPpTQg6ZAd9Rbaa9AAnBEdX0Og/zfYEIsad3UUqOpXuszGS6FMC04YU5xwT47K+wTap
	gI7Mh3/uE5KU7u05VxKuJOz8NIqVH/K1+HptXIYwQKLEy2g+5puZfGoOO64gW9MUZO/BXFDv6tY
	+mKJEfipF7lmw8HEQ6NUZrtMLusRvOcK+SU2/qHPQNEyq2wPCaUuOVwLYGapleUn1vtZjjqr0bX
	GEBj4uLIjxdycCt13TD/PzKyQjNS/o77P2HsWa05F2OV3qt8P5HxqEsMAjGG2Cwi8sPkWAmXjFc
	YLqXddTnlvBWwd4NvxC3rHWn1/cKP2
X-Google-Smtp-Source: AGHT+IEbp6d2tVBHhgEBtCZ/Co7ID0xGMeGJvIcgxk7z7WpLK0gkB0XoRrHE6BtcliG3xv+Ye4uJUA==
X-Received: by 2002:a05:600c:a48:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47d84b36a2amr228341215e9.19.1768308798714;
        Tue, 13 Jan 2026 04:53:18 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:6e35:f12b:dc2b:8e25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm423744265e9.6.2026.01.13.04.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:53:18 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] irqchip/renesas-rzv2h: Add suspend/resume support
Date: Tue, 13 Jan 2026 12:53:12 +0000
Message-ID: <20260113125315.359967-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113125315.359967-1-biju.das.jz@bp.renesas.com>
References: <20260113125315.359967-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G3E using PSCI, s2ram powers down the SoC. Add suspend/resume
callbacks to restore IRQ type for NMI, TINT and external IRQ interrupts.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 60 +++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index 9b4565375e83..6fc9e96d3169 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -20,6 +20,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
+#include <linux/syscore_ops.h>
 
 /* DT "interrupts" indexes */
 #define ICU_IRQ_START				1
@@ -89,6 +90,18 @@
 #define ICU_RZG3E_TSSEL_MAX_VAL			0x8c
 #define ICU_RZV2H_TSSEL_MAX_VAL			0x55
 
+/**
+ * struct rzv2h_irqc_reg_cache - registers cache (necessary for suspend/resume)
+ * @nitsr: ICU_NITSR register
+ * @iitsr: ICU_IITSR register
+ * @titsr: ICU_TITSR registers
+ */
+struct rzv2h_irqc_reg_cache {
+	u32	nitsr;
+	u32	iitsr;
+	u32	titsr[2];
+};
+
 /**
  * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
  * @tssel_lut:		TINT lookup table
@@ -118,13 +131,15 @@ struct rzv2h_hw_info {
  * @fwspec:	IRQ firmware specific data
  * @lock:	Lock to serialize access to hardware registers
  * @info:	Pointer to struct rzv2h_hw_info
+ * @cache:	Registers cache for suspend/resume
  */
-struct rzv2h_icu_priv {
+static struct rzv2h_icu_priv {
 	void __iomem			*base;
 	struct irq_fwspec		fwspec[ICU_NUM_IRQ];
 	raw_spinlock_t			lock;
 	const struct rzv2h_hw_info	*info;
-};
+	struct rzv2h_irqc_reg_cache	cache;
+} *rzv2h_icu_data;
 
 void rzv2h_icu_register_dma_req(struct platform_device *icu_dev, u8 dmac_index, u8 dmac_channel,
 				u16 req_no)
@@ -419,6 +434,44 @@ static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
 	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
 }
 
+static int rzv2h_irqc_irq_suspend(void *data)
+{
+	struct rzv2h_irqc_reg_cache *cache = &rzv2h_icu_data->cache;
+	void __iomem *base = rzv2h_icu_data->base;
+
+	cache->nitsr = readl_relaxed(base + ICU_NITSR);
+	cache->iitsr = readl_relaxed(base + ICU_IITSR);
+	for (u8 i = 0; i < 2; i++)
+		cache->titsr[i] = readl_relaxed(base + rzv2h_icu_data->info->t_offs + ICU_TITSR(i));
+
+	return 0;
+}
+
+static void rzv2h_irqc_irq_resume(void *data)
+{
+	struct rzv2h_irqc_reg_cache *cache = &rzv2h_icu_data->cache;
+	void __iomem *base = rzv2h_icu_data->base;
+
+	/*
+	 * Restore only interrupt type. TSSRx will be restored at the
+	 * request of pin controller to avoid spurious interrupts due
+	 * to invalid PIN states.
+	 */
+	for (u8 i = 0; i < 2; i++)
+		writel_relaxed(cache->titsr[i], base + rzv2h_icu_data->info->t_offs + ICU_TITSR(i));
+	writel_relaxed(cache->iitsr, base + ICU_IITSR);
+	writel_relaxed(cache->nitsr, base + ICU_NITSR);
+}
+
+static const struct syscore_ops rzv2h_irqc_syscore_ops = {
+	.suspend	= rzv2h_irqc_irq_suspend,
+	.resume		= rzv2h_irqc_irq_resume,
+};
+
+static struct syscore rzv2h_irqc_syscore = {
+	.ops = &rzv2h_irqc_syscore_ops,
+};
+
 static const struct irq_chip rzv2h_icu_chip = {
 	.name			= "rzv2h-icu",
 	.irq_eoi		= rzv2h_icu_eoi,
@@ -502,7 +555,6 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 {
 	struct irq_domain *irq_domain, *parent_domain;
 	struct device_node *node = pdev->dev.of_node;
-	struct rzv2h_icu_priv *rzv2h_icu_data;
 	struct reset_control *resetn;
 	int ret;
 
@@ -560,6 +612,8 @@ static int rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
 
 	rzv2h_icu_data->info = hw_info;
 
+	register_syscore(&rzv2h_irqc_syscore);
+
 	/*
 	 * coccicheck complains about a missing put_device call before returning, but it's a false
 	 * positive. We still need &pdev->dev after successfully returning from this function.
-- 
2.43.0


