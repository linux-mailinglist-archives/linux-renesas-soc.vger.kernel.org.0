Return-Path: <linux-renesas-soc+bounces-2724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7E853E02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 23:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3AA1C21C63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 22:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C14627F5;
	Tue, 13 Feb 2024 22:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YX/tgL5l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A38627E4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 22:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861783; cv=none; b=iL+SvKle8MwI5o25mQUUhLVxXDk+iE3JVtHqbwoSYBRhNtgDZ6dRIgfyGi/SisSNqv7hy8vBk/NsxRpfuz3O7NstWZvM+i+fZ9GEN7X56Ov1SfChF0olSV31qak+iT/vjqhErq1u/sefiRtwvGDsc3eDVBcttldd1i/eStpx7DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861783; c=relaxed/simple;
	bh=hpce4kBYHxjPck6QzyV4av0S8wG/q4mb39UZeFb/XX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InhzZf3t44BmUyefiGV/lElVE/J+ZbC3mL7wNy0E7aXyH3hKHQa2w54FW6BU8TDJdbA4pciYL6yC7xgLrygLbKK/3T24olaV5SupoP3ioXaYF19NFhXgiVrgNs+ykiwWC+E0fXYMHkxjfNoeiG6zbUE5IIbOXCaCP3bNnHv8UAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YX/tgL5l; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=vQkmh2vsmn/J5N6MTBGNu3z1ML3BmhRPZQnF3hlOJK8=; b=YX/tgL
	5lBgJPY5mdMuLXoO63/NGZ37Juv2wLBIefaQQn5QDEBirDYbGJK9CxEz6Xqb+U44
	BWtLABjp32jfNL0F5X/5+G6QjvsV06Eb2gN2vJeethhw85FxHu9+x0Zt+lUt+hvq
	uz73krUF/tM2Y14jT2BC85Euf1H+XQlbXubcIz3vJQkB5dSrFlZe8/P0ly7nyJa/
	0nz6akXlyWmr23xeqGjUMa4pR1A1B1HKzZDtDdkM6HRmhd6woNGm7+Rn/nBFARH1
	tL949dnqGXF1xrx7LjZ9dai8GrL0F/s/UmHthpxcGAC7RvJKYDjuVm2PxOPPL4MG
	vBcrrtr6u6eNesTg==
Received: (qmail 1211785 invoked from network); 13 Feb 2024 23:02:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2024 23:02:52 +0100
X-UD-Smtp-Session: l3s3148p1@g45CjkoRyt8ujnsZ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] mfd: tmio: Remove obsolete io accessors
Date: Tue, 13 Feb 2024 23:02:21 +0100
Message-ID: <20240213220221.2380-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 568494db6809 ("mtd: remove tmio_nand driver") and commit
aceae7848624 ("fbdev: remove tmiofb driver"), these accessors have no
users anymore. Remove them.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 include/linux/mfd/tmio.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index bc53323293a3..4223315d2b2a 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -10,31 +10,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#define tmio_ioread8(addr) readb(addr)
-#define tmio_ioread16(addr) readw(addr)
-#define tmio_ioread16_rep(r, b, l) readsw(r, b, l)
-#define tmio_ioread32(addr) \
-	(((u32)readw((addr))) | (((u32)readw((addr) + 2)) << 16))
-
-#define tmio_iowrite8(val, addr) writeb((val), (addr))
-#define tmio_iowrite16(val, addr) writew((val), (addr))
-#define tmio_iowrite16_rep(r, b, l) writesw(r, b, l)
-#define tmio_iowrite32(val, addr) \
-	do { \
-		writew((val),       (addr)); \
-		writew((val) >> 16, (addr) + 2); \
-	} while (0)
-
-#define sd_config_write8(base, shift, reg, val) \
-	tmio_iowrite8((val), (base) + ((reg) << (shift)))
-#define sd_config_write16(base, shift, reg, val) \
-	tmio_iowrite16((val), (base) + ((reg) << (shift)))
-#define sd_config_write32(base, shift, reg, val) \
-	do { \
-		tmio_iowrite16((val), (base) + ((reg) << (shift)));   \
-		tmio_iowrite16((val) >> 16, (base) + ((reg + 2) << (shift))); \
-	} while (0)
-
 /* tmio MMC platform flags */
 /*
  * Some controllers can support a 2-byte block size when the bus width
-- 
2.43.0


