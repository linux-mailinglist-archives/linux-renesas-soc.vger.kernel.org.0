Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E921460687
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Nov 2021 14:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357573AbhK1Nge (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Nov 2021 08:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhK1Nee (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Nov 2021 08:34:34 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0ED0C0619D3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Nov 2021 05:24:44 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id u1so30409525wru.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Nov 2021 05:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V4B0XKpXquoJyaIL0mskRvebeDdCLQLvdHdrJVi3yY0=;
        b=CKp1IcB1DLdjZKkgcv84NVN1WFf2w2trOJogNXwiBAGfdKzByPfMRWt8cqC4EAnjd6
         Kl/8gNDNSB9+zeEduM90T8fg3sB1ykrklcYxoNTwwvV6HNCBLYIWk6EFZVaYzhx9+P96
         GxXDRs+qHTjE7650zdh+9uAEN3Fad2NsbijkxrPxvVrCt5vQ8oE0Ad8HHmkRA26e+Ml2
         a/dLRmfOVbxySYcWc8yLU5NZEodMciz4bsaoTs8fCr5ibzeKj2hPm692z9oQuHbnXkJK
         e4AirsOTvWki1tv/Zb8b/rMyI3D7NDp2r7E249LFEJcBmjJlpe0jWj9K98IssRwMlhMo
         CTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V4B0XKpXquoJyaIL0mskRvebeDdCLQLvdHdrJVi3yY0=;
        b=3uCVRLgtUEE2CSJ0673S7jfcR06v3SsEp3EqIi35Rqt65x7ImhvsD2jqHITZ1CtlQB
         ArqD6luEJcFMkQdqOdPtNya9KPBhCJLxHontwkiN0RcuQlYtC0WZMe7hrb404LRmwyN7
         3zWZfSNWeH/nlhCrdok/WE3ee+Et+HoWL4fK1U/okmETMX0GyAGEONrncXPtZVGxApF1
         HmyT3Aj8EHDAhXEfP1jFTTd0H0dEzcBw/f02vvB9sB9bAfWHqnrnfKhKd2AmhjrTD1uX
         xaqxlqVXrj5MkbzYMN2y+lZAoofowYYU4lzvX1UcpXWPIl7fZUnhvrqC04cWSzsMeyIq
         JeAw==
X-Gm-Message-State: AOAM532X0JoXYpza4e4t9ZjSQ8EWAq1Eq7YOI0Glfmi4/TW1uVDtVhIn
        joM9G+6QkhZAEF/J76PiCzsy2g==
X-Google-Smtp-Source: ABdhPJxlLuBNBZ5dQ1Nb0gSVklBciUH+t1d0ON54EMJoLqH9vmnlZ7TXe7lUfn2/heQVnwwORjT2Lg==
X-Received: by 2002:a5d:6101:: with SMTP id v1mr27772473wrt.598.1638105883413;
        Sun, 28 Nov 2021 05:24:43 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id z6sm10746685wrm.93.2021.11.28.05.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:24:43 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-csi2: Suppress bind and unbind nodes in sysfs
Date:   Sun, 28 Nov 2021 14:24:26 +0100
Message-Id: <20211128132426.142454-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The v4l2-async framework's subdev notifiers do not behave correctly if a
device in the middle of the pipeline is unbound and then rebound. The
v4l2-subdevices upstream from the device being rebound gets confused as
they receive no notification of the device unbound and can't cleanup
their state and when they are rebound to the new v4l2-subdev notifier
they try to reinitialize their internal state, this may include things
as trying to create links that already exists and in some cases crash
the system, for example the adv748x.

This should be solved in the v4l2-async framework, but as a stop-gap
measure suppress the bind and unbind sysfs nodes for the rcar-csi2
driver so it can't be used to crash the system.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 11848d0c4a55cb4c..37cc46b9201e0546 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1498,6 +1498,7 @@ static struct platform_driver rcar_csi2_pdrv = {
 	.probe	= rcsi2_probe,
 	.driver	= {
 		.name	= "rcar-csi2",
+		.suppress_bind_attrs = true,
 		.of_match_table	= rcar_csi2_of_table,
 	},
 };
-- 
2.34.1

