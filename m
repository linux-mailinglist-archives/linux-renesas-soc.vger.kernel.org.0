Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301829DB74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 03:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbfH0B7p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 21:59:45 -0400
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:6115
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728621AbfH0B7p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 21:59:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGhTRTvu+m9E0NBdA24K2lBOmQm9L/YtUR3cQ4tK48gzTF0Mb368IAI58OZeMzXnb3y651U+29R6oN2ORiH9EN9UTiexeoIplq97MswBgndooDhX9EV7tfZgNqsCDtiiBwz/8VRjtEYbcjuzoOq3Xj1WajFVGCZHPVumxwpemVMSMqr2TijvWDjFCZrqTPePJJZNQGQ/Mr+RknRVjvkYYUxO7u4ivOcRRdzbd0gq1wPiNGaIMBb9/v+8CN6Kmag8OWMpQnxb5FulW169B27AB/DMA3dSQ89T2OzlMBdBGWfbyvI9tRk1w2vVjGL3TbwxI7bUXwhvIwXBV9D0bI4GIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jTCbGgjsjSF4Y4W05SFNBCtvgqYlk+oMHB9aNdjXgM=;
 b=A5fBRCfeT0lV3THy/RgbAP26WukdcBuR2x2Ss9g54KXcm7NMNvbp52eoS+dmlR6bPkOZsb44j9b3P8jltDFLOgZypccsSJ0kVXDLJ4bJSeUSbsF17jSWjiUWToFaGKR9c+XekfF+B/ZModK/GT0YW5JJyr7tmBd0Sn04VvHvc1IyzV2mdP4CHnlPxDhInr38vJL2IeR/st7SIdZNIpYslgqmK0BeUIVtElYfgem+8Y7gFZKJbn76/NPvNeN2wvVwZQrzinsXPfbONd3xZ/Og2tuLf+kASepYswQUV5aMXW+AM5VKAB1/OjDCIzbsYExQph5wkoNb+Ip2CkTbE6Lj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jTCbGgjsjSF4Y4W05SFNBCtvgqYlk+oMHB9aNdjXgM=;
 b=PqStJF0RdHS2eVXcB713clCtHTlTlH8gwfNmMQXrsEJqrO1A5y6Ocgdw7aGwqL0ifqX2JNjTzmH7aoT9SlhXoMt4vCyrMdz1fPlDhXr25ppRallIPj4QLUhK2eTVqA+ZYSJj8fkAH5MEuxeQJdI4w7XFwxdlvqyBS6JHAtnmW5c=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3488.jpnprd01.prod.outlook.com (20.178.138.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 27 Aug 2019 01:59:40 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 01:59:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: host: ohci: fix a race condition between shutdown
 and irq
Thread-Topic: [PATCH] usb: host: ohci: fix a race condition between shutdown
 and irq
Thread-Index: AQHVWZ5Pt7hfvCd9u06PAG7imQbXUacI3N8AgAPXjwCAAOZ3AIAAp70Q
Date:   Tue, 27 Aug 2019 01:59:39 +0000
Message-ID: <TYAPR01MB4544CF02687CFD8B8F53A706D8A00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <TYAPR01MB45443AA0303F9DD1E08AFC2FD8A10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <Pine.LNX.4.44L0.1908261157340.1662-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908261157340.1662-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc876db6-bb5e-4fe7-c7e9-08d72a9238bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3488;
x-ms-traffictypediagnostic: TYAPR01MB3488:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB3488412E11EC06D174709C06D8A00@TYAPR01MB3488.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(189003)(199004)(6916009)(25786009)(66066001)(8676002)(7736002)(186003)(3846002)(6116002)(33656002)(305945005)(52536014)(53936002)(4326008)(71200400001)(71190400001)(2171002)(6246003)(66946007)(256004)(81156014)(7696005)(14444005)(5660300002)(76176011)(9686003)(81166006)(55016002)(66476007)(76116006)(6506007)(66556008)(8936002)(26005)(2906002)(6306002)(64756008)(74316002)(966005)(316002)(86362001)(66446008)(6436002)(11346002)(476003)(486006)(54906003)(446003)(102836004)(99286004)(478600001)(229853002)(14454004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3488;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N1gBzIORP8dPWJ5x/z8RH02c9ybFIAIZpPrBSTaYRj9bjPFZd0cEAYFd1qwAEkegKG0bwFldTyIB7Ve1+tBcQgNym4XejzK3q5pExXZU0ZFVijCECD8ZfVeWpX3oKK7uLaJo/wybDd+GE7fzKEYQyP+rABT1EPNp5m5o0p9OSzNf6czSEK2v8IR2C8CbOuW/GRs4I7YJaNu6kLbE9CjVOg7tpdPrnQC/2OVhgOvx6qeAJnN7pY6rzZpfUvYPKq3h7cFswKsHmiJaDj+9C7OyPpsKKqihcRE8UVnzh44I9PWJH5xul5pot9srol14Fk/1HjV0oTRJmjbKGDzbVZWpcdBEbnqtp2CMhpZ60CeUx4ccm/RcLrvPhhQDys5ouf+v1KCDqF8djYwLAe+4OjO8xfuOEpgpGn/45zjmj+RqObs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc876db6-bb5e-4fe7-c7e9-08d72a9238bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 01:59:39.9978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4qtUWNmaJ06LBgYGgIRL0lqz77oUcPvuRmI+7WyTTfMwFKhX6N+SzIFwd3mycqxx2CBVsUfTXMNATNR42d/N51JPMVS+QRne5OrBocg+iiawvgcyHc66H/VyYKN6zsj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3488
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Tuesday, August 27, 2019 12:58 AM
>=20
> On Mon, 26 Aug 2019, Yoshihiro Shimoda wrote:
>=20
> > Hi Alan,
> >
> > > From: Alan Stern, Sent: Saturday, August 24, 2019 12:33 AM
> > >
> > > On Fri, 23 Aug 2019, Yoshihiro Shimoda wrote:
<snip>
> > > > The ohci_shutdown() should hold the spin lock while disabling
> > > > the interruption and changing the rh_state flag. Note that
> > > > io_watchdog_func() also calls the ohci_shutdown() and it
> > > > already held the spin lock, so that the patch makes a new
> > > > function as _ohci_shutdown().
> > >
> > > I don't understand this description.  It sounds like the OHCI
> > > controller generates an interrupt request, and then ohci_shutdown()
> > > disables the interrupt request before the handler can run.  When the
> > > handler does run, it sees that no interrupts are enabled and so it
> > > returns IRQ_NOTMINE, leading to the error shown above.
> > >
> > > How will holding the spinlock fix this problem?
> >
> > I'm sorry for lacking description. I should have described the followin=
g
> > descriptions instead of that. What do you think?
> >
> > --
> > ohci_shutdown() disables all the interrupt and rh_state is set to
> > OHCI_RH_HALTED. In other hand, ohci_irq() is possible to enable
> > OHCI_INTR_SF and OHCI_INTR_MIE on ohci_irq(). Note that OHCI_INTR_SF
> > is possible to be set by start_ed_unlink() which is called:
> >  ohci_irq()
> >   -> process_done_list()
> >    -> takeback_td()
> >     -> start_ed_unlink()
> >
> > So, ohci_irq() has the following condition, the issue happens by
> > &ohci->regs->intrenable =3D OHCI_INTR_MIE | OHCI_INTR_SF and
> > ohci->rh_state =3D OHCI_RH_HALTED:
> >
> > 	/* interrupt for some other device? */
> > 	if (ints =3D=3D 0 || unlikely(ohci->rh_state =3D=3D OHCI_RH_HALTED))
> > 		return IRQ_NOTMINE;
> >
> > To fix the issue, ohci_shutdown() holds the spin lock while disabling
> > the interruption and changing the rh_state flag to prevent reenable
> > the OHCI_INTR_MIE unexpectedly. Note that io_watchdog_func() also calls
> > the ohci_shutdown() and it already held the spin lock, so that the patc=
h
> > makes a new function as _ohci_shutdown().
>=20
> Okay, that's a lot better.  Please resubmit the patch with the new
> description.

Thank you for your review! I have submitted v2 patch as the following:
https://patchwork.kernel.org/patch/11115947/

Best regards,
Yoshihiro Shimoda

