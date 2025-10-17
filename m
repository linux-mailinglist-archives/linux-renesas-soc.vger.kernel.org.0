Return-Path: <linux-renesas-soc+bounces-23234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B1BE8718
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F8E7421D52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE40E332EA1;
	Fri, 17 Oct 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aKPb+ZpV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC0332EA8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760701366; cv=none; b=XRpuErK/VeyHMBB0kA+KWmT2lSAxbkdBMEEbcWAuzzeaNHkzaiAfRKtNt6Jr8jDDN0MgzoSMuiEravsPyXhVMnZJzgdeXhppfyxlF56CJWx/1+VzYSALGpLy4a5OIXNEe7H66aNcmZNJL0p4CWwf432FzoIdWxDKmvYvl6aFEjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760701366; c=relaxed/simple;
	bh=t6i1B2krwl1c9mzIngvGk2XlK6LF/1iB+CVQxfWJasE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rnajGRg0y4HEslSLt0Tiq1Zs3lIpaS5K3J+xAf66j5L8u5luCElW3fgD/7OiKV4ZMUtc/JZIJu/ry7MiNyl/FMJkwCKx/pd2g282vOYkA8rXBc7f4FcVL1709Dz5mN9ks8Bx67rPg33RLd/x5oIcMMvr7Uz28oFcOdm58nbbvvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aKPb+ZpV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=zWQPorf99Hlq9Z
	Z1yOv2MxprEKjeiEs9Q60oJtHn5A8=; b=aKPb+ZpVeVLttqgGuW3YjswVpfoCtI
	xAExIXtnJysYf6HY+nIqKc7+SqyZHPJH0cfmRMieLaH1m+cUVSbF1JRjw4/u/Pz8
	gGTig09Q/S2WbxGlJS6ll+8BWbu7xptqFMgR5nsadEUFEByCTos9yiAJcYK2rv2J
	7eX9JqRQ/kLLkP/k3d5R6FV1G0jnwWLBPy/O1cBlqB9v0F308YMUy87Uw+QjspXC
	PnKSFo4lKVYKqCGFsNx0r4sgpAJR1O6ar9MGsE8Jrt3t2M3dxTo0uWx2wyxG/YUp
	xlJ6+XZL9mmURZCJsC0RCsi/IV8n7208NqaAgqz17ef4PSKW5/gpIa6A==
Received: (qmail 15432 invoked from network); 17 Oct 2025 13:42:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 13:42:42 +0200
X-UD-Smtp-Session: l3s3148p1@ulE5O1lBerogAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH] soc: renesas: rcar-rst: keep RESBAR2S in default state
Date: Fri, 17 Oct 2025 13:42:34 +0200
Message-ID: <20251017114234.2968-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike Gen2, Gen4 has bit 15 of WDTRSTCR register also used. Keep it in
the default state for the V3U firmware workaround.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/soc/renesas/rcar-rst.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 7ba02f3a4a4f..0541990901fc 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,6 +12,7 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
+#define GEN4_WDTRSTCR_RESET	0xA55A8002
 #define GEN4_WDTRSTCR		0x0010
 
 #define CR7BAR			0x0070
@@ -30,7 +31,7 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
 
 static int rcar_rst_v3u_enable_wdt_reset(void __iomem *base)
 {
-	iowrite32(WDTRSTCR_RESET, base + GEN4_WDTRSTCR);
+	iowrite32(GEN4_WDTRSTCR_RESET, base + GEN4_WDTRSTCR);
 	return 0;
 }
 
-- 
2.47.2


