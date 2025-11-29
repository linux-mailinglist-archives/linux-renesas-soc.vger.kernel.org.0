Return-Path: <linux-renesas-soc+bounces-25373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10192C943A4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 17:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBDE24E4260
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 16:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02BF30FC33;
	Sat, 29 Nov 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNsTJgl2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496330F7F0
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434614; cv=none; b=qDw1vWWGSCPmGS2G88zWML2xtnWM/hx7f2kjjGIZchQdwcqvkFZrV/3RE2HomwTu/2S/8yN39mCOZlcjBHlmfE1gAHOe2UFhg78u4P0bDWcTItodkgoCMgoL6ASnfB123r3cGVGfYHks+6pEkSRFOhgtRbXb57YuMYWA8/u2Wlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434614; c=relaxed/simple;
	bh=7Gt1YgAJEEGKJpT8m2zJjrNGSESqnzyY5pcLamcAVl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E3qnBlhCunc/2bcZP6G9AvhO6Gx2p/wZpKenjQYTTysdcT61C5JzRJyLE0Xx9CzaNkdTbp83VmmqmMqvTmXiHueawaED2KZ0EmmLCpZsTlM1F1z+qPgTXtLV4jsORj6RAsnAaoIaVKTJllhbGREdcM0cCLkiv9HiNLeC2LL3V3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNsTJgl2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b38de7940so1296568f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 08:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434611; x=1765039411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0GL9llKMJnY7Y99yoS1OtzGt53dvO/rcRpUYrh4ZOU=;
        b=dNsTJgl2gQcLyP2NMhqyEPOUB4/8Xj0OPLHMzeig5M9x6xzHFagHM/P7e5EIVeaWfs
         uQr6KaYSNdshiTGSeccOxTPGer8jc3IUbJly6UIKNE9DY7NwxYNQS1whXBHQjtYmFxN/
         FtTxrlLPUs0XI5XymM5ZoQqtC99I6kYKRV5opb3vS2rHOKGd+ADbLvT7q1FX2VaL2Ndw
         9ar+0IIZt0whfz/+Mr0SMV6QlvqIT7+0ZPUYWR4xiYrKv/eyDE950GWDxu9jwc2OGeRn
         kKo2iKY2SIhngtQB2MFGURlbBHxdas5EZJvMPnPrwqbYEP96CflgtfBhsTfMiBBYcKMs
         1SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434611; x=1765039411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C0GL9llKMJnY7Y99yoS1OtzGt53dvO/rcRpUYrh4ZOU=;
        b=W0o2+EtKMqemZ3HfFFyvHQTZJTybkCxYYWTaCuEGY5p0vli0Z5TVOP8j3cMeFwYSDN
         xpoTA/Y8jMuhd4s6djfyKyUILQpF6nqh5UaJhWuunADW0kH9/mqWpqIV/7a2ThoDcvqe
         4jVPrXEGHakMfizY7Mt1ZtVI2ZU9/OO62CA9SjAtUjJ0c/M8tpRWE3f+wPQTw8ReO1io
         iFl8uJociUZhN9SQXJWRbDcjbDIYODrMkcVZtPn26D7wq7++xZl8SAisbsbRLbVhGMl3
         bejnR4ldVydMV6Wwr/F22UUcZKmIWAjNln+U+2bKaEqvVsaS+3BFFeIF1KfZbXCTxqJS
         BPWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpccDdt3gdvdD+hKwyYO9G1DAM+5t9OSjaAMSy+67deDn+Y6AENkOFGHIMo+XycBC+NDl2oOxVuwo9cZX5vYY4/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/1EcXnRxgPl2bNggictdsXapHQ3KzUKz4MMlzGcXHtVySGXQ
	DvS4JoW3pFYJy/YSwINOdlprG1qTxwNn3sHSLZHebloT2Rt/rYzOeOWW
X-Gm-Gg: ASbGncsN9GmkwhG/nsaXZvcFiiMQVS8HCCBizx5QsM1vC3KZRYrVjQOuVP2tMNXpAEv
	bC6FbNkLR3Ef3qhVnRTFkvZi8sLoRA/8q+ZAzSe2WtW9wTL4NxdXNyfpl8ns4mDdauZFd8nRS4L
	ZVI1nKZanQHBzMjH+IBHWanv8CsOQIQJo5XufXJI9nrXUqVb3R92hWhMi4afybZaQC0JdgFUErs
	+5l4NIz+ZZJfk0LugHMfUASQvpDS51xYFqwDrPS77KLVnxRhnz0TyDjIpIny37KH/axv8MKfHSK
	WUqXPTnwauFoSnqlF82ac3BoOO7x5CfgVVsvwNUW90b4PJ+xkyGG6gkWVhonCKPRlC8idWKWoRC
	wI+E2ojaX6MBJeqXo4RQeqMYA3Wz6m8I2v4ICChJBC9hB+pHdUeQb2rGC0Mft6fp9pa/NUgBoFr
	z1TisJuBGQ3H50IeYvEq/lnUVMG878m1SCZhSKLDgDph/0BZGjWQbIfigosgo9nUx2zebyNi24N
	o6TbsxY77eGlHbC
X-Google-Smtp-Source: AGHT+IGFqwL4XFsyw/yn7ECVh094qGGx5ZT2W+oo9SwUYcceC9Ev9EXxvf1Vzo7j4HTu73o/KVJ4vw==
X-Received: by 2002:a5d:5d86:0:b0:3ea:80ec:8552 with SMTP id ffacd0b85a97d-42cc1d196b5mr34934825f8f.57.1764434610612;
        Sat, 29 Nov 2025 08:43:30 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm15970060f8f.29.2025.11.29.08.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:43:30 -0800 (PST)
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
Subject: [PATCH v5 03/17] serial: rsci: Add set_rtrg() callback
Date: Sat, 29 Nov 2025 16:42:59 +0000
Message-ID: <20251129164325.209213-4-biju.das.jz@bp.renesas.com>
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

The rtrg variable is populated in sci_init_single() for RZ/T2H. Add
set_rtrg() callback for setting the rtrg value.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch.
---
 drivers/tty/serial/rsci.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b3c48dc1e07d..0533a4bb1d03 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -151,6 +151,22 @@ static void rsci_start_rx(struct uart_port *port)
 	rsci_serial_out(port, CCR0, ctrl);
 }
 
+static int rsci_scif_set_rtrg(struct uart_port *port, int rx_trig)
+{
+	u32 fcr = rsci_serial_in(port, FCR);
+
+	if (rx_trig >= port->fifosize)
+		rx_trig = port->fifosize - 1;
+	else if (rx_trig < 1)
+		rx_trig = 0;
+
+	fcr &= ~FCR_RTRG4_0;
+	fcr |= field_prep(FCR_RTRG4_0, rx_trig);
+	rsci_serial_out(port, FCR, fcr);
+
+	return rx_trig;
+}
+
 static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
 			     const struct ktermios *old)
 {
@@ -454,6 +470,7 @@ static const struct sci_port_ops rsci_port_ops = {
 	.poll_put_char		= rsci_poll_put_char,
 	.prepare_console_write	= rsci_prepare_console_write,
 	.suspend_regs_size	= rsci_suspend_regs_size,
+	.set_rtrg		= rsci_scif_set_rtrg,
 	.shutdown_complete	= rsci_shutdown_complete,
 };
 
-- 
2.43.0


