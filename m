Return-Path: <linux-renesas-soc+bounces-17312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3562ABF75C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3BA01BC5CE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1DD1A317A;
	Wed, 21 May 2025 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mqrze2vk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69D1A0BCD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836603; cv=none; b=oyX6XpO9w46+dheu1W0yR6CQ+fcNhYDUcHLy0BmS0XDwgwGWFo3Ctgfw07oar+hWewGTmlalj2ykA+ZJQoThWDqpC+6RAMqxSsoKtnTZJoU2JCzB2e6FskcHkh9TLuxa+mvu2oKImTaN60rXF6jyVWOO2oKXZlO4Qv5j1dbQTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836603; c=relaxed/simple;
	bh=+Bnc8t8lsi34VONPodJikrZFaRXU/M748q7TCUgSP5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/5oQ0ir1Qv3bC9T5q+8X3PxBEjDFATJH461dpTWqM2v35XnMp4BoKeQd3go17fzVCru7U3ap3g+mMXFWIjsei/uYhhcvhPUCTfmPffIxrPeGgGjQKDnHU9t5oukSE7V6UqKbp651woF+v3n0xU2xYnCLRrW5kpKNnLYbQ8F9GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mqrze2vk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad5740dd20eso552369866b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836598; x=1748441398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UedCLNxDCDNXrkhFG5Bwr5eGT+o8jfZIwOWNIdKE0rM=;
        b=Mqrze2vkyisirS4zuoxgsFVk5eGZfNB4E47FePcvQ3d7lHyb8PX2n4fKkh68mzAKIF
         Z/EAAb0SC9dTRdWRwkyqmdY/FmjtytKiuT/0iEHMv1MKKmuyP3AnWFER8iVoF4S3HBlP
         fMDq+pXYRoZXmWFinXUKIEbnK5nIgEzHx5S27oGaFihRJbQUInDoKGJ3MLcO3iL3eIhV
         TlEMTPDR4Rm9Dz49keEM6xEhIE2BunLGFEH5rOazdgyfB5WwmuXE2Q9PRn3Z5oALaumA
         r8L333NaHQR6GMFdcB5JbCs/8NIGgZ1ItHBfEatcOFjfLhD4VwNFSk4W1Y2SnXkwOIgx
         3ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836598; x=1748441398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UedCLNxDCDNXrkhFG5Bwr5eGT+o8jfZIwOWNIdKE0rM=;
        b=PaUvcpln7wDHe6CqDNm7JOH+foO4YCVgljoePNf3MJBy9W8zTeIDk1f73uv2kNA5YN
         W7eYQbSZ42sGUyxA4NRL4VE42k0fyXcJR+GXpvDgedQ6Uz8JFFG2cIdNqx4QH2kLPepa
         DrfHHLTHLPRNQkEXhdSK0mvD5mkHIwqjPnHzak6vBakDs0dsZOMTsIQ/wDKQr+dAPS00
         exQOHKd8TIp62OKhiHQkW9n7vij9qK860MJ0Wr3MZjZa/N3ba/a6ClZYMqt7QLL0TFvZ
         W7WyRcM+sIE7MMdI9u33ogEt/qVQJGXttYdTQuieu5sneKVA7dyl9goqolhIiJ9RmjLL
         qY1g==
X-Forwarded-Encrypted: i=1; AJvYcCW2+85vRYdM9nQ7qDH8SkuF46oLN0tGOvzB3sSkm9dCh8hPwlJhpB+bCmhf8q654ExlL/rAoTpgUuUeWfH3r7pyAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8vl/Bq/ApZ7NeL4jPi6LIZzax9fPip0/n8v8G//dVNhdox9FF
	b/GHHRI4BPSqGKtbS8r0Auy1Dt5OVOE0fKsEeKcDkT9xAPg7PI6bJtVSv8IwKGklWlE=
X-Gm-Gg: ASbGncuBDWniXkcmLl2i/+SSwhw+kh1dbjrUQYsbxz0I/2BfyL0alWF5X8d3hP7jLkB
	BZ0HznLuMb6rWC73omLwZ/55mDQ0V+bLzY+pKW+z/yu4adLbIJAwsCoZX1XKBISq5+6/uoaAQEi
	6o/n076vLdag3csXccBLd9Y2U5vLdroc3WaK0I5c4I6pXwzrah26CS9yXzmWne36S+hUaVwhqLA
	91TRSnsimQp6n0FMYODrgZz2fKOPaS2gfGUtNrT6tGEtsEUDaqbRSQRM2bXnGd93bhvnbcm1X/q
	pCLGfU794zi+HuNpzvIr7H3TI01feIvKaIQtAtAYN125DOOoyd5Pi9tGTFzRLdVPyRkcdTzToLY
	YIYzq
