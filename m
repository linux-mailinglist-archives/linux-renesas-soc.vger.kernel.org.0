Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE7F4B27B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Feb 2022 15:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241051AbiBKOTs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Feb 2022 09:19:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346037AbiBKOTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 09:19:47 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565A026D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Feb 2022 06:19:45 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
        by albert.telenet-ops.be with bizsmtp
        id tqKi260043ZSXJh06qKiu0; Fri, 11 Feb 2022 15:19:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIWlx-000M8j-KY; Fri, 11 Feb 2022 15:19:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIWLx-00Gh94-Nh; Fri, 11 Feb 2022 14:52:49 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v5.18
Date:   Fri, 11 Feb 2022 14:52:14 +0100
Message-Id: <cover.1644587209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644587197.git.geert+renesas@glider.be>
References: <cover.1644587197.git.geert+renesas@glider.be>
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

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.18-tag1

for you to fetch changes up to 4b4a0fd666303a06bbe159552bc055b490b77cdc:

  dt-bindings: power: renesas,rzg2l-sysc: Document RZ/V2L SoC (2022-01-24 10:45:14 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.18

  - Document support for the new RZ/V2L SoC and the RZ/V2L SMARC EVK
    board.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: arm: renesas: Document Renesas RZ/V2L SoC on SMARC EVK
      dt-bindings: power: renesas,rzg2l-sysc: Document RZ/V2L SoC

 Documentation/devicetree/bindings/arm/renesas.yaml              | 9 +++++++++
 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml | 7 ++++---
 2 files changed, 13 insertions(+), 3 deletions(-)
