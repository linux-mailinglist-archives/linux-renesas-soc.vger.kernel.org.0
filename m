Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90FDE1B506
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 13:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbfEMLeF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 07:34:05 -0400
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:12320
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727838AbfEMLeF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 07:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4y4Ip7zOXuqrS2Exm99mlZjKd8zdXkfmeRQJRcottyA=;
 b=e8Z4tW7pKl9wQphUFUG/3KQpenGbdzXxQmoDys8+THESHpPzpjmYGT5mKUnoIHo5smGIiN4m34T2NwJeRKk0o1mtMW4WjqItn/rHPoo2UKHn9mWlYii96IPXPfxqZoJjQyWPnIQESgbfhp7ZKeiRQJtyfu8dYi3QVqrdTnwUuoM=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2965.jpnprd01.prod.outlook.com (52.134.254.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 11:34:02 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:34:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if
 possible
Thread-Topic: [PATCH v2 2/2] mmc: renesas_sdhi: use multiple segments if
 possible
Thread-Index: AQHVCUUKmVh+8cTBr0GLk/9Xe/IGjKZowjMAgAAKVjCAAB+lcA==
Date:   Mon, 13 May 2019 11:34:02 +0000
Message-ID: <OSBPR01MB3174B39C9BE0A725D4945D78D80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1557721744-30545-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1557721744-30545-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190513090054.GA15744@kunai>
 <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB3174B96296BFFA408F1C901FD80F0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 069484d9-2ec0-4b19-ec94-08d6d796e64a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2965;
x-ms-traffictypediagnostic: OSBPR01MB2965:
x-microsoft-antispam-prvs: <OSBPR01MB2965533901E522D1357F999AD80F0@OSBPR01MB2965.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(39860400002)(366004)(376002)(52314003)(199004)(189003)(486006)(66066001)(54906003)(11346002)(446003)(71190400001)(71200400001)(8676002)(81166006)(76116006)(316002)(8936002)(66476007)(73956011)(66946007)(66556008)(64756008)(66446008)(74316002)(81156014)(3846002)(2906002)(186003)(305945005)(6116002)(33656002)(2940100002)(256004)(26005)(14444005)(7736002)(6916009)(476003)(55016002)(99286004)(7696005)(76176011)(9686003)(25786009)(14454004)(6246003)(102836004)(6436002)(53936002)(5660300002)(86362001)(229853002)(478600001)(68736007)(6506007)(52536014)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2965;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hw7lUaam/f/t9O47kK9r62zKspIzBo6KFEx+7cpfBheZGy4YsGcWoedK5b/zHef0TZ1tQHvlzd5IFdU1E4L0VQ/qBgMw67j2Pk6kj3CD7Z5zyhAw8txV7WEOGrf7ujLSWMqzPD3stJljqk1VlLmiKQ/ttDNMjpZ2M4oafUR20br7E5zqHsL3sAPnTpE5l4KrghTg00eEiM5tQ0boi14XcT/jH67+RD5gqzG4/9+KIelHzp2w/+UtITUmk4ZZ9Oj7FrbEiOoHz2paisNMQXXNizbWPVYCfMVbD9/kq6ygt3z6rEMCQ9Oj6e53Kjv9sDQ+u4UFwK5CB3Ho5hw2m+Ejk1piMzJRr7LMZcHy39Fhii7Fjg7LqWOmPR7b7hH7xW/6YyIPgKH89WQUqnP5BjEb7uGGSyXOYvU7cupDotXKTD4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069484d9-2ec0-4b19-ec94-08d6d796e64a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:34:02.7040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2965
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Yoshihiro Shimoda, Sent: Monday, May 13, 2019 6:46 PM
<snip>
> > That also means, for the sys-dmac and Gen2, we then use 512 for the
> > IOMMU case and 32 (default TMIO value) for the non IOMMU case. My
> > understanding is that SYS DMAC can handle 512 in both cases. Maybe it
> > makes sense then to make an incremental patch setting the max_segs valu=
e
> > explicitly to 512 in the sys-dmac driver for Gen2?
>=20
> I also think SYS DMAC can handle 512 segments. However, I'm not sure
> it can improve the performance or not though. Anyway, an incremental patc=
h
> makes sense if needed, I think.

I measured the performance on R-Car H2 Lager. It seems 512 segments improve
the sequential input to 5%. May I make an incremental patch on the patch se=
ries?
What do you think?

Best regards,
Yoshihiro Shimoda

--
kernel v5.1-rc7 + local patches + sdr104,,,,,,,,,,,,,,,,,,,,,,,,,,
Buildroot 2019.02.1,,,,,,,,,,,,,,,,,,,,,,,,,,
Bonnie++ 1.03e : bonnie\+\+ -d ./ -s 2048 -r 1024 -b -u root,,,,,,,,,,,,,,,=
,,,,,,,,,,,
,,,,,,,,,,,,,,,,,,,,,,,,,,
environment,Size,Sequential Output - per char (K/sec),<- (CPU %),Sequential=
 Output - block (K/sec),<- (CPU %),Sequential Output - rewrite (K/sec),<- (=
CPU %),Sequential Input - per char (K/sec),<- (CPU %),Sequential Input ? bl=
ock (K/sec),<- (CPU %),Random seeks,<- (CPU %),files,Sequential Create,<- (=
CPU %),Sequential Read,<- (CPU %),Sequential Delete,<- (CPU %),Random Creat=
e,<- (CPU %),Random Read,<- (CPU %),Random Delete,<- (CPU %)
max_segs_32_sys_dmac,2G,19651,45,18122,7,11612,5,31417,56,34344,6,20.9,0,16=
,183,1,+++++,+++,195,1,198,2,+++++,+++,195,2
max_segs_512_sys_dmac,2G,18728,43,18273,8,12405,5,33524,61,34158,6,21.0,0,1=
6,184,1,+++++,+++,189,1,198,2,+++++,+++,194,2

