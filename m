Return-Path: <linux-renesas-soc+bounces-25679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 361E4CAFF8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Dec 2025 13:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1357D30826AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Dec 2025 12:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8DC328635;
	Tue,  9 Dec 2025 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iO/oDqYq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD1224B0D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Dec 2025 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765284690; cv=none; b=E6TnmwmArerhvdqdwik+lQ06enExEK13PlPX4UlxR7ZkyyIa2BqXOmOwOnLjRcKvlIzLGT+mV67JDeDIGPwyeyFVb341p/Mb6ILUztpR88fjtZclB3AUMHsNWjzbYzW9sX5WBWggWnP8OCscuFK/MkWaEX698gytEwwCEAyYwRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765284690; c=relaxed/simple;
	bh=rsEY48Dl/2+LgFdb6mNeb12u/2T0T6uiLHgrX5UTqI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOexcGJNvOUOpZZAw8XDubveBlGcxEhT4h2StK13w+wMakhxPEIfVCvFP5BZf0BH/GwUl/Mn96H/E26MFdW/FxRMil7oMsGHUhwaNnkzak21GIb5jME75NixFqBO+QRwpRPG3FkfaHvnraFA0vrhhgblIb+ZoWLQYuUUqI53TTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iO/oDqYq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42f9ece6387so309469f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Dec 2025 04:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765284686; x=1765889486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afXJUoTdYBs1G9U5HKpUIzH+QZ9Duh8PFbcc6QIvflU=;
        b=iO/oDqYqhhAG9IXf99wgmpBmjhxB5Y2/hZo43+LLXUCHdxA7VnSPMJlSk+Si6ey3ui
         IY9OULVtQxazpKQod7prUMhABEAb46zCNdTEZOfP/V6nnxaIoK3Nx2JO2uRm7sya5Xjf
         h4x7fjBq+BOkq8ZXgseJaOf86XbUaFGaoIoF7djj4Gx0uglYjiWnqTUgEswL2yDUMBi2
         kdp/6H79NBir2b+e852KzJAKpLoYxMHiCY3HKEvhMYzbL8PGpMhdOHgopylIf0LHSdyK
         DfhsrVlamJ5IciRrxuVr68FmEHAUjllCTbAKM9qwWaTw7HPTQrq6WFwQ8i6Bq/spwVwr
         JDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765284686; x=1765889486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afXJUoTdYBs1G9U5HKpUIzH+QZ9Duh8PFbcc6QIvflU=;
        b=m4QQ6eKY+zGsAzziJnKGAt6QDA8DNFsRVjPt1DQksFxTz+1oBp3oUULSPFi5AZccUG
         1fU7RKTrD95wrvXBA8bhpX8QrjDiTV1GyfbuntcW7Y1oKgQDzGIyD5OBsifSSuq8Modc
         mB3fznAAq/zr8KQOrv4bqsNl2drWeiX5h+4E8hAKZWdWPeTdWfKC846u5Cok+lwB9y6b
         ghC71f8L+YR3+qh/B21wm5BTP2D0t/j+1ZjDL2NvkeTI6Nk9Hr37ot7f8XYDZH3Vymfu
         2kHk/8hog86Q5CGjhGxIlRa4SVXTs3jusM4kAWRVGQKofSkQxdUJfNJIdxapWpsjPPCy
         SOqw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0wum+t6K89/K8T1alxC8gsdEAemY0YaW9bXWfiPRtYtEiR8ueIHeGfVEil3qgQeeLzbmUW0HLa+yw4EujviXsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfFyWU4O7fmxG1asaotyKMzWklHitpEWLZus2HJlo0Ti6qxpn
	j1EJzSCua+dlG/ReiMsiJgtVcdtV0umCuXi3itNKSMeEtgPtu9xi3Zjv/68Hlt+MetU=
X-Gm-Gg: AY/fxX5/A8Rc7Y+4EGqHhdVO/p3RIOFrbbgzl9t9UR7W/5eRM+CfGgbTKnmrMdzt770
	xMV4K2ImiL7ccMdH8e7Gl+NNT0JyKOw0lgIPtSDXO7SR08q0g39Jeyz25FkeJf8VX2hjAFzSBp5
	/kpUdtpgbmAZ6dZwIazikryskg4mMVKzwqdc3Mc5YXE65PXT6uVIOnIKkxLiAOO/BW+5Hexe2ud
	VBG8aedsA4Dv5anWr4nTxFAaWyzUsqYgbu5OCW8opp10AZMLgRMr465yMhulaPMLObuDgUlCHcW
	oUCaRrIgapOyJVIyqVvUDIX6MOG02I7NqFjeD7Ncn6i8NGRTlou2L6qpTBZXlVsN1TtStZJWoKp
	k64i53MKLLn72aZecw4WbiIvlvxi3/+GK7oBuvPWB6x8M7+LnQ94X88wULXzB321DCPp4noQOni
	r3mymOKJU9guM1FrbidGhjORs0FQbdLT+Z5B5ip2Mv
X-Google-Smtp-Source: AGHT+IEWm1fY2QNsyJPNRyYQ1RZn1PbKph777Yy+bUxaq8uTmjsapUHrutErncCjUEmcZYh3TuKrvA==
X-Received: by 2002:a5d:5f88:0:b0:426:eef2:fa86 with SMTP id ffacd0b85a97d-42f89f0b1f2mr12787199f8f.11.1765284686271;
        Tue, 09 Dec 2025 04:51:26 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f75sm31678042f8f.42.2025.12.09.04.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 04:51:25 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] PCI: rzg3s-host: Fix compilation warning
Date: Tue,  9 Dec 2025 14:51:22 +0200
Message-ID: <20251209125122.304129-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fix "bitmap is used uninitialized" compilation warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202512070218.XVMUQCl7-lkp@intel.com
Closes: https://lore.kernel.org/all/202512061812.Xbqmd2Gn-lkp@intel.com
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 667e6d629474..83ec66a70823 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -479,7 +479,7 @@ static void rzg3s_pcie_intx_irq_handler(struct irq_desc *desc)
 static irqreturn_t rzg3s_pcie_msi_irq(int irq, void *data)
 {
 	u8 regs = RZG3S_PCI_MSI_INT_NR / RZG3S_PCI_MSI_INT_PER_REG;
-	DECLARE_BITMAP(bitmap, RZG3S_PCI_MSI_INT_NR);
+	DECLARE_BITMAP(bitmap, RZG3S_PCI_MSI_INT_NR) = {0};
 	struct rzg3s_pcie_host *host = data;
 	struct rzg3s_pcie_msi *msi = &host->msi;
 	unsigned long bit;
-- 
2.43.0


