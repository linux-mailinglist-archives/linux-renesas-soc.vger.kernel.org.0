Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC960514798
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237494AbiD2K4D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237725AbiD2Kzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:55:55 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4BD4EDEA;
        Fri, 29 Apr 2022 03:52:33 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 411FDFF808;
        Fri, 29 Apr 2022 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651229552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=47f5CkZ51Myfo+gccHSm9Z0rncUryFnISEYnNJWOrTs=;
        b=UPGki2FZclsfBmCdsbMiTTjrDUacq2Si4WhmmKVZ1R3o+7OHmsZtSQ1bbqVfjnjvx53FER
        fFvOjtEqi5Et/H57h1hH4uM/tKH4mmhalyZjr9iJ3FxgLzIGtPHyveBTAooQFSIyXgSA6M
        2OTCwRT5cRI5BctQwaZ2d0jiiOngIuVMFM8qCPfGbYcFGDvk/U/x7yjTfseXkUOUW7oStI
        RYOrzljRIUAs2+X/PDsWHq0u1pJ6AQdtAK450uICdqrSDMjmbEXCxG0qSa7s/hxdMohL5d
        8IGDh/a25kXwzsQP1gXzcBXFLtv2kc8Qhb9WiMTUqFqPoMP6bm5XRu0HY8upJA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] mtd: rawnand: renesas: Runtime PM use
Date:   Fri, 29 Apr 2022 12:52:26 +0200
Message-Id: <20220429105229.368728-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Miquel Raynal (3):
  dt-bindings: mtd: renesas: Fix the NAND controller description
  ARM: dts: r9a06g032: Fix the NAND controller node
  mtd: rawnand: renesas: Use runtime PM instead of the raw clock API

 .../bindings/mtd/renesas-nandc.yaml           |  5 ++
 arch/arm/boot/dts/r9a06g032.dtsi              |  1 +
 .../mtd/nand/raw/renesas-nand-controller.c    | 58 +++++++++----------
 3 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.27.0

