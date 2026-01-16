Return-Path: <linux-renesas-soc+bounces-26913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3740D2FECB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F165B305338E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EBF362135;
	Fri, 16 Jan 2026 10:50:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D21936166E;
	Fri, 16 Jan 2026 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560624; cv=none; b=hIWS9rwqJ/+dcvOOmT3dA+zgf5R8U8dXwPZwzKTcXmPHbwRKWy5n5iVgeqhfqtFcxbLp7zbLPqv8b6vUt43NoMF2N0u+3zvmwOCeUrYb2d+74pzcVUp8bGkLIeCMkDvSxwgfWZrWXz0NJUqU5a3QqbQ66QkoOjltYzvyIjByFks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560624; c=relaxed/simple;
	bh=NfBjJs5458D4yLVM9XdOP0t43UtVmcsG8HcnRd4oTyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o43ZTyKTuLa1zic0Vb1Cpn+L0BmFBqkhhkuxZPXuIGls+HHRv5W/LXxMqT/bAwIQh8A8fcG+Rp2Ji4s7iYrRnnyAwNVfJ3Abtumxct4/NlMV7r21tenjPT5AcU0dc4ChK6T/1fnMFsujQ1TCUKKQyEoYmQXkvnBtmZARKV2xRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3884C116C6;
	Fri, 16 Jan 2026 10:50:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.20 (take two)
Date: Fri, 16 Jan 2026 11:50:15 +0100
Message-ID: <cover.1768559762.git.geert+renesas@glider.be>
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
for v6.20.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas driver updates for v6.20 (take two)

    - Add and use for_each_of_imap_item() iterator,
    - Add support for the RZ/N1 GPIO Interrupt Multiplexer.

  [GIT PULL 2/3] Renesas DT binding updates for v6.20

    - Document the RZ/N1 GPIO Interrupt Multiplexer.

  [GIT PULL 3/3] Renesas DTS updates for v6.20 (take two)

    - Add cpufreq, thermal, GPIO IRQ, and CAN-FD support for the RZ/T2H
      and RZ/N2H SoCs and their EVK boards,
    - Add more serial (RSCI) and CAN-FD support for the RZ/V2H and RZ/V2N
      SoCs,
    - Drop unused .dtsi files,
    - Add I3C support for the RZ/G3E SMARC SoM,
    - Add GPIO support for the RZ/N1 SoC,
    - Miscellaneous fixes and improvements.

Note that "[GIT PULL 3/3]" includes DT binding definition updates for
the RZ/T2H and RZ/N2H SoCs, which are shared by clock driver and DT
source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

