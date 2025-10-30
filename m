Return-Path: <linux-renesas-soc+bounces-23918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43357C2193F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEFA53BFC73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1725236E363;
	Thu, 30 Oct 2025 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjoMLTIx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E9E36CDF6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846938; cv=none; b=FPurlt16cR0x5OEXI6EV/4cbcbWuWdXCQBvoFi+fuhVDczzV8F9gSUK+dj8iyr4NJsdc0kl8w7+EESyQQ1dwCiXwhjApb+oowyL1FaHck8eTpPmijDsBPo/AT8fEx0G9pIh9jlv9sev3i664fG6uqg4fiWEZPyf7mrPEEu8W5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846938; c=relaxed/simple;
	bh=HUpnC1htM18fOjkA4XpHL5QRou+4yn4bYa0B4lXoOyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1ILu1TAl0dEVe+LPKAIVSzPNE4sBhL9zetuvvTZINYJIc0iCkJ9xWh/KiuoqXAjgJ5vlVi5zNCDIpoLIzSavElFmyN9w1PDSIoVqvP4xssZ/n2s1akpA069W5WH3CCbnxnRQ3uFSV4oO8Mzy13Cjdu7H75sEb4aP2+sNFu+xbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjoMLTIx; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429b7eecf7cso814280f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846933; x=1762451733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEUFPuIhsavAXgb0AC7F4BVlpWod4yVZ6DEuITlOuu0=;
        b=YjoMLTIxKin+/GWOhbVfyK4bQIQ+l/X64jHnWln8KmJpjXDCtsz4i7rEMQN9xg+8yS
         knrX88QyPBfEoSuewqVkUUnXBHIOTeCUbE4Ysh7Fcm0wfEOCq0Tb311xPCsKoncOIaIR
         xKukIjZNbrqzV67CmJY3EDdf0oczljYrFSSnciPFL4GzuIYRKWaDLbvK7xvlAGCorbyz
         oUVcmnbb+HxdpS03aBz/wuBurylhXqskyR61bru6f7vp+I/VngyI4YXD/nhFTscrBIo9
         hZaZk2Mc4jb8iy413u6YClfBowwAu5DZ19duY82DYsyuO4nmhmQ2bnYCgtZxkZ4CPrlp
         XN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846933; x=1762451733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEUFPuIhsavAXgb0AC7F4BVlpWod4yVZ6DEuITlOuu0=;
        b=poAP+M5TsZfK47Lki6oOdWfAIR3jx3z2NL/V9aRd22vkA7cbv909Pfe/dvd1iuQxHX
         fzZ3zSohKcwSljuuq9YI5FVB7fceitMzhEemoDL0rK9N3rSFp+FBXn4tx5SKGOK9S+ju
         6EGJAamhQqd2UZpqPmn0EvZtPKKhNBPqqG+0c22+FnNoEKuSAiJNgZQ9Oz3giKRMIVQu
         LFRg/xsJKyixb3UHSg0oP0Y6727f227OHHNf6P38KAWmNQNiEa8ZXqzKM/8kBsxsk6Sl
         37Zox+A89RFStvsSqwFB8Ssi6X2uYn22fTXLaHT3p7Ooqtruh3y2bLuwYBAnWR6YUqD7
         w7VA==
X-Forwarded-Encrypted: i=1; AJvYcCURc9Qw6JW/meut0fFRpV/STydC73Q19FJ86liTBygNhuTBRUU9hauvbJ29DpVdn3ZTEdFQImvB/FYzyHkj02QGDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvNf2XsnKB2ltIw35t8EY2lKfvWGo1ZlilleQD5gJrQoxkaJVB
	oAPLDt9HDyhk7rd5ZWUPlGiGqKIBNUgKtoOO8547KA0X6+DNgQy4kcgdkCw3oVms
X-Gm-Gg: ASbGnctuRfgrMLEFMB/rJNwiFQx56gxRQKLmNxFCQic09D+KvD/D1QCHbmDiPDXVmq2
	77s6PHPe0RrZhlpul0LKzB/Q5zX8TJNbjC0RKq68NlLLN2nigsCCDkZJuZF0+AUy+8aM6R1F1sT
	f+qBNmDu3aWATi9qcQgcHmjq8uzlZwMvK+8PJPLTU57NG8ycebUPT5e3L4wcP2e46aYjqWVkINL
	Kab0ZCdT71WHLGmc3jGkEFX3Lhrd/F1B1fsYJPZkg8RbVs7T+kKagavUPzt3yd7jOiEJFGz41RB
	5mZd3krBwr1FG5Fb1uB80cE0Gb73qqEDwj0jjSILi7ERSy4afnfiI1L4oAhp0d7PNT4ALbJHrmw
	q4l5+/6eDRzaX/uLfjOcoFLjG0wDUu1MV9iv7TCex3SI5KNhpQu2BoFYae6x2xCv35fLnLS+r8K
	SJYx6ULaKtjZHi6hBadehfs6BI/HzVAeXYSEcYP6658iPAGDyBsEJl8oq+lUrI
X-Google-Smtp-Source: AGHT+IFlRpzCZJwVLyz4vd+bbM0VhDvQFIr7m66Xdde7XxC4dW/e2SY7oK12bgM2QVykMekDGxO43g==
X-Received: by 2002:a05:6000:2308:b0:401:c55d:2d20 with SMTP id ffacd0b85a97d-429b4c8b48fmr3544505f8f.26.1761846933193;
        Thu, 30 Oct 2025 10:55:33 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 09/13] serial: sh-sci: Add support for RZ/G3E RSCI clks
Date: Thu, 30 Oct 2025 17:55:13 +0000
Message-ID: <20251030175526.607006-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * Updated commit description.
---
 drivers/tty/serial/sh-sci-common.h |  3 +++
 drivers/tty/serial/sh-sci.c        | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index ef1d94ae8b5c..f730ff9add60 100644
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
index 7cc2b622e270..67eba7feea9f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2994,6 +2994,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 		[SCI_SCK] = "sck",
 		[SCI_BRG_INT] = "brg_int",
 		[SCI_SCIF_CLK] = "scif_clk",
+		[SCI_FCK_DIV64] = "tclk_div64",
+		[SCI_FCK_DIV16] = "tclk_div16",
+		[SCI_FCK_DIV4] = "tclk_div4",
 	};
 	struct clk *clk;
 	unsigned int i;
@@ -3003,6 +3006,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 	} else if (sci_port->type == SCI_PORT_RSCI) {
 		clk_names[SCI_FCK] = "operation";
 		clk_names[SCI_BRG_INT] = "bus";
+	} else if (sci_port->type == RSCI_PORT_SCI || sci_port->type == RSCI_PORT_SCIF) {
+		clk_names[SCI_FCK] = "tclk";
+		clk_names[SCI_BRG_INT] = "bus";
 	}
 
 	for (i = 0; i < SCI_NUM_CLKS; i++) {
@@ -3016,6 +3022,12 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
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


