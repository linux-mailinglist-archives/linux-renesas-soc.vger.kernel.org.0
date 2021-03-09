Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40024332247
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 10:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhCIJpD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 04:45:03 -0500
Received: from www.zeus03.de ([194.117.254.33]:47642 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhCIJo4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 04:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=k1; bh=0GdiwLt880S3sdXO/RyJxSgROeU
        rK2LVzRv4wwGhtQo=; b=W7M3g2swvtSrwmKW2hAOO+HXD8PUp4IuycAmiVxPYf/
        oAB3j8GIjzh6mISPbU9HbgRT2YLjgM2ESLFKaV7WNROQe/YKVeqDJ+W/gYP6/0Qu
        Jbbs0709Dn01jC1JfhrGFb9+1YWhlIUy585ndg6EyN2sRgHO0Cuv4dg/Zuu5xsyM
        =
Received: (qmail 3426718 invoked from network); 9 Mar 2021 10:44:53 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2021 10:44:53 +0100
X-UD-Smtp-Session: l3s3148p1@Ihj+Zhe9AosgAwDPXw8WAIb6kxwVO+fo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] clocksource: sh_cmt: don't use CMTOUT_IE with R-Car Gen2/3
Date:   Tue,  9 Mar 2021 10:44:48 +0100
Message-Id: <20210309094448.31823-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CMTOUT_IE is only supported for older SoCs. Newer SoCs shall not set
this bit. So, add a version check.

Reported-by: Phong Hoang <phong.hoang.wz@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* updated $subject
* added tags

 drivers/clocksource/sh_cmt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/sh_cmt.c b/drivers/clocksource/sh_cmt.c
index c98f8851fd68..d7ed99f0001f 100644
--- a/drivers/clocksource/sh_cmt.c
+++ b/drivers/clocksource/sh_cmt.c
@@ -339,8 +339,9 @@ static int sh_cmt_enable(struct sh_cmt_channel *ch)
 		sh_cmt_write_cmcsr(ch, SH_CMT16_CMCSR_CMIE |
 				   SH_CMT16_CMCSR_CKS512);
 	} else {
-		sh_cmt_write_cmcsr(ch, SH_CMT32_CMCSR_CMM |
-				   SH_CMT32_CMCSR_CMTOUT_IE |
+		u32 cmtout = ch->cmt->info->model <= SH_CMT_48BIT ?
+			      SH_CMT32_CMCSR_CMTOUT_IE : 0;
+		sh_cmt_write_cmcsr(ch, cmtout | SH_CMT32_CMCSR_CMM |
 				   SH_CMT32_CMCSR_CMR_IRQ |
 				   SH_CMT32_CMCSR_CKS_RCLK8);
 	}
-- 
2.30.0

