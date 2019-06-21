Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9144C4E36D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfFUJXv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:23:51 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.4]:16095 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbfFUJXu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:23:50 -0400
Received: from [46.226.52.104] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 87/50-04913-222AC0D5; Fri, 21 Jun 2019 09:23:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJJsWRWlGSWpSXmKPExsWSoc9nrqu0iCf
  WYMZ3QYsvc0+xWHy61s1ocf/rUUaLy7vmsFlsffmOyWLvofmMFn3n3C1WnpjF7MDhMe3AbHaP
  9zda2T1md8xk9bhzbQ+bx7OF61k8Tp56wuLxeZNcAHsUa2ZeUn5FAmvGr7ubmQpusFa8nNHG2
  sB4n6WLkYuDReAEs8TBG+eZQRwhgYlMElOn32SHcO4zSrRen8PUxcjJwSZgKDHvzXtGEFtEQE
  Wic/1/FhCbWeA9s8Tko6ldjBwcwgIOEt0TyyFKHCUW9NxggrCNJN5N7QRrZRFQlTh0/CMriM0
  rECtxqf02K8SudkaJCV9OsYEkOAVMJdYe+w5mMwrISnxpXM0MsUtc4taT+WBDJQQEJJbsOc8M
  YYtKvHz8jxWiPl6iff9bdoi4jsTZ608YIWwliWU3ZrFC2LISl+Z3Q8V9JfY+62MCOUJC4BajR
  PflJ1BDtSTeT54ENUhK4sTFo1DNORIbbq1hg7DVJKas/wRVLyPxb9dUZohBy9gkXh74DFYkJJ
  As8WHuWahBchKreh+yQBRdYJa43jWBfQKj9iwk30HYOhILdn9ig7C1JZYtfM08CxxkghInZz5
  hWcDIsorRIqkoMz2jJDcxM0fX0MBA19DQSNfQ0gSITfUSq3QT9VJLdctTi0t0DfUSy4v1iitz
  k3NS9PJSSzYxAtNbSsGhwzsYpxx4rXeIUZKDSUmU9xQLT6wQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd7MhUA5waLU9NSKtMwcYKqFSUtw8CiJ8FYvAErzFhck5hZnpkOkTjEac0x4OXcRM8fN90
  sWMQux5OXnpUqJ83KATBIAKc0ozYMbBMsBlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ874
  FWciTmVcCt+8V0ClMQKcsmM0FckpJIkJKqoHp/Jov/3lybHdWVlyW2HbrTM2fKTXpPkoL9kXr
  cl6bFynt2Cw2eZVcodG23e8C2Z/oRMbMWWrHb2fZefXtTu9Vi66+y/Pj2/lEwWX/qV/nbO6Kh
  Fy57Z/UdUhywr3CpzN1LM6cmfHnqsGv7KuRO5N8L3h09mhwhIsKLj3uWKcV52Zz78xsld+uTp
  w/gxr4vhlt3vz2t4vH8S0zPzyatdDsCkP0p8OTJq6x3iZkmtZqWNwb8CvyVeHW0vIqnkCTZUx
  Kpa/r86al8VVWvHzp6dR0NkRHLOLwOn+Gn0sXa/5axZOQsvOSzrqTVmcLLM7+2c9Y3Rm5vX/u
  vjvfLF9ezblZu+Xi6z28ZhH/g8Re8qSdUmIpzkg01GIuKk4EAEl2jo58BAAA
