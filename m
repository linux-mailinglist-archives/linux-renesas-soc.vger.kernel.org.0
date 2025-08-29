Return-Path: <linux-renesas-soc+bounces-21077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504AB3BAF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 14:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 449A0A01A3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42289314A9F;
	Fri, 29 Aug 2025 12:18:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F2642056;
	Fri, 29 Aug 2025 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469907; cv=none; b=b57fvRT9vGs1LhZt0eOheb1chpe162ITGUiX8bNJb9mxZJggKCqQ0wUDwZjDzEWddU2EGYhF6hS+03tsPa7p1TtvgmBfsZd5SLlQWwLZtbjtjGpTj/jVWDSjwuuNf/SWwM8/+i6+pCeUg2LL4V4RfePHj1KOY4WM/24yEgYDpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469907; c=relaxed/simple;
	bh=cGsyOXUHbHzwd553ins7FkPlbhYAOnt095FxNCT2qP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSaGBiGSKSu+mgNODp6h26Bqm0hfWSq63uVOtAQ2g+oCnG1rl6om7ONVQ2O6llwdRmSV10UkO9ro8n7HFecNkJAqAvCF6b865iWMSsfEsJHugiiQbwzxt06FG7H2ORXTfi/3erEqknPLnY4LmeAet1JnzlN82+fJz77Xi0rMwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BBAC4CEF0;
	Fri, 29 Aug 2025 12:18:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM SoC updates for v6.18
Date: Fri, 29 Aug 2025 14:18:13 +0200
Message-ID: <cover.1756468045.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756468041.git.geert+renesas@glider.be>
References: <cover.1756468041.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v6.18-tag1

for you to fetch changes up to ad38ea266b8dc6e15e0d2a14a9d8543345fdba44:

  ARM: shmobile: rcar-gen2: Use SZ_256K definition (2025-08-11 16:23:35 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v6.18

  - Use the SZ_256K definition.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: rcar-gen2: Use SZ_256K definition

 arch/arm/mach-shmobile/pm-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

