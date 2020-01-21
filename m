Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2EC14353D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Jan 2020 02:37:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAUBha (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 20:37:30 -0500
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:36205
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727009AbgAUBha (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 20:37:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nefxPy1mqEjMYftYbKD4BMAGfKR3PzsYJYLmVWXl335cgimoJO0u6cBiAHnvnydj/tI3585XmV00h8Ame9xLdYWhisBTummrZcsLLPfCMQbNJTqpJXEvZ96xLp0lsMIjgarD91PQWwbLciaSwrC4G4AwMlXfNKwKQdhwVDMH5BdG3PV4DzgqczPZnQaysj/eyFybGGzLUTaqqDz0Sl1gii0x8ldnhL2muNeMtTyhlw6m7J0c1lAnf5xw2nE0dlz9FEkq0nP3QcuttlVdOq3L7MtaGb6tNrawRUNvFcvgH2au/zWGA47ILVpAQ9JrisVRk26r8wy7dKgpFFM975kR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00bC2ojDBfZnDqdpDRVWky9lykHTqO+NumW717tO/zw=;
 b=oOidRKoPFIYo/zi3ugEsXzYICsKvESMLv+KaYdhKjxWlqPNY4X8mhBbgHEqnzAHU2ULrgICok74iumUANzGyGmREpfq3R6Zmd1knExkdF4nf96ZFeGwwpPwDo6imabJ634Bw5Gv4rxpOc+HGRLtRhIHtrUNnOhKIA9aj+5K9Eiz0t6tOHGJRyiQQsgxahoegXCyb/16ZPU3nPUSoArI5ojKBSeVgSVz4nv/B4/ogpXTsPI+nRHJeiaE3Sy0tjkkWjdEDb/kVJhR57Zjn6y/QLlfu+35Ze4u2nMkOic/pZr10xzIQtOhb+bsKR8PR4BJJwoH551+B6rLvKzdZA5EIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00bC2ojDBfZnDqdpDRVWky9lykHTqO+NumW717tO/zw=;
 b=glwYn1FiajIKf3+0wTguAPhXJQfTkPRuLdMzpr+l696QIWyAFJZW9SwZFc5I3fkAV+iJ6SstD2PlHSMEPgVpD7RSthX7Olvo6r5X43/xYe3gJJDpDctshIh38N5xM0O9EJcCcHVvRDOUfL0YbsdDHQseK5dyHf1XKOsbCsOEM38=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4431.jpnprd01.prod.outlook.com (20.179.186.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.21; Tue, 21 Jan 2020 01:37:26 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 01:37:26 +0000
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
Thread-Index: AQHVzSRz1q4eI+Sg7UOxqpRra7mKKqfvC4WAgAQwcHCAAHG1gIAAqcfg
Date:   Tue, 21 Jan 2020 01:37:25 +0000
Message-ID: <TYAPR01MB4544F9647CD645BEB2DC99D8D80D0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TYAPR01MB45443178BFBB9C16CF3BC32AD8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <Pine.LNX.4.44L0.2001201009480.16814-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001201009480.16814-100000@netrider.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 59fbd058-c94d-4a27-54b6-08d79e12783e
x-ms-traffictypediagnostic: TYAPR01MB4431:
x-microsoft-antispam-prvs: <TYAPR01MB4431B35D510C7809A9D64CD4D80D0@TYAPR01MB4431.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(86362001)(478600001)(9686003)(55016002)(4326008)(8936002)(6916009)(33656002)(186003)(7696005)(316002)(54906003)(71200400001)(81166006)(26005)(2906002)(81156014)(52536014)(66556008)(66446008)(66946007)(76116006)(6506007)(64756008)(5660300002)(8676002)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4431;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N2QL1Jux08V5TkVDfFvhA1dujNCee+6mhIt5yGV+t1n73RSCOYGecHkwV4rNbZLMJ9xYqaaZAdFAhB1iOy9XsdsmraM7tAatsxpmBcgH8SPHrJVeWdbSwbvt4KTbcGoAOSk++33T0Wjg9tXjKVhsXrYItECx1KIYohkgbA4qRHVBZjGEowsi036xmlDJlcGn9PI/Ne4c5q8E63TpRLwP7cEKC9Vz7rGO0ZUbVdXI7Yhks7qAYiVKdEx3xTngmlMdPDI8mezbeIhfLIemC/EQXwrLgIS4Xe7fx2AdkmzpD17vgAyVCG/2pXqYnjYPsDWn2Zm+fg2UXgnEte9o0asMvtW6G56o9U9t1drglOGfrHmWrtGDfFKoPR/rStCPTDHmQloxKUm4L+oS21jiXrLWG98whI/NVlJti4taVtrto6xR7/SftS/qzkxan/mdnCI2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fbd058-c94d-4a27-54b6-08d79e12783e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 01:37:25.8476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wza4ZM7RsppZaa0qgXQit8fq22MxbrkK7ijW2bxeR6kUdsJKOdpVa3GeKGoIc6PMcYddTBf48mCpN17h1px6Ng7eEaXu2dkOY4JdFjcdpdE1+oLTwnyk3guy1azQ/02i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4431
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Tuesday, January 21, 2020 12:12 AM
>=20
> On Mon, 20 Jan 2020, Yoshihiro Shimoda wrote:
>=20
> > > > +static void ehci_platform_quirk_poll_work(struct work_struct *work=
)
> > > > +{
> > > > +	struct ehci_platform_priv *priv =3D
> > > > +		container_of(work, struct ehci_platform_priv, poll_work);
> > > > +	struct ehci_hcd *ehci =3D container_of((void *)priv, struct ehci_=
hcd,
> > > > +					     priv);
> > > > +	int i;
> > > > +
> > > > +	usleep_range(4000, 8000);
> > >
> > > You have just waited 1000 ms for the timer.  Why will sleeping an
> > > additional 4 - 8 ms make any difference?
> >
> > This sleeping can avoid a misdetection between this work function and
> > reconnection. If user reconnects the usb within 4 ms, the PORTSC
> > condition is possible to be the same as the issue's condition.
> > I think I should have described this information into the code.
> >
> > However, if I used schedule_delayed_work() instead, we can remove
> > the usleep_range().
>=20
> Why not just make the timer delay be 1004 or 1008 ms instead of adding
> this extra delay here?

My concern is a race condition when the issue doesn't happen. If
the workaround code has an extra delay, we can detect misdetection like bel=
ow.
This is related to the EHCI/OHCI controllers on R-Car Gen3 SoCs though,
updating the CCS status is possible to be delayed. To be clear of the reaso=
n,
I should have described this CCS status behavior too.

Timer routine		workqueue		EHCI PORTSC	USB connection
								disconnect
						CCS=3D0		connect (within 4 ms)
condition =3D true (misdetection)			CCS=3D0
			usleep_range(4000,8000)	CCS=3D1
			condition =3D false

Best regards,
Yoshihiro Shimoda

> Alan Stern

