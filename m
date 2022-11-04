Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A5F6194CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 11:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbiKDKuN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 06:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231756AbiKDKuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 06:50:07 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3943F2BB0B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 03:50:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
        by laurent.telenet-ops.be with bizsmtp
        id gAq4280132kjr6L01Aq4SS; Fri, 04 Nov 2022 11:50:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGx-002mVM-Iu; Fri, 04 Nov 2022 11:50:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGw-00HWF8-PG; Fri, 04 Nov 2022 11:50:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DT binding updates for v6.2
Date:   Fri,  4 Nov 2022 11:49:57 +0100
Message-Id: <cover.1667558749.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667558738.git.geert+renesas@glider.be>
References: <cover.1667558738.git.geert+renesas@glider.be>
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

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dt-bindings-for-v6.2-tag1

for you to fetch changes up to 7dd1d57c052e88f98b9e9145461b13bca019d108:

  dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC (2022-10-28 14:43:12 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.2

  - Move renesas.yaml from arm to soc, and document RZ/Five support.

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: soc: renesas: Move renesas.yaml from arm to soc
      dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC

 Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml | 5 +++--
 MAINTAINERS                                                         | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml (98%)
