Return-Path: <linux-renesas-soc+bounces-2222-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C208459ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B0241F23D9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07135D465;
	Thu,  1 Feb 2024 14:19:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A65D482
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706797166; cv=none; b=QbXkawxootyW0ABC/TPmMLfNVFJIfOU5d6k+7AxaI94P8s86yXWkSBSmVwUrRmSqljUzrmhJydJRLGVgXcBNTtTypSM5FrQeCQTy75smkV2x0Jf9KzoMB8uM3qHjk4KL6vNJrf1L2S19R0DT4syzXi4S/Oy6T/xFDF/ARpFc+rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706797166; c=relaxed/simple;
	bh=n9kkHsS6eiHr/WnXAAxDmtSC9X+OgSNeOnVKCrWyMYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XsI2DO65Ifv2LURrfVzht4OdBdmHLlKnXAxg0hVV5RW8/qMZqvwn/VLt03alxl0iKl6tiDbBPXDXvZkZBuyEWtRBEQxrhvoJxJFyxmejMTtJhF1GEzaiCFCm9Xx3Wzbo4JhVdSVDYfSfaqxiZZbpTiF5seFvR0wX9MEh3tlBU6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by xavier.telenet-ops.be with bizsmtp
	id hqKM2B0064efzLr01qKMiC; Thu, 01 Feb 2024 15:19:21 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXtc-00Gv4a-2m;
	Thu, 01 Feb 2024 15:19:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXuT-00AXdG-1I;
	Thu, 01 Feb 2024 15:19:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] arm64: dts: renesas: r8a779h0: Add full CA76 CPU core support
Date: Thu,  1 Feb 2024 15:19:15 +0100
Message-Id: <cover.1706796979.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds full support for the four Cortex-A76 CPU cores on
the Renesas R-Car V4M (R8A779H0) Soc.  It has been tested on the Gray
Hawk Single development board.

I intend to queue this in renesas-devel for v6.9.

Thanks for your comments!


Duy Nguyen (5):
  arm64: dts: renesas: r8a779h0: Add L3 cache controller
  arm64: dts: renesas: r8a779h0: Add secondary CA76 CPU cores
  arm64: dts: renesas: r8a779h0: Add CPUIdle support
  arm64: dts: renesas: r8a779h0: Add CPU core clocks
  arm64: dts: renesas: r8a779h0: Add CA76 operating points

 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 99 +++++++++++++++++++++++
 1 file changed, 99 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

