Return-Path: <linux-renesas-soc+bounces-25386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB94C94431
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:46:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D6A44E6D1C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C97F312821;
	Sat, 29 Nov 2025 16:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpENuIw+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26E430F944
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434624; cv=none; b=uRZsmQqw1LQJQ2JXr5oF7BryP3XDYIZQddfOcyyRSC9U2GbNObAHKdW/WUMM1QmSl6Q4EgYUUJP1vkA2Dh/JLWhHP/G/kjd+plBp5QnABPPN425mhFXIUu0jp/+Kpb57CByUHzZS/ljaxPDomZERIGscrmFHS3+FA6zD9YxKls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434624; c=relaxed/simple;
	bh=TT/L8D+DPx3PadZQsD9/6YfQ7uKMMz9N2IefVEmqDGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMdVrjENoCxlXVScpMsTUlEAS9HlPCi/SPkJzNQdvQHCoqInn4SFRansIHI5CKCENgY7y5tvuCNo+s+raRKmbAZJxtQnglro0oxo7mNQC+Lke9g8PQ/Stj9rfyqRWHvylfDChZKu8HMLEvHde9BYZ72jr6PPIw6EnhPQOOsC7LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpENuIw+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so169908f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434618; x=1765039418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQMRt2Uwt/gqU7bHz6od5jmCrmeJ5h3FXYG7R4U2WHM=;
        b=cpENuIw+Vf7iahjP4+7XJ745OBkv0PZfFR8gjAqIvLi1K/A7FjKpaPr+uLMd8QfDG3
         3qJ5+1I0GMBgtTvZgBsPKR7vVtiyCxwqHe+qRuRZjQ0TxEBp5oPAxn/6se/+SF1/utV3
         v8kdBvqxW8eYBokgPlAcxcW+FvjsQJJPFIQKv9KnQpt7KX3MkUb60G7pwHPr+IT54OFC
         HVMdm0oLpD/Y2daXv324cUe3onnkFK3lOEzZYjQLNdDet2fByYFPcV83C5y/Vf1dlmdm
         wFaNFEm0PgTRb7CWpHkgiAjpnHaI2FQi5RkvyxnoVVHs3xMviHwUxptgVZGXM1L/4hSa
         W4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434618; x=1765039418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cQMRt2Uwt/gqU7bHz6od5jmCrmeJ5h3FXYG7R4U2WHM=;
        b=KZr5EF9AlxS+8f110M36Js9Uyngtl67aTgZmSs5LU+na3NVn9qPiczPjrexoWRptrs
         kq/ze9ScUOiDed66WIsQf3XSYklvFL46aWrGSF9b7UUa144Ic8xgphT0cfTiNmtdnwSt
         no1//3diXUJVrsyCVLY6v7tkxOyAoZQZFZkCSDgimbZj3LU/AgZu66+5uZOj5q9grO6c
         l4RatPl4U/vKU17mTJe2lcNHcOJYiDkdoKfWQzdUKOp1C+MUGkDpA8+X6t0mB2ql7veF
         C92jD/hSfRWe6aAn5o3XFpnR5ba/Cx+L7RNoRBU5Pvn/r0T3tFx1hqSQVRzpU42gY/fN
         1xOg==
X-Forwarded-Encrypted: i=1; AJvYcCVUr096Kg1ngLb5BF+3ROFPeiocSMBs16K7Gu380sFEuccDxgQqPEicoxebCefygtWX0tBBCIl+O8RiSZSsqyBXOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDJgBwA9XvyXVJH88a9PKJCdFIGW18/EFYDApTjoUPE9JDZTRG
	HgUQeyD3xH85hL9AXBReCej2ZNu7wscZhdJuRWZQCZavoSxTuytqV826
X-Gm-Gg: ASbGncsyIx03Cf6eyKwYg0dM2Jo11a/6RcBwOVJi0gjOsWFlwb0fht6B0LFtr82w8h/
	MuFiCMgrsyNton8J/LukPp/fdjKuFALYxfOTS7cj+algb98ayvdcZ7bMsInnc8VAfIifxpp64L2
	GyNHIBMn5JI2saMVbuBFNIt7B2bkqTqXb6Bv7q+PcB0NHbJQSvRlGZ4Vfi23ZgvJvuGl/MCNOII
	8ccmLipa1wRjqQfHR+Ig8VaWEAq2EKDE/wAN/f2uJy7LdvgbqftmuQfPYR1UfrvLlwlYDNfoNLJ
	hTLohpycplbl1sNKinC3qcW4YDVlu/UZc5enYLSr63gx56YqXF485pU252oZ1NLmo76YtnBAlmf
	g3rpiuZwu1oYeUc4QEgU6nJebkkRxK10jsVAjDyu5mqZ3NGhYJPIup9NBT4UM8b8W/2OdpyboRK
	d8nmq4aWwYbL9CpVzQeEqt4sog9ndTJ6WfzmeoLnzdui0fsFYdOQoFKK2SFXcG2PqeWQZBYrkYt
	kSwReQn78exmsWN
X-Google-Smtp-Source: AGHT+IGDGob4+ZaYdvQdfCK+1xhcDfbYjh04gjTGQLuDVEOxYegqBaf/ci4z1iCYjQ2Mx3h1Ew3RdQ==
X-Received: by 2002:a05:6000:22c9:b0:42b:2eb3:c910 with SMTP id ffacd0b85a97d-42cc1cd9466mr33476719f8f.3.1764434617923;
        Sat, 29 Nov 2025 08:43:37 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:37 -0800 (PST)
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
Subject: [PATCH v5 14/17] serial: sh-sci: Make sci_scbrr_calc() public
Date: Sat, 29 Nov 2025 16:43:10 +0000
Message-ID: <20251129164325.209213-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 3 +++
 drivers/tty/serial/sh-sci.c        | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 5d30771278b4..976e394ab968 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -169,6 +169,9 @@ void sci_port_enable(struct sci_port *sci_port);
 int sci_startup(struct uart_port *port);
 void sci_shutdown(struct uart_port *port);
 
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks);
+
 #define min_sr(_port)		ffs((_port)->sampling_rate_mask)
 #define max_sr(_port)		fls((_port)->sampling_rate_mask)
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 5d7e78f95c70..e2ba752f9c16 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2573,9 +2573,8 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
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
@@ -2639,6 +2638,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
 		min_err, *brr, *srr + 1, *cks);
 	return min_err;
 }
+EXPORT_SYMBOL_NS_GPL(sci_scbrr_calc, "SH_SCI");
 
 static void sci_reset(struct uart_port *port)
 {
-- 
2.43.0


