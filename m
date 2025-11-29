Return-Path: <linux-renesas-soc+bounces-25377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46168C943DD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F5224E550F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D653101DD;
	Sat, 29 Nov 2025 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rf6pxYcB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C33330E84A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434616; cv=none; b=ORqWIojTKLuYR+XlhoOT2X/lcYEmQIK7QvR4YC6apQLjU4dibrWv4kOrPTqyO764BNdjZVRhkgcDof2z0Y/Z0L494fjSyYANMtHuTJu4p+SHo2URuS2TMqCNRj2ud8XLXIrZPVsA2FIHSvGhjbeg1aa7m/y1haWY4eNv8o9DOek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434616; c=relaxed/simple;
	bh=JeGL3ElzjhFDe5gkRo0pGSJ9Zmn7qOBrKpWwqsVnGOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9KWOrDt2tmOPNcFpTFXRNUmTnqOe8/q8UPywPNNMHbqYQbP16YWu4KaXmYHD9kPJI7oPEgUd88O78GuU/bRklKu9haRKSpfuWfXVpochtbG0u0f/DvG6PH/33VupCluLFHKirDlaDX29CG/6u9G8D2mLmXLRa73kwfoRQohzAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rf6pxYcB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2e236ffcso17114f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434612; x=1765039412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/i48prZesR9jVGUqmsTO5g48NzR6nsuZnqBSo+p3l0=;
        b=Rf6pxYcBswQmmNP96A8fqQxB2W47HX6VdfT8SCyY07E1kdbf+mXzr2ii93TfRoPvGF
         6sXmuW1bFKWiPp83idWq6zu3kgERzegLfrFNp/KLjg3w+JttrQsrek78ZP/8YqvmSd90
         0izN1DqgrH84reAYh4xSqXzsk8xqF3L9yxxLuNsJlMaqrHqrU/iJkwaQv2jv6XPE6d2B
         yGSZ+2P/x4x2F7+HstsnNsoo0WoLooB/NXtI9xVl/1+p2PrME13ZPf/qhOpf23riIOMQ
         32NMfE1binuqcUXkgKbbsogevODSr0lKCzs+/yS65c+IABWk0IiDNnGWKGq7ClP4iF1z
         BAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434612; x=1765039412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/i48prZesR9jVGUqmsTO5g48NzR6nsuZnqBSo+p3l0=;
        b=FhweqtJzsFTJlZ8RqikYjQzStF8F2SkT218bRWfFrTy9o+JPOx3jiBpwOsYK5ZdjhU
         3PwZwec5A04RkoP+bE5Myf3eg3H7iLX+4Q4mJGhBPyoO75RF3Ccov5srTikjlf7DluqS
         O6ZlxzbZe7dlXtFROjKxgCF6CP+GAnF0JfdRCK5ILtx3dwTJNqDkPpnLV8UQhRxq/TeU
         8G2tP704b/IMMRjeiT+zof99kZ/2GcB9tR7sBUzCFwXtRPZRR/r+FZRgH+aLSWgCr0O7
         Pbxjsp9U7eNlDmKii/DT562CjyKAdmqu6vOv3SBKG46wrC2G9J6re91SmQ4k8k5h8+rp
         30QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEFq4XRIpVCZU93LBfWq0pZOpTFsDdqRNmV7lbLRrkhDVUw3C8mmTw5KtR0OPbhS1aVwHEr2l/wXDGJmLGxO9UrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj3QC68zXNvwl6f+hTI2wMx7uevUTz9/qvdxJfhXeJnCpP6ewQ
	LPCANQsDPE9uwLzxSivJV3UcGZ0LSlgJ0cSfJTVGK8zI4b2p2N/kmPl4
X-Gm-Gg: ASbGncvKfAOZCTgWyDzCSxStiCkc9hEwzw8YqDLVSqsj+bgIHNg6RFpQgEI5vT1RvIb
	qztcrJfxlu+clLWifA1hF4vn2N7NFzzkAA+TcGuiCIE1epoFeZzbNOA4i42ai1veiMhn5fLaqRc
	81j/4Rzd547lq5X2/n41oN64IAj/A0M1QdFKWt0RUm1ufa/4fMNrr1jNwVnd0kW3hrhOpv684Gh
	A8QnxNBMOoqaApiAPqDEgAHrpzqbJUzWtCVDLZswmaoV3Pbfjcyt6wbYrWBpxoXx7enEIsch2NR
	cfhZ2Q4FuB6Xuiz1SQ0BJGoRQ/9jFPd6WLDyhVlVmuPE3mTC5ydJc8YSba7689FqQ8yw5es37NV
	fpergYqlZicbLitKX2boVBTVn9l4ow59GR66//1JKwb/oJhASpWQwc115pwGjbLXF3io6DUEYgF
	6gbKrw6xac6yYwG/dmrMgkAswMsWM9baz4m4zQoWN64thbvJDQNzZJvS9/CVRhP+cHAo9mjBaaY
	Bs0EiEI9vqqfpTF
X-Google-Smtp-Source: AGHT+IGxj7ba1E5miOzJbglHbxcrQkMvdt74dqab851RnPSR9g9DUqPe7xC8ewgDMOgqKUhpJj/iqQ==
X-Received: by 2002:a05:6000:2c0b:b0:429:d391:642e with SMTP id ffacd0b85a97d-42cc1cf461emr31964337f8f.30.1764434612125;
        Sat, 29 Nov 2025 08:43:32 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:31 -0800 (PST)
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
Subject: [PATCH v5 05/17] serial: rsci: Drop rsci_clear_SCxSR()
Date: Sat, 29 Nov 2025 16:43:01 +0000
Message-ID: <20251129164325.209213-6-biju.das.jz@bp.renesas.com>
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

Drop rsci_clear_SCxSR by reusing rsci_clear_CFC() as the contents of
both functions are the same.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag
 * Updated commit header and description
 * Dropped rsci_clear_SCxSR() instead of rsci_clear_CFC() as it clears the
   CFCLR register.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/rsci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 0533a4bb1d03..158173077c2f 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -137,10 +137,6 @@ static void rsci_clear_DRxC(struct uart_port *port)
 	rsci_serial_out(port, FFCLR, FFCLR_DRC);
 }
 
-static void rsci_clear_SCxSR(struct uart_port *port, unsigned int mask)
-{
-	rsci_serial_out(port, CFCLR, mask);
-}
 
 static void rsci_start_rx(struct uart_port *port)
 {
@@ -391,7 +387,7 @@ static void rsci_poll_put_char(struct uart_port *port, unsigned char c)
 	}
 	rsci_serial_out(port, TDR, c);
 done:
-	rsci_clear_SCxSR(port, CFCLR_TDREC);
+	rsci_clear_CFC(port, CFCLR_TDREC);
 }
 
 static void rsci_prepare_console_write(struct uart_port *port, u32 ctrl)
@@ -464,7 +460,7 @@ static const struct uart_ops rsci_uart_ops = {
 static const struct sci_port_ops rsci_port_ops = {
 	.read_reg		= rsci_serial_in,
 	.write_reg		= rsci_serial_out,
-	.clear_SCxSR		= rsci_clear_SCxSR,
+	.clear_SCxSR		= rsci_clear_CFC,
 	.transmit_chars		= rsci_transmit_chars,
 	.receive_chars		= rsci_receive_chars,
 	.poll_put_char		= rsci_poll_put_char,
-- 
2.43.0


