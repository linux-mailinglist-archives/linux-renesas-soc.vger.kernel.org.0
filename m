Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89228DC379
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 13:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633624AbfJRLBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 07:01:10 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:47696 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633621AbfJRLBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 07:01:07 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id Ez142100i05gfCL01z148H; Fri, 18 Oct 2019 13:01:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-JW; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPEt-0006s8-Va; Fri, 18 Oct 2019 12:12:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 5/5] Renesas DT binding updates for v5.5
Date:   Fri, 18 Oct 2019 12:11:36 +0200
Message-Id: <20191018101136.26350-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018101136.26350-1-geert+renesas@glider.be>
References: <20191018101136.26350-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.5-tag1

for you to fetch changes up to 4d3cae42544775c71521e8ed5adb64c1839036b9:

  dt-bindings: reset: rcar-rst: Document r8a774b1 reset module (2019-10-01 09:52:34 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.5

  - RZ/G2M update for the Renesas Timer Unit bindings,
  - Support for the new RZ/G2N (r8a774b1) SoC and the HiHope RZ/G2N
    board.

----------------------------------------------------------------
Biju Das (4):
      dt-bindings: arm: renesas: Document RZ/G2N SoC DT bindings
      dt-bindings: arm: renesas: Add HopeRun RZ/G2N boards
      dt-bindings: power: rcar-sysc: Document r8a774b1 sysc
      dt-bindings: reset: rcar-rst: Document r8a774b1 reset module

Fabrizio Castro (1):
      dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings

 Documentation/devicetree/bindings/arm/renesas.yaml           | 12 ++++++++++++
 .../devicetree/bindings/power/renesas,rcar-sysc.txt          |  1 +
 Documentation/devicetree/bindings/reset/renesas,rst.txt      |  1 +
 Documentation/devicetree/bindings/timer/renesas,tmu.txt      |  1 +
 4 files changed, 15 insertions(+)
