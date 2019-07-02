Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F0C5CD51
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 12:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfGBKHp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 06:07:45 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:55589
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725835AbfGBKHp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 06:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVScTzklIbcld/D3JN0jH69Ly/BX8fx4iBi1HtTtXxg=;
 b=YoIdHenUpMkJGLrNh92TVV7yoXojB7fMjgQsqrusg5SgcIwiMyK2BAZceFkWi8Hzj0MqdpFNU8bcHFHC3Xuo6/EnV0PdTtfagDO0VNdxE6nHUc7Bcz5uZ1TGHw9idyqZVOjLwVOwCXl66N4qZLGq06cVRxGk43q58nypEfsH5Rg=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.174.85) by
 TYAPR01MB4477.jpnprd01.prod.outlook.com (20.179.174.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 10:07:42 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::602d:62cc:de62:eaba]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::602d:62cc:de62:eaba%6]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 10:07:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>, shuah <shuah@kernel.org>,
        Suwan Kim <suwan.kim027@gmail.com>
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
Thread-Index: AQHVIcuW138W6xs/SU+mBATKJYat56aZ0SQAgAABRQCAAAL1gIAFZkqggAAqzACAF8/kEA==
Date:   Tue, 2 Jul 2019 10:07:42 +0000
Message-ID: <TYAPR01MB454412603157D6DDCB512092D8F80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190613171112.GA22155@lst.de>
 <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org>
 <OSBPR01MB359051D6F83101432E0F2549D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20190617062222.GA5069@lst.de>
In-Reply-To: <20190617062222.GA5069@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2df9c2d-e54c-4ad3-1df2-08d6fed51f77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4477;
x-ms-traffictypediagnostic: TYAPR01MB4477:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB4477CA5EED4F8BFA7F65C64ED8F80@TYAPR01MB4477.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(199004)(189003)(2906002)(66946007)(76116006)(73956011)(102836004)(7696005)(74316002)(99286004)(81156014)(8676002)(6116002)(71200400001)(71190400001)(305945005)(7736002)(54906003)(8936002)(486006)(66476007)(66556008)(64756008)(14454004)(52536014)(5660300002)(256004)(86362001)(476003)(53936002)(14444005)(966005)(186003)(6506007)(316002)(110136005)(81166006)(11346002)(6436002)(3846002)(446003)(2171002)(478600001)(76176011)(229853002)(6246003)(9686003)(68736007)(26005)(66066001)(25786009)(33656002)(55016002)(4326008)(6306002)(66446008)(4744005)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4477;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gDi1d+37W/+Kj6oOahfpxj97F4zn5H9LQikGOLpJ3kXeqQqlZ+HhZ2KHP4g//S7bw53mjpS541U2JfhtYkXgEO21PvS9B/1kga7U8hgnvPxOu1+hPU21vTLG6Ok+v9Ad4OGj5fmYrO7TTWNrn90OiTX+jU27hXYQx0B29oWIADHdL8nvVknpbA9Ia0/xIOSo0Mnptj7DDx7miwcJelwA9bA2/ArLReI+TM3kyVz1l332aajK7c0ejNm4K2E7OpDReKzIpWMaLVqg8E2MI6Eg8wwdz2Js1r65sMB51aBQ5PG3DceGir6GeHC2EhoXNk63CY22chJFaI+YwK7oN3lnfo59fNUHdTHh0gMZxzpAD584t3MmVnW/o/98H4hAiZfoKSfbK912AfNCZURJX6QHTnKhf7uUPQH/ChSHlsjWdgM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2df9c2d-e54c-4ad3-1df2-08d6fed51f77
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 10:07:42.7663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4477
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan, shuah, Suwan,

> From: Christoph Hellwig, Sent: Monday, June 17, 2019 3:22 PM
>=20
> On Mon, Jun 17, 2019 at 04:17:43AM +0000, Yoshihiro Shimoda wrote:
> > Thank you for the comments. So, should I wait for getting rid of the
> > virt_boundary_mask stuff? If I revise the commit log of this patch,
> > is it acceptable for v5.2-stable as a workaround? In other words,
> > I worry about this issue exists on v5.2-stable.
>=20
> It does exist on 5.2-stable and we should fix it.  I'll plan to resend
> my series to fix the virt_boundary issues for the other SCSI driver
> soon, but we'll still need to sort out usb-storage.

I guess that getting rid of the virt_boundary_mask stuff [1] needs more tim=
e.
So, for v5.2-stable, would you accept my patch as a workaround?
JFYI, v5.2-rc7 still has this "swiotlb buffer is full" issue.

[1]
https://marc.info/?l=3Dlinux-kernel&m=3D156114524808042&w=3D2

Best regards,
Yoshihiro Shimoda

