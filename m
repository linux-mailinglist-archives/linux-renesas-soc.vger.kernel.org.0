Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1848056B871
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jul 2022 13:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237210AbiGHL0u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jul 2022 07:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237336AbiGHL0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jul 2022 07:26:48 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C7B904E1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jul 2022 04:26:46 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id sbSk2700W4C55Sk06bSkUW; Fri, 08 Jul 2022 13:26:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o9m8C-002baI-3o; Fri, 08 Jul 2022 13:26:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o9m8A-00BLW6-Oz; Fri, 08 Jul 2022 13:26:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM DT updates for v5.20 (take two)
Date:   Fri,  8 Jul 2022 13:26:34 +0200
Message-Id: <cover.1657278845.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657278843.git.geert+renesas@glider.be>
References: <cover.1657278843.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3c7742a45c170430001c5a1767d9dd76686dc14d:

  ARM: dts: rza2mevb: Fix LED node names (2022-06-17 09:46:20 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.20-tag2

for you to fetch changes up to fec6d133cee53971841159c33e95b17b421dd0a1:

  arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards (2022-07-07 11:05:00 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.20 (take two)

  - Ethernet MAC and switch support for the RZ/N1 SoC on the RZN1D-DB
    development board,
  - AA1024XD12 panel overlay support for the Draak, Ebisu, and
    Salvator-X(S) development boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Chris Paterson (1):
      arm64: dts: renesas: r9a07g054l2-smarc: Correct SoC name in comment

Clément Léger (5):
      ARM: dts: r9a06g032: Describe MII converter
      ARM: dts: r9a06g032: Describe GMAC2
      ARM: dts: r9a06g032: Describe switch
      dt-bindings: net: pcs: add bindings for Renesas RZ/N1 MII converter
      ARM: dts: r9a06g032-rzn1d400-db: Add switch description

Geert Uytterhoeven (3):
      arm64: dts: renesas: r8a779m8: Drop operating points above 1.5 GHz
      ARM: dts: renesas: Fix DA9063 watchdog subnode names
      arm64: dts: renesas: spider-cpu: Fix scif0/scif3 sort order

Laurent Pinchart (3):
      arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay support
      arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
      arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards

 .../bindings/net/pcs/renesas,rzn1-miic.yaml        | 171 +++++++++++++++++++++
 arch/arm/boot/dts/r8a7790-lager.dts                |   2 +-
 arch/arm/boot/dts/r8a7790-stout.dts                |   2 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |   2 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |   2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts              |   2 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |   2 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |   2 +-
 arch/arm/boot/dts/r8a7794-silk.dts                 |   2 +-
 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi     |  39 -----
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts        | 115 ++++++++++++++
 arch/arm/boot/dts/r9a06g032.dtsi                   | 108 +++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   3 +
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dts    |  36 +++++
 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi   |  30 ++++
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  18 +--
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi          |   5 +
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |   2 +-
 .../boot/dts/renesas/salvator-panel-aa104xd12.dts  |  36 +++++
 include/dt-bindings/net/pcs-rzn1-miic.h            |  33 ++++
 20 files changed, 555 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
 delete mode 100644 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
 create mode 100644 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
 create mode 100644 include/dt-bindings/net/pcs-rzn1-miic.h
