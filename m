Return-Path: <linux-renesas-soc+bounces-25093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A97C821A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 19:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 755BB34A96E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 18:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AB3319618;
	Mon, 24 Nov 2025 18:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGq6Jx7p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45769319612;
	Mon, 24 Nov 2025 18:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764008893; cv=none; b=ma+NH5ad8uCjl84HTT9XTsT/vhAicdMDkQysbn8ILGKoEhk9wcRLLhUke6G8IWqOeNa8p9XYK/KoMGj0wGGqTkVF5FNwYQmZY4tXllL198K4L/+cNegq4vg2/zbGxktY4+lJmyFdXzRQmXkWKyN1cyYC45bSG2mlRzgwCE3lllY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764008893; c=relaxed/simple;
	bh=LveFK3svzwr3240pinEzhr4cRcEQRM0RRxCFeTRmktU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RsKfhl6WjSKqf6bxIYd9eGtG64TgkhZ4Ujsk4HHsIjWGOqzr1bANQVr7UM+Ad0NTqqet+bFuvng3suuiuh0LqCO3HIEKa6dNJtr/gn2DscReFeqoizHZWYVQQ2dv+bY2Qlj7z7peIjJVLnjQG6b/BnQWHRXu9HJmALfkaeMwMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGq6Jx7p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81B8C4CEF1;
	Mon, 24 Nov 2025 18:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764008893;
	bh=LveFK3svzwr3240pinEzhr4cRcEQRM0RRxCFeTRmktU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGq6Jx7pBzvR2a+xdiqPUncCy1FvjZRbHZDBF+ugQBicvMnPobpFHPoZHIQMCce+J
	 9qpdLngMVe17YC25iva5Kv0+tr1Z502VyIo48cTJeLzt+e/sTE589Ib8NqihaP3Owl
	 GaZMkeokHq7NgRUQqA9aJNY5LsS5iAz5bSqpsMXSv4XZKwsQ06gQ9BdHk2MRlTgd8X
	 geRahs6QZeiu7vVGLMetG0eXeNctJdJ3GOhG2vThlKG/DQiERnrF4wXdVaV6gjZZGe
	 Utcp5ttWxDaiAxjKYH/xDtUR/FLmRGWrqPHpdhFq3XVvI7g8Eo94rWzcfhpCEyHF7Y
	 ed9VCgAY54w5Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Peng Fan <peng.fan@nxp.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"
Date: Mon, 24 Nov 2025 12:27:48 -0600
Message-ID: <20251124182751.507624-2-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124182751.507624-1-robh@kernel.org>
References: <20251124182751.507624-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added of_reserved_mem_region_to_resource() and
of_reserved_mem_region_count() functions to handle "memory-region"
properties.

