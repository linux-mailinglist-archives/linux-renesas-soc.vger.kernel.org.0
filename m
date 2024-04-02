Return-Path: <linux-renesas-soc+bounces-4216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED09D895701
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 16:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A6291C224E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 14:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F55136679;
	Tue,  2 Apr 2024 14:35:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8EC136672
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068503; cv=none; b=emaDDENdVMtRrwsOmIqSXJHf9S+wH3JeeAt/AkxR3f/uTcJ7AfpRQGTsFGClAjfEgMDlgT4F0cRZwETWslmCOGG28jhrLSrUl9+iCfzZWfIywpvvrpxslFus5f2vGcCsERqLjr7JQHwwQXBVkoQ4pI1Oq/RsE9WCzhKREJ8MyJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068503; c=relaxed/simple;
	bh=wMMfPHbWsi0q50mEtrFoW6jVWlVzCyBy4CBg3M6T2hA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=djqCB2diilH8irivFDTLQM3rXdv4LTU1NLYejYbJdv9SyyZUi8Ub/CSKRB79OP/8otnacEQKeYVtCW9JI2WXnLk2IAuXp42pNUOyek6MmYv8LMRSo3vu0e7gqaBPkknyO9cIsu+qshK47aDkKYDYgd/ZPvr23483HPT1RTjlnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id 6Eay2C0090SSLxL01Eayhb; Tue, 02 Apr 2024 16:34:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfDa-00GBGH-Vz;
	Tue, 02 Apr 2024 16:34:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfE2-009rNP-8v;
	Tue, 02 Apr 2024 16:34:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: gray-hawk-single: Enable nfsroot
Date: Tue,  2 Apr 2024 16:34:56 +0200
Message-Id: <0c291919071350674648317f8cf3efbd1ca4475f.1712068442.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the default kernel command line for Gray Hawk Single for mounting
the root filesystem via NFS, like is done for all other Renesas
development boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.10.
---
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index acf1d625ec410e55..cfbe8c8680cd8947 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -23,7 +23,7 @@ aliases {
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:921600n8";
 	};
 
-- 
2.34.1


