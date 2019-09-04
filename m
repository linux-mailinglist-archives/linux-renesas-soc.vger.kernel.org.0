Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B1FA820E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 14:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfIDMIF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 08:08:05 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:41378 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfIDMIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:08:05 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id xQ832000l05gfCL01Q83dn; Wed, 04 Sep 2019 14:08:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5U4x-0001aj-IG; Wed, 04 Sep 2019 14:08:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5U4x-0000Ze-GX; Wed, 04 Sep 2019 14:08:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Magnus Damm <damm+renesas@opensource.se>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] iommu/ipmmu-vmsa: Disable cache snoop transactions on R-Car Gen3
Date:   Wed,  4 Sep 2019 14:08:00 +0200
Message-Id: <20190904120802.2163-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Jörg,

According to recent errata, the IOMMU in R-Car Gen3 SoCs does not
support cache snoop transactions for page table walk requests.

Hence this patch series skips the related setup when running on R-Car
Gen3, after doing a customary cleanup of related definitions.

Tested on R-Car H3 ES2.0 with QEMU+KVM and VFIO for EtherAVB.

Thanks!

Geert Uytterhoeven (1):
  iommu/ipmmu-vmsa: Move IMTTBCR_SL0_TWOBIT_* to restore sort order

Hai Nguyen Pham (1):
  iommu/ipmmu-vmsa: Disable cache snoop transactions on R-Car Gen3

 drivers/iommu/ipmmu-vmsa.c | 78 ++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
