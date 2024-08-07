Return-Path: <linux-renesas-soc+bounces-7763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB494A227
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2024 09:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F3761F22610
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2024 07:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659D61C8227;
	Wed,  7 Aug 2024 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkqZPmQM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355031C7B7C;
	Wed,  7 Aug 2024 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723017439; cv=none; b=ifkCMoES2QABhzGPPVvXAC9ERgesk45qC/ztiQ51W17kz4GAyKP04vIELCwBzUYPDTPFni9GX/SEfMUhcE9n+3rc1qpl/9mw5/JV2QxroKe7q22ByWCGwmgiz60jqOjvCCs5LEAuAf7p1vwcOFPIUkONkGcMwM+M2fiCn7rARUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723017439; c=relaxed/simple;
	bh=s08IpeR5OJliwFxXvYuOnvxCOlF6Vzqg/pmxO7QBo+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fweAG37v/qHUTpr1bowjbrz83X9yqKkMshCu2Qc/F3EH7mKe1/JG7e+Y38IEX4qHxFOC3RIGQ62x24HmjQ1W/N6pdIQq/6QEuLlUp+kKdPqWXs46KuhHB+g6uc+2DjMQr+BSjmvmFd0iHCNrzOKhivM5UGp2RDJJuru0hfJaj5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkqZPmQM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AEFC4AF10;
	Wed,  7 Aug 2024 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723017439;
	bh=s08IpeR5OJliwFxXvYuOnvxCOlF6Vzqg/pmxO7QBo+c=;
	h=From:To:Cc:Subject:Date:From;
	b=ZkqZPmQMHNYrrcOgKiaBDlMdww75Py2+QzisIWH+oKPgxnP1zzlBSCvZX7fMXDwxq
	 GLkcCV92AsnN9pk51mNosUc1j0W/3SxSri4erDpXKpmdmYS2UskYyFK6ImL7t0U0Rm
	 9cm4nUVQBhzMQvKwfvI1uCd0ZXL0Xie+Bwt8J1EzJjY5MnV4lltBrOHuWIVCdN3VJ9
	 B0jHOUX3AMcQAcVNLSwPYtG9T6JLBd1wsQXBBbDNh/PlqEa9VJltGrD3L3MVZydH5d
	 tEQ7J+7mYLjmOHidIJmgi39UobbACTGyVd76p4ej7CP7l9J5xuQXoXqpehHFwNfe4p
	 1lrz1XsNukX8Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: renesas: fix r9a09g057_cpg_info link error
Date: Wed,  7 Aug 2024 09:56:58 +0200
Message-Id: <20240807075714.2156445-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The rzv2g-cpg.c driver unconditionally links into the r9a09g057
one, but that may be disabled:

aarch64-linux-ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0x440): undefined reference to `r9a09g057_cpg_info'

Use the same approach here as with the rzg2l variant, using an #ifdef
around tha data.

I think both drivers would be better off doing the abstraction the other
way round, with the platform_driver structure defined in the most specific
file and the common bits as a library that exports common functions.
Changing it that way would require a larger rework of course.

Fixes: 42b54d52ecb7 ("clk: renesas: Add RZ/V2H(P) CPG driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/renesas/rzv2h-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index bc0c3bbdb997..34221046dc46 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -664,10 +664,12 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
+#ifdef CONFIG_CLK_R9A09G057
 	{
 		.compatible = "renesas,r9a09g057-cpg",
 		.data = &r9a09g057_cpg_info,
 	},
+#endif
 	{ /* sentinel */ }
 };
 
-- 
2.39.2


