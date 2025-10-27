Return-Path: <linux-renesas-soc+bounces-23657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B81C0F0E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 16:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 903EA34ECD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CDB3148A5;
	Mon, 27 Oct 2025 15:46:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3834631618B;
	Mon, 27 Oct 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580001; cv=none; b=mNFlUIsnuuI4EYm6kBAtz3x25KqMOZC3G/044tyvU4zHRmRLOOEEJZyS85X4eqidOGAa84jc92ssxEs5C3E8HeNXTQheK/41QJJfixzOM8mCH1oRaC2HP2/7mgKyOpAn1mNY3/VIclC7gSw1makjwQE1ErC9vCbB8IZHwoLBdPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580001; c=relaxed/simple;
	bh=d8OqSwYQl0teCKOFq/juUjjOiZghD/3fHYJDlNef8Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+Ls9PXD+BvN9CGq95ajuaKduqf/Yc5q13qRV3DB1WDBX4qqC6pBaQwW8GZSIRak8hBfIr2qy2Im6NUaJKC/l0PFN4NHDwO3bbSSN8NCTnvr7thaLTTe0os2EU+IbjjnVSS6QwzytSylSUYKn5nRTFsiaL76hyKO7DvBaLwEzWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: dyn2kJwTQSyFe/TbaPR0nQ==
X-CSE-MsgGUID: 5UUUIdwhSSOD4caXKFg1jA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Oct 2025 00:46:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 33E434003EA1;
	Tue, 28 Oct 2025 00:46:34 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH 04/19] serial: sh-sci: Fix deadlock during RSCI FIFO overrun error
Date: Mon, 27 Oct 2025 15:45:51 +0000
Message-ID: <20251027154615.115759-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RSCI IP, a deadlock occurs during a FIFO overrun error, as it uses a
different register to clear the FIFO overrun error status.

Cc: stable@kernel.org
Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/rsci.c          | 1 +
 drivers/tty/serial/sh-sci-common.h | 1 +
 drivers/tty/serial/sh-sci.c        | 8 ++++++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index b3c48dc1e07d..3e1f4b3c4e59 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -414,6 +414,7 @@ static const struct sci_port_params_bits rsci_port_param_bits = {
 	.rxtx_enable = CCR0_RE | CCR0_TE,
 	.te_clear = CCR0_TE | CCR0_TEIE,
 	.poll_sent_bits = CSR_TDRE | CSR_TEND,
+	.overrun_clr = CFCLR_ORERC,
 };
 
 static const struct sci_port_params rsci_port_params = {
diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index e3c028df14f1..bcdb41ddc15d 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -51,6 +51,7 @@ struct sci_port_params_bits {
 	unsigned int rxtx_enable;
 	unsigned int te_clear;
 	unsigned int poll_sent_bits;
+	unsigned int overrun_clr;
 };
 
 struct sci_common_regs {
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 62bb62b82cbe..b33894d0273b 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1024,8 +1024,12 @@ static int sci_handle_fifo_overrun(struct uart_port *port)
 
 	status = s->ops->read_reg(port, s->params->overrun_reg);
 	if (status & s->params->overrun_mask) {
-		status &= ~s->params->overrun_mask;
-		s->ops->write_reg(port, s->params->overrun_reg, status);
+		if (s->type == SCI_PORT_RSCI) {
+			s->ops->clear_SCxSR(port, s->params->param_bits->overrun_clr);
+		} else {
+			status &= ~s->params->overrun_mask;
+			s->ops->write_reg(port, s->params->overrun_reg, status);
+		}
 
 		port->icount.overrun++;
 
-- 
2.43.0


