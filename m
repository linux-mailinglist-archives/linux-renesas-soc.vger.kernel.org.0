Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAE21C2C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2019 08:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfENGFj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 May 2019 02:05:39 -0400
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:54592
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726078AbfENGFi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 May 2019 02:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvogcAkBTPnuYrxBc73FQfVRNGZnz/+09NANc92kLV8=;
 b=V9deiaLk9ONLGL/SscHGO7S2zDzKGt6uqNOavcLbuJnr0M3fVf93gge2KRPckjTtS4do4j/EACngVqoy9p+6Z0Dnv1wGXt0PMv2X8MCtX4+9QQIF+KhMs9V4yXGzn9APMj6yiCQl9+8Lztg9pecQPmFg8S9Lt142G6nfBXEp9Vk=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB1477.jpnprd01.prod.outlook.com (52.134.228.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 06:05:34 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 06:05:34 +0000
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
Thread-Index: AQHVCUUKmVh+8cTBr0GLk/9Xe/IGjKZowjMAgAAKVjCAAVMEkA==
Date:   Tue, 14 May 2019 06:05:34 +0000
Message-ID: <OSBPR01MB3174B26541C20C2951509DC8D8080@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513090054.GA15744@kunai>
 <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25f6b558-7046-4a82-3d1f-08d6d8322d97
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB1477;
x-ms-traffictypediagnostic: OSBPR01MB1477:
x-microsoft-antispam-prvs: <OSBPR01MB1477B6932023A1A6FD6359A3D8080@OSBPR01MB1477.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(136003)(376002)(346002)(366004)(54094003)(52314003)(189003)(199004)(476003)(102836004)(76176011)(446003)(2906002)(99286004)(54906003)(486006)(6506007)(9686003)(66476007)(66946007)(66556008)(64756008)(66446008)(11346002)(86362001)(7696005)(53936002)(76116006)(73956011)(8936002)(186003)(4326008)(68736007)(81166006)(81156014)(55016002)(6116002)(6246003)(8676002)(52536014)(305945005)(5660300002)(7736002)(316002)(26005)(3846002)(71190400001)(25786009)(71200400001)(14454004)(74316002)(478600001)(33656002)(66066001)(6916009)(14444005)(256004)(6436002)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1477;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L8oOXuhfeddIyofs6FM4p8V5q5VC35Ig5h+8JilsbIpsaYKqgH1QX9bC0JIw0NiXs+7TZpU8hpRu75S6NRNvYibutl9oIXRqU5mabn56UNDbg+0zoiaYb/uVgiAAVkTp47C42j84mUp+VqmzsL9gX9LeycjzL/7KwXsm2BIYBuBpgu7XyF9mxHGO/HUhxahLSsnjIuvEOs1tTL1Dct93kK8Qa91ZYOVopdYI/iVB9H+lbvdc5CfNhsGdCs0mMJBGms+5TtkURWH7SpNIUMdgynZIjWzcnPV3ss5ZCPExo4qQiuH4k1r8cpp7iw9grXJZTKJ/JwSx7L1q1HdesSWTMffrrX5NEFmTzt89CNfQittq2S1QWEnms1HFcI7X8dQY+spQf7K0SgU5KUnzAVQRBen39i/T8dB5Ll/MFM2kJ4I=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f6b558-7046-4a82-3d1f-08d6d8322d97
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 06:05:34.3475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1477
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san again,

> From: Yoshihiro Shimoda, Sent: Monday, May 13, 2019 6:46 PM
>=20
> Hi Wolfram-san,
>=20
> > From: Wolfram Sang, Sent: Monday, May 13, 2019 6:01 PM
> >
> > Hi Shimoda-san,
> >
> > thank you for this update!
> >
> > > +static void renesas_sdhi_init_card(struct mmc_host *mmc, struct mmc_=
card *card)
> > > +{
> > > +	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> > > +
> > > +	if (host->pdev->dev.iommu_group &&
> >
> > I wonder if I am too cautious, but maybe we should have another
> > condition here to be checked first, namely "host->mmc->max_segs < 512"?
>=20
> I got it. I'll fix it on v3 patch.

I'm afraid but I misunderstood this condition is "host->pdata->max_segs", n=
ot "host->mmc->max_segs",
to avoid small max_segs value than pdata->max_segs? (No one has such max_se=
gs value at the moment though.)

If we use "host->mmc->max_segs", the max_segments value will be toggled by =
connecting/disconnecting a card like below:

(a card is connected)
# cat /sys/block/mmcblk0/queue/max_segments
512
(a card is disconnected and connected again)
# cat /sys/block/mmcblk0/queue/max_segments
1
(a card is disconnected and connected again)
# cat /sys/block/mmcblk0/queue/max_segments
512
...

Best regards,
Yoshihiro Shimoda

> > > +	    (mmc_card_mmc(card) || mmc_card_sd(card)))
> > > +		host->mmc->max_segs =3D 512;
> > > +	else
> > > +		host->mmc->max_segs =3D host->pdata->max_segs;
> >
> > max_segs can be 0, so we should probably have:
> >
> >  +		host->mmc->max_segs =3D host->pdata->max_segs ?: 32;
>=20
> Thank you for the point! I'll fix it on v3 patch.
>=20
> > That also means, for the sys-dmac and Gen2, we then use 512 for the
> > IOMMU case and 32 (default TMIO value) for the non IOMMU case. My
> > understanding is that SYS DMAC can handle 512 in both cases. Maybe it
> > makes sense then to make an incremental patch setting the max_segs valu=
e
> > explicitly to 512 in the sys-dmac driver for Gen2?
>=20
> I also think SYS DMAC can handle 512 segments. However, I'm not sure
> it can improve the performance or not though. Anyway, an incremental patc=
h
> makes sense if needed, I think.
>=20
> Best regards,
> Yoshihiro Shimoda
>=20
> > Kind regards,
> >
> >    Wolfram

