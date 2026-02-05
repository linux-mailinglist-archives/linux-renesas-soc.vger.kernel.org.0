Return-Path: <linux-renesas-soc+bounces-27963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPXYAjbdhGkV6AMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 19:11:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9D3F65C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 19:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C30183021EB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 18:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76754306B1B;
	Thu,  5 Feb 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pR6IxgBA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E32A2FE595;
	Thu,  5 Feb 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770315016; cv=none; b=mc3ekUO0yLLs2LvJduoO7hTz/U499ix7xlXmR6Cm4wfHRBi4LSAppYCK1SDlSTgK4KPLsqAfk1waHnUbHuh7nxUFZqlNcJaGob6DfAoyknQaM714zvBGRVFfCS6p8Z81PODllPpEEMapp/DitE4eDY70gRp0xVclkAvT2yLl7gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770315016; c=relaxed/simple;
	bh=OaCfM389F1IU5t6YuzQr8NKmD6z9YNA3TH/grNI/l+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSyb8bNpKBXd9HBKRrBM0gF1mhjyDJH90SqPW5yn6rFJhqQZdSPc+SWM9Cf2kg811urS/5OIOlZKcAbsEGRh4f5Djqr90vpnMHVReHMAniqF57h8fWNXeWDXwCM0lisWWpgbbF6sWCx0EAVqspdIJkyJ08tr82SdDSM1YrhOUCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pR6IxgBA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DB3E01A2C34;
	Thu,  5 Feb 2026 18:10:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B0D486074D;
	Thu,  5 Feb 2026 18:10:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F426119D1711;
	Thu,  5 Feb 2026 19:10:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770315013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fSuCg3K7Jx0Gwv/8AMmGnZqgPu9OCuOQpbJh8hioD/g=;
	b=pR6IxgBA0tLEiL2O2qlWJXGpPWGZRegEJFUqpkFXEuJ5yOlan38RwbwEi28Yxbs8Gns3L4
	+Jd7ecWoSqYRLSPyagvuxnfWhJzrHPWXOz9cLFQpXHqMary/3OzLW+gO7We4MEV0AVsbYf
	UIZf3DJsIeIxwOoe59q0WSXl0S92H6e+i9p4+8nUp1qVMhGcU6zLJFfmPDzBlrB/vdSnGC
	Hoa7mhp3KAyzXAsQOjvl3awrzSFGt53+pfKcwR1on/ZUmZmsl4yTB41g74zOjM4cnG2+EM
	l2NYgVM0EAMwUGDq4LA+oxL7hy7TSg259pNqJS9EHO1W5cnrkCPbC8l8uJFHjA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 05 Feb 2026 19:09:49 +0100
Subject: [PATCH v5 2/4] spi: cadence-qspi: Kill cqspi_jh7110_clk_init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-schneider-6-19-rc1-qspi-v5-2-843632b3c674@bootlin.com>
References: <20260205-schneider-6-19-rc1-qspi-v5-0-843632b3c674@bootlin.com>
In-Reply-To: <20260205-schneider-6-19-rc1-qspi-v5-0-843632b3c674@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27963-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,ti.com];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6D9D3F65C5
X-Rspamd-Action: no action

This controller can be fed by either a main "ref" clock, or three clocks
("ref" again, "ahb", "apb"). In practice, it is likely that all
controllers have the same inputs, but a single clock feeds the three
interfaces (ref is used for controlling the external interface, ahb/apb
the internal ones). Handling these clocks is in no way SoC specific,
only the number of expected clocks may change. Plus, we will soon be
adding another controller requiring an AHB and an APB clock as well, so
it is time to align the whole clock handling.

Furthermore, the use of the cqspi_jh7110_clk_init() helper, which
specifically grabs and enables the "ahb" and "apb" clocks, is a bit
convoluted:
- only the JH7110 compatible provides the ->jh7110_clk_init() callback,
- in the probe, if the above callback is set in the driver data, the
  driver does not call the callback (!) but instead calls the helper
  directly (?),
- in the helper, the is_jh7110 boolean is set.

This logic does not make sense. Instead:
- in the probe, set the is_jh7110 boolean based on the compatible,
- collect all available clocks with the "bulk" helper,
- enable the extra clocks if they are available,
- kill the SoC specific cqspi_jh7110_clk_init() helper.

This also allows to group the clock handling instead of depending on the
driver data pointer, which further simplifies the error path and the
remove callback.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 112 ++++++++++----------------------------
 1 file changed, 29 insertions(+), 83 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 2d287950d44c..f14a746cba2d 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -57,7 +57,8 @@ static_assert(CQSPI_MAX_CHIPSELECT <= SPI_DEVICE_CS_CNT_MAX);
 #define CQSPI_OP_WIDTH(part) ((part).nbytes ? ilog2((part).buswidth) : 0)
 
 enum {
-	CLK_QSPI_APB = 0,
+	CLK_QSPI_REF = 0,
+	CLK_QSPI_APB,
 	CLK_QSPI_AHB,
 	CLK_QSPI_NUM,
 };
