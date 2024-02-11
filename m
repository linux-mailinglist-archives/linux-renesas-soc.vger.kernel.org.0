Return-Path: <linux-renesas-soc+bounces-2593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E18509A2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 15:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEDC7281E75
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 14:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6422570;
	Sun, 11 Feb 2024 14:31:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ED9620
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661870; cv=none; b=B+OIRMw4zjYtH079acCk3Oxe5/0Nv6Fp0lgy32iEF6SQNnbk2dt9TmNcCN+T7QH42bdGFTUBWT+NzEF0ZBfAB3v6maMG9nQhqCuW0mSmXrTiwiFKUUySQWh2bc5m5fpd8hEAq3GcK9syEeKL7I4GcO5Det3qZQLwIjw9KbnfH98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661870; c=relaxed/simple;
	bh=N2qRHEkHc3JS3Qu6svAtIyjgbZjn8AfeKEjzWeFIPpU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G4yXBw5NuffVoaWqCY1kJABzbbh8XUQsoKXCFZWA6NmVUgKtFVrTiX8cVywlxmTOjwuPTGjJsJ0plYG2jvq+PXp9WTsASKUzH3OoAAcz64FE+jt2ZyypgP5EGfdbkh3kOkCq1sRH1TKQUIv9CUXa1YqnMCBQ4aU4jwIclrVUV6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5c16:aeff:e73f:ad67])
	by albert.telenet-ops.be with bizsmtp
	id lqWz2B00H493aJM06qWzXK; Sun, 11 Feb 2024 15:30:59 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAr8-000Qhe-H4;
	Sun, 11 Feb 2024 15:30:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZArD-006Wue-E9;
	Sun, 11 Feb 2024 15:30:59 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0/gray-hawk-single: Add Ethernet support
Date: Sun, 11 Feb 2024 15:30:44 +0100
Message-Id: <arm64-dts-renesas-r8a779h0-gray-hawk-single-Ethernet.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds Ethernet support for the Renesas R-Car V4M
(R8A779H0) Soc and the Gray Hawk Single development board.

This has been tested on Gray Hawk Single using TFTP.

I intend to queue this in renesas-devel for v6.9.

Thanks for your comments!

Thanh Quan (2):
  arm64: dts: renesas: r8a779h0: Add Ethernet-AVB support
  arm64: dts: renesas: gray-hawk-single: Add Ethernet support

 .../dts/renesas/r8a779h0-gray-hawk-single.dts |  37 +++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 144 ++++++++++++++++++
 2 files changed, 181 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

