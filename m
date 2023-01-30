Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C636819B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 19:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbjA3Syn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 13:54:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237541AbjA3Sym (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 13:54:42 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2093.outbound.protection.outlook.com [40.107.215.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11992B094;
        Mon, 30 Jan 2023 10:54:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRT9XFIPxW33TbaX0lvd9jgnib186oM8bmEoqzKxGXUvZ8Chc1wJlV7q0H/LYIDy8fblhS1RW1iTkv7oEmQsgfcXkVvFPHEVo8MUZO0v8OkIZLNQNCWW+bYKUku5tq5dH74r41WuI6wdCr6upvKjZpu/kS9y3KzJJF7svFtavHe7xDXClG23oR5EoKGG1jhdE8vpBCuXvIx2VrTr2s9rH5r+2v9rK+4Lt+Izi1KeKs7pv5uHq5N9Z6DHITbhvo0utiD7a1rqv+4x4B8s4TlM50NXzNrytf3LRunOb1CgOq5dn/enkVJEGUPiEE23so4NfQkyC0RsUIEaLACbcuD9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0J4HycYXS4cl5g/ed8Z9+ZmTH4HlDmDov+h/iCNJGE=;
 b=MHO4gH0zGeYewnSMjg/e0Pbgldf0tiMqcUVTbZW0N7I5BDh7fnqnf4PTecbDujTnmtHWLEMDoffTMxHwjZD0JJkK8KhsPXKWqntDHdMR7VtNCDbAvbAoIfYUrNWeOc96jbnPictjRnxY02Coh2fDPXvRh191F3zrOV6ZHgei6h/sJBiTEZckPpB7ygYBmxyayGBFW6gJs40BINyYNxmCJLolNeZOQbu5yoI43agQ0olMs2mDtC1KlKKYfgCnvr7xmjhVBoo/cmuuSd6OauDivFtKnDyzstSsaWqgcjm2glgueiRC9ykW5EuPVJKBxs6wdfpm28KJ9FCHyabrRwdIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0J4HycYXS4cl5g/ed8Z9+ZmTH4HlDmDov+h/iCNJGE=;
 b=opagAaNuBzHzrkRfvBYpPZZPD/2nBEHfh+LbS664Xxz3OqjUexp833Ht4KqVpEren3f/bEvpM8KGBjf0w+kQ4bM6eswpj7ueBnDfrO+x4vCcv0EZZILVCdbUB1AW4PLyB+Ru8Vyu0mOMCxdWahfvMzxazVwZqTE1Gb1RLWiZCpk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10389.jpnprd01.prod.outlook.com (2603:1096:604:1fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 18:54:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 18:54:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Thread-Topic: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
 detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
Thread-Index: AQHZNFRzWGTdb9Qh20GbjjeGaxR0fa62s0+w
Date:   Mon, 30 Jan 2023 18:54:36 +0000
Message-ID: <OS0PR01MB59220EFDE43A39D61FC73E2786D39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202301301054.KVvGA5XO-lkp@intel.com>
In-Reply-To: <202301301054.KVvGA5XO-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10389:EE_
x-ms-office365-filtering-correlation-id: 081d93ac-3cd2-4641-a4c7-08db02f36f2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PV9q+WFjfnQ3oWYD0oL1+DlIL372Lami3EJVzntnhcJC6OcvFcZPn1XTvSpMu8+yjrjXAN0QmPccml+QBSzUFyaaYtSvbgob/XK2n9kNyOnS4BSLIbmWvKbeI0/O+rsILFYOkFD7SQKmoMIhXc2n+5LrpMeJPmuH9WWvROkfS9UQhvywVtYv15qW7MSvvXz+jTXS90KVB7QkxIjBRF5FnioTvJl0hks/F4uFMnqWzeMMXh2eqNUZ13yN9ie5grHRHf31docBoE18UlvwrE9uvq2GbZKEw2dji9kRoWUcI6esPtvVYlU9RM77EPZyoNA93oxZ6Yk9NP5MIeI5ANIPFV3pa3mdMHQpRxB5eO8qiXUZAJwiU/w2IH7fJSaf5584GQMuC8c6rQty7P3QDpmZ8gea59uOAVP0hpoPbJ4o55+URnMA7PmicGPar7WHykDYBcCf8xQzrBwgC1mmghPy1nB6VmR1qrpIuUMEtzsROBdHx5bULQD/5OWLHBbL6jGDSjYt5xLOe2IYItF+FB513g42ubRxi37tmz6/G/iG/BM57BR4m2ODnC1TtSl+OkexgGjFc0Vgo9s9pk5PExsXaDjMzhYMJf30+BiZ0c4tjASWGKIr/a+rFbZ0paeHhG0F6X1miY6IlOSIvZBmLBBAjbuwX7AAN98vmDSmQYSnySvIrwo2KcMQTnSIwNCqxR3XXdKuPDlmt7Rqm2jjCdq+omy66A0+yG5HPN1VY2/y4xw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199018)(186003)(71200400001)(7696005)(41300700001)(83380400001)(966005)(9686003)(6506007)(478600001)(26005)(54906003)(110136005)(66946007)(316002)(45080400002)(66556008)(76116006)(122000001)(38100700002)(64756008)(66476007)(66446008)(8676002)(4326008)(5660300002)(55016003)(2906002)(86362001)(33656002)(38070700005)(52536014)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XFUhle3/CMXmzcQwtUZmYfxQ7iuXmur+aN5+O8FwevN33u+yQDgogMYVZjHn?=
 =?us-ascii?Q?GdWVt8RDfnufEbKTY0HdJJrRznOX0P01QFtjOs5xchRY8rxLv4/7lGBikRD3?=
 =?us-ascii?Q?2l7kjG5rEHyDFqp3us0zkqZfKIs3wYRVipk7OgILppN0EdOirl6GWf3pqXYo?=
 =?us-ascii?Q?prv4QpOtC362cUGd41Q4vFzhl6Pp62K3H0SRGKNFzcQxiJBdPgrGAh0Dyzx7?=
 =?us-ascii?Q?fIAwi6qb6TfyR0MSHZtNmJlqBA41p7m51YsIbkaaMyu97ENBCoUOK5BETQBO?=
 =?us-ascii?Q?6BNvEi751dswYN5HBx7ApRVMJdx6lZ93CKl8drrVbByWUKYPak8iGOdGzB3L?=
 =?us-ascii?Q?IZzbmEz2dM1GVhPs/F6KUPVT/evZ+GozyH/WCY0XAn3ctTHBowxVKYnVw5l+?=
 =?us-ascii?Q?qxlpGgpHJVV5+dgEQi1+9I48tvgd9qeGmdRvPHNmgWOvHVLPVl26NiIJkEPn?=
 =?us-ascii?Q?nMRKYbv2W7ZAqd1Xp5jPz3LvaWNqJsyt0+U8XqbHqEJXyc+fcbqESxxkyo9w?=
 =?us-ascii?Q?C2IvZSXHzOF37rxZiIGGhmbH5uzV6p2CDFShK02nQXgpPxSCWhAU90ifN3ki?=
 =?us-ascii?Q?+j+P5Xi72+l95EFWyvUpTj6HZoFa/C+42JySc50cgRZKqz2YsVG5buip6kLG?=
 =?us-ascii?Q?lgpj3u4l4+oBpqfkaPolFea1kZ6JOVduIkNcYuTDhoEPz2VhpPpgO3oO2BCw?=
 =?us-ascii?Q?5XoQxvOUqUL6rOFiY+1XxqRxAI0Kf5COXHT+k139gD3g20m/WPyRyWJj8T8P?=
 =?us-ascii?Q?oQsmi9nVgOR1WKiHg6eWWKzgBPqXvjwT81F6t3AqKUvph/BkgfWDgYwcB5a/?=
 =?us-ascii?Q?hfYfws6M8m5yAhLZ1iNxAWKGsf+tAjlk+cvvbRh8BJNVPHESshbYyVXG2Nya?=
 =?us-ascii?Q?XwIXip96c9sMWggNFDg0mhq6WESadCD1/vgpu2F5npey/d2LWtv9KROmpItW?=
 =?us-ascii?Q?YO2bvL5gfhjZO0TLKV32idhJ+OXqT0/jGbXVZu/9L0vhXvQdEkl+iq/5pJkw?=
 =?us-ascii?Q?2z6WY/JunOJc/5SqH9nW61GWCMeKzlPMu9cCkJt43JqmKqxrM9lz0hRy00ul?=
 =?us-ascii?Q?j93EXi7JnwXjz0FZ59piilAwtXhtsjH0dgmAkGW36JRQs6MhioDDRBNXikrs?=
 =?us-ascii?Q?wxcepqutcQFyua6zTeLS1aNbDNi52efPURG1F+9vtfk1ziBTjUJhcE4wnhoQ?=
 =?us-ascii?Q?dKVipT6EbHk9hqkKxgoWQPP3KuV2po5I/mU+wMu2hNrm+eKKjXRhYDL2RyYH?=
 =?us-ascii?Q?Bone0bc3zO5KgRpdsACWwCPoyhEVKqg3Dlj8gYTfcdj07Kg5nCP4ENF4RAht?=
 =?us-ascii?Q?H35baRnb2UEiDCQR04eQMcjehxsmsrGn8dz/GkF4Aw9s34tbR5W1J2exaV2o?=
 =?us-ascii?Q?UwnelRrPfb2vJMbGXAT1Y5T6ms0AtZ3sLJxPXscxDQ+BimSqK0UFhP8b4r+w?=
 =?us-ascii?Q?KFDaKPENlp/NHas5qzdNle5sy+65ZKU0l4HCH2Ig9v4/1UWhQDo0CkwA4pYv?=
 =?us-ascii?Q?ilsDrS14UClBUxcYO35n2CAjJH96pmU1GhgE6AnS/dXgUJMYZ1zVICLIPVM+?=
 =?us-ascii?Q?7cAIL/ibLM2MOO02IfgymcoS6G2+We7N5WWIDck5H69JeY9xxu8iqRpLdfXa?=
 =?us-ascii?Q?SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081d93ac-3cd2-4641-a4c7-08db02f36f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 18:54:36.8069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWXIeimsm1w03ITlscmL+1Uhb4xfImy02vV44nYsr2ysD5xJ/c1s5RPgnlFWUFneTjCaxWaLlLzcJ7uJuREX6hTxYW0gpLyusOAI0d7q//g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10389
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all,

> Subject: [usb:usb-next 35/35] kismet: WARNING: unmet direct dependencies
> detected for USB_RZV2M_USB3DRD when selected by USB_XHCI_RZV2M
>=20
> tree:
> head:   c52c9acc415eb6ff54f658492f8c53da0fc3528a
> commit: c52c9acc415eb6ff54f658492f8c53da0fc3528a [35/35] xhci: host: Add
> Renesas RZ/V2M SoC support
>         git remote add usb
>         git fetch --no-tags usb usb-next
>         git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
>         # 1. reproduce by kismet
>            # install kmax per
>            kismet --linux-ksrc=3Dlinux --selectees CONFIG_USB_RZV2M_USB3D=
RD --
> selectors CONFIG_USB_XHCI_RZV2M -a=3Dcsky
>         # 2. reproduce by make
>            # save the config file to linux source tree
>            cd linux
>            make ARCH=3Dcsky olddefconfig
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for USB_RZV2M_USB3=
DRD
> when selected by USB_XHCI_RZV2M
>    .config:4492:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' inval=
id
> for ARCH_MMAP_RND_BITS
>=20
>    WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
>      Depends on [n]: USB_SUPPORT [=3Dy] && USB_GADGET [=3Dn] && (ARCH_R9A=
09G011
> [=3Dn] || COMPILE_TEST [=3Dy])
>      Selected by [y]:
>      - USB_XHCI_RZV2M [=3Dy] && USB_SUPPORT [=3Dy] && USB [=3Dy] && USB_X=
HCI_HCD
> [=3Dy] && USB_XHCI_PLATFORM [=3Dy] && (ARCH_R9A09G011 [=3Dn] || COMPILE_T=
EST [=3Dy])

I have investigated this issue,=20

Just for testing, I have reverted Arnd's patch[1] and then done the below c=
hanges=20
which is fixing unmet dependencies reported by the bot.

Looks like USB_RZV2M_USB3DRD should depend upon both USB and USB_GADGET. Pr=
eviously
It depends only on USB_GADGET.

Also the USB3DRD driver should be in "driver/usb/renesas_usb3drd" directory=
 instead
of "driver/usb/gadget/udc" as both HOST and device ctrlr need this driver.

So not sure,=20

1) Use Arnd's patch for fixing this issue

2) Use the changes from [2]

