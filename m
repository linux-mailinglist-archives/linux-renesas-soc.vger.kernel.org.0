Return-Path: <linux-renesas-soc+bounces-21341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4217B44058
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7333A43B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D082120CCCC;
	Thu,  4 Sep 2025 15:19:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33A61EE019;
	Thu,  4 Sep 2025 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999147; cv=none; b=qAL8aLfyhAl1qp+7eb1tbxN4yWVqIOkVYFqpqU3mq8hWDyj9qS4s6g1NAWE5NMrhF8lpFggikPhgHP+0SeHTkzzisvGWiZuaXLSaGMA9m+pf7D4EsmaCMLsU9RFjLr5AiuJWdWrqvhf+QPt/1zMbgpd3QURNoIXAouau/cfxnrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999147; c=relaxed/simple;
	bh=tjil2+awWTiXNz+QYIACppRvSs+ZlAbI2fkoTB1LYL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufBnu/CBy4oJrBD/+VT1hlkDDgMQT1ygWQuj6E7EE2+uKv9km7dwO9n/oMKZb/g29VqDbKGnAafHcOdpxDeVTx+Ts+ZtpDQi1dH0sCx3joQfecCJWqPw+vh8F7R+Htbg4Xfw+hDGyMrn+0dI43UgzNOtADnxYb6HmMJQFfuPQ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473A9C4CEF0;
	Thu,  4 Sep 2025 15:19:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next 0/3] sh_eth: PM-related cleanups
Date: Thu,  4 Sep 2025 17:18:55 +0200
Message-ID: <cover.1756998732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains various cleanups related to power management
for the Renesas SH Ethernet driver, as used on Renesas SH, ARM32, and
ARM64 platforms.

This has been tested on various SoCs (R-Mobile A1, RZ/A1H, RZ/A2M, R-Car
H1, R-Car M2-W).

Thanks for your comments!

Geert Uytterhoeven (3):
  net: sh_eth: Remove dummy Runtime PM callbacks
  net: sh_eth: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  net: sh_eth: Use async pm_runtime_put()

 drivers/net/ethernet/renesas/sh_eth.c | 30 ++++-----------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

