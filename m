Return-Path: <linux-renesas-soc+bounces-6203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B46490870C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921851C20CC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6C718C32B;
	Fri, 14 Jun 2024 09:07:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4326148844
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718356027; cv=none; b=CwdHVj4jy9R/E2dN9mpEwlVFh5VRcZ+j26NwaMo1GOsHkeMe674zCFECfaY8KKSp/R/b9q+Xew8fZurmXN7KIeks8xXzcslmom38pzSrhSGHjxZvSfOj1Zg53f3M1OZGVVPfQbqoxyZjK9Xc1HzoJG6xI1vJWkEi2TXebAr/MkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718356027; c=relaxed/simple;
	bh=e5GdXRThm9/Nr382JGHGtQSP0kRPn7Ufzg1m9cRrXWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jklub61V2+WtoILhPwKyQv5734/ePMuWI3p1h7kpcEX/vjlbLjmJIdPvxkhcVB4RXs65sW9q3RMf4ANzcHuLrJqgj2+Cpu+8lvglZQe/XJIXyMocwvv8J79u11v9j15rDTpUFr+qaqFdFfYyq1Na2a+SCBjWB6WWVnlrDfP61Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by andre.telenet-ops.be with bizsmtp
	id bM732C00F3w30qz01M73Sr; Fri, 14 Jun 2024 11:07:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2se-00BqO4-S4;
	Fri, 14 Jun 2024 11:07:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI2tj-00FbJb-Bs;
	Fri, 14 Jun 2024 11:07:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.11
Date: Fri, 14 Jun 2024 11:06:57 +0200
Message-Id: <cover.1718355309.git.geert+renesas@glider.be>
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
for v6.11.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v6.11

    - Enable support for Renesas R-Car Gen4 PCIe controllers and Marvell
      88Q2XXX 100/1000BASE-T1 Automotive Ethernet PHYs in the ARM64
      defconfig.

  [GIT PULL 2/2] Renesas DTS updates for v6.11

    - Add support for the second and third Ethernet interfaces on the
      White Hawk development board,
    - Add support for the second Ethernet interface on the RZ/N1 SoC,
    - Add I2C EEPROM support for the Condor-I development board,
    - Add video capture support for the R-Car V4M SoC,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

