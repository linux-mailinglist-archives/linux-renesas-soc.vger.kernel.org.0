Return-Path: <linux-renesas-soc+bounces-20075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91524B1D1A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 06:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D7701AA1146
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 04:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C2C1D5CE0;
	Thu,  7 Aug 2025 04:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XuYMH1/L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21015624D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 04:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754541314; cv=none; b=oCPsPLzS9w0aclH21Sj+59wvzozUmQbqvzZbD+3zvb8+BC7n/bXMV5H9FLetdhOCY2k48UskmL6r//WBwpk+6OYFH52Fbn0YvH4HJ5wcc8cBHZqGKNju4qW3OD2cMdbbzHzv3cuN3AaAJ6DXFcnQi9/B/kxumMeGqu13UQVxk5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754541314; c=relaxed/simple;
	bh=ofLdd4A07ASt1b7FuyxwhwZp3KQ/vxDlYI+djJ25nt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btJfNvXXcfCUd+oB63ziYLNAKCECwZ4tTCiLp05NCAFGCPzwuMrGgsPYUeaInpQFrn01IgNPdzx1KLaLDTp9pocNcnRSnpLVBPEVgMBRixCSWN/Hajb0kRBBxtenr0QRDNqmMfTUO/5XpEyR/QaPLtHoRyypEHfib0lY+SyyEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XuYMH1/L; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=0yf9/75yWMvaF+
	FT4siLA18REESy0OotmaTC98XCF2M=; b=XuYMH1/L1ctO1lRYQE7KsHhBBHv24E
	wqZ/WksfNboaqqM8FofSbNSFp4ijoUfiDQLdpIGFIf6lnbrK/bwRT9GoHms4M1e8
	DrzCDIm9nwFMOByxjJKqJ4nTkulORllCr/T59SvFegJv57JiYZ28Ws/lhPPiUzC/
	LAkTA5HYl13ySRf7OlxibcEf9T6lYMMAhJgp6OdBJlIYSU/F2RmwVi1H05PyV2ka
	uWe+JDbtbRbHrUQQKPbPB3uQ0Wa0s+Ird86RakBlNtoDIW6W2pgxg0qR3OKw1lma
	R1aT0bEF6ghp/XcDefidtURYq8bLjRNgxpJNUi72OrRtsWUJzglMdykA==
Received: (qmail 1017297 invoked from network); 7 Aug 2025 06:35:07 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 06:35:07 +0200
X-UD-Smtp-Session: l3s3148p1@YGdW+747RKQujnuY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	kernel test robot <lkp@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: remove 'const' from FIFO helpers
Date: Thu,  7 Aug 2025 06:31:24 +0200
Message-ID: <20250807043456.1624-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As buildbot reports, some architectures do not want const pointers.

Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508070438.TZZA3f2S-lkp@intel.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I still wonder why SPARC discards the const but since nobody seems to be
commenting on that, I guess the fastest way to get the build error out
of Linus' tree is to adapt the usage in I3C.

 drivers/i3c/internals.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 0d857cc68cc5..2b0b9c3a9131 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -30,8 +30,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
  * @buf: Pointer to the data bytes to write
  * @nbytes: Number of bytes to write
  */
-static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
-				   int nbytes)
+static inline void i3c_writel_fifo(void __iomem *addr, void *buf, int nbytes)
 {
 	writesl(addr, buf, nbytes / 4);
 	if (nbytes & 3) {
@@ -48,8 +47,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
  * @buf: Pointer to the buffer to store read bytes
  * @nbytes: Number of bytes to read
  */
-static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
-				  int nbytes)
+static inline void i3c_readl_fifo(void __iomem *addr, void *buf, int nbytes)
 {
 	readsl(addr, buf, nbytes / 4);
 	if (nbytes & 3) {
-- 
2.47.2