X-Google-Smtp-Source: AGHT+IHjTB+uSvP0d7ytYVEkpks/MODhIoqcBa9GEuSth8DVEvHEQL+8Uy97ooyKORTwYBtfF0WaSw==
X-Received: by 2002:a17:906:9fc4:b0:ad2:51d8:7930 with SMTP id a640c23a62f3a-ad52d46923emr1701313366b.12.1747836597677;
        Wed, 21 May 2025 07:09:57 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:09:57 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 02/12] soc: renesas: rz-sysc: Add signal support
Date: Wed, 21 May 2025 17:09:33 +0300
Message-ID: <20250521140943.3830195-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S system controller (SYSC) has various registers that control
signals specific to individual IPs. IP drivers must control these signals
at different configuration phases.

Update the SYSC driver to allows individual SYSC consumers to control these
signals. The SYSC driver exports a syscon regmap enabling IP drivers to
use a specific SYSC offset and mask from the device tree, which can then be
accessed through regmap_update_bits().

Currently, the SYSC driver provides control to the USB PWRRDY signal, which
is routed to the USB PHY. This signal needs to be managed before or after
powering the USB PHY off or on.

Other SYSC signals candidates (as exposed in the hardware manual of the
RZ/G3S SoC) include:

* PCIe:
- ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
- PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
  register
- MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register

* SPI:
- SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
  register

* I2C/I3C:
- af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
  (x=0..3)
- af_bypass I3C signal controlled through SYS_I3C_CFG register

* Ethernet:
- FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
  registers (x=0..1)

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- this patch is new, however, most of its parts were picked from [1]

Compared with [1]:
- kept only the signals part
- droped double "the" in description
- mark init data with __initconst
- use flexible arrays to store the signals
- simplified the code in rz_sysc_off_to_signal() and
  rz_sysc_reg_update_bits() as proposed in the review process
- dropped rz_sysc_writeable_reg(), rz_sysc_readable_reg()
- fixed rz_sysc_signals_init() as it didn't work with more than one
  signal
- embedded rz_sysc_signal_init_data in rz_sysc_signal for simpler
  memory allocation
- added rz_sysc_get_signal_map() and struct rz_sysc_signal_map as
  a unified helper and data structure to handle a signal
- use rz_sysc_reg_read(), rz_sysc_reg_write(),
  rz_sysc_reg_update_bits() in all the rz-sysc consummers

[1] https://lore.kernel.org/all/20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com/

 drivers/soc/renesas/r9a08g045-sysc.c |   3 +
 drivers/soc/renesas/r9a09g047-sys.c  |   3 +
 drivers/soc/renesas/r9a09g057-sys.c  |   3 +
 drivers/soc/renesas/rz-sysc.c        | 185 ++++++++++++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h        |  35 +++++
 include/linux/soc/renesas/rz-sysc.h  |  30 +++++
 6 files changed, 257 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/soc/renesas/rz-sysc.h

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index 0ef6df77e25f..d2c9e3b77f41 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -25,6 +25,9 @@ static const struct regmap_config rzg3s_sysc_regmap __initconst = {
 	.val_bits = 32,
 	.fast_io = true,
 	.max_register = 0xe20,
+	.reg_read = rz_sysc_reg_read,
+	.reg_write = rz_sysc_reg_write,
+	.reg_update_bits = rz_sysc_reg_update_bits,
 };
 
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index a3acf6dd2867..fd4018e0aca1 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -69,6 +69,9 @@ static const struct regmap_config rzg3e_sysc_regmap __initconst = {
 	.val_bits = 32,
 	.fast_io = true,
 	.max_register = 0x170c,
+	.reg_read = rz_sysc_reg_read,
+	.reg_write = rz_sysc_reg_write,
+	.reg_update_bits = rz_sysc_reg_update_bits,
 };
 
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index c26821636dce..cfa5be48f049 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -69,6 +69,9 @@ static const struct regmap_config rzv2h_sysc_regmap __initconst = {
 	.val_bits = 32,
 	.fast_io = true,
 	.max_register = 0x170c,
+	.reg_read = rz_sysc_reg_read,
+	.reg_write = rz_sysc_reg_write,
+	.reg_update_bits = rz_sysc_reg_update_bits,
 };
 
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 70556a2f55e6..3dd5d444050b 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -5,11 +5,16 @@
  * Copyright (C) 2024 Renesas Electronics Corp.
  */
 
+#include <linux/dcache.h>
+#include <linux/debugfs.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/refcount.h>
 #include <linux/regmap.h>
+#include <linux/seq_file.h>
+#include <linux/soc/renesas/rz-sysc.h>
 #include <linux/sys_soc.h>
 
 #include "rz-sysc.h"
@@ -20,12 +25,183 @@
  * struct rz_sysc - RZ SYSC private data structure
  * @base: SYSC base address
  * @dev: SYSC device pointer
