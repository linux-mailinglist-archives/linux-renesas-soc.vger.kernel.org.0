Return-Path: <linux-renesas-soc+bounces-26915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 689F2D2FDED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12AE6301B32B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0E1362147;
	Fri, 16 Jan 2026 10:50:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642236212A;
	Fri, 16 Jan 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560628; cv=none; b=ZPXizo2Q2KPml64mlo++GrqSB8Co6a38Q9pYTDxFYzYEV01j6iCwjKFFdqpnWa/6Ha6mgDflNgC4yLC4KFRzSYd/qIO15x26rw4p0lgUamyvFbYAYC8TrzpslSkxuStQElJ4+5wJMr8qekkSYwIUC4XZ00Y6eLYQdYNmYpi5Euc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560628; c=relaxed/simple;
	bh=rpVqVzR3lVtfWhZ0wOUd0dnVAvRxCnpuuTm2DYOQmPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnKOtGKr8ivSpswlznd4EewyhcWin4XudvOn4vEhXlYhnBLiMBB3BLyYrHj2gpoZKMAJOeNB/FK13fH5A4MzNN2qT52M1iYNyhmOqhOwBUJhg7WUL4+h+WDH/vwXt1+ttBxo0LjJpG6S9nZO6rRUOVfMxvcEsNMMlLmpbJSAQ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A538C19423;
	Fri, 16 Jan 2026 10:50:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.20
Date: Fri, 16 Jan 2026 11:50:17 +0100
Message-ID: <cover.1768559767.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768559762.git.geert+renesas@glider.be>
References: <cover.1768559762.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.20-tag1

for you to fetch changes up to f3b795d298a280687ed70211d51043ed5fc7a96a:

  dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer (2026-01-15 11:56:09 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.20

  - Document the RZ/N1 GPIO Interrupt Multiplexer.

----------------------------------------------------------------
Herve Codina (Schneider Electric) (1):
      dt-bindings: soc: renesas: Document RZ/N1 GPIO Interrupt Multiplexer

 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml       | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml

