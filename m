Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B099AFAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 14:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387932AbfHWMg5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 08:36:57 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:40592 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393115AbfHWMg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 08:36:57 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id sccr2000o05gfCL01ccrcg; Fri, 23 Aug 2019 14:36:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0006Ya-HF; Fri, 23 Aug 2019 14:36:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0004uU-Fx; Fri, 23 Aug 2019 14:36:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 5/5] Renesas DT binding updates for v5.4 (take two)
Date:   Fri, 23 Aug 2019 14:36:43 +0200
Message-Id: <20190823123643.18799-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190823123643.18799-1-geert+renesas@glider.be>
References: <20190823123643.18799-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 8cb7ec14188649cf2151464050413e2814fd7cf1:

  dt-bindings: can: rcar_can: Complete documentation for RZ/G2[EM] (2019-07-29 15:36:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.4-tag2

for you to fetch changes up to 7ac2d56f783d6d546e89a4e44fb46532667aa7a5:

  dt-bindings: can: rcar_can: document r8a77470 support (2019-08-23 14:25:05 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.4 (take two)

  - Renesas DT binding doc filename cleanups,
  - R-Car Gen3 and RZ/G1 updates for the R-Car CAN and CANFD DT
    bindings.

----------------------------------------------------------------
Cao Van Dong (1):
      dt-bindings: can: rcar_can: document r8a77470 support

Marek Vasut (1):
      dt-bindings: can: rcar_can: document r8a77990 support

Niklas Söderlund (1):
      dt-bindings: rcar-{csi2,vin}: Rename bindings documentation files

Simon Horman (2):
      dt-bindings: Rename file of DT bindings for Renesas memory controllers
      dt-bindings: rcar-imr: Rename bindings documentation file

Ulrich Hecht (2):
      dt-bindings: can: rcar_can: document r8a77995 support
      dt-bindings: can: rcar_canfd: document r8a77995 support

 .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}      |  0
 .../bindings/media/{rcar_imr.txt => renesas,imr.txt}       |  0
 .../bindings/media/{rcar_vin.txt => renesas,vin.txt}       |  0
 .../{renesas-memory-controllers.txt => renesas,dbsc.txt}   |  0
 Documentation/devicetree/bindings/net/can/rcar_can.txt     |  6 +++++-
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt   | 14 +++++++-------
 MAINTAINERS                                                |  4 ++--
 7 files changed, 14 insertions(+), 10 deletions(-)
 rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
 rename Documentation/devicetree/bindings/media/{rcar_imr.txt => renesas,imr.txt} (100%)
 rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
 rename Documentation/devicetree/bindings/memory-controllers/{renesas-memory-controllers.txt => renesas,dbsc.txt} (100%)
