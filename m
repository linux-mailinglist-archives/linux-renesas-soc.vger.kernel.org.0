Return-Path: <linux-renesas-soc+bounces-4664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 496538A701A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 17:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE50B1F21F6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 15:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B563C131758;
	Tue, 16 Apr 2024 15:47:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052F1131753
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282459; cv=none; b=eGTSiGGBocBXVP9ZYcYb/jIsiMhBcpSnaCw/gU7qKFrxg8R1V7PpnOraH0DqwyIG/LOz9AYXnRV68gyVxHwkeWY4xjidL3JJqyTuEHNR0ClX62ZgpwdYyZvUCtnDCs8vPVHmmMvGN/n15YhqB0XeibDtVXimr4y4Thd2q46/ljk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282459; c=relaxed/simple;
	bh=lB4xOGyIbV5YZiyW2VRXAdid5Ao74yqlZKUWlHVBDSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xl54msC9sA4bZaAaVpSss8RAJUPFxzX99ZL+8g6fylTwrNTB69yYTNbBSWjQ6Xy4FtX5cB6YfLTQU74262+cjN7h7lK4r6QlxBynVQdWuBrHygGblY7G+CPKSAqdk6YNdM7c/oKk6EEU9NCUffIdyjemdgvDgCBQ8IeERtC0sa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by albert.telenet-ops.be with bizsmtp
	id BrnV2C00A0SSLxL06rnVYF; Tue, 16 Apr 2024 17:47:29 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwl1J-008J5q-NN;
	Tue, 16 Apr 2024 17:47:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwl1t-00Ebka-37;
	Tue, 16 Apr 2024 17:47:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] pinctrl: renesas: r8a779h0: Add INTC-EX support
Date: Tue, 16 Apr 2024 17:47:21 +0200
Message-Id: <cover.1713282028.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds support for pin control for the Interrupt
Controller for External Devices (INTC-EX) on the Renesas R-Car V4M
(R8A779M0) SoC.

I plan to queue this in renesas-pinctrl for v6.10.

Thanks for your comments!

Geert Uytterhoeven (2):
  pinctrl: renesas: r8a779h0: Fix IRQ suffixes
  pinctrl: renesas: r8a779h0: Add INTC-EX pins, groups, and function

 drivers/pinctrl/renesas/pfc-r8a779h0.c | 136 ++++++++++++++++++++++---
 1 file changed, 124 insertions(+), 12 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

