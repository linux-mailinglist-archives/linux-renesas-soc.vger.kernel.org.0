Return-Path: <linux-renesas-soc+bounces-10749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3039DB499
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 10:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74700281E6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 09:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705D71552FD;
	Thu, 28 Nov 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fYlXkKL7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199206A8D2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Nov 2024 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732785083; cv=none; b=D9XK1qirdr2VDP6koByNer/uvE0gk45r34EeP/PLDhXNItC2ycsqmouagKWRBmOIiqz5RGC2VN3at716ZeK1bI7/i/MK+IJ57WZXTt9W4NC04CjsOCvGPRpGGquWGX/zQtNJdxAVHN3eWqsFgQ3HbKV9BMTxLnhzjbgJUyaglOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732785083; c=relaxed/simple;
	bh=pWhmKiDlZK9+9akVZ9p+hpCt4xgqv9qWpIdisBGhkUM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MgCCddgnX/Mcomto3OYoX3uvQ19hcSMYTPsBuYsDpWwZxay0Y3MLMM3UV+VRn5zhUeAfB7Zj2Y55lGhjcVUfZy1p0qqAAej5mq5fPOJbOBIXgU89UlWd+/LvgKwFtH8eMrE+ChRrSl9KlGJf84nVDV9qnpS69OFZ3wF0/HJCNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fYlXkKL7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=t87BuDPy5GD+n7
	KY0W2pe18qhCcVJgAIqIqyd8ApIwE=; b=fYlXkKL7pUdD3znd78u0x/JMCwyUDo
	J9OuFTrCAgQqaUvpEP8nSlNOFsve9UtuzHOk4Uj75BqCeznpelSpuIfrqld4FLnX
	H4lSNRr6TnDJkxlJOnjFqKtv95370Bgu1ydOKpVMZf5L+6vrsa00nt9j4WwySJSd
	gs0nOrfz8WJX2REyLMKS1d4ym/odtjWccMAAvgMIj6D69aAW5AFnYaDTmQQun/ZU
	gJHMEaFILLt9ngD9Y0fNI6C5X2z/VXIoMMnk0uoE8Qm4p9/FmLn4mMqwheCfvpCS
	oOktgjVfy3U7KHE3X0JQdRKtPbfR8R2H/Z+T5fHADwQfGBJ/MWPNvLQw==
Received: (qmail 853550 invoked from network); 28 Nov 2024 10:11:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Nov 2024 10:11:19 +0100
X-UD-Smtp-Session: l3s3148p1@sscYd/UncORehhYU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 0/2] clk: renesas: r9a06g032: add restart handler & clean up
Date: Thu, 28 Nov 2024 10:11:10 +0100
Message-Id: <20241128091113.24116-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset handler for RZ/N1D so 'reboot' finally works.

Changes since v1:
* switched to 'devm_register_sys_off_handler' (Thanks, Geert!)
* broke out 'BIT usage' fix because it is a separate thing

Wolfram Sang (2):
  clk: renesas: r9a06g032: add restart handler
  clk: renesas: r9a06g032: use BIT macro consistently

 drivers/clk/renesas/r9a06g032-clocks.c | 29 +++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

-- 
2.39.2

