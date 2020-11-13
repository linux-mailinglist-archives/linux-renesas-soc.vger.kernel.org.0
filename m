Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665222B1E49
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 16:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgKMPJF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 10:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgKMPJE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:04 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A179AC0617A6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2020 07:09:04 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id rr912300J4C55Sk06r91k0; Fri, 13 Nov 2020 16:09:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdahB-0028AP-2j; Fri, 13 Nov 2020 16:09:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdahA-00GSnV-I0; Fri, 13 Nov 2020 16:09:00 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.11
Date:   Fri, 13 Nov 2020 16:08:53 +0100
Message-Id: <20201113150854.3923885-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113150854.3923885-1-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.11-tag1

for you to fetch changes up to cf25d802e029c31efac8bdc979236927f37183bd:

  soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains() (2020-10-26 10:00:14 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.11

  - Fix a mapping leak in the failure path of the R-Mobile System
    Controller driver.

----------------------------------------------------------------
Dan Carpenter (1):
      soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()

 drivers/soc/renesas/rmobile-sysc.c | 1 +
 1 file changed, 1 insertion(+)