@@ -78,8 +79,7 @@ struct cqspi_flash_pdata {
 struct cqspi_st {
 	struct platform_device	*pdev;
 	struct spi_controller	*host;
-	struct clk		*clk;
-	struct clk		*clks[CLK_QSPI_NUM];
+	struct clk_bulk_data	clks[CLK_QSPI_NUM];
 	unsigned int		sclk;
 
 	void __iomem		*iobase;
@@ -123,8 +123,6 @@ struct cqspi_driver_platdata {
 	int (*indirect_read_dma)(struct cqspi_flash_pdata *f_pdata,
 				 u_char *rxbuf, loff_t from_addr, size_t n_rx);
 	u32 (*get_dma_status)(struct cqspi_st *cqspi);
-	int (*jh7110_clk_init)(struct platform_device *pdev,
-			       struct cqspi_st *cqspi);
 };
 
 /* Operation timeout value */
@@ -1771,51 +1769,6 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi)
 	return 0;
 }
 
-static int cqspi_jh7110_clk_init(struct platform_device *pdev, struct cqspi_st *cqspi)
-{
-	static struct clk_bulk_data qspiclk[] = {
-		{ .id = "apb" },
-		{ .id = "ahb" },
-	};
-
-	int ret = 0;
-
-	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(qspiclk), qspiclk);
-	if (ret) {
-		dev_err(&pdev->dev, "%s: failed to get qspi clocks\n", __func__);
-		return ret;
-	}
-
-	cqspi->clks[CLK_QSPI_APB] = qspiclk[0].clk;
-	cqspi->clks[CLK_QSPI_AHB] = qspiclk[1].clk;
-
-	ret = clk_prepare_enable(cqspi->clks[CLK_QSPI_APB]);
-	if (ret) {
-		dev_err(&pdev->dev, "%s: failed to enable CLK_QSPI_APB\n", __func__);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(cqspi->clks[CLK_QSPI_AHB]);
-	if (ret) {
-		dev_err(&pdev->dev, "%s: failed to enable CLK_QSPI_AHB\n", __func__);
-		goto disable_apb_clk;
-	}
-
-	cqspi->is_jh7110 = true;
-
-	return 0;
-
-disable_apb_clk:
-	clk_disable_unprepare(cqspi->clks[CLK_QSPI_APB]);
-
-	return ret;
-}
-
-static void cqspi_jh7110_disable_clk(struct platform_device *pdev, struct cqspi_st *cqspi)
-{
-	clk_disable_unprepare(cqspi->clks[CLK_QSPI_AHB]);
-	clk_disable_unprepare(cqspi->clks[CLK_QSPI_APB]);
-}
 static int cqspi_probe(struct platform_device *pdev)
 {
 	const struct cqspi_driver_platdata *ddata;
@@ -1824,8 +1777,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct spi_controller *host;
 	struct resource *res_ahb;
 	struct cqspi_st *cqspi;
-	int ret;
-	int irq;
+	int ret, irq;
 
 	host = devm_spi_alloc_host(&pdev->dev, sizeof(*cqspi));
 	if (!host)
@@ -1836,10 +1788,11 @@ static int cqspi_probe(struct platform_device *pdev)
 	host->mem_caps = &cqspi_mem_caps;
 
 	cqspi = spi_controller_get_devdata(host);
+	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi"))
+		cqspi->is_jh7110 = true;
 
 	cqspi->pdev = pdev;
 	cqspi->host = host;
-	cqspi->is_jh7110 = false;
 	cqspi->ddata = ddata = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, cqspi);
 
