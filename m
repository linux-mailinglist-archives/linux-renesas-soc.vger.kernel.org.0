Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154AA46FFF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Dec 2021 12:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240453AbhLJLgH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Dec 2021 06:36:07 -0500
Received: from www.zeus03.de ([194.117.254.33]:39336 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240461AbhLJLgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Dec 2021 06:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=HBGSJTqJZPEsWnlxACLMR2ZFB/n
        N4HLQcOqEP/WTnok=; b=a+4zh2ZIw0+SIubGqU/1B1ON6Q00LywhpQPojOehMQg
        kypThyYZNRGzgO4mA4i3ZKqEERSdSnKsqxynsQNQz/k1+INnEmG6S71rWoZzXJl+
        Jho/SHPRa0ZUCavMqTMyrQkRMZjPVprAjTe6oNOvQNqeM/sMgPFUCZEVbAGbM+rk
        =
Received: (qmail 1447484 invoked from network); 10 Dec 2021 12:32:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Dec 2021 12:32:31 +0100
X-UD-Smtp-Session: l3s3148p1@ZGMVFMnSpJEgAQnoAEPjAJzPXF1eIEK3
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] pinctrl: renesas: rcar: don't enforce GPIO if already muxed
Date:   Fri, 10 Dec 2021 12:32:26 +0100
Message-Id: <20211210113226.40111-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For Renesas PFCs not setting .strict, we can snoop GPIOs which are
already muxed to some other function. To actually make use of that, we
shouldn't mux them back to GPIO if they have been already muxed to
something.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Not sure if this is a proper solution, but at least this is a
proof-of-concept. It makes the sloppy GPIO analyzer work by assigning it
GPIOs which are already muxed to, say, I2C or PWM. I didn't see any
side-effects, but there may be some I missed. Tested on a Salvator-XS
with R-Car M3-N where the only occasions of MUX+GPIO at the same time
were the logic analyzer. AFAIU if '.strict' is set, the request will be
rejected at higher levels, so on those systems should be no harm.

 drivers/pinctrl/renesas/pinctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl.c b/drivers/pinctrl/renesas/pinctrl.c
index f3eecb20c086..8d4541ac43a9 100644
--- a/drivers/pinctrl/renesas/pinctrl.c
+++ b/drivers/pinctrl/renesas/pinctrl.c
@@ -397,7 +397,7 @@ static int sh_pfc_gpio_request_enable(struct pinctrl_dev *pctldev,
 
 	spin_lock_irqsave(&pfc->lock, flags);
 
-	if (!pfc->gpio) {
+	if (!pfc->gpio && !cfg->mux_mark) {
 		/* If GPIOs are handled externally the pin mux type needs to be
 		 * set to GPIO here.
 		 */
-- 
2.30.2

