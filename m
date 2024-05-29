Return-Path: <linux-renesas-soc+bounces-5664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED98D3B3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B4D3B23F6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D60158201;
	Wed, 29 May 2024 15:42:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D80181BBB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 15:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997329; cv=none; b=AU7Ybm4lCkeqLNTD1wrZTrLkWKE1E3kPHiJ8AMpvi5dli+32OeCupuI/avn49yBS9i1FJ5XK28SJFEQPSpxBa2Wg5iSOl94Ta+bBWAbtq3PFoURL4lZfVSJrSDaVlMChkklAEunk4htbqS2Sg9KItdASRiwL1PbrKOtoJuCByWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997329; c=relaxed/simple;
	bh=tV5jF69ZQkeCaoGELzjy4twCHzg+pcA4HQMfUWSRsRA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FpvJytRZbdCZxt6BsW2HtvGIgw3yTbpof2TSjWaf7ku6oWFKRCS8tosPMJdislb5I8uCNWRJ1BlAa18bMtyaLE32k+9yskuQGq7PL1hd4N2QQXrjZjPf1fnkPeoN1HELZKbSO6DIscOFqtBflwynl6yxZfqH8jfgCbmeNhm3uEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by baptiste.telenet-ops.be with bizsmtp
	id V3i22C00C3VPV9V013i2aS; Wed, 29 May 2024 17:42:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLQG-00H2xi-AR;
	Wed, 29 May 2024 17:42:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLRC-009nPX-LK;
	Wed, 29 May 2024 17:42:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/3] arm64: renesas: defconfig: Updates
Date: Wed, 29 May 2024 17:41:56 +0200
Message-Id: <cover.1716997002.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

        Hi all,

Regular updates for the defconfig for Renesas ARM64 systems.
As usual, these are not intended for upstream merge, and to be applied
to the topic/renesas-defconfig branch. 

Geert Uytterhoeven (3):
  arm64: renesas: defconfig: Enable Synopsys DesignWare eDMA support
  arm64: renesas: defconfig: Enable Marvell 88Q2XXX PHY support
  arm64: renesas: defconfig: Refresh for v6.10-rc1

 arch/arm64/configs/renesas_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