Or

3) Arnd's changes + changes from [2].

Please let me know.

[2]
diff --git a/drivers/usb/renesas_usb3drd/Kconfig b/drivers/usb/renesas_usb3=
drd/Kconfig
new file mode 100644
index 000000000000..6205d815d283
--- /dev/null
+++ b/drivers/usb/renesas_usb3drd/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config USB_RZV2M_USB3DRD
+	tristate 'Renesas USB3.1 DRD controller'
+	depends on (USB || USB_GADGET)=20
+	depends on ARCH_R9A09G011 || COMPILE_TEST
+	default USB_XHCI_RZV2M
+	default USB_RENESAS_USB3
+	help
+	   Renesas USB3.1 DRD controller is a USB DRD controller
+	   that supports both host and device switching.
+
+	   Say "y" to link the driver statically, or "m" to build a
+	   dynamically linked module called "rzv2m_usb3drd".


[1] https://lore.kernel.org/linux-usb/OS0PR01MB592264B5D8BB98A1B2F759C086D3=
9@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t


Kismet results:
(env_kmax) dasb@ree-du1sdd5:~/linux-next$ kismet --linux-ksrc=3D. --selecte=
es CONFIG_USB_RZV2M_USB3DRD --selectors CONFIG_USB_XHCI_RZV2M -a=3Dcsky
INFO: Computing the build system id for the Linux source..
INFO: Build system id: d48d1edf73bf
INFO: Kismet will analyze the select constructs of the architecture "csky" =
for unmet direct dependency.
INFO: All times reported are measured using Python's time.perf_counter() ut=
ility.
INFO: Prefetching the architecture kclause formulas.
[STEP 1/3] reading kextract file
[STEP 1/3] finished reading kextract file
[STEP 2/3] translated 15981/15981 configuration option dependencies        =
                                                 =20
