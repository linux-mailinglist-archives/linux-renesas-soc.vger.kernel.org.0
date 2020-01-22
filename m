Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC48C145368
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2020 12:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAVLFf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jan 2020 06:05:35 -0500
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:43473
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725911AbgAVLFe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jan 2020 06:05:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKKCyvoh0/pM5JnvkbOUUvwz/O4JkmzaXhStNZ2e1fCLfVXYVRrDDqHs4PMGifFjHnsVDEQB7Egvuu0V5whjqin8aEHzNy0uY+aV4PFHTPEhrwozLq11LrfG94c9P9Kgm7O1FtA9DSGgyEkBbitZYi770i41OsjjeYB/qZJfVTxEoSyVelYWgQ1rPosBCy8dUhsDoErMyW0TtLllifFcPavPqbe/E35Hr1rnZms4eAApBxAN77YEKyGadVBKrBAx0NHuAWmeWx6Y1/iby7hH8o5DN4Jsov9JmamZh/KW91aVww5iEH6QsGFkvNQixfWXTV2y+4tyguiNo9K9ZYuWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5CdcRb+3IFLUbw92sfYq1AIuexGlQOfCIS8R+oBf+A=;
 b=GLTXxtY/qJ1WanHBjPa03uAsAQ7kFYQlBHU2dPmG8x/BBLul80zRTB0FHwfH4cHuaku0uovZhMIL4kx3CAO5tsapZmW1rHNCT9vaj7tYS0mDSYIlqC5+JC2SMEY036igsCXqUewf8Wm4scnFb+JQBw7ZKGo6bSPEoRkoIC4DeNCYWC+qe3gza8T6HKG0lL+jyX4tlyCwoBXMky9mWkYDm98tVasqtSYG+H1ikEXJsvDnBrYfPHOtPFYqHDi8XGYxL8NDVUKL6OPnFaGIA0YuJu9vYDY/BQiZdF6NXFXNBGubFKKWcJr75CKIfIUHj3pLN1P/xuAZMGXytK8eDucYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5CdcRb+3IFLUbw92sfYq1AIuexGlQOfCIS8R+oBf+A=;
 b=tJbPChRVQOB5T9OpYZgtG374Lu2WdEakGO9Hn+IeopHb7Mal2A8eCp317RinT4/NXvDXOhu7jb51md8glkokhgldbmfVGEE2ASfgX/ix1gvHBEffORSzdM3pZ+8440ez0pZbEUEXAINVsDMrtS2wLt0GtLlw7d/KspGOmuZKp4w=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4512.jpnprd01.prod.outlook.com (20.179.175.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Wed, 22 Jan 2020 11:05:29 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 11:05:29 +0000
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
Thread-Index: AQHVzSRz1q4eI+Sg7UOxqpRra7mKKqfvC4WAgAQwcHCAAHG1gIAAqcfggADn94CAAUqI4A==
Date:   Wed, 22 Jan 2020 11:05:29 +0000
Message-ID: <TYAPR01MB4544998EECD346105AE75494D80C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TYAPR01MB4544F9647CD645BEB2DC99D8D80D0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <Pine.LNX.4.44L0.2001211003430.1511-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001211003430.1511-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 04d6697b-ee88-428d-163d-08d79f2afe17
x-ms-traffictypediagnostic: TYAPR01MB4512:
x-microsoft-antispam-prvs: <TYAPR01MB4512C9601435A617C4D3646BD80C0@TYAPR01MB4512.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(81166006)(8936002)(8676002)(81156014)(54906003)(76116006)(316002)(6916009)(52536014)(64756008)(186003)(66476007)(6506007)(66556008)(26005)(66446008)(2906002)(478600001)(7696005)(66946007)(55016002)(5660300002)(71200400001)(86362001)(4326008)(33656002)(9686003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4512;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 837P3qh+l3mwKvKa8B15bNUy4uDUA2b31RDxulg/e73+cSdF77t6HHax0lWNhcEjlYGM3jYyR+Cp7UFqZX6ctzaGEwgl7KhHeU9TRhFVxqtXBtPbGDje3c1G8aBvE5iZzuAPK63Y2mwn2Sj5DPcXjKCfIfR2sfIazWcZ2eCXxHp05QDQbYPsuX9W02UVW7QUWfugNFbxhcYVkagIJJm6Bwd6AxuYYUAosN5+MSItSjuksTvqGef1Rq7MPD3rYVlgjLx6D1PqcDBMo7YG8LAeUCmJPQ6EEPifV7fArHpGZaGGhAAfF6zrEimJSLCjPapc8HRN4Obw55dJqHsysy3xX1bYxNLszCh+JJECJXo65Avvb1CRrOyP2I4HVGQ8o44JsDr2SmjtGr6pKoFfdiJ3N9KGvyR2wg8KjX+aFvHsaMHtjCzz5sUKSIUnquX8uPtc
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d6697b-ee88-428d-163d-08d79f2afe17
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 11:05:29.4674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPCkEPQvEw8isxvqNS019LyqD7FjF0SX27D1szcFrrYytKfHc1afja+/oi/MeR1yDgMbEDhoLE7s7R1yCxsoOG2+6ZGTwMnQnYVjrGqHDvRiTWfas25mbH4uM08G/nl2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4512
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Wednesday, January 22, 2020 12:10 AM
<snip>
> On Tue, 21 Jan 2020, Yoshihiro Shimoda wrote:
>=20
> > Hi Alan,
> >
> > > From: Alan Stern, Sent: Tuesday, January 21, 2020 12:12 AM
> > >
> > > On Mon, 20 Jan 2020, Yoshihiro Shimoda wrote:
> > >
> > > > > > +static void ehci_platform_quirk_poll_work(struct work_struct *=
work)
> > > > > > +{
> > > > > > +	struct ehci_platform_priv *priv =3D
> > > > > > +		container_of(work, struct ehci_platform_priv, poll_work);
> > > > > > +	struct ehci_hcd *ehci =3D container_of((void *)priv, struct e=
hci_hcd,
> > > > > > +					     priv);
> > > > > > +	int i;
> > > > > > +
> > > > > > +	usleep_range(4000, 8000);
> > > > >
> > > > > You have just waited 1000 ms for the timer.  Why will sleeping an
> > > > > additional 4 - 8 ms make any difference?
> > > >
> > > > This sleeping can avoid a misdetection between this work function a=
nd
> > > > reconnection. If user reconnects the usb within 4 ms, the PORTSC
> > > > condition is possible to be the same as the issue's condition.
> > > > I think I should have described this information into the code.
> > > >
> > > > However, if I used schedule_delayed_work() instead, we can remove
> > > > the usleep_range().
> > >
> > > Why not just make the timer delay be 1004 or 1008 ms instead of addin=
g
> > > this extra delay here?
> >
> > My concern is a race condition when the issue doesn't happen. If
> > the workaround code has an extra delay, we can detect misdetection like=
 below.
> > This is related to the EHCI/OHCI controllers on R-Car Gen3 SoCs though,
> > updating the CCS status is possible to be delayed. To be clear of the r=
eason,
> > I should have described this CCS status behavior too.
> >
> > Timer routine		workqueue		EHCI PORTSC	USB connection
> > 								disconnect
> > 						CCS=3D0		connect (within 4 ms)
> > condition =3D true (misdetection)			CCS=3D0
> > 			usleep_range(4000,8000)	CCS=3D1
> > 			condition =3D false
>=20
> Okay, now I understand.  I misread the code in the original patch.
> But now it looks like the code does roughly this:
>=20
> Timer routine:	if (ehci_platform_quirk_poll_check_condition(ehci))
> 			schedule_work();
>=20
> Work routine:	usleep_range(4000, 8000);
> 		udelay(10);
> 		if (!ehci_platform_quirk_poll_check_condition(ehci))
> 			return;
> 		udelay(10);
> 		if (!ehci_platform_quirk_poll_check_condition(ehci))
> 			return;
> 		ehci_platform_quirk_poll_rebind_companion(ehci);
>=20
> So there are three calls to quirk_poll_check_condition, with 4 - 8 ms
> between the first and second, and 10 us between the second and third.
> Do you really need to have this combination of a long delay followed by
> a short delay?  Wouldn't two check_condition calls with only one delay
> be good enough?

I had implemented this code by using hardware team's suggestion without
any doubt. So, I asked hardware team about this combination of delays.
The hardware team said this combination can reduce misdetection ratio
from noise and so on. They also said we can wait single 5 ms instead
this combination (but this cannot reduce misdetection ratio).

So, now I'm thinking that the following process (single wait) is
enough and it can improve readability. But, what do you think?

Timer routine:	if (ehci_platform_quirk_poll_check_condition(ehci))
 			schedule_delayed_work(5 ms);

Delayed work routine:
		if (!ehci_platform_quirk_poll_check_condition(ehci))
 			return;
 		ehci_platform_quirk_poll_rebind_companion(ehci);

Best regards,
Yoshihiro Shimoda

> Alan Stern

