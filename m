Return-Path: <linux-renesas-soc+bounces-3910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D65880253
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 17:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7C11C22F10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 16:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293D35915E;
	Tue, 19 Mar 2024 16:30:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AAD8174F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710865800; cv=none; b=ePn5LK5lToBHVNb4j8JN0AzqHS8m7JMmqS5bY8OLTx+7eGZZvqe9Geo8TRjZu6Lwvp1/ug7qyv3oiXXsa89meC4wTF7ZWkTkxgc+f9AyC5v2NvdPbYY/dsAuTFfkzNteKCuiTuVxH6JF72f5XN8X4W+QHyMCEILsjAjGcMlLVYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710865800; c=relaxed/simple;
	bh=Cbp0vQwOz88gTydiclBB/DEC2XAZKz6yzOnV/0fc1Rk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ab2prUJoimuNYdSBm6nJzxIJaEXnbmxj1NJYNiId0OzPRQGKqxoA1aWEj0rM3gNqaUlDieiEwi67n3qg/vWKxnnO14Qst+ueDC/xsn1pWl59dE7Jbiq/cZEhMlLKIb+CyfH7H6bG5QGMeO0THDcb4K5abBItp22ktDTXnTcPQD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id 0gVx2C00H0SSLxL01gVxPl; Tue, 19 Mar 2024 17:29:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcLK-0046HQ-LL;
	Tue, 19 Mar 2024 17:29:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcLd-000pxA-Ht;
	Tue, 19 Mar 2024 17:29:57 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Enable TMU support on R-Car Gen2
Date: Tue, 19 Mar 2024 17:29:55 +0100
Message-Id: <b7b9fdd6f517a8b29bf5754e7f083d3b71805130.1710865761.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Renesas R-Car Gen2 SoCs have Timer Units (TMU).  Enable support for
them by selecting the SYS_SUPPORTS_SH_TMU gatekeeper config symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 90df78027995d9b1..3125ab575b60b8d1 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -28,6 +28,7 @@ config ARCH_RCAR_GEN2
 	select RENESAS_IRQC
 	select RST_RCAR
 	select SYS_SUPPORTS_SH_CMT
+	select SYS_SUPPORTS_SH_TMU
 
 config ARCH_RCAR_GEN3
 	bool
-- 
2.34.1


