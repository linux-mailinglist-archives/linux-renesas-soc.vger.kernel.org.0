Return-Path: <linux-renesas-soc+bounces-4221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF01895759
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 16:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A02981C20A6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 14:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930498662E;
	Tue,  2 Apr 2024 14:44:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB031272C9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712069063; cv=none; b=Qu8GaMxMPo0RvcA1RMYrCsLHrHchY5qxJl2k89mcduC+LuNRscEksDsnp2oRjlWfwpdbI3o9hokNoTdV+IRfIdjVf+PVjGnRozAdYcxQMYrrSVktqbn6jdb8Re/G3bRr9q7LO45htYdhilK1zwARsAYnSXBK/xcX/P4l0HfkSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712069063; c=relaxed/simple;
	bh=O+8ARZdutSj9Uhl+VxiYTgGPsxjzkUrOBEkjBc6/7iw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FIvs6f7w8kCT/77k26Rs2AbgnKMXr1wanicjqa7Q5ZjJcaIeSy4bTfpFdH442XV7ID1RGvckkZNph6EL47pyqIsuIMb224YY17yeNEMWqa+2U4wQBsZ1XSBp9emzvHBynuYH094fK0oGTAog2SY2YKP5IlN+GZRifjRVv9AKbSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id 6EkJ2C00K0SSLxL01EkJcs; Tue, 02 Apr 2024 16:44:20 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfMc-00GCjI-TF;
	Tue, 02 Apr 2024 16:44:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rrfN4-009rU3-7N;
	Tue, 02 Apr 2024 16:44:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0: Add CMT and TMU timer nodes
Date: Tue,  2 Apr 2024 16:44:15 +0200
Message-Id: <cover.1712068688.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds device nodes for the Compare Match Timer Type0
(CMT0) and Type1 (CMT1/2/3), and for the Timer Units (TMU) on the R-Car
V4M (R8A779H0) SoC.  As usual, these device nodes are disabled by
default, but can be enabled in a board DTS file when deemed necessary.

All instances have been tested successfully using [1] on the Renesas
Gray Hawk Single development board.

I plan to queue this in renesas-devel for v6.10.

Thanks for your comments!

[1] https://elinux.org/R-Car/Tests:timers

Thanh Quan (2):
  arm64: dts: renesas: r8a779h0: Add CMT nodes
  arm64: dts: renesas: r8a779h0: Add TMU nodes

 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 144 ++++++++++++++++++++++
 1 file changed, 144 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