[STEP 3/3] converted 16084/16084 constraints to smtlib2 format
[STEP 3/3] pickling the map
[STEP 3/3] done=20
INFO: Architecture kclause formulas were loaded. (686.24sec)
INFO: Identifying the select constructs.
INFO: Identification of the select constructs was done in 0.02sec. 1 constr=
ucts were found. unmet safe due to syntactical pass: 0. alarms: 1.
INFO: Doing optimized SAT pass for 1 constructs
INFO: 18:33:24 Optimized SAT pass progress:  1/1 (%100).
INFO: Optimized SAT test was done in 0.02sec. 1 constructs with alarms were=
 checked. unmet safe due to optimized SAT test: 1. alarms: 0.
INFO: Doing precise SAT pass for 0 constructs
INFO: 18:33:24 Precise SAT pass progress:  0/0.
INFO: Precise SAT test was done in 0.00sec. 0 constructs with alarms were c=
hecked. unmet safe due to precise SAT test: 0. alarms: 0.
INFO: During precise SAT test, 0 models were generated.
INFO: Skipping test case generation since there are no models to generate t=
est cases for.
INFO: Skipping verification since there are no test cases to verify.
INFO: Writing the aggregated summary txt to "kismet_summary_csky.txt".
INFO: Aggregated summary txt was written.
INFO: Writing the summary csv to "kismet_summary_csky.csv".
INFO: Summary csv was written.

