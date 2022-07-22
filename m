Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12B257E172
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jul 2022 14:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234279AbiGVMbU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 08:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiGVMbT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 08:31:19 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0CF9B62CA;
        Fri, 22 Jul 2022 05:31:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,185,1654527600"; 
   d="scan'208";a="128789559"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jul 2022 21:31:17 +0900
Received: from localhost.localdomain (unknown [10.226.93.52])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2FE4843C48DF;
        Fri, 22 Jul 2022 21:31:12 +0900 (JST)
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
Subject: [PATCH v2 0/2] Add usb gadget support for RZ/V2M
Date:   Fri, 22 Jul 2022 13:31:05 +0100
Message-Id: <20220722123107.34122-1-phil.edworthy@renesas.com>
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

v2:
bindings:
 - SoCs other than rz/v2m must limit the number of clock/interrupt names
 - Add "Battery Charging" and "Global Purpose Input" interrupts
driver:
 - Rename r9a09g011 feature to is_rzv2m; use rzv2m compat string
 - Pass pointer into macros that access is_rzv2m member

Phil Edworthy (2):
  dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M r9a09g011
    support
  usb: gadget: udc: renesas_usb3: Add support for RZ/V2M

 .../bindings/usb/renesas,usb3-peri.yaml       |  91 +++++++++++--
 drivers/usb/gadget/udc/renesas_usb3.c         | 128 ++++++++++++++----
 2 files changed, 177 insertions(+), 42 deletions(-)

-- 
2.34.1

