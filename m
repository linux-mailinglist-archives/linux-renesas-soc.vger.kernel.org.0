Return-Path: <linux-renesas-soc+bounces-27467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCQ5KoSMeGmqqwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:59:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DC92467
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B54BB300BC94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 09:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ACC33A9EC;
	Tue, 27 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pso0cLMM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77131334C2C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507869; cv=none; b=X/n7G8Mx+NrFljK7serGct3Gjn7rUErqZzeTh6rNFEqXejZcS3EXeHMCvjPSJyYTaqTNexJZlAN0n5XN5ude6wrrReAhwcLInMJIbbySLOODqIDj8oKvEB5HCAUH1ayARgvwSBb9GC/gqqPDyCIXd1rp1l5Cp1twQoCWYtAIBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507869; c=relaxed/simple;
	bh=HsXR1ZRReSjuIteRzdqoskAI8e3z5XUN7HnkD9ouWkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6Fq1dRtr6uJtziy6gVScztxPTm21RPudK1aDBMdI/qWXHlUnwAZwx2seC9DKMLk/TARCEmXslFcrd9+6MkHqywX/zZbePppCc5RpiSDwmHvFbOPaG/f5ob0VZzFxnR2alAAwJqa45w/ugxXKYfViguAvHkI3/A/pUqg8vaJxj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pso0cLMM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806bf03573so418615e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507864; x=1770112664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3fgVVbcQTtRJV48S+nyNEv2JNUdtpWQtsHANx8ZpfI=;
        b=Pso0cLMMORmJGglJOAG9swwPn7j9lqAiwsR/6nLd8x4x1ePC2anzlIu6nbI8mtWo84
         Ipuu12WV60vcf+rEoUUVxyOrzQWaTvfKcGZxdN3wgy/oPruAWjom6oDrSYlPgZgL4k6t
         OCNa5pAs6I/xriahKJqLdWmrM8fY05TcqDtXzynOZByonwYcyGLPB2eRRbBIL/rk1jjG
         H5Cb7yY7IoXUomdvL0EQgJQAZBxlaUxGrRkfJpY1CGy3gP7E3UtrjvlZBtIgPgH7H9ii
         P2n/ihRHJEFKn4778/KGcrOldivZ5vcay5CeqRiIpz57s11F8Djlk2e50PJVvy/C3xYj
         AS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507864; x=1770112664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3fgVVbcQTtRJV48S+nyNEv2JNUdtpWQtsHANx8ZpfI=;
        b=ZtOyN/PzzeZ305vSRwaedLXlvHmg061BfgCpZ4YpkusyOA8IGiYCL5mux7p9V0uzlJ
         KLQnhYfSQ33hef0IlXUN8Y8AzMiFq/DiQwUiYQOwuLabypk1wQKzlbKFYNbTBYMCRtgo
         4igFrDtN2FMFz5712u4YkTRhJOomFzKpp5/N71mE/M4xkDL1532QtaBvDpXlTLcW1IJs
         ip5YL4xipxUAUuWki6wmyKMYMhqOCQ0Uuy0gODu8H4xugtXyH6RLj/1qPY/VXvTAC1rW
         DGtfy0Sx1+HtIVK+/8eCnbppEhuuHn1oYpz3WFZWhNiZYgSxsR/3XkRzhrCEJo1Qiral
         1mkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUER7xvR3ogrQbarutDZMtwl9cL7CS8N5AMaosNi//ZIruQltxZ06N1hNZLTM1RvpQfhZTVS1kXH/sEEyobyf5EJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypi01sPJp6TvpapcdVc7uAn1JtdrCcbYbBrXr3nQcgy5ke7VLG
	oksqsXKYcvRXlhTsUfoQeq/Vt4PpqhlgcuT6CMI5dUnSbJEoxs5pZhYcOHnmN4Ax7KM=
X-Gm-Gg: AZuq6aIXQpKUCEjFcCcqLle+UugOYxJv9lrGhaR0PPCW5OH9h/You5xREe0SyHyL44T
	45N/WpwKzr3XsEX7Sjh50nHPY/A8HWHC9NXLwf7wWKy/bYzhvbbzqsMqwMqwDUyEpetO9a8Em96
	G5JyElmIoAmNInLc3TxqpGL4hsGbXuWMkDXGqHwsiuq3voHUNYMJNP0De2PADcfQk/7fUnoK8rE
	y+K93DenH1C2l6+9PlnTkThBydtjvBU9PzQ+st9CEKJA8fFiNEdX9U/iH2SpSFz8haq6g69KWZ7
	8Ga1hf2wtZW5c9sHA9kgF6a7bSAq0P9lJcQokRt/2Am61hDdgbQmey6LSqYOEXWk6PDH6l2UjGO
	HZZ0hxi0PWDMaojjRFDr3lUOXqgdUsw6kwf6CqbJlab3tupWsuXywIVUpblKfYjMgpBYKvFFqxY
	06cPpGl+uBBzvMPwh4JzGmxVKlIe3/ifY=
