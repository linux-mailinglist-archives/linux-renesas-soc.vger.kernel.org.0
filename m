Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F59738994
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 14:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbfFGMAa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 08:00:30 -0400
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:28640
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728198AbfFGMAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 08:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgJjxGPF3aflVplaDhUW6m+b8snjq6SxM6U2ykK/hVQ=;
 b=bstIM1prPPMqOpJnT8cije/pktr9LDwHcrK1ltnYQ4Nh72bkX1/zCv+yfxPcukwUX2EMnsVR5eoHNWjfz3LedQfEtmDf/K4CePdq7XB/PIKdkeHDiz6Vo3E8GOJRwLj+fFqQT+4hE4Z8vYV+dgA26CYZDLIaZCmsI8Xmr+mKu4Y=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3137.jpnprd01.prod.outlook.com (52.134.249.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Fri, 7 Jun 2019 12:00:27 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 12:00:27 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: How to resolve an issue in swiotlb environment?
Thread-Topic: How to resolve an issue in swiotlb environment?
Thread-Index: AdUZ1Qlk800+Qz0uSuO63mIBeXkktQDUe+5A
Date:   Fri, 7 Jun 2019 12:00:26 +0000
Message-ID: <OSAPR01MB3089D50DBDAA6C7D427E72EED8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <OSAPR01MB3089B381AF2F687526E63EEAD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB3089B381AF2F687526E63EEAD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e698b241-5829-4c69-47a5-08d6eb3fbae7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3137;
x-ms-traffictypediagnostic: OSAPR01MB3137:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSAPR01MB3137F53DDDD2265A1BDE5088D8100@OSAPR01MB3137.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39860400002)(346002)(396003)(366004)(199004)(189003)(86362001)(64756008)(66446008)(256004)(14444005)(74316002)(3846002)(6116002)(305945005)(54906003)(66556008)(966005)(6306002)(9686003)(99286004)(66476007)(7696005)(76176011)(6436002)(52536014)(6916009)(55016002)(14454004)(76116006)(71190400001)(66946007)(71200400001)(73956011)(5660300002)(478600001)(2906002)(446003)(476003)(11346002)(33656002)(486006)(25786009)(6246003)(53936002)(316002)(102836004)(66066001)(6506007)(8676002)(81166006)(81156014)(186003)(68736007)(26005)(8936002)(4326008)(7736002)(229853002)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3137;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KIpIbwwl02p2uXWAPFK33wsti9umtO6nQPEoDrWcB8SG5cS2zeaWcgB2QkvF42H+07pe2zh8/hpJSzixQfh6gvuF5EQ6b96Iv3stcuDqR/LLsKk5jOx03ZKRKEmH47s8XT3WDU0ZgkbGDcvyRiQf0uKxn8dI2/aKAQp/4fDELTzV5D+f8/Pd+XGD6fkayPfl49m8mwTTK33yrxzpmBGh5CatTcMJJ/4k6IDnPwPYp/dXqC8xGEyxY8G3EAePXYxkE7wiRjxLUxrqicmBFe2DgcpYXTEPasIeD/DKRhfgXudFHf8qm4LAh0LEhA5TNr2HytQYttGNWQy6LtQw0xF+A4azWdVtaIlhJ9l4FuEYF+2bPqK8+AfYpvkb6q7gq//AK9qUkWEBvshiXgn11wi9MBfsoHl5W4iKt5Ur0jPH/9k=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e698b241-5829-4c69-47a5-08d6eb3fbae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 12:00:26.5753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3137
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

I think we should continue to discuss on this email thread instead of the f=
ixed DMA-API.txt patch [1]

[1]
https://marc.info/?t=3D155989412200001&r=3D1&w=3D2

> From: Yoshihiro Shimoda, Sent: Monday, June 3, 2019 3:42 PM
>=20
> Hi linux-block and iommu mailing lists,
>=20
> I have an issue that a USB SSD with xHCI on R-Car H3 causes "swiotlb is f=
ull" like below.
>=20
>     [   36.745286] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524=
288 bytes), total 32768 (slots), used 1338 (slots)
>=20
> I have investigated this issue by using git bisect, and then I found the =
following commit:
>=20
> ---
> commit 09324d32d2a0843e66652a087da6f77924358e62
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Tue May 21 09:01:41 2019 +0200
>=20
>     block: force an unlimited segment size on queues with a virt boundary
> ---

Thank you for your comment on other email thread [2] like below:
---
Turns out it isn't as simple as I thought, as there doesn't seem to
be an easy way to get to the struct device used for DMA mapping
from USB drivers.  I'll need to think a bit more how to handle that
best.
---

[2]
https://marc.info/?l=3Dlinux-doc&m=3D155989651620473&w=3D2

I'm not sure this is a correct way, but the issue disappears if I applied a=
 patch below
to USB storage driver. Especially, WARNING happened on blk_queue_max_segmen=
t_size().
Maybe we need to expand the argument "struct device *" of blk_queue_virt_bo=
undary() to
call dma_max_mapping_size()?
---
diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.=
c
index 59190d8..fa37b39 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -28,6 +28,7 @@
  * status of a command.
  */
=20
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
=20
@@ -83,6 +84,15 @@ static int slave_alloc (struct scsi_device *sdev)
 	maxp =3D usb_maxpacket(us->pusb_dev, us->recv_bulk_pipe, 0);
 	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
=20
+{
+	struct device *dev =3D us->pusb_dev->bus->controller;
+
+	dev_info(dev, "%s: size =3D %zu\n", __func__, dma_max_mapping_size(dev));
+	blk_queue_max_segment_size(sdev->request_queue,
+				   dma_max_mapping_size(dev));
+}
+
+
 	/*
 	 * Some host controllers may have alignment requirements.
 	 * We'll play it safe by requiring 512-byte alignment always.
---

Best regards,
Yoshihiro Shimoda

