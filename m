Return-Path: <linux-renesas-soc+bounces-23933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D56C21A32
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B44101A614C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D11374AC8;
	Thu, 30 Oct 2025 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUggTbiB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7137574F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847104; cv=none; b=qNrFK++J8fpe4X8DKJdNPV0UbxpT15jV9f18BomTmBu9Uof3coLQSXsrtFTJgQy0gDQm74GtRltBs3jPoy+H6JfTWGUnkm3qAeqarSevzNqZkr51zqVYM8fVWQHNv0b62Ec1tD89mYZADMigFvgEYF73WF7xuOHCagj30s+Dqu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847104; c=relaxed/simple;
	bh=HUpnC1htM18fOjkA4XpHL5QRou+4yn4bYa0B4lXoOyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2eGFPjhwL3GW9YpnTtXluDDR/urPwrwF0CbC5qzoxz9y7k3fU9+d6DF7w1k82CdYlFMUdo5ZNE72i2v3b5rWhSYLPDLelICpHKyWE21OTSEZkK70ARDFM5qEcTLQ5OZso+nIrHXaNAjwB5JJaCYb6B7/qM48SgRvuFtF2b3+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUggTbiB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47118259fd8so10515445e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847099; x=1762451899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEUFPuIhsavAXgb0AC7F4BVlpWod4yVZ6DEuITlOuu0=;
        b=EUggTbiBhseDw5AelPETgH/Zu5KInJAirZUTl+wFeQi4mXedPnPlZqgFWeX4IKhF/i
         cPcMaoU5Z5L+8zDJ9rXAhxgiWzASxOmyN2BQ1c/zhBQH8lLr8aucVnFuFP7mt6YANHaT
         0PyIwCH7t1R0/xt8Rfj3twrM6UQUUhCLCwxm1w+qKaQRaMnMPmMpv8NGRkyKekveOYts
         67/pSkxTCJGIXNcDZKMQ4xOeB/NPVNVhbtHheN5YcsX6EAp18lygQiyLbKPyqk+RKb3o
         IsYfMKb/Yfy/g+HAKD7b9H2w5vdfIPmkin0Rw1S2WZ4bZgrkjEdMZe0G7c33h9Tx0H76
         SiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847099; x=1762451899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEUFPuIhsavAXgb0AC7F4BVlpWod4yVZ6DEuITlOuu0=;
        b=gOH25qbnlvoHcqjLhQI39eDoEnkLanmh115I13O/h+JCOta41lF+9r+5rMLUjneBBX
         K/zHP5DubGaoT3VC8DKRHRsKadkLD3SjbCYRNl8QR4KHtc9Bj+5J9ULpBHmYe8Ap4lOk
         O+me5f7lauT6t+JC/0DK2tCnBOMJc015tPjgYKUOGUUFfgQ+fHe2IJ7zLfcLdipA2RI6
         ww3qkwAg3ZDxn90JGAOPWAFpknVZ6RnD7xGdLYibMLq0+DdXDMm8v6NiVo8sz5i3kkhT
         SyWsylaQ79ucFpKlc3+Dspalh439HYOFxV4ETDppfG31iXx5RVz5PzPRRUo4FPSJntoP
         zqag==
X-Forwarded-Encrypted: i=1; AJvYcCU9HthFi2XqwXd68rZfFtT6ttgfaJVniTUCjs+o12SCgOupf6AdnFjRdm5Z/W3JwFQSZOCWcdUHtcSaCeTumt3gyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPxhHIU8XIA3lee7qV3CNZYQVt8/5Ln/27mZ2pR5WyT+8KZMy
	UBHdt/Hht92x3gU2sfR7WRocdk/ccYNPEiIrPbxlIvQdkYkPzk55MFKQ
X-Gm-Gg: ASbGncvw0Amwue2tvH2RniCTH2NRwF8Sh63LXA/caIamvH2hhv2/QnsQmt8RyVncQpe
	Kf65Pis1G1Xlf9i+tBbYHZgOhzZkoSFXZQLHrj6jX968rAklFWUFLA0S9JjvytUh8mtbCYmJ29U
	u+rBPFKcQRVEAIMt5ZK1Kvk6TZkPOcpdPbLbuqY6uEvli3lHKmc3SSS6AHbY3lqUa6T0Fc+SJsP
	NMfhP4nNGWIKDmBF6jFz2vsJSUjiZSlEine+BnVRvFY6W2mSVWqNvkV3lwyRbPa731t9AcrD0M3
	AYZlB6nMnIIgWhbvILY7rZzc/NQNvBB/6nPIQ5EuXEyYOiuXOXxe9CA2NGphr244yZ6cv+16tl2
	RTAAfc4bUby7/mdJdk/PXK37shQW8BFyaMWDVlcITT2eWALfsiPq39Md+uJV9TuBX1f9Ubrmw96
	QWJP3v6S7mHcWq0MMn/bMkTemkeZZtf+avx4HCP0ioSh7UGr8osaBqmwP3f9ePhcx5ZHRc/zA=
X-Google-Smtp-Source: AGHT+IHCnSAFWePFf3QW3AZNoiI/h3gcT0ofd78nlVqllQKhXKQhlnqG5HXZO9bGFC2m/6UHt0HCZA==
X-Received: by 2002:a05:600c:4ed0:b0:471:1415:b545 with SMTP id 5b1f17b1804b1-477307b8f57mr6623855e9.7.1761847098870;
        Thu, 30 Oct 2025 10:58:18 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:18 -0700 (PDT)
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
Date: Thu, 30 Oct 2025 17:57:57 +0000
Message-ID: <20251030175811.607137-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
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


