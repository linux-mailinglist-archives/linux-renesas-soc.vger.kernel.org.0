Return-Path: <linux-renesas-soc+bounces-25602-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BE7CA75D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 12:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9DCA30DE344
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466E232571C;
	Fri,  5 Dec 2025 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iSk9jrzZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94AE2D9796
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933899; cv=none; b=d6HJcf2C3S4HD7KZGd0iq5h1pgUSFtC82G5vMvRCosxl9bQeG83cfJkVcpXOv5MQccLLjfWQeqkpBXeW3OO6Io5bMDDc/AxMijFDxPmu66Q5QzA93Dx+9XpDzdepePfuvzYpfwURmB1TVxXqXtY8m73Lg/GqHM2cgLe93DQPe9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933899; c=relaxed/simple;
	bh=yXDHBdRoGAl/Lik64O/+XKd3nzF1HfA3V+zbN3Pg1M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IljY8J3lxSQVFslcGEocoVtk5QGZqdCKwHA4wGb2QMf1IIWusFa3Uw8stFAFNIyMqUhrrm+sYN0YIY8GlKB5IiC7ZgY+KsGFjSp3mG9ojRbD3JiPAm9tZrAET6UExsGcXvVOrDxzML2xb9Z71goc72TzPDW9DKPEcFxx+5TTrXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iSk9jrzZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so23579855e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 03:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764933893; x=1765538693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRqsUnacrK/b4CLNtcV+2F3iQRZrhWyy78U5Brb/9/E=;
        b=iSk9jrzZh+pq+LkKpyYVmVtQGZU6Ub1HZAI3EWVn4Q3GahpkWMUuo2xZKFLIJCcAZ7
         urSiEmRqHTqqnVk1G23PSaejIcVX0t75eoivmy1QC1Wh4H68iWQ41lhDwsA7OvRXeNYJ
         X1CkeEtEfcDnidowGuPVT5foESTxS4HUMg+BMjQOz52HFSotpn/i+Rkpkmx98MuTjyul
         Jd4FU0i55LipibCpEg2prDXSwcCwHfPZp0GKs6sn04mFmeTa0qLKDb5GcVX50e3E3M17
         M10+zQ1Rz9kE3DUL4JFQ6L6Cp7xlyY/HFUmIkKaW62jpP3ekJ/nSCBRpU3hZ/Re4nTt7
         mN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933893; x=1765538693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aRqsUnacrK/b4CLNtcV+2F3iQRZrhWyy78U5Brb/9/E=;
        b=K6ov5cBsANI212wHQPTecBHkTdc0S18MPqdIkvrCcYB8uHxd9asSM/dsC61VwYHhwf
         lZ9o6xPnSsEYZkxBE5RIyltnBDH71NGySiMCu2yaWFX4vYOt7HKXVAZQDxCSO5ivJZkK
         xX8biWwcxQE3rE/06LVEyfaVsOpoo1ti8W8vDiy7Fd45tcrche/V+/Fj3tAk782nFRt4
         r0C1voted3gv8vfNL/N9nca3yXESshvkkjGwtQvgaJGw+LwrA6TWwUKdY2OCCyxSztK+
         l63cC4E/9J3IUIzS/hdGbmEA9xIo6R47p94zHWGlBuC/4efAfoclIoPLqp8IiQmCDX1r
         q4tg==
X-Forwarded-Encrypted: i=1; AJvYcCUzQD6flhFUQuIRpLjnzu5CItAT4JZmL0yMPGM6sSnzHLBSDnmZPPssYivQACkuLsmSqzJ3/jfPeicCLMYJhTkMCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsZ8s+S7lgovQ0YxJe0kFYWHABDsBrkjWN4eEAGi24rqIoeF6
	4LKkup+C0U/lIvICCEPEJ9CjDOV+hHqJixmJsooqNDvvr+TgRCOqPNllUBCXenTLb0Y=
