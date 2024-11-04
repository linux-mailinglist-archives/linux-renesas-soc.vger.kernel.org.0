Return-Path: <linux-renesas-soc+bounces-10278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F689BB60C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 14:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A770B1F225EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732EB6FB9;
	Mon,  4 Nov 2024 13:26:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CBA1CD02
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726808; cv=none; b=Uc+MD6y1bEBBG/GQUNmlvBGimNa37PPbDc3ETZVWD7rlxy5NDiIQohN3uNg1fttJVdEKpoYP0bG3sGpcZtIzikxnJVKa4CJ4FTt990SDf5iWJi36nghQB6QfNc2OauvmL2l9TdD6K0v7E1rD5PHejGcfo3rZYrtx40tq7MWQb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726808; c=relaxed/simple;
	bh=WaZx01qD9NePzFDEReTPriogCvM/kSBfUzCS/dqVna0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ry3LvukNhAxixr91vE4afS7i/a5I90uewlMEMarsM5n37iGyoeFnwqlaO1MPhYP6tRib50FRj8f/1LwV0XNiWtP4VCFNLmsbm6dZmb2iN1t1sss3/n6Zh88KbVp3W3fljl3PRDwhhVE+Q+qd9C8NtUkMx+jS+DGOOtExH3g33WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by xavier.telenet-ops.be with cmsmtp
	id YdSh2D00K31l0Qj01dShZH; Mon, 04 Nov 2024 14:26:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x65-006FvN-Ss;
	Mon, 04 Nov 2024 14:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6P-000BJz-J1;
	Mon, 04 Nov 2024 14:26:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v6.13
Date: Mon,  4 Nov 2024 14:26:39 +0100
Message-Id: <cover.1730726154.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730726152.git.geert+renesas@glider.be>
References: <cover.1730726152.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.13-tag1

for you to fetch changes up to c520bbb523304ba98de9ffeeb0ef289921434125:

  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 (2024-11-03 12:33:11 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.13

  - Enable Battery Backup Function (VBATTB) and RTC support for the
    RZ/G3S SoC and the RZ/G3S SMARC SoM.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

