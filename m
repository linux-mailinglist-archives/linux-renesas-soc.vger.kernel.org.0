Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2FFF526057
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 May 2022 12:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379623AbiEMKuD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 May 2022 06:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbiEMKuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 May 2022 06:50:02 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96104296BE3;
        Fri, 13 May 2022 03:50:01 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 39E7BFF810;
        Fri, 13 May 2022 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652439000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=EOnBw339JZrqM43NcFanIyq3YzXvKL8IR0/WPRtOnr0=;
        b=dv8mGuviAjL/9g1H1jG/m6wLkRB5Fon/bb3iJikEI9pBpc7sIRYSIhlw4CLq1bcPeRKp8J
        zcfF2vHZ7vFcNVU6FHOHY/mjLidppUFvu+qKU186e+5uDKWxo28ecJziCyOwE4oZQY4O8h
        UGJKQF1k9SW8Fyinwbzz5H9Tgamml4igqVoQSGpkGEZ15BrrWO7YCsTLL/lmi8/mLMInbV
        5/RJLACBjTJwv5fb/3ycAHohahCkEbZzRq+aSTzWjaDsY1dZrpJIR5BGkHvfrh8ZqZnoE5
        pGW637LNzfqY058RWJhu4z6Rmd830/bI7DbkDDtO67CXnxDRXXxFvkFX063trQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/2] mtd: rawnand: renesas: Runtime PM use
Date:   Fri, 13 May 2022 12:49:55 +0200
Message-Id: <20220513104957.257721-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There was a small mistake when first introducing this controller driver:
the power-domain property was missing in the device tree because there
was only one controller supported at this time (UART) and this is a
Synopsis IP which did not support power domains. The idea is to always
use these power domains when available, so let's add it to the bindings,
the DT and use it from the driver through the runtimpe PM API instead of
doing raw clk API calls.

Changes in v4:
* Use pm_runtime_resume_and_get() instead of pm_runtime_get_sync().

Changes in v3:
* Moved the pm_runtime calls earlier in the probe to avoid possible
  register accesses while the clocks have not yet been enabled.
 
Changes in v2:
* Dropped the DT patch merged by Geert.
* Used devm_pm_runtime_enable() instead of pm_runtime_enable() and
  dropped the pm_runtime_disable() calls.
* Used pm_runtime_resume_and_get() instead of pm_runtime_get_sync().
* Collected the tags on the bindings.

Miquel Raynal (2):
  dt-bindings: mtd: renesas: Fix the NAND controller description
  mtd: rawnand: renesas: Use runtime PM instead of the raw clock API

 .../bindings/mtd/renesas-nandc.yaml           |  5 ++
 .../mtd/nand/raw/renesas-nand-controller.c    | 51 +++++++++----------
 2 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.27.0

