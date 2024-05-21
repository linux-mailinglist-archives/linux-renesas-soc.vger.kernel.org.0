Return-Path: <linux-renesas-soc+bounces-5417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0358CA830
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 08:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35080B2234A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 06:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1703F3FB88;
	Tue, 21 May 2024 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eF4PdvMF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530C947A7C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 May 2024 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716274325; cv=none; b=QDyt07Pt0ZEWDoo+EexQfH9neOWkNdwMaEhP0PLDCEjaIS3iZf0UL0xTtlabJYL1apJM/WmIGA07mmc7OC2wX13GVct/Mczr258uUI0sArGwa5bdOOsc4PEbI6LSjVkbrbaeG/+ebStQ8DCmkUGBVbvBk7O8vT3kNw2H0ztUCEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716274325; c=relaxed/simple;
	bh=ajbQgfeGngTulmRfPp4VGkpKaPFPdvin23OHrpk5GJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjAa5f+fcsKM3lmw0JMaTeUIgbSk64Om60GbQIL38gf69RoXlm174TzlP2pOVw2l6tXhbxoJTFUidNvqz3f20CsglWnanz0ZQCs8szYnhYrk31jRhGY+C32vUHkBft/I2HDaLqyVrHG8ufpNXQ6fUJSayBSd2b2kNY9T5UFxyH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eF4PdvMF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Gnr2u+sPvK1TIr
	wqVbl9EwIUmIdDr/RDwWPjQrrMS74=; b=eF4PdvMFnmsUYBpFeRDUov4RxTR9Dh
	znceHtKRQHVE622Vt86+HDUbq39+IbHFINQlTogFFriENgUUnyJLQ9QxmFFy5RSv
	P89FII86vBdIt8ze4JZ0CgotVCKZOZNYf718nBrrhUEv9JkUrP22m1onj+5pVmDg
	XzElRlfPnlAwqMrDZvBdvHu+Q/13w/I99bGqkABgPzAF95FW8HS1m2jq61gPnpcN
	lQ48Alkzb6og5OCKTC6BME9AXUJINSbT0z30Gk9tgCjUqOPr8PUp0z8AaI0JwebK
	YfImQYWwcFuEtHe0K0X4Y+QstAas4jx50vgzzlSDI7OHwrtyeDCaYWAg==
Received: (qmail 267268 invoked from network); 21 May 2024 08:51:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2024 08:51:49 +0200
X-UD-Smtp-Session: l3s3148p1@86qCQPEYpqsgAwDPXw1+AKJ2KpfrUlGo
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe controller
Date: Tue, 21 May 2024 08:51:37 +0200
Message-ID: <20240521065136.7364-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable both modes, host and endpoint.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d35150a979d4..92771f62c812 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -233,6 +233,8 @@ CONFIG_PCIE_HISI_STB=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_PCIE_TEGRA194_HOST=m
 CONFIG_PCIE_QCOM=y
+CONFIG_PCIE_RCAR_GEN4_HOST=m
+CONFIG_PCIE_RCAR_GEN4_EP=m
 CONFIG_PCIE_ROCKCHIP_DW_HOST=y
 CONFIG_PCIE_VISCONTI_HOST=y
 CONFIG_PCIE_LAYERSCAPE_GEN4=y
-- 
2.43.0


