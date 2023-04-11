Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D10256DE07C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 18:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjDKQH3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 12:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjDKQH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 12:07:28 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045E5BD;
        Tue, 11 Apr 2023 09:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+PZJpTCwCUKOoTs+NfbmtvvBx9PXtjV807AZMmT3R2vcoovxxzBd7EM8bQQhoVs4peTKy6W+zNf5w6rip+ptOQU6CW8NTEcIN0VaFk4AOetHw0CWz/yhoYUUUI5BnNu3K6OcSS364yi4PEZZHZvke+nxsECConZYEHjDyt3aQl163f6/cNitl6SIDuyvE0LLm4BxyLJhlF58aipCu3CVzNTlWXqXLKx3c/WzO/5ycBldnczH+eCRkAmIJjRWbmCq3jaTLXSa+VMFHop2eEC65Us08e4AXQ+eC1iidBS5JqTGxaB9m0CPG0cDYtbJAdl7DyNKulT7tid3NdbFnbL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWPjczhmWkUuWxst+kXcg8VAIuDYzd9evRsYtD2Cv+E=;
 b=Sn7/Q6Zu/jgOVPvxzz0H++dKBwUq7m4y5BD17lc2g7NEl4my7O1SUzv+XOb/oqYG2Slqby5yAL2JrEKlSQmAR/9FZOFoKwawbfTcLqbY8Yw5BY8nMm7nivvFq2KPHaSI3yp4PmMbYkccNnF2uILvOsl5n2BjdD/ErSjOG5k1JvysAknVwxiVR5PWTPAPL0ZC5gIIe3f+VELtPuGlc+2W6oDYw7PDGQLbkE7lJ/+Z4JTgCE8Uw3WNe1ap4KZF8CMUYLCRAXwzCSqkv6bJxd9bEWaIhxuBFZhxVuCe6qHI7K6roWGSKyA7+2lqldYHMlSJ652Gm5OGEM+vwhfdhtDpSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWPjczhmWkUuWxst+kXcg8VAIuDYzd9evRsYtD2Cv+E=;
 b=lPr65wUrfTR+vrPEMmm4y/qXzdBFxkihFgGPidpQZdL03gku2fs13o366xdWDoVaKd2GGIC2USc0/jn8lLdTnE3bAwSWx81cc+xkjzTJc2BaGEkdNYawmo0pag13byTo6jYzd7WA2pzMfhbTv1clfNzSR9RXfVwLG9VKmqE64aU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9584.jpnprd01.prod.outlook.com (2603:1096:400:196::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 11 Apr
 2023 16:07:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6298.029; Tue, 11 Apr 2023
 16:07:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Dan Carpenter <error27@gmail.com>,
        "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Topic: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Index: AQHZZtUKenNCkns3JkyXtPHgRXRPcK8lz4CAgABvYgA=
Date:   Tue, 11 Apr 2023 16:07:19 +0000
Message-ID: <OS0PR01MB5922390F504FC1F51F3B4025869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230404090823.148226-3-biju.das.jz@bp.renesas.com>
 <7351b44c-f577-4df3-a01e-e9b1039fa928@kili.mountain>
In-Reply-To: <7351b44c-f577-4df3-a01e-e9b1039fa928@kili.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9584:EE_
x-ms-office365-filtering-correlation-id: 9b49e114-17af-4fce-087e-08db3aa6d414
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hG6zWwDNpSM9nReQDPcs5iiM/Mui04OqY+fozj9qvis/9YpOECcNRVgocfjBovN2h92WguFAutXa0f8+IkSdtQP34D7Y3uuVxdnCNVGZMVVGzYuroqe5r3GJbSotC3oCdTHA4MmrKmpgJzR4FPJ/1Sj9hHXUD7LQigpyYfJwhTpTNQ6aAfd9Bozsq7wHL0ZXzEzNuawtPD3IJQe/nqZMNjFgFa2SxrXaqoAG6pdoyPfDG2/2GPTwCuIoL0rZ/9V2gjvA0zikqEoPCsic5VetjQP2SuiJTWrRtqpjr1QXNCCB2t5x8/QwRNJLNqCJpcGlOu88o6OodhbZvrey56PPzpZ2sQNe9BsyWyMnBfwkQEvzoGLjsO8cvBQ1YnRK6xjFCypHb9l6jkdJO9W1rx7Aq2DDKZSrLkqFTM7XvCEoyCegu2dq0gy14LuQbsLWEXlHAxEajejB/WHBbVjkJ0bwKFH4AcCDwGg4LbsLyZXKFjQ1zI3Of3R65TrubxE/Xv0viZ286ofcTQfQRQkgveRyLJMgHjmfR0BfxK15axNhyAdyjfwC6ZL6s7xmpDRijdIvkjrSeFQHZ89XkAWjw0TuF4E+tvsA2H/VY66NW5GfN/kjA4iN5/qDCCekSPo3dxaa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199021)(55016003)(186003)(53546011)(478600001)(76116006)(41300700001)(52536014)(9686003)(4326008)(66446008)(66476007)(7696005)(8676002)(71200400001)(38100700002)(54906003)(316002)(66946007)(6506007)(83380400001)(122000001)(38070700005)(110136005)(33656002)(2906002)(86362001)(64756008)(5660300002)(8936002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D+tYSsJROz9F7xihE8Z3B1wwvDlehxiKKlpF2WFRdUr6PVvSS5JOs0DjZp0n?=
 =?us-ascii?Q?BMusP/SnaJXRJtnLUoVWV9jr+rHgEuY8aJgkVdCfv/0Rs5ZBA8yT1BtVSbU6?=
 =?us-ascii?Q?y46gfEnrveA88Jfb5jPa2RvVdNT1hjapXeryMQ4ELh2JD0Dp2TOnQC4QVQTn?=
 =?us-ascii?Q?EkEVyJgvPB2lL1BQ9tHTJTR/DpHzQWAbZsygJkFqewTWTHEZ6UUjJhrExikf?=
 =?us-ascii?Q?f6qrZE8I690Lx5/2LpthGq3qwYAvhjjQaMZnXWIHcQxYm1rU/5us01aV2LOm?=
 =?us-ascii?Q?YBoKccMY/B+FsH9wikcZPVYckOf70mhcALOhVx4OqdlKiQgWo0giL2l/QgJq?=
 =?us-ascii?Q?0pRkBICVQ7KysKJ26nUR5fEu/KFQpCk3hIxwfuJu4KMCHf4sgnlhfNEfmkg5?=
 =?us-ascii?Q?wyCnc6puWB1IPSF4eyXHsnlzWb7iQa8WNQ7v9LIURaa4FveOzHVrqwZ0IvC8?=
 =?us-ascii?Q?2zucRqlLEhCxAr6rW676V1HQIuZqk2wsSt1NfQMY+hkDunjiranKDybBqFNq?=
 =?us-ascii?Q?lw3MECM6VPTvxXfgdU09tzs9PkwIZOVfl1LKAnTJxBas5WvLlrkpNaNPQbI1?=
 =?us-ascii?Q?BrRPmAVHHLJfJ2SFnUgiuP68euoh0Bq+flmxKdBGVSqk9oQPOBTJUH0Z/GX3?=
 =?us-ascii?Q?TPLZlU1L4ooL5ai1HWboen9Dl+RXX29z9MNcACjAwAHq8K3w/QCFDwAVhYdu?=
 =?us-ascii?Q?dvbjMnf9qeqRO/nPcQgmozxiOV+m2kV8s9vRdNMaQOL0SyDm5dirmoaBHUEC?=
 =?us-ascii?Q?CLWfPeTAhdsBTeyTE3VZjcah7ahjTuaUBXHsRp8Tc8Et1TrE9gdOGzi5UCtM?=
 =?us-ascii?Q?LXaf+knuygh+TxNe2J3hiT5fqnlzZ6TPqvhA/txABlvzpof8Ubwicug2TW3c?=
 =?us-ascii?Q?uzGQ9Z2Zw5n1NwLUu4pTfns0RgHKxYfevgHwTRQ4ap5z187Lt6qgynj0eJHP?=
 =?us-ascii?Q?+LBKPBMdIY3RE6NkVKfHkssV8vJrIeFT0RwKlycebIpvpHK4/1xKLkz51CZJ?=
 =?us-ascii?Q?BXV4hOg8chpSOd4FDLljVfmpLdKkpsG7fSOv6BmZc4OTrwm3uCmFc3izDdg7?=
 =?us-ascii?Q?yTx/Nh9hjiRcMqhi7Sh6XOeOFC2DVo/niBYzlr6MINGfs6rgPnfzR8s/QK2w?=
 =?us-ascii?Q?Fsqr4j0UyDMAQSRe91dH++aet5pCLdpK9+uX1GHL53C2rm8BoXHGCQqJvhd2?=
 =?us-ascii?Q?PTlnCpO04JXuQ+YABkX4bTpVILNROrr8b/oo8i4C+T0glNEXaiGkEjulDBnD?=
 =?us-ascii?Q?pQrq7x6W/sg4wjIgL5AXwvduoPYnHexklERUQZ6OpYcv23/Hqml4d0zbopgF?=
 =?us-ascii?Q?6jLvizY689DMtrAScKGDD+iUZSVFJ7NQS1DgsyTnLwbPtargXHrWZ0y34sKX?=
 =?us-ascii?Q?v5pVOjELSxu/HPJREIE2ptq5caFS0jtTmEQbzb5q6mwdjs095C9nJ95rm9W9?=
 =?us-ascii?Q?GrqlfO4Wbvo0G68iYh1UCZL8lVNTZsIciW8RLHo6VxGtrYVQNybo49c89xXk?=
 =?us-ascii?Q?YaZ+aN32TAIPgqrOJLJCYd5lA0GZm32lm2jOQrR50WWfbP2l30Y1ntU4Uduh?=
 =?us-ascii?Q?NaoGabS17tyKphwI+ik=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b49e114-17af-4fce-087e-08db3aa6d414
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 16:07:19.9767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqLRz0KPc4Qx2xXUqAOztP9xwadGiMVNYwnYiC/xC6OzKUQUWIp72TYcMDC4khwNku8gvKBvhuBaTdytvVX9PrsFO59k02BCkVIUCw2jd9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9584
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan Carpenter,

Thanks for the feedback.

> -----Original Message-----
> From: Dan Carpenter <error27@gmail.com>
> Sent: Tuesday, April 11, 2023 9:21 AM
> To: oe-kbuild@lists.linux.dev; Biju Das <biju.das.jz@bp.renesas.com>;
> Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.o=
rg>
> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; Biju Das
> <biju.das.jz@bp.renesas.com>; linux-clk@vger.kernel.org; Geert Uytterhoev=
en
> <geert+renesas@glider.be>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock
> driver
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
> url:
> base:   1bd575707d704530a52d5dd320c29d79e9cff42d
> patch link:
> patch subject: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock
> driver
> config: arc-randconfig-m031-20230405
> compiler: arc-elf-gcc (GCC) 12.1.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link:
>=20
> smatch warnings:
> drivers/clk/clk-versaclock3.c:546 vc3_clk_mux_determine_rate() warn: repl=
ace
> divide condition 'req->best_parent_rate / req->rate' with 'req-
> >best_parent_rate >=3D req->rate'
>=20
> vim +546 drivers/clk/clk-versaclock3.c
>=20
> fe68e1ca2f2871 Biju Das 2023-04-04  538  static int
> vc3_clk_mux_determine_rate(struct clk_hw *hw,
> fe68e1ca2f2871 Biju Das 2023-04-04  539  				      struct
> clk_rate_request *req)
> fe68e1ca2f2871 Biju Das 2023-04-04  540  {
> fe68e1ca2f2871 Biju Das 2023-04-04  541  	int ret;
> fe68e1ca2f2871 Biju Das 2023-04-04  542  	int frc;
> fe68e1ca2f2871 Biju Das 2023-04-04  543
> fe68e1ca2f2871 Biju Das 2023-04-04  544  	ret =3D
> clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT);
> fe68e1ca2f2871 Biju Das 2023-04-04  545  	if (ret) {
> fe68e1ca2f2871 Biju Das 2023-04-04 @546  		if (req->best_parent_rate
> / req->rate) {
>=20
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ What is this testing?  In terms of micr=
o
> optimizing, divide operations are normally slow.  And >=3D is more readab=
le.
> But maybe this is something which makes sense with more context...

I agree ">=3D" sufficient here.=20

For eg: 8000Hz playback. 8000 is multiple of 12280000.


When clk_mux_determine_rate_flags fails,=20
it finds a factor for best_parent_rate and req->rate eg:( 11289600/2822400)=
 =3D 4

With this it again calls clk_mux_determine_rate_flags, that results in (112=
89600/2048000) =3D 6
2048000 * 6 =3D 12280000 and select the clocksrc with "12280000" rate.

Logs:
Stream parameters are [   41.694036] ####vc3_clk_mux_determine_rate 1128960=
0/2822400/4###
8000Hz, S16_LE, [   46.777454] ####vc3_clk_mux_determine_rate 11289600/2048=
000/6###

Similarly, 11025Hz playback,11025 is multiple of 11289600.

When clk_mux_determine_rate_flags fails,=20
then it finds a factor for best_parent_rate and req->rate eg:( 11289600/564=
4800) =3D 2
and select the clksrc with "11289600" rate.

Logs:
Stream parameters are 11025Hz, S16_LE, 2 chann[   36.591803] ####vc3_clk_mu=
x_determine_rate 11289600/5644800/2###

Cheers,
Biju

>=20
> fe68e1ca2f2871 Biju Das 2023-04-04  547  			frc =3D
> DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
> fe68e1ca2f2871 Biju Das 2023-04-04  548
> req->rate);
> fe68e1ca2f2871 Biju Das 2023-04-04  549  			req->rate *=3D frc;
> fe68e1ca2f2871 Biju Das 2023-04-04  550  			return
> clk_mux_determine_rate_flags(hw, req,
> fe68e1ca2f2871 Biju Das 2023-04-04  551
> 	    CLK_SET_RATE_PARENT);
> fe68e1ca2f2871 Biju Das 2023-04-04  552  		}
> fe68e1ca2f2871 Biju Das 2023-04-04  553  		ret =3D 0;
> fe68e1ca2f2871 Biju Das 2023-04-04  554  	}
> fe68e1ca2f2871 Biju Das 2023-04-04  555
> fe68e1ca2f2871 Biju Das 2023-04-04  556  	return ret;
> fe68e1ca2f2871 Biju Das 2023-04-04  557  }
>=20

