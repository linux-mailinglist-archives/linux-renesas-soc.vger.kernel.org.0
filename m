Return-Path: <linux-renesas-soc+bounces-24636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EBDC5C9F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE1D04F234F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2291731194C;
	Fri, 14 Nov 2025 10:30:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072BB30FC36;
	Fri, 14 Nov 2025 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116223; cv=none; b=RrCv1N92EvYbDNceOc2ZNB7EUSy0PWeTAcMTdDqweAjOGeeOteOgSbBvCazGVrEM63MihhhqUCXa5n3Z5Cet/PKsutaRi272c6wa10e4y2ntSWJEhXrfIq4DUXqZhGLaji9X8i+ck19xO3EGgPP5nUtSa3XvpdQJpIK5GCdgbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116223; c=relaxed/simple;
	bh=FmFMvXIBqkbgdw/ps0WKxjfWuiHs3cZxax3jfR9u69M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GIHOVzIVEcadw2cCZLwB9QPb3yzURrbc7qFjj/42YBHYWUwAI70OIJUO9MKOgf8VZ9VMAjL7bQzfFz1zxDozPRfyMjR5kgDthH4IKsNrDFOsc73CeJp8pJmvsVI0OklILedvQvqCQFcksWeGNi86VDl0PYPz25zhuMbxiM1C5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F31C4CEF5;
	Fri, 14 Nov 2025 10:30:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:15 +0100
Message-ID: <cover.1763115230.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.19.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas driver updates for v6.19 (take two)

    - Fix accessing forbidden registers from regmap debugfs on RZ/G3E,
      RZ/G3S, RZ/V2H, and RZ/V2N.

  [GIT PULL 2/2] Renesas DTS updates for v6.19 (take two)

    - Add Imagination Technologies PowerVR Series 7XE GE7800 GPU support
      for the R-Car M3-N and V3U SoCs,
    - Add Ethernet support for the RZ/T2H and RZ/N2H SoCs and their
      evaluation boards,
    - Add ADC support for the RZ/N1D SoC,
    - Add thermal, NMI pushbutton, and RTC support for the RZ/V2H SoC and
      the RZ/V2H EVK development board,
    - Add USB2.0 support for the RZ/G3S SoC and the RZ/G3S SMARC Carrier
      II board.

Note that "[GIT PULL 2/2]" includes DT binding definition updates for
the R-Car V3U SoC, which are shared by clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

