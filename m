Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C13038402
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 08:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbfFGGBF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 02:01:05 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:18240
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726664AbfFGGBF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 02:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tsxk6Lqyiv5wia7JMYpnMyS2BQcmPgvxu7gzRzXFg8I=;
 b=hGttlxd7BDoILYQCaPVNoTE9pMsJBWiwIkLAiMhv786dWGv/5jPGD83Az+5yoBo7LsHNYl5frtmDqnKq9R12zUCnROaSxkuxepCFu7x642aPbO4tab8aed97U309w2DxIexkP9SjMsS+tAXXFFGCdzwefMJnpPM3SB8+qovfuY0=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2948.jpnprd01.prod.outlook.com (52.134.248.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Fri, 7 Jun 2019 06:01:00 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.023; Fri, 7 Jun 2019
 06:01:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Robin Murphy <robin.murphy@arm.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Thread-Topic: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Thread-Index: AQHVG5AuSNIEYbUj60Sza33KteoVlaaM+2qAgAAEhACAASFw4IAAErKAgAFoAcCAABZegIAAAprg
Date:   Fri, 7 Jun 2019 06:01:00 +0000
Message-ID: <OSAPR01MB30894702972EB047D1EF2938D8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
 <20190605123808.GA12529@lst.de>
 <OSAPR01MB3089448A3D44BE61B127AA73D8170@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <20190606070059.GI27033@lst.de>
 <OSAPR01MB3089E3E79B0BDF24610FBEC2D8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <20190607054933.GA8267@lst.de>
In-Reply-To: <20190607054933.GA8267@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6969671-67c2-45b8-d48e-08d6eb0d846d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB2948;
x-ms-traffictypediagnostic: OSAPR01MB2948:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSAPR01MB294833003401BE4E2CEB2E6DD8100@OSAPR01MB2948.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(366004)(136003)(396003)(376002)(199004)(189003)(966005)(99286004)(8936002)(66946007)(66476007)(64756008)(66556008)(76116006)(66446008)(81166006)(81156014)(305945005)(14454004)(478600001)(8676002)(26005)(446003)(74316002)(486006)(11346002)(476003)(102836004)(76176011)(6506007)(6916009)(7696005)(186003)(25786009)(73956011)(86362001)(68736007)(4326008)(6116002)(66066001)(3846002)(6436002)(71200400001)(52536014)(6306002)(55016002)(9686003)(53936002)(71190400001)(229853002)(5660300002)(54906003)(316002)(6246003)(33656002)(7736002)(256004)(2906002)(14444005)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2948;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hlh7wZvTIwmwREaiB/TliScx+ofQM9w3p6g8QZe7OlfdbgRuJUFbcG8Mld7SQdwisW/4jv500Tg5vTA5YRulWlkNibmE4B8ZU0WBU31dwh3GASKexGMzY2SxmmdJLtEXx3uf8kIiUjIjV+vLZSe2HkUUE5SwYemecJ6u/PHbsFFjFikg60hLI/DxAOFJbBXLn5DaDbEUM6Up0NhqvOL1ZQOiNeH1uRhWm3j63iu+8X0dh8YzdVQ2AQmUxZtiHrx1YGNxdW4dQLqvu0zymlX7OeaGISvFz7xAADTxvvH5aBe1MVEPK+avV8L6H1RhMAac3QYyFOpN1yx4dSPICTnVW07lFkXYF/UTI5kmlPy3IsQbWpwHr1AFXLHI2M9zLP/IlUJ9I5GqFxLulrSgOfdnD62+2EKRiPrxo9eGNc4uvXs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6969671-67c2-45b8-d48e-08d6eb0d846d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 06:01:00.6627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2948
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Friday, June 7, 2019 2:50 PM
>=20
> On Fri, Jun 07, 2019 at 05:41:56AM +0000, Yoshihiro Shimoda wrote:
> > > bool blk_can_use_iommu_merging(struct request_queue *q, struct device=
 *dev)
> > > {
> > > 	if (!IOMMU_CAN_MERGE_SEGMENTS(dev))
> > > 		return false;
> >
> > As Robin mentioned, all IOMMUs can merge segments so that we don't need
> > this condition, IIUC. However, this should check whether the device is =
mapped
> > on iommu by using device_iommu_mapped().
>=20
> There are plenty of dma_map_ops based drivers that can't merge segments.
> Examples:
>=20
>  - arch/ia64/sn/pci/pci_dma.c
>  - arch/mips/jazz/jazzdma.c
>  - arch/sparc/mm/io-unit.c
>  - arch/sparc/mm/iommu.c
>  - arch/x86/kernel/pci-calgary_64.c

Thank you for the indicate. I'll check these codes.

> Nevermind the diret mapping, swiotlb and other weirdos.

I got it.

> > > 	blk_queue_virt_boundary(q, IOMMU_PAGE_SIZE(dev));
> > > 	blk_queue_max_segment_size(q, IOMMU_MAX_SEGMENT_SIZE(dev));
> >
> > By the way, I reported an issue [1] and I'm thinking dima_is_direct() e=
nvironment
> > (especially for swiotlb) is also needed such max_segment_size changes s=
omehow.
> > What do you think?
> >
> > [1]
> > https://marc.info/?l=3Dlinux-block&m=3D155954415603356&w=3D2
>=20
> That doesn't seem to be related to the segment merging.  I'll take
> a look, but next time please Cc the author of a suspect commit if
> you already bisect things.

Oops. I'll Cc the author in next time.

Best regards,
Yoshihiro Shimoda

