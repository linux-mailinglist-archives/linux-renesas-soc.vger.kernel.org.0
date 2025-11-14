Return-Path: <linux-renesas-soc+bounces-24651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C420FC5CB43
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B3851347811
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F251314D03;
	Fri, 14 Nov 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flcbMXG0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289E3313527
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117533; cv=none; b=QukMHdi0sIufsBUxTs+KR3K0M1wiA52b7t/dKaxuqMwzR8a0WL/BDIxiT3zVPwk4uTwy/CTOXFGzSXSOcx2m465t6PGvJOvdDesUpDR871xUgQ+4osL3Ai/yKm0qIyulbklgg/axOqBMv2Ss5MWiPQK1ZLiTYiR+bTnAipnSmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117533; c=relaxed/simple;
	bh=JDFyzj52p8gGmebREXJka9Y1zAT1VPXuoiczO+R68IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjxZuVPRq/DwPfWZfxykQuZrCiWKs2DGLx+c9FIR9eNl2W5/OSi6NVLN8kVjXVovvig2g+l4RDonSSzROtIlxcWITaMXtwDW58SsdgY6c/fWR+WPDSA9ee8vlPZgu3xqezK5bbupt2kOVzevXu5BIYhtyfnQb/VxN+7Gjg8XsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flcbMXG0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47755de027eso13659575e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117529; x=1763722329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HE59SkHgerKKlNxfiNiqvQ/Oh6UzVvTwbF5Npt8Lw8=;
        b=flcbMXG0dgUfRQh4uTqiedUC9qqMyV2SNXtT3nn9FGstsmK0cG+76Rk5CGL5AaJwo9
         DESifjG7eMimbrxOoj/u6mqSt6XBKQR6EfLbhUhyGCvW9bfTG50Cim+GmPio7UcMYyHG
         gaZ4N+GHJbxznnG80/mwH0xf2ib+2u/7Nwbh/vGRvkDi/960gIDtpaUPL8BxTpfkV6/S
         Lgm/MxZHa7Yv1X3oqBP6vIVrtg6UN5s3sLAN92fnvFvoeikIAV+EKu3XpnPTBE2A0ZS3
         tEpm+cUxv0wDB255gkfFhPWGdwTAXdmDg912Qe+k7xF1RO9xgIFieFUpVNHF06q7u3mD
         VIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117529; x=1763722329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HE59SkHgerKKlNxfiNiqvQ/Oh6UzVvTwbF5Npt8Lw8=;
        b=f8i0p8RvYgQnhzNV6nN/axgaw5VaRbMKre1YJV7w5JcFbM+15Tfrt9lfGTSulVwGI2
         sqb4wr0DTSa5SMx6iwkfhQPXwdk3pIeib8g47XDjfGPWwIor6NMbb7zgN64+ytoPDdS6
         dTePDbO/90pf5hl6vXvEcGZAEr3FDxf1WYs4JRyTZn8sAHZD+MLPbqvQRCVFpb/Pes5B
         f8AzaKV3f8EWvChRN6YCSUfv1TxXvxppul5e9TyS3GLyNbchKq8uPON8QRcmYAKDE+9V
         0aRNBij8yDkCZ/eTtTNbflRJNKrVqrz7FhxpEXK/iMBhxPOWPgATugOKqlWxZYekWyU6
         Fc+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl25knABR8CF0DyMdhFCEvtPyrMYl2hVfs3Q37siyEs376WfvIbEDMxKLF7BRnniR1/pKe4xHdeRakQcUapbTIFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxV9NeeeYCSLQFdfHa3hdnLNoPKLgMe1MUfj+VO+xfBxdGHSxs
	FomJjsMNrPKDE3UP7KnTycwDnh/+uA/1YAdTGTb6tgkIG8bt78ivZuse
X-Gm-Gg: ASbGncu03HpnGg+Ab9F78X5lh25bT8SkdNBDuZq3dBjMoW+nTAjM8y0d53IA60xG4fB
	YkJwJk9IhACEjeKnmYCBGxqebs733sQMIS3UGhOYqB03VidB4qjUJiO8C0BQUuhOoBM7SkjC+Sx
	XdFWSj8bRrkanE1Jh+FDyVxa/iQocDEbm/OQp/fKo+2FDZPCL683AvM/eHUXc0upYBbabKyPRlw
	XEvsbfM6OXivH6rah0hli9mIjHarjxIaBqDrhzIEwBeo0dFSOGLxiqHq7daydy2h4p0cNOUoJCw
	+yXKkbW43Umb0hsEg4ZUY+8A5yqh9OlLQacqZ5cFWh1Qo7eRTQ0e3/IVbLL5z2GIJggaXXXU4GN
	tVOmmnM6poD2N3aRTJMvV5Z0qJMiXB39nXLuWzag5qi+0RZJfxZjjgCJ5WA/+kKcBMCf1s+1axz
	J7yNxsPNEOH3oIKvH/wpSO5FW0qQIgLtPtnQLCHrgzqU/CnKgJBy21y2sXUiFbKEB4cjutbJneI
	18GDRRsNFZ0peHY
X-Google-Smtp-Source: AGHT+IENkbhcihRPvhZGWpf9PbgT3osv7NVPvnk/P4cCA7/vVF2AJ/GMHACD1iqN53motj1hl8eSvg==
X-Received: by 2002:a05:600c:a47:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-4778fe78b15mr24098395e9.23.1763117528706;
        Fri, 14 Nov 2025 02:52:08 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:08 -0800 (PST)
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
Subject: [PATCH v3 07/13] serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
Date: Fri, 14 Nov 2025 10:51:16 +0000
Message-ID: <20251114105201.107406-8-biju.das.jz@bp.renesas.com>
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

RZ/G3E RSCI tx/rx supports both FIFO and non-FIFO mode. It has 32-stage
FIFO. Add RSCI_PORT_SCI port ID for non-FIFO mode and RSCI_PORT_SCIF port
ID for FIFO mode. Update the rx_trigger for both these modes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 2 ++
 drivers/tty/serial/sh-sci.c        | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index e3c028df14f1..77f9a67d8efc 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -8,6 +8,8 @@
 /* Private port IDs */
 enum SCI_PORT_TYPE {
 	SCI_PORT_RSCI = BIT(7) | 0,
+	RSCI_PORT_SCI = BIT(7) | 1,
+	RSCI_PORT_SCIF = BIT(7) | 2,
 };
 
 enum SCI_CLKS {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 78fb3b6a318b..66ab85571230 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3326,6 +3326,9 @@ static int sci_init_single(struct platform_device *dev,
 	case SCI_PORT_RSCI:
 		sci_port->rx_trigger = 15;
 		break;
+	case RSCI_PORT_SCIF:
+		sci_port->rx_trigger = 32;
+		break;
 	default:
 		sci_port->rx_trigger = 1;
 		break;
-- 
2.43.0


