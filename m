Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8573517F22
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbfEHRdw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:33:52 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:54847 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbfEHRdv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:51 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6BEFE1BF20F;
        Wed,  8 May 2019 17:33:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 5/9] drm: rcar-du: Add CMM support for M3-W
Date:   Wed,  8 May 2019 19:34:24 +0200
Message-Id: <20190508173428.22054-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car M3-W provides a CMM for each of it's DU output channel. Add CMM as
a supported feature for the SoC.

Temporary commit to be later expanded to all Gen3 SoCs V3H/M apart.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 75ab17af13a9..984553342b1f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -280,7 +280,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
-		  | RCAR_DU_FEATURE_TVM_SYNC,
+		  | RCAR_DU_FEATURE_TVM_SYNC
+		  | RCAR_DU_FEATURE_CMM,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
 		/*
-- 
2.21.0

