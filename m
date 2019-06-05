Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6877035812
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 09:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfFEHyq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 03:54:46 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:15264
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725294AbfFEHyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 03:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpPWAZZpUH31VZ99it2MbZDd1LlWWe1Yiw2ZTahZRiU=;
 b=Zn3x72vFti6usJ06e7S2YeWeqWPINuJo4K/1wLrS0Tp8yI3SmMKXUjXrZ5dxDIuYWn1/fmu2yF3TleXT4fx4T+JSgb30WxqedpvLCAgmHZVZnsiwzSpJtcNRKwQhwgDJCf7oJifT1+RjVdKh/s0j7F+K+uAcfRpB/RnIvO7f1eI=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3063.jpnprd01.prod.outlook.com (52.134.252.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 07:54:42 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::a146:39f0:5df9:11bc%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 07:54:42 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: pcie-card issue  with R-Car M3-W WS1.1 board (NETDEV WATCHDOG: eth0
 (e1000e): transmit queue 0 timed out)
Thread-Topic: pcie-card issue  with R-Car M3-W WS1.1 board (NETDEV WATCHDOG:
 eth0 (e1000e): transmit queue 0 timed out)
Thread-Index: AdUbc9dFlhg1crZxTayYlUPs/CFfdg==
Date:   Wed, 5 Jun 2019 07:54:41 +0000
Message-ID: <OSBPR01MB2103BDCBD7100F1651CDDAE0B8160@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fefa109e-fea6-4861-43f0-08d6e98b1168
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3063;
x-ms-traffictypediagnostic: OSBPR01MB3063:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB3063FA762E71832A46C8FF97B8160@OSBPR01MB3063.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(346002)(376002)(396003)(39860400002)(53754006)(189003)(199004)(186003)(3846002)(6116002)(8936002)(305945005)(68736007)(7696005)(6506007)(81156014)(7736002)(81166006)(71200400001)(66946007)(4326008)(54906003)(8676002)(66476007)(66446008)(73956011)(6862004)(64756008)(66556008)(53936002)(25786009)(102836004)(33656002)(316002)(6306002)(76116006)(26005)(99286004)(55016002)(74316002)(2906002)(66066001)(5660300002)(44832011)(486006)(9686003)(71190400001)(6436002)(6200100001)(14454004)(52536014)(966005)(478600001)(256004)(86362001)(14444005)(476003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3063;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ix0ZU9vlfttVqzBSDu6HKzyiDM8BskVqbRYgJhHSOkhidiBlsAG/955gMJ/Z3+S/Jdunmh7MO4kiqTRKvmNjLgBKBwO0hhShj4I1GCZZbCLSI5wqzcuZyG6cpVUc/B/+zDi0D5onkRzdl2hUqn9uZ6sdYmTwfVx5bNCq8gzbJz8A8uHsfojaO+jW/18RLPjWcy69IeqrcDHoXFXlm38/NLaY1KanMReKFo3RDFsPM6hN5gs5h3g8y0HYY/CdhhSF+7DiwpZQ38naZnaXeSabV35O/ZbF5K6/QXRLyAD3FHkpff7wnXKgod7PdRMgJcPSi0URnTRrMJ5yuqf6IVnXwB5P4h1ABtNbDj1ikmL4f19ewJh0a1gl/60Dzj4/R0BlCkIaolINDlIKUzuvr9XEDcW+CUm6UZtWP1vRsC8ByBE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefa109e-fea6-4861-43f0-08d6e98b1168
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 07:54:41.9486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3063
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Looks like there is a pcie issue on R-Car M3-W  WS1.1 Salvator-XS board wit=
h upstream kernel.

As we know M3-W board has 2 memory banks

Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
Bank #1: 0x600000000 - 0x67fffffff, 2 GiB

I am using PCIE-ethernet  card(Ethernet controller: Intel Corporation 82574=
L Gigabit Network Connection) for pcie testing.

With default configuration, it detects the ethernet  card

root@salvator-x:~# lspci
00:00.0 PCI bridge: Renesas Technology Corp. Device 0028
01:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Conne=
ction

However, if we enable kernel configuration for PCIE-ethernet card(CONFIG_E1=
000E=3Dy)then i get below crash during boot

[   11.999119] ------------[ cut here ]------------
[   12.004979] NETDEV WATCHDOG: eth0 (e1000e): transmit queue 0 timed out
[   12.012734] WARNING: CPU: 0 PID: 0 at net/sched/sch_generic.c:443 dev_wa=
tchdog+0x3e8/0x420
[   12.022206] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.2.0-rc3-arm64-re=
nesas-00004-g2e3a083-dirty #25
[   12.032728] Hardware name: Renesas Salvator-X 2nd version board based on=
 r8a7796 (DT)
[   12.041772] pstate: 60000005 (nZCv daif -PAN -UAO)
[   12.047756] pc : dev_watchdog+0x3e8/0x420
[   12.052948] lr : dev_watchdog+0x3e8/0x420
[   12.058111] sp : ffff000010003d00
[   12.062557] x29: ffff000010003d00 x28: 0000000000000002
[   12.069000] x27: 00000000ffffffff x26: ffff000010f1c000
[   12.075426] x25: ffff800639324430 x24: ffff000010f4f740
[   12.081829] x23: ffff8006393243e0 x22: ffff00001104c000
[   12.088207] x21: ffff000010f4a000 x20: ffff800639324000
[   12.094564] x19: 0000000000000000 x18: ffffffffffffffff
[   12.100903] x17: 00000000000040f8 x16: 000000000000403c
[   12.107222] x15: 0000000000000001 x14: ffff000010baef68
[   12.113520] x13: 0000000000000000 x12: 0000000000000000
[   12.119809] x11: 0000000000000002 x10: 0000000000000002
[   12.126077] x9 : 0000000000000000 x8 : ffff000010f4f708
[   12.132331] x7 : ffff00001015d06c x6 : ffff000010f52000
[   12.138574] x5 : 0000000000000000 x4 : 0000000000000002
[   12.144798] x3 : ffffffffffffff50 x2 : ffff000010f6f7d8
[   12.151022] x1 : 6610066f85848800 x0 : 0000000000000000
[   12.157235] Call trace:
[   12.160547]  dev_watchdog+0x3e8/0x420
[   12.165081]  call_timer_fn+0xbc/0x400
[   12.169596]  expire_timers+0x110/0x230
[   12.174194]  run_timer_softirq+0xe4/0x1a0
[   12.179047]  __do_softirq+0x114/0x578
[   12.183542]  irq_exit+0x144/0x150
[   12.187665]  __handle_domain_irq+0x60/0xb8
[   12.192558]  gic_handle_irq+0x58/0xa8
[   12.197014]  el1_irq+0xbc/0x180
[   12.200913]  arch_cpu_idle+0x34/0x238
[   12.205308]  default_idle_call+0x1c/0x40
[   12.209961]  do_idle+0x1fc/0x2f0
[   12.213895]  cpu_startup_entry+0x24/0x28
[   12.218540]  rest_init+0x1a0/0x270
[   12.222671]  arch_call_rest_init+0xc/0x14
[   12.227417]  start_kernel+0x4a8/0x4d4
[   12.231818] irq event stamp: 40197
[   12.235962] hardirqs last  enabled at (40196): [<ffff00001015d12c>] cons=
ole_unlock+0x3ec/0x5c0
[   12.245376] hardirqs last disabled at (40197): [<ffff0000100817a4>] do_d=
ebug_exception+0xbc/0x178
[   12.255042] softirqs last  enabled at (40174): [<ffff0000100f13a8>] _loc=
al_bh_enable+0x20/0x40
[   12.264434] softirqs last disabled at (40175): [<ffff0000100f17e4>] irq_=
exit+0x144/0x150
[   12.273278] ---[ end trace cfa1ae1709343a35 ]---
[   12.278880] e1000e 0000:01:00.0 eth0: Reset adapter unexpectedly

Q1) Has any one observed  this issue? =20

It works without any issues for the following cases with upstream kernel.

Case1: Use the below commit[1] from renesas-bsp

[1]. https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/=
commit/?id=3D561e15db1ed8c5cc2fc340796e2d1c643111d27a

Case 2: Disable the bank#1 from device tree

+++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts
+#if 0
        memory@600000000 {
                device_type =3D "memory";
                reg =3D <0x6 0x00000000 0x0 0x80000000>;
        };
+#endif
+
};

Q2) Could please share your thought on this issue?=20

regards,
Biju

