Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2BDC7B3110
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 13:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjI2LKc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 07:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbjI2LK2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 07:10:28 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE9B1AA
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 04:10:25 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c2e7:1eb0:4c87:ebc6])
        by albert.telenet-ops.be with bizsmtp
        id rnAN2A00B1EgHdD06nANVH; Fri, 29 Sep 2023 13:10:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBNd-004qNi-5T;
        Fri, 29 Sep 2023 13:10:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qmBO2-001frF-5B;
        Fri, 29 Sep 2023 13:10:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas DT binding updates for v6.7
Date:   Fri, 29 Sep 2023 13:10:14 +0200
Message-Id: <cover.1695985425.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
References: <cover.1695985418.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.7-tag1

for you to fetch changes up to 111287aa60004e1a58320048c89391056288c455:

  dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3S SoC (2023-09-18 09:50:30 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.7

  - Document support for the new RZ/G3S (R9A08G045) SoC variants.

----------------------------------------------------------------
Claudiu Beznea (2):
      dt-bindings: soc: renesas: Document Renesas RZ/G3S SoC variants
      dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3S SoC

 .../devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml         | 1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml          | 6 ++++++
 2 files changed, 7 insertions(+)
