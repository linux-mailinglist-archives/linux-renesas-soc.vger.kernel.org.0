Return-Path: <linux-renesas-soc+bounces-10951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1D09E55DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD1CE288CB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 12:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2FE218E84;
	Thu,  5 Dec 2024 12:54:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B44218AC8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403241; cv=none; b=HuffaLJ41AKb+CIvX+Hf81PFvrYbmPhMceb9dSb2L8lK8zUYlmsVPRkJjFI1+8MlnPc2c/qmNdRpOkHeM+BH/A7IEupyhVU+jI/k8xiBkDIWWEK0O5i7Cma36jxW4FoT3IloxRRLeQv7lOHNIzHDquwLGb3B24wHE2LU73XJOv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403241; c=relaxed/simple;
	bh=GXPR+1cuQAF3Ux0d964lRQyr4GOWiIOnaWP4d0xwHfs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fo765xyc8jAaySx12PpkPmGHTN7miwytgI7wd4c/++n7V7pfLwfLuKoiE5xOvxADNNiTdJC+sJtBUjwMF9qDEhsaU9QLO2VGsogE7QSkhrQr7XWMtzRpFbFGH12swC8+tSrjJfCP02AAYgLD+bmAflfYZ9gLy6FTb6MO2qo80H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by andre.telenet-ops.be with cmsmtp
	id l0tq2D0093EEtj2010tqGy; Thu, 05 Dec 2024 13:53:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMb-000LOY-HC;
	Thu, 05 Dec 2024 13:53:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMc-00EQDG-6g;
	Thu, 05 Dec 2024 13:53:50 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
Date: Thu,  5 Dec 2024 13:53:47 +0100
Message-Id: <cover.1733402907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series add R-Car Sound support for the various variants of
the White Hawk Single development board, using the ARD-AUDIO-DA7212
external audio board.

The second hunk in the second patch depends on "[PATCH 0/5] arm64:
renesas: Add R8A779G3 White Hawk Single support"[1]..
This was compile-tested only, due to lack of hardware.

To be queued in renesas-devel for v6.14.
Thanks for your comments!

[1] https://lore.kernel.org/all/cover.1733156661.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  arm64: dts: renesas: white-hawk-ard-audio: Drop SoC part
  arm64: dts: renesas: white-hawk-single: Add R-Car Sound support

 arch/arm64/boot/dts/renesas/Makefile                      | 8 ++++++--
 ...audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ard-audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} (96%)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

