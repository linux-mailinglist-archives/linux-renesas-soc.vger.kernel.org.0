Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69859DC1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 05:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbfH0Dth (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 23:49:37 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:43534
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728345AbfH0Dth (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 23:49:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCAlO0j5Xa/gBcV4F2YSWii39zaUfZ/KzrNOZokvq2KHHHWybMPOGV2BcXGKcfRzP+CbBRTtnUoju1y16xA7RTYuR25BxAzKHfEoP8Ibktt93dfkLttmuMP2rb5OOPi1FRXgRGDJEJv705ijzjZIz7C3F+FZ1sGQ8sHSw7gdLgpqhC+Q94mfKK+sb85agkoTQ2UkKfNPiHGq4siZgzMUuNx4gPVeWWnkPn4z825N6wjt7QEu6VikikFFEFzJknc6jB8RZD4vmY2pK6ICeo6NNTuvVck6g5Rkr3NIC2PyCFiCDdu+P/kyLc5ixfUZImEPUXpm3KEtLO5D14UbYZmR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzbOr2ZMd2hFfpd7JUr1oYd9kPPRDuKI47X0lgzYkvg=;
 b=OqMKz6sqAIGSyqKLIeT3WlL8f7O9GiDgvpmEc85M3Yg63J8mK5KbHrvRi1WXpFUxo+6nkUlIVDGJhtPwdbdAzgidL7g/WWFvlgipOeqOmnfDXuz3E6653qYuID8c1qpm7H/INGnOPYnqOorlSxCMh7UQPu0AWhJ8nc0S1+85MAtwfirVuIfKbCZj+arUvUqWIT81wKHPFVShZPUaE+BtkbXFgDylaH4WL8WZVERzgGqK8PGrnfyaFekDl0vArZNnJ/8ajnqQ/lZOHpWC/Cp88bB/jLW7z/i25JoI/pAysbBP0zkmT7mmKlNSGKv+0WwWlrQXk5N1zpv/eHwjX4tO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzbOr2ZMd2hFfpd7JUr1oYd9kPPRDuKI47X0lgzYkvg=;
 b=l4L4c3vVHlGHSXnEQ+YZZqz23XxtElZ2pV0zMjrR7QgzjQDGr+/d3YtU2bc0CLd36LDO98KxaW/cGls2hS1BAlk/U7uj4SQnCzSG5ZUBb5LBds2zyFcccQSzcsZRwrFjjjV5Ja0P7qKQXF1HR9N+WxUs82/aAu2mHWustAHwvCM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3440.jpnprd01.prod.outlook.com (20.178.138.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 27 Aug 2019 03:49:32 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 03:49:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] usb: host: ohci: fix a race condition between shutdown
 and irq
Thread-Topic: [PATCH v2] usb: host: ohci: fix a race condition between
 shutdown and irq
Thread-Index: AQHVXHriU4vUPtuHKkal/5KC5XwJiqcOW22g
Date:   Tue, 27 Aug 2019 03:49:31 +0000
Message-ID: <TYAPR01MB454453645EBDCD10BAC88DE1D8A00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1566870991-4870-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1566870991-4870-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2bf16c6-4ff8-4a60-6add-08d72aa191ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3440;
x-ms-traffictypediagnostic: TYAPR01MB3440:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB34407233D5533182E1803099D8A00@TYAPR01MB3440.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(51234002)(13464003)(199004)(189003)(7696005)(476003)(102836004)(53936002)(66066001)(53546011)(55016002)(2906002)(52536014)(66946007)(64756008)(66446008)(66476007)(66556008)(99286004)(11346002)(14444005)(76176011)(6436002)(2171002)(86362001)(6116002)(4326008)(26005)(3846002)(229853002)(33656002)(6506007)(486006)(305945005)(25786009)(5660300002)(256004)(76116006)(8936002)(9686003)(8676002)(446003)(71200400001)(71190400001)(6306002)(74316002)(54906003)(478600001)(966005)(2501003)(7736002)(110136005)(81166006)(6246003)(186003)(316002)(81156014)(14454004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3440;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +YpbQW+ZuPqze0jwLv46e02IKQg42RcEtJVDs8djBbf+rErjg3s9f1QTWVuxuLU6yiBAFPvTZyNVwubuZp4RdnXFFObJnLgBeJw53jQv9rCGV3FW/PVklCwsLo94vS+0RkSW2N42pk+9lWzpLZJ+t60fiDH+UVfxxJ/UPci1jBt0E90X9EBtE2dX43Ra1it/pMBIidR85jy3Ys2RCtf/9liZ0R1XFtKExKZHYLfEDOnxAMB3uO/xwnTQSGiMNma1ynynisrlUU7tMSjUaValOdflFeIWKqh2NJjSnbDkMMBqApYjZUROPTA7NLK/oJXOPIIaXZ+cDXNOAJvPg2TOVzwXBqfbQggA87A/fC+xC2rl2akVcvsh9S6DaYpnzyNflsw6x4dFC5xDRhxzSMX7Jl7frvOmz0jalDN08imQuRw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bf16c6-4ff8-4a60-6add-08d72aa191ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 03:49:32.0016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qu2e8vWR4yq4xnDQK6G5ED4ouj4saAX4zfV6hPIH5ugmxyO1t744thAspX3nb4acWGOzja+5EoL92VjS4vDnBb3zMZodNAHheNiA/jmupNDJzop2lhZez56y27N5Cn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3440
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg, Alan,

I'm afraid but, I would like to recall this patch because
I lacked the last sentence in the commit log.
I'll submit v3 patch soon.

Best regards,
Yoshihiro Shimoda

> -----Original Message-----
> From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Sent: Tuesday, August 27, 2019 10:57 AM
> To: gregkh@linuxfoundation.org; stern@rowland.harvard.edu
> Cc: linux-usb@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Yoshihi=
ro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH v2] usb: host: ohci: fix a race condition between shutdow=
n and irq
>=20
> This patch fixes an issue that the following error is
> possible to happen when ohci hardware causes an interruption
> and the system is shutting down at the same time.
>=20
> [   34.851754] usb 2-1: USB disconnect, device number 2
> [   35.166658] irq 156: nobody cared (try booting with the "irqpoll" opti=
on)
> [   35.173445] CPU: 0 PID: 22 Comm: kworker/0:1 Not tainted 5.3.0-rc5 #85
> [   35.179964] Hardware name: Renesas Salvator-X 2nd version board based =
on r8a77965 (DT)
> [   35.187886] Workqueue: usb_hub_wq hub_event
> [   35.192063] Call trace:
> [   35.194509]  dump_backtrace+0x0/0x150
> [   35.198165]  show_stack+0x14/0x20
> [   35.201475]  dump_stack+0xa0/0xc4
> [   35.204785]  __report_bad_irq+0x34/0xe8
> [   35.208614]  note_interrupt+0x2cc/0x318
> [   35.212446]  handle_irq_event_percpu+0x5c/0x88
> [   35.216883]  handle_irq_event+0x48/0x78
> [   35.220712]  handle_fasteoi_irq+0xb4/0x188
> [   35.224802]  generic_handle_irq+0x24/0x38
> [   35.228804]  __handle_domain_irq+0x5c/0xb0
> [   35.232893]  gic_handle_irq+0x58/0xa8
> [   35.236548]  el1_irq+0xb8/0x180
> [   35.239681]  __do_softirq+0x94/0x23c
> [   35.243253]  irq_exit+0xd0/0xd8
> [   35.246387]  __handle_domain_irq+0x60/0xb0
> [   35.250475]  gic_handle_irq+0x58/0xa8
> [   35.254130]  el1_irq+0xb8/0x180
> [   35.257268]  kernfs_find_ns+0x5c/0x120
> [   35.261010]  kernfs_find_and_get_ns+0x3c/0x60
> [   35.265361]  sysfs_unmerge_group+0x20/0x68
> [   35.269454]  dpm_sysfs_remove+0x2c/0x68
> [   35.273284]  device_del+0x80/0x370
> [   35.276683]  hid_destroy_device+0x28/0x60
> [   35.280686]  usbhid_disconnect+0x4c/0x80
> [   35.284602]  usb_unbind_interface+0x6c/0x268
> [   35.288867]  device_release_driver_internal+0xe4/0x1b0
> [   35.293998]  device_release_driver+0x14/0x20
> [   35.298261]  bus_remove_device+0x110/0x128
> [   35.302350]  device_del+0x148/0x370
> [   35.305832]  usb_disable_device+0x8c/0x1d0
> [   35.309921]  usb_disconnect+0xc8/0x2d0
> [   35.313663]  hub_event+0x6e0/0x1128
> [   35.317146]  process_one_work+0x1e0/0x320
> [   35.321148]  worker_thread+0x40/0x450
> [   35.324805]  kthread+0x124/0x128
> [   35.328027]  ret_from_fork+0x10/0x18
> [   35.331594] handlers:
> [   35.333862] [<0000000079300c1d>] usb_hcd_irq
> [   35.338126] [<0000000079300c1d>] usb_hcd_irq
> [   35.342389] Disabling IRQ #156
>=20
> ohci_shutdown() disables all the interrupt and rh_state is set to
> OHCI_RH_HALTED. In other hand, ohci_irq() is possible to enable
> OHCI_INTR_SF and OHCI_INTR_MIE on ohci_irq(). Note that OHCI_INTR_SF
> is possible to be set by start_ed_unlink() which is called:
>  ohci_irq()
>   -> process_done_list()
>    -> takeback_td()
>     -> start_ed_unlink()
>=20
> So, ohci_irq() has the following condition, the issue happens by
> &ohci->regs->intrenable =3D OHCI_INTR_MIE | OHCI_INTR_SF and
> ohci->rh_state =3D OHCI_RH_HALTED:
>=20
> 	/* interrupt for some other device? */
> 	if (ints =3D=3D 0 || unlikely(ohci->rh_state =3D=3D OHCI_RH_HALTED))
> 		return IRQ_NOTMINE;
>=20
> To fix the issue, ohci_shutdown() holds the spin lock while disabling
> the interruption and changing the rh_state flag to prevent reenable
> the OHCI_INTR_MIE unexpectedly. Note that io_watchdog_func() also
> calls the ohci_shutdown() and it already held the spin lock, so that
> the patch makes a new function as _ohci_shutdown().
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> Changes from v1:
>  - Add more comments in the commit log.
> https://patchwork.kernel.org/patch/11111459/
>=20
>  drivers/usb/host/ohci-hcd.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> index b457fda..1fe3dee 100644
> --- a/drivers/usb/host/ohci-hcd.c
> +++ b/drivers/usb/host/ohci-hcd.c
> @@ -419,8 +419,7 @@ static void ohci_usb_reset (struct ohci_hcd *ohci)
>   * other cases where the next software may expect clean state from the
>   * "firmware".  this is bus-neutral, unlike shutdown() methods.
>   */
> -static void
> -ohci_shutdown (struct usb_hcd *hcd)
> +static void _ohci_shutdown(struct usb_hcd *hcd)
>  {
>  	struct ohci_hcd *ohci;
>=20
> @@ -436,6 +435,16 @@ ohci_shutdown (struct usb_hcd *hcd)
>  	ohci->rh_state =3D OHCI_RH_HALTED;
>  }
>=20
> +static void ohci_shutdown(struct usb_hcd *hcd)
> +{
> +	struct ohci_hcd	*ohci =3D hcd_to_ohci(hcd);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ohci->lock, flags);
> +	_ohci_shutdown(hcd);
> +	spin_unlock_irqrestore(&ohci->lock, flags);
> +}
> +
>  /*----------------------------------------------------------------------=
---*
>   * HC functions
>   *----------------------------------------------------------------------=
---*/
> @@ -760,7 +769,7 @@ static void io_watchdog_func(struct timer_list *t)
>   died:
>  			usb_hc_died(ohci_to_hcd(ohci));
>  			ohci_dump(ohci);
> -			ohci_shutdown(ohci_to_hcd(ohci));
> +			_ohci_shutdown(ohci_to_hcd(ohci));
>  			goto done;
>  		} else {
>  			/* No write back because the done queue was empty */
> --
> 2.7.4

