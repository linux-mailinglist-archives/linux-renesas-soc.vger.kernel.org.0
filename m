Return-Path: <linux-renesas-soc+bounces-16625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE0AA707D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 13:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 071CA1C00097
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 11:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD70230D1E;
	Fri,  2 May 2025 11:13:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466919D07B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 May 2025 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184422; cv=none; b=FSd2g4ay5SOiJEHKLssO2VpsBQq8XObBxkGL6+52OoMaPNGjObCSzzjvYOmA8XDK3CF7z6JbW966Ja1zdx0Znh6ZNA4CkfVP864wPEDyDErDMiXBLILn7n7y2m73H1D9kMGu6I7e+bY6MJ/GzkeqCq6Q618YpQDDXqS4+zPJenc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184422; c=relaxed/simple;
	bh=tjBCAb/DLkfP5OBG9sx5z+XWVL2yHRxWf7h1YKj3rOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3QTxoxZPzlqr6YzIWVTal4cp6qbjmsON+2Q6Lrpeb5/vWSl105Rgf/zOEB+nv+5Lg0TJ8synftNlwkJMNknSsEg8y09UC2O0cWgNZ7DLv+uHL3/c0J1Ohapg6XzB8Mk+Pyxg+tneVhnqz+CZAexFUoD2fAjwCzZust7e/VI/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:df64:35e8:502:4ac0])
	by andre.telenet-ops.be with cmsmtp
	id kBDd2E00D4sst1101BDd7C; Fri, 02 May 2025 13:13:38 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAoKi-00000000WaV-3lh9;
	Fri, 02 May 2025 13:13:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAoKn-00000008p5y-1DQS;
	Fri, 02 May 2025 13:13:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] sh: ecovec24: Make SPI mode explicit
Date: Fri,  2 May 2025 13:13:36 +0200
Message-ID: <430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cf9e4784f3bde3e4 ("spi: sh-msiof: Add slave mode support") added
a new mode member to the sh_msiof_spi_info structure, but did not update
any board files.  Hence all users in board files rely on the default
being host mode.

Make this unambiguous by configuring host mode explicitly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/boards/mach-ecovec24/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 6f13557eecd6bb21..a641e26f8fdf7369 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -825,6 +825,7 @@ static struct spi_board_info spi_bus[] = {
 /* MSIOF0 */
 static struct sh_msiof_spi_info msiof0_data = {
 	.num_chipselect = 1,
+	.mode = MSIOF_SPI_HOST,
 };
 
 static struct resource msiof0_resources[] = {
-- 
2.43.0


