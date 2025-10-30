Return-Path: <linux-renesas-soc+bounces-23935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E4FC219E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 19:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E364424183
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DA837FC7F;
	Thu, 30 Oct 2025 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azfsx1pU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F5837DBD6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847106; cv=none; b=bX32gLPcrBVCGa/39gpxxrTiSjSkgr4BGOap69s1DPRJ41i54JrwTsv4NhXFZWw8s00fYNLdgiyLm9rJUBDklFYYppvNMvndfEkAt4woClkLnmjjPLAkzaSDQOKTBDwi9xIcIwJBLOR/J2AhEaM9/WuVqRzW7nAIZJL48BeRL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847106; c=relaxed/simple;
	bh=ZVr695PrkjlsTLaO5UZFDg6DGUr1VgaEBsWlk7XU+bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBkzMGcWk8HEc9NXV0iPfaixwshYvtQBRvm49Y0hg8TIPBjKJ4gPcSzk3d14ltUesTAndt6BMHB3GHR627ZZ7o4TfvONST9a3n37xR/ZzVHNou3ED+1JA2IvM+Iw3v6F00Mvh331VIcKb3nM+0VKe18kCrGWvWwEd6j1uekf/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azfsx1pU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-426fc536b5dso903011f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761847100; x=1762451900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfbjD1RYHWgoO0jG0DLqriHMmFx1f2scKAXhmIYvONA=;
        b=azfsx1pUgFkTpN+3DH7falTpbwTn0N/KvJ6g8CC7E/3doS+qKR7yNqPpyogWr1QVE2
         iMsNPVBxARX1g3x63S0iX1GS2pusGQtkWWAQhcvjjkWjXM2i77OBe0wQqz9yHUYhzNkd
         Tc94/bq4+WT//uyIb1+tRf/r70lSOPWYnnmEJb1VSZA4DTbsdZBckHYAUTeeBpx5bV9U
         Y/7moIRtxksVby79yTngd8EHSQrMfGGBxVEwQoC3QveM4wpeP53UvEbQ+uKC4R0POPxj
         T7h3mF4LGFfH8Y4YduINwE4kDIuAC0bdqoCxSzDal+02OW0sE7OG+yMNZwEdFfXzu+8h
         VePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761847100; x=1762451900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfbjD1RYHWgoO0jG0DLqriHMmFx1f2scKAXhmIYvONA=;
        b=CadjHkuq+2Q+4ieNdAJKP78mAwytYajZBa/eP7jFBrgr5KwZdFtOWmPbwM94EdG5VC
         OPCIdn9YGqcGPHvVNuExoLq9ZtGzx0SxSrugHvtV3ChugXIpg2Zq8gs9eqzCOdczdl8i
         9m/EtKzSeZhpvp5ipSXxlg9w2elpwz/breI49zSQ3Iz0pt9H7aS8CTZXkIJ7tosVbaI4
         3dWXHO86BWdRhuA02nIJ1etuIc5DVeNhfQsJjKc6lrqB22mhZw/TLS8fBXvyXWQzqsE+
         5LDu9Vn3Z2TvN588015fmHwzi3/5/uP462I1JIkda5Ld/DL41cay6nOF6HcrWI/mDGWN
         NmJg==
X-Forwarded-Encrypted: i=1; AJvYcCVxL4PkSXTANo7ycduyTSY6VLlJditKQ9dl6HilcxmQt7AjYGxO7l+qfc3z8pc/+vUchslVAPlThBRykktUfGt5Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKwEGDHyMhsfgd+1HhksjkrigeSEojHCUqc/mNIKY2WXbnknNK
	loOZMbglUf9XRxEHs9BQvSsZUsyECASwtVbwoSkZbv1PpyB15SDL0CWY
X-Gm-Gg: ASbGnctfR6V8BUz5aKTLtE+j1fuZXjwRm9wztqTnCD1coK5n4ca1nK2U5e9NH+yjCVO
	UPQqu7MC2qhW+M0XdZReWEl/9kE+i71XvhBtIp+3Qnf8xeNxxZEqvMk7/uSfuSt/Xtvi3NFwqqZ
	uocGFNnKrAYpDGJZ0Gv5MHrVT/2BvzJ+XC5f5wnOnEUWMWUhiRDHezHdb9E2hOIqZLo1FrFfCt6
	57xzD9DTT+wa0eMHPeN6GQpeG4fRNbfZONmUr2YxU6mbMzIIQH5IEmSh6aNi/f8Ba/56QCgzGHr
	R3XzqSE1g9qzW20QAuN+LxTk7+LBj/HsGQHnWvaihhhRpdXu+Pqtnxz9d3WOlahrTNb1OKQcY+B
	YTjboaByLEd9c9NhTzlgd28er8toQY1t58wvMyEy/OVZ6UVaC9avGhyXUCOwnWyMQZHw890P6lq
	P4zkTIE3gQZUw/OS2pW1gzLzrI9qHBcdvw118KKCDFzPCkCwlGbfFEFjUnT8/dXuKZW4NtWGM=
X-Google-Smtp-Source: AGHT+IHuRhTGUiR2NIlai1bZW5SqOJBWIIwWKnWsf40J77cS2AzqDsRE/KFfqvOf5LEZ0cNzAruVbA==
X-Received: by 2002:a05:6000:1ac8:b0:3ea:bccc:2a2c with SMTP id ffacd0b85a97d-429bd6726a2mr523089f8f.11.1761847099845;
        Thu, 30 Oct 2025 10:58:19 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772f53aad6sm15098055e9.13.2025.10.30.10.58.19
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
Subject: [PATCH v2 11/13] serial: sh-sci: Add finish_console_write() callback
Date: Thu, 30 Oct 2025 17:57:59 +0000
Message-ID: <20251030175811.607137-12-biju.das.jz@bp.renesas.com>
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


