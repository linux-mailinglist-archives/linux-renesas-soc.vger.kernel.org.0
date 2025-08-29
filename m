Return-Path: <linux-renesas-soc+bounces-21078-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA1B3BAF9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 14:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7D520235A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59913128BA;
	Fri, 29 Aug 2025 12:18:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA29630EF8F;
	Fri, 29 Aug 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469909; cv=none; b=OLVA/wv7UtczCC459PJGnWd8kNT2v0kC2gyehkFVtnONRFrdMgu9nMYDpkFKQXKkN9OskjlFzcAg9Pr1Qp5DKOIBx0GfNtbkHTvCmIb+vmYZFqAsOpDhhbLvKtUvGCyQbK4u7EMPvfuni7x+4/Yd1ZYRgMkFhvk/MtsDbUr/JzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469909; c=relaxed/simple;
	bh=842B2iTnfFYTQFnxqdQhYDbIZzUh4UUnyhmZipv79W0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAkPLNGJQA3F5XwIbzfUjgTAuMOJEEqb5HjKJR1xSQwsCdpUMJJCUWigA83dm7qLjmELrLVz6Q3v4UaB3A07XvU/lCQciHLA0kcylqsHG5JgymD0sCLG3/zDcNioy4PV4486sailww0HmjHfy0c2qHPaU0I5XtcUZbV31gKmInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DE7C4CEF1;
	Fri, 29 Aug 2025 12:18:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v6.18
Date: Fri, 29 Aug 2025 14:18:14 +0200
Message-ID: <cover.1756468046.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.18-tag1

for you to fetch changes up to 2da2740fb9c8e26b6b5e20d74f2ed1d49824236d:

  soc: renesas: rz-sysc: Add syscon/regmap support (2025-08-20 08:35:55 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.18

  - Add syscon/regmap support to the RZ System Controller driver.

----------------------------------------------------------------
John Madieu (1):
      soc: renesas: rz-sysc: Add syscon/regmap support

 drivers/soc/renesas/Kconfig          |  1 +
 drivers/soc/renesas/r9a08g045-sysc.c |  1 +
 drivers/soc/renesas/r9a09g047-sys.c  |  1 +
 drivers/soc/renesas/r9a09g057-sys.c  |  1 +
 drivers/soc/renesas/rz-sysc.c        | 30 +++++++++++++++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 6 files changed, 35 insertions(+), 1 deletion(-)

