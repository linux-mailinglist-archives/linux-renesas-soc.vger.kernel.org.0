Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88B54794E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 06:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFQEZ6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 00:25:58 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:13988
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725823AbfFQEZ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 00:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVBLrhLxN3rj2YawJzJpiyrCBOnRrTY927PRyDtmuV4=;
 b=RjfIwE86t4QF24zAT4BQ5BeniFxsF4T8+nNCQPXl77gln1mDRIVqnyzkXsPHwztui2wYdXH0mP3tuAzkMK1kiqtoj4GzVKyBE5pZje56jto1qDcGIMeR/IqgauIE9hCZEA1Uk7UEut3xc1HGDoKMp+RzMJXn0fUFBngcVhwoddE=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB2902.jpnprd01.prod.outlook.com (52.134.255.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Mon, 17 Jun 2019 04:25:55 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 04:25:55 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "hch@lst.de" <hch@lst.de>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
Thread-Topic: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size() instead
 of a workaround
Thread-Index: AQHVIdGm2I9J5403AkGhlbCnRkkrDqaZ/Y2AgAVHc3A=
Date:   Mon, 17 Jun 2019 04:25:55 +0000
Message-ID: <OSBPR01MB35903578F49A50C64A9557CDD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190613194547.GD6863@kunai>
In-Reply-To: <20190613194547.GD6863@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50fb9265-cf99-4dc0-17c8-08d6f2dbe3e4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2902;
x-ms-traffictypediagnostic: OSBPR01MB2902:
x-microsoft-antispam-prvs: <OSBPR01MB290251A391707EFF4922774CD8EB0@OSBPR01MB2902.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(229853002)(256004)(99286004)(6116002)(486006)(53936002)(71190400001)(4326008)(71200400001)(25786009)(3846002)(4744005)(66066001)(8936002)(66446008)(66946007)(66556008)(64756008)(81156014)(81166006)(8676002)(55016002)(6506007)(9686003)(76116006)(11346002)(52536014)(476003)(5660300002)(86362001)(26005)(66476007)(446003)(6246003)(73956011)(305945005)(54906003)(102836004)(186003)(76176011)(7736002)(33656002)(68736007)(478600001)(7416002)(74316002)(7696005)(6916009)(6436002)(316002)(14444005)(14454004)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2902;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j8+49kK98RhW90gAPxMvMppeXZVjgNQs410LW7yZ7rltkkGLwhqDb+PjS59dGCl1fbn6iu4IhwffZANrnivaRLqauHJRBaDEfMIVDHqHnRHi8A6A0P8v/hX8UzgPDoS21k4iAE8eqoiQkyGPqke5OvXgruPEnaQlrAg9oGiB4vFO2pLhmycyNeJ+kJBAnzALkm7Vvlw9zhi4PLdiM24PhrEm3CI4ifaX6TTg53yZYC6EzwY53FZkl4Vswh08g+0BOsIAi7gEHuKv1DEG24uQymDueTxo1bxM/X5rSSMx9q7C0IUK+E8VvTW17mSf3g771TAbFQbwVQgNEo3fM3/G/3cSCBoM3InHRZG2tCbVTQ7zEwkdjuYwJ4pDs0Dk4NyQSmNy/ReiJfD+0crXtsVPVgAoUDmdusYV9E2AQ9V/Jgo=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fb9265-cf99-4dc0-17c8-08d6f2dbe3e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 04:25:55.1961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2902
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, June 14, 2019 4:46 AM
>=20
> On Thu, Jun 13, 2019 at 07:20:14PM +0900, Yoshihiro Shimoda wrote:
> > Since the commit 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> > provides a helper function to get the max mapping size, we can use
> > the function instead of the workaround code for swiotlb.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> I love it! I'd really like to see this code go away. Do I get this right
> that this patch is kinda independent of the reset of the series? Anyway:

Thank you for your suggestion! I think so (because IOMMU and block patches =
seem
to need update). I'll submit 3/5 and 4/5 patches as independent later.

> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for your Acked-by!

Best regards,
Yoshihiro Shimoda

