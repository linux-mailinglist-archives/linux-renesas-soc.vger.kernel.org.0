Return-Path: <linux-renesas-soc+bounces-9205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B898A804
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 17:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A10A2868A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 15:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4A31917F1;
	Mon, 30 Sep 2024 15:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CW6XFPid"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03F19258B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708401; cv=none; b=erM/zM4uAlb3lL1olaRr1IyvvnwmLBAxXMF4Ho8tsYBpmpHJ/nPsUIS8VYRjxCMDZZ3t5/aeqXptkQqAR8meFbfGwOylPl7ZnJarSe8Mtryvf0ecjE3+RRy/tLc2Hhq4r93NBCic8hfVD8XbidwhGXukxfC2TdlCmAR3YvDqS68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708401; c=relaxed/simple;
	bh=xinIHUprBI52PsIRaJ4JZcTeZPje0snSfpYXu/fggQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TtPFBleAvBXFJyh2MwlyxIKlUhk9cQJE1L73AoHwYuRK6VcFKzCMMHcvy085XbyIjWzTs7UGUHLLCclXzFtsuTc2OYfRs2SdXpuw5bynvXkpgN9rpq0Imee1ZcK9IClYBVt/SDBC2BOXhXHp42ZuSPbZNRHypnwqR7GLYliyQ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CW6XFPid; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Zh1yObY8WHow/K
	ijC4LeeBHtkdQnh8DwECG6Q2RxrFk=; b=CW6XFPidi8bt7iDwyc7Fh+ufYrIZQ2
	CIBpMeW9F+jcanYCIGt7S7N4ViCgCNV6NvI5fP0DMl4B4+HgZtmF+2gGYFjcGEyI
	vhM0wL1fHEwxA+AHCePHVH9fI80za3GRwps9XVWlYBFft3B0jCd6aMMsKrntJq2E
	gJ1wK2vpl6sjXAeONadfQ+cv7x1vHjZ+w7L2WfVHPaHJNnW9/plFrvTUZT8lQXQe
	pBGtgCNGGk6FR80HGyDIbt269ssy7KhixqH7r9jtAqJpKXQZz3tQmRNGTAvP5TKX
	/us73NGEvAHrQJ94X2yLqu5fLj4HVzBpb74kTOCoVGJ9qHRNOldMDQmA==
Received: (qmail 2222573 invoked from network); 30 Sep 2024 16:59:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 16:59:56 +0200
X-UD-Smtp-Session: l3s3148p1@eSVCdVcj3uYujnsJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/3] dmaengine: sh: rz-dmac: add r7s72100 support
Date: Mon, 30 Sep 2024 16:59:51 +0200
Message-ID: <20240930145955.4248-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When activating good old Genmai board for regression testing, I found
out that not much is needed to activate the DMA controller for A1L.
Which makes sense, because the driver was initially written for this
SoC. Let it come home ;)

Patch 1 is a generic fix. The other patches are the actual enablement.
A branch with DTS additions for MMCIF can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/genmai-upstreaming

These will be upstreamed once the driver parts are in next. Adding SDHI
is still WIP because RZ/A1L usage exposes a SDHI driver bug. So much for
the value of regression testing...

Wolfram Sang (3):
  dmaengine: sh: rz-dmac: handle configs where one address is zero
  dt-bindings: dma: rz-dmac: Document RZ/A1L SoC
  dmaengine: sh: rz-dmac: add r7s72100 support

 .../bindings/dma/renesas,rz-dmac.yaml         | 27 +++++++++++++------
 drivers/dma/sh/Kconfig                        |  6 ++---
 drivers/dma/sh/rz-dmac.c                      | 27 ++++++++++---------
 3 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.45.2


