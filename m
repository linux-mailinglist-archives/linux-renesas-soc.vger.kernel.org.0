Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16193417BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Mar 2021 09:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhCSIwR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Mar 2021 04:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhCSIv5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Mar 2021 04:51:57 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74AE8C061761
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Mar 2021 01:51:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
        by andre.telenet-ops.be with bizsmtp
        id i8rw240013CXdgx018rwd5; Fri, 19 Mar 2021 09:51:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNArL-008kg4-JK; Fri, 19 Mar 2021 09:51:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNArK-00BMyF-TP; Fri, 19 Mar 2021 09:51:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas driver updates for v5.13
Date:   Fri, 19 Mar 2021 09:51:46 +0100
Message-Id: <20210319085146.2709844-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.13-tag1

for you to fetch changes up to 1d9ffbc6b185561c65a5a599562dbb6c5d66e7d1:

  soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added (2021-03-08 10:25:00 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.13

  - Prepare rmobile-sysc for fw_devlink=on,
  - A minor cleanup.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: rmobile-sysc: Remove unneeded platform includes
      soc: renesas: rmobile-sysc: Mark fwnode when PM domain is added

 drivers/soc/renesas/rmobile-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
