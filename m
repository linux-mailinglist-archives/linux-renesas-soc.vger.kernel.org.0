Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73AD49C748
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2019 04:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfHZCem (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Aug 2019 22:34:42 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:28960
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726215AbfHZCem (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Aug 2019 22:34:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj6S/YQfA5cAu6Gkb/jFVHtRLRMcZvi2rkPv+kkpKCJNLLo9HjUVxWxdzMcDMsqG9p9ZIdI6Q5Zl+DVPJ4f1D3gvKBXq/5Q4sc4TDF+5W3rkhpYN0/7MS/mYsMmB3jJ4jgWUwcDM2n3OCFZOTN8RsyW9Stc6YTn5XtOmk2Ii5ENLyzG6J9F2ttehUrT0zri5u92lqg4FW2o9jOyO/U1VluwB4fqYuUhnDub+Fn3mnAPw7+ooTyTOwudZZfZ7EDzulQphZg6ZvS8hTrR14QuKWWvgGSFxd5Q75hBYYZQ9+E3KEJ+bg+IsONlyL9TtFFqvO22ud8nRre+vKPowkTKBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWz+nuZ5QVG4rFl0AE3sdQLDQ/9s54GNGW4z9RXYPhE=;
 b=XRex7YelOy1WqmLG4QvN3PXp4Tv2o4muRhBo0dfx0fEK7CqIM9yGd3YXHJ9v86t5YuW3zLmVAeVq+MNMBVpIEiltuhhEo9xj3pOwwy2bkzD/JzAv+xmoMkt4FEv1v2UUN4JPTXYJuzIf6lLKavmgvB2fqs7z1Bej73IrKTzJBD7n0Cw2NKH5+Syj43IsfiuST48ceAf7g73SAdz+/n55PNu8mIAoH14l7dptQf/0prrAN2YZmhidR9NJ5k85OLD0ununchB5BG41EVupSKEjoGiK6Va8XMB9CHakvwpI0Qn1bQd+mgpRMi3FNShvg3nr2oTQbTTsnExb/AK7W511hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWz+nuZ5QVG4rFl0AE3sdQLDQ/9s54GNGW4z9RXYPhE=;
 b=quE3sDRAKV1BBV9E8a8C0GY3lkYr/R6EPHwd1r3G3J90IDI+tdQPIYumtOTZZNBtxPBC0MuWxZHlsNaU2jf2dziNT6LdsDGRBisXJOeDkM8lEtq2+VpCwfxDpR8e8h7tRLQEnir9RwJIM4mud7oT6LsrOuEvZclgVbdZJZcSixw=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5263.jpnprd01.prod.outlook.com (20.179.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 26 Aug 2019 02:34:37 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2199.015; Mon, 26 Aug 2019
 02:34:37 +0000
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
Thread-Index: AQHVWZ5Pt7hfvCd9u06PAG7imQbXUacI3N8AgAPXjwA=
Date:   Mon, 26 Aug 2019 02:34:37 +0000
Message-ID: <TYAPR01MB45443AA0303F9DD1E08AFC2FD8A10@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566556357-24897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <Pine.LNX.4.44L0.1908231124410.1628-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908231124410.1628-100000@iolanthe.rowland.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bd78e8f-1ffb-42aa-28d8-08d729cdf07a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB5263;
x-ms-traffictypediagnostic: TYAPR01MB5263:
x-microsoft-antispam-prvs: <TYAPR01MB5263A2F7CEC972DE7D2A1FD9D8A10@TYAPR01MB5263.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(51234002)(199004)(189003)(52536014)(305945005)(7736002)(71190400001)(71200400001)(9686003)(55016002)(5660300002)(3846002)(6116002)(66946007)(6436002)(66476007)(66446008)(64756008)(66556008)(86362001)(6246003)(6916009)(14454004)(81166006)(8936002)(8676002)(81156014)(7696005)(54906003)(76176011)(102836004)(99286004)(2906002)(76116006)(6506007)(66066001)(316002)(4326008)(256004)(14444005)(476003)(446003)(11346002)(25786009)(26005)(53936002)(186003)(486006)(478600001)(74316002)(2171002)(33656002)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5263;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SC3DhC2nN4o3VlqSc6w7sqbw5ag6CPjkwPcFf6CebsqTmJ5qnAr9LMgJl1Cx4sL+WhADarhHKwB354Isc9gCbLaf8dcRrI5NP+j5mwBCHABe8x81C+EsU5XpY4p28D2agJ7bTnXqLJGbfoeKTSf8SOtLc1owNwO7DF36rDb0YXT+OIXiQQgXOnqoVNLfKTKUhUug5Wd2ZzwT81satNYFR7g9I+Vswrpu2sQRv7tB12tguRhDTq/SuoNzZ6kGUtTIV8DjSSKrz4eys567mGcD4NU6Sgl56qimHYsEGXc+2kSKwDSCBE2kFCN8qgUOW/+z5ulf/Ta94kQJRJ3QYgp82bR0XQusFSKahgRG7pMsqEnQi0FvC8uTVrQuyxmVcrtXCha7i6QSGB77y6xZ3S86F0oCo1xXsbYjy40L6u2IAZI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd78e8f-1ffb-42aa-28d8-08d729cdf07a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 02:34:37.3727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGxJHk2OCBQwKea68AzO6VRlIAbYcS7w0m/SIz3Ct3UGCF9T6Dt3UgfEroJT56IL4+6dUndFuwvdf45UV7bOz1N4gDyX3fqmnBUU6tXuC5LczeiSm54MD6IcBD9kpeH9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5263
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

> From: Alan Stern, Sent: Saturday, August 24, 2019 12:33 AM
>=20
> On Fri, 23 Aug 2019, Yoshihiro Shimoda wrote:
>=20
> > This patch fixes an issue that the following error is
> > possible to happen when ohci hardware causes an interruption
> > and the system is shutting down at the same time.
> >
> > [   34.851754] usb 2-1: USB disconnect, device number 2
> > [   35.166658] irq 156: nobody cared (try booting with the "irqpoll" op=
tion)
> > [   35.173445] CPU: 0 PID: 22 Comm: kworker/0:1 Not tainted 5.3.0-rc5 #=
85
> > [   35.179964] Hardware name: Renesas Salvator-X 2nd version board base=
d on r8a77965 (DT)
> > [   35.187886] Workqueue: usb_hub_wq hub_event
> > [   35.192063] Call trace:
> > [   35.194509]  dump_backtrace+0x0/0x150
> > [   35.198165]  show_stack+0x14/0x20
> > [   35.201475]  dump_stack+0xa0/0xc4
> > [   35.204785]  __report_bad_irq+0x34/0xe8
> > [   35.208614]  note_interrupt+0x2cc/0x318
> > [   35.212446]  handle_irq_event_percpu+0x5c/0x88
> > [   35.216883]  handle_irq_event+0x48/0x78
> > [   35.220712]  handle_fasteoi_irq+0xb4/0x188
> > [   35.224802]  generic_handle_irq+0x24/0x38
> > [   35.228804]  __handle_domain_irq+0x5c/0xb0
> > [   35.232893]  gic_handle_irq+0x58/0xa8
> > [   35.236548]  el1_irq+0xb8/0x180
> > [   35.239681]  __do_softirq+0x94/0x23c
> > [   35.243253]  irq_exit+0xd0/0xd8
> > [   35.246387]  __handle_domain_irq+0x60/0xb0
> > [   35.250475]  gic_handle_irq+0x58/0xa8
> > [   35.254130]  el1_irq+0xb8/0x180
> > [   35.257268]  kernfs_find_ns+0x5c/0x120
> > [   35.261010]  kernfs_find_and_get_ns+0x3c/0x60
> > [   35.265361]  sysfs_unmerge_group+0x20/0x68
> > [   35.269454]  dpm_sysfs_remove+0x2c/0x68
> > [   35.273284]  device_del+0x80/0x370
> > [   35.276683]  hid_destroy_device+0x28/0x60
> > [   35.280686]  usbhid_disconnect+0x4c/0x80
> > [   35.284602]  usb_unbind_interface+0x6c/0x268
> > [   35.288867]  device_release_driver_internal+0xe4/0x1b0
> > [   35.293998]  device_release_driver+0x14/0x20
> > [   35.298261]  bus_remove_device+0x110/0x128
> > [   35.302350]  device_del+0x148/0x370
> > [   35.305832]  usb_disable_device+0x8c/0x1d0
> > [   35.309921]  usb_disconnect+0xc8/0x2d0
> > [   35.313663]  hub_event+0x6e0/0x1128
> > [   35.317146]  process_one_work+0x1e0/0x320
> > [   35.321148]  worker_thread+0x40/0x450
> > [   35.324805]  kthread+0x124/0x128
> > [   35.328027]  ret_from_fork+0x10/0x18
> > [   35.331594] handlers:
> > [   35.333862] [<0000000079300c1d>] usb_hcd_irq
> > [   35.338126] [<0000000079300c1d>] usb_hcd_irq
> > [   35.342389] Disabling IRQ #156
> >
> > The ohci_shutdown() should hold the spin lock while disabling
> > the interruption and changing the rh_state flag. Note that
> > io_watchdog_func() also calls the ohci_shutdown() and it
> > already held the spin lock, so that the patch makes a new
> > function as _ohci_shutdown().
>=20
> I don't understand this description.  It sounds like the OHCI
> controller generates an interrupt request, and then ohci_shutdown()
> disables the interrupt request before the handler can run.  When the
> handler does run, it sees that no interrupts are enabled and so it
> returns IRQ_NOTMINE, leading to the error shown above.
>=20
> How will holding the spinlock fix this problem?

I'm sorry for lacking description. I should have described the following
descriptions instead of that. What do you think?

--
ohci_shutdown() disables all the interrupt and rh_state is set to
OHCI_RH_HALTED. In other hand, ohci_irq() is possible to enable
OHCI_INTR_SF and OHCI_INTR_MIE on ohci_irq(). Note that OHCI_INTR_SF
is possible to be set by start_ed_unlink() which is called:
 ohci_irq()
  -> process_done_list()
   -> takeback_td()
    -> start_ed_unlink()

So, ohci_irq() has the following condition, the issue happens by
&ohci->regs->intrenable =3D OHCI_INTR_MIE | OHCI_INTR_SF and
ohci->rh_state =3D OHCI_RH_HALTED:

	/* interrupt for some other device? */
	if (ints =3D=3D 0 || unlikely(ohci->rh_state =3D=3D OHCI_RH_HALTED))
		return IRQ_NOTMINE;

To fix the issue, ohci_shutdown() holds the spin lock while disabling
the interruption and changing the rh_state flag to prevent reenable
the OHCI_INTR_MIE unexpectedly. Note that io_watchdog_func() also calls
the ohci_shutdown() and it already held the spin lock, so that the patch
makes a new function as _ohci_shutdown().
--

Best regards,
Yoshihiro Shimoda

> Alan Stern

