Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439B12A3B1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 04:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgKCDpU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Nov 2020 22:45:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgKCDpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 22:45:19 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EAAC0617A6;
        Mon,  2 Nov 2020 19:45:19 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 133so13015773pfx.11;
        Mon, 02 Nov 2020 19:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IGkYOr9kSv+H7KKb1R+3g8Au75L2WHkbPO9Zo0okLME=;
        b=cLTkCxeRjb3wVXVo1lpclGWmt9YKgfJcJbiANuIetykCQ7pWCJ104yyEBWS6MfTjse
         SXCOj2zMXkV18XmSB4QO2wOqKj4pp/0sYMrm5Gx8xjJ9V5hrkV74JUh0/eSQdLma22UB
         pcW2+HYh0tWumbCknlkYMou/uBPoFqqi11kddz+2NURvljua3nIQr5mZeZkrGTlvlDO8
         lADEenOst+6g5O3TfIywtfuZXgq+ojyrXdlAc38Kzj/eTeXioL3EX0HY2URFAkQOnCRR
         T92d2Q1+7jrw3xluU3aSbY2POG+EvTPoiaKUzRgZji7QRN2e1Oh1GYIiKtYi+A98lre/
         700A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IGkYOr9kSv+H7KKb1R+3g8Au75L2WHkbPO9Zo0okLME=;
        b=nnVvuRtenHiBTCdlYJGzwZTLB8PzCHW18vhuLyVxnHV40Q3V9tImY8dYAhZkkdw8rw
         XXY4Mnd8QPOlL/E2Fsstr8GMUeuStF56epuBQNvfjXTqppIhM85zriJ/wf52dDMPUsEn
         gjwwLeGYqhMhT5Y0MZSBXiVQ31flYKv4cm2F42+j33MDJeKtqDnkoazomCXeMiqkZ/z4
         GkA3/uvvKYTTL8L07wQIUYwTm6Wf9MdOEmIqHkBlKlhZC2AY8a+wsixN9GznVXs6I7Z8
         tUi+XzRTaC+PZFpgjDKyOUfXgfuZmTli5CEYir7I35fQ/2Vj4BjDLRSB0L1nb663frwy
         opvQ==
X-Gm-Message-State: AOAM530wgzwVe4Ibyb8h3kbNvC+QMIoAIJplT7tZgEl90gA3FmOYCmZy
        W7HUTnaKsFV4XYQ8D6WlI1g=
X-Google-Smtp-Source: ABdhPJyTvypPwWWcjK5y6JMxUkH5y7X+wPfpxu4c7c6wAPwTVgz5QsXwEgwOykg3KtZNP4WKaGodfw==
X-Received: by 2002:a17:90a:9313:: with SMTP id p19mr1623992pjo.90.1604375119313;
        Mon, 02 Nov 2020 19:45:19 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
        by smtp.gmail.com with ESMTPSA id v196sm7957248pfc.34.2020.11.02.19.45.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2020 19:45:18 -0800 (PST)
From:   Yejune Deng <yejune.deng@gmail.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, yejune.deng@gmail.com
Subject: [PATCH] clk: renesas: rcar-usb2-clock-sel: Replace devm_reset_control_array_get()
Date:   Tue,  3 Nov 2020 11:44:53 +0800
Message-Id: <1604375093-6451-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

devm_reset_control_array_get_shared() looks more readable

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index d4c0298..3abafd7 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -160,7 +160,7 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	priv->rsts = devm_reset_control_array_get(dev, true, false);
+	priv->rsts = devm_reset_control_array_get_shared(dev);
 	if (IS_ERR(priv->rsts))
 		return PTR_ERR(priv->rsts);
 
-- 
1.9.1

