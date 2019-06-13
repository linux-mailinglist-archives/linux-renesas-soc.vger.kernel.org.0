Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE6E3445EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 18:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfFMQsB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 12:48:01 -0400
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:17865
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730247AbfFMEwK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 00:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0KvqaJ072jkO2bkJ8USO9biczqHUVBbvjaN9RjmwVw=;
 b=Og+phJsUg4CrEnoCz2rKqyIMK41Ja+0I3Tl/3dP6Q67O4F5lxjvrR4InGIlBhQ+yewsJHQki4jJ7NMHKt/g40Z2Wc2ljkwEGeOVaDyPFvFaUZ4NErsjhY4dVxe8nhXTTg7x7TBZaKZ1YwdsJ54E4jCz4Xoe44RyVEYwVWK5lOOM=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB2995.jpnprd01.prod.outlook.com (52.134.248.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 13 Jun 2019 04:52:05 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 04:52:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: How to resolve an issue in swiotlb environment?
Thread-Topic: How to resolve an issue in swiotlb environment?
Thread-Index: AdUZ1Qlk800+Qz0uSuO63mIBeXkktQDUe+5AAJUL5SAAA1kYAAANEESAABj9hAAAERZjAAAi6naAAAJz/+AABe44AAAkT+Aw
Date:   Thu, 13 Jun 2019 04:52:04 +0000
Message-ID: <OSAPR01MB3089ACE26C9C986BB15CF960D8EF0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <20190611064158.GA20601@lst.de>
 <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
 <20190612073059.GA20086@lst.de>
 <OSAPR01MB3089D154C6DF0237003CE80CD8EC0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <20190612113102.GA24742@lst.de>
In-Reply-To: <20190612113102.GA24742@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b76f24c3-92f8-4dbb-0a27-08d6efbae22d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSAPR01MB2995;
x-ms-traffictypediagnostic: OSAPR01MB2995:
x-microsoft-antispam-prvs: <OSAPR01MB29956F43960EF8EFCC63DF5BD8EF0@OSAPR01MB2995.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(7696005)(6116002)(25786009)(33656002)(478600001)(14444005)(9686003)(256004)(6246003)(4326008)(76116006)(476003)(76176011)(11346002)(66446008)(73956011)(66946007)(81156014)(66476007)(66066001)(446003)(66556008)(64756008)(486006)(81166006)(7736002)(3846002)(8936002)(6916009)(8676002)(54906003)(305945005)(53936002)(5660300002)(316002)(68736007)(99286004)(74316002)(71200400001)(55016002)(26005)(14454004)(2906002)(186003)(52536014)(229853002)(6506007)(102836004)(6436002)(71190400001)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2995;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yuAVPmOnA7259ti7dDat3UjAmq0/YUtJVYEh1zWPz4sNxuOPqA9xvKsB+4CcWmk4vLEUbXOSG0ZlSjm4A3uEmp4aZg/VbGF0ToAQvbxqw1D/ZALCc+cVIWB0/K/idnnPQSOT0RHAScN7r1p6RlO2OPFkA/a/+kwXoUASOwsXHhEC1Tg2B2VxCFpY7t7/MWOg0C7U6TKn/0CHduM6rCxBpSIyxr1+9YJp3JlWaqMvz8jz1UW0HsML0E4woN4VV87vHlu0mWsRfBBc4odQrYLv7EdZD+7LdFXzuDB751EfNDhSEZG5kkx2zjUyA/ooh8CFMGoHNAI2jbb8nt72uzQEgfxN1cwuuCzK4RITDKSSXX4gQOQPy6gAJerKu7t1ehMiCVxc6wPoxArnh7pyhzN8ffs6wuDvsBfOCo6NyPAja3k=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76f24c3-92f8-4dbb-0a27-08d6efbae22d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 04:52:05.1984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2995
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Wednesday, June 12, 2019 8:31 PM
>=20
> On Wed, Jun 12, 2019 at 08:52:21AM +0000, Yoshihiro Shimoda wrote:
> > Hi Christoph,
> >
> > > From: Christoph Hellwig, Sent: Wednesday, June 12, 2019 4:31 PM
> > >
> > > First things first:
> > >
> > > Yoshihiro, can you try this git branch?  The new bits are just the th=
ree
> > > patches at the end, but they sit on top of a few patches already sent
> > > out to the list, so a branch is probably either:
> > >
> > >    git://git.infradead.org/users/hch/misc.git scsi-virt-boundary-fixe=
s
> >
> > Thank you for the patches!
> > Unfortunately, the three patches could not resolve this issue.
> > However, it's a hint to me, and then I found the root cause:
> >  - slave_configure() in drivers/usb/storage/scsiglue.c calls
> >    blk_queue_max_hw_sectors() with 2048 sectors (1 MiB) when USB_SPEED_=
SUPER or more.
> >  -- So that, even if your patches (also I fixed it a little [1]) could =
not resolve
> >     the issue because the max_sectors is overwritten by above code.
> >
> > So, I think we should fix the slave_configure() by using dma_max_mappin=
g_size().
> > What do you think? If so, I can make such a patch.
>=20
> Yes, please do.

Thank you for your comment. I sent a patch to related mailing lists and you=
.

Best regards,
Yoshihiro Shimoda

