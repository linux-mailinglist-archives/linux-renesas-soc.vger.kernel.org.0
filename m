Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98E2F74979
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2019 10:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390001AbfGYI61 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 04:58:27 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:32798
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388805AbfGYI61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 04:58:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEg4dptzQw/ctCpjc5tQ3Fy6j36zV3uwqoRNCYL97l6RYOqeMik1lhfWb5tWI7sHKnSW4y9Fa4qb6nlWxpOBKhbAq+0Eq0BFCPPRORXLKAWWeKX4jBC3/6Vz2JOEYIraRBKs9qHghPD78a5G+QmqoBIQV7DwT1dEBfJ4c0Etu5cP/2uhaF7LIefN3q6ghPV21VK9P1wJS3oWYODUtLnB+gN7Jb8hHMY49mWn8VornvDxj7FcoDZY7y69B2nKlyz8Cdo+8BEc6zXi1eu5YsvxmIxKK2pWvQcfwBej3dIeicltwVnfI7GS3sQZ2EnFJwlSQ8XNGB2NXG5tTxyiZk8Okg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyg5n+nSwevEfpPR8EDASOQ6uvTN8YrRvpQWGR/IFyg=;
 b=RzIjpAPooYci4E/yj1Qx0rK/0mw72np9qHzc+lICLrd+iAxwl9hs/BHAWRmsUAsuyjE1mBz4v7mjBoq8v1+vBNvHzO7NGMRjBGU3gZSiMApdyocLgSauzOuIJSnNptewfeXov0epV1QSg9BEQ7M+ALr/God2Ty3fotVp+7C4ThjaHN9bWCZZ2UCwvBCyfT/NFl7qIPvzuFT3pgEljePWJth0UXpn7TFpeS5tCn0J8i/YLEkDNEcAxM97obM/vUSS7utUZMHMLs9717wQr7I0gacab1ePZQTdGZ/u8PVrG1EYbrAL4moTVtSTSNBQGM9NJvi8Mj+gG+ZkClE3CMROrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=renesas.com;dmarc=pass action=none
 header.from=renesas.com;dkim=pass header.d=renesas.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyg5n+nSwevEfpPR8EDASOQ6uvTN8YrRvpQWGR/IFyg=;
 b=MinGEn+xOhBcIbU3TFyLlakKhWlvrrWy/4vVPFHS0fYJwOkDQZrfLqZk2Scni4Qfm2dLw811tB2Y4hBpYrh6LK3pV0Rq6HoLUMPy8uzrpX6hVS/rbkhHecBm6Gu5+xkDbEUz1VxVSmwFGbK+hzScuL1ASeYxq3T4OGGm8KCHSRo=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB2606.jpnprd01.prod.outlook.com (20.177.104.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 08:58:23 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::5c8d:f422:6a44:57a9%5]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 08:58:23 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: [report] Booting delayed on arm64 + linux-next / next-20190724 tag
 with defconfig
Thread-Topic: [report] Booting delayed on arm64 + linux-next / next-20190724
 tag with defconfig
