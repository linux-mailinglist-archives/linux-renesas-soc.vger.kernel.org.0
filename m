Return-Path: <linux-renesas-soc+bounces-2212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1AB8459A8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44A81F22781
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9695CDFC;
	Thu,  1 Feb 2024 14:09:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B895D47F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796566; cv=none; b=lOC8+UPqYObFf4gOwJk9LMFF5HYtrTXiqyU3NtEsDM3klDw9eUFLGTBtkJyriHnpO7DTqwX1nbSPP6XEFn5zYCRfIMFhdfhqrNXWjprD7U0An56sPqjdMh/v0ifJI05lllCzpm5r6I/HHbYMsDTewWnAR8UItlaeACPDdNzpPVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796566; c=relaxed/simple;
	bh=bzyYD7jk0os9f3TouHjZe8+oTD/GCayc5xXPpzBEBdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ut9jjK1x6MwLdl0KslfkbOe3GV5O+pJbptLUoW4v5bBAY8hqW4M5OTue4gZ0nhr3w2uo3fgHMBzWMHjCUn1tshlfSxMe/YfppizYpEiHRhfwAVxtfzyNcxj5QFwjEzfAf6OVDo7zLILSKdOy/7ou9i2MFTzGnktdh6EM3HX1m/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by michel.telenet-ops.be with bizsmtp
	id hq9M2B0074efzLr06q9MRt; Thu, 01 Feb 2024 15:09:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXjw-00Gv3m-7r;
	Thu, 01 Feb 2024 15:09:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXkn-00AXWg-5C;
	Thu, 01 Feb 2024 15:09:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0/gray-hawk-single: Add watchdog support
Date: Thu,  1 Feb 2024 15:09:15 +0100
Message-Id: <cover.1706790320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds watchdog timer support for the Renesas R-Car V4M
(R8A779H0) Soc and the Gray Hawk Single development board.

I intend to queue this in renesas-devel for v6.9.

Thanks for your comments!

Geert Uytterhoeven (1):
  arm64: dts: renesas: gray-hawk-single: Enable watchdog timer

Minh Le (1):
  arm64: dts: renesas: r8a779h0: Add RWDT node

 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts    |  5 +++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi             | 11 +++++++++++
 2 files changed, 16 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

