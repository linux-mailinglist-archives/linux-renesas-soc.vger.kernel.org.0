Return-Path: <linux-renesas-soc+bounces-25117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EAAC85B54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32CC04EFDA3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A1332AABD;
	Tue, 25 Nov 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/XdKlXt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBC1328B72
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083210; cv=none; b=pBIuy8nsT/eD77eCR94A1nvP+DXDFIcJ9bb0cJ0n7K5dZ2lwem7QLXWUCQbapiP5hJ9/hnRF0+rV6NjQm9vb1/m6UsV1IjTC/IWBBCMaGYlK5cWNgvQs8YIgS0BYmal7uJf1C+EeZ/DT3ZO2Jprq6YmcX0CHYTWSDPWzmKYtq84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083210; c=relaxed/simple;
	bh=Dya8gWk1Iw6ZdXZXCrtkfZKnIqtf4ATKm4fowSjNJkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWUHjj7IqEZ5Njkzjp6jTDA4xB3/toOmANOC9TBCFDL+SwfG4Yeph0t+WhGQgcLRfPa3242OdQfSl+oF2funZOfEICtts07j+GS8QE5DgLqHery1fZApROnzqjGWjuQFBik9w0d9BPYJtBhJwL/lMFvrad+YqwPMKKWQX1WHzS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/XdKlXt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b31507ed8so4770918f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083206; x=1764688006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAPYdJB5mo/my8gVrUPoVKq7rkRWZ63E+ReOJRHKsbk=;
        b=c/XdKlXt6taVymuU92ZVEPa9px9CzUveKyO9OO+MjoFGs1Yx5auLx4ICs39jNBuD3X
         o3hrlnoQLoiKII70fj6mtDGP3KeSJ3aOUY/lOR32oRYSFpAiDPTCf56FYd3aH//9Mhdj
         yvO/puOzkROynw7X2LiKhcQVKlBJdFCPwxUYT/EJNrzModYrllhI3Ap0haEhsKmUR8Ow
         o6BJx6P0kthqhOUxdrXaGr25d39J2frNAqBglL2PCPXGsLgKU/+Hc7JAuWfCQI88VLwn
         gMaF5boh3hnynnk4kO9dpVb3gJJ3AJvpi1LMIbU1TFBaJa03ubArK6IGsHE2pNbNJ66c
         +PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083206; x=1764688006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FAPYdJB5mo/my8gVrUPoVKq7rkRWZ63E+ReOJRHKsbk=;
        b=Qfkmfp2tN1iXqZMGNperZZdG6rhy7j2LXLAJa/wMJazCjctdIH8tKPlJ9it8nn4ogv
         X4K2k02SYcZEi2OviwKySZn8az34LWyrFyETVTI1/Qs5eYsQZ778dTvvO5kHsF6hbmiN
         YbTG79thKA5t00nsUpa2jzv3qyMuDJ78Sbd67Fvz4AddojKTlv+WZDj6jlo7QKgeU0EV
         J91P/i6Up4EuDf0NeyuH2FdbY6zVus7+w2KEh/5MgcMehWitpl6c7ytMXxpkTbdWzL5J
         2ZIdR9hwd6jETJpRoJAuiTOZ6IenOYHVAdbboPZEw144AILYPLkLDJKw1xHP7hlpvPQ1
         nBRw==
X-Forwarded-Encrypted: i=1; AJvYcCU/zWRNydnvC0piAwsR13AEKmVI/l9B3zSmpuEzgh9O6C3E4WGtz2B8SldeHGD3BsHgIy+xtPcVcw3JGrsE6uuUCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaXV/o+ImvQWJS47ywF6211Itpd8iuTuVR9j6OP5qn2U9R2JJ
	ocjWWloqvL1CC+7rf9zYGyuN7hcKHrGnkp1JUrEtdFKUFqjzFuK1aY+h
X-Gm-Gg: ASbGncvXNfkGS0Dy8hqc6tn5v+xu6A8y0fNCgm0XxTNjrvmkgLCNdsPFWzTE0+POGdo
	C8wdjLE0CcOOjUr+JVcUo/5Vp7+26Bhs2Ebov9PcWtfdZM0eG6lF1rpdDhprHsqK08RbhtoQTQM
	ApKalhmYK3zmzKBEcLYv5r6Ja7rA1CBZGnk9poYi20iXGduD2J2kojd+4fqXVD/qYvDeSkj9Ho+
	GGp763AKw3ZoWzf5Ke+EULbDDLaBClIT4ZFlMX2+2Qr4f+yvtZuRL9TwJNRR9mgnRpaLJWctCKx
	ols7el0OPhtqGPHWTmY4xEiVDoQpMapc0ory/pAWoLmx67B83nPZC4Vyxu2H0zcrTf8OQMnV+xp
	XWZzumama4k0I0j7BZQJPh/zuL/qlK3xrhAq/UVd9GcqLrsYXq/q7C4AeaVWqJ4jQOwh4dstHio
	tZE2wFKbpfe1nvPwvRVJHl1aQFnL84eJSgkGyz4TdvgiEFgqEhUH0zfJ3cT20dK1bptSnHxmV3g
	A==
X-Google-Smtp-Source: AGHT+IH5ofL0Mt8WHMYnvjr07jc/P3mXQiVefrIUm5hzAc0jTSTDp41D+1dPa8OT9fxJWV0LbJR+mQ==
X-Received: by 2002:a05:6000:290e:b0:3e7:45c7:828e with SMTP id ffacd0b85a97d-42e0f3491ccmr3174984f8f.33.1764083205523;
        Tue, 25 Nov 2025 07:06:45 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:45 -0800 (PST)
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
Subject: [PATCH v4 14/16] serial: sh-sci: Add finish_console_write() callback
Date: Tue, 25 Nov 2025 15:06:16 +0000
Message-ID: <20251125150632.299890-15-biju.das.jz@bp.renesas.com>
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

Add finish_console_write() callback as RZ/G3E RSCI IP needs special
handling compared to other SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 1 +
 drivers/tty/serial/sh-sci.c        | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 976e394ab968..f363a659c46a 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -93,6 +93,7 @@ struct sci_port_ops {
 	void (*shutdown_complete)(struct uart_port *port);
 
 	void (*prepare_console_write)(struct uart_port *port, u32 ctrl);
+	void (*finish_console_write)(struct uart_port *port, u32 ctrl);
 	void (*console_save)(struct uart_port *port);
 	void (*console_restore)(struct uart_port *port);
 	size_t (*suspend_regs_size)(void);
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 0cdaed2e1b90..ee26ffc4632c 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3431,7 +3431,10 @@ static void serial_console_write(struct console *co, const char *s,
 		cpu_relax();
 
 	/* restore the SCSCR */
-	sci_port->ops->write_reg(port, regs->control, ctrl);
+	if (sci_port->ops->finish_console_write)
+		sci_port->ops->finish_console_write(port, ctrl);
+	else
+		sci_port->ops->write_reg(port, regs->control, ctrl);
 
 	if (locked)
 		uart_port_unlock_irqrestore(port, flags);
-- 
2.43.0


