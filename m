Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EDA1BF36E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2020 10:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgD3Isy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Apr 2020 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726832AbgD3Isy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:48:54 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D9EC08ED7D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2020 01:48:53 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by michel.telenet-ops.be with bizsmtp
        id Ywor2200a0w8ZL606worug; Thu, 30 Apr 2020 10:48:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0002lF-KZ; Thu, 30 Apr 2020 10:48:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0000Oa-JG; Thu, 30 Apr 2020 10:48:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas DT binding updates for v5.8
Date:   Thu, 30 Apr 2020 10:48:49 +0200
Message-Id: <20200430084849.1457-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430084849.1457-1-geert+renesas@glider.be>
References: <20200430084849.1457-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v5.8-tag1

for you to fetch changes up to 9e01d74ce0a154411c8991d6e34f4c470958eac3:

  dt-bindings: reset: rcar-rst: Document r8a7742 reset module (2020-04-28 10:09:56 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v5.8

  - Document System Controller (SYSC) and Reset (RST) support for
    RZ/G1H.

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: power: rcar-sysc: Document r8a7742 SYSC binding
      dt-bindings: reset: rcar-rst: Document r8a7742 reset module

 Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml | 1 +
 Documentation/devicetree/bindings/reset/renesas,rst.yaml       | 1 +
 2 files changed, 2 insertions(+)
