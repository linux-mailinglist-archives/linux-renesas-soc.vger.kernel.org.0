Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A7541FBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 10:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407639AbfFLIw3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 04:52:29 -0400
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:39712
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2407156AbfFLIw3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 04:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVU3TwliIUydOjf7eBK/rzzSlo+vO4nnsIRH7FR5glg=;
 b=M7Kk7vsJgnrQfog7CheWKVMZJXy9HDzwItO6QtULvXg5tX8hUQrvwFvDhDbbdxbf1q7Ck5Q9je6Ggpw58eG76tBGggQE+YJA5id9uYLjbtWxnwp63nEYWuXPes1V0zwFz35Js0bkGPr3XV98n8InnjskramkmVe3vDH0iCK3VfE=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB4020.jpnprd01.prod.outlook.com (20.178.102.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 08:52:21 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 08:52:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: How to resolve an issue in swiotlb environment?
Thread-Topic: How to resolve an issue in swiotlb environment?
Thread-Index: AdUZ1Qlk800+Qz0uSuO63mIBeXkktQDUe+5AAJUL5SAAA1kYAAANEESAABj9hAAAERZjAAAi6naAAAJz/+A=
Date:   Wed, 12 Jun 2019 08:52:21 +0000
Message-ID: <OSAPR01MB3089D154C6DF0237003CE80CD8EC0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <20190611064158.GA20601@lst.de>
 <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
 <20190612073059.GA20086@lst.de>
In-Reply-To: <20190612073059.GA20086@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67300a03-2f72-4bb6-ad94-08d6ef134889
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB4020;
x-ms-traffictypediagnostic: OSAPR01MB4020:
x-microsoft-antispam-prvs: <OSAPR01MB4020F8EB0D2011C0BDBBE918D8EC0@OSAPR01MB4020.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(346002)(39850400004)(376002)(199004)(189003)(86362001)(2906002)(33656002)(81156014)(54906003)(110136005)(14454004)(316002)(486006)(8936002)(7736002)(52536014)(25786009)(6436002)(66946007)(74316002)(5660300002)(11346002)(446003)(68736007)(476003)(81166006)(3846002)(6116002)(66446008)(102836004)(66556008)(64756008)(305945005)(186003)(76116006)(53936002)(71200400001)(66476007)(9686003)(66066001)(7696005)(76176011)(478600001)(55016002)(6506007)(71190400001)(73956011)(99286004)(14444005)(4326008)(8676002)(6246003)(229853002)(256004)(2171002)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4020;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nlsIq6Rvrrb0DfdoeWgYMN9FU9PWqxR/6GV2UdcnxwPv+UQl7s70W1qDb05kU76uuOTG8WJ83DyHCIuuTKyRNIgxtDcl4VOOCV0K+aOXOsar2MXspYV3CE3DWs8Lm8EJq1xfiZrYLZX68VJ5FaiHjtsL15UirI821e/L+Krw1tQgxU3kBEK6NXJjnVJq9pxZ6Q91pYkFnUXtqGsqqmWIGjlpH/RSHxzzjdhzvmhpDnu20jjftf6JS/x0s8tnOPyd2tkPeaSCXdrXCSPOH4aDDGRZBKrDYsy7qDGeie6m0P3kYh1sR1kcuzxIkY4m6frKMdWcQrRNWNAt7O5i1p3SfFgXpjUk4153+snWmSus3kBs6Lb+28zPC+fq9E6sJaUOO4cM0KGWxgcoryUZ3/SajMpMyzEUjiAhG4ev9HOs8R0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67300a03-2f72-4bb6-ad94-08d6ef134889
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 08:52:21.7764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4020
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Wednesday, June 12, 2019 4:31 PM
>=20
> First things first:
>=20
> Yoshihiro, can you try this git branch?  The new bits are just the three
> patches at the end, but they sit on top of a few patches already sent
> out to the list, so a branch is probably either:
>=20
>    git://git.infradead.org/users/hch/misc.git scsi-virt-boundary-fixes

Thank you for the patches!
Unfortunately, the three patches could not resolve this issue.
However, it's a hint to me, and then I found the root cause:
 - slave_configure() in drivers/usb/storage/scsiglue.c calls
   blk_queue_max_hw_sectors() with 2048 sectors (1 MiB) when USB_SPEED_SUPE=
R or more.
 -- So that, even if your patches (also I fixed it a little [1]) could not =
resolve
    the issue because the max_sectors is overwritten by above code.

So, I think we should fix the slave_configure() by using dma_max_mapping_si=
ze().
What do you think? If so, I can make such a patch.

[1]
In the "scsi: take the DMA max mapping size into account" patch,
+       shost->max_sectors =3D min_t(unsigned int, shost->max_sectors,
+                       dma_max_mapping_size(dev) << SECTOR_SHIFT);

it should be:
+                       dma_max_mapping_size(dev) >> SECTOR_SHIFT);

But, if we fix the slave_configure(), we don't need this patch, IIUC.

Best regards,
Yoshihiro Shimoda

