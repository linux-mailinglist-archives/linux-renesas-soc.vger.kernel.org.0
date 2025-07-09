Return-Path: <linux-renesas-soc+bounces-19462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0006AFF2BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAAC75C077D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665CA242D77;
	Wed,  9 Jul 2025 20:14:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495D823B63D;
	Wed,  9 Jul 2025 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092042; cv=none; b=V95tsLBa/gE2R/LAiNcf+Ec5oHri8vtiu96RwPyHHHS/xYYyg7zSDlCGmdwDudVHyFhsawjoJN8p33p6skH0FL6AxU0zO1DQmShdy9zv/JFF05pa6kRd5PV5pFSkpE+Q9tTvNdm1K+g/3zibzxUGVs0cSgDcemYSy6eXukw1Dxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092042; c=relaxed/simple;
	bh=pNzTYUmlF/VciLsoLVJjTOZYjdVUnThdM6V49xOkra0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0DFSVNhB7cCeQWiruniuFn1VGV9iZVO6WeCAkquB2og1UjX1mHGj5VrUnGDYXPQsto/ENZAzpOsgLyW1Vas1T3DgsMK2wxzTzMc1eaGVb8wCs4Yy1k8rQuVCoQMr7VT4j/++1LzSah/xX3gYiF6f2ryPL0/kKwy3ckf7tohY4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A21C4CEEF;
	Wed,  9 Jul 2025 20:14:00 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:24 +0200
Message-ID: <cover.1752090396.git.geert+renesas@glider.be>
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
for v6.17.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.17 (take two)

    - Sort Renesas Kconfig symbols.

  [GIT PULL 2/3] Renesas DT binding updates for v6.17 (take two)

    - Document support for the Renesas Gray Hawk Single board with R-Car
      V4M-7 (R8A779H2).

  [GIT PULL 3/3] Renesas DTS updates for v6.17 (take two)

    - Add support for the Renesas Gray Hawk Single board with R-Car
      V4M-7 (R8A779H2),
    - Add eMMC and microSD expansion board support for the RZ/V2H and
      RZ/V2N EVK development boards,
    - Add GPIO keys and Ethernet support for the RZ/G3E SoM and SMARC
      Carrier-II EVK development board,
    - Add QSPI FLASH support for the RZ/V2H and RZ/V2N SoCs and their EVK
      development boards,
    - Miscellaneous fixes and improvements.

Note that PR 3/3 includes DT binding definition updates for the RZ/V2H
and RZ/V2N SoCs, which are shared by clock driver and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

