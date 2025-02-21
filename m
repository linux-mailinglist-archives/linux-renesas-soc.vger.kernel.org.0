Return-Path: <linux-renesas-soc+bounces-13486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E21A3FC95
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5936816E0BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDCF2253A1;
	Fri, 21 Feb 2025 16:57:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A2225401
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157062; cv=none; b=XoagkkJjFGZsezAZtPCqHDz5BCP0jiVKqQsWGsjyx1dKhTzTZmdPE2RXdacGvomE+2sWAB0uWDJFB8KQ6qVr0BPLz/IjfsN/sBADv0ndEH5JOx+dM/6OaG8EGqu1EysIf7vHkRxTabiUphey/beI/8GG/1LflRZ7bdLJ3DdMp5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157062; c=relaxed/simple;
	bh=KSWs0QhcV2YupcJqSYD2hlxsh7j9tFBb8ih1MS30eNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTmBrYFynivTJu/RsrNT27d15SqTbX8s+RxpdUjZq+cubDTW9Ow9HPupF44X2YOb2hh2343VhIVN7MJ2vaVy6kJJZFERUc9hO77lmDqv9b4lBqldVczIBpCV8IjPQflQGyNKDpDN9KQCBGr+S7FWex0VT2X/YkSm/fmvoeXzU1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by laurent.telenet-ops.be with cmsmtp
	id GGxX2E00C0y8aK501GxXFX; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsL-3MQD;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqh-0jKj;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v6.15
Date: Fri, 21 Feb 2025 17:57:21 +0100
Message-ID: <cover.1740156736.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.15.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v6.15

    - Supplement DTB with ATAG information, for older boards.

  [GIT PULL 2/5] Renesas ARM SoC updates for v6.15

    - Remove the legacy CMA reservation code on R-Car Gen2, which causes
      issues with highmem.

  [GIT PULL 3/5] Renesas driver updates for v6.15

    - Add a driver for the System Controller on RZ/G3S, RZ/G3E, and
      RZ/V2H.

  [GIT PULL 4/5] Renesas DT binding updates for v6.15

    - Document support for the Yuridenki-Shokai Kakip (based on RZ/V2H)
      and MYIR Remi Pi (based on RZ/G2L) boards,
    - Document support for the RZ/G3E System Controller.

  [GIT PULL 5/5] Renesas DTS updates for v6.15

    - Add support for the second and third Ethernet interfaces on the Gray
      Hawk Single development board,
    - Add Image Signal Processor helper block (FCPVX and VSPX) support for
      the R-Car V3U and V4M SoCs,
    - Add Watchdog and System Controller support for the RZ/G3E SoC and
      the RZ/G3E SMARC Carrier-II EVK development board,
    - Add initial support for the Yuridenki-Shokai Kakip and MYIR Remi Pi
      boards,
    - Add support for the spare UART and PMOD serial ports on the RZ/G3S
      SMARC Carrier II board,
    - Add a CPU Operating Performance Points table for the RZ/G3S SoC,
    - Add boot phase tags on R-Car Gen2/3/4 and RZ/G2 boards,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

