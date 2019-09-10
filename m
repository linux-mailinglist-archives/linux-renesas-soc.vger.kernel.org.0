Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 293B1AE329
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Sep 2019 06:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730541AbfIJErJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Sep 2019 00:47:09 -0400
Received: from mail-eopbgr1400097.outbound.protection.outlook.com ([40.107.140.97]:61435
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730485AbfIJErJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 00:47:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTFbvFMjoIfvExphX/MMLWyFqC45hlttGvN3vWAgIdQLPjXZkxQPtO7PVuasPV3PT4kJgMM7ezhm/L+yooh4Z2ubIXguYqcbcfRKlGnre4SPW8XWazu0+SshFPnmA6/spKZZgjO+km9KyL6A6yMuS4XziwS0SrBc5wT3EGTJdVrJU82+yYjXGA/Rs1/H2qs2guilgQH344vPhNG+Wf89rJYvaV0SvzeP93grS0bY1ii3AAPfz4ODPLyrTrjEDnvgDmBo5rWCBqzw2D/5LKqR7S5Mk8cwXWksU94owiW60QtXAfL+CU6+fdg7jAdWNdjR1UWnBxROnknWqnmmgVdYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScXAKSZhNJEJjQNYEYq+rtckiCxVsRpJXAUb++QCQDU=;
 b=Y4UozjIt9sFFodHvyHz8W6jPYb8DMIq5XqUXZET74JdEYAMMSX2mSpUC4uxXdTWU2U5jDPTk4RAbVZG8RMnfsRtSuH0JefjVsNdE/FztQlJ95JHwEflEvTY1CLMtouxVjK60Va2AUQJVwOpj0cMzcDFvF4geqPW5Kpfvakl1QacbMVNdw52XP36boVXth2xQsRQiPXOFoTVKPIKYsNh7MVP11Rmx6Ax1iY7+M7xmS8/LBkucshkZk+SFP/IY1sUnH7amFlfSfWWlu0PzOpKhongFtOjKO0HIB89D59uBE7YPsO7MMcdt4dt3jzj3mFRpYX9p1be+kPeLCFb4URVOQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScXAKSZhNJEJjQNYEYq+rtckiCxVsRpJXAUb++QCQDU=;
 b=EaVpFf8Sf7WPL+uwAs7akM7XotF5+AG2Lj146QJVPa7syLo10NkYQT4VzNIZQ1l5Fb7YVBAkcb8JSHDQe+RK+r2GQ+OqS1K9zIgiiH6Oi6awelMrNAZC8/XSycQoqJOrbsPHIkyG88Y7sMG+tkieHWG8yNqtFw6FDSpZ/PINMEI=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2976.jpnprd01.prod.outlook.com (20.177.103.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Tue, 10 Sep 2019 04:47:04 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7da1:bfc1:6c7f:8977%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 04:47:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Veeraiyan Chidambaram <external.veeraiyan.c@de.adit-jv.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: RE: [PATCH v4 3/3] usb: renesas_usbhs: add suspend event support in
 gadget mode
Thread-Topic: [PATCH v4 3/3] usb: renesas_usbhs: add suspend event support in
 gadget mode
Thread-Index: AQHVZyXBJNDgTLI4ZUe9VOVOl9x8o6ckVu8Q
Date:   Tue, 10 Sep 2019 04:47:04 +0000
Message-ID: <TYAPR01MB4544BDE02C5BEC2D032C85F1D8B60@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1568043974-1236-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <1568043974-1236-3-git-send-email-external.veeraiyan.c@de.adit-jv.com>
In-Reply-To: <1568043974-1236-3-git-send-email-external.veeraiyan.c@de.adit-jv.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29a40045-ef58-4737-dca4-08d735a9ed9c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2976;
x-ms-traffictypediagnostic: TYAPR01MB2976:|TYAPR01MB2976:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB29760CEA9654DE5D82918528D8B60@TYAPR01MB2976.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(199004)(189003)(76176011)(6506007)(55016002)(86362001)(6246003)(53936002)(9686003)(25786009)(6116002)(102836004)(14454004)(3846002)(64756008)(316002)(66446008)(229853002)(76116006)(52536014)(7696005)(66946007)(66556008)(66476007)(4326008)(107886003)(6436002)(5660300002)(2906002)(99286004)(81156014)(8676002)(33656002)(81166006)(7736002)(305945005)(8936002)(486006)(110136005)(478600001)(54906003)(66066001)(26005)(186003)(256004)(14444005)(476003)(71200400001)(74316002)(71190400001)(11346002)(446003)(15650500001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2976;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BP+eNXf9okVVAOP6WGoQu2Wh8aiklqYuesoU0ApMV5RLFXKkGv+DxjOfLP9f4m9V8Pu77yJfphJ5Gsf2uDrIh9GDBbgPNHVQv0UYfSn0ThapPVEMaJra/iK+AdSOsDhLHhsfD5Dxa1AUU0sr+DsuEFO1tkoFVFnx74JFfwEoqWWhTGNtcPe1V/C7+ZMMhK4KFwDwVOFj2mkcVn3C4m8xHfsTg5jEE68Ru84YKch/zaOrnpZwO0o2T1SEW+9RnXvCMJ9nuC7DHXaR0ENmvKb7ovZ9QepyfYiv0353n2HCCBp/SCUIgBR80qMRKaXkzVr05NDGe7W21+b7JvDecmmz7pyKcrn/7Nz/t7myehB4Ym2JZx5scmqb0JtzeoPzzvfhyku6X+MqCV9bYAFdJKWZb/jrSZOtSXszDqfU+QszIlg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a40045-ef58-4737-dca4-08d735a9ed9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 04:47:04.7190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mNt1mrfc/Vc4wvbZCi21KAx1cgGmATjRroZINkcOE8MNMR11W6xcxH8CJE89sJp43SrDa/9WxOSg3hzsdKAiZmyy/Xfgc/0veZ5dcM3ObSRWWoYkXXGlc8AliE/d/A2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2976
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Veeraiyan,

> From: Veeraiyan Chidambaram, Sent: Tuesday, September 10, 2019 12:46 AM
<snip>
>=20
> When R-Car Gen3 USB 2.0 is in Gadget mode, if host is detached an interru=
pt
> will be generated and Suspended state bit is set in interrupt status
> register. Interrupt handler will call driver->suspend(composite_suspend)
> if suspended state bit is set. composite_suspend will call
> ffs_func_suspend which will post FUNCTIONFS_SUSPEND and will be consumed
> by user space application via /dev/ep0.
>=20
> To be able to detect host detach, extend the DVSQ_MASK to cover the
> Suspended bit of the DVSQ[2:0] bitfield from the Interrupt Status
> Register 0 (INTSTS0) register and perform appropriate action in the
> DVST interrupt handler (usbhsg_irq_dev_state).
>=20
> Without this commit, disconnection of the phone from R-Car-H3 ES2.0
> Salvator-X CN9 port is not recognized and reverse role switch does
> not happen. If phone is connected again it does not enumerate.
>=20
> With this commit, disconnection will be recognized and reverse role
> switch will happen by a user space application. If phone is connected
> again it will enumerate properly and will become visible in the output
> of 'lsusb'.
>=20
> Signed-off-by: Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on my environment [1] and works correctly. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

[1]
 - Two R-Car Gen3 boards.
 - Connected a usb cable to each CN9.
 -- Use g_mass_storage.ko.

Best regards,
Yoshihiro Shimoda


