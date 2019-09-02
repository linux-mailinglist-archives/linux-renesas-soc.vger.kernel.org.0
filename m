Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6F38A541C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 12:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730042AbfIBKfi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 06:35:38 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:59760
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729806AbfIBKfh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 06:35:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVeC6unlRTpLPYJS3JdtRHESPfNbfrbOHNhugdZ1EzoZvqR7aMZFIqHMBBv84nkehZJbztd6KRSNFNgc+dlWKQ2kdTqoH6XySo2gGVHWv6NohR7qruzlNeWWBAgF+2YAbd5emyNS9QY9kPLvGgx/VbeAHmeBR9IZkyvKDRvMxJWX6C+kwnTYjXGCFyi1H5/TEpR5RTdCGzpkbsUKxv4vTAc053gKkDMzq6pamZobdnT2/k6IMXYjXmjZrlbhCAyT7gzYYYyeuqADj8+XDUNT9UAY49KGIt0b58KkyTit4qOFO1wlef64rcvF2sUtxzioAGBDJ1aLiibgh3Fh3GD1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEhaFu698DxW6QSg2f5XVYWdPjwkDTWCTq40t4TOxFU=;
 b=G8A2MkMBl3MryNrW1QKjGFe8nLpZGf812jeoc8qpApH6FxTstW46o493ROhWIxlUchhe4fur9MQ9wVX+x9G/737AnJo7ogQ/LJuy7a/tfYR8qs+uhYEPOKjfTSaSJm7p2p9Ss+y8b99fbn65oca2XvWROf+koddRCNYsKYnlkZKzGL4z6SXkaSPLtVMkA6lT3LkpIVGk+LgTzVoFQUZjdoHH43bv7yspKo4GMArja1L2F3wPuXtxDmpuHtPeecHYW1nNaYaZ8cHVf47qBJQ6pToyXoeDI3ALhCzDljEVrpNUiDNwGslsICI66cZVqQphXkX69w254C/lZBjCoG+J0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEhaFu698DxW6QSg2f5XVYWdPjwkDTWCTq40t4TOxFU=;
 b=aX1Ox6yzSr94GYIoWvOpXeGDWD+//V5bAKniqU45ZqVj7wrGvWf92w6ukM8seVjG2cqRyqMFuglAe++NkRfwI+z4SexhzyrscRkWHQhVHLLWNYV3t6B44OCbiliQ7i7x3nxvpihE1fy3SWkuY0FnUeu2sEwKwioV55JMFOnXQm4=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4589.jpnprd01.prod.outlook.com (20.179.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Mon, 2 Sep 2019 10:35:33 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 10:35:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/4] usb: host: xhci-rcar: avoid 60s wait by
 request_firmware() in system booting
Thread-Topic: [PATCH 4/4] usb: host: xhci-rcar: avoid 60s wait by
 request_firmware() in system booting
