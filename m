Return-Path: <linux-renesas-soc+bounces-21811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E4B54AC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97B31CC846C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 11:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9752FF17B;
	Fri, 12 Sep 2025 11:14:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD41296BBC;
	Fri, 12 Sep 2025 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675645; cv=none; b=Pbh3q8vbxb5kshBQ4e0+CjDdD8VOf5zhe1g5SRin8s47b20MswcHCRZ7QtYzSwVtEX7/YaiVE/8ql10Pr5VeGY2z0zvxLd73OltodFE9jX+7I4knPZ6Wf6c+tnqPyaJ5tGlZCULnOK+sJ+Q1h2GMSjaIR7gOukVNzGGoQa9SHZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675645; c=relaxed/simple;
	bh=weO1eEajogLduEtZTSq7t6tCaIt9KBDgRqMQO/LISo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wfk39u0vI7NEKDYr/Rk9fTAoNsa9W5Uj1Pa8IGyhANxEvo1PGaqFguMEl+mxfg6iGda0gLnwUYm06rf9I/N02ET8ADn7fJMSWiuBmb33cHNM6dwtWOb/JIQYbQtsxoFxQerEhZ4/gNnRMhhq5lnaq8d/+FoUHGHmFgmr0Qfq5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DB6C4CEFA;
	Fri, 12 Sep 2025 11:14:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.18
Date: Fri, 12 Sep 2025 13:13:52 +0200
Message-ID: <cover.1757669916.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
References: <cover.1757669912.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.18-tag1

for you to fetch changes up to 1ed2786e9ef8f16204dc3f30c46412070cb7140e:

  dt-bindings: soc: renesas: Document R-Car X5H Ironhide (2025-09-11 20:20:33 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.18

  - Document the R-Car X5H (R8A78000) SoC and the Ironhide board.

----------------------------------------------------------------
Kuninori Morimoto (1):
      dt-bindings: soc: renesas: Document R-Car X5H Ironhide

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

