Return-Path: <linux-renesas-soc+bounces-23932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D13DC21A68
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02A704F3748
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E39037EE20;
	Thu, 30 Oct 2025 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHk3RpWK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878637DBC3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847104; cv=none; b=FWHgcWVLI78Kjg2GfWkZnAsPDqDwTcV6TZFO9WNGy47OfG5wc0VdkrpD+mtDtSpT0reL/qXuXzZq0191gsBlnyfI8C7i4pB/8WdMQMHWhygFiDHFAYpsEmgvN/kRaCtB8USRoysYgDdF8lTlX+wyBimjHRo8IVm+12fToN/fogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847104; c=relaxed/simple;
	bh=FUUpdN5VqPaa0AglNAM37NGlXaHlU8F1s0H5S0bhfxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+yXFCxxEmCVOe9PqvTfVFK6Wp7/u5fcuz9u9xz7p8e4yAtrQmZh8P5f87am+DrA/0UFbE2dMm8ihUVniuYAf3kFiYyzYZg/1KO28EeBm46j89CxtjWV+oONgrKAeSTMXxtQK1duvXeYSIKcamzWaCXfAF2KH2CmKPkhTRUMcWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHk3RpWK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4771b03267bso9778275e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847099; x=1762451899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx09GhYIQEqgtyHYb9x3QHdYCDiDGK8KkivjnJ7GUsM=;
        b=KHk3RpWK07Tx5yE+KFd36Erln8/MJ5GLnQUmV/VepNXLQltC6ou5pNnkrpjSqeSg9l
         rFsNAhnluyEz9/5Mhzrs9tC5s2FvRvVjcB6litomKpG5Iiivebtq3al07fOri/hs2Vvq
         9CUPgEqk71JIw/mqABJ8Gp1qPKannJk3QgHh1Qn6UKB56I1dfVzA4c34RO62bjk5u3Hp
         xl17l6lq/bygbBGxYMeAjlRTRVJ9WZIlhPRxW5RdXmQQXBetmPHqJ5+QOzTDS6f9CEvi
         gXK6750S1CPJgy6JJD67zBUFTcuz4vhhuIzih9DaElLeww9TLWXyN7Zq8MHJnS9PDBtQ
         /L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847099; x=1762451899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qx09GhYIQEqgtyHYb9x3QHdYCDiDGK8KkivjnJ7GUsM=;
        b=nmRnfQaPKn4TgTxFeMVR5p6QOrmm7mmStm/hD6lEWzlw36aLGMM1fKIRLzNkCuG2PB
         qRRqLlJ1FfaSt2ryI2jBbINDaqkRvrWpLfG2+138SP2UY4XJ2WndZJ6qzsy9uJwlIUnV
         14Utd/KH3ovP1oqNBgExop8dfm+Eor6x/qrxPeJmcsNAtFF6r/FrAMLVosvmXGSTtzwX
         AZzH3dXdAEdcYWoiuIjkV1Y3T1DE8eSQ1YkUWqxKrXqmxlp0mXpNplCD64yj34BUIErN
         BsvPtIGcnphUaQff4BZ5UMSCfE8VJGNpseJmA+7AC8fEGnm2D4MHbSH9rOolAdpKWSHk
         Vj8g==
X-Forwarded-Encrypted: i=1; AJvYcCXOw/T6R3xXyBKx+S61oSEFeVdqUjPIOAaXcKv+/alJUtbNaWYiU0Gs0LcaBZUIFmGftT/46snpVVcBNGXAB5CoDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLymOMbjn5XbFoqNnjgLYR5UPD/cOpH228OTY+P+KEPTmYbG4
	e7I4W3gj4582Q6NhD+NiUpk9x4YTyk2G3dz2fXNsqCh9hoqUaDdVHONH
X-Gm-Gg: ASbGncu7ZYRrm7sloHvIvJKTwChVJ/8kbFzc6nzEQXM7/8L1iHDJejp6fsBGhwTBp+s
	KSI+QoLLQ7wB652rDu+OOSSQFBXntKF6IzMgWTVmNG96eZqXDbAEowD40YRzPfsLoCvOoK/LlJJ
	V7lhiad6ndvNF2Ym3bkSUt5t+/dRreTkQgTOEmSHD6v/jtDRxIyv59JiFKJbZUI/OLKXhe3WblE
	XRBnCOSu4dfYuYsG5vDVPxKnvTdJ848uOL7lNum+zC3CLAB4U4aGznWi5nWaehV8U0q7VHNqFA2
	08OUnfqti8xZwtbAbCE2yTCIJNVWzA4Ds1ky52hCTNMFtCB1T5My2U2Y43eDAp3+Ce0WdVghrIs
	ifyLRZBtVrn2iEJxrq/0vZwwbG8vy9h5OTMDrOSFjkxmBCRTFPhtPzmGWvXC0GuELHS+GBP4hVJ
	AHWip5bx0xvQzG8DR4SYKPgdhCmU4jWUPHf2zpg2MhxAe1e3s1lgV7/xjFhICeDrl0eaTLr4c=
X-Google-Smtp-Source: AGHT+IEM7c5w5v0aGKFjPUDUh4EvuTkOKmjFdioWbv9NSqY6m/OatijGxXMTlQm1Adm4IZf0xwqM/w==
X-Received: by 2002:a05:600c:1c93:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-47730794401mr6582545e9.4.1761847099337;
        Thu, 30 Oct 2025 10:58:19 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:58:19 -0700 (PDT)
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
Subject: [PATCH v2 10/13] serial: sh-sci: Make sci_scbrr_calc() public
Date: Thu, 30 Oct 2025 17:57:58 +0000
Message-ID: <20251030175811.607137-11-biju.das.jz@bp.renesas.com>
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

Make the function sci_scbrr_calc() public for code reuse to support RZ/G3E
RSCI IP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 3 +++
 drivers/tty/serial/sh-sci.c        | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index f730ff9add60..a3f4a76cdecb 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -171,6 +171,9 @@ void sci_port_enable(struct sci_port *sci_port);
 int sci_startup(struct uart_port *port);
 void sci_shutdown(struct uart_port *port);
 
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks);
+
 #define min_sr(_port)		ffs((_port)->sampling_rate_mask)
 #define max_sr(_port)		fls((_port)->sampling_rate_mask)
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 67eba7feea9f..ca4915c1e2e6 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2395,9 +2395,8 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 }
 
 /* calculate sample rate, BRR, and clock select */
-static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
-		   unsigned int *brr, unsigned int *srr,
-		   unsigned int *cks)
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks)
 {
 	unsigned long freq = s->clk_rates[SCI_FCK];
 	unsigned int sr, br, prediv, scrate, c;
@@ -2461,6 +2460,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
 		min_err, *brr, *srr + 1, *cks);
 	return min_err;
 }
+EXPORT_SYMBOL_NS_GPL(sci_scbrr_calc, "SH_SCI");
 
 static void sci_reset(struct uart_port *port)
 {
-- 
2.43.0


