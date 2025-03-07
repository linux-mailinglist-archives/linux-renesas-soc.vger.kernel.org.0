Return-Path: <linux-renesas-soc+bounces-14143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BFEA56C7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 16:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293823AED5E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 15:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879BFDF71;
	Fri,  7 Mar 2025 15:47:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835C21A459
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Mar 2025 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362463; cv=none; b=ZIFfg40R7XbVvgunpEeIB8C4eAmqzLatefcOwCoWjRMo64OBsSiCX9veNLLxx0kPCju/WN/8Puc4wI+IF+L3bz1Q6aOLMgkGxfmOfDsOI5Pd6e6N65Tr6wA6O+Lb1Vz8RIYQvKywxaPxLxQG7Tk9XQi2At1F/6w5BYXiuZQnCjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362463; c=relaxed/simple;
	bh=O24OFtz8Xk9bsSxjTa6/ddRLJ80e8oz6n9UKypPCytk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnUZGQ48QKjUgDgby+uH43h7Oj5G7iqN/d0ln1wgr6zmXH/yycFw7jCKu+gTXYH8hOSr3Wyg5w93ijqjRi2AvDx6+/tIxm5wNsi1mXXHN/o3AW69I3DwK269xc2gNGqDpC9b/8ulQY6NhxFQgJ4YY575LQtte6vnv2xO8eUnI9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d269:b36f:7a12:a76f])
	by albert.telenet-ops.be with cmsmtp
	id MrnY2E00K2m8Uyj06rnYRc; Fri, 07 Mar 2025 16:47:32 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZuk-0000000DBkj-1ep7;
	Fri, 07 Mar 2025 16:47:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tqZv5-00000009sr7-1t7L;
	Fri, 07 Mar 2025 16:47:27 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.15 (take two)
Date: Fri,  7 Mar 2025 16:47:25 +0100
Message-ID: <cover.1741362039.git.geert+renesas@glider.be>
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
for v6.15.

The following changes since commit 5f7ebb81112c3f50ffbb8e576e4d35cedd8aabb1:

  ARM: dts: renesas: r9a06g032: Fix UART dma channel order (2025-02-21 16:23:01 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.15-tag2

for you to fetch changes up to 8bf8ad268e46403c7140ea5aaa85e9c659117dbc:

  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31 (2025-03-06 16:36:08 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.15 (take two)

  - Add GPU support for the RZ/V2H(P) SoC and the RZ/V2H EVK board.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 51 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 15 +++++++
 2 files changed, 66 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

