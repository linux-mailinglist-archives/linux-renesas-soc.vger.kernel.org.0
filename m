Return-Path: <linux-renesas-soc+bounces-1859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 997CE83D88B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 11:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C2851C25195
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 10:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81991427E;
	Fri, 26 Jan 2024 10:56:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC34512E4E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2024 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706266611; cv=none; b=tSixtdN5W6H85FuVFizzaCGezinF5wFrAtEVTwXoejIc/o4fmAx4ymmzSk3qWs/VK3BJYr3RynM+dwJh2+4GNzA2E/Irxie5N1vybEVTbVZC6BPoBKYCaeBCd9tl7iAYNAUJG5v9O7BWbeRH7lJstzesDs1lO8z6hKrHBXkKUxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706266611; c=relaxed/simple;
	bh=B9YqpNqanOxGnqv2eSgLBsxguUjZpBi92mZyRpE6ENU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k2WPqBjiK7ElzQBR5KlmZanNso3aJnIf7d4C/PmINBTnpBkgCD/MupvgX6SgBMb/07BoceWokqJRmos7zr0A6C6Pssmauc9K1+PKjg91EJeqIqqvZoLFieiRQQ/vUwGCEmHPjkn+X4w14pY1VRiHNhKDAa6PuqeBMbXf+8uQo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8d64:ae04:ce87:de06])
	by albert.telenet-ops.be with bizsmtp
	id fNwm2B0071AdMdB06NwmNC; Fri, 26 Jan 2024 11:56:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJsJ-00GWgK-VN;
	Fri, 26 Jan 2024 11:56:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rTJrQ-00G5bt-DW;
	Fri, 26 Jan 2024 11:55:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0/gray-hawk-single: Initial pin control support
Date: Fri, 26 Jan 2024 11:54:56 +0100
Message-Id: <cover.1706266286.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds initial pin control support for the R-Car V4M
(R8A779H0) SoC and the Gray Hawk Single development board.

To be queued in renesas-devel for v6.9.

For testing, I have updated [1] accordingly.
Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/v4m-gray-hawk-single-v2

Geert Uytterhoeven (1):
  arm64: dts: renesas: gray-hawk-single: Add serial console pin control

Hai Pham (1):
  arm64: dts: renesas: r8a779h0: Add pinctrl device node

 .../dts/renesas/r8a779h0-gray-hawk-single.dts  | 18 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi      |  8 ++++++++
 2 files changed, 26 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

