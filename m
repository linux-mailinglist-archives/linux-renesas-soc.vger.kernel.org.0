Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F6D1310CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2020 11:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgAFKtN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jan 2020 05:49:13 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:38788 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgAFKtM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 05:49:12 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id myp52100L5USYZQ01yp5Kf; Mon, 06 Jan 2020 11:49:10 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0001yr-Nm; Mon, 06 Jan 2020 11:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0002C3-Mi; Mon, 06 Jan 2020 11:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas DT binding updates for v5.6
Date:   Mon,  6 Jan 2020 11:48:57 +0100
Message-Id: <20200106104857.8361-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106104857.8361-1-geert+renesas@glider.be>
References: <20200106104857.8361-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.6-tag1

for you to fetch changes up to 837b7deb364c3cf927f922d88b6131c8a4f81d0e:

  dt-bindings: can: rcar_canfd: document r8a774b1 support (2019-12-20 15:59:57 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v5.6

  - Document TMU and CAN(FD) support for R-Car RZ/G2N.

----------------------------------------------------------------
Biju Das (1):
      dt-bindings: timer: renesas: tmu: Document r8a774b1 bindings

Fabrizio Castro (2):
      dt-bindings: can: rcar_can: document r8a774b1 support
      dt-bindings: can: rcar_canfd: document r8a774b1 support

 Documentation/devicetree/bindings/net/can/rcar_can.txt   | 5 +++--
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 5 +++--
 Documentation/devicetree/bindings/timer/renesas,tmu.txt  | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)
