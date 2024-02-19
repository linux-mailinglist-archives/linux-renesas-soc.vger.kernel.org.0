Return-Path: <linux-renesas-soc+bounces-2956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF185A6B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 16:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567C51F21C31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 15:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044983770C;
	Mon, 19 Feb 2024 15:00:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F237702
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354854; cv=none; b=fV0HXxPsGH+EfeguwuoDR6uBq6VwIUgtV4S4DY6bo/ZhsjUyFHWUliR0tvWoaKvB3Te0vHroQSmHsRpqCxsBzxYosEDnREUK23L+/V4euxg+c1IntGJY0P4Lt4FFPMRwVTqrFmYwN3iZVXY14/0Rke6SbnjAGIbF8h0UfijaymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354854; c=relaxed/simple;
	bh=Zp5qDuIZVt2prZCG4UykMngYUeQc3O1aiZjKbIcjcVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=idrm4ImQ4jZSDW4UTl/uht8igVQInx6HNdnJ/MoWHc9nnUVwArP5U4cdiWAQ9+2fP8U7IiE/jmm37TUfnjDcZrSTGnCP0VzyyAoldvV8LJ3fc+K+LwGwwtlKzBr12VJQqiNTpERr8gH7S4mGwnBlDxLyiPWZ6tKZRAJmbNi1MjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a66f:1f5b:42c8:e3c5])
	by baptiste.telenet-ops.be with bizsmtp
	id p30l2B00C1N8lK50130lQ8; Mon, 19 Feb 2024 16:00:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc58H-0016gR-9g;
	Mon, 19 Feb 2024 16:00:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rc58P-007Th1-2K;
	Mon, 19 Feb 2024 16:00:45 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0/gray-hawk-single: Add RPC and QSPI FLASH support
Date: Mon, 19 Feb 2024 16:00:39 +0100
Message-Id: <arm64-dts-renesas-r8a779h0-gray-hawk-single-Add-RPC-.1708354463.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds SPI Multi I/O Bus Controller (RPC-IF) support for
the Renesas R-Car V4M (R8A779H0) Soc and QSPI FLASH support for the Gray
Hawk Single development board.

This has been tested on Gray Hawk Single (QSPI read speed is ca. 2.4
MiB/s).

I intend to queue this in renesas-devel for v6.9.
As usual, I have updated my topic branch at [1].

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/v4m-gray-hawk-single-v2

Cong Dang (2):
  arm64: dts: renesas: r8a779h0: Add RPC node
  arm64: dts: renesas: gray-hawk-single: Add QSPI FLASH support

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 33 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 16 +++++++++
 2 files changed, 49 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

