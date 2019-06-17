Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBB84799D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 07:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfFQFIg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 01:08:36 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:36436
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725372AbfFQFIg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 01:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiALxG4tK/WQrfqeCycJRTKcLhU5H2PNjCNVp4rbysE=;
 b=U6aIyincgEPslYJn2ce9nx8adBE2gXLcP5MyWLegMZexZJfq0d/xfUgflnKvyay+qQDd0gJtLdpa7BqwqVEgrVk8gPHXMfWkVp/XbaemZ0RzOK6Z69EErcbJzigeCaG2tm5IoOaS/aDMdwxPOjzs9ExMpQkD5IZcuefB18qVxPc=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB5143.jpnprd01.prod.outlook.com (20.179.182.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Mon, 17 Jun 2019 05:08:33 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 05:08:33 +0000
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
Subject: RE: [RFC PATCH v6 1/5] iommu: add an exported function to get minimum
 page size for a domain
Thread-Topic: [RFC PATCH v6 1/5] iommu: add an exported function to get
 minimum page size for a domain
Thread-Index: AQHVIdGm+Ppekm2K+U6llaxf9E8PnaaZ+1+AgAVWIzA=
Date:   Mon, 17 Jun 2019 05:08:32 +0000
Message-ID: <OSBPR01MB359070B29BCDF41F5C5F92BAD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190613193759.GB6863@kunai>
In-Reply-To: <20190613193759.GB6863@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 303491ce-811f-4b28-a2e9-08d6f2e1d850
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSBPR01MB5143;
x-ms-traffictypediagnostic: OSBPR01MB5143:
x-microsoft-antispam-prvs: <OSBPR01MB5143C5C8A2D618DC1493F256D8EB0@OSBPR01MB5143.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(376002)(136003)(366004)(346002)(189003)(199004)(446003)(102836004)(68736007)(5660300002)(86362001)(73956011)(66946007)(53936002)(476003)(6246003)(9686003)(229853002)(26005)(8676002)(6506007)(81166006)(81156014)(66066001)(52536014)(6916009)(6116002)(3846002)(76116006)(2906002)(478600001)(7416002)(66446008)(99286004)(486006)(54906003)(66476007)(66556008)(64756008)(186003)(7696005)(11346002)(316002)(256004)(7736002)(305945005)(76176011)(4326008)(74316002)(33656002)(6436002)(71200400001)(71190400001)(8936002)(14454004)(55016002)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5143;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cdRmlA4NxQKv/naF6ZO9QsDcNT180C8v9mI9ZRhfD80yzkEOs+W5KKMDYqmJ6N3N36X13e9dewFTeBzrK6DVvVSyfcDKm/SKoAYYbQE9jqTloK3Q/kFrKkq6XRZ7ojaq5/WSV6AchYgTgwZqqGcDxTCl3Y52m1ypdcihH6NoPQXKgUNuaugv9M+R0y2bv28GeSTmRCPVVnnNpd4Z35MZoiU3LTv6H3xhJEFOw1CeZ/ggVKwwcSYHSN8taLHg/yR9/PLVflwhc/xL3nVGYN4si/ZlXz68xQw1t57W//rxZRewpF0OTkZvcK5vvGssHQvhtqcDYU3/pjfDIavs2jFnJB/H/7A78AbLywja3hpcRKDJuYuDJLa4uNmF7mOZ9f++rmkDueGnS4NFceYdtfDNU9uZZpz5v8ysm/VIWx3IrrI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303491ce-811f-4b28-a2e9-08d6f2e1d850
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 05:08:32.9181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5143
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, June 14, 2019 4:38 AM
>=20
> On Thu, Jun 13, 2019 at 07:20:11PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds an exported function to get minimum page size for
> > a domain. This patch also modifies similar codes on the iommu.c.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/iommu/iommu.c | 18 +++++++++++++++---
> >  include/linux/iommu.h |  1 +
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index 2a90638..7ed16af 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -280,6 +280,18 @@ iommu_insert_device_resv_regions(struct list_head =
*dev_resv_regions,
> >  	return ret;
> >  }
> >
> > +/**
> > + * iommu_get_minimum_page_size - get minimum page size for a domain
> > + * @domain: the domain
> > + *
> > + * Allow iommu driver to get a minimum page size for a domain.
> > + */
> > +unsigned long iommu_get_minimum_page_size(struct iommu_domain *domain)
> > +{
> > +	return 1UL << __ffs(domain->pgsize_bitmap);
> > +}
> > +EXPORT_SYMBOL_GPL(iommu_get_minimum_page_size);
>=20
> What about making this a 'static inline' in the iommu header file? I'd
> think it is simple enough and would save us the EXPORT symbol.

Thank you for the review. I think so. I'll use 'static inline' instead of
EXPORT symbol.

Best regards,
Yoshihiro Shimoda

