Return-Path: <linux-renesas-soc+bounces-24653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA3FC5CBA7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 12:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8F374E8FEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACD5315D41;
	Fri, 14 Nov 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCu24F9I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9C8313E04
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117534; cv=none; b=pSKhNzqx5AyQGKEgqPeK1MhoGe3BJJveGzt0gEetLmSv1Y35OCaGD/DPHTUnT4O+g4pa9R2GSz933Kjlzt126KvNW7bDVAc05PRIGzdLD+8YQxirJADrWP/ZG4Zca8fee/+kDKUme2SodPNXhtQwhhFZ08+W91B/OrdaKaP9lUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117534; c=relaxed/simple;
	bh=o2GT+tAT3KaMQHIum9qg97jjk1lJRZTQ0SAE08Yq7rY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMJkdmmaOM8LoEAptxxQ0EbPzs9PCc6gXmvXjZQGYV6WSzfYiQb9f3hzrhje1cT5ybDAAP2vBGnuzfHUC6zw4Qehf+lfDdItCrfN0l4UpPLNpQO7LhtwT+sZ1vPxEZYjlnuxaCb03bbhiRDTPpKHNei7IoQL8U5kV1Ek4+hLpZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCu24F9I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c82bf86bso1019658f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117530; x=1763722330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X/Pwrf9F+TtHyTukhSNpyyWy/Sr3pdNdxYJ7CPLkpc=;
        b=JCu24F9IaG+ySSAmvwNI3+T5NC69RFhN/zuWjIML9rOWtn5xXJ6ga0iI2pjdHWfgE3
         lSRuJnfPufv9PbCw3PpHRf6BFOGENhRwes4BuKamlEoVoncp5bqefiJPVFRaz7jTxuPh
         dBMggCH118Pd9lIVe5mW78w0W1cabwgBFjlEEzktFdBCl1MCAmFaSqYwuMYoT969imaX
         UKYcknTn9PgqQ2/63ctMZKnGhF81GsAZVOqxkTmUcSFlPxAmnAySdgWlCG/410CeCuZz
         TMbPR+HmCrTtZjbRGSbPzfWEtSTwDAE8BYpGhpgPR5VIh0D3VZaMaT497yD0XIVt9hG7
         4pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117530; x=1763722330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8X/Pwrf9F+TtHyTukhSNpyyWy/Sr3pdNdxYJ7CPLkpc=;
        b=kzrRIk7WFYjTpoyodWhjolnGGe5D40oxfXA6PtHPWIQo383yPdOtbi6GLogPykdN8k
         R1Nyl90T0SGgKH4wEJjt5ckzUnsy6AhFs9AsZRMhOQiaUN3zhQKU3EEQa0knbKi0cpwn
         L8bmg2K+T5pBDbGiP+f7uEUop61SompLtEsabOAaOiKmObjC3Csh7c1n45JzLaE8zamW
         Wd/Igz1wlQ3iDLf8iG5fxvhLhRQzT7s3YLnNHYD0ZXqOEtWjzBMfYwkQTqpaO72BNqfc
         H0450CUVU/BLAeEqt2ICuLKb5gSBVZOID8csktIw1J17mDydIv2fGtE5pDi9xohfSqO9
         pqLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9DmMsMjnmie4PpGOV7Ficb7gigGqQYn9DcY8pBkezknVFO0S/NizQpCf3xUCq7XSXEkFenfhzEJuyIbfOuYkw6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcbw1bbR6DcBBldAid9N9ISrSogdMj9040NtWvqcJ745XNTfb7
	6nnW8XpZBlOUsNtGsq+7cKA0jzAoZOAZYkrVzEMLZ3W1Ycixzdo5SXHF
