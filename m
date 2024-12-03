Return-Path: <linux-renesas-soc+bounces-10858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259039E2778
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 17:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9EF2877F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 16:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA371F8AD8;
	Tue,  3 Dec 2024 16:30:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1691F8AD6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243435; cv=none; b=XalItLn20AhdNS7CnSMX1LYpfX//SkipdN5g92Kx43SCegqkxRbd3q5xOOi/xVwhlWqY0k/NcIEo9eIhiTCa+XDTTjCCRzq3UGj1WLpxKn2ICgHTmNz14726R1dp7IfXykWSy+hSHkN4phv4dAeSOdXOT/wM3K1XAtMaa6OEv9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243435; c=relaxed/simple;
	bh=efEEoBOf2SwuQHLH5bISaYZP/7dimPAqaCuzSBuWbsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xlw4XOltmfluP9O4J5SojeizYFtBUcbPrNoa++nGL8zFEPEMUkpV7wv7Hu6+S/I1qfUlJIMBYTVmIWQFEDBqzgkAWKj98BjPA77/rHDqxrIOcgWEGHE6ZXxz1hgVxA/P3DItOnAHFsBWNI22CcUCx1A6JcDnXAFR3au0N76B1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by andre.telenet-ops.be with cmsmtp
	id kGWX2D0053sLyzB01GWXK5; Tue, 03 Dec 2024 17:30:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVnD-000DVo-33;
	Tue, 03 Dec 2024 17:30:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVnC-00AXTD-W2;
	Tue, 03 Dec 2024 17:30:30 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Use plain struct copy in early_console_setup()
Date: Tue,  3 Dec 2024 17:30:29 +0100
Message-Id: <e097e5c11afe5bd4c01135779c9a40e707ef6374.1733243287.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using memcpy() prevents the compiler from doing any checking on the
types of the passed pointer parameters.  Copy the structure using struct
assignment instead, to increase type-safety.

No change in generated code on all relevant architectures
(arm/arm64/riscv/sh).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index df523c7444230836..1ed13ce2c2952547 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3542,7 +3542,7 @@ static int __init early_console_setup(struct earlycon_device *device,
 		return -ENODEV;
 
 	device->port.type = type;
-	memcpy(&sci_ports[0].port, &device->port, sizeof(struct uart_port));
+	sci_ports[0].port = device->port;
 	port_cfg.type = type;
 	sci_ports[0].cfg = &port_cfg;
 	sci_ports[0].params = sci_probe_regmap(&port_cfg);
-- 
2.34.1


