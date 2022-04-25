Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0103C50E668
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243705AbiDYRIo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240496AbiDYRIn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:08:43 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDF8C26AF7;
        Mon, 25 Apr 2022 10:05:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="119104469"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2022 02:05:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 377814004D06;
        Tue, 26 Apr 2022 02:05:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/13] Add CAN, Audio, USB, WDT and Timer support
Date:   Mon, 25 Apr 2022 18:05:17 +0100
Message-Id: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add support for CAN, Audio, USB, WDT and Timer
on RZ/G2UL SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20220425095244.156720-1-biju.das.jz@bp.renesas.com/T/#t

Biju Das (13):
  arm64: dts: renesas: r9a07g043: Add I2C2 node and fillup the
    I2C{0,1,3} stub nodes
  arm64: dts: renesas: r9a07g043: Add SSI{1,2,3} nodes and fillup the
    SSI0 stub node
  arm64: dts: renesas: r9a07g043: Add USB2.0 support
  arm64: dts: renesas: r9a07g043: Fillup the CANFD stub node
  arm64: dts: renesas: r9a07g043: Fillup the OSTM{0,1,2} stub nodes
  arm64: dts: renesas: r9a07g043: Fillup the WDT{0,2} stub nodes
  arm64: dts: renesas: rzg2ul-smarc: Enable i2c{0,1} and wm8978
  arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu sound_dai nodes
    from common dtsi
  arm64: dts: renesas: rzg2ul-smarc: Enable Audio
  arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support
  arm64: dts: renesas: rzg2ul-smarc: Enable CANFD
  arm64: dts: renesas: rzg2ul-smarc-som: Enable OSTM
  arm64: dts: renesas: rzg2ul-smarc-som: Enable watchdog

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 322 +++++++++++++++++-
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |  76 -----
 .../boot/dts/renesas/rz-smarc-common.dtsi     |   8 -
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  13 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |  13 +
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  56 +++
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi    |  18 +
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |  41 +++
 8 files changed, 445 insertions(+), 102 deletions(-)

-- 
2.25.1

