Return-Path: <linux-renesas-soc+bounces-23666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3570C0F1E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 17:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F243E4FE9BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F7630E0EB;
	Mon, 27 Oct 2025 15:47:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171AF31E10C;
	Mon, 27 Oct 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580036; cv=none; b=CbyhGXUj/7bSNH2nL5Npq5ylSGGCZeRrcvlPy6poZEkFOSLo8uooYGXvykOe4gpBdMzU+IWvYX2qNgjm78d9TWWhbXoDu/XWoT7XRsBOWW77Iay+MeMstgOK6VS//CcinkBo8wNNJphZbf5lCX32Zl3hnfwOfD7S7+Evz6S34yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580036; c=relaxed/simple;
	bh=xZr0EHZ211QAg2vPhsdF6EMACS8r8WPOYJZsYbPNFig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9ImiiKenZkKGvy94nmpSiI9I6cDyz+7l5RnWDNyBkQ/o/URMNaRc7gAantRkH2vS9vQ+ZHFWUrNMAKi6K9VmYD55nIZf5v4wsZoEE3LnEm3M82V7lUd5Vyba/wUEKK4e6wWYbMCC/8/gKQv1NajtdMNUgI8/eLON0DJ64IzkE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: iVCgbZKXT+ywNPLZRYuvsA==
X-CSE-MsgGUID: gSyD8077Sl+6Vso/XHFjGQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Oct 2025 00:47:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5BD574003EA1;
	Tue, 28 Oct 2025 00:47:11 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 13/19] serial: sh-sci: Make sci_scbrr_calc() public
Date: Mon, 27 Oct 2025 15:46:00 +0000
Message-ID: <20251027154615.115759-14-biju.das.jz@bp.renesas.com>
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

Make the function sci_scbrr_calc() public for code reuse to support RZ/G3E
RSCI IP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci-common.h | 3 +++
 drivers/tty/serial/sh-sci.c        | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
index f730ff9add60..a3f4a76cdecb 100644
--- a/drivers/tty/serial/sh-sci-common.h
+++ b/drivers/tty/serial/sh-sci-common.h
@@ -171,6 +171,9 @@ void sci_port_enable(struct sci_port *sci_port);
 int sci_startup(struct uart_port *port);
 void sci_shutdown(struct uart_port *port);
 
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks);
+
 #define min_sr(_port)		ffs((_port)->sampling_rate_mask)
 #define max_sr(_port)		fls((_port)->sampling_rate_mask)
 
diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d45bdda2b6c1..e478286229f6 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2395,9 +2395,8 @@ static int sci_brg_calc(struct sci_port *s, unsigned int bps,
 }
 
 /* calculate sample rate, BRR, and clock select */
-static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
-		   unsigned int *brr, unsigned int *srr,
-		   unsigned int *cks)
+int sci_scbrr_calc(struct sci_port *s, unsigned int bps, unsigned int *brr,
+		   unsigned int *srr, unsigned int *cks)
 {
 	unsigned long freq = s->clk_rates[SCI_FCK];
 	unsigned int sr, br, prediv, scrate, c;
@@ -2461,6 +2460,7 @@ static int sci_scbrr_calc(struct sci_port *s, unsigned int bps,
 		min_err, *brr, *srr + 1, *cks);
 	return min_err;
 }
+EXPORT_SYMBOL_NS_GPL(sci_scbrr_calc, "SH_SCI");
 
 static void sci_reset(struct uart_port *port)
 {
-- 
2.43.0