+ * @num_signals: number of SYSC signals
+ * @signals: SYSC signals
  */
 struct rz_sysc {
 	void __iomem *base;
 	struct device *dev;
+	u8 num_signals;
+	struct rz_sysc_signal signals[] __counted_by(num_signals);
 };
 
+struct rz_sysc_signal_map *rz_sysc_get_signal_map(struct device *dev)
+{
+	struct rz_sysc_signal_map *map;
+	struct of_phandle_args args;
+	struct regmap *regmap;
+	int ret;
+
+	if (!dev)
+		return ERR_PTR(-EINVAL);
+
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "renesas,sysc-signals", 2,
+					       0, &args);
+	if (ret)
+		return ERR_PTR(ret);
+
+	regmap = syscon_node_to_regmap(args.np);
+	of_node_put(args.np);
+	if (IS_ERR(regmap))
+		return ERR_CAST(regmap);
+
+	map = devm_kzalloc(dev, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
+
+	map->regmap = regmap;
+	map->offset = args.args[0];
+	map->mask = args.args[1];
+
+	return map;
+}
+
+int rz_sysc_reg_read(void *context, unsigned int off, unsigned int *val)
+{
+	struct rz_sysc *sysc = context;
+
+	*val = readl(sysc->base + off);
+
+	return 0;
+}
+
+static struct rz_sysc_signal *rz_sysc_off_to_signal(struct rz_sysc *sysc, unsigned int offset,
+						    unsigned int mask)
+{
+	struct rz_sysc_signal *signals = sysc->signals;
+
+	for (u32 i = 0; i < sysc->num_signals; i++) {
+		if (signals[i].init_data.offset != offset)
+			continue;
+
+		/*
+		 * In case mask == 0 we just return the signal data w/o checking the mask.
+		 * This is useful when calling through rz_sysc_reg_write() to check
+		 * if the requested setting is for a mapped signal or not.
+		 */
+		if (!mask || signals[i].init_data.mask == mask)
+			return &signals[i];
+	}
+
+	return NULL;
+}
+
+int rz_sysc_reg_update_bits(void *context, unsigned int off, unsigned int mask, unsigned int val)
+{
+	unsigned int shifted_val = field_get(mask, val);
+	struct rz_sysc *sysc = context;
+	struct rz_sysc_signal *signal;
+	bool update = false;
+
+	signal = rz_sysc_off_to_signal(sysc, off, mask);
+	if (!signal) {
+		update = true;
+	} else if (signal->init_data.refcnt_incr_val != shifted_val) {
+		update = refcount_dec_and_test(&signal->refcnt);
+	} else if (!refcount_read(&signal->refcnt)) {
+		refcount_set(&signal->refcnt, 1);
+		update = true;
+	} else {
+		refcount_inc(&signal->refcnt);
+	}
+
+	if (update) {
+		u32 tmp;
+
+		tmp = readl(sysc->base + off);
+		tmp &= ~mask;
+		tmp |= val & mask;
+		writel(tmp, sysc->base + off);
+	}
+
+	return 0;
+}
+
+int rz_sysc_reg_write(void *context, unsigned int off, unsigned int val)
+{
+	struct rz_sysc *sysc = context;
+	struct rz_sysc_signal *signal;
+
+	/*
+	 * Force using regmap_update_bits() for signals to have reference counter
+	 * per individual signal in case there are multiple signals controlled
+	 * through the same register.
+	 */
+	signal = rz_sysc_off_to_signal(sysc, off, 0);
+	if (signal) {
+		dev_err(sysc->dev,
+			"regmap_write() not allowed on register controlling a signal. Use regmap_update_bits()!");
+		return -EOPNOTSUPP;
+	}
+
+	writel(val, sysc->base + off);
+
+	return 0;
+}
+
+static int rz_sysc_signals_show(struct seq_file *s, void *what)
+{
+	struct rz_sysc *sysc = s->private;
+
+	seq_printf(s, "%-20s Enable count\n", "Signal");
+	seq_printf(s, "%-20s ------------\n", "--------------------");
+
+	for (u8 i = 0; i < sysc->num_signals; i++) {
+		seq_printf(s, "%-20s %d\n", sysc->signals[i].init_data.name,
+			   refcount_read(&sysc->signals[i].refcnt));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(rz_sysc_signals);
+
+static void rz_sysc_debugfs_remove(void *data)
+{
+	debugfs_remove_recursive(data);
+}
+
+static int rz_sysc_signals_init(struct rz_sysc *sysc,
+				const struct rz_sysc_signal_init_data *init_data,
+				u32 num_signals)
+{
+	struct dentry *root;
+	int ret;
+
+	for (unsigned int i = 0; i < num_signals; i++) {
+		struct rz_sysc_signal_init_data *data = &sysc->signals[i].init_data;
+
+		data->name = devm_kstrdup(sysc->dev, init_data[i].name, GFP_KERNEL);
+		if (!data->name)
+			return -ENOMEM;
+
+		data->offset = init_data[i].offset;
+		data->mask = init_data[i].mask;
+		data->refcnt_incr_val = init_data[i].refcnt_incr_val;
+
+		refcount_set(&sysc->signals[i].refcnt, 0);
+	}
+
+	sysc->num_signals = num_signals;
+
+	root = debugfs_create_dir("renesas-rz-sysc", NULL);
+	ret = devm_add_action_or_reset(sysc->dev, rz_sysc_debugfs_remove, root);
+	if (ret)
+		return ret;
+	debugfs_create_file("signals", 0444, root, sysc, &rz_sysc_signals_fops);
+
+	return 0;
+}
+
 static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *match)
 {
 	const struct rz_sysc_init_data *sysc_data = match->data;
@@ -115,7 +291,8 @@ static int rz_sysc_probe(struct platform_device *pdev)
 
 	data = match->data;
 
-	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
+	sysc = devm_kzalloc(dev, struct_size(sysc, signals, data->num_signals),
+			    GFP_KERNEL);
 	if (!sysc)
 		return -ENOMEM;
 
@@ -128,7 +305,11 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (ret || !data->regmap_cfg)
 		return ret;
 
-	regmap = devm_regmap_init_mmio(dev, sysc->base, data->regmap_cfg);
+	ret = rz_sysc_signals_init(sysc, data->signals_init_data, data->num_signals);
+	if (ret)
+		return ret;
+
+	regmap = devm_regmap_init(dev, NULL, sysc, data->regmap_cfg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 447008140634..111f79ef9573 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -9,10 +9,35 @@
 #define __SOC_RENESAS_RZ_SYSC_H__
 
 #include <linux/device.h>
+#include <linux/refcount.h>
 #include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/types.h>
 
+/**
+ * struct rz_sysc_signal_init_data - RZ SYSC signals init data
+ * @name: signal name
+ * @offset: register offset controling this signal
+ * @mask: bitmask in register specific to this signal
+ * @refcnt_incr_val: increment refcnt when setting this value
+ */
+struct rz_sysc_signal_init_data {
+	const char *name;
+	u32 offset;
+	u32 mask;
+	u32 refcnt_incr_val;
+};
+
+/**
+ * struct rz_sysc_signal - RZ SYSC signals
+ * @init_data: signals initialization data
+ * @refcnt: reference counter
+ */
+struct rz_sysc_signal {
+	struct rz_sysc_signal_init_data init_data;
+	refcount_t refcnt;
+};
+
 /**
  * struct rz_syc_soc_id_init_data - RZ SYSC SoC identification initialization data
  * @family: RZ SoC family
@@ -35,13 +60,23 @@ struct rz_sysc_soc_id_init_data {
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ * @signals_init_data: RZ SYSC signals initialization data
  * @regmap_cfg: SoC-specific regmap config
+ * @num_signals: number of SYSC signals
  */
 struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+	const struct rz_sysc_signal_init_data *signals_init_data;
 	const struct regmap_config *regmap_cfg;
+	u32 max_register_offset;
+	u32 num_signals;
 };
 
+extern int rz_sysc_reg_read(void *context, unsigned int off, unsigned int *val);
+extern int rz_sysc_reg_write(void *context, unsigned int off, unsigned int val);
+extern int rz_sysc_reg_update_bits(void *context, unsigned int off,
+				   unsigned int mask, unsigned int val);
+
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 extern const struct rz_sysc_init_data rzv2h_sys_init_data;
diff --git a/include/linux/soc/renesas/rz-sysc.h b/include/linux/soc/renesas/rz-sysc.h
new file mode 100644
index 000000000000..e2864ebeadf7
--- /dev/null
+++ b/include/linux/soc/renesas/rz-sysc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_SOC_RENESAS_RZ_SYSC_H__
+#define __LINUX_SOC_RENESAS_RZ_SYSC_H__
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/regmap.h>
+
+/**
+ * struct rz_sysc_signal_map - RZ SYSC signal mapping (to be used by consummers)
+ * @regmap: SYSC regmap
+ * @offset: offset into the SYSC address space for accessing the signal
+ * @mask: mask into the register at offset for accessing the signal
+ */
+struct rz_sysc_signal_map {
+	struct regmap *regmap;
+	u32 offset;
+	u32 mask;
+};
+
+#ifdef CONFIG_SYSC_RZ
+extern struct rz_sysc_signal_map *rz_sysc_get_signal_map(struct device *dev);
+#else
+static inline struct rz_sysc_signal_map *rz_sysc_get_signal_map(struct device *dev)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif
+
+#endif /* __LINUX_SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.43.0