Thread-Index: AQHVXL65+6kkn9xTkUyWleEj4sJbHqcU9riAgANArOA=
Date:   Mon, 2 Sep 2019 10:35:33 +0000
Message-ID: <TYAPR01MB4544B88DD008C653007FF631D8BE0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566900127-11148-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190831084304.wisliftdg5g26jbf@verge.net.au>
In-Reply-To: <20190831084304.wisliftdg5g26jbf@verge.net.au>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1ab72df-78e1-4201-b432-08d72f914913
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4589;
x-ms-traffictypediagnostic: TYAPR01MB4589:
x-microsoft-antispam-prvs: <TYAPR01MB45895B2E539936DA5F0526B2D8BE0@TYAPR01MB4589.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(199004)(189003)(7696005)(6246003)(76176011)(6116002)(66066001)(71200400001)(71190400001)(3846002)(11346002)(476003)(446003)(486006)(256004)(14444005)(6916009)(99286004)(229853002)(55016002)(26005)(186003)(8936002)(6506007)(102836004)(53936002)(66946007)(76116006)(5660300002)(14454004)(66476007)(66556008)(64756008)(66446008)(54906003)(25786009)(9686003)(6436002)(7736002)(81156014)(33656002)(52536014)(316002)(81166006)(8676002)(2906002)(74316002)(305945005)(4326008)(478600001)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4589;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jeaRjs+TsuFQAfOAJcyGdXiglnb/CMTNAtSCq/SNk4i5zswU+pqc/0+MYwAJPAaR5O5XVR//fTKOQCdyLZebc5HkBia/fKdcNSiHruY92STN54m9GYj7ACt11QPEiUfZaTYP+KgMfAhTzx39T8z+TQBFIcvNvOOTlT4efHK7ycWMz14gcs1EGHTWDyQ11MsBZ45MHk5l4AH4IqGD4b5b2oUG1QeY+z3exF/50TWRM1nxiQpvJQzmhc++R+DboTZN9CXDNDdpNG1hH5e0tM2bY0DzgSrp9zGeYnQifVxs4FTqj25RjVUQqVo/ocwZGMvT1ZW0oWfkSLqHY8mLtFqEIKT8Bbs4ytCespoPBd8HC9PWxbUjFsd7jx0rBgsgheBS4dCr2mlQyxNR1dTb6azf38YH9ffsDc/lbltqKXCjrXg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ab72df-78e1-4201-b432-08d72f914913
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:35:33.3689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9WTRN7e+QGItORDq7ZPijIdwz2wsBvo4PjgYBUEzWoUS7vT4JETOr5znDPz37K8Hy/MgtxBTleTUk4z4wAyVThGKB9P6LkvSn3hLttDhu+dS0lLyrCRpLBZE8tj9luKv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4589
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

Thank you for your comment!

> From: Simon Horman, Sent: Saturday, August 31, 2019 5:43 PM
>=20
> On Tue, Aug 27, 2019 at 07:02:07PM +0900, Yoshihiro Shimoda wrote:
> > If CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy and CONFIG_USB_XHCI_RCAR=
=3Dy,
> > request_firmware() in xhci_rcar_download_firmware() waits for 60s to
> > sysfs fallback for the firmware like below.
> >
> > [    1.599701] xhci-hcd ee000000.usb: xHCI Host Controller
> > [    1.604948] xhci-hcd ee000000.usb: new USB bus registered, assigned =
bus number 3
> > [    1.612403] xhci-hcd ee000000.usb: Direct firmware load for r8a779x_=
usb3_v3.dlmem failed with error -2
> > [    1.621726] xhci-hcd ee000000.usb: Falling back to sysfs fallback fo=
r: r8a779x_usb3_v3.dlmem
> > [    1.707953] ata1: link resume succeeded after 1 retries
> > [    1.819379] ata1: SATA link down (SStatus 0 SControl 300)
> > [   62.436012] xhci-hcd ee000000.usb: can't setup: -11
> > [   62.440901] xhci-hcd ee000000.usb: USB bus 3 deregistered
> > [   62.446361] xhci-hcd: probe of ee000000.usb failed with error -11
> >
> > To avoid this 60s wait, this patch adds to check the system_state
> > condition and if the system is not running,
> > xhci_rcar_download_firmware() calls request_firmware_direct()
> > instead of request_firmware() as a workaround.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> It seems to me that request_firmware() is working as expected.
> And that this patch introduces an alternate behaviour for xhci-rcar
> where it will fall back to the user-space helper in some cases but not
> others. This inconsistency isn't obviously correct to me. Perhaps
> xhci-rcar should always call request_firmware_direct() ?

If xhci-rcar always call request_firmware_direct() but end user
uses the user-space helper on the driver, it's a regression because
request_firmware_direct() always disables the user-space helper. So,
I'd like to avoid using request_firmware_direct(). JFYI, I checked
the git history and I found such a situation:
---
commit c0cc00f250e19c717fc9cdbdb7f55aaa569c7498
Author: Hauke Mehrtens <hauke@hauke-m.de>
Date:   Thu Aug 24 23:06:41 2017 +0200

    ath10k: activate user space firmware loading again
---

It seems we need more time to investigate how to fix (or avoid) this issue.
So, I'll resend v2 patch series without this patch.

Best regards,
Yoshihiro Shimoda

