Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11ACEAA0E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 13:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388193AbfIELHL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 07:07:11 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:44672
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733182AbfIELHL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 07:07:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfHtmaB4v6g3pg53lANq+W+YzbTFNhrQdhC3YfQt/4/d4bt9/hRF69dMxCx6chI/Mg2xvzn5fd85O6i5U/JeGMQsmYffd8QRXHb9H/qdIle0aSi9qhiAHCBzwInM2+DmNt4uWa0aIi50ZkZImz8z+r8fn5b3uk12zs2TLjLuGkqi6ks6PFA8j+fI4ir2HC3kfzd4AT+i/Omj6iwgNBMfadI7UwluAiFdgsAQYnZTleFgQZXRIjeiF+Kda4ibOfZ1zUeerdPl6btNu037ZiqyV1jA3+BnRtwe5LSfpuLMfyKGRRD3tD3hcFCXcPQH0i1s8uD2Z063yfZTXR1ld6gFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSNSG59JaVqKUu9Jc8OQk1CRdxu3Hk3peNviPVgKmfk=;
 b=OFeSTpzk0eEupWD0A76iTNqNCnQSRfvIQirCT4wJ6myC/N1GaZRYu0d26biAUqK8Ci7zx/vLEz8rMb3Y4d6OvbB1+XUFyQ43kbbBBsdVSdz1tmb3FAhTTanUeQtlY9Qz6GQisBrg5xuJtL35V1Bzpa5Vi4qvIffDa1ONgCLdc+FIYdYLG1xHbsezimBNx03Hq+Ke2lEOds83sJz91FehOaryo5Vbvta5ZhBQq3OF8CWafDoc0BpMGi6xe+QihMgKmi2ggQ1syHNxBl2DqBifYUYy4HJwxpdm4U246zs+1aBe33KsKLJgUx7437rwhI5tdBCdV1JJi99ugGaHm+O8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSNSG59JaVqKUu9Jc8OQk1CRdxu3Hk3peNviPVgKmfk=;
 b=FMlwYBTXOOFOTmpsKmRL/XAHmivBr+w3FSvpJgGrraIItWYPPE50ml5GU3X+IdhN8sKHsqUx7fiTehyrtIP2mtkfIFYs8RPW1w1sSIJKGkI7TTQeJHx+CDhhHZTDwCrnpVyk17oEl+GIdahbxhdZ2uC3QasDe9Sx1MYmeNFUNeY=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2925.jpnprd01.prod.outlook.com (20.177.103.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 5 Sep 2019 11:07:02 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 11:07:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: RE: [PATCH v3] usb: gadget: udc: renesas_usb3: add suspend event
 support
Thread-Topic: [PATCH v3] usb: gadget: udc: renesas_usb3: add suspend event
 support
Thread-Index: AQHVY8ruVM4kfXu4JEmvaon6vzm6uKcc6MMQ
Date:   Thu, 5 Sep 2019 11:07:02 +0000
Message-ID: <TYAPR01MB45449D299241B52077101C85D8BB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1567675074-3331-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1567675074-3331-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eaa6bdbc-15db-41d0-18b8-08d731f12e24
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2925;
x-ms-traffictypediagnostic: TYAPR01MB2925:|TYAPR01MB2925:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB2925E8AD0F2D1C653588BA77D8BB0@TYAPR01MB2925.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(199004)(189003)(55016002)(76176011)(11346002)(486006)(102836004)(14444005)(476003)(66946007)(446003)(54906003)(107886003)(86362001)(66446008)(66556008)(53936002)(66476007)(64756008)(110136005)(4326008)(99286004)(52536014)(9686003)(71200400001)(6506007)(71190400001)(76116006)(186003)(256004)(26005)(229853002)(6246003)(2906002)(6116002)(81166006)(8936002)(81156014)(7696005)(6436002)(25786009)(7736002)(8676002)(478600001)(5660300002)(14454004)(3846002)(33656002)(74316002)(316002)(305945005)(15650500001)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2925;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JY+R+mm9KT397CacWREoXpqZwGFM+yY5RnCEYMUUWTE8XIva874Lw1nYabKkUUegWe0mY29aFiTh75+yaMSCSaC0trKPrRj7UmO6YNwllFi1lzL6rxCCxzcckixsWMA7bsTs3xeQSCtPy9cPEn7+LtK/FWzH7tnZRO4vsISJKjnEXc9wlb1jFnTASfXXrLNaWZKoI2OT1hqr3HVflNJF61Ck4C5zbLBT5bzghQgcB+HUwvUL1z096FCQzNuSg1P90c7ryBHhBtw1sRYnC02Gf8iaka8mJD3bLCUeRB7Ye8fzZLDnXFVhighLT8+BpFYiLSxzxNNHYBM0+cWdC+ayiGTynrJrMeuOYlefgVeLfQYrMnXFb7DDp2+kMmvndCwtp/KzV277zKVg9fYfFl1MLnAfqSovZjfR51Afv/nUC/o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa6bdbc-15db-41d0-18b8-08d731f12e24
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 11:07:02.5992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TG8tAhMtblSpqClX6sghno0awW/TnjlBEZ6Fnpqxab/vSV8EcmhnPruyJ/9fpYXRHjcJ4ItVwavw48rkqUGQly91XtzmVDVZJjp2PCrTEpodOyvAL5H4hHPzj120KX5X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2925
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

> From: Veeraiyan Chidambaram, Sent: Thursday, September 5, 2019 6:18 PM
>=20
> In R-Car Gen3 USB 3.0 Function, if host is detached an interrupt
> will be generated and Suspended state bit is set in interrupt status
> register. Interrupt handler will call driver->suspend(composite_suspend)
> if suspended state bit is set. composite_suspend will call
> ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
> by user space application via /dev/ep0.
>=20
> To be able to detect the host detach, USB_INT_1_B2_SPND to cover the
> Suspended bit of the B2_SPND_OUT[9] from the USB Status Register
> (USB_STA) register and perform appropriate action in the
> usb3_irq_epc_int_1 function.
>=20
> Without this commit, disconnection of the phone from R-Car H3 ES2.0
> Salvator-X CN11 port is not recognized and reverse role switch does
> not happen. If phone is connected again it does not enumerate.
>=20
> With this commit, disconnection will be recognized and reverse role
> switch will happen by a user space application. If phone is connected
> again it will enumerate properly and will become visible in the
> output of 'lsusb'.
>=20
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on my environment [1] and works correctly. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[1]
 - Two R-Car Gen3 boards.
 -- with minor customized this driver for switching b_device role.
 - Connected a usb cable to each CN11.
 -- Use g_mass_storage.ko.

Best regards,
Yoshihiro Shimoda

