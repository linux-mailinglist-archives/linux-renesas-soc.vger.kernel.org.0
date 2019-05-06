Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE3AD15687
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 01:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbfEFXrV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 May 2019 19:47:21 -0400
Received: from pbmsgap01.intersil.com ([192.157.179.201]:33048 "EHLO
        pbmsgap01.intersil.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfEFXrV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 May 2019 19:47:21 -0400
Received: from pps.filterd (pbmsgap01.intersil.com [127.0.0.1])
        by pbmsgap01.intersil.com (8.16.0.27/8.16.0.27) with SMTP id x46NiMgI003026;
        Mon, 6 May 2019 19:47:10 -0400
Received: from pbmxdp03.intersil.corp (pbmxdp03.pb.intersil.com [132.158.200.224])
        by pbmsgap01.intersil.com with ESMTP id 2s9690224x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 06 May 2019 19:47:10 -0400
Received: from pbmxdp01.intersil.corp (132.158.200.222) by
 pbmxdp03.intersil.corp (132.158.200.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1531.3; Mon, 6 May 2019 19:47:08 -0400
Received: from localhost.localdomain (132.158.202.108) by
 pbmxdp01.intersil.corp (132.158.200.222) with Microsoft SMTP Server id
 15.1.1531.3 via Frontend Transport; Mon, 6 May 2019 19:47:08 -0400
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 00/10] usb: Add host and device support for RZ/A2
Date:   Mon, 6 May 2019 18:46:21 -0500
Message-ID: <20190506234631.113226-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-06_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=junk_notspam policy=junk score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060179
X-Proofpoint-Spam-Reason: mlx
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For the most part, the RZ/A2 has the same USB 2.0 host and device
HW as the R-Car Gen3, so we can reuse a lot of the code.

However, there are a couple extra register bits, and the CFIFO
register 8-bit access works a little different (weird, no idea why).

There is a dedicated DMAC for the RZ/A2 USB Device HW, but we
have not been able to reliably get that working yet, so device
operation is pio only at the moment.

On the RZ/A2M eval board, both USB channels can be used as either
host or device. But, it's not set up for otg (ie, there are jumpers
and separate connectors). Therefore, below is an example of what it
would look like to enable USB channel 0 as a device instead of a host.

&usb2_phy0 {
	pinctrl-names = "default";
	pinctrl-0 = <&usb0_pins>;
	renesas,uses_usb_x1;
	dr_mode = "peripheral";
	status = "okay";
};
&usbhs0 {
	status = "okay";
};






Chris Brandt (10):
  phy: renesas: rcar-gen3-usb2: Add uses_usb_x1 option
  dt-bindings: rcar-gen3-phy-usb2: Document uses_usb_x1
  phy: renesas: rcar-gen3-usb2: Check dr_mode when not using OTG
  dt-bindings: rcar-gen3-phy-usb2: Document dr_mode
  dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
  usb: renesas_usbhs: Add support for RZ/A2
  dt-bindings: usb: renesas_usbhs: Add support for r7s9210
  ARM: dts: r7s9210: Add USB Host support
  ARM: dts: r7s9210: Add USB Device support
  ARM: dts: r7s9210-rza2mevb: Add USB host support

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 15 +++-
 .../devicetree/bindings/usb/renesas_usbhs.txt      |  2 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             | 37 +++++++++
 arch/arm/boot/dts/r7s9210.dtsi                     | 88 ++++++++++++++++++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 16 +++-
 drivers/usb/renesas_usbhs/Makefile                 |  2 +-
 drivers/usb/renesas_usbhs/common.c                 | 27 +++++--
 drivers/usb/renesas_usbhs/common.h                 | 13 ++++
 drivers/usb/renesas_usbhs/fifo.c                   |  8 +-
 drivers/usb/renesas_usbhs/rza.h                    |  1 +
 drivers/usb/renesas_usbhs/rza2.c                   | 82 ++++++++++++++++++++
 include/linux/usb/renesas_usbhs.h                  |  1 +
 12 files changed, 277 insertions(+), 15 deletions(-)
 create mode 100644 drivers/usb/renesas_usbhs/rza2.c

-- 
2.16.1

