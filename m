Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8EA1D4A69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 12:06:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgEOKGC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 06:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728278AbgEOKGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 06:06:01 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E32C05BD09
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 03:06:01 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad37:48f9:900a:523e])
        by andre.telenet-ops.be with bizsmtp
        id ey5w2200N1TfvYq01y5w1g; Fri, 15 May 2020 12:05:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0008Qx-Gb; Fri, 15 May 2020 12:05:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0003pm-EZ; Fri, 15 May 2020 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas DT binding updates for v5.8 (take two)
Date:   Fri, 15 May 2020 12:05:47 +0200
Message-Id: <20200515100547.14671-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515100547.14671-1-geert+renesas@glider.be>
References: <20200515100547.14671-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9e01d74ce0a154411c8991d6e34f4c470958eac3:

  dt-bindings: reset: rcar-rst: Document r8a7742 reset module (2020-04-28 10:09:56 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.8-tag2

for you to fetch changes up to 0b5832238d369a71f90a221d17b92761595c8067:

  dt-bindings: arm: renesas: Document iW-RainboW-G21D-Qseven-RZG1H board (2020-05-15 10:49:27 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.8 (take two)

  - Document support for the RZ/G1H-based iWave RainboW Qseven SOM
    (G21M) and board (G21D).

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: arm: renesas: Document iW-RainboW-G21M-Qseven-RZG1H SoM
      dt-bindings: arm: renesas: Document iW-RainboW-G21D-Qseven-RZG1H board

 Documentation/devicetree/bindings/arm/renesas.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)
