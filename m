Return-Path: <linux-renesas-soc+bounces-4393-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3F89D33E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 09:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 950181F2198D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Apr 2024 07:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1357C0AB;
	Tue,  9 Apr 2024 07:33:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70817CF1B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Apr 2024 07:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712648015; cv=none; b=ssB0fOHgzWEc0WIfEuINkg5q5aJrFeOhdZZL6u3WfFoBDvUccX9nHuUtPf7g3EWVjJS21YgyHICP5rf5t/yulhspWJQre9z0OzSKEDo3ar5sUEUlrdLjXoWLZD65AY4d4vkHytpLZU+u/J3NGN0tU5o7BK3PutzeppA+MLwq1E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712648015; c=relaxed/simple;
	bh=tN0nE8LUqZwxfe8aZWV+fQwvtzpJWwZt0NKxx6UaNnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B0LdLmYp2knHMhA8Z/exnysHrq06eBhCYralrU8gfzIIxz7sYpWWaIpnzkd7NsJ7OqfzlsGLPcjwMIwok++SRlr5cbAOMYaJt+SwOI7+rtQiH/5D4z3uwjE+R4zi6DdRIkJCDOPhiN99VKq9jsjotYep6IgCWtel7ckklBgYtsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id 8vZV2C00W0SSLxL01vZVcb; Tue, 09 Apr 2024 09:33:30 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ru5yU-00CkPz-7Q;
	Tue, 09 Apr 2024 09:33:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ru5yz-001792-O8;
	Tue, 09 Apr 2024 09:33:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: s4sk: Fix ethernet0 alias
Date: Tue,  9 Apr 2024 09:33:28 +0200
Message-Id: <2f62c29e4222387a95ebadc65ba90a0cdea9b78c.1712647914.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

U-Boot uses "ethernet0", not "eth0".

While at it, fix nearby whitespace errors (TAB instead of space before
equal sign).

Fixes: 93be50c7ff8e8087 ("arm64: dts: renesas: Add R-Car S4 Starter Kit support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.10.
---
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index abfda5c6ca16922e..bc65a7b4d999740c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -14,9 +14,9 @@ / {
 	compatible = "renesas,s4sk", "renesas,r8a779f4", "renesas,r8a779f0";
 
 	aliases {
-		serial0	= &hscif0;
-		serial1	= &hscif1;
-		eth0	= &rswitch;
+		serial0 = &hscif0;
+		serial1 = &hscif1;
+		ethernet0 = &rswitch;
 	};
 
 	chosen {
-- 
2.34.1


