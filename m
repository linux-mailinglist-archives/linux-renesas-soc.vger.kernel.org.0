Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12F72C66B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 14:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730494AbgK0NWI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 08:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbgK0NWI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:22:08 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFBEC0613D1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 05:22:08 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id xRN32300f4C55Sk01RN37D; Fri, 27 Nov 2020 14:22:06 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-0065FQ-Fe; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-000K9v-2I; Fri, 27 Nov 2020 14:22:03 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL 3/3] Renesas driver updates for v5.11 (take two)
Date:   Fri, 27 Nov 2020 14:21:55 +0100
Message-Id: <20201127132155.77418-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit cf25d802e029c31efac8bdc979236927f37183bd:

  soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains() (2020-10-26 10:00:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.11-tag2

for you to fetch changes up to 8b6bed678428b6df66741cb0956e076d579e3891:

  soc: renesas: rmobile-sysc: Stop using __raw_*() I/O accessors (2020-11-27 14:09:37 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.11 (take two)

  - Stop using __raw_*() I/O accessors.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: rmobile-sysc: Stop using __raw_*() I/O accessors

 drivers/soc/renesas/rmobile-sysc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
