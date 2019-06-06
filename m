Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4559C36C7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 08:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbfFFGpJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 02:45:09 -0400
Received: from mail-eopbgr1400092.outbound.protection.outlook.com ([40.107.140.92]:18204
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725267AbfFFGpJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 02:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7fPxGgE5BNbbdRGbnzBEjZxMIPcf4vMPiNKxx6LEwk=;
 b=Gf1hSuElKDgiKIAH57J6xzbE6xslFCWpxNS34u3VrwUYjIHkVolzjd2e9ZjhgKcnol+WFWlJ3cLpU8Gdl7ExUd8MF2tncs7m0sKZsXoJdBnJlTG+EkYGgEeyV/kHgonY2Czls/gR42lDt51OQrn1EyVAM+q7AcFeQL9bj8ZtOMs=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2230.jpnprd01.prod.outlook.com (52.134.239.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 06:45:05 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 06:45:05 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: RE: pcie-card issue with R-Car M3-W WS1.1 board (NETDEV WATCHDOG:
 eth0 (e1000e): transmit queue 0 timed out)
Thread-Topic: pcie-card issue with R-Car M3-W WS1.1 board (NETDEV WATCHDOG:
 eth0 (e1000e): transmit queue 0 timed out)
Thread-Index: AQHVG+QFts/gMs+QP0+jmXUdrQsCJaaOLe9g
Date:   Thu, 6 Jun 2019 06:45:05 +0000
Message-ID: <OSBPR01MB2103DE26A1526173CD49CD22B8170@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <OSBPR01MB2103EF2B0100BB5B1D734D63B8160@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <f4d818f4-9677-fbfa-0838-adce391ed417@gmail.com>
In-Reply-To: <f4d818f4-9677-fbfa-0838-adce391ed417@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d91c754-4825-436f-b4d5-08d6ea4a8289
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2230;
x-ms-traffictypediagnostic: OSBPR01MB2230:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <OSBPR01MB22301D3288030163064A4D3CB8170@OSBPR01MB2230.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39860400002)(346002)(376002)(366004)(53754006)(199004)(189003)(51914003)(2906002)(14454004)(26005)(305945005)(9686003)(478600001)(966005)(86362001)(7736002)(6116002)(3846002)(316002)(8676002)(81156014)(81166006)(8936002)(66946007)(229853002)(446003)(55016002)(6306002)(6436002)(44832011)(68736007)(11346002)(486006)(476003)(99286004)(256004)(76176011)(14444005)(33656002)(186003)(110136005)(71190400001)(6246003)(71200400001)(7696005)(53546011)(6506007)(102836004)(66476007)(52536014)(53936002)(25786009)(5660300002)(64756008)(66446008)(66556008)(76116006)(73956011)(66066001)(74316002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2230;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4C8pXmUHs/drt7rY20Cip5jc2AG+lrP74XD6oIXv2cUuuj6U2YXrMVW6ErcPGbEVWnC06w7SR1BgLZESMgJVGEvtZEW07KME8xgNn5e3ZREq+eI3F79yIaGTlHrlY+mGkVmhVqjXloN8SKwJUDzexaHeSVh5Rlfn7a/RLxtVhVPWOBJuFZqtrvPr0ZAS8dihs7gMTdJQBvqrACPSrsQUfQuzlKHQxkhwaOjuLmDgQYOlvuTzqABgHdwyG+veX07yWuzPtD7ORE67qDJQEiW8uM1fEk3+jEqUY4vJNSIgT3vJIzGRR52HtSNxQPpMeh300NFb85LCBxuI0lhfkuxx3bWd14mD10mkoiABoXc6fJIvyVmJH+twO11bZxV/+L1GfAEOqInPhN69uS/uRjNyCNZ0gmwexIHVSTiWp6e1x6I=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d91c754-4825-436f-b4d5-08d6ea4a8289
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 06:45:05.7346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2230
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

> Subject: Re: pcie-card issue with R-Car M3-W WS1.1 board (NETDEV
> WATCHDOG: eth0 (e1000e): transmit queue 0 timed out)
>=20
> On 6/5/19 9:40 AM, Biju Das wrote:
> > Hi All,
> >
> >
> >
> > Looks like there is a pcie issue on R-Car M3-W=A0 WS1.1 Salvator-XS
> > board with upstream kernel.
> >
> >
> >
> > As we know M3-W board has 2 memory banks
> >
> >
> >
> > Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
> >
> > Bank #1: 0x600000000 - 0x67fffffff, 2 GiB
> >
> >
> >
> > I am using PCIE-ethernet =A0card(Ethernet controller: Intel Corporation
> > 82574L Gigabit Network Connection) for pcie testing.
> >
> >
> >
> > With default configuration, it detects the ethernet =A0card
> >
> >
> >
> > root@salvator-x:~# lspci
> >
> > 00:00.0 PCI bridge: Renesas Technology Corp. Device 0028
> >
> > 01:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network
> > Connection
> >
> >
> >
> > However, if we enable kernel configuration for PCIE-ethernet
> > card(CONFIG_E1000E=3Dy)then i get below crash during boot
> >
> >
> >
> > [=A0=A0 11.999119] ------------[ cut here ]------------
> >
> > [=A0=A0 12.004979] NETDEV WATCHDOG: eth0 (e1000e): transmit queue 0 tim=
ed
> > out
> >
> > [=A0=A0 12.012734] WARNING: CPU: 0 PID: 0 at net/sched/sch_generic.c:44=
3
> > dev_watchdog+0x3e8/0x420
> >
> > [=A0=A0 12.022206] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> > 5.2.0-rc3-arm64-renesas-00004-g2e3a083-dirty #25
> >
> > [=A0=A0 12.032728] Hardware name: Renesas Salvator-X 2nd version board
> > based on r8a7796 (DT)
> >
> > [=A0=A0 12.041772] pstate: 60000005 (nZCv daif -PAN -UAO)
> >
> > [=A0=A0 12.047756] pc : dev_watchdog+0x3e8/0x420
> >
> > [=A0=A0 12.052948] lr : dev_watchdog+0x3e8/0x420
> >
> > [=A0=A0 12.058111] sp : ffff000010003d00
> >
> > [=A0=A0 12.062557] x29: ffff000010003d00 x28: 0000000000000002
> >
> > [=A0=A0 12.069000] x27: 00000000ffffffff x26: ffff000010f1c000
> >
> > [=A0=A0 12.075426] x25: ffff800639324430 x24: ffff000010f4f740
> >
> > [=A0=A0 12.081829] x23: ffff8006393243e0 x22: ffff00001104c000
> >
> > [=A0=A0 12.088207] x21: ffff000010f4a000 x20: ffff800639324000
> >
> > [=A0=A0 12.094564] x19: 0000000000000000 x18: ffffffffffffffff
> >
> > [=A0=A0 12.100903] x17: 00000000000040f8 x16: 000000000000403c
> >
> > [=A0=A0 12.107222] x15: 0000000000000001 x14: ffff000010baef68
> >
> > [=A0=A0 12.113520] x13: 0000000000000000 x12: 0000000000000000
> >
> > [=A0=A0 12.119809] x11: 0000000000000002 x10: 0000000000000002
> >
> > [=A0=A0 12.126077] x9 : 0000000000000000 x8 : ffff000010f4f708
> >
> > [=A0=A0 12.132331] x7 : ffff00001015d06c x6 : ffff000010f52000
> >
> > [=A0=A0 12.138574] x5 : 0000000000000000 x4 : 0000000000000002
> >
> > [=A0=A0 12.144798] x3 : ffffffffffffff50 x2 : ffff000010f6f7d8
> >
> > [=A0=A0 12.151022] x1 : 6610066f85848800 x0 : 0000000000000000
> >
> > [=A0=A0 12.157235] Call trace:
> >
> > [=A0=A0 12.160547]=A0 dev_watchdog+0x3e8/0x420
> >
> > [=A0=A0 12.165081]=A0 call_timer_fn+0xbc/0x400
> >
> > [=A0=A0 12.169596]=A0 expire_timers+0x110/0x230
> >
> > [=A0=A0 12.174194]=A0 run_timer_softirq+0xe4/0x1a0
> >
> > [=A0=A0 12.179047]=A0 __do_softirq+0x114/0x578
> >
> > [=A0=A0 12.183542]=A0 irq_exit+0x144/0x150
> >
> > [=A0=A0 12.187665]=A0 __handle_domain_irq+0x60/0xb8
> >
> > [=A0=A0 12.192558]=A0 gic_handle_irq+0x58/0xa8
> >
> > [=A0=A0 12.197014]=A0 el1_irq+0xbc/0x180
> >
> > [=A0=A0 12.200913]=A0 arch_cpu_idle+0x34/0x238
> >
> > [=A0=A0 12.205308]=A0 default_idle_call+0x1c/0x40
> >
> > [=A0=A0 12.209961]=A0 do_idle+0x1fc/0x2f0
> >
> > [=A0=A0 12.213895]=A0 cpu_startup_entry+0x24/0x28
> >
> > [=A0=A0 12.218540]=A0 rest_init+0x1a0/0x270
> >
> > [=A0=A0 12.222671]=A0 arch_call_rest_init+0xc/0x14
> >
> > [=A0=A0 12.227417]=A0 start_kernel+0x4a8/0x4d4
> >
> > [=A0=A0 12.231818] irq event stamp: 40197
> >
> > [=A0=A0 12.235962] hardirqs last=A0 enabled at (40196): [<ffff00001015d=
12c>]
> > console_unlock+0x3ec/0x5c0
> >
> > [=A0=A0 12.245376] hardirqs last disabled at (40197): [<ffff0000100817a=
4>]
> > do_debug_exception+0xbc/0x178
> >
> > [=A0=A0 12.255042] softirqs last=A0 enabled at (40174): [<ffff0000100f1=
3a8>]
> > _local_bh_enable+0x20/0x40
> >
> > [=A0=A0 12.264434] softirqs last disabled at (40175): [<ffff0000100f17e=
4>]
> > irq_exit+0x144/0x150
> >
> > [=A0=A0 12.273278] ---[ end trace cfa1ae1709343a35 ]---
> >
> > [=A0=A0 12.278880] e1000e 0000:01:00.0 eth0: Reset adapter unexpectedly
> >
> >
> >
> > Q1) Has any one observed=A0 this issue?
> >
> >
> >
> > It works without any issues for the following cases with upstream kerne=
l.
> >
> >
> >
> > Case1: Use the below commit[1] from renesas-bsp
> >
> >
> >
> > [1].
> > https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/
> > commit/?id=3D561e15db1ed8c5cc2fc340796e2d1c643111d27a
> >
> >
> >
> > Case 2: Disable the bank#1 from device tree
> >
> >
> >
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
> >
> > +#if 0
> >
> > =A0=A0=A0=A0=A0=A0=A0 memory@600000000 {
> >
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device_type =3D "memory";
> >
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x6 0x00000000 0=
x0 0x80000000>;
> >
> > =A0=A0=A0=A0=A0=A0=A0 };
> >
> > +#endif
> >
> > +
> >
> > };
> >
> >
> >
> > Q2) Could please share your thought on this issue?
>=20
> I presume it's this [1]. Robin seems to be working on a fix, see [2], alt=
hough I
> suspect he won't deliver it, so I'll have to get back to this topic mysel=
f.

Thanks for the update. Please let me know when the  patch is ready.  I am h=
appy to test and will provide feedback.

Cheers,
Biju

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-
> bsp.git/commit/?id=3D561e15db1ed8c5cc2fc340796e2d1c643111d27a
> [2] https://patchwork.kernel.org/patch/10842111/

