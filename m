Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA70225D62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 07:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726208AbfEVFLd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 01:11:33 -0400
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:8404
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725801AbfEVFLc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 01:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOzAMU2plBAcjdFbmkTZD4LrVm9YJDaK8ddxjmZKNBw=;
 b=iJlpsYP1MMQvyScQ9+B+9H0y0jvd2Lp9oLr2TjyMgr5wTmpVBUSa1VYpGFpsegvREtiT/S6S/UmVliuyHY+y0mTIQKZcFsPP/jQtkpWhD/9meuPXkcofNA8Cu8m76rHS1+pAnZcldXHqQx/0ZytGSESqTWMVEDhqIUwnErX9+ro=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB4690.jpnprd01.prod.outlook.com (20.179.176.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Wed, 22 May 2019 05:11:28 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1900.020; Wed, 22 May 2019
 05:11:28 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if
 possible
Thread-Topic: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if
 possible
Thread-Index: AQHVCUUKmVh+8cTBr0GLk/9Xe/IGjKZowjMAgAAKVjCAAVMEkIAMDiYAgAB4gOA=
Date:   Wed, 22 May 2019 05:11:28 +0000
Message-ID: <OSAPR01MB30898CAE4DDD98EDBF479BCCD8000@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513090054.GA15744@kunai>
 <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <OSBPR01MB3174B26541C20C2951509DC8D8080@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <20190521215702.GA15483@kunai>
In-Reply-To: <20190521215702.GA15483@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6bfd7e8-6660-4b41-57c6-08d6de73f270
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB4690;
x-ms-traffictypediagnostic: OSAPR01MB4690:
x-microsoft-antispam-prvs: <OSAPR01MB4690D0FE85B6804B6CE0C8DFD8000@OSAPR01MB4690.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(136003)(376002)(39860400002)(54094003)(199004)(189003)(4326008)(73956011)(8676002)(76116006)(64756008)(66946007)(81156014)(66476007)(9686003)(6246003)(14454004)(33656002)(53936002)(8936002)(52536014)(81166006)(66446008)(66556008)(478600001)(186003)(305945005)(229853002)(6436002)(6916009)(55016002)(7736002)(68736007)(74316002)(7696005)(476003)(76176011)(446003)(3846002)(316002)(11346002)(6116002)(99286004)(2906002)(54906003)(5660300002)(102836004)(25786009)(66066001)(6506007)(26005)(486006)(256004)(86362001)(71200400001)(71190400001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4690;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ance/SkYlfaSpU2zOh6eTy1bBvr5xGiQePlDWBn7q2RXEmkBC9xJoCDSDHk78gNH/YJdRZtXTPx37O3WfT2BdhObrQaAZF/odl63HRbkHvkD3uxZqpXMtfsYDvkaiCB4KN6aDl6W6gG4PWpVqKuLqqkrfDb9MJ8TnuyCWKPhjRyjLQuVg7zga3Gw4rUfqoFkLWV1J8ctsZ101enTaqT5Wh8x7vW1KuA21OlxauKLFvMpIfeOt1IoUjucMGYGyLc85q0UN484g4rcOZFZWJGTQFuyLDKz1NB4fDePrHwiZz4W39t3DCveNw07w7T2DgfACGBAiNqW1hAyKtr7LNIemW4vVKuuSqcjS1pXpjEXxwqSGsroCxHHuV5LtxPPZEiLwyzcGyk2e665Fu0HdHh8kSWC5QJ01yDggMa30+eEjSU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bfd7e8-6660-4b41-57c6-08d6de73f270
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 05:11:28.7945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4690
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, May 22, 2019 6:57 AM
>=20
> Hi Shimoda-san,
>=20
> > > > > +	if (host->pdev->dev.iommu_group &&
> > > >
> > > > I wonder if I am too cautious, but maybe we should have another
> > > > condition here to be checked first, namely "host->mmc->max_segs < 5=
12"?
> > >
> > > I got it. I'll fix it on v3 patch.
> >
> > I'm afraid but I misunderstood this condition is
> > "host->pdata->max_segs", not "host->mmc->max_segs", to avoid small
> > max_segs value than pdata->max_segs?
>=20
> You are right. I was in deed thinking mmc->max_segs because it will be
> set at probe time, so it would work with values > 512. But I missed the
> case you described, I am sorry. But using pdata->max_segs should work.

Thank you for the reply. I got it!

> > (No one has such max_segs value at the moment though.)
>=20
> Yes. I want to be future-proof here. Just to avoid that the value might
> be "magically" decreased if the value might be bigger than 512. It would
> be hard to find then because it is kinda deep in the driver.

I got it.

> Two more remarks:
>=20
> * We should probably use a define for the magic value 512.

I think so. I also would like to use a define for a magic value 32.

> * Maybe you could add a comment to the init_card function describing why
>   we can increase max_segs in that case. Basically, a short summary of
>   your patch description.

It's a good idea! I'll add such a short summary.

> Does this make sense to you?

Yes. Thank you for your comments. I'll make v3 patch later.

Best regards,
Yoshihiro Shimoda

> Kind regards,
>=20
>    Wolfram

