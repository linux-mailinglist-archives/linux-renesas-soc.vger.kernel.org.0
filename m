Return-Path: <linux-renesas-soc+bounces-13453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78325A3EEEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 09:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2313C3AEDF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 08:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C05320102E;
	Fri, 21 Feb 2025 08:45:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B601B0406
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127500; cv=none; b=q0W4fHpN5pOaalDhlakJ52AwlRZ1HtW4IDEm64W0Cr4yeW63sxdmSP19EfkareeVK41rGSp/Tb1PGocsw/PobVdqTJJ2FtlMu3a0stmbR5obPxhomi3VN6oD21eKssv5jDzpScmEBxb4VJgfh0vctCNEzpjGRyl82htVESV4R9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127500; c=relaxed/simple;
	bh=BtxQqFhf9HXwNUn/eX0I6DxIUjDhovz/XSNJob/slbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeHJtD9q31hBQi2bkOZbpqWbHiFRsguiW5QS9EBK2ABKa9O8QcL7SvL//Ahnkred443ohnfNcbMiKdDuiwMYmtPDg8MxN4gNTiCQaUajOjK1wOaJBjXetMJ3kNUH0Z6EI4jYvM5qiSWYZUWXlZSxcXxvWvM5ghOLlXIZWTur4g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by baptiste.telenet-ops.be with cmsmtp
	id G8kp2E0060y8aK5018kp1Q; Fri, 21 Feb 2025 09:44:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOe4-0000000BKsZ-2wWG;
	Fri, 21 Feb 2025 09:44:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOeP-0000000E5Jy-0GgY;
	Fri, 21 Feb 2025 09:44:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: Miscellaneous cleanups
Date: Fri, 21 Feb 2025 09:44:44 +0100
Message-ID: <cover.1740126560.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Here is a set of miscellaneous cleanups for Renesas clock drivers.
I intened to queue these in renesas-clk for v6.15.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: cpg-mssr: Remove obsolete nullify check
  clk: renesas: rzg2l: Remove unneeded nullify checks
  clk: renesas: r7s9210: Distinguish clocks by clock type

 drivers/clk/renesas/r7s9210-cpg-mssr.c | 10 ++++------
 drivers/clk/renesas/renesas-cpg-mssr.c |  5 -----
 drivers/clk/renesas/rzg2l-cpg.c        | 10 ----------
 3 files changed, 4 insertions(+), 21 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