X-Gm-Gg: ASbGncsa861gQFYBdTu429oXUdDZ9EJab8aUdULnSBNbQAB9740l4n3fz+upUbDBFle
	lMXNJk0Ses0vgQXdCslBCWeW4Jomm74hkxLVdTcUI0br7qQs3YpefheybP04Dic3ameiw9GT+hG
	TWGaS7LyTlL7JXc1BI8zSyjn7sHxhYP9WTSOJXvqVyu6PaWbE198/UGxG5K8N6ens23XuDMSEFE
	V12ZXTC5eSm75WgwbcOh1IdYaHso5CxYd4XlZpwb/jwbUb9+qEJaeIDtspL8ljwSR//ER+XYc76
	yQ8AypwVLc2JUApXTTzObdGMjJBL9xhVNGzzxL6Lu8ZVPYQ3tDajplGtPiibOtNxRb0/2j9PRCP
	Mg82wHuQ2YDJAFbYjdqA4zQKhPR1PjG6I4hiGHnT4YDfQq+XKYfghJ3t/jc9MdDWPSocfgITLSA
	nYDGVj13rSiRdC5EjIs2spsuPQ0YkJ20TxhaoDq9zW
X-Google-Smtp-Source: AGHT+IGNPaOKQjtNRIfHe4xo0LVR3XMZOvMh77LGhEZJMBYv1zVxkBTDPCRNimBT4GTuJOHZUss4tA==
X-Received: by 2002:a05:600c:4e89:b0:477:b642:9dbf with SMTP id 5b1f17b1804b1-4792af48329mr99647305e9.32.1764933893004;
        Fri, 05 Dec 2025 03:24:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm78176435e9.2.2025.12.05.03.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:24:52 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] PCI: rzg3s-host: Drop the lock on RZG3S_PCI_MSIRS and RZG3S_PCI_PINTRCVIS
Date: Fri,  5 Dec 2025 13:24:43 +0200
Message-ID: <20251205112443.1408518-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205112443.1408518-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251205112443.1408518-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZG3S_PCI_MSIRS and RZG3S_PCI_PINTRCVIS registers are of the R/W1C
type. According to the RZ/G3S HW Manual, Rev. 1.10, chapter 34.2.1
Register Type, R/W1C register bits are cleared to 0b by writing 1b, while
writing 0b has no effect. Therefore, there is no need to take a lock
around writes to these registers.

Drop the locking.

Along with this, add a note about the R/W1C register type to the register
offset definitions.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 547cbe676a25..d08a63d89452 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -73,6 +73,7 @@
 #define RZG3S_PCI_PINTRCVIE_INTX(i)		BIT(i)
 #define RZG3S_PCI_PINTRCVIE_MSI			BIT(4)
 
+/* Register is R/W1C, it doesn't require locking. */
 #define RZG3S_PCI_PINTRCVIS			0x114
 #define RZG3S_PCI_PINTRCVIS_INTX(i)		BIT(i)
 #define RZG3S_PCI_PINTRCVIS_MSI			BIT(4)
@@ -114,6 +115,8 @@
 #define RZG3S_PCI_MSIRE_ENA			BIT(0)
 
 #define RZG3S_PCI_MSIRM(id)			(0x608 + (id) * 0x10)
+
+/* Register is R/W1C, it doesn't require locking. */
 #define RZG3S_PCI_MSIRS(id)			(0x60c + (id) * 0x10)
 
 #define RZG3S_PCI_AWBASEL(id)			(0x1000 + (id) * 0x20)
@@ -507,8 +510,6 @@ static void rzg3s_pcie_msi_irq_ack(struct irq_data *d)
 	u8 reg_bit = d->hwirq % RZG3S_PCI_MSI_INT_PER_REG;
 	u8 reg_id = d->hwirq / RZG3S_PCI_MSI_INT_PER_REG;
 
-	guard(raw_spinlock_irqsave)(&host->hw_lock);
-
 	writel_relaxed(BIT(reg_bit), host->axi + RZG3S_PCI_MSIRS(reg_id));
 }
 
@@ -840,8 +841,6 @@ static void rzg3s_pcie_intx_irq_ack(struct irq_data *d)
 {
 	struct rzg3s_pcie_host *host = irq_data_get_irq_chip_data(d);
 
-	guard(raw_spinlock_irqsave)(&host->hw_lock);
-
 	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_PINTRCVIS,
 			       RZG3S_PCI_PINTRCVIS_INTX(d->hwirq),
 			       RZG3S_PCI_PINTRCVIS_INTX(d->hwirq));
-- 
2.43.0


