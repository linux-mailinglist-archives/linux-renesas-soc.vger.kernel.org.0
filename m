Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3698158A123
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Aug 2022 21:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbiHDTWd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Aug 2022 15:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbiHDTWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Aug 2022 15:22:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D78DD37FA9;
        Thu,  4 Aug 2022 12:22:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,216,1654527600"; 
   d="scan'208";a="130360453"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2022 04:22:31 +0900
Received: from localhost.localdomain (unknown [10.226.92.63])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5D792408FB8D;
        Fri,  5 Aug 2022 04:22:27 +0900 (JST)
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
Subject: [PATCH v3 0/2] Add usb gadget support for RZ/V2M
Date:   Thu,  4 Aug 2022 20:22:18 +0100
Message-Id: <20220804192220.128601-1-phil.edworthy@renesas.com>
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

v3:
bindings:
 - Keep the existing constraints by adding an 'else' clause with
   'maxItems: 1' for various properties.
driver:
 - The ramsize_per_ramif specifies the amount of ram for
   IN _or_ OUT pipes, not combined, so it should be 16KB.
 - When changing role, ensure only one of host/perip reset is deasserted
 - Correct number of pipes to 16. The driver will calculate the nr
   of pipes to use based on the available ram and ramsize_per_pipe.

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

 .../bindings/usb/renesas,usb3-peri.yaml       |  99 +++++++++++--
 drivers/usb/gadget/udc/renesas_usb3.c         | 131 ++++++++++++++----
 2 files changed, 188 insertions(+), 42 deletions(-)

-- 
2.34.1

