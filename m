Return-Path: <linux-renesas-soc+bounces-5454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4B8CDB70
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 22:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1216284C5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 20:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61C481AD0;
	Thu, 23 May 2024 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Dcepdsa2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1606E1755C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716496479; cv=none; b=UlAi3e99UM61wMzV22L7LHctpH+HC1ZtEHrnssRLuIiSEkuzNhufFXT9gICRCNgqapkjClVF168MOZuoeFUuOD+Qkuf7MrZa1uo5Yc1JqCS3PyioWmsGr1+YXfabW5hGibiAEMw1MY5nVOgFj/d5mys0dZwfyxsvkExoMSqSrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716496479; c=relaxed/simple;
	bh=9vCidmoZDf9EA4kRW9pEh6B1uVmWWyDeUihUyV51gb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PZQCDLMeUrzIRPY+Nx1xZYfo3xtezrfjwn/TSakOWxy9ztXTlpgF9cHm1vbggAaGieo6dVahN26Hsh9N9lrcDX+4vk0NSQcXWZqz6+7liP5ocSfs4pyfK90k3nyyt9t+AtNw/kNg51lj3q6MEeVz20w9814GSLHcfmhfe6JQ4Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Dcepdsa2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=GnP7GgbPXe2pQj
	Ta7kgtbWFtRM7T3CQSQoOf4tU3jvQ=; b=Dcepdsa2xptxiP8Vv6mcbPLbqjgmGN
	i5vLKVrt+MEF+u/BFuO6Y7qnE/QEwVqQr5rfW2K1qihetzNoYQ2FD6rZNAwmspL8
	zVzN8JO1a1fu6oTLZ25X3Kv+LVn7otxLnBi9rDT1Wlxd82KLXmsyRWxBGEe7bZKl
	1uRgz81z+ciln93AlyFWH2IfYfHyToofWkWj3bN19JJqjeVQlj3KDhmTLZ4iVctz
	bTXWcSBLGDRwbVrFVesobAzq3UmhaTiuYopZEKQDO/wOZYpAJKnXDEkUXO0NCrzh
	SUJ1JtJ6XjpqrVVHBygtG2gBxnPtEsmtG4OECgapKusQMS9q+pyIB18Q==
Received: (qmail 1238928 invoked from network); 23 May 2024 22:34:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2024 22:34:34 +0200
X-UD-Smtp-Session: l3s3148p1@JQ+T+iQZCrEujntm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller
Date: Thu, 23 May 2024 22:34:31 +0200
Message-Id: <20240523203431.6423-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable both modes, host and endpoint. Also, enable EDMA for performance
gain for the endpoint mode.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1: added EDMA

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee4..84a59e41323c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -233,6 +233,8 @@ CONFIG_PCIE_HISI_STB=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_PCIE_TEGRA194_HOST=m
 CONFIG_PCIE_QCOM=y
+CONFIG_PCIE_RCAR_GEN4_HOST=y
+CONFIG_PCIE_RCAR_GEN4_EP=y
 CONFIG_PCIE_ROCKCHIP_DW_HOST=y
 CONFIG_PCIE_VISCONTI_HOST=y
 CONFIG_PCIE_LAYERSCAPE_GEN4=y
@@ -1215,6 +1217,7 @@ CONFIG_QCOM_BAM_DMA=y
 CONFIG_QCOM_GPI_DMA=m
 CONFIG_QCOM_HIDMA_MGMT=y
 CONFIG_QCOM_HIDMA=y
+CONFIG_DW_EDMA=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_RZ_DMAC=y
-- 
2.39.2