X-Received: by 2002:a05:600c:4e90:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-48069c2a907mr13201485e9.4.1769507864355;
        Tue, 27 Jan 2026 01:57:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:29 +0100
Subject: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4559;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HsXR1ZRReSjuIteRzdqoskAI8e3z5XUN7HnkD9ouWkI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwSkkdAKRmon7OGOT9uwsmrBncm8jOyh0zpmdxa
 TQoDShyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEgAKCRB33NvayMhJ0V4oD/
 9CadGb5W2hLBSTWJcLX1TKMCmKU/DooSZsZyM2Dl6diO3GC2Oi8oNYdFJb+fnacWdtNol23goMlDcb
 st32xe8hVi+AGrdQPZZYF1q4IymW9DgplcUvn7/hZNbEj/BD1MMTqM76d3BbM5zatqPYudBPq4V8qk
 /aR+uQcMDexhYyKIBX0eIYH+cm/aAHbmcfaxxYyGy5HFRYtK0zMYZhwC0xKwYoyy5rdixE2HQRJ6NW
 dt6P0SALIxUZnql3S1G3tjWtYnTPIog0c1G6ROjXl+gY+BRJRa68gYA+o/j3N6VTtbWvyj1aFMwpOW
 06cyZ8Dm0n68LQ6ROLVvnYtVZA3mKEKPkgaAdnnZhL71G9El6/CYu0mA/Xth/0SRMZcdmaQ7NCNjuf
 h+5SePhDJZQ7Bo1VzCrb6fRtdkswbktqkuhQLRMcm0IaZ6cJiwGUaDXSBU3yVEVRsfTctLx2B7AXOj
 7T5JLrPtPitBn1hDOEV9cEkZwvp1jDfRwzDcylnAG9+XwkI0NRTt9QYSOHscyafCFYLTt8hdZzFUFZ
 pql0g1eA2RoILdRDM/+Jvv+HWancC/TTNIEYt1MPQnFSa2UzNGkLXaZ/N3NJJ67VB4a410tGdp61cx
 3dj3kn/tG9eM5rdZyQ3VymgcCnmUKryhJifhlCkcdAl7BPXnjP/cI3L/5Kfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27467-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB9DC92467
X-Rspamd-Action: no action

Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
power control which connects over PCIe and requires specific power supplies
to start up.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/Kconfig                 | 10 ++++
 drivers/pci/pwrctrl/Makefile                |  2 +
 drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
index e0f999f299bb..5a94e60d0d3e 100644
--- a/drivers/pci/pwrctrl/Kconfig
+++ b/drivers/pci/pwrctrl/Kconfig
@@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
 	select POWER_SEQUENCING
 	select PCI_PWRCTRL
 
+config PCI_PWRCTRL_UPD720201
+	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
+	select PCI_PWRCTRL
+	help
+	  Say Y here to enable the PCI Power Control driver of the UPD720201
+	  USB3 Host Controller.
+
+	  The voltage regulators powering the rails of the PCI slots
+	  are expected to be defined in the devicetree node of the PCI device.
+
 config PCI_PWRCTRL_SLOT
 	tristate "PCI Power Control driver for PCI slots"
 	select PCI_PWRCTRL
diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
index 13b02282106c..a99f85de8a3d 100644
--- a/drivers/pci/pwrctrl/Makefile
+++ b/drivers/pci/pwrctrl/Makefile
@@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
 
 obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
 
+obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
+
 obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
 pci-pwrctrl-slot-y			:= slot.o
 
diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
new file mode 100644
index 000000000000..db96bbb69c21
--- /dev/null
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Based on upd720201.c:
+ * Copyright (C) 2024 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pci-pwrctrl.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+struct pci_pwrctrl_upd720201_data {
+	struct pci_pwrctrl ctx;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
+};
+
+static void devm_pci_pwrctrl_upd720201_power_off(void *data)
+{
+	struct pci_pwrctrl_upd720201_data *upd720201 = data;
+
+	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
+	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
+}
+
+static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
+{
+	struct pci_pwrctrl_upd720201_data *upd720201;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
+	if (!upd720201)
+		return -ENOMEM;
+
+	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
+					&upd720201->supplies);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
+		return ret;
+	}
+
+	upd720201->num_supplies = ret;
+	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
+		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
+				       upd720201);
+	if (ret)
+		return ret;
+
+	pci_pwrctrl_init(&upd720201->ctx, dev);
+
+	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
+
+	return 0;
+}
+
+static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
+	{
+		.compatible = "pci1912,0014",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
+
+static struct platform_driver pci_pwrctrl_upd720201_driver = {
+	.driver = {
+		.name = "pci-pwrctrl-upd720201",
+		.of_match_table = pci_pwrctrl_upd720201_of_match,
+	},
+	.probe = pci_pwrctrl_upd720201_probe,
+};
+module_platform_driver(pci_pwrctrl_upd720201_driver);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1


