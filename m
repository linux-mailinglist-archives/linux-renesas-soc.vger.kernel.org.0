Return-Path: <linux-renesas-soc+bounces-24637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E57DC5C96F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA3B3B0E2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A1A311958;
	Fri, 14 Nov 2025 10:30:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C519311953;
	Fri, 14 Nov 2025 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116224; cv=none; b=Xcjy1yNe66EFeTz1mdohU/tr6G9RQKKNBxr594oQ0QPowxGJWJ5Bw+tBfnxMuEAXKYRIuvhbcXnjwt4zuaI2s9fcmym+unm5VU2gC82/5EdnnYgLE5p3JH4CcOOoNaLWCaomU/4kGknA+R6el9VRcuF9a0ey9V9psCvQe3x11RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116224; c=relaxed/simple;
	bh=ndRNjshwr/whlSz4wPQNerPGOf+f+e2aSbmLTBtFn3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyeaMlQEZffogHBIjUlKvLbLtxdosYcaoXgcHgRQCpShmaAd9gWnZ9bU+OAvmoeIJiyzmAdiNsKMwqFRGnFXoA5yG0wmxeOgnleeynQ9Pbphxeew9dNPmOWNwfv29r4ZCrxF20Z4f6zdWHX/685UOfjP9R+z7ZYfzrERZdtnrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFF6C113D0;
	Fri, 14 Nov 2025 10:30:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:16 +0100
Message-ID: <cover.1763115232.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763115230.git.geert+renesas@glider.be>
References: <cover.1763115230.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4765d59fcf8679372286bc899628c3721dafe456:

  soc: renesas: rcar-rst: Keep RESBAR2S in default state (2025-10-23 16:03:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.19-tag2

for you to fetch changes up to c432180a7d95081353a96fd6d5bd75b0fc8a27c3:

  soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config (2025-11-13 21:21:30 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.19 (take two)

  - Fix accessing forbidden registers from regmap debugfs on RZ/G3E,
    RZ/G3S, RZ/V2H, and RZ/V2N.

----------------------------------------------------------------
Claudiu Beznea (2):
      soc: renesas: r9a09g056-sys: Populate max_register
      soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config

 drivers/soc/renesas/r9a08g045-sysc.c |  69 ++++++++++++++++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  |  79 +++++++++++++++++++++++++++
 drivers/soc/renesas/r9a09g056-sys.c  |  69 ++++++++++++++++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  | 101 +++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |   2 +
 drivers/soc/renesas/rz-sysc.h        |   4 ++
 6 files changed, 324 insertions(+)

