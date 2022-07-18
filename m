Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23C66578413
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jul 2022 15:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbiGRNpL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jul 2022 09:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233884AbiGRNpI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 09:45:08 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 84AA41B7A9;
        Mon, 18 Jul 2022 06:45:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,281,1650898800"; 
   d="scan'208";a="126513432"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Jul 2022 22:45:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.65])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B681E4003EB6;
        Mon, 18 Jul 2022 22:45:02 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Add usb gadget support for RZ/V2M
Date:   Mon, 18 Jul 2022 14:44:56 +0100
Message-Id: <20220718134458.19137-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

The RZ/V2M SoC is very similar to the R-Car implementation.
The differences are that a few DRD related registers and bits have
moved, there is a separate interrupt for DRD, an additional clock for
register access and reset lines for DRD and USBP.

Thanks
Phil

Phil Edworthy (2):
  dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M r9a09g011
    support
  usb: gadget: udc: renesas_usb3: Add support for RZ/V2M

 .../bindings/usb/renesas,usb3-peri.yaml       |  81 ++++++++++---
 drivers/usb/gadget/udc/renesas_usb3.c         | 109 +++++++++++++++---
 2 files changed, 157 insertions(+), 33 deletions(-)

-- 
2.34.1

