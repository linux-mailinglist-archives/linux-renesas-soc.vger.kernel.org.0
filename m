Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3577E2D5D6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 15:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388144AbgLJOVe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 09:21:34 -0500
Received: from mail.iot.bzh ([51.75.236.24]:7715 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388308AbgLJOVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 09:21:34 -0500
Received: from localhost.localdomain (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id 3B5514009E;
        Thu, 10 Dec 2020 15:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607610031; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uJNIc5kyEM0dCzhwqfm45AEj4LXMAuU6BWTfnwUtvRo=;
        b=R4M2tcW58jaXuzbjDEFeAxpX4KOSRT6dvifds5DdePtar3ver7YUXPuWeTdabHjBi/5lyt
        XhRbXuCQxf51xQVNgO9PRaebj0ksIvbKSN6b1/B5gvSMQfo3K9NB2X27NwEBCeSlIn4HnT
        VldaEAGLX9T152Bvl3LGke8Jc1XZZgA3v6J1t0F0pa1f+eShZzmCS2hbxPbnNWnACAZKTp
        mx0htv3IvM0EL5qP+TBARiptb6hjD2YO/dCgHmrVh7mHOzjz/ULHsolmEvwi8FVbwja/ei
        uzbrXGYeP9j2n+eB8uZl0hjB+2MC1vtklr47C6dAKdz+8z5HbylPR+KZWj70fw==
From:   Julien Massot <julien.massot@iot.bzh>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH 4/5] clk: renesas: r8a77990: Add MFIS clock
Date:   Thu, 10 Dec 2020 15:20:20 +0100
Message-Id: <20201210142021.163182-5-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210142021.163182-1-julien.massot@iot.bzh>
References: <20201210142021.163182-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 2b97ab61d044..c5a97556b557 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -133,6 +133,7 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 	DEF_MOD("msiof2",		 209,	R8A77990_CLK_MSO),
 	DEF_MOD("msiof1",		 210,	R8A77990_CLK_MSO),
 	DEF_MOD("msiof0",		 211,	R8A77990_CLK_MSO),
+	DEF_MOD("mfis",			 213,	R8A77990_CLK_S2D2),
 	DEF_MOD("sys-dmac2",		 217,	R8A77990_CLK_S3D1),
 	DEF_MOD("sys-dmac1",		 218,	R8A77990_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A77990_CLK_S3D1),
-- 
2.29.2

