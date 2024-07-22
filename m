Return-Path: <linux-renesas-soc+bounces-7419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A41938E82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD821C20F06
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFF51EB56;
	Mon, 22 Jul 2024 11:55:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6BC16D304
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649353; cv=none; b=REmaq6txxR/jnkwUWHZw7tnb8/g5hRJudVMGBUSUJoJ4GLORJ5q2vW+bk+KQ+BsTVMiAG6nG510n4OM4W9MEq1918PMCc2BNFHKq9ZXVTeWCubyP5987iMw2It6MUdTNxzrudRD3aVJgvKKfSZzowX57b8LSUS0IgaGzH2PrCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649353; c=relaxed/simple;
	bh=x1Mmpf3Yqszb2q27Wnd333bLf8BNIgyrrAHgBUdJ3zc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EPz5cyifIjj0gwpi8c4iOD/hPqfj6bWqBN9LBz2AG4bF2XekL4fkvXVXt7SXcnGwX3V6+65dd8IGxSG/BmAumrpdymFkJTPk093yv25zvj62waYfRS9NeJkWHmEVy4+7BhrvyNyoGPwMDW6enfNOEGKLz2zNdIuS9j7Xw2gQ0t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by andre.telenet-ops.be with bizsmtp
	id qbvo2C0021wvoRx01bvoM9; Mon, 22 Jul 2024 13:55:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrdZ-002zCb-H3;
	Mon, 22 Jul 2024 13:55:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrdr-0020l1-Vi;
	Mon, 22 Jul 2024 13:55:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: gray-hawk-single: Add push switches and GP LEDs
Date: Mon, 22 Jul 2024 13:55:39 +0200
Message-Id: <cover.1721649057.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds support for the Push Switches and General Purpose
LEDs on the Gray Hawk Single board, so the former can be used for user
input, and the latter can be used as indicator LEDs.

To be queued in renesas-devel for v6.12.

Thanks for your comments!

Geert Uytterhoeven (2):
  arm64: dts: renesas: gray-hawk-single: Add push switches
  arm64: dts: renesas: gray-hawk-single: Add GP LEDs

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

