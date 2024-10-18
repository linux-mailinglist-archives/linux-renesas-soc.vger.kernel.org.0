Return-Path: <linux-renesas-soc+bounces-9838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D069A3A2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 11:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5FE21F27430
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 09:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208FF1E1C2C;
	Fri, 18 Oct 2024 09:38:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9248179965
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729244328; cv=none; b=G341q9Ia3siJqfjvsNw0xc2vFKbJ+rfU100zg2E36KkGQ81Bct7xTVfd/ODB70t3GAu1hLElgdbS4yOq21v5qEYogDgovrvWlxmewPb2HrO8tp2wJvIQRr0xNHAmOdXFEFHaB53hMiQjiaf5gckc7XjzhEBFQ+zWD8vdEdfVeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729244328; c=relaxed/simple;
	bh=/NIdmPbNdK9ns8tgnzaFmA0yyVk9D2L5Ftpl1oWWDWo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tb+xseUqSX0G+UUURqwY2qMbdiZFj04aG6nfZP0JMS6IdB4UqL/kzV1dYwERnHHRQV5kvGtdqokzl882ch8Ai1nd1kFmAp2oeory6sAOZ6RknBgOkTfxoaZtTsWE1JNOiC4vSZzOKQ9aDhw0XxzPVdiLRrU6KB3zdK3LfF3F7xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4XVKJ139YDz4x5vv
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 11:33:05 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by xavier.telenet-ops.be with cmsmtp
	id RlYx2D00L1MdCM201lYx4f; Fri, 18 Oct 2024 11:32:57 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1jLe-003zIF-Il;
	Fri, 18 Oct 2024 11:32:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1jLt-005rrc-Gv;
	Fri, 18 Oct 2024 11:32:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP output support
Date: Fri, 18 Oct 2024 11:32:49 +0200
Message-Id: <cover.1729240989.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

As I had to test Tomi's WIP patches to add mini-DP output support to
Gray Hawk Single, I moved my (old and new) DisplayPort gear to my board
farm, and thought this was a good opportunity to test mini-DP output on
White Hawk as a baseline (CN5), and add support for the second mini-DP
output on the White Hawk BreakOut board (CN15).

For testing, I used the following hardware:
  (A) BenQ BL2420PT desktop display (2560x1440),
  (B) Joy-It Joy-View 15 portable display (1920x1080),
  (C) Lindy DisplayPort to 2 Port HDMI MST Hub,
  (D) Passive mini-DP to HDMI cable,
  (E) LogiLink Mini DisplayPort to VGA Converter.

(A)-(C) are known to work with my Intel desktop.
(D)-(E) are known to work with an old Dell XPS13.

Software-wise, I used the frame buffer text console, "modetest -M
rcar-du -s 86:1920x1080@XR24" or "modetest -M rcar-du -s
86:2560x1440@XR24", and fbtest.

White Hawk CN5
--------------

  0. General:
      - Hotplug detect does not work, switching display needs a reboot,
      - fbtest test002 crashes with SEGV in 2560x1440.

  1. Mini-DP to (A) DP:
       - 2560x1440 works but flickers (flickering shifts image
	 horizontally; perhaps a cable issue, as 2 below does work?)
       - 1920x1080 is stable

  2. Mini-DP to (C) to (A) HDMI:
       - 2560x1440 OK
       - 1920x1080 OK

  3. Mini-DP to (C) to (B) mini-HDMI:
       - 1920x1080 OK

  4. Mini-DP to (C) to (A) HDMI + (B) mini-HDMI:
       - 1920x1080 mirrored OK

  5. Mini-DP to (E) to (A) HDMI:
       - SN65DSI86 behaves as if no cable is connected.
         Expected, as TI SN65DSI86 does not support Dual-Mode/DP++.

  6. Mini-DP to (D) to (A) VGA:
       - Detected 1920x1080, black screen / no signal.
         Perhaps this adapter relies on DP++, too?


White Hawk CN15
---------------

Does not work:
  - Display resolution is detected correctly (1920x1080 or 2560x1440),
  - Black screen, displays say no signal detected,
  - "modetest -M rcar-du -s 88:1920x1080@XR24" triggers:

	rcar-mipi-dsi fed90000.dsi-encoder: Failed to disable video transmission
	vsp1 fea20000.vsp: Underrun occurred at WPF0 (total underruns 2)

    Note that fea20000.vsp is vspd0, not vspd1. I do have a few similar
    messages for fea28000.vsp in my logs, so this may be a red herring.

Thanks for your comments!

Geert Uytterhoeven (1):
  arm64: dts: renesas: white-hawk: Add mini-DP output support

 .../boot/dts/renesas/r8a779g0-white-hawk.dts  | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

