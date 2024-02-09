Return-Path: <linux-renesas-soc+bounces-2545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4C084FA7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 18:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72931F2260B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AEB74E33;
	Fri,  9 Feb 2024 17:03:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9E6DD18
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707498239; cv=none; b=RvKmqqtFQdIprRmfxuiyuuV4Rq7wUr7xO4k3YZ2bR5iaY79/OAGDOBBL/+q+vSoo5jzTU3KitGL1ofIPEkMJgE59rWMDzc/4sE+FC9CqhePYdlePyhFoOqJ/eNkcebGCg+ShX1DY3vf61mO5IGFns2jrovc51+xud8TKPIufPqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707498239; c=relaxed/simple;
	bh=zfhFRGjEdrCa8m5QEpjvliFwBc5MHzjaKGACMw84ymM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IEZKhzw8I052XbcyP2tMg/lgVqbSB94z3VVLtpx6PgmRA2z5cCnpPS+k+e4BzxR4WmOPSlH+mwE3NGwl5kQ+vxV+ecV3yAT0sVgT7zIqkTvnCUDsB5xInTrO1ZSLR2ydJgGT8ZbS1ojrWJ1dygnwyDuOKGNTzMxnQXzT+iGxprY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4TWg2M2qtfz4x1w0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:55:07 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by albert.telenet-ops.be with bizsmtp
	id l4uy2B0054RKXn6064uy1C; Fri, 09 Feb 2024 17:55:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9O-0008GW-7b;
	Fri, 09 Feb 2024 17:54:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9S-0061GG-DS;
	Fri, 09 Feb 2024 17:54:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.9
Date: Fri,  9 Feb 2024 17:54:49 +0100
Message-Id: <cover.1707487826.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.9.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.9

    - Disable obsolete board staging support in the Renesas ARM and ARM V7
      multi-platform defconfigs,
    - Enable support for the Renesas R-Car V4M (R8A779H0) SoC in the ARM64
      defconfig.

  [GIT PULL 2/4] Renesas driver updates for v6.9

    - Initial support for the Renesas R-Car V4M (R8A779H0) SoC.

  [GIT PULL 3/4] Renesas DT binding updates for v6.9

    - Document support for the Renesas R-Car V4M (R8A779H0) SoC, and the
      White Hawk Single and Gray Hawk Single development boards.

  [GIT PULL 4/4] Renesas DTS updates for v6.9

    - Add GPIO keys and watchdog support for the RZ/G3S SMARC development
      board,
    - Add GNSS support for Renesas ULCB development boards equipped with
      the Shimafuji Kingfisher extension,
    - Add support for the standalone White Hawk CPU board,
    - Add support for the R-Car V4H ES2.0 (R8A779G2) SoC and the White
      Hawk Single development board,
    - Add initial support for the R-Car V4M (R8A779H0) SoC and the Gray
      Hawk Single development board,
    - Add camera support for the RZ/G2UL SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

