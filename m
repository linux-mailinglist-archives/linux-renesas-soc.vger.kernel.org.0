Return-Path: <linux-renesas-soc+bounces-26003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1988CD651C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62E483050CF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131E7283FE5;
	Mon, 22 Dec 2025 14:02:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DDC27A92E;
	Mon, 22 Dec 2025 14:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412137; cv=none; b=gGh76RLg7cWfpQ3SoNejUNpDBYMH7Vd+mrDhgfd9ExZBXxjf/w0GhoHIYhEp1Xz6529tfL5T4Osxzl0NiAb38LWmy6p65i7AYkr2zfT4S3e0bKtEa7l4ZCEz3evUkgRwl65PkrNAGAYuVrcda7Y7XK53jo38jQ8yajSqu5F2K20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412137; c=relaxed/simple;
	bh=30PIBBllgHlH+w8eD9gk/pW/e26+w42xivZbRYfVEoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4p+lDtCnrZu8NgujwZg7rK5af4piLfnpy8szrgi6yB75WCXGLtcxosO27V+DSF6lnN4rW/A4nqJW7zl6frCkcUsUOw2KohocnNHaGXWejNSPf8LDyld64ISExPb0amXQX4Vvk6sAkNJSrK7FzkbEflpV8sA40jIA6NcDtHih38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FF2C2BCB9;
	Mon, 22 Dec 2025 14:02:14 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: rsci: Convert to FIELD_MODIFY()
Date: Mon, 22 Dec 2025 15:02:09 +0100
Message-ID: <ada3faf4698155a618ae6371b35eab121eb8b19c.1766411924.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the FIELD_MODIFY() helper instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/rsci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
index 1ef7c6d61707805f..c3f12df693ad273e 100644
--- a/drivers/tty/serial/rsci.c
+++ b/drivers/tty/serial/rsci.c
@@ -207,8 +207,7 @@ static int rsci_scif_set_rtrg(struct uart_port *port, int rx_trig)
 	else if (rx_trig < 1)
 		rx_trig = 0;
 
-	fcr &= ~FCR_RTRG4_0;
-	fcr |= field_prep(FCR_RTRG4_0, rx_trig);
+	FIELD_MODIFY(FCR_RTRG4_0, &fcr, rx_trig);
 	rsci_serial_out(port, FCR, fcr);
 
 	return rx_trig;
-- 
2.43.0


