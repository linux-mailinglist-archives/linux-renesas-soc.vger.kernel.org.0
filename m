Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBFA43ED1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731621AbfFMPxP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:53:15 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:7647
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731620AbfFMJDr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 05:03:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAY2bLVCaJwEhGCGpQ1wTEnD/jvTHS3JmrGyHZ07RS4=;
 b=eR2oxwBNY8usOcEPz5R5g6WtAfUJNk/3hLNabEqSc8f+tkHqhKTmVBdflGNlRqdFfOF2sq/vWdH11U8+WinGpLrZns92ovZZZXVZQuiIbggae7wP5LAr575cPjUJznxOSPXj3wBgdvjChSNCpyqgbAYPBQZIEpvT4M0I0LVUmmw=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB3636.jpnprd01.prod.outlook.com (20.178.102.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 09:03:43 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 09:03:43 +0000
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
Thread-Index: AQHVIaFtvT1x5o9i20+mWJmRsUTFuKaZMWgAgAAI15CAAAzWgIAAAfaA
Date:   Thu, 13 Jun 2019 09:03:43 +0000
Message-ID: <OSAPR01MB308976F808F8588C4B49BF54D8EF0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190613073346.GB12093@lst.de>
 <OSAPR01MB30899FBDA010F0465599437AD8EF0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
 <20190613085121.GA13442@lst.de>
In-Reply-To: <20190613085121.GA13442@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 653f06d1-9ac6-4292-2b79-08d6efde0940
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3636;
x-ms-traffictypediagnostic: OSAPR01MB3636:
x-microsoft-antispam-prvs: <OSAPR01MB3636942CFB0E899A850B5539D8EF0@OSAPR01MB3636.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(396003)(136003)(366004)(39860400002)(189003)(199004)(186003)(5660300002)(6506007)(52536014)(256004)(4744005)(66476007)(66556008)(64756008)(99286004)(55016002)(66446008)(102836004)(71190400001)(71200400001)(11346002)(66946007)(53936002)(25786009)(26005)(9686003)(6916009)(66066001)(73956011)(76176011)(76116006)(7696005)(446003)(6436002)(6116002)(54906003)(486006)(6246003)(478600001)(229853002)(476003)(14454004)(74316002)(4326008)(3846002)(305945005)(33656002)(68736007)(81166006)(86362001)(81156014)(8676002)(8936002)(7736002)(2906002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3636;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yp2SH5Z8oeVDeXdIwLVK5Rx4sDwzZ3e7jm6wuXqftnxTYoQVxFNIgSPGtiObmKeJBjnsfHU5Cy9dQItQL1tYlksygOUohwEOh0VmMPp/q1DcYc2OswKzD1O3XRoitdz7jPaZTBBRqDf2/cb7Vr/72qWKtnmyhyylmNqSMlzf7c8veEtdHGsk8q71XtcOEmmmXhTLQqEXJBdVBlv1Dw+V6uUylnmBtbdfM6W2UEaH4YOAIynpudaYOkN3TqkrAPHg1YsNCHOJK325zUFa0a4T9EMWnknL8gkp3gdM7CtncMTDp1x9tb5h8WfUtpzzAroT3ZVwdc+ZzgiTsEkFsDOEnAr7UMCuTLRmhpNtz6CpB6hqq2A3lfkwhWoHQbyu+8+J0SH6f9taGONCbXkJGhbhpivpP/5dL7B56Tkm/YxKIe0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653f06d1-9ac6-4292-2b79-08d6efde0940
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 09:03:43.5343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3636
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

> From: Christoph Hellwig, Sent: Thursday, June 13, 2019 5:51 PM
>=20
> On Thu, Jun 13, 2019 at 08:46:00AM +0000, Yoshihiro Shimoda wrote:
> > I believe this patch I sent has already covered it. What do you think?
> >
> > For examples (all value units are "sectors"):
> > 	default	mapping size	max_sectors
> > case 1	240	MAX		2048		--> we use 2048
> > case 2	240	512		2048		--> we use 512
> > case 3	240	128		2048		--> we use 128
> > case 4	240	128		64		--> we use 64
>=20
> Yes, I guess your version is fine after all:
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thank you for your review!

> although I think it might be simpler to just read the value back
> from the queue in the end.

Ah, now I understand why you suggest it.
I agree with you. This patch changed 23 lines. But, it will change a few li=
nes only.
So, I'll make such a patch.

Best regards,
Yoshihiro Shimoda

