Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54CE13ECE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2020 18:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393906AbgAPR7Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jan 2020 12:59:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:32952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393858AbgAPRnE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jan 2020 12:43:04 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5CDE246A4;
        Thu, 16 Jan 2020 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196584;
        bh=utfuyT7Q1uu5mYJ/DtQc89mIDpbRAUZTdQut8wJD7ww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ye4r8z98krycA8u09qwM9cadxSKgFSvcvDMsWDN83gLybJpdgomv4VJrDy9Rw+rW/
         J5inFyaMP9upYrL2zNHUW37eJipUXoXfEaN/5xh+0aB3+XjuR+OSZlBI1CQDte9DXN
         jhn9bagxCYE4jyTHH26oQQj/L06GXEMTKwzO3TjE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 009/174] pinctrl: sh-pfc: r8a7740: Add missing REF125CK pin to gether_gmii group
Date:   Thu, 16 Jan 2020 12:40:06 -0500
Message-Id: <20200116174251.24326-9-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 1ebc589a7786f17f97b9e87b44e0fb4d0290d8f8 ]

The gether_gmii_mux[] array contains the REF125CK pin mark, but the
gether_gmii_pins[] array lacks the corresponding pin number.

Fixes: bae11d30d0cafdc5 ("sh-pfc: r8a7740: Add GETHER pin groups and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
index 279e9dd442e4..aa7c346dff6d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
@@ -1983,7 +1983,7 @@ static const unsigned int gether_gmii_pins[] = {
 	 */
 	185, 186, 187, 188, 189, 190, 191, 192, 174, 161, 204,
 	171, 170, 169, 168, 167, 166, 173, 172, 176, 184, 183, 203,
-	205, 163, 206, 207,
+	205, 163, 206, 207, 158,
 };
 static const unsigned int gether_gmii_mux[] = {
 	ET_ERXD0_MARK, ET_ERXD1_MARK, ET_ERXD2_MARK, ET_ERXD3_MARK,
-- 
2.20.1

