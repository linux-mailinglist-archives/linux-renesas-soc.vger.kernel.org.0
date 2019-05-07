Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF11015DF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 09:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfEGHOD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 03:14:03 -0400
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:21568
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726297AbfEGHOD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 03:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y0B6I+EcaWgsjf0X1gTJNDIF3DhSHmm7JF6PMubLSg=;
 b=VhRASuAfnOdBDRSUl9e067+P+YXGYruE1LiVvbrmKtWqNG46rAafA74Cu6e2nUvIJWQ/kvm9OC5E+EryZgLnJv6p206UtUOwCee32bKt/BozBYHexF2FrhtOgg6NHwHV6SR5jUjD6xJ47o+3WMfGVhrKXhCPFTRi059IYsWWBbY=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2839.jpnprd01.prod.outlook.com (52.134.254.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Tue, 7 May 2019 07:13:59 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 07:13:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] mmc: tmio: No memory size limitation if runs on IOMMU
Thread-Topic: [PATCH 2/3] mmc: tmio: No memory size limitation if runs on
 IOMMU
Thread-Index: AQHU+/Ajsc2lg6egpUGhyifMMTlpw6ZOFvCAgAAS74CAESUYsA==
Date:   Tue, 7 May 2019 07:13:59 +0000
Message-ID: <OSBPR01MB3174418E8016F4DC6BDB9C1FD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1556255930-18188-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <39b57554-db27-6b8a-261d-b8097c239e38@cogentembedded.com>
 <20190426091731.GB1031@kunai>
In-Reply-To: <20190426091731.GB1031@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdc77f41-1661-425d-2935-08d6d2bb93c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2839;
x-ms-traffictypediagnostic: OSBPR01MB2839:
x-microsoft-antispam-prvs: <OSBPR01MB2839346B851722F3C9C3FD5ED8310@OSBPR01MB2839.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(39860400002)(136003)(396003)(199004)(189003)(6506007)(14454004)(305945005)(102836004)(6436002)(6116002)(11346002)(446003)(6246003)(8936002)(4326008)(74316002)(8676002)(68736007)(3846002)(81156014)(81166006)(7696005)(99286004)(25786009)(186003)(256004)(26005)(2906002)(86362001)(7736002)(229853002)(52536014)(71200400001)(76176011)(55016002)(71190400001)(476003)(9686003)(53936002)(486006)(316002)(33656002)(73956011)(66446008)(76116006)(66946007)(110136005)(54906003)(64756008)(66476007)(66066001)(5660300002)(66556008)(478600001)(4744005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2839;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xJ0+9LMGqEOmpVWfKRrK5yaVWG3fl2NUInfPJMPF9rHWG3+5Z6inujUfw6Z8vQy9BtXFJ3Myv0/pidy+9Oe6G+EyZKSchRw5kRP+kQ0ITwfI2pH62DdRXYs3B2cr9DRC3fD+Ukrta99rcc2FS4/+zydUUC1SDC129QuCeqBzmpIS36VuefsMOc88SiM37DsS9RYa4Iz4E/SO/LNcNDyc/eD39ljyabmOxQjSCuXmQgcc4W8XY3kAr5bk6oyEq9RoUPEHz3wWhBQM8CdcQOEuW64dkMjH+HfW2nRugMOuWeu5yXNB8h6raQhjgOA6r+oZoRywssOU76usOMpvseR78Bqic91EN/HCKfXrNdMLuUkr6Qqylwh15IimMwrDIhwJaLqyCf9mCm37yYq4xKjCKHL87rWGm4Co6s6gPeftK6Q=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc77f41-1661-425d-2935-08d6d2bb93c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 07:13:59.7024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2839
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei-san, Wolfram-san,

Thank you for your review and sorry for the delayed response...

> From: Wolfram Sang, Sent: Friday, April 26, 2019 6:18 PM
>=20
> > > This patch adds a condition to avoid memory size limitaion of
> >
> >    Limitation.
>=20
> "limitation" :) And maybe "a memory size limitation"?

I think so. I'll fix it on v2 patch.

> > > +	 * the max_req_size if needed as a workaround. However, if the driv=
er
> > > +	 * runs on IOMMU, this workaround doesn't need.
> >
> >    Isn't needed, maybe?
>=20
> Ack, "isn't needed".

I'll fix it.

> Patch itself looks good to me.

Thank you for your comment!

Best regards,
Yoshihiro Shimoda

