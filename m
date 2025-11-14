Return-Path: <linux-renesas-soc+bounces-24635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D7C5C837
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043BB3B45C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A204B30F931;
	Fri, 14 Nov 2025 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKgS9BjP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE7030DEBB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763115239; cv=none; b=udUnI298V9gXuRAM2cHlOMIQ1ex7heaNqSs4z5CpvWoaXkulfzdM3U6mZd8T9o9N+YREjDWCZnn25bVIgrA8Ec6z5ZtO5rlKY23nW5q60AI/agkRtiCzO9dxZzmAK62pxAi6Sx8FrlW0ZJ+DPM++eNDpCsk2xqYLj+Jg2pxjHIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763115239; c=relaxed/simple;
	bh=d0pkjgunEzx13WUIALT9aumD+by6YT5fFu2YZ0/tu7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oInxbRqE+I18+3+t+CIw92f8HpuJ9pXTHzrvP7Q1u7E9e1WFeojtvinc87DPRquYD8b7xiZQt7YzWBAV53C+Z8VZuhBTl1YxddNUKO1L/lZw3k91uNkQTDe8yyBuJwO+ZaOfrl+4dBAl5wgrrh8Jdegyz4V/d+uSTJZxtVOl9ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKgS9BjP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775638d819so10344575e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763115235; x=1763720035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGBAsgxn8goZuL00+tYzFnNl6N+Ofr6aIgLUsJCCODo=;
        b=eKgS9BjPpm2z3k3gnFJt7ts4KPpmKGhGd6+wdFPH/lq3myCgcc9XARFPEhOw1qoRJB
         nMQ9HnWDNe9S6VdHip36WmlHwhcaz81P8q8rK2mzDoFjaNyt3c0VabR1HioHwK2nq9K2
         51RgWKUsmgvsoOd6DR7QSFXO56gNtHb9v5587lkBD9fIhIsxztboYuIRuziLx3C9fkFl
         rddflFfCrMFS5HmJZMLClXZeF8CwpQ7EzRGC0ivkkXIzVMPXnyUrn1I2tSC4XR62XcP0
         7nAzKt4mxwwWV7dadmOyO+jsp2mBNHke8iJufmZY0R0E0vM0r56SpJNqwu3TDo3lNtz6
         AzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763115235; x=1763720035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGBAsgxn8goZuL00+tYzFnNl6N+Ofr6aIgLUsJCCODo=;
        b=xAulYxdvo51zRUmYpK5EATz5vdT3RPE3u1m6dzCmKHDr+pGGF45PeH7N/EZWbQEhWo
         4mvHrNmvy+lAaMklpiwkr836qcTRIuLrQ3+HGCInScnl1EbxlL9NK6YwQD1fpHFXtgiK
         kADpRiBogTpTpFVTLiOKr/JvDd0DHt0UuLFkNxN5PdOwqtt1rjr29wUCswNA9SVbymQl
         qMtvuO4TvpSgEuu1oxGDwBU3DyokjjBEVHbPH1sL3aFVqCEWE5YHI7nymqQNpF27Lxgk
         bRNnjl+bgc2UddByvqEMNRSJNHepxiI5nbczsNXIoURJI2fHljBqqdNAflCTAQhz0FKE
         KLXw==
X-Forwarded-Encrypted: i=1; AJvYcCW6q9LxNxjKgdoZXzBVuorJlWe0pILjLB6ezRUZVO46kbmn2lNrgN5YiHvHH5/9+vaQnqHsBsFiYac8xgi+EiRkcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEiT/gMtQmU6h9g2lnK43Mz14pRqF9jrImFRarq+F4XDAeFPc5
	vpK1VYa+/aXe+DmDCqpcNRCwVwZ9yczUafpA5Dk4KqPcQAFHhMqJkejs
X-Gm-Gg: ASbGncviW4r6zXzA7RTq497zDJXLTrOEOx105vrGDZclIDkTku9R23nhIrID7gihN/6
	S6gVitTcMcFr9IOWMUrzw30S3za5ICs+smg4L7LnT8TJYEg8h1/otGd/iZt5Jq9p2pdRR8lZsSb
	PGnQqLps5aBJyVkyA+bc1CerbK4+8x2xEa9cJH5pQViB6gEd+DipTCaefI3CXqMGuh2C2CBaCWr
	pa521fWWHHTIYYmYV8+PPpO6lXfzQRplhdRRB53312UbtsnjTHSBjJs6X1MqUUoXUPXEJoAyNcy
	gY1YHH3m8CYxm5+DpBePWOmpQ2x7EdD27/wG0pn/vmQ0u+kkcHCiD4fXBgUaHCOtG90LVgFXIO3
	NvJh8HfdzQkIfFo2iuIQ6cmsO8con2A/9dN/xjpOG1p8JEqh4rNcJKRJN20Q4lNmDxwaQwjkJ2p
	/iR1sRq2t4exaie85PVbDtxHpX0Js6dfVTi73jjKU5ZJtQFZgffVj7ge4/aSluaG5ZbRZZ9+mnK
	6x27xbJv3CB/ElRvBD/ZcHmmWE=
X-Google-Smtp-Source: AGHT+IF3Hp2zi9egWQjUTP0dosC8tsLQkIB4YmHISF5XV4biOcIYmIf94xkl72U/X37QWsHQMM31TQ==
X-Received: by 2002:a05:600c:a06:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-4778fe5ef11mr24976475e9.7.1763115234842;
        Fri, 14 Nov 2025 02:13:54 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bae816bsm40685815e9.0.2025.11.14.02.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:13:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v3 2/2] serial: sh-sci: Fix deadlock during RSCI FIFO overrun error
Date: Fri, 14 Nov 2025 10:13:47 +0000
Message-ID: <20251114101350.106699-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114101350.106699-1-biju.das.jz@bp.renesas.com>
References: <20251114101350.106699-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

On RSCI IP, a deadlock occurs during a FIFO overrun error, as it uses a
different register to clear the FIFO overrun error status.

Cc: stable@kernel.org
Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped overrun_clr from struct sci_port_params_bits
 * All of the CFCLR_*C clearing bits match the corresponding
   CSR_*status bits. So, reused the overrun mask for irq clearing.
v1->v2:
 * Split the fixes patches from original series.
---
 drivers/tty/serial/sh-sci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b28711eeab71..53edbf1d8963 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1198,8 +1198,16 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 
 	status = s->ops->read_reg(port, s->params->overrun_reg);
 	if (status & s->params->overrun_mask) {
-		status &= ~s->params->overrun_mask;
-		s->ops->write_reg(port, s->params->overrun_reg, status);
+		if (s->type == SCI_PORT_RSCI) {
+			/*
+			 * All of the CFCLR_*C clearing bits match the corresponding
+			 * CSR_*status bits. So, reuse the overrun mask for clearing.
+			 */
+			s->ops->clear_SCxSR(port, s->params->overrun_mask);
+		} else {
+			status &= ~s->params->overrun_mask;
+			s->ops->write_reg(port, s->params->overrun_reg, status);
+		}
 
 		port->icount.overrun++;
 
-- 
2.43.0


