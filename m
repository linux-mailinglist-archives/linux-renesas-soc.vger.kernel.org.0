Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D767509CD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 11:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387941AbiDUJ4q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 05:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387949AbiDUJ4j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 05:56:39 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A9A25C47;
        Thu, 21 Apr 2022 02:53:49 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E1ECC1BF207;
        Thu, 21 Apr 2022 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650534828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vfef994do5FRt+AbCiJzA7csEtqO2gQ1yEzsSrgSqq8=;
        b=ZgreE0I9aw+0ZlpiEHa7QHnMq1BowcNrpAn4q6f2HmaiWREtwgGsiaXvQ6ufsL/3gEd4dt
        +BX5Vo+tMQCDWNcc5u4QCk1cqJ/M7CuZz43LzZ0u0oYHuUBzdJ46MFt3S+zBfP1jMWSf7F
        OJ0OyPudr08Gjhcr0e18zTT5DIpHW5Mws386ktBdQ8X3UfDxPkd0UfBwlkfM6P7JRAcyle
        WRqUwZzzAtmYtwvH88u5y71mbvYXa/9Xa/6L9Qyw/Qu9NEWReHQF20E8cxiKkIIml4eEI6
        UwdJdyD5AyINlZilIsMASOQjUvvjj2RF1ekkkbinZlUlOwf6zHElI2lxw+MncA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 12/12] bestla: Add support for RZN1 dmamux
Date:   Thu, 21 Apr 2022 11:53:23 +0200
Message-Id: <20220421095323.101811-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421095323.101811-1-miquel.raynal@bootlin.com>
References: <20220421095323.101811-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/configs/bestla_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/bestla_defconfig b/arch/arm/configs/bestla_defconfig
index 1d84f44fbf7d..fc573cbdddf4 100644
--- a/arch/arm/configs/bestla_defconfig
+++ b/arch/arm/configs/bestla_defconfig
@@ -66,7 +66,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
 CONFIG_KSM=y
 CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
-CONFIG_CLEANCACHE=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
@@ -106,6 +105,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_DMADEVICES=y
 CONFIG_DW_DMAC=y
+CONFIG_RZN1_DMAMUX=y
 CONFIG_DMATEST=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
-- 
2.27.0

