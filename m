Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4535C4407D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 18:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731326AbfFMQGZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 12:06:25 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:64736
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731322AbfFMIqG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 04:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCASHWooroGpGB88P/55HprvkoGw9Jdskk7uBMe5QsI=;
 b=YJ80gz5kJhsysiR9Us1cUs3BaiKFbuthw1uPh5C/3c3t4yhec5p3ZPUz/zzwWakmgagz7WvGMK6vBBFj2jlk/QVNcqr4wMSPsnob+0JS6Qta6W3nqVF3R4+6KMVqcBj7Q+hXGI0AxHiRlDzWYyMKsIQ3uKiNb+5qzkyqn4zes1Y=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3252.jpnprd01.prod.outlook.com (52.134.247.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 08:46:00 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 08:46:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Topic: [PATCH] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Thread-Index: AQHVIaFtvT1x5o9i20+mWJmRsUTFuKaZMWgAgAAI15A=
Date:   Thu, 13 Jun 2019 08:46:00 +0000
Message-ID: <OSAPR01MB30899FBDA010F0465599437AD8EF0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190613073346.GB12093@lst.de>
In-Reply-To: <20190613073346.GB12093@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 061ba84f-71c8-42eb-4d94-08d6efdb8fb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3252;
x-ms-traffictypediagnostic: OSAPR01MB3252:
x-microsoft-antispam-prvs: <OSAPR01MB3252D136DA3572FB6D9905C7D8EF0@OSAPR01MB3252.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(376002)(366004)(396003)(346002)(189003)(199004)(256004)(7696005)(6436002)(99286004)(68736007)(76176011)(53936002)(9686003)(55016002)(25786009)(71200400001)(71190400001)(52536014)(5660300002)(229853002)(3846002)(14444005)(86362001)(6506007)(26005)(186003)(66066001)(102836004)(6116002)(2906002)(486006)(74316002)(81156014)(81166006)(8936002)(8676002)(6916009)(7736002)(66556008)(76116006)(11346002)(316002)(446003)(66476007)(64756008)(66446008)(66946007)(54906003)(476003)(73956011)(305945005)(478600001)(6246003)(14454004)(33656002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3252;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F3BwGACOaCiFhTOQsEieTsgtFBRXfjckkZX7bXejpi34oRtEs7u1pMG3xBnr5pQxUqKOIxHOAsX2R3RAa8gkX3u+70GB4S9ygCCINJ07ojiO6T65PVkRlXZk4ywKEa3p8vS2k5bjM1ltns6G+daY9lHlbcHHCZjjGszd67oynlxQhaq/CBo6r/LSXVY+dDWJPHL/dk8U3p623oqN+b8TFqDTQhrnyzvlPJVlSA/TCnXkcLwlacNk3O3wRKDnxVxT51MPZu55Nmi/Z0ABRlhkWV/WNwmNfH6giWSvs1Tb3GyWlY1fetyqCtWIsFrEABU+EK5hkYF8QgA5AVsSRPSC3jYR0iziol0Eed05cH0zF94F3e5u8sxLAiMnRHFDNkgDWR4WNXs3/RA31OOpdGTu3AJS5BEo1+VAajPh1LP19f8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061ba84f-71c8-42eb-4d94-08d6efdb8fb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 08:46:00.6648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3252
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Thursday, June 13, 2019 4:34 PM
>=20
> > +	if (max_sectors > 0) {
> > +		struct device *dev =3D us->pusb_dev->bus->sysdev;
> > +		size_t max_dma_sectors =3D dma_max_mapping_size(dev) >>
> > +					 SECTOR_SHIFT;
> > +
> > +		max_sectors =3D min_t(size_t, max_sectors, max_dma_sectors);
> > +		blk_queue_max_hw_sectors(sdev->request_queue, max_sectors);
>=20
> I think we need to do this unconditionally for the rare (or maybe even
> theoretical case) of a dma max mapping size smaller than the default
> max_sectos.
>=20
> So something like this:
>=20
> 	blk_queue_max_hw_sectors(sdev->request_queue,
> 		min_t(unsigned long,
> 			queue_max_hw_sectors(sdev->request_queue),
> 			dma_max_mapping_size(dev) >> SECTOR_SHIFT));

I believe this patch I sent has already covered it. What do you think?

For examples (all value units are "sectors"):
	default	mapping size	max_sectors
case 1	240	MAX		2048		--> we use 2048
case 2	240	512		2048		--> we use 512
case 3	240	128		2048		--> we use 128
case 4	240	128		64		--> we use 64

Best regards,
Yoshihiro Shimoda

