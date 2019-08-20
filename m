Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02E62953BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 03:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbfHTBur (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Aug 2019 21:50:47 -0400
Received: from mail-eopbgr1410131.outbound.protection.outlook.com ([40.107.141.131]:33890
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728615AbfHTBuq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 21:50:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMN2fOe8L0LToDCs8HGFWIqeMyGWL4OffW5P44dLiFpPpgqhZ93dQc9NshNEa+NsvDcHobEsvusJWzcF+4TpyT4mr/sNAT8m2QTnB6AUwaiocrh0P3O0LaHbdt1f/BZ5FIpjQx3TLTVbgECPnWmS+6Q2mVGtQcfHcZ5cdtYY9ZoQ//01ZV3JPFmW4ealokAZTTugpgBUOR+HatyKBeaGqDRzazCWskKEpyoXRCbehwrQtg9yIx981yCQEtieyb1+AwecIulOLltIOxHbv9FCzDN8ttRT/MY4ScSmT1EKAQI3Pe6FCF9kn8Jp4lEztiUqcn05A0NlBCQivVMkmIiuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVxckdJMTPqdoC7iY2p6aIZ6vWGLg7FI+fcHx/E4U8M=;
 b=ZAbRQTey654TqavXAlLj7IN/A52EH4PHCT+g1CAbz/wCrOlrY0aVKHk0QdznfNzao2RjWN2kRkTA3tQSqeK1CLhkjwAu17G+WFpb06Zt/wY2zYkuRi86CXajKGmygHnlKDez24idKUICdeFvYLgL4Ds3HRzebzXaI77WQU2DO07VikN6pbF2ekOq+S2I/s/925i3qXgSLxXU3TZGAeVAtvcrWZNnDB6Sw7DfMRayS4lHMYNZ1n7q4nr6N3vNPt1PmKIfB6YKA8AD/orbJWPRwc/ITCYdxP5XsRPp/i8VSWXN9atQhhI1ugggiWiWLwqZ1qRXnzvlHU+CgOkAcIIABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVxckdJMTPqdoC7iY2p6aIZ6vWGLg7FI+fcHx/E4U8M=;
 b=n3qvq91zCjjC2bc3jVeo8u2FTqA04g6wOZlnipu0WJRPcrDp6Rt48hmuU80Wp0ubUH6nxnghYQOMKMX+eUNLFAbK7f87mcrzeObfKET6hfEu4atydvKVfdFyG8vPd+O733WIfzodggmsG4hBWkLHYJBXI5pUsdZJwF6YB6Y0INY=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5231.jpnprd01.prod.outlook.com (20.179.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 01:50:43 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 01:50:43 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Jens Axboe <axboe@kernel.dk>, Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "hch@lst.de" <hch@lst.de>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v9 3/5] block: sort headers on blk-setting.c
Thread-Topic: [PATCH v9 3/5] block: sort headers on blk-setting.c
Thread-Index: AQHVQ4yofFMPRBcpeUW9xg5SuKaKh6b+UJkAgARkGACAALaGAA==
Date:   Tue, 20 Aug 2019 01:50:43 +0000
Message-ID: <TYAPR01MB454435B8DB5ECFC1291C8037D8AB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1564129876-28261-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1564129876-28261-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190816195026.GC6886@kunai>
 <6ed6c62d-d773-71ec-382b-acd850e3dff1@kernel.dk>
In-Reply-To: <6ed6c62d-d773-71ec-382b-acd850e3dff1@kernel.dk>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e1f438e-5a83-4486-e54c-08d72510d010
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB5231;
x-ms-traffictypediagnostic: TYAPR01MB5231:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB52310F263CA877C35A5FA37AD8AB0@TYAPR01MB5231.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(199004)(189003)(8936002)(5660300002)(54906003)(99286004)(66066001)(186003)(7416002)(52536014)(110136005)(26005)(316002)(7736002)(11346002)(305945005)(476003)(74316002)(6506007)(102836004)(7696005)(446003)(81166006)(81156014)(8676002)(4744005)(486006)(76176011)(53546011)(9686003)(966005)(478600001)(3846002)(71200400001)(71190400001)(66946007)(76116006)(6306002)(14454004)(6116002)(55016002)(4326008)(86362001)(66476007)(66446008)(66556008)(53936002)(33656002)(6436002)(64756008)(6246003)(229853002)(14444005)(2906002)(25786009)(256004)(6606295002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5231;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ae8D1Z5scuDAlcMrYznVoorm+wWGA8KU0f2QmEmqR7elcQIi+0IH/ZhJP+Rot+FTfn0EhLVycma9dS5JHRBWYiRCfpB6PCSBj9Vey8uMFxkPDqEaSLifr9nhbAg/YKrOiFnY0B/S1Bw7dja4v/I7Fuj4q9/ICizK/zqDd76Nc0+X7w7EDzz2uiKZj9RXZKrDypg4nl5DqDHVSPU6lPEWlZqWGHDue2PGFMQleDatXRVdRK1mAHt6loK/zuavc9aZNG5kz1A353fz8NfTeL5lbk017MssWTj5DRqUwBW0hu8rwom3OubxTcFN+Jf5rkBKRxJXcLCGeEQ5LcOkcYUiTFpUOEF2wUO02DOxksfWYGSofdW57k+A/UJJmTjUyEVvWyFM6AIqgQx+IWFKCPbuzQgrTIGGXjmiVLbgc5+o7lE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1f438e-5a83-4486-e54c-08d72510d010
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 01:50:43.4958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/NbfKvsS5K+drkLeU+mk2vASrT5ywosMOBJVPncM0UB2pb9FbMlDN5+iMUpFsfd9qs0jWoy5GOOzCTKNj1kcxv21nkoIzN2br/v7UBbcBsXJ4A4p91XroZxdGv3fcEY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5231
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jens,

> From: Jens Axboe, Sent: Monday, August 19, 2019 11:54 PM
>=20
> On 8/16/19 1:50 PM, Wolfram Sang wrote:
> > On Fri, Jul 26, 2019 at 05:31:14PM +0900, Yoshihiro Shimoda wrote:
> >> This patch sorts the headers in alphabetic order to ease
> >> the maintenance for this part.
> >>
> >> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >> ---
> >
> > Jens, can we have your ack for this patch so Christoph can take this
> > series via his tree (also for patch 4/5)?
>=20
> Please just drop this patch.

I'm afraid, but would you also review the following patch?
https://marc.info/?l=3Dlinux-block&m=3D156412995120069&w=3D2
This patch 4/5 is a main patch of the block subsystem on this patch series.

Best regards,
Yoshihiro Shimoda

> --
> Jens Axboe

