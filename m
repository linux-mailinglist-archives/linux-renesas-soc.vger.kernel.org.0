Return-Path: <linux-renesas-soc+bounces-2763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B631854A44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4503528D463
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B258352F8C;
	Wed, 14 Feb 2024 13:18:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D121A58B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916698; cv=none; b=loDHGoZPfj4PpZ3Lwy4Qi5l4d9sjkP8jdmqFbaGHFRyuSViRXyubPEQI4no0wqLKC931B5huQJzb+v1djPKaReVpbsRQlk6hlIREDgJAfXvgSbcuNYhuq2g5QMw45ckN9jiSmqxxa9fvBo76ssQ/scjHlHpQ9xcPxHZE9arLr1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916698; c=relaxed/simple;
	bh=s1AYQUqMJ6J5yh14xAmtauI1uDUyVkxezBp08Drif60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P5UvYl6ma8vou7ECdTKGtGVOsNtxhoSQTYG0I2fvr0Rby1bk/w/J+ZzDHt8ko2deNCEAn6MYlqlIR5r6nm9i2ucVAMwyb0drZzHHBoYLY9HOOtJqyyYAXQebvYIpOuDppa2ep544oL2H/Pdt2AElwfVw1h6LIVuvZVr44usUhIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by andre.telenet-ops.be with bizsmtp
	id n1JE2B00F0LVNSS011JEBx; Wed, 14 Feb 2024 14:18:14 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raF9L-000d5e-Rq;
	Wed, 14 Feb 2024 14:18:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raF9S-00GvXp-FZ;
	Wed, 14 Feb 2024 14:18:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779h0/gray-hawk-single: Add eMMC support
Date: Wed, 14 Feb 2024 14:18:01 +0100
Message-Id: <cover.1707915763.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

        Hi all,

This patch series adds SD/MMC support for the Renesas R-Car V4M
(R8A779H0) Soc and eMMC support for the Gray Hawk Single development
board.

This has been tested on Gray Hawk Single (eMMC read speed is ca. 240
MiB/s).

I intend to queue this in renesas-devel for v6.9.
As usual, I have updated my topic branch at [1].

Thanks for your comments!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/v4m-gray-hawk-single-v2

Cong Dang (2):
  arm64: dts: renesas: r8a779h0: Add SD/MMC node
  arm64: dts: renesas: gray-hawk-single: Add eMMC support

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 41 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 14 +++++++
 2 files changed, 55 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

