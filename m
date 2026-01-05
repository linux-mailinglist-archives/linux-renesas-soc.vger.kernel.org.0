Return-Path: <linux-renesas-soc+bounces-26300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B7CF4A87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E05032BC3E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283DA34DB5E;
	Mon,  5 Jan 2026 15:57:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49F34DB4F;
	Mon,  5 Jan 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628673; cv=none; b=pSMzbu0XrhkZsa78LT8fjljXrwqcxjJ/6/aU4wGRLqKEinYFFZaPbH0xwtmU1isd+eVQvaq7EF6lzxOoz2Jn0H0BnAk9866YGO2+mtADiADz0cRl3eJ0Kv0UemPz1XfhUzyO9P3gqTJBFCsvCATDjiYdIhZRqyprQIv8xVH+zuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628673; c=relaxed/simple;
	bh=JdONTP5FuLGNr9OTqUtKlw2fukClsa3Uw4aV+0sDGhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BS+VA9TDSVQynn86h8GGQmQUw/YI2fkE0s28jkgFBf2PgxR4jIr8DY1VJ0BXPCPNbp4YELbYAjylgTjqCHpAWYCm1zI+7aITPPs/8Ef+oklSw49d61QbOFGzUM/sDA3A/4U95Y9EizFnJQyPcWGpRVpVJW/FXidXHOQ6XrUzzn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429EDC116D0;
	Mon,  5 Jan 2026 15:57:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.20
Date: Mon,  5 Jan 2026 16:57:39 +0100
Message-ID: <cover.1767628167.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
References: <cover.1767628163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.20-tag1

for you to fetch changes up to 1bea7e94bf09ee6d46051076866a9369f64d302a:

  soc: renesas: Enable ICU support on RZ/N2H (2025-12-23 09:25:33 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.20

  - Enable Interrupt Controller (ICU) support on the RZ/N2H SoC.

----------------------------------------------------------------
Cosmin Tanislav (1):
      soc: renesas: Enable ICU support on RZ/N2H

 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

