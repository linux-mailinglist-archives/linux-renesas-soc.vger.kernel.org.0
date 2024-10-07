Return-Path: <linux-renesas-soc+bounces-9509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0379929D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 13:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85796B24A1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 11:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E7D3FBA5;
	Mon,  7 Oct 2024 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SBIROjjj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB28A19340B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Oct 2024 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728298944; cv=none; b=lft9UUnj/4ege34wuUzR4CQNcA3/ZNjEzIENdEDEeoTjXSkf7RwDDu9e44aAfdPHwYSnVhbR4RptPqhg/fc7Yhzkhk5p9cWzpzLrn0EhVfwwa+QMfUVTYS5/aFk+9NIPdXN9N4AHzehByUE+vzQUMzmmxGyJs2kpSCjNyClDmHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728298944; c=relaxed/simple;
	bh=1Gr8CNUfBPkKnUcdj+3Pl/LpjisREwim33BZIWVvmcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QH/tyYEA/Ph7vjQm7crgaWdudKRYbL7yjbcrkcd88S2i08OyBootFIdn15nRVarwWCrrNdKTLxO2suV9+Uq700u7BBCleSt1w2Ci7CFBAbDsYqQvWcYO5vYTgmWy9W1XQbqtM2AIV3DwxJdU2pM+S6pUHMsn1VU5QNFsVCFqV6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SBIROjjj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=6eImMP0EEM92b6
	pNacEsrxltX+lRpawqIlUaa+mvNEE=; b=SBIROjjj3y+/2kAN29srAhBHtJunVl
	t77C27vZrGuZACKqgHHQKtnEDXySAqPa4V2KJ+/irx9VOyT2v//C7xEwyVHm+o8C
	hjVu1Vi8UBZSyiiQ0W7jIz5C566Roby9qui70VDW7LdIFEXsE0KEOlN0/rK8Y/VV
	N+Ylm5wGfeha+euAvDFbsV2kFSwlFs7nUuS/irOXF3RmDxkus9W+Fu+piorYxvDf
	awMyI3hgtIkqS4oU9lRLTp9nn5NigtHm+Co1msJ9aHki/zesaNOTLGOX+UNls+Ts
	fJusyWaruCdeOuaE6ywfeEb+RO/YglAzOi8rYvHK5ErsSLQ7p9OOs1kw==
Received: (qmail 100731 invoked from network); 7 Oct 2024 13:02:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2024 13:02:15 +0200
X-UD-Smtp-Session: l3s3148p1@+A8g9OAjqo0gAwDPXxi/APzxl2QXB/xr
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 0/3] dmaengine: sh: rz-dmac: add r7s72100 support
Date: Mon,  7 Oct 2024 13:02:00 +0200
Message-ID: <20241007110200.43166-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:
* added tags to patches 1 and 3
* reword commit message 2 to make clear 'clocks' are not needed
* 'power-domains' is also not required for RZA1

Thanks to Geert for the tags and for the input!

Trimmed down initial cover-letter:

When activating good old Genmai board for regression testing, I found
out that not much is needed to activate the DMA controller for A1H.

Patch 1 is a generic fix. The other patches are the actual enablement.
A branch with DTS additions for MMCIF can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/genmai-upstreaming

These will be upstreamed once the driver parts are in next.

Wolfram Sang (3):
  dmaengine: sh: rz-dmac: handle configs where one address is zero
  dt-bindings: dma: rz-dmac: Document RZ/A1H SoC
  dmaengine: sh: rz-dmac: add r7s72100 support

 .../bindings/dma/renesas,rz-dmac.yaml         | 29 +++++++++++++------
 drivers/dma/sh/Kconfig                        |  8 ++---
 drivers/dma/sh/rz-dmac.c                      | 27 +++++++++--------
 3 files changed, 39 insertions(+), 25 deletions(-)

-- 
2.45.2


