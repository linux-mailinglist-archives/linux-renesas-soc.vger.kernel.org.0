Return-Path: <linux-renesas-soc+bounces-25107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF79C85B0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B811F4ED860
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8343732824A;
	Tue, 25 Nov 2025 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l90jiu4F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93254326D79
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083201; cv=none; b=K4CbAXrgwYxa/VjyZqC6sRgO1edrlmlm9vKgbZoE3nKw1Mrrd3lvtkisj2Ej+Ceu/GrXlNak6ws8widVrxuChr27/IfLfud71UHlJNy+0bR6BQuzdyWcUSGZGRFusrPUT8wv9UImg5NG8kyoGIEInjlMgcUa297C+4D5u355MKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083201; c=relaxed/simple;
	bh=oUVlAnpiKF1Pm6FuP938DKT7/iFOmxYSFR7wJ4R4/u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ReMuiyEpJIPdNX8oDc3aiJrgd3cB3aRKP6V79vmw4ou2JfxLKG7IcwJRgvdHD6fTHNE1XqKzp9+QCY1bVp6X+g+CWGIEzR1ewygsdtelNhFanwLqDvHWvQI6Lshl+MOGeQEdyOfp5wNVR8SohBx+p1AHvlQN1CwizRHjpP4tnqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l90jiu4F; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b379cd896so3127192f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083198; x=1764687998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8Vy4foiqKrCWE5vi4KIrqrTOPxlJurxB7w7FOVWY0s=;
        b=l90jiu4FNpN/K7qsBYqo95Sh0KTXGVQWGsl27Ii9MJ8RdILt8uHMlVMNhw5AYnxw6R
         Zff9QuOpjikATHP9+PwtJ8JcOqkdsCZo3/JBqAu/lN63bhba+V0eS9epLEGAIs6x3sVu
         lf+MqCqmzrv9E+Equ3Mzuv8oSHqr2UltEAFyNBWUlx4wz7JcUbdC+zU2CbfCZWX/ElJV
         kepY5jD/N7rg2iaylgiiE3OMyZJJZgKSmNNHmqyM0zfrS+UtCv8g+d+OIELjvlGin70E
         vSxpf4lahTansycCoC3VH9NtElYlu435n0BWkYwNy62ywsDqWhiJRd3I2IHAhcjqv0Na
         B91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083198; x=1764687998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d8Vy4foiqKrCWE5vi4KIrqrTOPxlJurxB7w7FOVWY0s=;
        b=cz1WIBCW3fHj9ekU4T9e7zfxw8JLEqzwEgbblGd5mWQ6vOVu6E+o+Z/uyxmTT+ask4
         piZUjHBLupAew5vMiyZ9EZQrggIV9twLoMWor27afnOecdoUDXHYUd+DH7a5gJRioLQO
         8ereflFpXqBAdy0TXTP9yEYAbLnYpz6m+MRIxhj/F4RP/SrDVPz8xXPv4eU01dbeACmU
         PwfG5ioSSkcQl2cByolyKEVLeChaQj5x/o3twVTfKXycbKKsz/KdqWiu5I5T5XeNtXJp
         27EycWE6WY/9tUZ5bZsUCDA+r1GNBmNb/79BiCWVyyY5ntzlZPImssMWSFll/F4nwQ1g
         fxGA==
X-Forwarded-Encrypted: i=1; AJvYcCW3MA6ln1samg/ri0I2s+YkG6NMWuc9k1kwY54KO0Cszpau/+Sd/3h0Z6NAPWCNQBiUsxQIHGVWbrDXtzs38fxC2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvwlR0/VwLY3H2e1lBMBSgVt5U6gyAWOMOaWZCamwoFfVSs0YF
	ySlD264qPJ8O8vyf/PjhWm0F6bHbMKAFj4y0Gla6JXc2ICODJz+UQTyU
X-Gm-Gg: ASbGncv0hi2XohJ87cFKUvLv+KHM6XKRm2DCZqCk1MY62LQcVXBJYbKo1B/ivlaFSfz
	/OV+D6jWzEhCrss6Qpb/P2qmnlXkvvGYgHmMXWCMwj+xibTJcXlSDAczIoPjOyk850O2Wflbu/8
	cegEPVTrm0q3fkwSickYdbGML88+KfYY0Ep+Oq82KyOSvF9UqmpIkM/xlU5aIXq4s4gXVNfw29B
	MmjWqkqu73RlduPQuJxRe99VgevBrIQBFFEnDe8hH15rSU7teBPUmNZX/ug8cBfElp7mpcTfngz
	H/Zy6FSNzL+GeV8Ap2+aOVyUtp3k6ijTgyTTuvUBJmE4jyMK5de/CFUW4sY2IWJ9VKcAPt+U0Fi
	MUwP5jfIJKLtXRW5GpZjmHoiMwKXC9BCTfbOENz4pOnlSkdVDCwoCc4fzOh4lFwFnn8rlN7SVE3
	tuhZYce85ZtUjQrIsXtntrFLH2Y+OF9yGsI3Twn/md3zjQ98nboP0T1Nd5D1ONIL7vzQfdwSFu8
	Z4mbRaHw56eWaOB
X-Google-Smtp-Source: AGHT+IG6ixLkzz2qdg5wshNHg6Bnc3eFDwK8wBvdOmM8fHsmmuCE8HAQERhUmowkosTlJBvT5KBa1A==
X-Received: by 2002:a05:6000:2881:b0:42b:3dfb:645c with SMTP id ffacd0b85a97d-42cc1ac9debmr17211462f8f.12.1764083197726;
        Tue, 25 Nov 2025 07:06:37 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:37 -0800 (PST)
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
Subject: [PATCH v4 03/16] serial: rsci: Drop rsci_clear_SCxSR()
Date: Tue, 25 Nov 2025 15:06:05 +0000
Message-ID: <20251125150632.299890-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
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
index b3c48dc1e07d..b5afa7b2a4a8 100644
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
@@ -375,7 +371,7 @@ static void rsci_poll_put_char(struct uart_port *port, unsigned char c)
 	}
 	rsci_serial_out(port, TDR, c);
 done:
-	rsci_clear_SCxSR(port, CFCLR_TDREC);
+	rsci_clear_CFC(port, CFCLR_TDREC);
 }
 
 static void rsci_prepare_console_write(struct uart_port *port, u32 ctrl)
@@ -448,7 +444,7 @@ static const struct uart_ops rsci_uart_ops = {
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


