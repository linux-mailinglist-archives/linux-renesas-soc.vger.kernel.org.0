Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450AE1B326
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 11:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfEMJqO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 05:46:14 -0400
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:37001
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727848AbfEMJqN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 05:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdnBwz2fcK4NnNm0pJXEtSp7TxCbROigNJeM/fX2gKg=;
 b=RcGtCyzrqP19YJmRZbfq3LvicX3ZriiyGHH1khWLb6F8t1Aorr6DV/Sb0uGZRk9Q/qpyXCJHihZFbrYw3/eFpFwb6VA1S+Xc+RlF+0JXtjOUWfO9Dbe9yImeK8DEL3Ulc7RKeexurC8j6fC7tLISinncbwdTC9bf4hzC+oNmZ+c=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2440.jpnprd01.prod.outlook.com (52.134.254.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 09:46:08 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 09:46:08 +0000
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
Thread-Index: AQHVCUUKmVh+8cTBr0GLk/9Xe/IGjKZowjMAgAAKVjA=
Date:   Mon, 13 May 2019 09:46:08 +0000
Message-ID: <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513090054.GA15744@kunai>
In-Reply-To: <20190513090054.GA15744@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cedbd18-da97-4b7b-ce6f-08d6d787d366
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2440;
x-ms-traffictypediagnostic: OSBPR01MB2440:
x-microsoft-antispam-prvs: <OSBPR01MB24408B6C80EA020ED0381723D80F0@OSBPR01MB2440.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(346002)(366004)(376002)(39860400002)(189003)(199004)(52314003)(54094003)(4326008)(55016002)(186003)(14454004)(2906002)(74316002)(9686003)(33656002)(478600001)(486006)(86362001)(6116002)(3846002)(54906003)(6916009)(25786009)(476003)(11346002)(446003)(71190400001)(26005)(81166006)(102836004)(66066001)(316002)(81156014)(68736007)(71200400001)(7696005)(8936002)(6246003)(256004)(76176011)(52536014)(66946007)(73956011)(66446008)(64756008)(66556008)(66476007)(76116006)(14444005)(99286004)(305945005)(53936002)(6506007)(5660300002)(6436002)(8676002)(229853002)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2440;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lF50DJs9RsBs5GxB0QprtVPCMayYUQYHgDRYaMmBJxGjLvzO9A2FhnPKEh5kR3kw8k9nnr+6JA0wTKbMcCpMWkPl25++le5L5+jnNy2nZ5EJOA04Rmp225IyPxnF6qMmgm0qH54VWV0QN9JpOYLNbnbNLHGBSDCX0LVIn1bHOGlDMBgggukLGLCRTZgcLr6e+5QHHx95fN9H/WmBO/mF2zf/tzqK6ntaB3baz+/rmXpRfw0OwK3hJf9O0R79QOL+Tae7+9J8Puy1S9XmlSwA6IRMK6jQqAHfTnQe/+IG2XIeywkPnx3MtvDwcyUzAcMoPNDkyB0AQPAO0BJGCa3riehqaj+zPn+//dpERbn7FxVSnghCsEhi+jqi6P1GTGWA2qchbFP9p9qBZKV59+yGPxMyrHS8g8l4vJt2tJjXkTg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cedbd18-da97-4b7b-ce6f-08d6d787d366
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 09:46:08.5131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2440
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Monday, May 13, 2019 6:01 PM
>=20
> Hi Shimoda-san,
>=20
> thank you for this update!
>=20
> > +static void renesas_sdhi_init_card(struct mmc_host *mmc, struct mmc_ca=
rd *card)
> > +{
> > +	struct tmio_mmc_host *host =3D mmc_priv(mmc);
> > +
> > +	if (host->pdev->dev.iommu_group &&
>=20
> I wonder if I am too cautious, but maybe we should have another
> condition here to be checked first, namely "host->mmc->max_segs < 512"?

I got it. I'll fix it on v3 patch.

> > +	    (mmc_card_mmc(card) || mmc_card_sd(card)))
> > +		host->mmc->max_segs =3D 512;
> > +	else
> > +		host->mmc->max_segs =3D host->pdata->max_segs;
>=20
> max_segs can be 0, so we should probably have:
>=20
>  +		host->mmc->max_segs =3D host->pdata->max_segs ?: 32;

Thank you for the point! I'll fix it on v3 patch.

> That also means, for the sys-dmac and Gen2, we then use 512 for the
> IOMMU case and 32 (default TMIO value) for the non IOMMU case. My
> understanding is that SYS DMAC can handle 512 in both cases. Maybe it
> makes sense then to make an incremental patch setting the max_segs value
> explicitly to 512 in the sys-dmac driver for Gen2?

I also think SYS DMAC can handle 512 segments. However, I'm not sure
it can improve the performance or not though. Anyway, an incremental patch
makes sense if needed, I think.

Best regards,
Yoshihiro Shimoda

> Kind regards,
>=20
>    Wolfram