(env_kmax) dasb@ree-du1sdd5:~/linux-next$ cat kismet_summary_csky.txt=20
=3D Overall analysis =3D
Over 1 select constructs, unmet dependency analysis resulted in: 1 safe, 0 =
alarm.
The analysis was done in 686.27 seconds.

=3D Timing results (seconds) =3D
Prefetch arch formulas     : 686.24
Identify constructs        : 0.02
Optimized SAT pass         : 0.02
Precise SAT pass           : 0.00

=3D Per-stage results =3D

=3D=3D Identification of select constructs & udd analysis through syntax =
=3D=3D
1 select constructs identified in the architecture.
0 select constructs were found udd safe through syntax analysis.
1 select constructs were found udd alarm through syntax analysis.

=3D=3D Optimized SAT pass =3D=3D
1 select constructs with alarms from the previous stage were checked during=
 optimized SAT pass.
1 select constructs were found udd SAFE through optimized SAT pass.
0 select constructs were found udd ALARM through optimized SAT pass.

=3D=3D Precise SAT pass =3D=3D
0 select constructs with alarms from the previous stage were checked during=
 precise SAT pass.
0 select constructs were found udd SAFE through precise SAT pass.
0 select constructs were found udd ALARM through precise SAT pass.
(env_kmax) dasb@ree-du1sdd5:~/linux-next$ cat kismet_summary_csky.csv=20
arch,selectee,selector,visib_id,constraint_type,analysis_result,testcase
csky,CONFIG_USB_RZV2M_USB3DRD,CONFIG_USB_XHCI_RZV2M,0,0,UNMET_SAFE_OPTIMIZE=
D_PASS,N/A

Cheers,
Biju
