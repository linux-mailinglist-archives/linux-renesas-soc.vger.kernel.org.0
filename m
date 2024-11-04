Return-Path: <linux-renesas-soc+bounces-10279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5651B9BB60D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 14:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02EC91F22E4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCB473501;
	Mon,  4 Nov 2024 13:26:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984502AE90
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726811; cv=none; b=Jq+wHn6voAgkwHpj2KemOqDZnM6gDwFJIh4laPbV23HMnH5yGJKo+1aogDxfzYINnwEwyplZYih+jdwel5k5TBHmJZAaBQ/07iKysDUiOLQn1nHa7920lyHGDb6KL9H5Szh9Z7C4YH8T5SOdPgTRg0xlLVa0Nq0K89ixi7tslis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726811; c=relaxed/simple;
	bh=ARmOfysl8kAGxJLh0vjrcRxii0Nn3Bt8WEWTrOk3h2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hRI4N4RfwCU6ZlzULsBkErQDzg6KTCWSG2h+m+J2XlPR4OMiIBBKHrP1VNKIaNsteyFxBXil/ed7jRRRi7wumjUAkJdJnJk/+sx3WaxXF2kToXaC+/dt85mqf/ms9rOmr9MxP/KYpTV1V6kBMJlFph386akwnZ43adfMqcVDW2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by baptiste.telenet-ops.be with cmsmtp
	id YdSh2D00Z31l0Qj01dShxP; Mon, 04 Nov 2024 14:26:42 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x65-006FvL-Se;
	Mon, 04 Nov 2024 14:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6P-000BJw-Gs;
	Mon, 04 Nov 2024 14:26:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.13 (take two)
Date: Mon,  4 Nov 2024 14:26:38 +0100
Message-Id: <cover.1730726152.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.13.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v6.13

    - Enable Battery Backup Function (VBATTB) and RTC support for the
      RZ/G3S SoC and the RZ/G3S SMARC SoM.

  [GIT PULL 2/2] Renesas DTS updates for v6.13 (take two)

    - Add a CPU Operating Performance Points table for the RZ/V2H SoC,
    - Add Battery Backup Function (VBATTB) and RTC support for the RZ/G3S
      SoC and the RZ/G3S SMARC SoM,
    - Add DMAC support for MMC on the RZ/A1H SoC and the Genmai
      development board,
    - Miscellaneous fixes and improvements.

Note that this includes DT binding updates for the RZ/G3S SoC, which are
shared by DT source files and the clock driver.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