Thread-Index: AdVCxOsf53yRLQt9Tcy8WdOjlR/Kvw==
Date:   Thu, 25 Jul 2019 08:58:23 +0000
Message-ID: <TYAPR01MB454480D4D4EA8BA7E5F9C3A9D8C10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd4bf1cd-3303-4446-085b-08d710de3ffd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2606;
x-ms-traffictypediagnostic: TYAPR01MB2606:
x-microsoft-antispam-prvs: <TYAPR01MB2606F8B122B15AB14E60C46ED8C10@TYAPR01MB2606.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(5660300002)(7736002)(68736007)(2501003)(305945005)(102836004)(2351001)(33656002)(25786009)(486006)(6916009)(5640700003)(99286004)(8936002)(26005)(186003)(71200400001)(71190400001)(55016002)(6116002)(9686003)(316002)(8676002)(81156014)(81166006)(66066001)(53936002)(478600001)(6436002)(7696005)(66446008)(476003)(74316002)(6506007)(2906002)(64756008)(66946007)(256004)(66476007)(14454004)(76116006)(86362001)(66556008)(14444005)(3846002)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2606;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uVZ6C7bdxxCNsg9lOpRSPfTZTTpZBF0EU6Nze4MXa7N+z5cUPJETegvZ57PCH7zolgT6gV90Ol71jyhtKE9Xbqaa5gNMl/8/TH3sXmjNiUIRPw9KYF26kjcKKf1Pldm5tVjarVu/PPkmrFlJRZBjnYY1klfhwSU4Uno5LZG4xoz/O16VH5GQLSVR0WvtB+gUa9g3hIBaf/k3tHZFfjus0VEv2hbsZwVD1VK9nzOnSIb5ghwFHp0whuK74+tU6nBr2Grr3Mafmr/bvAYecCR2Ki3QqS/XgL3YsTVlforLKaHH6IT6sBFXDsgIQBDA65IyGEYcJ8Xg//cCpB3EPZP+ifu4wrcqdc6/fuDs7TyUI4qKoxfiE178ask8gjakgDSOtdI3v52KFUK9X9bHYSFezysoB1KLN9ZJxYTpFKtUYXM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4bf1cd-3303-4446-085b-08d710de3ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 08:58:23.6657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2606
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

This is just a report though, I found an issue on the following environment=
 like below:

< Environment >
- linux-next.git / next-20190724 + defconfig
- R-Car H3 / Salvator-X board

< Issue >
Booting delayed for 60 seconds like below:
----
[    2.030466] xhci-hcd ee000000.usb: xHCI Host Controller
[    2.035702] xhci-hcd ee000000.usb: new USB bus registered, assigned bus =
number 5
[    2.043138] xhci-hcd ee000000.usb: Direct firmware load for r8a779x_usb3=
_v3.dlmem failed with error -2
[    2.052454] xhci-hcd ee000000.usb: Falling back to sysfs fallback for: r=
8a779x_usb3_v3.dlmem
[   62.430971] xhci-hcd ee000000.usb: can't setup: -11
[   62.435858] xhci-hcd ee000000.usb: USB bus 5 deregistered
[   62.441289] xhci-hcd: probe of ee000000.usb failed with error -1
[   62.447704] usbcore: registered new interface driver usb-storage
----

< Investigation >
I investigated this issue and I found arch/arm64/config/defconfig enables
CONFIG_FW_LOADER_USER_HELPER_FALLBACK on the following commit.
----
commit 7f4e4afa140cd3bccd0f0b408f7c4a211eaef2ac
Author: Robin Gong <yibin.gong@nxp.com>
Date:   Wed Jul 17 14:47:10 2019 +0800

    arm64: defconfig: Enable SDMA on i.mx8mq/8mm

    Enable SDMA support on i.mx8mq/8mm chips, including enabling
    CONFIG_FW_LOADER_USER_HELPER/CONFIG_FW_LOADER_USER_HELPER_FALLBACK
    for firmware loaded by udev.

    Signed-off-by: Robin Gong <yibin.gong@nxp.com>
    Signed-off-by: Shawn Guo <shawnguo@kernel.org>
----

I have some workarounds for now, but they are not perfect. So, I'll investi=
gate this issue more.

Solution 1:
 - Disable CONFIG_FW_LOADER_USER_HELPER/CONFIG_FW_LOADER_USER_HELPER_FALLBA=
CK again.
  - pros: No need to modify any code.
    cons: Need to change the config after make defconfig.

Solution 2:
 - The xhci-rcar.c uses request_firmware_direct() instead of request_firmwa=
re().
  - pros: We can use the defconfig without the long delay.
    cons: This breaks the hotplug (sysfs) based firmware loading of the xhc=
i-rcar.c.

Solution 3:
 - The fw_run_sysfs_fallback() on drivers/base/firmware_loader/fallcack.c c=
hecks a condition whether
   system_state < SYSTEM_RUNNING.
  - pros: We can use the defconfig without the long delay.
    cons: This breaks firmware loading of all drivers on initrd.

Best regards,
Yoshihiro Shimoda

