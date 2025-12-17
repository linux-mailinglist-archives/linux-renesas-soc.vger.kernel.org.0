Return-Path: <linux-renesas-soc+bounces-25839-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D8CC746B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 12:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4426F301B399
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Dec 2025 11:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE89346A0C;
	Wed, 17 Dec 2025 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="n3JLNqqS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4E033F8A0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765970120; cv=none; b=nZqc6FMMgKKPTZBUss5AqgEzbSy5Oh9aW0Aim4+Y2GRWfjyloj5umbfo6rw1iiiQyXNa1EgjUENwt3Fbv9nm/gjI6N7d8eHCPARQ8P6MqTLF0osjiIwMcGI9a6HUhEpipb/uc47pjDBrbSX9BrrrpVyPSnWS99pLK9OXhjENwnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765970120; c=relaxed/simple;
	bh=5Y4gPMP27s7n7uex8rzUJRSTf0es0tnb6FP6Q/Ep6Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwfI3JMnDczps3EF6SNti6Hj0CjidnU45Fw3+IRTi7matEqbpm2Hkrru7ZXMMpRZBGQOJSjs5d0MdHbLH4H/gp6fd+/1Uw4GAPx2Ti1OXcH+iMEOJvia3QzIMz5BPtw7DG2CxOWBhjDTZPwzzyIgz2Emf4eGntyHCJJsjGuTQvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=n3JLNqqS; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so991430466b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Dec 2025 03:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765970116; x=1766574916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00dbsnXRQYzCZ5pFyuIk2+EAhQKdp0t5ldMAnwaQRhc=;
        b=n3JLNqqSJ5puozmVrWhnOC/Z5rNt3FsMREzb/Y9ZGFy60YQpsTO+nybUy9lVinyKtp
         6FbaoVctiff3+n15bvQek9yResIohz5bwVW3mJk7DzH6qiQFuNx5VAJpAeuMi4iINiPa
         EaJBz2I788OdlJfsyrJazWVxXSIDhwQmv+G0+BXmQbDWDY3rjiE/tPM3/AGYhJFLGtZ0
         UU+B3kq6X6eMNvY3UWcSIhN+XQo/RdEjgn4RpdR7Ki1X8afLo3qIe0STognWP2b/eE54
         P0NtyGB654uzL38WnscllzERaqqENT8EVflJO5uhT+1szWaCYnuE3w0U5gMSHLhaxqMx
         5F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765970116; x=1766574916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=00dbsnXRQYzCZ5pFyuIk2+EAhQKdp0t5ldMAnwaQRhc=;
        b=kc6CnWW/vX60NqrVoJAx5cVH5QY0ZqmAeHPTw4y6OuhK9RoikizMe1c/SctjDt3Ado
         /fOmMGCkWx8QprKuaHh+i7Bt0+n2mY0cWNolTDN25moBTPdQK9xfXWt9nRQdsnj7aE5q
         +Y9rSjSpEoiEtRz+6ENvJ0NzC1X7B7kRuJ9sop3aLVRiznjCMtjw4OL6tTCmm0mU7YVD
         8Pz+Rr7QX67sttvVqSeAtTVnv2i6xjxx9u2gOF7S2vwI1NQLHwTbGmey5wDea54tl4v+
         JcXb/SztL60+oAIHq6jjfjYbaC9chOxozfmACUCw4b4OMQ50AOvuB/QRirkW9ZgeEwRe
         ya9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnb8MWP1MAQ8+rNiugdh9o9fCvjSklA15/iMzzPq4+lefSmOJWbz9V7OqrLOSwIGFDWcsAVfhbOCnpZdGTi/AeZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPv/Kbue2Jcfb1F7u5/RlYDn2ZhS3+tqhcFN1Ey9qw4/1jAUg
	l6LUHTQ5mtIp8xixoftw3VFD1fUQgNNqsqxzquxDhmYJRW2XTMLEOn4f/B4FxaN1TWo=
X-Gm-Gg: AY/fxX5zy7QS132iYqUfneEDvds6BQGvdQCBC6AJCk4/ffof9KWiE8XRTqwQWMjcHQD
	jkb9RkZy/jXTvsh8qAP5l9DhQYBYhwIEWPSlWQ2/om4YsJm0h2RqoEzK6ceGog2esac9F4yzMRG
	5bPaoyJAOHSwSxgkVuDUu199juV3uBLf1Xb/6pEQ7XVzYuAB2pPApsg4ndY+KMrYKzkf6nvHYDO
	jFvZHvFHwxH8m6uv321e6drNhswFHVfTZxf+W0ZoxnTexhuoPqgV3U1M8Ch0SeOgVAHy2eDqDf3
	Z9AX7zNcpN5TFQNNNheg9gvVXFgk1o57A6H4L5AZexF+GPkRCD9Mq8C+5njCw0vmBpWABOwnHE3
	mER8gr5ZbKjpTZSevqU4P6tX/MQ25WFYwBd9cGVmY+z81lUo4L8m9PD5QxNcyQsMWH8CKusfbjd
	xhq23HTW2Pn8UkliVZW6kUL5RXJn7+dvBGay6vMs95
X-Google-Smtp-Source: AGHT+IHwzhERrnuAvF/Lpiw/TJhnaVT5ourcEf1VWmOhh5lv6gcjnMP/YqOoOAUxckSeF3VPI0b24w==
X-Received: by 2002:a17:907:94c6:b0:b76:5143:edea with SMTP id a640c23a62f3a-b7d238baa48mr1792946466b.30.1765970116315;
        Wed, 17 Dec 2025 03:15:16 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e817csm1933465066b.19.2025.12.17.03.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 03:15:15 -0800 (PST)
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
Subject: [PATCH v2 2/2] PCI: rzg3s-host: Drop the lock on RZG3S_PCI_MSIRS and RZG3S_PCI_PINTRCVIS
Date: Wed, 17 Dec 2025 13:15:10 +0200
Message-ID: <20251217111510.138848-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

 drivers/pci/controller/pcie-rzg3s-host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index ae6d9c7dc2c1..5aa58638903f 100644
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


