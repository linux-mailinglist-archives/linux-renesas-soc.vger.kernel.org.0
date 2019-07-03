Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9575DCC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2019 05:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfGCDKf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 23:10:35 -0400
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:61336
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727049AbfGCDKf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 23:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYqLO6+U5LWl+wYzfaeZohAa2IS82Xjq5Bnl1d1ZbHk=;
 b=ktUAR1+5cefTZT70i3Q3AwJBqm2j4/lvtvOtT0oeLX/CovC16sO06kAmeotgHeQat58rJpe0YF9Zoh/gKkMiVpHKb84ArD9tGOoJ2AoHeKXp3o5TQQQsYeFAehGkcMgrwW6o2aykWQw6VyuDWsjqb85N7phSOB6OFPqeJNLufv4=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB4880.jpnprd01.prod.outlook.com (20.179.175.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 03:10:31 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::602d:62cc:de62:eaba]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::602d:62cc:de62:eaba%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 03:10:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
CC:     shuah <shuah@kernel.org>, Suwan Kim <suwan.kim027@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Topic: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Index: AQHVIcuW138W6xs/SU+mBATKJYat56aZ0SQAgAABRQCAAAL1gIAFZkqggAAqzACAF8/kEIAASseAgADLi2A=
Date:   Wed, 3 Jul 2019 03:10:31 +0000
Message-ID: <TYAPR01MB454441748DB5CBCDFCF207D3D8FB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TYAPR01MB454412603157D6DDCB512092D8F80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <Pine.LNX.4.44L0.1907021018220.1647-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1907021018220.1647-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97391305-1046-4447-08b0-08d6ff640220
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4880;
x-ms-traffictypediagnostic: TYAPR01MB4880:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <TYAPR01MB488062653B815BBF6F6AFBA8D8FB0@TYAPR01MB4880.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(189003)(43544003)(199004)(66946007)(64756008)(76116006)(66476007)(66446008)(66556008)(73956011)(305945005)(14444005)(74316002)(76176011)(316002)(7696005)(8936002)(81166006)(4326008)(5660300002)(52536014)(66066001)(71200400001)(71190400001)(7736002)(256004)(8676002)(81156014)(478600001)(25786009)(11346002)(229853002)(476003)(486006)(446003)(6116002)(55016002)(6246003)(102836004)(186003)(2171002)(6306002)(9686003)(6436002)(26005)(68736007)(14454004)(86362001)(99286004)(966005)(54906003)(33656002)(3846002)(53936002)(2906002)(110136005)(6506007)(6606295002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4880;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: giLm67VTVR5c9WnFZEsY+Nxn9+8XDt2LpHjKeq8DgLULkCGJl27cZC8wqVtGM9liEfFSteFkcI4WVQCasWR6JXafu5N8O5U4759aAJTrmM2MFFsQTAH+FAQb8sR0smQtRAAx7iLcKDQo84cEHE9f+q8kss/GIoTSwQK44QZzL/aciDupMXhG4cz4loClzaxuaXvMnpWsH1o6DhnCxS9EF0njrKIKzpRoIWLCmXcN8l+uU7/z0VmkhEMXYuEUX6vf+2qEc1E8HpQCV1nKE1Q+JmIFMwHfkHPHsyybphQGfU9ELPzrNdQOlksPvmhoqGhJ139rQc0mH2gNxegGvE3dAnqLP2/QViadHQ6AGJ6yRnZ5GL3sA5QhkqF90flNGn/OAucGYVsKD10TpOHmcCNptSYd37dhj1oYInH91fG4Arw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97391305-1046-4447-08b0-08d6ff640220
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 03:10:31.4631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4880
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Tuesday, July 2, 2019 11:28 PM
>=20
> On Tue, 2 Jul 2019, Yoshihiro Shimoda wrote:
>=20
> > Hi Alan, shuah, Suwan,
> >
> > > From: Christoph Hellwig, Sent: Monday, June 17, 2019 3:22 PM
> > >
> > > On Mon, Jun 17, 2019 at 04:17:43AM +0000, Yoshihiro Shimoda wrote:
> > > > Thank you for the comments. So, should I wait for getting rid of th=
e
> > > > virt_boundary_mask stuff? If I revise the commit log of this patch,
> > > > is it acceptable for v5.2-stable as a workaround? In other words,
> > > > I worry about this issue exists on v5.2-stable.
> > >
> > > It does exist on 5.2-stable and we should fix it.  I'll plan to resen=
d
> > > my series to fix the virt_boundary issues for the other SCSI driver
> > > soon, but we'll still need to sort out usb-storage.
> >
> > I guess that getting rid of the virt_boundary_mask stuff [1] needs more=
 time.
> > So, for v5.2-stable, would you accept my patch as a workaround?
> > JFYI, v5.2-rc7 still has this "swiotlb buffer is full" issue.
> >
> > [1]
> > https://marc.info/?l=3Dlinux-kernel&m=3D156114524808042&w=3D2
>=20
> I would really prefer to see a different solution.
>=20
> The actual problem is that the usb_device and usb_interface structures
> are supposed to inherit all of their DMA properties from the bus's host
> controller.  But the existing code copies only the dma_mask and
> dma_pfn_offset fields in the embedded device structures.  If we copied
> all of the important DMA fields then this patch wouldn't be needed; the
> max_sectors value for the request queue would be set up correctly to
> begin with.

I'm sorry, but I cannot understand what are important DMA fields.
IIUC, usb-storage driver should take care of calling blk_queue_ APIs anyway=
 because:

 - As Christoph mentioned before on the email [1], usb-storage has a specia=
l
   max_sectors quirk for tape and SuperSpeed devices.
 - Since blk_queue_* APIs don't take device structure pointer, the block la=
yer
   cannot call any DMA mapping APIs. So, even if any other DMA fields are c=
opied,
   the behavior is not changed.

[1]
https://www.spinics.net/lists/linux-usb/msg181527.html

What do you think?

Best regards,
Yoshihiro Shimoda

> So what I would like to see is a new subroutine -- perhaps in the
> driver core -- that copies the DMA fields from one struct device to
> another.  Then we could call this subroutine in usb_alloc_dev() and
> usb_set_configuration() instead of copying the information manually.
>=20
> Greg and Christoph, does that make sense?
>=20
> Yoshihiro, would you like to write a patch that does this?
>=20
> Alan Stern

