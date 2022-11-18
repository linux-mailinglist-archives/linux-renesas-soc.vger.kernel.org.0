Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E80E62FAA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 17:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242200AbiKRQpW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 11:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242212AbiKRQpS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 11:45:18 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29B961B9D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 08:45:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
        by andre.telenet-ops.be with bizsmtp
        id lslD2800229fmst01slDAx; Fri, 18 Nov 2022 17:45:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UK-000pAC-RR; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UJ-00Frgd-VK; Fri, 18 Nov 2022 17:45:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/7] Renesas DT binding updates for v6.2 (take two)
Date:   Fri, 18 Nov 2022 17:45:01 +0100
Message-Id: <cover.1668788927.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668788918.git.geert+renesas@glider.be>
References: <cover.1668788918.git.geert+renesas@glider.be>
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

The following changes since commit 7dd1d57c052e88f98b9e9145461b13bca019d108:

  dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC (2022-10-28 14:43:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.2-tag2

for you to fetch changes up to a884f187760ee0c6033296aa50845e2d1e0e8430:

  dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration (2022-11-17 20:18:21 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.2 (take two)

  - Document support for the Andes Technology AX45MP RISC-V CPU Core, as
    used on the Renesas RZ/Five SoC,
  - Document support for the Renesas RZ/V2M System Configuration.

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: riscv: Sort the CPU core list alphabetically
      dt-bindings: riscv: Add Andes AX45MP core to the list

Phil Edworthy (1):
      dt-bindings: arm: renesas: Document Renesas RZ/V2M System Configuration

 Documentation/devicetree/bindings/riscv/cpus.yaml  | 11 +++---
 .../soc/renesas/renesas,r9a09g011-sys.yaml         | 43 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g011-sys.yaml
