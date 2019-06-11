Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5926B3C477
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 08:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391262AbfFKGtR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 02:49:17 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:20544
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391233AbfFKGtR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 02:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZTXEMME8NnhGCouO7tCVCDEdyMs+irQ+11VbPTgvVo=;
 b=m5e5K5VFR0JNVHhH71YFwbP6Ur44rvXIj/MOd3rPg9DMyP+AprsKlc55x7Ue6ZmUmCW3kqdW8OP4P7FD7GE1fMzom4lg3rwGa/CS4Sr4ViagCJr5BLqb8iLUWdRgWLjxthUexiqoah8IfE/zhgSBHEy53ksYWu5opvQMQ1CuKjg=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3666.jpnprd01.prod.outlook.com (20.178.128.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 06:49:12 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 06:49:12 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Christoph Hellwig <hch@lst.de>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: How to resolve an issue in swiotlb environment?
Thread-Topic: How to resolve an issue in swiotlb environment?
Thread-Index: AdUZ1Qlk800+Qz0uSuO63mIBeXkktQDUe+5AAJUL5SAAA1kYAAANEESAABf845A=
Date:   Tue, 11 Jun 2019 06:49:12 +0000
Message-ID: <OSAPR01MB30899F6EE0ABD554B4A21E7FD8ED0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <20190610123222.GA20985@lst.de>
 <Pine.LNX.4.44L0.1906101423200.1560-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906101423200.1560-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 653fa7d6-1148-484d-afa6-08d6ee38e9e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3666;
x-ms-traffictypediagnostic: OSAPR01MB3666:
x-microsoft-antispam-prvs: <OSAPR01MB3666C9700F08B92CD08E1272D8ED0@OSAPR01MB3666.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(376002)(396003)(39860400002)(136003)(189003)(199004)(486006)(73956011)(66066001)(66946007)(33656002)(3846002)(110136005)(6246003)(25786009)(53936002)(4326008)(66446008)(76116006)(68736007)(86362001)(6116002)(305945005)(64756008)(316002)(54906003)(66556008)(2171002)(66476007)(14444005)(256004)(7696005)(8936002)(5660300002)(14454004)(7736002)(229853002)(11346002)(76176011)(6436002)(99286004)(2906002)(55016002)(52536014)(9686003)(81166006)(71200400001)(102836004)(476003)(71190400001)(478600001)(8676002)(26005)(6506007)(446003)(186003)(81156014)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3666;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cLMle0Pje1Fic3R//UYSRBgca4Dc2cCwPkLi7lZHaR+iX1jz3oJXvSifQm/XlydGsup7aBWjLB8a65ylkYiR4KxQ97KaI/wfzPZBJ8PejbKLnjZomMEiCPOuS48vkU6rof4EHVL2eZ9H899G8o8JladlMlBjEqtpb0a5rx7ezcnvJ6q39KexTmDuHZYOIgm8b2x2pVCBrIW6fOeAZ4MZU/FsDXWRGSM/elOn5r73g48PycCQZ/jIsvATZ8vGJZDIMTImiGiW4BVZ39GLsd3QoKOWVS4whuuLcPD2+WGbQoJXP1zu++/GR9/XYfXN4dWGdaC4XVT+rw/5h48HX/vXg9kLx2ZBsdnai4RUAx/w/XjrnA/CiJ8GCDgwPV+l6z8402sr+BqKF50Q/Tx7COVjIXeFO2OHSrFq8qAg77A9yhA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653fa7d6-1148-484d-afa6-08d6ee38e9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 06:49:12.8499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3666
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph, Alan,

> From: Alan Stern, Sent: Tuesday, June 11, 2019 3:46 AM
>=20
> On Mon, 10 Jun 2019, Christoph Hellwig wrote:
>=20
> > Hi Yoshihiro,
> >
> > sorry for not taking care of this earlier, today is a public holiday
> > here and thus I'm not working much over the long weekend.

To Christoph:

No worries.

> > On Mon, Jun 10, 2019 at 11:13:07AM +0000, Yoshihiro Shimoda wrote:
> > > I have another way to avoid the issue. But it doesn't seem that a goo=
d way though...
> > > According to the commit that adding blk_queue_virt_boundary() [3],
> > > this is needed for vhci_hcd as a workaround so that if we avoid to ca=
ll it
> > > on xhci-hcd driver, the issue disappeared. What do you think?
> > > JFYI, I pasted a tentative patch in the end of email [4].
> >
> > Oh, I hadn't even look at why USB uses blk_queue_virt_boundary, and it
> > seems like the usage is wrong, as it doesn't follow the same rules as
> > all the others.  I think your patch goes in the right direction,
> > but instead of comparing a hcd name it needs to be keyed of a flag
> > set by the driver (I suspect there is one indicating native SG support,
> > but I can't quickly find it), and we need an alternative solution
> > for drivers that don't see like vhci.  I suspect just limiting the
> > entire transfer size to something that works for a single packet
> > for them would be fine.
>=20
> Christoph:
>=20
> In most of the different kinds of USB host controllers, the hardware is
> not capable of assembling a packet out of multiple buffers at arbitrary
> addresses.  As a matter of fact, xHCI is the only kind that _can_ do
> this.
>=20
> In some cases, the hardware can assemble packets provided each buffer
> other than the last ends at a page boundary and each buffer other than
> the first starts at a page boundary (Intel would say the buffers are
> "virtually contiguous"), but this is a rather complex rule and we don't
> want to rely on it.  Plus, in other cases the hardware _can't_ do this.
>=20
> Instead, we want the SG buffers to be set up so that each one (except
> the last) is an exact multiple of the maximum packet size.  That way,
> each packet can be assembled from the contents of a single buffer and
> there's no problem.

There is out of this topic though, if we prepare such an exact multiple
of the maximum packet size (1024, 512 or 64), is it possible to cause
trouble on IOMMU environment? IIUC, dma_map_sg() maps SG buffers as
a single segment and then the segment buffer is not contiguous.

> The maximum packet size depends on the type of USB connection.
> Typical values are 1024, 512, or 64.  It's always a power of two and
> it's smaller than 4096.  Therefore we simplify the problem even further
> by requiring that each SG buffer in a scatterlist (except the last one)
> be a multiple of the page size.  (It doesn't need to be aligned on a
> page boundary, as far as I remember.)
>=20
> That's why the blk_queue_virt_boundary usage was added to the USB code.
> Perhaps it's not the right way of doing this; I'm not an expert on the
> inner workings of the block layer.  If you can suggest a better way to
> express our requirement, that would be great.

Since I'm also not familiar with the block layer, I could not find a better
way...

Best regards,
Yoshihiro Shimoda

> Alan Stern
>=20
> PS: There _is_ a flag saying whether an HCD supports SG.  But what it
> means is that the driver can handle an SG list that meets the
> requirement above; it doesn't mean that the driver can reassemble the
> data from an SG list into a series of bounce buffers in order to meet
> the requirement.  We very much want not to do that, especially since
> the block layer should already be capable of doing it for us.

