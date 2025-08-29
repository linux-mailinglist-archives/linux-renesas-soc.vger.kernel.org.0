Return-Path: <linux-renesas-soc+bounces-21076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B8B3BAF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 14:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134DD1C823A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E694A314B76;
	Fri, 29 Aug 2025 12:18:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5AA314B74;
	Fri, 29 Aug 2025 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469904; cv=none; b=WGqGQ6n0CcsW0kPLcKRTxYJCEN+u/Oe+dU8cCH1/V8kt9FCgsRb81XYxqmY1moYCUF5egP50+Uj2TULaPG3spF+iXqoli2NChmtybUrm6GGT+ccVZlNZKmrKrXEVuMIzhk11YAviLUj5/rloxJxx6BAdd57l87g9Yt8xJqWZOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469904; c=relaxed/simple;
	bh=SslbJ1e7iBrow+/qGMGJU81aikGKNyJ8FXsA0GiXP4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JukhY+hga4DR0ErVFIkuoJxc2Ek2KoqS5ALZE9n+F8nJgXd07OaI90ihpM0/IP6QNyHbT96e1tX9Y4RGnKRoiJvhIPuOb5y6IrolbfXdutfy7QsoTJgtyaZJuRyJGuOxW6ZhH7CG7i4AaoXinVMt0rpMh5sZ6A6NXl1Z8DpOJ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552E0C4CEF1;
	Fri, 29 Aug 2025 12:18:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v6.18
Date: Fri, 29 Aug 2025 14:18:12 +0200
Message-ID: <cover.1756468043.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.18-tag1

for you to fetch changes up to abd7c0293816a5fa5766710d2e7b576384fdec4d:

  arm64: defconfig: Enable the RZ/V2H(P) RSPI driver (2025-08-11 16:23:10 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.18

  - Enable support for the Renesas RZ/T2H serial driver and the
    RZ/V2H(P) RSPI driver in the ARM64 defconfig.

----------------------------------------------------------------
Fabrizio Castro (1):
      arm64: defconfig: Enable the RZ/V2H(P) RSPI driver

Thierry Bultel (1):
      arm64: defconfig: Enable Renesas RZ/T2H serial SCI

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