@@ -1856,12 +1809,14 @@ static int cqspi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Obtain QSPI clock. */
-	cqspi->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(cqspi->clk)) {
-		dev_err(dev, "Cannot claim QSPI clock.\n");
-		ret = PTR_ERR(cqspi->clk);
-		return ret;
+	/* Obtain QSPI clocks. */
+	ret = devm_clk_bulk_get_optional(dev, CLK_QSPI_NUM, cqspi->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	if (!cqspi->clks[CLK_QSPI_REF].clk) {
+		dev_err(dev, "Cannot claim mandatory QSPI ref clock.\n");
+		return -ENODEV;
 	}
 
 	/* Obtain and remap controller address. */
@@ -1893,10 +1848,9 @@ static int cqspi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-
-	ret = clk_prepare_enable(cqspi->clk);
+	ret = clk_bulk_prepare_enable(CLK_QSPI_NUM, cqspi->clks);
 	if (ret) {
-		dev_err(dev, "Cannot enable QSPI clock.\n");
+		dev_err(dev, "Cannot enable QSPI clocks.\n");
 		goto disable_rpm;
 	}
 
@@ -1905,22 +1859,22 @@ static int cqspi_probe(struct platform_device *pdev)
 	if (IS_ERR(rstc)) {
 		ret = PTR_ERR(rstc);
 		dev_err(dev, "Cannot get QSPI reset.\n");
-		goto disable_clk;
+		goto disable_clks;
 	}
 
 	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
 	if (IS_ERR(rstc_ocp)) {
 		ret = PTR_ERR(rstc_ocp);
 		dev_err(dev, "Cannot get QSPI OCP reset.\n");
-		goto disable_clk;
+		goto disable_clks;
 	}
 
-	if (of_device_is_compatible(pdev->dev.of_node, "starfive,jh7110-qspi")) {
+	if (cqspi->is_jh7110) {
 		rstc_ref = devm_reset_control_get_optional_exclusive(dev, "rstc_ref");
 		if (IS_ERR(rstc_ref)) {
 			ret = PTR_ERR(rstc_ref);
 			dev_err(dev, "Cannot get QSPI REF reset.\n");
-			goto disable_clk;
+			goto disable_clks;
 		}
 		reset_control_assert(rstc_ref);
 		reset_control_deassert(rstc_ref);
@@ -1932,7 +1886,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	reset_control_assert(rstc_ocp);
 	reset_control_deassert(rstc_ocp);
 
-	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
+	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clks[CLK_QSPI_REF].clk);
 	host->max_speed_hz = cqspi->master_ref_clk_hz;
 
 	/* write completion is supported by default */
@@ -1958,12 +1912,6 @@ static int cqspi_probe(struct platform_device *pdev)
 			cqspi->slow_sram = true;
 		if (ddata->quirks & CQSPI_NEEDS_APB_AHB_HAZARD_WAR)
 			cqspi->apb_ahb_hazard = true;
-
-		if (ddata->jh7110_clk_init) {
-			ret = cqspi_jh7110_clk_init(pdev, cqspi);
-			if (ret)
-				goto disable_clk;
-		}
 		if (ddata->quirks & CQSPI_DISABLE_STIG_MODE)
 			cqspi->disable_stig_mode = true;
 
@@ -2029,11 +1977,8 @@ static int cqspi_probe(struct platform_device *pdev)
 disable_controller:
 	cqspi_controller_enable(cqspi, 0);
 disable_clks:
-	if (cqspi->is_jh7110)
-		cqspi_jh7110_disable_clk(pdev, cqspi);
-disable_clk:
 	if (pm_runtime_get_sync(&pdev->dev) >= 0)
-		clk_disable_unprepare(cqspi->clk);
+		clk_bulk_disable_unprepare(CLK_QSPI_NUM, cqspi->clks);
 disable_rpm:
 	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM)))
 		pm_runtime_disable(dev);
@@ -2062,14 +2007,12 @@ static void cqspi_remove(struct platform_device *pdev)
 
 	cqspi_controller_enable(cqspi, 0);
 
-	if (cqspi->is_jh7110)
-		cqspi_jh7110_disable_clk(pdev, cqspi);
 
 	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM)))
 		ret = pm_runtime_get_sync(&pdev->dev);
 
 	if (ret >= 0)
-		clk_disable(cqspi->clk);
+		clk_bulk_disable_unprepare(CLK_QSPI_NUM, cqspi->clks);
 
 	if (!(ddata && (ddata->quirks & CQSPI_DISABLE_RUNTIME_PM))) {
 		pm_runtime_put_sync(&pdev->dev);
@@ -2082,15 +2025,19 @@ static int cqspi_runtime_suspend(struct device *dev)
 	struct cqspi_st *cqspi = dev_get_drvdata(dev);
 
 	cqspi_controller_enable(cqspi, 0);
-	clk_disable_unprepare(cqspi->clk);
+	clk_bulk_disable_unprepare(CLK_QSPI_NUM, cqspi->clks);
 	return 0;
 }
 
 static int cqspi_runtime_resume(struct device *dev)
 {
 	struct cqspi_st *cqspi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(CLK_QSPI_NUM, cqspi->clks);
+	if (ret)
+		return ret;
 
-	clk_prepare_enable(cqspi->clk);
 	cqspi_wait_idle(cqspi);
 	cqspi_controller_enable(cqspi, 0);
 	cqspi_controller_init(cqspi);
@@ -2173,7 +2120,6 @@ static const struct cqspi_driver_platdata versal2_ospi = {
 
 static const struct cqspi_driver_platdata jh7110_qspi = {
 	.quirks = CQSPI_DISABLE_DAC_MODE,
-	.jh7110_clk_init = cqspi_jh7110_clk_init,
 };
 
 static const struct cqspi_driver_platdata pensando_cdns_qspi = {

-- 
2.51.1


