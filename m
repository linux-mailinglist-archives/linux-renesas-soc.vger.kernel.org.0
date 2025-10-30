Return-Path: <linux-renesas-soc+bounces-23919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72230C21987
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 199124EF1E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E209236E375;
	Thu, 30 Oct 2025 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Swqnbqey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A636CA94
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846939; cv=none; b=sGnZY4EnM4Mlo1C8A5ZKqZsTT8TSD4kXhLR1xxOJHaq09fKOmpRqmyb4I2EtQCkwB29EtG34kOk92H8Tg84HbT2zJA4KGh513ItuLn4kzMPcU/Seecng0mpaipieNTpsyEL7Y1Sob3RlFxQnSh8pmWLHBzWD4rlsgoy2GmvavE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846939; c=relaxed/simple;
	bh=ZVr695PrkjlsTLaO5UZFDg6DGUr1VgaEBsWlk7XU+bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePwlLEyaS7ZQjRSi/fvOOdSdu9M3cE7rfTD7lQdGn5Op8yLs+0I8rkizGceK+W/Zpgk3p6HEo/Uu8QCyRJaesLjkoNgrfDZUXFQdDXo420tr+m4tOj8oqSP5LoBz6FmL7+uQ+B/q80Jpji+VkP1x8m3wxqKBUJ7lyOLz/6cbYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Swqnbqey; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso11266495e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846934; x=1762451734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfbjD1RYHWgoO0jG0DLqriHMmFx1f2scKAXhmIYvONA=;
        b=Swqnbqey01kzoa1XCsgBJ96Ik0fRiuVDcnRfuMz8alz7WDm54NY3dzBwjkElt0srJI
         /HLCcmFPd3QN5j4M/BLm1ABFjPqtpAQcMW0LweGKjOTbsQXHgGbxEkcVmJIRN8CEp+LH
         QELc3ux58kIV0x//taAH9Ycmll+cuMKGkuFQXaIg+QLzIvaj8JRaWF/8yIl8Ez1GWEV3
         wO5i566uyZMpYYh4JcYUtxZ/CK8Z5G2tIyBbyaTcV/OV7JsrojxWrsFTngbgtjVspjWZ
         1ErfRY/pSOvrcVVPbKlLIhoKK12Apf4ENW9VhxguusPVyrZxfj3+3upqYVY2hxh4rHqM
         G4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846934; x=1762451734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfbjD1RYHWgoO0jG0DLqriHMmFx1f2scKAXhmIYvONA=;
        b=LW7jS/ghR1Te0odfI9MxN7Deom5SwyNP0apElscbmVQ1Zgw26L28GLun5LRwTQGqKE
         remU+VWosZozoRx80kFT+nUvSeBV32LXGjwk5dQt/XOWwm35TtSDYTpPIFHrFymqOpXb
         gb0p2VQRjnXciT5ztuMH7zVk13NHtJTZgx/VIGsh6UMCGTzWoaNoswsYekJpZT2Ch3ds
         4LqEAjNc0Ldrn3RlKxP9hsP0zV8GJ1Q7HYtIrWA+YyAhR553dp/6HlLsjbvUw3MopOO2
         xS2525mao4Ms1FfS3LwAjCF6YSN+7MzN1OQRNLUFXAL+C19zETgLdw/GD9l4Qmw/Jti1
         EwMA==
X-Forwarded-Encrypted: i=1; AJvYcCW3b4fUfll4teXd68hI2E2L5LTyZlq9WnnYKJd4zwj8tIvr8MYtYgg10Y15N/6mZO4GoTRKIf5nFS4QUUGS5FLfMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgfrQnVsNwgQOxS9q3qzZp5MbVtyzQ1IaKkDp50eJWhjbpfcVE
	1jfmQyxFTTUuJVBil4Sj/gaV/ZTfreXwvx6iyvqaZJ7bW7gyYjBUSqwb
X-Gm-Gg: ASbGncvMPyuigoBvAt58Ue5Nlyj1OIKYY6D+sF5g+JGciwRCI+dzlMmKFW+l43vFtzs
	nw5xqknGuwMlH2F4018eUvac7tHINzRXQGsN9PHw/xRF0asfkbPAK+qEOa+GhCxlJE7XOkO3Zmd
	Ns59AbTnJQ9BzQ4ZZrp1VAsXq6lIc0NYflU3FwHU4tKNBGiyAE69lp6v4B3QuVKBGq5WwPzMO+E
	18e2X3poxJrnBnozt70TZ9p1h9xgq0GisgGtIN4ploDB5e7/rQtQTZu2gHrOYmeW5D3xxw8nsOn
	yc1sBRMLxKsHmTPzY6K01N/AL5x9G5CslUcQ+SDWHUKk0qsQhixpjybdRVLvrryQ1IyEXXni3Za
	g/I72Pyf+9dVqSpq1ykBo2s7AdBCIOMA0ec91jtnjzHzvmKbst/quvA6U7wN8rHOlI4lP+VubLh
	2vEXRvjnqyVyWaoIrjoAo/wDYykRKhR3w2y7QeZHshCcNKekUXpw9VZh3mknOPSswQdU2KR6wxM
	A3Mmye6qg==
X-Google-Smtp-Source: AGHT+IE3z5lAmhGoh5d4Yy4K8o1VX+Hl6Sh/SAktovTtRK5y2To4h3DqtSkPbGR9LE39NISIviPJxA==
X-Received: by 2002:a05:6000:2207:b0:429:7693:884f with SMTP id ffacd0b85a97d-429bd6725bbmr488929f8f.5.1761846934316;
        Thu, 30 Oct 2025 10:55:34 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:34 -0700 (PDT)
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
Subject: [PATCH v2 11/13] serial: sh-sci: Add finish_console_write() callback
Date: Thu, 30 Oct 2025 17:55:15 +0000
Message-ID: <20251030175526.607006-12-biju.das.jz@bp.renesas.com>
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

Add finish_console_write() callback as RZ/G3E RSCI IP needs special
handling compared to other SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 1 +
 drivers/tty/serial/sh-sci.c        | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index a3f4a76cdecb..2e97aad390d9 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -95,6 +95,7 @@ struct sci_port_ops {
 	void (*shutdown_complete)(struct uart_port *port);
 
 	void (*prepare_console_write)(struct uart_port *port, u32 ctrl);
+	void (*finish_console_write)(struct uart_port *port, u32 ctrl);
 	void (*console_save)(struct uart_port *port);
 	void (*console_restore)(struct uart_port *port);
 	size_t (*suspend_regs_size)(void);
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ca4915c1e2e6..fac83dace27c 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3259,7 +3259,10 @@ static void serial_console_write(struct console *co, const char *s,
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