X-Gm-Gg: ASbGncsNAY7HwTA7O+MibVKJvQTgpHhYy/tQhn4U4JJqC5sdnICVFyVoH3LvlHSSVaY
	P7j/nX/cikmSCwgjibhSGvHNO7BTkthITwu4KasqpXccHzQ6Ya3va9r2ux73d/hLjvfTbMZgw1g
	dmnCgrgeKyvg83IFB20DIN0J4/2Y8q/5NLU15HwjYMlDxOvu1BDdisdIZDxuILRIyE2oybCJBhs
	FkwScDMYNsJMHSgk5NRTCQb4EVRzutca6evRgIKCNlthENQhvXxxXB/ONIp2CicwVMc6SG11ZGO
	iXWDCRuwYi0TdUVQ7/YxVZk9Jr2ILoYApBijmPzlcFvxX26DS7LfN3OIXcUeo9VNd2KwPCBEPB1
	amjy34jjzv/R87hCqh21MYgRC9vkfIwh1BJ8S6mC2dnvq2wEVeOyDu/DjWvaWStT64a52lxRsWK
	Inpd+ZhBNh7zXkkQXpuj8fCSrfwYnm1KdQJjWMT37ZI4DN00F3oKwENJvIRFNmomzT3tzV5Tt5W
	Vx1wZPyaCM79jsT
X-Google-Smtp-Source: AGHT+IGHCuqgfNwauAekSJk609AbqQ1B+ZH/YoLkb3M4enU+0WN1Ju/YsW4fhWWiQ3c21vO8G1F2kg==
X-Received: by 2002:a05:6000:2008:b0:429:c450:8fad with SMTP id ffacd0b85a97d-42b59396f60mr2591122f8f.53.1763117530214;
        Fri, 14 Nov 2025 02:52:10 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:10 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 09/13] serial: sh-sci: Add support for RZ/G3E RSCI clks
Date: Fri, 14 Nov 2025 10:51:18 +0000
Message-ID: <20251114105201.107406-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E RSCI has 6 clocks (5 module clocks + 1 external clock). Add
support for the module clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/tty/serial/sh-sci-common.h |  3 +++
 drivers/tty/serial/sh-sci.c        | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 77f9a67d8efc..6c849757119b 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -17,6 +17,9 @@ enum SCI_CLKS {
 	SCI_SCK,		/* Optional External Clock */
 	SCI_BRG_INT,		/* Optional BRG Internal Clock Source */
 	SCI_SCIF_CLK,		/* Optional BRG External Clock Source */
+	SCI_FCK_DIV64,		/* Optional Functional Clock frequency-divided by 64 */
+	SCI_FCK_DIV16,		/* Optional Functional Clock frequency-divided by 16 */
+	SCI_FCK_DIV4,		/* Optional Functional Clock frequency-divided by 4 */
 	SCI_NUM_CLKS
 };
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 2da36e8ce555..3b03d3d3f2c7 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3172,6 +3172,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 		[SCI_SCK] = "sck",
 		[SCI_BRG_INT] = "brg_int",
 		[SCI_SCIF_CLK] = "scif_clk",
+		[SCI_FCK_DIV64] = "tclk_div64",
+		[SCI_FCK_DIV16] = "tclk_div16",
+		[SCI_FCK_DIV4] = "tclk_div4",
 	};
 	struct clk *clk;
 	unsigned int i;
@@ -3181,6 +3184,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 	} else if (sci_port->type == SCI_PORT_RSCI) {
 		clk_names[SCI_FCK] = "operation";
 		clk_names[SCI_BRG_INT] = "bus";
+	} else if (sci_port->type == RSCI_PORT_SCI || sci_port->type == RSCI_PORT_SCIF) {
+		clk_names[SCI_FCK] = "tclk";
+		clk_names[SCI_BRG_INT] = "bus";
 	}
 
 	for (i = 0; i < SCI_NUM_CLKS; i++) {
@@ -3194,6 +3200,12 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 		    (i == SCI_FCK || i == SCI_BRG_INT))
 			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
 
+		if (!clk && (sci_port->type == RSCI_PORT_SCI ||
+			     sci_port->type == RSCI_PORT_SCIF) &&
+		    (i == SCI_FCK || i == SCI_BRG_INT || i == SCI_FCK_DIV64 ||
+		     i == SCI_FCK_DIV16 || i == SCI_FCK_DIV4))
+			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
+
 		if (!clk && i == SCI_FCK) {
 			/*
 			 * Not all SH platforms declare a clock lookup entry
-- 
2.43.0


