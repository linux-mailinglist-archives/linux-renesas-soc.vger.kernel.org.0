Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CC014D09D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2020 19:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgA2SlA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jan 2020 13:41:00 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:63079 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726332AbgA2Sk7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 13:40:59 -0500
X-IronPort-AV: E=Sophos;i="5.70,378,1574089200"; 
   d="scan'208";a="37931796"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2020 03:40:58 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown [10.226.36.164])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 404FB4007F2E;
        Thu, 30 Jan 2020 03:40:57 +0900 (JST)
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Chris Paterson <chris.paterson2@renesas.com>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: [PATCH 0/2] iwg22d-sodimm: enable RGB LCD panel
Date:   Wed, 29 Jan 2020 18:40:51 +0000
Message-Id: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This particular BSP, iWave-G22D, can be shipped in two variants, one with
a small RGB LCD integrated, called Generic SODIMM Development Platform and
another one that uses an RZ/G1E HDMI Add On Module. Both of the variants
are using the same RGB LCD connector.

The two variants can be viewed at the following links:
https://www.iwavesystems.com/rz-g1e-sodimm-development-kit.html
https://mp.renesas.com/en-us/contents/iW-RainboW-G22D-RZG1E_SODIMMDevelopmentPlatform-QuickStartGuide-REL1.0.pdf

The variant with the RZ/G1E HDMI Add On Module has already been supported 
in upstream. This patch-set adds support for the other variant, with the
small RGB LCD.

The RGB LCD driver was submitted upstream via dri-devel list and is
currently under review:
https://patchwork.kernel.org/project/dri-devel/list/?series=234621

Marian-Cristian Rotariu (2):
  ARM: dts: iwg22d-sodimm: enable LCD panel
  ARM: dts: iwg22d-sodimm: disable lcd for extension board

 .../arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 13 +++++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        | 60 ++++++++++++++++++++++
 2 files changed, 73 insertions(+)

-- 
2.7.4

