Return-Path: <linux-renesas-soc+bounces-31944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CchBauY+GmcwwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 15:01:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B65584BD59F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 15:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 200D63020024
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 13:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14463D47B5;
	Mon,  4 May 2026 13:00:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94563A75B6;
	Mon,  4 May 2026 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899613; cv=none; b=qajgp79ciBgYSlAY/nX7jCk6LvVfvgVeGu5L9yGmIZht20+kKoLYYDuLRCgGbRX653C86oH+fGzwO1l/h5cXIFqdJnbBfx4hZMwJWxn1Ff33+VgDox+JUlzqIqkzFC1wN3ut2rg9WsItrRBGlPUUBTsh6yCiQ5d51kBhYnChPXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899613; c=relaxed/simple;
	bh=78C0iIpHwaY1z055Q60sRTW3KuphQTn9gwpSmEjxuYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jFz//GWcdOGWdXnlYia2F8Y+DLj4LE0gXR1uzpigpRBKDZQ0yN5msnXq6WmZOYIjs8vW2yFYN5g4dwpuT2HbNrS/1ZI15ncfuCJjCekPYDCfeBtqiXXeQSOz1hmBnw0QRoAwq1EuK3Hwf66z+WjJ43oWHL1VKwH3j277kzFvXb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18410C2BCB8;
	Mon,  4 May 2026 13:00:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL]  Renesas SoC fixes for v7.1
Date: Mon,  4 May 2026 15:00:09 +0200
Message-ID: <cover.1777899408.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B65584BD59F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31944-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	RSPAMD_URIBL_FAIL(0.00)[linux-m68k.org:query timed out];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[geert.linux-m68k.org:query timed out];
	NEURAL_HAM(-0.00)[-0.636];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:mid]

	Hi SoC folks,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v7.1-tag1

for you to fetch changes up to 7e070a14beaf036588f164575bbaf7011dd26285:

  arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst (2026-04-27 11:14:31 +0200)

----------------------------------------------------------------
Renesas fixes for v7.1

  - Fix SCIF (serial port) clocks on R-Car X5H,
  - Fix various dtc and dtbs_check warnings.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks

Marek Vasut (10):
      arm64: dts: renesas: draak/ebisu-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: salvator-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: rz-smarc-cru-csi-ov5645: Fix missing cells and reg in CSI2 subnode
      arm64: dts: renesas: rz-smarc-du-adv7513-smarc: Fix missing cells and reg in DU subnode
      ARM: dts: renesas: r8a7778: Add missing unit address to bus node
      ARM: dts: renesas: r8a7779: Add missing unit address to bus node
      ARM: dts: renesas: r8a7792: Add missing unit address to bus node
      ARM: dts: renesas: r7s72100: Add missing unit address to bus node
      ARM: dts: renesas: genmai: Drop superfluous cells
      ARM: dts: renesas: rskrza1: Drop superfluous cells

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}phyrst
      arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts                | 3 ---
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts               | 2 --
 arch/arm/boot/dts/renesas/r7s72100.dtsi                      | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi                       | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi                       | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi                       | 2 +-
 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso | 5 +++++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi                    | 8 ++++----
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi                   | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi                   | 2 ++
 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi     | 5 +++++
 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi         | 5 +++++
 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso    | 5 +++++
 13 files changed, 31 insertions(+), 13 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