X-Env-Sender: stwiss.opensource@diasemi.com
X-Msg-Ref: server-15.tower-268.messagelabs.com!1561109025!1167171!1
X-Originating-IP: [104.47.14.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11508 invoked from network); 21 Jun 2019 09:23:46 -0000
Received: from mail-vi1eur04lp2055.outbound.protection.outlook.com (HELO EUR04-VI1-obe.outbound.protection.outlook.com) (104.47.14.55)
  by server-15.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Jun 2019 09:23:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPd4q7bNp6p3xRzRXQqgSPvCVCtxUK/NBYgb8OPPSOM=;
 b=t5CJ7LUsmHrorHz4Zq8/muAPKcGZMNCSImkrL+6cAEUPZ83hhnGy1vH+e9RGujhC+RV4qe9mg5hgm0AJomQMvo66DdXVHA7tn7+soIwAtoR8xPaBKWPSYTEfkcOQWRcMXjS+U1uiF2Fl9mqjal2Bu1IVBoJdtCnjntxC+/8NrZo=
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM (20.177.113.222) by
 AM6PR10MB2328.EURPRD10.PROD.OUTLOOK.COM (20.177.116.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 21 Jun 2019 09:23:44 +0000
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882]) by AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882%7]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 09:23:44 +0000
From:   Steve Twiss <stwiss.opensource@diasemi.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: RE: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Topic: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Index: AQHVJ0mFTYYovliAiEq8ojZ9DyPua6aly35Q
Date:   Fri, 21 Jun 2019 09:23:44 +0000
Message-ID: <AM6PR10MB218134CDB4ECB0A9534B6B96FEE70@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
References: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
 <20190620092116.y7aqun6jjjn4mgow@katana>
In-Reply-To: <20190620092116.y7aqun6jjjn4mgow@katana>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 292a6a9e-1580-4429-333d-08d6f62a283e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM6PR10MB2328;
x-ms-traffictypediagnostic: AM6PR10MB2328:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR10MB2328FA1411730120783AEC72F5E70@AM6PR10MB2328.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(366004)(39850400004)(376002)(346002)(189003)(199004)(5660300002)(6116002)(3846002)(8936002)(52536014)(14454004)(14444005)(71190400001)(4326008)(256004)(71200400001)(5024004)(54906003)(86362001)(229853002)(74316002)(81156014)(81166006)(966005)(8676002)(4744005)(73956011)(76116006)(7736002)(6436002)(316002)(66446008)(64756008)(66556008)(66476007)(305945005)(66946007)(53936002)(476003)(99286004)(107886003)(486006)(55016002)(6306002)(9686003)(102836004)(26005)(76176011)(7696005)(2906002)(6506007)(53546011)(186003)(25786009)(6916009)(66066001)(33656002)(478600001)(11346002)(446003)(6246003)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2328;H:AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k3Pv5IRdsTC8ikpuEAUKEafOcOXcnX5SFvWy90QCrU1VBz/L9L5hucpeF9R/LTBtiw542z1aJ3res/X/kIcj/+bMSBmDHy1/OoeiDWzKm1LMGwtRMBOPqeRfp+SmXTWbJxVxCr1OqBn+6vlREkdg+qzunD16IcPMSCvNhsPwO9AeqGlc73Zwgficf9V/tcYaEUJq+CbFKJ8AbCXBwPTMcNqwwSwOKWXY2tghLEQcQC36rSUT17q0lYtG+526KgSMT7glWW4uhc3hW/EC1DkKTsEfdza3mUYAbQgfXDW0XHe6Q+D7Ey1KLlUkq6plmmy0v/Ewt38qfa7K68KGOT3PfVGOWqb9BynVW399fmfeT+oiX4yBj2En6rjChwXYzSUv/ccDlBFYaDzSYm6PzIT/sPl93m4ZRaEkIN6Z7zC+1/I=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292a6a9e-1580-4429-333d-08d6f62a283e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 09:23:44.2768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stephen.twiss@diasemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2328
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On 20 June 2019 10:21, Wolfram Sang wrote:
> Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
>=20
> > Is this a safety clause? What I mean is, shouldn't the hardware design =
make
> > sure there are not two devices located on the same I2C bus with the sam=
e slave
> > address?
>=20
> It is more about preventing userspace to accidently access this address,
> and thus the registers behind it.

For what it's worth, maybe consider adding a dev_warn attached to the retur=
n
of devm_i2c_new_dummy_device?

Regards,
Steve

My apologies again for accidentally splitting your original e-mail thread o=
n this:
- https://lore.kernel.org/lkml/20190619171806.30116-1-wsa+renesas@sang-engi=
neering.com/


