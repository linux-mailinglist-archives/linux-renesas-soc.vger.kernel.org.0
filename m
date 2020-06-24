Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3450207451
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387915AbgFXNTj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389445AbgFXNTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:19:38 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF28C061796
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:19:37 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by albert.telenet-ops.be with bizsmtp
        id v1KY2200l3ySsk1061KYmJ; Wed, 24 Jun 2020 15:19:36 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-00027f-Qb; Wed, 24 Jun 2020 15:19:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-0000yZ-Pk; Wed, 24 Jun 2020 15:19:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/7] ARM: shmobile: defconfig: Enable ADV7612 CEC support
Date:   Wed, 24 Jun 2020 15:19:30 +0200
Message-Id: <20200624131931.3686-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624131931.3686-1-geert+renesas@glider.be>
References: <20200624131931.3686-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable support for Consumer Electronics Control on the Analog Devices
ADV7612 HDMI receiver, which is used on the Koelsch and Lager boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 345685a52ffc5af5..916ca4941a629577 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -122,6 +122,7 @@ CONFIG_VIDEO_RENESAS_JPU=y
 CONFIG_VIDEO_RENESAS_VSP1=y
 CONFIG_VIDEO_ADV7180=y
 CONFIG_VIDEO_ADV7604=y
+CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
-- 
2.17.1

