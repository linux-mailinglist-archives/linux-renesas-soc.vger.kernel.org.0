Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 203514E2AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfFUJLU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:11:20 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJLU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:11:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6866125AD85;
        Fri, 21 Jun 2019 19:11:18 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 71EA39408C4; Fri, 21 Jun 2019 11:11:16 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v5.3
Date:   Fri, 21 Jun 2019 11:10:54 +0200
Message-Id: <cover.1561107729.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT bindings updates for v5.3.

I have collected CMT and CAN controller patches that were slipping through
the cracks into this pull request. They have been acked by the relevant
maintainers.


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v5.3

for you to fetch changes up to 74a22e8f4350a9e096c84fc9e88cf72abf71887c:

  dt-bindings: display: renesas: Add r8a774a1 support (2019-06-19 15:49:46 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Bindings Updates for v5.3

* Renesas Gen3 DWC HDMI TX Encoder
  - Add RZ/G2M (r8a774a1) support

* Renesas R-Car Compare Match Timer (CMT)
 - Add R-Car H3 (r8a7795), M3-N (r8a77965) and E3 (r8a77990) support

* Renesas R-Car CAN FD Controller
  - Add R-Car M3-N (r8a77965) and E3 (r8a77990), and RZ/G2E (r8a774c0) support

* Renesas R-Car CAN Controller
  - Add RZ/G2M (r8a774a1) support
  - Correct RZ/G2 clocks

* Vendor prefixes: Add vendor prefix for HopeRun

* Renesas SoCs and boards: Add HopeRun RZ/G2[M] boards

----------------------------------------------------------------
Cao Van Dong (1):
      dt-bindings: timer: renesas, cmt: Document r8a779{5|65|90} CMT support

Fabrizio Castro (6):
      dt-bindings: arm: renesas: Add HopeRun RZ/G2[M] boards
      dt-bindings: Add vendor prefix for HopeRun
      dt-bindings: can: rcar_can: Fix RZ/G2 CAN clocks
      dt-bindings: can: rcar_can: Add r8a774c0 support
      dt-bindings: can: rcar_canfd: document r8a774c0 support
      dt-bindings: display: renesas: Add r8a774a1 support

Marek Vasut (2):
      dt-bindings: can: rcar_canfd: document r8a77965 support
      dt-bindings: can: rcar_canfd: document r8a77990 support

 Documentation/devicetree/bindings/arm/renesas.yaml       |  8 ++++++++
 .../bindings/display/bridge/renesas,dw-hdmi.txt          |  4 +++-
 Documentation/devicetree/bindings/net/can/rcar_can.txt   | 13 ++++---------
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 16 ++++++++++------
 Documentation/devicetree/bindings/timer/renesas,cmt.txt  |  6 ++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml   |  2 ++
 6 files changed, 33 insertions(+), 16 deletions(-)
