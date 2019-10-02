Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B544AC46C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 06:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfJBEuH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 00:50:07 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:31776
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725942AbfJBEuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 00:50:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZvSif3GBeldZe4b/jeo6T5W5Wpk3TI8/Z3wf4K5yoaY5M0bDe8LEKHRcxs7+h2vqZ/UsSiayWwAbhdHNk6P66vwKfj8kuHkj7qKW8f+RL+gizCdpZQ0woSWHIqGu0iyx7zk8RJXHk5AqeggQYDwl8Pw6bu4wEvvB8sgxG8ub/CoNgS2WWN0Mc+oTFR78HUi4RqJxN++paGWJDXft03cqgouG25NBCvO/AxtfCAaRi08z2Cfju/xXKbvZeApTIiaadCz+WT7HP5WPbfOC6mLgApexv41XzZ0wI/V5klZTzJ/5H9ji7exHp3PkFtlmyfvfLfXzsRJVrQkz9QPf4VHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hclvSarh7jNX7Q828+hPm7k2BWDYjNNjulcfDpHcuJY=;
 b=aRd4/Glu7AHb5tM80UsL9DvQrp8YL3kuOcbe5mwEwM6SJ0idkUwJwThe3t7fWID1+BsGYS8cCy2Klicy8lMHvNsUVs0JxfRAVwPc/WlGcoe1t0CBgMn0+uhSavfFdpbY9YEZ7r1vhRbTheirYdB8nzivRtw+Py8aTWPLOzXMCoQl6A/SrhI2TmntnezbxMVgWhsVh5BZDAOVDMhUJrpbFhOBwinofzgowkYk2qEXD7jsSgBjkrQ+bf9Xrr2bD0a0QA+7e6GphDcZYkidnxNyxA2IIZLPxvZuPtDWUAamLiN1y5oJq+VaOWVV0v4tDSSf48pCQVs5ZNASfYZ5zqwvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hclvSarh7jNX7Q828+hPm7k2BWDYjNNjulcfDpHcuJY=;
 b=AKM5cFN5A6mottfVmq2l4AULf4mlAQ5oiKXYRDb1dU3PqJGZq+Bkh5iYsiQnFx7DAQjMhwTs4CPZoGfIUP4uErfvZGPEWtw13iJbhDp0bk+MzmkwrEfyyIS3B9uR9nVVA8i+Agesd1qn/HIXdi7gc2gPbiMa4XYwbUwEmO6GbJg=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4880.jpnprd01.prod.outlook.com (20.179.186.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 04:50:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 04:50:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jslaby@suse.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
Thread-Topic: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
Thread-Index: AQHVeINBliwm7hLnmUKaPfQ88mi/3KdGxviQ
Date:   Wed, 2 Oct 2019 04:50:03 +0000
Message-ID: <TYAPR01MB454431DC0DE9F2DDA2DB2AA5D89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001180834.1158-1-geert+renesas@glider.be>
In-Reply-To: <20191001180834.1158-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9890bcf0-229a-460a-66f3-08d746f3fd71
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4880:
x-microsoft-antispam-prvs: <TYAPR01MB48801F6821BFC303B4BDB104D89C0@TYAPR01MB4880.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(39850400004)(396003)(199004)(189003)(14454004)(229853002)(81156014)(476003)(86362001)(76176011)(8936002)(7696005)(8676002)(2906002)(186003)(66066001)(486006)(6506007)(14444005)(33656002)(102836004)(6246003)(26005)(256004)(11346002)(99286004)(446003)(6436002)(305945005)(54906003)(52536014)(9686003)(4744005)(5660300002)(74316002)(55016002)(7736002)(6116002)(71190400001)(81166006)(71200400001)(66946007)(66556008)(25786009)(64756008)(66476007)(66446008)(478600001)(4326008)(110136005)(3846002)(316002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4880;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YqXNS74jdX1kWFpHmra5YAi0SqMEXiCXgY5Z4U7ArZy1f7jELl1A33bNoBNBf679PRkGxR3Zz26DUVPVMAfo1F35LcfRpGXD/1StCFhtBXmwZY/ewqVfxAHR3CYUOFcDSCE36n9hvYR9jxLtZI43fxmchfuD4vnTjmrQ7VEiIlyN5I3rzRKMhwuFwA8mPjFsK3bbFUyjDxvQtRD1no9kwNLnr6rKNhYqXDjybmgaN15Iq5g5yvlIId15dPNPa4B24DWBy3A4VVSyGgHBIwh9LdLR4Fb+24hwi4g6Xyy6LfpbElZrx92OETSTU29abp4tkFAyn9igRouC9DyXbGks0hiPCD5kNYujrd264DWvObLcW34jDYdsi/qox3/wUyYRPtOWzKfrK6M5BNhsuVxK3RtwFzAANg8peoy/N8wSpkk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9890bcf0-229a-460a-66f3-08d746f3fd71
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 04:50:03.8020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yaK32GhF1sZk9sphxNaO/HbLz7U2Ua0ZkFpHv5KMRuCBr75xyiGezgIONHiz9lts0u34wv2Tmr7PlGF7q8BcrmgUaZnsZAgRN4OVlblcVfYpxZnhQoabGf+muhIEMIUH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4880
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 2, 2019 3:09 AM
>=20
> As platform_get_irq() now prints an error when the interrupt does not
> exist, a scary warning may be printed for an optional interrupt:
>=20
>     sh_mmcif ee200000.mmc: IRQ index 1 not found
>=20
> Fix this by calling platform_get_irq_optional() instead for the second
> interrupt, which is optional.
>=20
> Remove the now superfluous error printing for the first interrupt, which
> is mandatory.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a fix for v5.4-rc1.
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on R-Car H2. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

