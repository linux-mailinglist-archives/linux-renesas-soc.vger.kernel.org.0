Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F073963257B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 15:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbiKUOVK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 09:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiKUOVJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 09:21:09 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80227DF8C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 06:21:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvrf3TzzaMZMrwm6wjSQ309GBPKw4yrQm2oBkAMs8/2ubxsJ9UMRmdRgHALQ9alodbCaPbyl3N0m9AfHhIlPvlaX2LiUyO/PqJLGHrpuYWlCZ3gh09nlKWpclugLS4pjoXbHg3SO1VL3LnZiBO8mSOmP2iGP+7hHfTsaF9JSjPMwvLaxvgs3eEPrvcdHZxBG7wzUd6aPl10qdPtPjyVb8ZmDktrb2NP75kkW7QeisB3cDK0ZqLytsAObBxSI6xYluQgs5vQhijLMwnQcHfIdsKTKAHUpv6za7bGO10rjJI30gQFTaLXBS0nKspMZRD1Ja0CKvvg8ZjuT4QYwB4aSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fw5kUncOkj/3HPfXyLuDEfMwwkRSabVhNSE7wHnIAHU=;
 b=fFYQzNRbjemrDyIqu7VWpeV/06GedEgN8s0THXpjW9QEsqd1seUv8c9b16lGBtecu+AcS6+1FTnP4rxiQ7xHOVJfLZKe6K1xrU/O0/bVtnNdJe5sgImSAKLxkU+Mkz0YyzvGwZMmflNFgOmE+Lsy0T6D3WQYmOoqsonEvLkn0CMfCk+iaj6E6KgNx22POj0E4IyS0Fe+KIrySVU0ZvVQPr8Btf/bBTHlPeroHU2l1rTuuW9s4kF4xmA1YNaNcYSzlNjYoKd12f0wHhY6hhdq0fbFvF8fKTn0RGJNqwPh3upHU0wF38TzTtsojgrl+iZukxM92Xvjm+ZJ6ipU6pK1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fw5kUncOkj/3HPfXyLuDEfMwwkRSabVhNSE7wHnIAHU=;
 b=YZLHJ8t+o3n22c4NPF2gZ7z99NhRcRgt8QdqNWuungealQNJtpQYYSRtdYZgk3KmVjWZUfBD778hOdJPqFcOHX1sRyEt4Nu2alPdHmYb+YkN0hxE5XRKOzUlCpkhiXyuPDoxkH7QyBoU+dtXi2NwqUX54C3Pr3ZHAVe4c5w/NWU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8188.jpnprd01.prod.outlook.com (2603:1096:604:1a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 14:21:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 14:21:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>
CC:     "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [linux-next:master 5779/9537] undefined reference to
 `drm_bridge_remove'
Thread-Topic: [linux-next:master 5779/9537] undefined reference to
 `drm_bridge_remove'
Thread-Index: AQHY/Z01dtCkeFgMOUG6C+5ZUEDBt65Javqg
Date:   Mon, 21 Nov 2022 14:21:03 +0000
Message-ID: <OS0PR01MB592298E75153A52245D789D4860A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202211211917.yLICUnMb-lkp@intel.com>
In-Reply-To: <202211211917.yLICUnMb-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8188:EE_
x-ms-office365-filtering-correlation-id: 874084b7-a452-43a8-675d-08dacbcb9f08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NCOT1yMSnxKdYUYUrOKgUxZ4AMzjtF9jwXa7jvBPX/JgHx1+J4jnKEfH43ASno8M9w3TVCeON5slC9TAD0c1ZmQaeT4R2a5qJw+V+TXPQYtCwRYtwWQxNmAP91b9NkW/chxyJNV1go0FbynA3l5/KmNCh20znHF+RUJR00QVY/PnpqUwp9A2xFOFRomVHr/jPhDYBXNxftWS3chuhkt42BN4qP50XinMF/m+bExgyHk4E2jhDNE9WurLM1M8cLojOqrhJ7JToLFjw7FCZ5MEc5PNXd8EMnRM0pSOV2FqLB6/+UKAuEwUS+HaHrhSD0lEraLTYmC36BidTbkf+n0F9Dyf6O61QuzZ6NINqyXA8c8f+gqA2ierqtVfOBqg/BFFlSV7DyOeaDaTsAp0+X27IwFApqZrFNspVnLnbymlUpJmdi+HYsX9OB4tyh/Rf/U+kfuFK8AYloDnwygVsLWw7hGvFxVaOx44QJbr/t9LRrg8A4GRdSaf65ZKTL2f0YEXid/YZ7kXNbqGuKYw62gvEbAHq/qBbAiBuybfMInjOmY77M96mbTiEGLLZa1T5eH09y470H2xwF8LFnkIW/nuVZLjPwHMax+IrZ+sMd9esmRDKg/OBB5oxXeJWuPNfFqLGpSRYbpFOylt6FPAXjCKC8F3JjxZ0qqyikOCyHosbF3Ng86cfVvn4KljXZU1p8GdswH7xNA+/pgM9mqtLhmpZyhseO8+yaECSt/IMRUzkBU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199015)(33656002)(54906003)(86362001)(38070700005)(122000001)(26005)(38100700002)(6916009)(186003)(52536014)(9686003)(83380400001)(2906002)(7696005)(5660300002)(8936002)(53546011)(55016003)(6506007)(478600001)(64756008)(66556008)(316002)(66476007)(41300700001)(8676002)(4326008)(76116006)(66946007)(66446008)(71200400001)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QZZUBgE76pRj4HCduJntLJSiv1UFmrfbwCDujDAcG781Me2eDz3KaeVWMbB5?=
 =?us-ascii?Q?1qec1kb1P9RlvWDxbzguX/v0N7qbzvCNliwvJkLWBAqNveTeAst5nyYozCeF?=
 =?us-ascii?Q?Krp5J9R0HXSMPAN4sXwYS5YZK/cKCu0xfQode4oijjcW49oOMlBzJtgp1ciK?=
 =?us-ascii?Q?9jPCuGoRMJTB2AlI050rCHcbiOgusHekO71QRXOJUSGWbolV26qZ6NEpM+BX?=
 =?us-ascii?Q?En37Knm0XQAxm39uX4706vmlEPb+E8EMnHMLRTVwxOeGY9y056X+oZ7e5oOt?=
 =?us-ascii?Q?HDdITCcQQ6tLLHlmEVN3I5GMGkpgoatjPNsRdwkPQ60eIW4EnUPG4PE3KIe8?=
 =?us-ascii?Q?aPiu3YVn58GZjARdPs7Re77o6XfGE7CjZnj7dFeiqXvt/FaUwN3MKdFDYo4i?=
 =?us-ascii?Q?jb1MfL8eqpqMPOuMUMtmKMs7DSP2+aM2usLRzlUtbpJEsrK3NHkT2hnM4hIQ?=
 =?us-ascii?Q?xg7UqfkTGtdGhpcTSlZJGeYKNfTwXmamDiBB+WIJnWLWNqcByL2diQx71PWE?=
 =?us-ascii?Q?iP9GxrHoT/XWmiiRFUOrlXv11b81zfA4VvZEb0JX7kZXEouq79YN0LsSfmfW?=
 =?us-ascii?Q?6uxr43vt+x1NdBGVZi7/DyJETaqxtbnD1fJYDJXQ7VjEweOIIyJRCPXVm9n7?=
 =?us-ascii?Q?34iGYK6a3IrZ71OJhjo6DdmYVtrNP2QjMhQY2WVQZ5J3KXfn7PKhPFnTUlJr?=
 =?us-ascii?Q?mD19yagERzJegBo1wOGyVA5A2Jq0Hf572Xw14ns5dWwN0DqbTgdm0Aj0CEFr?=
 =?us-ascii?Q?qr/eqkspHhqQs74JOGAQ1g4trEovytif7XnXrT+milYFmdt302Akwlwvbwyp?=
 =?us-ascii?Q?fIWp2icgaRHgY+pODVl2Q4DNlDl41N5W3/en3RpQjCVBOfBpk3oUz/QHkRhW?=
 =?us-ascii?Q?kAF8tDg/I/N5abLOwsNaYdmlsspJIhcDkFsDG5yh+iLKGQ5e/gdiMcofWEsm?=
 =?us-ascii?Q?ar+0rAM7xtfIfa9Rn2THhNQ1vx90Nwvsjj6AFFfdNMmomNwuqMwQ9Lq9wDCK?=
 =?us-ascii?Q?TAyKkjur0xa3AUpy6M4y2+w7rJBmtiPUAELLVun6RMhLFtwz66xMqiK78zMg?=
 =?us-ascii?Q?ink7cB+fNJB9jsJD8IKVOXcTe6aw84fivI+/VBDPbBlbKr/j7wZOWkD5ShVo?=
 =?us-ascii?Q?t+JS1QYmFN5rIo77eAIYLQdirB3oI4oLOpqhD6LkEGRZ3DLpbAxpUJDLX23W?=
 =?us-ascii?Q?R9o/PPKd07FlCwl3w/WNqW5Q6o+tV/pS8QZEnp5Lu2fYw2FtNdF+gWiwDGX8?=
 =?us-ascii?Q?rFJ8+HqJAPR4/4UQiXxMAvjkFGerfWI/lN4jgebQ5jZaIT/UL81e/oHmNnnG?=
 =?us-ascii?Q?cDLwUkLKk3KasjGIRB9nOhYTY0vlugZtheat4dRto/ZZxoIPLIDIHsthOlH6?=
 =?us-ascii?Q?0wxDIosnhvG1Snazh/Rvr5K9vVytX5Xcz559NNTjibmFIODBwhGeuMX25Njt?=
 =?us-ascii?Q?AAKlEvY2de4nzupV/wgaNx5FldqWmX0T5Vr9XJmsYpS9rQjPe8B3Qo0cEWWj?=
 =?us-ascii?Q?SwUOCRDfnpgvWmoWRrEMbhBy9epOcMc5RCJ7sk1zkqwGUyyHnaOn1Zqi17GY?=
 =?us-ascii?Q?X+dSzZ1XPlT0X9r2mix+gmFTvsh2vfeA1oc4mooY3vuRSsYz9AUu1/uYe087?=
 =?us-ascii?Q?3g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874084b7-a452-43a8-675d-08dacbcb9f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 14:21:03.2649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9D0zRHmAgdw5QT3biUdRevtipRYPdGbRoQEuOefgF7BETAkV2MVWAIaziOAAkyK4ffk30iOxaiXZtr1J/40cCLEixc3O50Dneuc4gaGTm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8188
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi kernel test robot,

