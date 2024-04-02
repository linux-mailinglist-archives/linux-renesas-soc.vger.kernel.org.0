Return-Path: <linux-renesas-soc+bounces-4202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C2895007
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 12:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DA08284802
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 10:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3A35B5D3;
	Tue,  2 Apr 2024 10:27:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE25A11A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053654; cv=none; b=N46eH3oxpTdlaihy9XIaKN+H1ErIFDekqqKeTpDb6WGmeFxQFusNRIduZGLl/oxBxV+P2VO46bkgqAvkMGBezPEvpfPQOQ3Eo0wUry3twtmPK/nZeb/kEtk7F1MDJPg5e+rWUTEjpJCwp4QDmHFkMdK0i7qW3Xt50SUSDoZANX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053654; c=relaxed/simple;
	bh=Ur8QGFlLRmoWaEUYr2Lap6MK6yIwJ0oEKyL+qpn4irY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lo6h/ShJ6jfmEKqBPG0zHfarHCJNQXZhd8yCUUrF+OHWSfA1k13Sw14R7tUNFyn33pUWs8zZCTsBr80Kx8vrnLgGQ+2RX3/Cx78YidZzg+T7Q/gZTBzWWZRMzEj5qUhqMfY4677efT7jbioM3G9SWZVItMzGvNVR/1kDMyGt/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id 6ATW2C0060SSLxL01ATWln; Tue, 02 Apr 2024 12:27:30 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbM6-00FYU3-Mm;
	Tue, 02 Apr 2024 12:27:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrbMY-009Vqa-0y;
	Tue, 02 Apr 2024 12:27:30 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/2] arm64: renesas: defconfig: Updates
Date: Tue,  2 Apr 2024 12:27:26 +0200
Message-Id: <cover.1712053450.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Regular updates for the defconfig for Renesas ARM64 systems.
As usual, these are not intended for upstream merge, and to be applied
to the topic/renesas-defconfig branch.

Geert Uytterhoeven (2):
  [LOCAL] arm64: renesas: defconfig: Revive kexec
  [LOCAL] arm64: renesas: defconfig: Refresh for v6.9-rc1

 arch/arm64/configs/renesas_defconfig | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

