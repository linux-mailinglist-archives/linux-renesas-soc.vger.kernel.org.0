Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2B72A4B50
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 17:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbgKCQZF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 11:25:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:51754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgKCQZE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 11:25:04 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1397E223C7;
        Tue,  3 Nov 2020 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604420704;
        bh=KmXSDLIUyhLlsIyTxtF/O+VdNgM2OIydEXth8aYL6Lg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KZfrEPnPNM+PkDbRo5AtoUpRQoW0pHi/E2SHb9gZguC+OAyql3jlQ5ucFeF/kF0gK
         +efwgmsjoQLdSX5rkK1SbK79eidFkTuDxnri1Wufs/6OokmjvMtBgO7tTvm7XZc1Ts
         o/6ww0+usBpsNcb7lcVXKpeliAMmrCeyMByCMq0Y=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 7/8] clk: renesas: renesas-cpg-mssr: fix kerneldoc of cpg_mssr_priv
Date:   Tue,  3 Nov 2020 17:24:34 +0100
Message-Id: <20201103162435.13689-7-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103162435.13689-1-krzk@kernel.org>
References: <20201103162435.13689-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The struct cpg_mssr_priv missed proper formatting:

    drivers/clk/renesas/renesas-cpg-mssr.c:142: warning:
        cannot understand function prototype: 'struct cpg_mssr_priv '

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 94db88370337..1c3215dc4877 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -119,7 +119,8 @@ static const u16 srstclr_for_v3u[] = {
 };
 
 /**
- * Clock Pulse Generator / Module Standby and Software Reset Private Data
+ * struct cpg_mssr_priv - Clock Pulse Generator / Module Standby
+ *                        and Software Reset Private Data
  *
  * @rcdev: Optional reset controller entity
  * @dev: CPG/MSSR device
-- 
2.25.1

