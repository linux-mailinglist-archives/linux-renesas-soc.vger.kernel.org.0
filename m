Return-Path: <linux-renesas-soc+bounces-24655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E348C5CBC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 12:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B98E34E039E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F893164C7;
	Fri, 14 Nov 2025 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW+hYQiM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29D31577E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117537; cv=none; b=TlKF3n3EQ8LToEEromsp8vEpX0wVlhFdpDybmxXygNTK36nGt8XJnUOw/fXnSi95M3PFeOpSSzS21bCq4UAAXrkfJluuoyG2uB2AczMThAa6MSCQn3Q5zU+rKeFHzNDTza4YYsUXSNNwIof3KhVVOvseZNXBPaCRxqW3oQES9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117537; c=relaxed/simple;
	bh=kZoNkXgOK5bPCHyxt2VA23mgi202ylSEj8OjJso4u5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqiRsP83kjAgRvgyK9MAY/rbAJ3XNq4T15A76UmaLKMRgugh1YOnlmr0iNaiItVpMmk4tOPSmkcFgmaqSKJ7oM4oiUMTYJDDQok7A2yzjV7RA156nbN+d8miLUpkgehIkPWMTsIc/eVmJ2PnqLJexJAhuFxrGiCKTRWuR9XKy9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW+hYQiM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c8632fcbso1306203f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117532; x=1763722332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2f1hrtdOgHB+cZ58s64lvGyaNvO528/Gm1Zm08fZHhY=;
        b=iW+hYQiM0VI29XaBpOdWMOjjdcEz7jbe7ITD1MRjo2et6SSiE5VcApPT11nzxiQujJ
         Gi6GDWPY4NicawZw+SrbzfYJRC2ORwdLDiVSQ4vDwCYJVe/OD4W9MS6kVsvqRSas9kL3
         WcJg07tmQIguelcnNeOfHZYLrPQV3gbyypbCNfRd7GCvHtPk75Dooc3SLKTVTZETHc+s
         g6gOU2CGAvsKY3aJ8FrrhDq2HIXc7TB8ohhnCCrQcTHXGdxaUXI7IoubgrCBKOju0d7+
         S0nZPqpqI86UbAAGO29qnBVHabth7kbjXBZmTIdvtIyn2UNjaKvKP3R55QHd7+e6j6It
         QbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117532; x=1763722332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2f1hrtdOgHB+cZ58s64lvGyaNvO528/Gm1Zm08fZHhY=;
        b=pqRsEdNlQSWUliHVzwDIz+JsCQCezh0GBClT1JMwBCPQVH5w4wIZHrE+TXia4ZEOaI
         HJ5VDeMZ+XZjzpuT2rlE2Mt5BhDyOx3dd37syyNVE656svSS23zbF+cEdGvAOGbp7Lgw
         yF2GarYX0QCvFZ0n0sLEHgZ+qAxxaj+KNkFhxuTsjn1Trp3/C9E/XTdMV1xzMPO4FaW3
         MjrlDl+itHn8muSHph1YstAGFBVvN48UdwvYNIc097VHEgBjts2FngyDfiYV8HqRx4rV
         ZyMFGxoWBQHokXijQegeCGPJUlI9ZiaWZ7QIZsusZSryth549CdHbDTYcPitK56bYtA1
         8zkw==
X-Forwarded-Encrypted: i=1; AJvYcCVpBkeWnpPtnCv8dB3LUOdZBRHu9yolyGHQXu0PpWgMvYkfk5YP+SR4P+ACE6qbXzLPhxZK8+6+TU3RqiNMhOktdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDf1h2qHrCX9+nYw6ZjOPAYTYfMF9ezt0A9//pmhbIengYGyr1
	CUfitrCPR1+sAAiTKPdVDcIoMFVIqJsGRpE8qx9NyDWIdUNZVU2OrEKH
X-Gm-Gg: ASbGncs3O1WeLwzyfZyyZseYdHImmfJmS7tmznjOo/93rkKy0lYUDTU/D3MlP0z4ols
	2qwogjUZsgPM4Ist/v5YLfTQgSPerWEqP883WiW997dP6pi0Ydh7IS1j9Phscniee+f/73NdDBJ
	a0AIyZnoWzAanhALmVEYY4wRUxESoVO1p117tTioCq1MImXf7scQzJLpefWebV6RXjwHq4sngcr
	9JyK7A1ffrltCWqenBwGd1NpbXumnO6ZKRDwFvEOfZY12lnIl4xk09UtllZvVpadIYuXVhK7UT1
	oHwu0fEgbMPkOw/HgCe+tp4XFsRknRsEG+vkxBPFA2gtRPTo5CdhdkV6gzDBa93KzSMeF2FWsjb
	pvMr3ToQpvxCLP52Zm54iMCIHxl5V9RPFGQOecXXtdzHED1jOLbJllId06JX8wwsayDE8f8YY5u
	/gIt/opNEIfH6GLrOXpw4cwdwU6JGoe1BNI/OZrJvVGvi81rXvSI5+j+xp9NipjbtgGabb6KH4W
	svInHu/YTZZrqCA
X-Google-Smtp-Source: AGHT+IHc+3zQOPHYh27ICavvHRoLPV7fV5gAdj66PKngODYp6s5toJxSvaZhvEzRDtYaUaQmY4XPGQ==
X-Received: by 2002:a05:6000:288e:b0:42b:3b55:8927 with SMTP id ffacd0b85a97d-42b5933919dmr2175294f8f.21.1763117531526;
        Fri, 14 Nov 2025 02:52:11 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:11 -0800 (PST)
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
Subject: [PATCH v3 11/13] serial: sh-sci: Add finish_console_write() callback
Date: Fri, 14 Nov 2025 10:51:20 +0000
Message-ID: <20251114105201.107406-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/tty/serial/sh-sci-common.h | 1 +
 drivers/tty/serial/sh-sci.c        | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index 41a437440dfa..4e6fee828243 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -94,6 +94,7 @@ struct sci_port_ops {
 	void (*shutdown_complete)(struct uart_port *port);
 
 	void (*prepare_console_write)(struct uart_port *port, u32 ctrl);
+	void (*finish_console_write)(struct uart_port *port, u32 ctrl);
 	void (*console_save)(struct uart_port *port);
 	void (*console_restore)(struct uart_port *port);
 	size_t (*suspend_regs_size)(void);
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index c7f8a9b470fe..e269f4f9edd0 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3436,7 +3436,10 @@ static void serial_console_write(struct console *co, const char *s,
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


