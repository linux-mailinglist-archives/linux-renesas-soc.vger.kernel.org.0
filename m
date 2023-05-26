Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77ABF712403
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 11:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243229AbjEZJs6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 05:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243225AbjEZJsu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 05:48:50 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCB5E41
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 02:48:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ae30:9d2b:3228:d21])
        by andre.telenet-ops.be with bizsmtp
        id 1Moc2A00A4eYoVn01MocrB; Fri, 26 May 2023 11:48:36 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U3X-0038ju-KZ;
        Fri, 26 May 2023 11:48:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q2U3o-00EFZc-5E;
        Fri, 26 May 2023 11:48:36 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.5
Date:   Fri, 26 May 2023 11:48:31 +0200
Message-Id: <cover.1685094244.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685094238.git.geert+renesas@glider.be>
References: <cover.1685094238.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.5-tag1

for you to fetch changes up to 18cbbdd846c5d74bd56fd1f229d074e1f7068fc8:

  arm64: dts: renesas: r8a779a0: Add PWM nodes (2023-05-08 09:21:51 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.5

  - Add partial display support for the RZ/G2L and RZ/V2L SoCs and the
    RZ/G2L{,C} SMARC EVK development boards,
  - Add camera support for the RZ/GV2L SoC and the RZ/V2L and RZ/G2LC
    SMARC EVK development boards,
  - Add Multi-Function Timer Pulse Unit 3 support for the RZ/G2L and
    RZ/V2L SoCs,
  - Add PWM support for the R-Car V3U SoC.

----------------------------------------------------------------
Biju Das (10):
      arm64: dts: renesas: r9a07g044: Add fcpvd node
      arm64: dts: renesas: r9a07g054: Add fcpvd node
      arm64: dts: renesas: r9a07g044: Add vspd node
      arm64: dts: renesas: r9a07g054: Add vspd node
      arm64: dts: renesas: r9a07g044: Add DSI node
      arm64: dts: renesas: r9a07g054: Add DSI node
      arm64: dts: renesas: rzg2l-smarc: Link DSI with ADV7535
      arm64: dts: renesas: rzg2lc-smarc: Link DSI with ADV7535
      arm64: dts: renesas: r9a07g044: Add MTU3a node
      arm64: dts: renesas: r9a07g054: Add MTU3a node

Lad Prabhakar (3):
      arm64: dts: renesas: r9a07g054: Add CSI and CRU nodes
      arm64: dts: renesas: rzv2l-smarc: Enable CRU, CSI support
      arm64: dts: renesas: rzg2lc-smarc: Enable CRU, CSI support

Phong Hoang (1):
      arm64: dts: renesas: r8a779a0: Add PWM nodes

 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  50 +++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 123 +++++++++++++
 .../renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtso  |  21 +++
 .../renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtso  |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         | 203 +++++++++++++++++++++
 .../renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtso  |   1 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  79 ++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  79 ++++++++
 9 files changed, 559 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtso
 create mode 120000 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtso
