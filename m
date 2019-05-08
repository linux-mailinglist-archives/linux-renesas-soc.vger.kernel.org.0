Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F7817018
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 06:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbfEHE3B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 00:29:01 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:61965
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727101AbfEHE3B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 00:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko2AKGGOG9D0ni2xZWcFmBYl1MCic3uoNubQwzxd02M=;
 b=Waxcx4t5y4fPdtLz1mi5y2zajaIlqKXhu3spZjqjyzKd0/gjq+Y2V0xN3Op5JPwYMyvuN1jLamMZ1yK+ITyMSXKdVEboGbwk3H4KYrGTSE/AWHOEoWn55esPWvSlmOgxrCT4Mb1+Nf/NJKKZaTP/cIkv9L+Q34oUlnh0BY2rnwQ=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2983.jpnprd01.prod.outlook.com (52.134.253.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 8 May 2019 04:28:57 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 04:28:57 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] mmc: renesas_sdhi_internal_dmac: improve performance
 by using IOMMU
Thread-Topic: [PATCH 0/3] mmc: renesas_sdhi_internal_dmac: improve performance
 by using IOMMU
Thread-Index: AQHU+/AkeRAaf76f8Ei+7P3pmBCRuaZOMeKAgBEqOVCAAVgkgA==
Date:   Wed, 8 May 2019 04:28:57 +0000
Message-ID: <OSBPR01MB31743C226BA9BA1D87921346D8320@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190426094611.GD1031@kunai>
 <OSBPR01MB3174BFC6487E29AF4EA5E150D8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174BFC6487E29AF4EA5E150D8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c2cb8bd-d779-4c49-c100-08d6d36db01e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2983;
x-ms-traffictypediagnostic: OSBPR01MB2983:
x-microsoft-antispam-prvs: <OSBPR01MB298392C8AA40647DBC54BFBED8320@OSBPR01MB2983.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(346002)(39860400002)(376002)(136003)(189003)(199004)(7736002)(14444005)(6916009)(76176011)(7696005)(4326008)(256004)(68736007)(2906002)(8676002)(52536014)(81166006)(81156014)(6116002)(71190400001)(71200400001)(64756008)(66556008)(66476007)(66946007)(74316002)(5660300002)(66446008)(3846002)(73956011)(8936002)(76116006)(66066001)(55016002)(9686003)(33656002)(6436002)(229853002)(53936002)(305945005)(86362001)(99286004)(54906003)(102836004)(26005)(316002)(6246003)(25786009)(478600001)(14454004)(11346002)(486006)(6506007)(476003)(446003)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2983;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w5NqoCkPk4vScEzbHHQq5gBFR59CO6u/s+dTK/mvypdOV7b+hDWTdwMTuaRq1ZHseVOY0W+ZfV6sDQwyjdaBvAkaibfBHSu7KOfvMtF7WtBrKzjkRv21hwOyg9HaJ1gkhai1uoGkkCFga5y66KNR1GUfhxVQdy5htX97lAIYLsD1KGChvKlna2yoXn8pakrEqwork0NQVIPnhsKpIX7gZqVfgqUS57D0kMiYZ+b/voLf1agwUKSe80ynSa+/L8Mab4XVfbzOKceeKjn4lGUKfTo4dWlOH+nRR0cN9ctaSJ3kXxZjpy7zm0oxARD8EvruXCOjkNDubG6/i/IPG+++Sxs4oJI8jkAz9CHsVE7zxxGZbelugv6RG8t7z/nSbxtTCpj/V8kzVHhEg+1ciSyCZYRQ3DRP4POgkh7DBJJPbds=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2cb8bd-d779-4c49-c100-08d6d36db01e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 04:28:57.6913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2983
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san again,

> From: Yoshihiro Shimoda, Sent: Tuesday, May 7, 2019 5:59 PM
>=20
> Hi Wolfram-san,
>=20
> > From: Wolfram Sang, Sent: Friday, April 26, 2019 6:46 PM
> >
> > Hi Shimoda-san,
> >
> > thanks for working on this!
> >
> > > Please refer to the end of this email about the performance.
> >
> > Yes, nice improvements, great!
>=20
> Thanks!
>=20
> > > (I beleive if the performance is improved, the CPU load is also incre=
ased.)
> >
> > I do wonder about this a bit, though. IPMMU and DMA shouldn't be that
> > much expensive for the CPU, or? Am I overlooking something?
>=20
> I'm guessing that a user land app (in this case bonnie++) consumes CPU lo=
ad for some reason.
> I'll experiment whether my guess is correct or not by using usb 3.0 host =
like below tomorrow:
>  - case 1: usb 3.0 host + usb SSD as SuperSpeed (IOMMU is disabled).
>  - case 2: usb 3.0 host + usb SSD via a usb2.0 hub as high-speed (IOMMU i=
s disabled).

I have measured them + IOMMU enabled environment. It seems my guess is corr=
ect.

  - case 1: usb 3.0 host + usb SSD as SuperSpeed (IOMMU is disabled).
  - case 2: usb 3.0 host + usb SSD via a usb2.0 hub as high-speed (IOMMU is=
 disabled).
  - case 3: usb 3.0 host + usb SSD as SuperSpeed (IOMMU is enabled).
  - case 4: usb 3.0 host + usb SSD via a usb2.0 hub as high-speed (IOMMU is=
 enabled).

---
kernel v5.1-rc7 + local patches + USB SSD ext4 format,,,,,,,,,,,,,,,,,,,,,,=
,,,,
Buildroot 2019.02.1,,,,,,,,,,,,,,,,,,,,,,,,,,
Bonnie++ 1.03e : bonnie\+\+ -d ./ -s 8192 -r 4096 -b -u root,,,,,,,,,,,,,,,=
,,,,,,,,,,,
,,,,,,,,,,,,,,,,,,,,,,,,,,
environment,Size,Sequential Output - per char (K/sec),<- (CPU %),Sequential=
 Output - block (K/sec),<- (CPU %),Sequential Output - rewrite (K/sec),<- (=
CPU %),Sequential Input - per char (K/sec),<- (CPU %),Sequential Input ? bl=
ock (K/sec),<- (CPU %),Random seeks,<- (CPU %),files,Sequential Create,<- (=
CPU %),Sequential Read,<- (CPU %),Sequential Delete,<- (CPU %),Random Creat=
e,<- (CPU %),Random Read,<- (CPU %),Random Delete,<- (CPU %)
H3_SuperSpeed_No_IOMMU,8G,82598,99,242161,58,102489,25,73719,98,254089,32,2=
133.3,6,16,382,2,+++++,+++,385,1,380,1,+++++,+++,387,2
H3_HighSpeed_No_IOMMU,8G,41971,53,39983,9,16459,4,37900,51,37833,5,1585.7,5=
,16,304,1,+++++,+++,295,1,302,1,+++++,+++,294,1
H3_SuperSpeed_IOMMU,8G,66139,99,276686,65,132297,33,69732,99,293396,37,2099=
.2,7,16,389,2,+++++,+++,391,1,382,1,+++++,+++,391,2
H3_HighSpeed_IOMMU,8G,43191,50,40446,9,17432,4,38541,51,38481,5,1619.4,4,16=
,302,1,+++++,+++,296,1,303,1,+++++,+++,294,1
---

Best regards,
Yoshihiro Shimoda

