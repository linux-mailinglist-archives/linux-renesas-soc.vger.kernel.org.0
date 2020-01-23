Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7097E14677F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 13:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgAWMFo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 07:05:44 -0500
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:41696
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726026AbgAWMFo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 07:05:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbVFppxUFZxzvO6LdhgRQVnpC2rrUEALWMRFrSOvsUypHRcCvQuMu/aSbD5SN4n7Swb0v8UdJ7AcMtxdG8BDxoam3EnlMQo7s3PSppGDS7KQQbxHIV1WTuF9jUpTc8pi+hICA+UcLbhBWILT5tCV+g1Bo8PxM/903QpFIcRA+i/4JgTgjSy6ivtHDEEZvLHofQV20gWScSreCOVYm+v6tbuAKyLKMkI7FaxC+s+V1jEVyhhy0AdZQ6gcy7TtQgrJNDsEFEPi/5GKc6RVqZwkNU5C25z4PoLrtuNkp4uDuUvz/4ONx3wsWLFHY2yM6ILErYa+RPRpA68S8cAt5lJMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo/V+1MOtfL6bVXKcQoIlvYT4eaurk7wJL1p2Rq9Ovk=;
 b=kl2gfkhg1ef3BPZ4Yqe/NbGhn2fN5Lopg+VOAIq1Q58KW3bz+MHM7EWJZXEpS3HzclQfMa9q4vP4SEUAAdO8YBz8eI4QJkak7+Du8uukLyGP4dI9kKfF42tn/d5zDbqXIGCX7uuMVK+J+xlVZYEufPS1UJcLxVJi1oI7sOud9J+3n9oL0EbnH+UKNDxCgkPEbkiGmQc9MeNzojBrpro4cGZuo6kkm6nO/Ov8KTDbw9ccaEvKUZXWHg24sVGgzcM8n/6aZYBeoIwAWk3b7KfEJHTjx4WVxQVg7l6iCfccWmsBfX6qXaN6m987h+2F0WJZ8sYvblmOg9U+/Btvq7e8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eo/V+1MOtfL6bVXKcQoIlvYT4eaurk7wJL1p2Rq9Ovk=;
 b=V36/FVHIEGy8uP93l3v+N7VvDLNY87II9QoYZfpVsihcLeQbOGNZauC0jakhRBFMkIyrXVGFq79lTWWJOd1JUChXOeTStRoVZetJo1xeOkBdk4YyqACHlcyMOtIiNYIXq3KPRnjPMrRkxzxz/pH4t1JG/pLmdk8C++fiaPmfWRU=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2127.jpnprd01.prod.outlook.com (52.133.176.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.19; Thu, 23 Jan 2020 12:05:39 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2644.028; Thu, 23 Jan 2020
 12:05:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@prisktech.co.nz" <linux@prisktech.co.nz>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Topic: [PATCH 2/2] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Index: AQHVzSRz1q4eI+Sg7UOxqpRra7mKKqfvC4WAgAQwcHCAAHG1gIAAqcfggADn94CAAUqI4IAARKEAgAFhNyA=
Date:   Thu, 23 Jan 2020 12:05:39 +0000
Message-ID: <TYAPR01MB4544D171313D851666905BF1D80F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TYAPR01MB4544998EECD346105AE75494D80C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <Pine.LNX.4.44L0.2001220956510.1636-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001220956510.1636-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 958295bf-6332-4380-e145-08d79ffc9059
x-ms-traffictypediagnostic: TYAPR01MB2127:
x-microsoft-antispam-prvs: <TYAPR01MB2127F5CED7CF8122B9F95990D80F0@TYAPR01MB2127.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(199004)(189003)(66476007)(64756008)(66556008)(66946007)(66446008)(71200400001)(7696005)(2906002)(55016002)(5660300002)(6506007)(76116006)(6916009)(52536014)(26005)(478600001)(186003)(33656002)(8676002)(54906003)(86362001)(316002)(8936002)(81156014)(81166006)(4326008)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2127;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Ggkotci8vtPQW8KbzU1WoJWibHxHERIp9Ekbdj/CogjzIP/YVv50lFXwhLEfqD25+RDyKS3cw4AuFl23mEmMOXrQEgADIxX4QGvBayNED2J+QfRWJW6DWBxuSQ2Xdz84c4/9Un+60z5Jh87zm9IXDeOy8jZZt+WHsuAX8w52AOXsoxnsKZ21Alj6VJRAR+QgbDWhdhUmAeoVUUvIoKw86uU6iqlIOjaoleXYbvWhscz6mdz8vO3YXKRJLuYj51IaiQPlnLgNpw0wuNudCGWsDA1abG7s2e2o1fpmPh3ZI6UVfZCA5CIv9XuihAEIjfS4V79NDqg/pJLhc7WNHwQeHVKPqZgQjGI8rAZP5Mmqy4DLo1JNyJZOVuQBsamnsGjYoT1WNhoG1ee4wa/pjoVFJETU4Z3n64r1E0mdBrlB+EnkxPq5v283vwFfBkHJr3O
x-ms-exchange-antispam-messagedata: a9i6lzEwoIT7PxDFtbBHh4/Bw4mle+u/TtqTlZ/liRoZtqJz9fDmyvcydo8fuIcR+De1FGlqi9Q0yuiWyyWF1NN8DtHL8P/KpG9nAeQQE4kJzi5ztqhUJWXh4+wadFsYhrJbBXJr5a4rOGzvGoIHjw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958295bf-6332-4380-e145-08d79ffc9059
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 12:05:39.7039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85kgj/3vacVxX6dmtep5ZWgwTBmb+9Fsq046UMkWYFK0grk7lKixNqSAeG3AjEJ46QVAD+qEj/mbOqTq8YUbgNYtNJMG97ypQqTU1UZDoDgIHL3EI5yMsWjgxquloZf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2127
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Wednesday, January 22, 2020 11:59 PM
>=20
> On Wed, 22 Jan 2020, Yoshihiro Shimoda wrote:
>=20
> > > Okay, now I understand.  I misread the code in the original patch.
> > > But now it looks like the code does roughly this:
> > >
> > > Timer routine:	if (ehci_platform_quirk_poll_check_condition(ehci))
> > > 			schedule_work();
> > >
> > > Work routine:	usleep_range(4000, 8000);
> > > 		udelay(10);
> > > 		if (!ehci_platform_quirk_poll_check_condition(ehci))
> > > 			return;
> > > 		udelay(10);
> > > 		if (!ehci_platform_quirk_poll_check_condition(ehci))
> > > 			return;
> > > 		ehci_platform_quirk_poll_rebind_companion(ehci);
> > >
> > > So there are three calls to quirk_poll_check_condition, with 4 - 8 ms
> > > between the first and second, and 10 us between the second and third.
> > > Do you really need to have this combination of a long delay followed =
by
> > > a short delay?  Wouldn't two check_condition calls with only one dela=
y
> > > be good enough?
> >
> > I had implemented this code by using hardware team's suggestion without
> > any doubt. So, I asked hardware team about this combination of delays.
> > The hardware team said this combination can reduce misdetection ratio
> > from noise and so on. They also said we can wait single 5 ms instead
> > this combination (but this cannot reduce misdetection ratio).
>=20
> Sure, the more times you delay and recheck, the better the error rate.
> But you don't want to go too far.

You're correct. However, my mind is changed a little...
I would like to remain rechecking as the same as before.

> > So, now I'm thinking that the following process (single wait) is
> > enough and it can improve readability. But, what do you think?
> >
> > Timer routine:	if (ehci_platform_quirk_poll_check_condition(ehci))
> >  			schedule_delayed_work(5 ms);
> >
> > Delayed work routine:
> > 		if (!ehci_platform_quirk_poll_check_condition(ehci))
> >  			return;
> >  		ehci_platform_quirk_poll_rebind_companion(ehci);
>=20
> That looks good to me.

Thank you for your feedback! I'll submit v2 patch soon.

Best regards,
Yoshihiro Shimoda

> Alan Stern

