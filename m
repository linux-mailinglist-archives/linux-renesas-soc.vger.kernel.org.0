Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBC0769162
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Jul 2023 11:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjGaJSK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 05:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbjGaJR6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:17:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4952E71
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:17:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP1B-00009y-4C; Mon, 31 Jul 2023 11:16:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP19-0005kT-Dk; Mon, 31 Jul 2023 11:16:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQP18-009GVG-Dt; Mon, 31 Jul 2023 11:16:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Viresh Kumar <vireshk@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/12] ata: Convert to platform remove callback returning void
Date:   Mon, 31 Jul 2023 11:16:24 +0200
Message-Id: <20230731091636.693193-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jj4wo0S3Efs2u1BvOJU6kTzRd+MNw2IKhKeYa0FEOZY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkx3t9JMHXRQK5SQxAGnl9L5SkSHsCcVuAZE2Cv DftVIS6SIiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMd7fQAKCRCPgPtYfRL+ TnosB/9WKC1mzccEa/CzhWYncgrMUjQCxQ+BhxlB+iO7sCeaNQOhz+F6C/ZtZ9RD6fpkJSCwUAi A+0zji1PUMltFJp0ccD3lE9BRPduX+UiPi21G5T+b1xz0IuHUtvSCQ8uZanzGwmzylmu0TZIV3H B8qQkyB1GAQcBD+gOTKKj1QrOB8dIGfcI1rTtWLkjc1VZPSbzth9p5oUKLm9yh0A8QKbcBfA7kC Br9YMchcX5xa6cJNGmCaUuY1Ugjl13Lo+ELqP+PKUe9n/OZ/dnZ5dRn9fDjgoS15cYK7VuOAixl tfpEv7Jsfn0NkurM1cYnjNs1qLtPQrAjkkRJcB/WrELiWvzr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

this series adapts the platform drivers below drivers/ata to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers touched here returned zero unconditionally in their remove
callback, so they could all be converted trivially to .remove_new().

Once all drivers are converted to .remove_new(), .remove() will be changed to
match today's .remove_new(). Then the drivers here will be converted back
trivially using s/remove_new/remove/. Given the amount of platform drivers this
is still a bit in the future, though.

Best regards
Uwe

Uwe Kleine-König (12):
  ata/pata_arasan_cf: Convert to platform remove callback returning void
  ata/pata_ep93xx: Convert to platform remove callback returning void
  ata/pata_ftide010: Convert to platform remove callback returning void
  ata/pata_imx: Convert to platform remove callback returning void
  ata/pata_mpc52xx: Convert to platform remove callback returning void
  ata/pata_pxa: Convert to platform remove callback returning void
  ata/pata_rb532_cf: Convert to platform remove callback returning void
  ata/sata_dwc_460ex: Convert to platform remove callback returning void
  ata/sata_fsl: Convert to platform remove callback returning void
  ata/sata_gemini: Convert to platform remove callback returning void
  ata/sata_mv: Convert to platform remove callback returning void
  ata/sata_rcar: Convert to platform remove callback returning void

 drivers/ata/pata_arasan_cf.c | 6 ++----
 drivers/ata/pata_ep93xx.c    | 5 ++---
 drivers/ata/pata_ftide010.c  | 6 ++----
 drivers/ata/pata_imx.c       | 6 ++----
 drivers/ata/pata_mpc52xx.c   | 6 ++----
 drivers/ata/pata_pxa.c       | 6 ++----
 drivers/ata/pata_rb532_cf.c  | 6 ++----
 drivers/ata/sata_dwc_460ex.c | 5 ++---
 drivers/ata/sata_fsl.c       | 6 ++----
 drivers/ata/sata_gemini.c    | 6 ++----
 drivers/ata/sata_mv.c        | 5 ++---
 drivers/ata/sata_rcar.c      | 6 ++----
 12 files changed, 24 insertions(+), 45 deletions(-)


base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.39.2

