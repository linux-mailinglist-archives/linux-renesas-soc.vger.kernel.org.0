Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196DD4A9E65
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 18:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376972AbiBDR4k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 12:56:40 -0500
Received: from mail-tycjpn01on2134.outbound.protection.outlook.com ([40.107.114.134]:59619
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231603AbiBDR4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 12:56:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnh2+S7Z4SMPzd6+YN5kvjWUqBoRXVdy4PKnCmZm625RF9mSjc15ePaWn1Mu3CZggm3qF9N7kfn4p/ArGOerNfPrc0vv1H2V4B1VClt3m+jauy7d9ZKA1IAYRA9mY47azGPZOSUvskaa3tt8+8n5I6F4WNNcfOS2G5/mZZR4u2zWDlqJsHm2RFXatl/XLbJCkBqrS8yCgqWZXN6tUaJMfTmG6ijjUWzkCfgGvjx4Pl8TIOIG0nf8f2vdluQW5GFnSf8W6okQP6dahVcRCLP8eq8XYjmJ/c4vBLFp7J9TPFNJsDruiqxhECEBhwFzkY9THOor9xn/BRX2i+NDZMTPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEkbD859p0RxE+mDVNdwvBc0toFlgUDJI+8FbWAQtpg=;
 b=oHgRV3+2CO7CxxlHs6L4c6qtYwCbUH7bAQiFn7dZ1rG7h4auXGJXOwZC5bbtbnpZuTylPHSb1KFJI4I4KZ+zZ3vGpa8MMdwMZOGcpnOTFVH9JX1z6rvxe0FpDSOVfoiBhjpqNqFLGfBZDkn2ZpoTxs6Qy0/W5OvH7MdyoI/M7wTdkZVG+1U1IMb/eQj0Mf6MowF5EfDqPD7l1NYT3rHyNtZynrUQ2Uik8fxf7knlh8r4wo69Mcy6H80AT2vNlGp2rm7dGRxnvv1HshJbu6YBFzN9ll/3pnMXfqjTlyaFEdk9gnXg+BWZKx0SRJ6Xzf3JpvXxElN0JofMNkXEexrzWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEkbD859p0RxE+mDVNdwvBc0toFlgUDJI+8FbWAQtpg=;
 b=U2ktxdW8h+wCoab9xJZZGOAOfU8WLdpCTrpnAB+hR213mr8WO81s02GGcyBI6l/2iRDp/ZlvqCQgJOfjhQbSkFSS1H9UrIUh5Kn0ALfOeKRASzRYLjJKrKkHerT0Cn1u6Stfo72EqPXpYEtjKe9cx7q2PWOeVUvQuhXXZgC++o4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4561.jpnprd01.prod.outlook.com (2603:1096:604:63::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 17:56:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 17:56:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Topic: [PATCH v4] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Index: AQHYGc5yAWL7PcF8IEiMOLU36+ufI6yDqGmAgAADyvA=
Date:   Fri, 4 Feb 2022 17:56:36 +0000
Message-ID: <OS0PR01MB5922335B5AE3E3B6B5B1C5B486299@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220204135221.2598-1-biju.das.jz@bp.renesas.com>
 <202202050101.eoVR3IJN-lkp@intel.com>
In-Reply-To: <202202050101.eoVR3IJN-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c1dbeee-72bf-4f2f-eeae-08d9e807b031
x-ms-traffictypediagnostic: OSAPR01MB4561:EE_
x-microsoft-antispam-prvs: <OSAPR01MB456192B69A1719AB2FBA888886299@OSAPR01MB4561.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FDiTdNFrRLKJX+s8h8MR+rZMpSBcH0HiozPwvRA/DNwHxQOwt+dze4mG4+4BkuwmzwrbUENhRHXJ0QmKz4V5vhsb6TOyunNJvgGBFMhX2M2nzlV46repxqvNJVY2CNUtIwWoPTIJgSNCqXfi4MGBZ/ebWhmi0NNwNZENijPwGIsj6trIRsqdiqK1lIHPzX2k4nMPz7z+MmG3Vw+3PjUawsQB5wVYQJAYVY/hIVfdHuThGf6VYKCLCL63Z2QLnWbQZivVZLqU44Yi4lnFIk1R2gS7qDz3lyAGomd6Rzvy9juWRqf5SxJx98URXk+CemnZhxDa2nUkim05OkmINCTkkV9bxNcejdIKkAvkt3TekT3hjy3U2wHOwbbAZtqdNRbd+Di0U0fY+8LUCcp0691/UVuvP8Ty4/V1/1/gVBTCgb9s6bPrHEiKdkpR4lvlfocVAj+FuMQwaFyFT6017w5gaA62NAFmcpRz2+SKtRch8IWhxD8cz9ITgu/oD01nJh9tFeQvaG2jRTx4WwjVj8r5Wn5Rxddt/Dr7+Uj9syi0oRM2iQTfMNQDcq4MK7eAwoQZKwuEF48Yy1ljwZGytQlcWlODhhhyWONALn0/iSqUu+y72cNdQt/KIjFDRaJT3kEzLkI6W1zA6ZjvJ92wl8JQiLb2mR+0f03bN5hULPUE8iVKox+WbjTpHoc6doJLQ/LMn6eC/klB9a5dBQQ5xuzmV5hkiFlR8Fu4h2QOxolNZQ5/CKSkq0jmbFCrmtoNcPRV/GlcljuhnUmvi9OCPZAseit2FnJQu3+fFGs/71vOaM5HpQSc7vtQvyfTdPkMTujC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(19627235002)(2906002)(54906003)(110136005)(316002)(76116006)(8936002)(66556008)(66476007)(71200400001)(66446008)(122000001)(66946007)(33656002)(6506007)(107886003)(38100700002)(5660300002)(7696005)(8676002)(64756008)(45080400002)(86362001)(55016003)(508600001)(966005)(83380400001)(186003)(52536014)(9686003)(26005)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MjMIg1tAq4Q8A5p1qAJRdQIXRbdIoZJZuAcJh24nENyheX17nVOV1/I2Wpbe?=
 =?us-ascii?Q?hAt7MRddCJtkS1iLr5AwYfNWqKeVMtoSIqg6k4/LGzNKomxkMlVWh3de9S1B?=
 =?us-ascii?Q?G6iUmsWrSwKgiMCzsxBYoxtomud9QaY5tZuwzqFfTyzTsKWlxvlVTNSPOJiq?=
 =?us-ascii?Q?NWPa5R+tVrpEu97Z4iGAz9ByahB05utApvnOqCFGpxt7xIw6iCkzWmoDyakG?=
 =?us-ascii?Q?tCPCT5MyYEZCubCsShoBxpj4Mdfl7ZVhJ9xEwBvQYvFILs72wFPLhOena5Ez?=
 =?us-ascii?Q?WL0vQzZn9GT759MPQoqqGHlViRqRvYvLqNsSlVZPRcLXXgbw0bLdCgO+Hir+?=
 =?us-ascii?Q?xMsSoTL2PB2tJKaPGTEMSOt5BGuidlRVVlYdWtMmnlapV7TK9pDQuKlmIFV/?=
 =?us-ascii?Q?w4KB+P/vz8DANNNMFZdUJH09pTNgYz3I5o2dUw2DtloPwIXuusjz1rB5YSFn?=
 =?us-ascii?Q?BhDsIPUOFPI5o65DnLOCtmCU4ZFiLm8uaXUQBrbadKqANXCpm8LFIdWOlHjs?=
 =?us-ascii?Q?EbpxudVwwI42dVt9NwXN8fr+L4lY0ZIYopw1w1AkYz97wDztFnW/dO8VEpwL?=
 =?us-ascii?Q?I6O2ANxaQctQwoMHs8T2UcbcKz/AQNlWp14HHNETH06QZag2WazYDseKpqEe?=
 =?us-ascii?Q?zYZFXpeYfZpZO1PVYiFwCklRYTzIh7yjolzQjSk6hF8yfrs5Ca1SHzqJCc+2?=
 =?us-ascii?Q?8fXMh1XPi3zIc82y7CeEv+sztY25E6H3QUGc/D+yRW31l3fT7I8FIFK6G8/X?=
 =?us-ascii?Q?vRWsDUeGVrN7DOOqRo0oxuN7s4vk4HqfL0SmNGKLInG0QFUja/wRLHDe9aZv?=
 =?us-ascii?Q?h4iDL9JUJ0fsnVEVRRx7S6dycPapogOkBn6QilRC/Szi7LeknyY3Yd6iWujb?=
 =?us-ascii?Q?pxnHh7qhpAjaaRsGRI7ZLSbBxq70f39b21ysEe3RdMxa1kfVX+svupS0j7nU?=
 =?us-ascii?Q?nGLAnH4svfCWgi6jGzQ9E1eLZAksqBUUAhpTVHRpWFO3LYjIrRyUlX1BSIzo?=
 =?us-ascii?Q?ivFTI+wLmFYO+dJoyLQkRl2KbmUoZldYZcTIOhxVdPbkIevmLufG3MEv1j/N?=
 =?us-ascii?Q?tRrQrL7N+ugHo/Xi9QQsLJWmqyJgJFyihoRAXsX4aPi19qgTyjAb8+mFw15W?=
 =?us-ascii?Q?lrcUVoIHgQfX8Wb6UK04cNLKjge9YAT35PTIZTVahofy+ZHySDM7kTgCmy1e?=
 =?us-ascii?Q?b2bq+P3wAJFkDxyeiSIdTyoiuA6TgLtlkqGvvgKVwcOPVZQkzvxvDNa41O5u?=
 =?us-ascii?Q?YCUk0a1gzO2zP7BkR52TvF6FluUH/YNOB3rEcWO831/zxWJ/a0tlu62XpK37?=
 =?us-ascii?Q?ysUHnAdh+3zl7wtUuXAP03E0VLB7H3sNH+9wlO4D0N9C/cBIh0X89YQaxZ1A?=
 =?us-ascii?Q?Kxv44cVETpsDDmu1IGdo2+yTkUGgVTf+gvXF1A8Q8d7u/fTe5p+cm0m2pcAG?=
 =?us-ascii?Q?+M3AtNQKiO233+wAN4co1mQfCXlIQ8H+vEO3JLUwz8bEB4/4Cda0FNZxwi7/?=
 =?us-ascii?Q?HsUpKuyiPkq165LK31+yhEKUQ2kdFBob8dTz84Mdy5zUPtlQRtvR3Bvn9qj2?=
 =?us-ascii?Q?ubbVqAPSLUzZaXOg2frXpH2waYtvVtAG3SM6L9ROyweLYtXYiefblYMfzcUk?=
 =?us-ascii?Q?LLZQH03OPOFsIYZBw+MNSHb7sQSECvuHiLVWQqOaOK3h87bjQtG51x1tCpi4?=
 =?us-ascii?Q?vRbu5A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1dbeee-72bf-4f2f-eeae-08d9e807b031
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 17:56:36.7019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bu6Jf/S2tUvvXUX3wog4l95RtpOsX4eTxtR5upajGgwJ0JKLxQAKcr5K9oHiHesytVrFHcdf6ddp+M0svMFrZbj2s2UWpUu+wFxaflDBJ/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4561
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

I forgot to mention the dependency[1], while sending this patch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.g=
it/commit/?h=3Drenesas-r9a07g054-dt-binding-defs&id=3D4decd2e54b61686787f36=
b727d2772e067a46ea5

Regards,
Biju

> Subject: Re: [PATCH v4] clk: renesas: rzg2l-cpg: Add support for RZ/V2L
> SoC
>=20
> Hi Biju,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v5.17-rc2]
> [cannot apply to geert-renesas-drivers/renesas-clk next-20220204] [If you=
r
> patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit-
> scm.com%2Fdocs%2Fgit-format-
> patch&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cdef610b3f1d948d=
97e
> 2f08d9e8052fc9%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6377959312416=
7
> 1052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
I
> k1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DhNEi%2FwjY85b4%2Brm%2BmDMk9LCoSD=
a4D
> Mi5jnwrveSviNA%3D&amp;reserved=3D0]
>=20
> url:
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.c
> om%2F0day-ci%2Flinux%2Fcommits%2FBiju-Das%2Fclk-renesas-rzg2l-cpg-Add-
> support-for-RZ-V2L-SoC%2F20220204-
> 215327&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cdef610b3f1d948=
d97
> e2f08d9e8052fc9%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637795931241=
6
> 71052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6
> Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DZF6%2F0mNfh8XtSVZohtG6L%2Fy%2F%=
2F0
> VMfPY7eMlNQFCaVNU%3D&amp;reserved=3D0
> base:
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ern
> el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fclk%2Flinux.git&amp;data=3D04=
%7C
> 01%7Cbiju.das.jz%40bp.renesas.com%7Cdef610b3f1d948d97e2f08d9e8052fc9%7C53=
d
> 82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637795931241671052%7CUnknown%7CTW=
F
> pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3
> D%7C3000&amp;sdata=3DGGtzDiitEC%2BtoIMV3OpPEVAGTbmhHzXWxSjKRk3EF1E%3D&amp=
;re
> served=3D0 clk-next
> config: mips-randconfig-r003-20220131
> (https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdown=
loa
> d.01.org%2F0day-ci%2Farchive%2F20220205%2F202202050101.eoVR3IJN-
> lkp%40intel.com%2Fconfig&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.co=
m%7
> Cdef610b3f1d948d97e2f08d9e8052fc9%7C53d82571da1947e49cb4625a166a4a2a%7C0%=
7
> C0%7C637795931241671052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
j
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DZ%2B8RTIY5sG4=
UX9
> g5qqc%2FEgDuWlqrpFWqrUMKKSW3Zkc%3D&amp;reserved=3D0)
> compiler: clang version 15.0.0
> (https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.
> com%2Fllvm%2Fllvm-
> project&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cdef610b3f1d94=
8d9
> 7e2f08d9e8052fc9%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63779593124=
1
> 671052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DvBfsXu1tyymzjPHdeU98j6FcsUD2eU=
duJ
> 9lGikowZMg%3D&amp;reserved=3D0 a73e4ce6a59b01f0e37037761c1e6889d539d233)
> reproduce (this is a W=3D1 build):
>         wget
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.g=
ith
> ubusercontent.com%2Fintel%2Flkp-
> tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.=
ren
> esas.com%7Cdef610b3f1d948d97e2f08d9e8052fc9%7C53d82571da1947e49cb4625a166=
a
> 4a2a%7C0%7C0%7C637795931241671052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
w
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DrW%=
2BC
> jVXiiUmibIYCa03L1FhiFlh7GYoPRB%2BLL1vl4nc%3D&amp;reserved=3D0 -O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         #
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.c
> om%2F0day-
> ci%2Flinux%2Fcommit%2Fc10eeae8f76f71a3b6778b816cb18c2db3e917f8&amp;data=
=3D04
> %7C01%7Cbiju.das.jz%40bp.renesas.com%7Cdef610b3f1d948d97e2f08d9e8052fc9%7=
C
> 53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637795931241671052%7CUnknown%7=
C
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n
> 0%3D%7C3000&amp;sdata=3Df2Kw5n7O%2FXBcajCuYyBv%2FbUitlmjiLGPVRqe0TdFNz8%3=
D&a
> mp;reserved=3D0
>         git remote add linux-review
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.c
> om%2F0day-
> ci%2Flinux&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cdef610b3f1=
d94
> 8d97e2f08d9e8052fc9%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63779593=
1
> 241671052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
B
> TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DWvsBZdI3mC5ZkoKkI9QVlz%2BVq=
EIO
> MHtBxyBn20ORB44%3D&amp;reserved=3D0
>         git fetch --no-tags linux-review Biju-Das/clk-renesas-rzg2l-cpg-
> Add-support-for-RZ-V2L-SoC/20220204-215327
>         git checkout c10eeae8f76f71a3b6778b816cb18c2db3e917f8
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1
> O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/clk/renesas/
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/clk/renesas/r9a07g044-cpg.c:14:10: fatal error:
> >> 'dt-bindings/clock/r9a07g054-cpg.h' file not found
>    #include <dt-bindings/clock/r9a07g054-cpg.h>
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
>=20
>=20
> vim +14 drivers/clk/renesas/r9a07g044-cpg.c
>=20
>     12
>     13	#include <dt-bindings/clock/r9a07g044-cpg.h>
>   > 14	#include <dt-bindings/clock/r9a07g054-cpg.h>
>     15
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01
> .org%2Fhyperkitty%2Flist%2Fkbuild-
> all%40lists.01.org&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cde=
f61
> 0b3f1d948d97e2f08d9e8052fc9%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C=
6
> 37795931241671052%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
u
> MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D6jslfRkHXT4gQNFJrZv=
lww
> ZJrUlVssmdXE201yqytqQ%3D&amp;reserved=3D0
