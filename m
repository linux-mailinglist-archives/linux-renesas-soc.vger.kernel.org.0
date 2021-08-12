Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAB73EA75C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 17:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237914AbhHLPSk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 11:18:40 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:14604 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236984AbhHLPSk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 11:18:40 -0400
X-IronPort-AV: E=Sophos;i="5.84,316,1620658800"; 
   d="scan'208";a="90480490"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2021 00:18:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5B61A4006DF2;
        Fri, 13 Aug 2021 00:18:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 0/3] Add USB2.0 support
Date:   Thu, 12 Aug 2021 16:18:05 +0100
Message-Id: <20210812151808.7916-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add USB2.0 Host and device support for RZ/G2L SoC.

This patch series is based on renesas-devel.

v5->v6:
 * Updated phyrst node with status disabled
 * Added Geert's Rb tag for SoC dtsi patches
 * Sorted defconfig patch alphabetically.
 * Removed USB2.0 phy driver/binding patches as it is accepted for phy/next
 * Removed USBHS binding patches as it is accepted for usb/next.
v4->v5:
 * Removed USBPHY control and binding patches as it is accepted for reset/next
 * Removed USB ehci/ohci binding patches as it is accepted for usb/next.
 * Updated Renesas USB2.0 PHY bindings to just use 'resets' as required.
 * Added interrupts maxitems=1 for SoC other than RZ/G2L for Renesas USBHS bindings
 * Updated the commit description for USB2.0 PHY driver patch.

v3->v4:
 * Added Rob's Acked-by tag for generic-{ohci,ehci} binding patch
 * Added Rob's Rb tag for RZ/G2L USBPHY control binding patch
 * Incorporated Phillip's review comments for USBPHY control driver.
 * Dropped second reset from usb2-phy binding patch
 * Added maxitems as per Rob's review comment.

v2->v3
 * USBPHY Control IP modelled as reset bindings as per Rob's suggestion
 * Updated the binding patches
 * Incorporated Geert's and Shimoda-San's review comment for phy driver patch.

v1->v2
 * Updated usb phy control bindings with clock definitions
 * Updated generic ohci/ehci bindings to support RZ/G2L SoC
 * Incorporated vinod's review comment on usb phy control driver
 * Add support for USB2.0 device and OTG support.

Biju Das (3):
  arm64: defconfig: Enable RZ/G2L USBPHY control driver
  arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
  arm64: dts: renesas: r9a07g044: Add USB2.0 device support

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 114 +++++++++++++++++++++
 arch/arm64/configs/defconfig               |   1 +
 2 files changed, 115 insertions(+)

-- 
2.17.1

