Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61E946C9EC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 10:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbjC0I7p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 04:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbjC0I7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 04:59:16 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F56355B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 01:57:11 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id dLx82900S1C8whw06Lx8Zd; Mon, 27 Mar 2023 10:57:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgieO-00ExZ3-TN;
        Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgif6-002atq-EB;
        Mon, 27 Mar 2023 10:57:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.4
Date:   Mon, 27 Mar 2023 10:57:03 +0200
Message-Id: <cover.1679907062.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
References: <cover.1679907055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.4-tag1

for you to fetch changes up to d35ad1030a6bce57234b8eea14ab17560f3c9e1b:

  dt-bindings: soc: renesas: Remove R-Car H3 ES1.* (2023-03-10 17:05:22 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.4

  - Document support for the Renesas RZ/N1 EB board with an RZ/N1D-DB
    daughter board,
  - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC.

----------------------------------------------------------------
Clément Léger (1):
      dt-bindings: soc: renesas: renesas.yaml: Add renesas,rzn1d400-eb compatible

Wolfram Sang (1):
      dt-bindings: soc: renesas: Remove R-Car H3 ES1.*

 .../devicetree/bindings/soc/renesas/renesas.yaml          | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)
