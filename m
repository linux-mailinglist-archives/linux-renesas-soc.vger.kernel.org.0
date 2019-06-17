Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C292E478FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 06:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbfFQERr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 00:17:47 -0400
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:59644
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbfFQERq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 00:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmkixwRvjDS7rGX301COiJH0uUpjqnSTmo128qV9Lvg=;
 b=riHkILYrchef9PUczfUprqjdWmPDkyEdfM6sMCPhWUpEr+EIoXJAmKv4s/gsl7b3avwXiR/uNMzNbh72I2LkbOS0+JkJiP+BslQqp0npUmWqTSWeDmVnGeRxQjtyHAoPMAtuGzmaM9+oO4eRSKZOkmH12RU4oe5/eP+/GcNhOMI=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB4487.jpnprd01.prod.outlook.com (20.179.184.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Mon, 17 Jun 2019 04:17:43 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 04:17:43 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Topic: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Index: AQHVIcuW138W6xs/SU+mBATKJYat56aZ0SQAgAABRQCAAAL1gIAFZkqg
Date:   Mon, 17 Jun 2019 04:17:43 +0000
Message-ID: <OSBPR01MB359051D6F83101432E0F2549D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <20190613171112.GA22155@lst.de>
 <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2cf138f-69ff-4fc6-2f40-08d6f2dabeed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4487;
x-ms-traffictypediagnostic: OSBPR01MB4487:
x-microsoft-antispam-prvs: <OSBPR01MB4487C41E39307542DA438F99D8EB0@OSBPR01MB4487.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39860400002)(346002)(396003)(376002)(199004)(189003)(305945005)(26005)(2906002)(54906003)(86362001)(5660300002)(186003)(102836004)(6436002)(7696005)(74316002)(316002)(14454004)(14444005)(6916009)(76176011)(7736002)(33656002)(68736007)(478600001)(53936002)(71200400001)(4326008)(71190400001)(66066001)(256004)(229853002)(99286004)(55016002)(9686003)(476003)(52536014)(6506007)(11346002)(76116006)(25786009)(6116002)(486006)(8676002)(3846002)(2171002)(446003)(6246003)(66476007)(73956011)(64756008)(66556008)(81166006)(81156014)(66446008)(8936002)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4487;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NxPmAC6mKVImNsoqBh7b4Li1dj6WA4Ordh2n+1oqYEYxsD7dL5pSj3uyxnjXmMN+rx7VPxv6j+LQBOOHaXseaujM9h4KxzLLtgCuK2yVVnDAryYq3MXrOad+X2eKQG60MO288KkOB1dd0sCxujcfiaHcnlx4ui1URHdDNIHSW6T/QlQga9FhaIgquChSA+0Aa6qVsrz/3y0qZr13Rot62gHH3+a8eXWwtCaHM3A8gUV+HzlhLCFcf3Yp+V9FAuoGne+lutqHCKzRYUyzT7UL0wVdw9AnnF+05sFFQq9XRGhEheFx96ofqQRFlhjSlALiA+yuNdy+voDOsf6JyFEL6vcHQIcF1zhAoiNFwGGeS5aXGa8mQw7cktOSStkxTPh6DNZkn6qrsZrbwbY+0XUR1b+TlmH/yb+CGDaogaeJH4A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cf138f-69ff-4fc6-2f40-08d6f2dabeed
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 04:17:43.7342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4487
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Friday, June 14, 2019 2:22 AM
>=20
> On Thu, 13 Jun 2019, Christoph Hellwig wrote:
>=20
> > On Thu, Jun 13, 2019 at 01:06:40PM -0400, Alan Stern wrote:
> > > Hmmm.  Would it be easier instead to copy the DMA mapping parameters
> > > from us->pusb_dev->bus->sysdev into the SCSI host's parent before
> > > calling scsi_add_host()?  That way the correct values would be
> > > available from the beginning, so the existing DMA setup would
> > > automatically use the correct sizes.
> >
> > It would in theory.  But at usb-storage has a special max_sectors quirk
> > for tape devices, and as the device type is a per-LU property we'd
> > still have to override it in ->slave_configure.
>=20
> Not just for tape devices.  But that's okay; those max_sectors
> overrides have been present for a long time and we can keep them.
> Getting rid of the virt_boundary_mask stuff would still be a big
> improvement.

Thank you for the comments. So, should I wait for getting rid of the
virt_boundary_mask stuff? If I revise the commit log of this patch,
is it acceptable for v5.2-stable as a workaround? In other words,
I worry about this issue exists on v5.2-stable.

Best regards,
Yoshihiro Shimoda

> Alan Stern

