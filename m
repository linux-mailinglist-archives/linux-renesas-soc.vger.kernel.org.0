Return-Path: <linux-renesas-soc+bounces-3376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49386E460
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E972F1F23065
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E051C33;
	Fri,  1 Mar 2024 15:32:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F52E23AD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307174; cv=none; b=O98Y0kWCRrvYjX0t/aL+urYkRypC0bYtv4aAp6lN6490hFPOOxaYvDrEbI7BpX2uoe5BIzlEQD93ORF+IBKA96+fJYGZ0ENAiu9hmB3+fmm3z6Nj+Zokp4wGdVttNoPp5NCCEaxWA+2L3nmZrUQRC5xHFRjJyDyak8TMBvJw4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307174; c=relaxed/simple;
	bh=q5kmoix5esv0PNO0rfMoWK5dCcDWLVN+KEQTCH+9bX4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hfsIH1eyN0iprDWZEclJEKFhkj0eSopyU8qHzV5ooMZ+BpZbgjtzI1Kd7W9FwaiZvwrcOajr936XZWEkAZDWsO8lRwP/qs8+lGmpB8ejDXxnyhMmjpMwnQllgr4E+rw3x/J9IUB/C1xp1Tg+vyyGRhXPoJdu4mVaan1bDuZbae4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:db22:6af9:7d18:6ee8])
	by michel.telenet-ops.be with bizsmtp
	id tTYj2B0021TWuYv06TYj1f; Fri, 01 Mar 2024 16:32:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rg4sC-0023yC-C2;
	Fri, 01 Mar 2024 16:32:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rg4sN-00Bfbx-39;
	Fri, 01 Mar 2024 16:32:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DT binding updates for v6.9 (take three)
Date: Fri,  1 Mar 2024 16:32:23 +0100
Message-Id: <cover.1709307006.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my third pull request for the inclusion of Renesas SoC updates
for v6.9.

The following changes since commit 3a9856e830500e20e61b92f5ea6b8cc505e085be:

  dt-bindings: renesas: Document preferred compatible naming (2024-02-19 11:21:04 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.9-tag3

for you to fetch changes up to 0d5a9b5d5d2fe6a138a8a9ff2513f446d69f2672:

  dt-bindings: soc: renesas: renesas-soc: Add pattern for gray-hawk (2024-03-01 15:41:34 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.9 (take three)

  - Add missing gray-hawk pattern to list of preferred compatible names.

This fixes a recently introduced "make dtbs_check" issue.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (1):
      dt-bindings: soc: renesas: renesas-soc: Add pattern for gray-hawk

 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