The error handling is a bit different in some cases. Often
"memory-region" is optional, so failed lookup is not an error. But then
an error in of_reserved_mem_lookup() is treated as an error. However,
that distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v7:
 - Split QCom to separate patch
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 24 ++++------
 drivers/remoteproc/qcom_q6v5_mss.c  | 60 ++++++++-----------------
 drivers/remoteproc/qcom_q6v5_pas.c  | 69 +++++++++++------------------
 drivers/remoteproc/qcom_q6v5_wcss.c | 25 +++++------
 drivers/remoteproc/qcom_wcnss.c     | 23 ++++------
 5 files changed, 72 insertions(+), 129 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index e98b7e03162c..d3933a66ed3d 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -625,26 +625,20 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
 
 static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
 {
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
-
-	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
+	int ret;
+	struct resource res;
 
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(adsp->dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(adsp->dev, "unable to resolve memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	adsp->mem_phys = adsp->mem_reloc = rmem->base;
-	adsp->mem_size = rmem->size;
-	adsp->mem_region = devm_ioremap_wc(adsp->dev,
-				adsp->mem_phys, adsp->mem_size);
+	adsp->mem_phys = adsp->mem_reloc = res.start;
+	adsp->mem_size = resource_size(&res);
+	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
 	if (!adsp->mem_region) {
-		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, adsp->mem_size);
+		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 3087d895b87f..91940977ca89 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1970,8 +1970,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
 static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 {
 	struct device_node *child;
-	struct reserved_mem *rmem;
-	struct device_node *node;
+	struct resource res;
+	int ret;
 
 	/*
 	 * In the absence of mba/mpss sub-child, extract the mba and mpss
@@ -1979,71 +1979,49 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 	 */
 	child = of_get_child_by_name(qproc->dev->of_node, "mba");
 	if (!child) {
-		node = of_parse_phandle(qproc->dev->of_node,
-					"memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 0, &res);
 	} else {
-		node = of_parse_phandle(child, "memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(child, 0, &res);
 		of_node_put(child);
 	}
 
-	if (!node) {
-		dev_err(qproc->dev, "no mba memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mba region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	qproc->mba_phys = rmem->base;
-	qproc->mba_size = rmem->size;
+	qproc->mba_phys = res.start;
+	qproc->mba_size = resource_size(&res);
 
 	if (!child) {
-		node = of_parse_phandle(qproc->dev->of_node,
-					"memory-region", 1);
+		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 1, &res);
 	} else {
 		child = of_get_child_by_name(qproc->dev->of_node, "mpss");
-		node = of_parse_phandle(child, "memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(child, 0, &res);
 		of_node_put(child);
 	}
 
-	if (!node) {
-		dev_err(qproc->dev, "no mpss memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mpss region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	qproc->mpss_phys = qproc->mpss_reloc = rmem->base;
-	qproc->mpss_size = rmem->size;
+	qproc->mpss_phys = qproc->mpss_reloc = res.start;
+	qproc->mpss_size = resource_size(&res);
 
 	if (!child) {
-		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
+		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 2, &res);
 	} else {
 		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
-		node = of_parse_phandle(child, "memory-region", 0);
+		ret = of_reserved_mem_region_to_resource(child, 0, &res);
 		of_node_put(child);
 	}
 
-	if (!node)
+	if (ret)
 		return 0;
 
-	rmem = of_reserved_mem_lookup(node);
-	if (!rmem) {
-		dev_err(qproc->dev, "unable to resolve metadata region\n");
-		return -EINVAL;
-	}
-
-	qproc->mdata_phys = rmem->base;
-	qproc->mdata_size = rmem->size;
+	qproc->mdata_phys = res.start;
+	qproc->mdata_size = resource_size(&res);
 
 	return 0;
 }
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 158bcd6cc85c..7bac843ce406 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -547,53 +547,37 @@ static void qcom_pas_pds_detach(struct qcom_pas *pas, struct device **pds, size_
 
 static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 {
-	struct reserved_mem *rmem;
-	struct device_node *node;
-
-	node = of_parse_phandle(pas->dev->of_node, "memory-region", 0);
-	if (!node) {
-		dev_err(pas->dev, "no memory-region specified\n");
-		return -EINVAL;
-	}
+	struct resource res;
+	int ret;
 
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(pas->dev, "unable to resolve memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	pas->mem_phys = pas->mem_reloc = rmem->base;
-	pas->mem_size = rmem->size;
-	pas->mem_region = devm_ioremap_wc(pas->dev, pas->mem_phys, pas->mem_size);
+	pas->mem_phys = pas->mem_reloc = res.start;
+	pas->mem_size = resource_size(&res);
+	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
 	if (!pas->mem_region) {
-		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, pas->mem_size);
+		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
 	if (!pas->dtb_pas_id)
 		return 0;
 
-	node = of_parse_phandle(pas->dev->of_node, "memory-region", 1);
-	if (!node) {
-		dev_err(pas->dev, "no dtb memory-region specified\n");
-		return -EINVAL;
-	}
-
-	rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 1, &res);
+	if (ret) {
 		dev_err(pas->dev, "unable to resolve dtb memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	pas->dtb_mem_phys = pas->dtb_mem_reloc = rmem->base;
-	pas->dtb_mem_size = rmem->size;
-	pas->dtb_mem_region = devm_ioremap_wc(pas->dev, pas->dtb_mem_phys, pas->dtb_mem_size);
+	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
+	pas->dtb_mem_size = resource_size(&res);
+	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
 	if (!pas->dtb_mem_region) {
-		dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
-			&rmem->base, pas->dtb_mem_size);
+		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
@@ -603,7 +587,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 static int qcom_pas_assign_memory_region(struct qcom_pas *pas)
 {
 	struct qcom_scm_vmperm perm[MAX_ASSIGN_COUNT];
-	struct device_node *node;
 	unsigned int perm_size;
 	int offset;
 	int ret;
@@ -612,17 +595,15 @@ static int qcom_pas_assign_memory_region(struct qcom_pas *pas)
 		return 0;
 
 	for (offset = 0; offset < pas->region_assign_count; ++offset) {
-		struct reserved_mem *rmem = NULL;
-
-		node = of_parse_phandle(pas->dev->of_node, "memory-region",
-					pas->region_assign_idx + offset);
-		if (node)
-			rmem = of_reserved_mem_lookup(node);
-		of_node_put(node);
-		if (!rmem) {
+		struct resource res;
+
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node,
+							 pas->region_assign_idx + offset,
+							 &res);
+		if (ret) {
 			dev_err(pas->dev, "unable to resolve shareable memory-region index %d\n",
 				offset);
-			return -EINVAL;
+			return ret;
 		}
 
 		if (pas->region_assign_shared)  {
@@ -637,8 +618,8 @@ static int qcom_pas_assign_memory_region(struct qcom_pas *pas)
 			perm_size = 1;
 		}
 
-		pas->region_assign_phys[offset] = rmem->base;
-		pas->region_assign_size[offset] = rmem->size;
+		pas->region_assign_phys[offset] = res.start;
+		pas->region_assign_size[offset] = resource_size(&res);
 		pas->region_assign_owners[offset] = BIT(QCOM_SCM_VMID_HLOS);
 
 		ret = qcom_scm_assign_mem(pas->region_assign_phys[offset],
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 07c88623f597..ca748e3bcc7f 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -873,27 +873,22 @@ static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
 
 static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 {
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
 	struct device *dev = wcss->dev;
+	struct resource res;
+	int ret;
 
-	node = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
-
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(dev, "unable to acquire memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	wcss->mem_phys = rmem->base;
-	wcss->mem_reloc = rmem->base;
-	wcss->mem_size = rmem->size;
-	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
+	wcss->mem_phys = res.start;
+	wcss->mem_reloc = res.start;
+	wcss->mem_size = resource_size(&res);
+	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
 	if (!wcss->mem_region) {
-		dev_err(dev, "unable to map memory region: %pa+%pa\n",
-			&rmem->base, &rmem->size);
+		dev_err(dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 2c7e519a2254..14005fb049a2 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -526,25 +526,20 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
 
 static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 {
-	struct reserved_mem *rmem = NULL;
-	struct device_node *node;
-
-	node = of_parse_phandle(wcnss->dev->of_node, "memory-region", 0);
-	if (node)
-		rmem = of_reserved_mem_lookup(node);
-	of_node_put(node);
+	struct resource res;
+	int ret;
 
-	if (!rmem) {
+	ret = of_reserved_mem_region_to_resource(wcnss->dev->of_node, 0, &res);
+	if (ret) {
 		dev_err(wcnss->dev, "unable to resolve memory-region\n");
-		return -EINVAL;
+		return ret;
 	}
 
-	wcnss->mem_phys = wcnss->mem_reloc = rmem->base;
-	wcnss->mem_size = rmem->size;
-	wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
+	wcnss->mem_phys = wcnss->mem_reloc = res.start;
+	wcnss->mem_size = resource_size(&res);
+	wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
 	if (!wcnss->mem_region) {
-		dev_err(wcnss->dev, "unable to map memory region: %pa+%zx\n",
-			&rmem->base, wcnss->mem_size);
+		dev_err(wcnss->dev, "unable to map memory region: %pR\n", &res);
 		return -EBUSY;
 	}
 
-- 
2.51.0


