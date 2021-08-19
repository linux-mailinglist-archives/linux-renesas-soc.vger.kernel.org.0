Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824093F1989
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Aug 2021 14:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239861AbhHSMfy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Aug 2021 08:35:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37444 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239899AbhHSMfx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Aug 2021 08:35:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17JCYqMd032825;
        Thu, 19 Aug 2021 07:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1629376492;
        bh=poueu/euKtfcqbr8LzsTcjIQ1wgv6v/lzsChvHScOeU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZO3lyeAp/+ym6hviOL+iomxGGyQI32S9tJNCKz70lGObJ05m3i051CPdwOBtpOSzH
         oCrtIw/S/Omrt8DwCOyIGLZFO8tZv4lezJ0u0tZ16nNWnS2NAFCfTV/VXwJ1AZbTll
         0y93YdwVt9YFrEiKU0nccDh8JxtoiOupvRIDO62c=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17JCYqkM057235
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Aug 2021 07:34:52 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 19
 Aug 2021 07:34:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 19 Aug 2021 07:34:52 -0500
Received: from a0393678-ssd.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17JCXlZW035715;
        Thu, 19 Aug 2021 07:34:45 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tom Joseph <tjoseph@cadence.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>, <linux-pci@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v9 8/8] Documentation: PCI: endpoint/pci-endpoint-cfs: Guide to use SR-IOV
Date:   Thu, 19 Aug 2021 18:03:43 +0530
Message-ID: <20210819123343.1951-9-kishon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819123343.1951-1-kishon@ti.com>
References: <20210819123343.1951-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Documentation to help users use PCI endpoint to create virtual
functions using configfs. An endpoint function is designated as a
virtual endpoint function device when it is linked to a physical
endpoint function device (instead of a endpoint controller).

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 Documentation/PCI/endpoint/pci-endpoint-cfs.rst | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/PCI/endpoint/pci-endpoint-cfs.rst b/Documentation/PCI/endpoint/pci-endpoint-cfs.rst
index db609b97ad58..fb73345cfb8a 100644
--- a/Documentation/PCI/endpoint/pci-endpoint-cfs.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint-cfs.rst
@@ -43,6 +43,7 @@ entries corresponding to EPF driver will be created by the EPF core.
 		.. <EPF Driver1>/
 			... <EPF Device 11>/
 			... <EPF Device 21>/
+			... <EPF Device 31>/
 		.. <EPF Driver2>/
 			... <EPF Device 12>/
 			... <EPF Device 22>/
@@ -68,6 +69,7 @@ created)
 				... subsys_vendor_id
 				... subsys_id
 				... interrupt_pin
+			        ... <Symlink EPF Device 31>/
                                 ... primary/
 			                ... <Symlink EPC Device1>/
                                 ... secondary/
@@ -79,6 +81,13 @@ interface should be added in 'primary' directory and symlink of endpoint
 controller connected to secondary interface should be added in 'secondary'
 directory.
 
+The <EPF Device> directory can have a list of symbolic links
+(<Symlink EPF Device 31>) to other <EPF Device>. These symbolic links should
+be created by the user to represent the virtual functions that are bound to
+the physical function. In the above directory structure <EPF Device 11> is a
+physical function and <EPF Device 31> is a virtual function. An EPF device once
+it's linked to another EPF device, cannot be linked to a EPC device.
+
 EPC Device
 ==========
 
@@ -98,7 +107,8 @@ entries corresponding to EPC device will be created by the EPC core.
 
 The <EPC Device> directory will have a list of symbolic links to
 <EPF Device>. These symbolic links should be created by the user to
-represent the functions present in the endpoint device.
+represent the functions present in the endpoint device. Only <EPF Device>
+that represents a physical function can be linked to a EPC device.
 
 The <EPC Device> directory will also have a *start* field. Once
 "1" is written to this field, the endpoint device will be ready to
-- 
2.17.1

