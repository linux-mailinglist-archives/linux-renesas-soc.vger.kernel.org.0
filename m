Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44C3F130A3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 16:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfECOqR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 10:46:17 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:6204
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbfECOqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 10:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSe1MTsVNHSnD+ebCNGY3AwRhVcb5MQaUbovXh7my90=;
 b=hqheZAj5Xf8K05G+V+m6yoG7Jl0m7eZ5QSO43urNfyAo1Etkml4694VK9xnHflWhgRXuwcoZ9s8ioMsJYeTfXJuTDawb08bo6p7t2rJNwxyAlyRGcmx2kKqnLrDQ8pmTqbF4izKUjftvyB1QCZ9n9nHNDxK45NXOA4fCWaODlSE=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1804.jpnprd01.prod.outlook.com (52.133.162.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 14:46:13 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1835.018; Fri, 3 May 2019
 14:46:13 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: How do I tell a dual role PHY to always be host or peripheral?
Thread-Topic: How do I tell a dual role PHY to always be host or peripheral?
Thread-Index: AdUBviCBWw/9JFukQV+j6l9bw9U4zQ==
Date:   Fri, 3 May 2019 14:46:13 +0000
Message-ID: <TY1PR01MB1562C3DF1D5D538AF0156B738A350@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 288c1739-c762-47a0-3e17-08d6cfd616e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1804;
x-ms-traffictypediagnostic: TY1PR01MB1804:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB180440E6795BE640D03D43128A350@TY1PR01MB1804.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(376002)(39850400004)(366004)(136003)(199004)(189003)(186003)(66066001)(256004)(25786009)(7736002)(478600001)(6436002)(305945005)(2201001)(9686003)(6306002)(53936002)(55016002)(33656002)(486006)(6506007)(2906002)(3846002)(6116002)(99286004)(7696005)(110136005)(5660300002)(71200400001)(102836004)(74316002)(26005)(81166006)(8936002)(81156014)(8676002)(476003)(14454004)(316002)(52536014)(966005)(72206003)(2501003)(68736007)(86362001)(66946007)(73956011)(64756008)(66446008)(66476007)(66556008)(71190400001)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1804;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2CE/FtvAZCil6zm7K7pRZAjE+HaONaUpvKlsRu9oAQsctj2PQZeVoMBvTZvVlwxKNkMuQXli7C8/GuaiBYOLuRQtXnxg7dcAosgv5Jaemdw/j3VDI70my0tdAZ7TDBUoOoWcxCHi/idQ1YZNMdXJVf/2XVHqNUHl//MnyfaBAjEydVvAFPk7+fQxqT9ySb1dDlkF16ejJFHdWx+cjcr7NHCeVllE/4PT7qZ6lYzOV/ZGonVr3sD265I6RsvuCaQv3MJ8wcCpqcmWeHGVjhEO26QsQEuAOIAoEBoGJ4GavUp4rgUyXqsx8gm17QB6ERkF09GUwHGalNGvfFtr4jh4ItwmnM21LUf1JGXLoajqWoEFkE2p+T6EikM7KZsPlR8ikQJLyFK0ulP4TpiUMVNOOhQsTOE+yF9M3kyhgyKVJMw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288c1739-c762-47a0-3e17-08d6cfd616e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 14:46:13.1281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1804
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I'm preparing patches to add USB support (host and device) for the=20
RZ/A2M SoC. The internal HW is similar to the R-Car Gen 3 (USB 2.0, not
USB 3.0).
So I'm reusing drivers/phy/renesas/phy-rcar-gen3-usb2.c

But, I'm not doing OTG, so I need to tell the PHY that it explicitly=20
needs to be configured as host or peripheral mode.
The controllers are individual (host or peripheral), but they use the=20
same internal PHY.

Looking at:

https://www.kernel.org/doc/Documentation/devicetree/bindings/usb/generic.tx=
t

Technically, I should not add "dr_mode" to the USB controller nodes (and
let the PHY driver check that) because the "controller" is not dual=20
role, only PHY is.

I was adding a new property "renesas,is_peripheral" to the=20
phy-rcar-gen3-usb2.c PHY driver that it would check if it was not OTG which=
 of course
works.

However, if I look at the PHY dt-bindings of:
  Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
  Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt

They are both using the name "dr_mode" in the PHY node.

So, instead of adding something like "renesas,is_peripheral" to the=20
current R-Car USB2 PHY driver, can I just use the generic name "dr_mode"?

The PHY driver code change is pretty simple:

	if (channel->is_otg_channel) {
		x x x (existing code today)
+	} else
+		if (usb_get_dr_mode(channel->dev) =3D=3D USB_DR_MODE_PERIPHERAL)
+			writel(0x80000000, usb2_base + USB2_COMMCTRL);
+		else
+			writel(0x00000000, usb2_base + USB2_COMMCTRL);



I figured I would ask BEFORE I start submitting patches for review.


Thank you,
Chris

