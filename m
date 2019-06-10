Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299933B3D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 13:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389666AbfFJLNN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 07:13:13 -0400
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:52562
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389001AbfFJLNM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 07:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv1cB6TYVqqrUWnJnAL27fz2RL0totzSyKRsj0PLFMo=;
 b=lP8qKNjeMfnhKUvehlqDPW1551+49VM/xdJmAEqTSGN4fU7KcmkgeSboeUexpcK/zgO6LC48C4OyYKH6pwZSu5g18vCK4nNaSWNAlEFSsELAh3mO7ZajwPzEldGDY2OnzH2D1+gOWtGS7fBn5Zw+7QPG+CNdbY0b+ujEVYbbWhI=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3924.jpnprd01.prod.outlook.com (20.178.103.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Mon, 10 Jun 2019 11:13:08 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 11:13:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: How to resolve an issue in swiotlb environment?
Thread-Topic: How to resolve an issue in swiotlb environment?
Thread-Index: AdUZ1Qlk800+Qz0uSuO63mIBeXkktQDUe+5AAJUL5SA=
Date:   Mon, 10 Jun 2019 11:13:07 +0000
Message-ID: <OSAPR01MB3089BCA7CF78D6E4D9C83E1BD8130@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <OSAPR01MB3089B381AF2F687526E63EEAD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <OSAPR01MB3089D50DBDAA6C7D427E72EED8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB3089D50DBDAA6C7D427E72EED8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4065dcc2-72a5-405b-85a5-08d6ed949e46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3924;
x-ms-traffictypediagnostic: OSAPR01MB3924:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSAPR01MB3924B1967F84D0D57C9C01C5D8130@OSAPR01MB3924.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39860400002)(376002)(346002)(136003)(189003)(199004)(6306002)(9686003)(186003)(3846002)(6436002)(14444005)(55016002)(305945005)(7736002)(256004)(6116002)(74316002)(2906002)(26005)(229853002)(11346002)(446003)(66066001)(99286004)(7696005)(110136005)(81156014)(102836004)(81166006)(478600001)(54906003)(8936002)(316002)(8676002)(76176011)(6506007)(6246003)(476003)(966005)(486006)(5660300002)(76116006)(33656002)(66446008)(64756008)(2171002)(73956011)(66556008)(66476007)(66946007)(53936002)(14454004)(86362001)(68736007)(52536014)(4326008)(25786009)(71200400001)(71190400001)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3924;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NgAafUU9h7+iTES7NU8K82hVUXph3Ln8Byr3rdskx+lFCEIf7WQogi6Ega2SRgYGZEP5q8wpoWROVyQNQ6gZ7gB//wXWIfZZEBmvWKi0rOa3KMSohJYV0tW4sGsD90Go4aAjLNxY5X1ocz1ENccxJdB2c8UkFFz+8l1w82dhDshV0U9oCS1gtmYWKLsfKoi2jKySRhUjThwZB1XZA/a6LOAep0GKKfniaNwjSGJdgZjoKcZfKIoD/e+vinGyAyzljxYWJ9g6ZxkMG2qwz+fEg885bDyKqel/iLbOOZs8cmw51HAz33yokmi58S35q5PoAhxUP3kI89+TbkSW7/bv041+ngM9rRtkqCxsROKHNFldSY6pUc1ES4mvfZbbArvQOL8zyrbniXlPlywDcFFbtUsz3OVt1mIzYMRIg2I9xdc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4065dcc2-72a5-405b-85a5-08d6ed949e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 11:13:08.3860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3924
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph, Alan,
(add linux-usb ML on CC.)

> From: Yoshihiro Shimoda, Sent: Friday, June 7, 2019 9:00 PM
>=20
> Hi Christoph,
>=20
> I think we should continue to discuss on this email thread instead of the=
 fixed DMA-API.txt patch [1]
>=20
> [1]
> https://marc.info/?t=3D155989412200001&r=3D1&w=3D2
>=20
> > From: Yoshihiro Shimoda, Sent: Monday, June 3, 2019 3:42 PM
> >
> > Hi linux-block and iommu mailing lists,
> >
> > I have an issue that a USB SSD with xHCI on R-Car H3 causes "swiotlb is=
 full" like below.
> >
> >     [   36.745286] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 5=
24288 bytes), total 32768 (slots), used 1338
> (slots)
> >
> > I have investigated this issue by using git bisect, and then I found th=
e following commit:
> >
> > ---
> > commit 09324d32d2a0843e66652a087da6f77924358e62
> > Author: Christoph Hellwig <hch@lst.de>
> > Date:   Tue May 21 09:01:41 2019 +0200
> >
> >     block: force an unlimited segment size on queues with a virt bounda=
ry
> > ---
>=20
> Thank you for your comment on other email thread [2] like below:
> ---
> Turns out it isn't as simple as I thought, as there doesn't seem to
> be an easy way to get to the struct device used for DMA mapping
> from USB drivers.  I'll need to think a bit more how to handle that
> best.
> ---
>=20
> [2]
> https://marc.info/?l=3Dlinux-doc&m=3D155989651620473&w=3D2

I have another way to avoid the issue. But it doesn't seem that a good way =
though...
According to the commit that adding blk_queue_virt_boundary() [3],
this is needed for vhci_hcd as a workaround so that if we avoid to call it
on xhci-hcd driver, the issue disappeared. What do you think?
JFYI, I pasted a tentative patch in the end of email [4].

---
[3]
commit 747668dbc061b3e62bc1982767a3a1f9815fcf0e
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Mon Apr 15 13:19:25 2019 -0400

    usb-storage: Set virt_boundary_mask to avoid SG overflows
---
[4]
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.=
c
index 59190d8..277c6f7e 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -30,6 +30,8 @@
=20
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
=20
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -65,6 +67,7 @@ static const char* host_info(struct Scsi_Host *host)
 static int slave_alloc (struct scsi_device *sdev)
 {
 	struct us_data *us =3D host_to_us(sdev->host);
+	struct usb_hcd *hcd =3D bus_to_hcd(us->pusb_dev->bus);
 	int maxp;
=20
 	/*
@@ -80,8 +83,10 @@ static int slave_alloc (struct scsi_device *sdev)
 	 * Bulk maxpacket value.  Fortunately this value is always a
 	 * power of 2.  Inform the block layer about this requirement.
 	 */
-	maxp =3D usb_maxpacket(us->pusb_dev, us->recv_bulk_pipe, 0);
-	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
+	if (!strcmp(hcd->driver->description, "vhci_hcd")) {
+		maxp =3D usb_maxpacket(us->pusb_dev, us->recv_bulk_pipe, 0);
+		blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
+	}
=20
 	/*
 	 * Some host controllers may have alignment requirements.
---
Best regards,
Yoshihiro Shimoda

