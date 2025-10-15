Return-Path: <linux-renesas-soc+bounces-23056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 381FDBDE443
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 13:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593B9188A119
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 11:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1FC3176E7;
	Wed, 15 Oct 2025 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AuYOSJPq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C509749C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760527786; cv=none; b=fTQxK/v/xFIrdH9yjfWZhcsqo7xcIIDfWNkvrpCZsSrwKekKJVYSrcPSsr4Xg4fcpzihIWXl7a2CCACdwRFMTjXFXF4Id2UYNsDWpiqPJseViqFXDwW2MRzyMdbWo/XBC8NC1nJI4dGnMYtJB1oEMX8pfs4mfKTm6q3ukQFM9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760527786; c=relaxed/simple;
	bh=cvbc4bQsfp6XJXPd4RR86XSedJxcuv8j3+iJpY/Z290=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdgjd8+qiK3J0QIVKDczUIhyM6Cpuiy/hFO/5fAa2VYll5kBG463nbgRdQaiymtUzxKOWHxuaFONyu9rA4EE8iEiGaMexRRKAN3Nc0Bby5XC4hyOZGX1XlRRKCSOzDQNgcZtDf4QhoBTsEA+XIuvTDVeBg9XxbNLftpF8zZks3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AuYOSJPq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=M2uLmgje3ebm4+
	kl1NOOb5d0r1B8OIFraXJQh54wt3Q=; b=AuYOSJPqfGiIXF7sJjp2f8TXTRX6jf
	kgNKHGGwDxt9EmF6diCEjxTCcM87I9z9g4JLZi3lRcPKZO+T/O9B3dtN25iBartJ
	s0PU3Pt7Nj+Gb9qgjttju99FljNgtA04xOxZKmLy4+NkAnsWreSIWkW3E0RcXoua
	1TyTo6Y9OBXjifVAOjN2r5Sx/VAEWmxQP4nfBes1tzb8sz5pHTkza4vwgkzNkftI
	QJxnZGzrwLu+CLKc1vG5iIo8WGEEd4Xe/SxAUMjPYuWfNjij3t78tFUV8DvZfjWK
	OSnGJHs9B/Ld8Zk1yq2eEny653T5YyD7+6SCHV5QL+3kDUtVu4R5N1hw==
Received: (qmail 3376364 invoked from network); 15 Oct 2025 13:29:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Oct 2025 13:29:41 +0200
X-UD-Smtp-Session: l3s3148p1@L5Tt0DBBxLkujnsG
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [RFC PATCH] reset: always bail out on missing RESET_GPIO driver
Date: Wed, 15 Oct 2025 13:28:59 +0200
Message-ID: <20251015112921.19535-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Optional GPIOs mean they can be omitted. If they are described, a
failure in acquiring them still needs to be reported. When the
RESET_GPIO is not enabled so the reset core cannot provide its assumed
fallback, the user should be informed about it. So, not only bail out
but also give a hint how to fix the situation.

Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Closes: https://lore.kernel.org/r/87a51um1y1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This happened because of this (in general) nice cleanup patch for the
pca954x driver (690de2902dca ("i2c: muxes: pca954x: Use reset controller
only")). Our .config didn't have the RESET_GPIO enabled before, so sound
regressed on some boards.

Actually, my preferred solution would be to make the reset-gpio driver
'obj-y' but I guess its dependency on GPIOLIB makes this a no-go?

On the other hand, the fallback is a really nice feature which could
remove duplicated code. But if the fallback is not present by default,
it makes it cumbersome to use IMO.

Has this been discussed before? I couldn't find any pointers...

Happy hacking, everyone!


 drivers/reset/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 22f67fc77ae5..8a0f41963f6b 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1028,8 +1028,10 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
 	if (ret == -EINVAL)
 		return ERR_PTR(ret);
 	if (ret) {
-		if (!IS_ENABLED(CONFIG_RESET_GPIO))
-			return optional ? NULL : ERR_PTR(ret);
+		if (!IS_ENABLED(CONFIG_RESET_GPIO)) {
+			pr_warn("%s(): RESET_GPIO driver not enabled, cannot fall back\n", __func__);
+			return ERR_PTR(ret);
+		}
 
 		/*
 		 * There can be only one reset-gpio for regular devices, so
-- 
2.47.2


