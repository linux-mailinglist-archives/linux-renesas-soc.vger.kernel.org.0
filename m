Return-Path: <linux-renesas-soc+bounces-13351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD71A3C213
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 15:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76BEB3AFAFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 14:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0C01F2B8D;
	Wed, 19 Feb 2025 14:25:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3B1F17E8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975109; cv=none; b=KwL/tTVv3Yd+Iss3i7bN3F+cqCECHG4AQ8QY+1mV/dNBfmwQOUAA5w5IxDTbSdpMlTLSsbS74rI5UGA6cAxTXOLhjF6wnPQ8yoNc4WsyZaXTBxduPwGdkzgem/Kin+q4PowghUYfjhR/qzThcUGXMI7l5seysPZoRZjPqQJUJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975109; c=relaxed/simple;
	bh=ltI4g7nPmJeeGqiwBzK/MJgSPoL3ykRP0wBimvKDGws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nVBkwXg8n5uqyDTAZFlofQFDXkpfdxWb1BkJL5PTz5OS0pQJvoyRJBmF7pvvcqW45qZbASBoPaBLycld4xbD2ihGeYO1fyktNDRET0YTcmK2UXUZm4kU/t2bI9I6wMsXGNp7mWoVbcTsNmPjrXQ4d1E8hmTOj7iT0O7dPO93tSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:47f6:a1ad:ad8e:b945])
	by baptiste.telenet-ops.be with cmsmtp
	id FSQw2E00557WCNj01SQwj5; Wed, 19 Feb 2025 15:24:58 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tkl09-0000000B3Sy-2RlP;
	Wed, 19 Feb 2025 15:24:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tkl0S-0000000BaPR-105W;
	Wed, 19 Feb 2025 15:24:56 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Save and restore SCDL and SCCKS
Date: Wed, 19 Feb 2025 15:24:54 +0100
Message-ID: <20250219142454.2761556-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On (H)SCIF with a Baud Rate Generator for External Clock (BRG), there
are multiple ways to configure the requested serial speed.  If firmware
uses a different method than Linux, and if any debug info is printed
after the Bit Rate Register (SCBRR) is restored, but before termios is
reconfigured (which configures the alternative method), the system may
lock-up during resume.

Fix this by saving and restoring the contents of the Frequency Division
(DL) and Clock Select (CKS) registers as well.

Fixes: 22a6984c5b5df8ea ("serial: sh-sci: Update the suspend/resume support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This can be reproduced on e.g. Salvator-X(S) by enabling the debug
print in sci_brg_calc(), and using s2ram with no_console_suspend.
---
 drivers/tty/serial/sh-sci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index df6512c9c0ff28db..70f34b8a93888eb9 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -109,6 +109,8 @@ struct sci_suspend_regs {
 	u16 scscr;
 	u16 scfcr;
 	u16 scsptr;
+	u16 scdl;
+	u16 sccks;
 	u8 scbrr;
 	u8 semr;
 };
@@ -3571,6 +3573,10 @@ static void sci_console_save(struct sci_port *s)
 		regs->scfcr = sci_serial_in(port, SCFCR);
 	if (sci_getreg(port, SCSPTR)->size)
 		regs->scsptr = sci_serial_in(port, SCSPTR);
+	if (sci_getreg(port, SCDL)->size)
+		regs->scdl = sci_serial_in(port, SCDL);
+	if (sci_getreg(port, SCCKS)->size)
+		regs->sccks = sci_serial_in(port, SCCKS);
 	if (sci_getreg(port, SCBRR)->size)
 		regs->scbrr = sci_serial_in(port, SCBRR);
 	if (sci_getreg(port, SEMR)->size)
@@ -3590,6 +3596,10 @@ static void sci_console_restore(struct sci_port *s)
 		sci_serial_out(port, SCFCR, regs->scfcr);
 	if (sci_getreg(port, SCSPTR)->size)
 		sci_serial_out(port, SCSPTR, regs->scsptr);
+	if (sci_getreg(port, SCDL)->size)
+		sci_serial_out(port, SCDL, regs->scdl);
+	if (sci_getreg(port, SCCKS)->size)
+		sci_serial_out(port, SCCKS, regs->sccks);
 	if (sci_getreg(port, SCBRR)->size)
 		sci_serial_out(port, SCBRR, regs->scbrr);
 	if (sci_getreg(port, SEMR)->size)
-- 
2.43.0


