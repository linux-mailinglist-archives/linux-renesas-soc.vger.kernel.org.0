Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C19708564
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 May 2023 17:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjERP45 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 May 2023 11:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjERP45 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2023 11:56:57 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50E43DE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2023 08:56:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,285,1677510000"; 
   d="scan'208";a="159865399"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 May 2023 00:56:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.79])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 22524400F7E0;
        Fri, 19 May 2023 00:56:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
Date:   Thu, 18 May 2023 16:56:46 +0100
Message-Id: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.0 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add support for VBUSEN selection control for
RZ/G2L alike SoCs.

As per RZ/G2L HW(Rev.1.30 May2023) manual, VBUSEN can be controlled by
the Port Power bit of the EHCI/OHCI operational register or by the VBOUT
bit of the VBUS Control Register.

A reset consumer(phy-rcar-gen3-usb2) needs to find the reset controller
device and then call the provider(reset-rzg2l-usbphy-ctrl) to configure
it.

Please share your thoughts on this patch series.

Biju Das (3):
  reset: Add reset_controller_get_dev()
  reset: renesas: Add rzg2l_usbphy_ctrl_select_vbus_ctrl()
  phy: renesas: phy-rcar-gen3-usb2: Control VBUSEN selection

 drivers/phy/renesas/phy-rcar-gen3-usb2.c |  9 ++++++++
 drivers/reset/core.c                     | 14 ++++++++++++
 drivers/reset/reset-rzg2l-usbphy-ctrl.c  | 27 ++++++++++++++++++++++++
 include/linux/reset-controller.h         |  9 ++++++++
 include/linux/reset/rzg2l-usbphy-ctrl.h  | 16 ++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 include/linux/reset/rzg2l-usbphy-ctrl.h

-- 
2.25.1

