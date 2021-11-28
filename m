Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E04546068A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Nov 2021 14:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhK1Ngh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Nov 2021 08:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbhK1Nef (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Nov 2021 08:34:35 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3938FC0619D6
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Nov 2021 05:24:55 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so14606684wmj.5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Nov 2021 05:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2BkGrl5ffcyh28+HOdP0WTowLX4zgjOhEuvIkhXiSc=;
        b=xAbHHFosTWSkTHYPW4pJtECIxgyUy7zgmcPAGluP1/vc2XWdaR8vB5Hhi5NSNqI1OP
         Yhz7Ep6J/hIZupkniQj8rJDpyW+B+q9HzzWL0gjPOSMHY7WpGXmW0EpQpQGb/yXtNHjE
         UARbvsYIH9jpMGw41W6R+tQsu7e6Gk3nyg7duYIqTH3NMYm3L9Q9WhUNzZOg3DlwX2Kh
         52YmVHSPbvT1zKhCBrzi+UhO4b32YaZ8a/qArm8sX1TfmI1CR1CxMnk66iAjaf/8Fs3M
         OuTD9mokIpQaGh7oZREt5iHRXWyNcy2DUxbIF45rTak7s6wlw0vURwyMjI7+dbWU55lo
         D38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2BkGrl5ffcyh28+HOdP0WTowLX4zgjOhEuvIkhXiSc=;
        b=nKXbMzNKhjL1MTj3724ZmZ+jb5QMjxzpeqFw92d7LsbyQNJbB/ygMbkUXT5jj2PWZC
         7ccsDiaTLX8HOLRDh19M3HpTowcQe+w6jW0i2rQp2+YIk/RXB3WkGT46tV9D6AP0DhXo
         KplpLm3UdhS6faz8ImMf5zY3HB5fdNxH+ZduTSCYtDmXg1yHB14J1sSvqPiisHW2iTRh
         hApfcFsS/smq469PtLyCNovkSCf9azfdym8zKkedgjEid/aIpLnR9jY6vZXlMhVUMdPE
         ooAonDjFWt+i0vJXO3u1QoR7FPouwdK6XEy1cPMpmK3lbfEAS+I/ujOos2OlDYE4a19l
         2Qww==
X-Gm-Message-State: AOAM530gfht6oEeJ82YVn308Fr7i4VtqsyH36EwQ9zP94/cqQgX+Ud/e
        6OGZiSMpj5Q4PHwoa21Xy5/cTA==
X-Google-Smtp-Source: ABdhPJx94++Uzqn4LEt63o0hossE45qAJTFh0KP/LCUaLkhLdl8WLxBLwwPSvBE6tznJpF1mHbg+8g==
X-Received: by 2002:a05:600c:5125:: with SMTP id o37mr28819144wms.81.1638105893843;
        Sun, 28 Nov 2021 05:24:53 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id n15sm17731254wmq.38.2021.11.28.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:24:53 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Disallow unbinding and binding of individual VINs
Date:   Sun, 28 Nov 2021 14:24:47 +0100
Message-Id: <20211128132447.142671-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The VIN driver have an internal concept of capture groups that covers
multiple instances of the driver. This is handled using the shared media
graph and a single notifier shared between all VIN instances.

This design do not work well if an individual VIN where to be unbound on
its own. The design could be improved up on to allow for this but would
require large changes in the v4l2-async framework. To avoid the
situation suppress the bind and unbind nodes in sysfs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index b58c8bbe1cf33908..0186ae235113bb8f 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1618,6 +1618,7 @@ static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
 static struct platform_driver rcar_vin_driver = {
 	.driver = {
 		.name = "rcar-vin",
+		.suppress_bind_attrs = true,
 		.pm = &rvin_pm_ops,
 		.of_match_table = rvin_of_id_table,
 	},
-- 
2.34.1

