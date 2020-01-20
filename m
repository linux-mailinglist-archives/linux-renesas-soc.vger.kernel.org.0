Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C304142750
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 10:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgATJdy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 04:33:54 -0500
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:58649
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726075AbgATJdy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 04:33:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmjYnbsT1mY12bmnETPjhIHa6qlFyerSN15zRprB9PbpLGtDSUXlegF8nzyFwMPeKYvnBuXUGI0AZ4D2TKo4u6kpAc1lHps8U+uotWe4nCc6AC7diEyayXO6PPZXN1APX+lX6Q7X2YVo9+msP8YbbGORrZq2xNVF2qpttiWaioYPbuf2NLEhcedzwVbayAzDYHBaLO14QLsonJGS/0qyqPlR2+DkMCVic9lvX8goMZYlPg7UIqxPE4IuMjVwOtDVkpxfajfV4LwqtIdjKDdTmZbTc8/sO9PRvIEoGVQqbsZ2BdEw672WgPSBgCcHxmXMmAwa9X3pslrGHwo3A342Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80Ju+lPPbub8Z4VAqpLKFStJ5Ei7KEwV6yJHh9HJj8Q=;
 b=Bc1TFXGY24FQpHxAWX8QXm02vT4NW+OxneIHDvVyyahAFs7dZ11yVcW21uZX2c+M+VYU+qycu/mLZXpdTV00WfY6wGn5prekjbqj6XBDIJRRz1Wk24L3O2gH5Up3lK0swrQyEJIP3s9xZ8zCwU7jXM7B9b0VOz8/42rlfF7B7AaqqNWxpeiXZ4TLX8I8VsHvi6Tx3sU7fryZPzMdXZ+BQMXRJCLTZNciV9HFpvuOlOE9UX+dgeL8svM8ClxDbwGVF9Vcwvm4vrdxYSzYlMevR6BcaTVa6nxYRQzjoJ7P/PXlmDoAZsnTvwz8P2XeGEpfJUTixMInDk5RBreOBdKyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80Ju+lPPbub8Z4VAqpLKFStJ5Ei7KEwV6yJHh9HJj8Q=;
 b=TpRSm3t1Dm3bcUMU7yEzaEEQ4VEAIRbfl74wB38cedsjajeaH6G4nJcviLxfSF66EJKUYbywBnSqjo/iPp/ns529pHRpxn2scD7QGBKP1JNJ6rCjbGJW59jp92t8w6Vag+GhQXNHCdVy2AmpjJ4BCOfmHF76htE2ArtUPv9NBGM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4528.jpnprd01.prod.outlook.com (20.179.187.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Mon, 20 Jan 2020 09:33:50 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 09:33:50 +0000
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
Thread-Index: AQHVzSRz1q4eI+Sg7UOxqpRra7mKKqfvC4WAgAQwcHA=
Date:   Mon, 20 Jan 2020 09:33:50 +0000
Message-ID: <TYAPR01MB45443178BFBB9C16CF3BC32AD8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1579258447-28135-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <Pine.LNX.4.44L0.2001171103070.1571-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001171103070.1571-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e347ab52-541f-4497-18e3-08d79d8bdb81
x-ms-traffictypediagnostic: TYAPR01MB4528:
x-microsoft-antispam-prvs: <TYAPR01MB45281601A15AE59ADFCF663AD8320@TYAPR01MB4528.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(189003)(199004)(7696005)(6506007)(4326008)(6916009)(52536014)(26005)(316002)(71200400001)(186003)(2906002)(54906003)(9686003)(8936002)(81156014)(81166006)(8676002)(5660300002)(86362001)(33656002)(55016002)(76116006)(66946007)(66476007)(64756008)(66446008)(66556008)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4528;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qz07orlhCQViz0kP7T2wofLxnoBd4pam0JKV+mHYRrf5DZIXeBTrCsM7eF9ijN7u30OjlByGHickWPPCv7nv770RYhJ3R/lBc3ZQtBwCFHCT7xVb5nzHgvnIlHiYvNx7RUQwKDQjo4MmSvPeGVcWQ1avlb1j0nls/FgzmVaITFwIV9HbXCRIsHeE4O0yHIoOQBk0JkBSvl9AiIj++wUoKrRWS4kvk9mNZRFkgl+Exb1InouiKpIC1HJbOoxrn3AAnTm3IrwzV2GNNvwr5H1MhE7i5VhhP1E4z+q7VycWjztfwDHBaDInXPp5CFBk78EYg5I2AquzJ3hXNDtjYphgUvOHyXCgY6O3un5H3hGYWoLizRWfz8g5OaT8oQ4v9dgtwzRMjdlOApD8DVWxibg3j2uguxqvV4XBA6cV/YXvdRA42ZBftPreWMnmerilpHEP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e347ab52-541f-4497-18e3-08d79d8bdb81
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 09:33:50.3221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vy3ifof3KuxOtAVAHr9TCYepX134VeEyPNXqjq9oCuhSSg2ndE6lE9sK5LX/WFUOYvVV/sykOCRkfK/rBcGKpwYlsodetzxAhMrHMLrWELTMf8H+h7mPGCbwM7rMloKL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4528
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

Thank you for your review!

> From: Alan Stern, Sent: Saturday, January 18, 2020 1:27 AM
>=20
> On Fri, 17 Jan 2020, Yoshihiro Shimoda wrote:
>=20
> > Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to
> > be getting stuck very rarely after a full/low usb device was
> > disconnected. To detect/recover from such a situation, the controllers
> > require a special way which poll the EHCI PORTSC register and changes
> > the OHCI functional state.
> >
> > So, this patch adds a polling timer into the ehci-platform driver,
> > and if the ehci driver detects the issue by the EHCI PORTSC register,
> > the ehci driver removes a companion device (=3D the OHCI controller)
> > to change the OHCI functional state to USB Reset once. And then,
> > the ehci driver adds the companion device again.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> The programming in this patch could be improved in several ways.
>=20
> > ---
> >  drivers/usb/host/ehci-platform.c | 104 +++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 104 insertions(+)
> >
> > diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-p=
latform.c
> > index 769749c..fc6bb06 100644
> > --- a/drivers/usb/host/ehci-platform.c
> > +++ b/drivers/usb/host/ehci-platform.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset.h>
> > +#include <linux/timer.h>
> >  #include <linux/usb.h>
> >  #include <linux/usb/hcd.h>
> >  #include <linux/usb/ehci_pdriver.h>
> > @@ -44,6 +45,9 @@ struct ehci_platform_priv {
> >  	struct clk *clks[EHCI_MAX_CLKS];
> >  	struct reset_control *rsts;
> >  	bool reset_on_resume;
> > +	bool quirk_poll;
> > +	struct timer_list poll_timer;
> > +	struct work_struct poll_work;
> >  };
> >
> >  static const char hcd_name[] =3D "ehci-platform";
> > @@ -118,6 +122,88 @@ static struct usb_ehci_pdata ehci_platform_default=
s =3D {
> >  	.power_off =3D		ehci_platform_power_off,
> >  };
> >
> > +static bool ehci_platform_quirk_poll_check_condition(struct ehci_hcd *=
ehci)
>=20
> There should be a kerneldoc section above this line, explaining what
> the function does and why it is needed.  Otherwise people reading this
> code for the first time will have no idea what is going on.

I got it. I'll add a kerneldoc section.

> You don't really need the "ehci_platform_" at the start of the function
> name, because this is a static function.
>=20
> Also, "quirk_poll_check_condition" suggests that this is the _only_
> condition that a quirk might need to poll for.  What if another similar
> quirk arises in the future?  The function name should indicate
> something about what condition is being checked.

I got it. I'll change the function name to quirk_poll_stuck_connection().

> > +{
> > +	u32 port_status =3D ehci_readl(ehci, &ehci->regs->port_status[0]);
> > +
> > +	if (!(port_status & PORT_OWNER) &&	/* PO =3D=3D 0b */
> > +	    port_status & PORT_POWER &&		/* PP =3D=3D 1b */
> > +	    !(port_status & PORT_CONNECT) &&	/* CCS =3D=3D 0b */
> > +	    port_status & GENMASK(11, 10))	/* LS !=3D 00b */
>=20
> The comments are unnecessary.  Anyone reading the code will realize
> that !(port_status & PORT_OWNER) means that the PO value is 0b, and so
> on.
>=20
> Also, I think the code would be a little clearer if all the tests were
> inside parentheses, not just the negated tests.
>=20
> The GENMASK stuff is very obscure.  You could define a PORT_LS_MASK
> macro in include/linux/usb/ehci_defs.h to be (3<<10), and make the
> test:
>=20
> 	(port_status & PORT_LS_MASK)

I got it. I'll fix them.

> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> > +static void ehci_platform_quirk_poll_rebind_companion(struct ehci_hcd =
*ehci)
> > +{
> > +	struct device *companion_dev;
> > +	struct usb_hcd *hcd =3D ehci_to_hcd(ehci);
> > +
> > +	companion_dev =3D usb_of_get_companion_dev(hcd->self.controller);
> > +	if (!companion_dev)
> > +		return;
> > +
> > +	device_release_driver(companion_dev);
> > +	if (device_attach(companion_dev) < 0)
> > +		ehci_err(ehci, "%s: failed\n", __func__);
> > +
> > +	put_device(companion_dev);
> > +}
> > +
> > +static void ehci_platform_quirk_poll_start_timer(struct ehci_platform_=
priv *p)
> > +{
> > +	mod_timer(&p->poll_timer, jiffies + msecs_to_jiffies(1000));
> > +}
>=20
> Does this really need to be in a separate function?  Why not include it
> inline wherever it is used?
>=20
> Also, instead of msecs_to_jiffies(1000) you can just write HZ.

I intended to avoid using magical number "1000", but using HZ and including=
 it
inline are better. I'll fix it.

> > +
> > +static void ehci_platform_quirk_poll_work(struct work_struct *work)
> > +{
> > +	struct ehci_platform_priv *priv =3D
> > +		container_of(work, struct ehci_platform_priv, poll_work);
> > +	struct ehci_hcd *ehci =3D container_of((void *)priv, struct ehci_hcd,
> > +					     priv);
> > +	int i;
> > +
> > +	usleep_range(4000, 8000);
>=20
> You have just waited 1000 ms for the timer.  Why will sleeping an
> additional 4 - 8 ms make any difference?

This sleeping can avoid a misdetection between this work function and
reconnection. If user reconnects the usb within 4 ms, the PORTSC
condition is possible to be the same as the issue's condition.
I think I should have described this information into the code.

However, if I used schedule_delayed_work() instead, we can remove
the usleep_range().

> > +
> > +	for (i =3D 0; i < 2; i++) {
> > +		udelay(10);
> > +		if (!ehci_platform_quirk_poll_check_condition(ehci))
> > +			goto out;
> > +	}
>=20
> This will be clearer if you expand the loop and add a comment:
>=20
> 	/* Make sure the condition persists for at least 10 us */
> 	if (!ehci_platform_quirk_poll_check_condition(ehci))
> 		return;
> 	udelay(10);
> 	if (!ehci_platform_quirk_poll_check_condition(ehci))
> 		return;

I think so. So, I'll fix it.

> > +
> > +	ehci_dbg(ehci, "%s: detected getting stuck. rebind now!\n", __func__)=
;
> > +	ehci_platform_quirk_poll_rebind_companion(ehci);
> > +
> > +out:
> > +	ehci_platform_quirk_poll_start_timer(priv);
>=20
> You don't need to restart the timer here ...
>=20
> > +}
> > +
> > +static void ehci_platform_quirk_poll_timer(struct timer_list *t)
> > +{
> > +	struct ehci_platform_priv *priv =3D from_timer(priv, t, poll_timer);
> > +	struct ehci_hcd *ehci =3D container_of((void *)priv, struct ehci_hcd,
> > +					     priv);
> > +
> > +	if (ehci_platform_quirk_poll_check_condition(ehci))
> > +		schedule_work(&priv->poll_work);
> > +	else
>=20
> ... if you simply remove this "else" line.

I think so. I was worried about a race condition between this timer functio=
n
and the work function. But, this will not happen because the timer is every=
 1 s.

> > +		ehci_platform_quirk_poll_start_timer(priv);
>=20
> Also, it would be a lot cleaner if you run all the check_condition
> stuff inside the timer routine here, and use the work routine only for
> rebind_companion.

If using mdelay(4) in the timer routine here can be acceptable,
it would be a lot cleaner. But, Documentation/timers/timers-howto.rst
suggests to avoid using mdelay() in atomic.

Best regards.
Yoshihiro Shimoda

> Alan Stern

