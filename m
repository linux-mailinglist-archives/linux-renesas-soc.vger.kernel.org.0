Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2717F669
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 14:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388544AbfHBMET (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 08:04:19 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:33276 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388541AbfHBMES (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 08:04:18 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id kC4D2000B05gfCL06C4DZD; Fri, 02 Aug 2019 14:04:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1htWI9-0002hX-Pv; Fri, 02 Aug 2019 14:04:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1htWI9-0000PG-Of; Fri, 02 Aug 2019 14:04:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 3/3] Renesas DT binding updates for v5.4
Date:   Fri,  2 Aug 2019 14:03:55 +0200
Message-Id: <20190802120355.1430-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802120355.1430-1-geert+renesas@glider.be>
References: <20190802120355.1430-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.4-tag1

for you to fetch changes up to 8cb7ec14188649cf2151464050413e2814fd7cf1:

  dt-bindings: can: rcar_can: Complete documentation for RZ/G2[EM] (2019-07-29 15:36:39 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.4

  - RZ/G2 updates for the R-Car CAN and CANFD DT bindings.

----------------------------------------------------------------
Fabrizio Castro (2):
      dt-bindings: can: rcar_canfd: document r8a774a1 support
      dt-bindings: can: rcar_can: Complete documentation for RZ/G2[EM]

 Documentation/devicetree/bindings/net/can/rcar_can.txt   | 2 +-
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)