Thanks for the feedback.

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 21 November 2022 11:33
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev; Linux Memory Management List <linux-
> mm@kvack.org>; Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>
> Subject: [linux-next:master 5779/9537] undefined reference to
> `drm_bridge_remove'
>=20
> tree:
> head:   e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9
> commit: 7a043f978ed1433bddb088a732e9bb91501ebd76 [5779/9537] drm: rcar-
> du: Add RZ/G2L DSI driver
> config: microblaze-randconfig-r012-20221120
> compiler: microblaze-linux-gcc (GCC) 12.1.0 reproduce (this is a W=3D1
> build):
>         wget
-O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         #
>         git remote add linux-next

>         git fetch --no-tags linux-next master
>         git checkout 7a043f978ed1433bddb088a732e9bb91501ebd76
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss
> W=3D1 O=3Dbuild_dir ARCH=3Dmicroblaze SHELL=3D/bin/bash

I need to install Ubuntu22.04 for reproducing this issue as glibc 2.33 not =
available on Ubuntu 20.04.

COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross W=3D1 O=
=3Dbuild_dir ARCH=3Dmicroblaze SHELL=3D/bin/bash
Compiler will be installed in /data/dasb/0day
Please update: libc6
ldd /data/dasb/0day/gcc-12.1.0-nolibc/microblaze-linux/bin/microblaze-linux=
-gcc
/data/dasb/0day/gcc-12.1.0-nolibc/microblaze-linux/bin/microblaze-linux-gcc=
: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required=
 by /data/dasb/0day/gcc-12.1.0-nolibc/microblaze-linux/bin/microblaze-linux=
-gcc)
/data/dasb/0day/gcc-12.1.0-nolibc/microblaze-linux/bin/microblaze-linux-gcc=
: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required=
 by /data/dasb/0day/gcc-12.1.0-nolibc/microblaze-linux/bin/microblaze-linux=
-gcc)
setup_crosstool failed


>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>    microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o: in
> function `rzg2l_mipi_dsi_host_detach':
> >> (.text+0x68): undefined reference to `drm_bridge_remove'
>    microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o: in
> function `rzg2l_mipi_dsi_attach':
> >> (.text+0x9c): undefined reference to `drm_bridge_attach'
>    microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o: in
> function `rzg2l_mipi_dsi_host_attach':
> >> (.text+0x13c): undefined reference to `devm_drm_of_get_bridge'
> >> microblaze-linux-ld: (.text+0x158): undefined reference to
> `drm_bridge_add'
>    microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o: in
> function `rzg2l_mipi_dsi_probe':
> >> (.text+0x244): undefined reference to
> `drm_of_get_data_lanes_count_ep'
>    microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o: in
> function `rzg2l_mipi_dsi_atomic_enable':
> >> (.text+0x1d50): undefined reference to
> `drm_atomic_get_new_connector_for_encoder'
> >> microblaze-linux-ld: drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(.rodata+0x3b4): undefined reference to
> `drm_atomic_helper_bridge_duplicate_state'
> >> microblaze-linux-ld: drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(.rodata+0x3b8): undefined reference to
> `drm_atomic_helper_bridge_destroy_state'
> >> microblaze-linux-ld: drivers/gpu/drm/rcar-
> du/rzg2l_mipi_dsi.o:(.rodata+0x3c8): undefined reference to
> `drm_atomic_helper_bridge_reset'

In the config file CONFIG_DRM=3Dm and CONFIG_DRM_RZG2L_MIPI_DSI=3Dy leading=
 to the above error.

So I updated the KConfig file and it fixed this build issue.

-       depends on DRM_BRIDGE && OF

+       depends on DRM && DRM_BRIDGE && OF

I will send a fix for this.

Cheers,
Biju
