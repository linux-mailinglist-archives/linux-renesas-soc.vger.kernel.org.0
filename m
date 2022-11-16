Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4D562AFD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Nov 2022 01:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbiKPAGh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 19:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiKPAGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 19:06:36 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C80727B0C;
        Tue, 15 Nov 2022 16:06:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rvf6eQkk7M/GATzbORZWrVoOr5v3sozV2l7svAL5rcyuu7EWJthjmV11kCDk8CgtHh1vfiQOJt4R32KTh24rk+RfMGXxvRoqmOYcLLFTJ5gIkghtHsknqwXavdNx45Q0uAmq2gQ7O4JaQJhJxQAT85lJZKAS6tRoknBGc86OBdBQK7YvPGEPNxRnliLxWmU4yNKXh6HSClNclD0K01aF031v43SGaSiIQYy3qhvLhhaOq20JTgYctbp2ijLefBppWlFRZ+FyYbbp+24Ie9WjZuiALVVKReybJVZRKWR+tcj1Fy+tF+P7kkOYNA6oOfAITtm52EuKxCFH6DoBRZ/NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7V6AM5hzlmH6q56FThnqIaRHFdUDyRJ4HRr568VTW8=;
 b=MpyN8Aj/QLui5dNGWslwiaK7KRiPKvkHgINqCI8VMbtwCiWhTJUfjozQ1AJHmqQLbou8BGd1xlDANkgxadS+WcXl43UEpC/7dWTRhev1AbRNz8vU4BJAVy6lCshQa/8f49FH9M8gvUrlDrrvoZkKWRoQVK8mZZZKMx7ylc1EGOntrz88aJX/+fQdL6FoDthbiRqclSou/ssQ76wFyTEaEv1UN4wg5BiaxkkjVJoSVqyb1eGac00VrASk1PLGojK7dk+ca7z+3XqbXJt3KBJUZ7W/vz3htonnzFQnskpWtG+BugB5QXmA4Kf+zpLvEND+gaoySnNfzvoS5Az9P7zwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7V6AM5hzlmH6q56FThnqIaRHFdUDyRJ4HRr568VTW8=;
 b=NiphMjIQR56Dcw2nsAR2CMsZ99efjMROfnkcYljr4TbvtLFSsyyNCP9aFXgXIBI7TYYvl4764WDU56idvkzg9lA7Qq+fnO8QSr87w5rIqOsqU/Fj1o+gUDPUDR+B+APUaTrJLe0H2sYSwAqnHSFz7GIajl3LDFZ1keUbmBaLQPU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB10645.jpnprd01.prod.outlook.com
 (2603:1096:400:2a0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 00:06:32 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%9]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 00:06:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] clk: renesas: r8a779f0: Fix Ethernet Switch clocks
Thread-Topic: [PATCH v2] clk: renesas: r8a779f0: Fix Ethernet Switch clocks
Thread-Index: AQHY+M0PfHKpuIsq30mT5KxUqyKfeK5ArK3A
Date:   Wed, 16 Nov 2022 00:06:32 +0000
Message-ID: <TYBPR01MB53414B51FF1575B1BFE51C21D8079@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <99b8b41bd2c5043c9e457862ef4bc144869eca58.1668501212.git.geert+renesas@glider.be>
In-Reply-To: <99b8b41bd2c5043c9e457862ef4bc144869eca58.1668501212.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB10645:EE_
x-ms-office365-filtering-correlation-id: 88069b11-1e26-4bda-cf55-08dac7666b08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uxocCqw4nXMxkgODUrl7e6bMETgxVKaiBsGUCypVO/xypCTrVrlPVPIR1Kw0ckCbGTxvdeSm6DnDlHOnF8Jb8vHXOr7Px38rJidI7Aof/ZDgSYUN23TCUZbjVeGXTzWsCasZfooIq/dXoKq4+GorVYvuVcRNt7ilJ8XoLhsxBgcx2SvT3hSeYj9LuxEkThN3UtmyCxQvOw7vffsaZ5bjJAr7NIIyGzM0OQx1RONzxJjW+bL4XQQdC5n2oRHibkExLFA+cnp/VTVlbbPZhaYy4YVyF0RHNEuUWcuPRJ/Hw2UabEcd55t5xn9ljm5oesShGnIv1Twrny4A7FO5GzfUL1tbg3X/YKSIFXbOzH2Jb0xDQ1FW4w46rXQCNeyzUbUTHSFpgLtEBZaC7VdwLpFoB9Yo4D+k+TVd6SCFjOCgjzjCxH+N5nrTXEssP/HerO1AyiGhG66aNB3bZfiuW4/tQuMHeZl/bx8f9CWqhoxW2EV6xs5prkdcqy/eyRM/gGgHS7LTNgk0vovj0muqnhQg0kAVn9B6xfvdpQW0NBdBuanSNo5iyZGbMeG09EeKsrEdQIYIBr/YVeorXbe16n5armhylwtjuZVi5gML+4SQK+Aq/jbVf9OPm3GGPmyfKEx0xdU8UqQ1ofei4gTBYqfWDKaFI/D5PzM7E2xBdGTWazB1l5acHMvdNpdkJ0w2+DM+zl8qhU4Hk35jRqIr3cx96s9AE4VWRHAz82E8pNyB00lS01EwfmnLu1LoUHm7Vchb9I9bHegTQT5a80IIIPEHVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199015)(38100700002)(122000001)(38070700005)(86362001)(55016003)(8936002)(5660300002)(8676002)(4326008)(66556008)(76116006)(64756008)(41300700001)(71200400001)(54906003)(52536014)(316002)(66446008)(66946007)(66476007)(2906002)(83380400001)(186003)(110136005)(6506007)(7696005)(478600001)(9686003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kWLLV1fklpTsNJeMQ5t+7w1Lc5GRD+s/qONucmJ0Kb/pyBzUgw+M6ZsPeFq/?=
 =?us-ascii?Q?6nf+rzR4SlhX9RweGSYTGOXDxEouclPM6KUq+99/MgYl++14rL532sCUjyuO?=
 =?us-ascii?Q?tUUPZfZZMXSDM27TiqRCfa0LEAEU2Ve+MHriFvXPQdcHWFcawKuMGLUrEBzo?=
 =?us-ascii?Q?GRd33hWxcw83YAccfXdVSR9OecBHC0wrOckXq6rYvhL0g9TLBKEhNiVp9kAe?=
 =?us-ascii?Q?Hig51GNlkaOSdMmNRRp9FgTSbUPyAqrmU7zxrQdOFXu0LmXl4dM8Cf62u0AJ?=
 =?us-ascii?Q?Ot32mUZKrF8yCX13fpZEHKQsewGgPKYMJOEIodRvPjfopK0ZK+Ftg4Pck1iN?=
 =?us-ascii?Q?9wt5v5h1I/qSSFkOSa7icylHKqICIEogRI34iWd9X4GVac2Wr4buVo/61Ont?=
 =?us-ascii?Q?ziVLYSHLI74BQZDalJ/sUItzqMIrOJwu5gk1fteGa9sThUjFMUv2Rl391vdd?=
 =?us-ascii?Q?n64Qh7rOK1AHjgwvQqbE1r11GJCaagp3udKCZCtCMPnep3a98LqcuffF7Ir9?=
 =?us-ascii?Q?OW6MZey+xVs7c3Q7Z8xGTK/wHtCitXHUCP4bTcOlfE2BTsSCW1TEMS1L5ynk?=
 =?us-ascii?Q?/zhnS10H5/T6M6YX2VNGZhzSBxii7t6iY0argezjz91Dp61p0YgNhR6FuFmZ?=
 =?us-ascii?Q?cAt86g2wgF7+p/eIi9JNwhcy1iy179Y8ozA4AW/RYaRg/bSeA2cn5BFO75Is?=
 =?us-ascii?Q?v/V+1GHcnoj8Tz0UR5IRk5KKbePSH38qdYZDLZmKr4rxUQdZwL+vhXca8BC5?=
 =?us-ascii?Q?bMmwjpalJXsNAvplkH0jE8/GiJ82BecxU/qPkzkd1PRGPPF72pgS9kBp35xs?=
 =?us-ascii?Q?DjrHUuDsW+O9uQZgOED1hFh5udbmG01Vkh7w7bkXJ+6IuKpdCzBcmpque8xq?=
 =?us-ascii?Q?UJOfdnJNX5RTTWHUX+MGE/FXiyFCIDuPqXlIdfBX3M3+zsV/1hNrVNzWWatJ?=
 =?us-ascii?Q?TaAZE0zecqJu3Nd0Dj+om+VuEenv1PTiDRbQHbxH8X7hplhZRc/1mFaFG41Y?=
 =?us-ascii?Q?N8f/MhsBLAp5QJovx6zHbejW2kzqkdMhiazelO6GeXqyruNya16/4lz9hegw?=
 =?us-ascii?Q?BgLlp5RvDXTpdUPGG6eLfVeQU2s9XP3WIG8YuNxAbEBoEzx32f5ZfHceTA3v?=
 =?us-ascii?Q?fUy/FUPqLV5rcCHm1cTLxkkT99ntfVHCocdDwV/AkmTUKHUaivbU5kztDyf3?=
 =?us-ascii?Q?zGj6esVknZE5Q4Z0RRwuswhmcomsoTxzenSwWAjw6walnxESFTlxyvrf/GBz?=
 =?us-ascii?Q?O3izi3hY449rLZcHPmW/1YFgbB4EJF654O6dLPeotbwSPeBl0w71pkPmNMCa?=
 =?us-ascii?Q?hl3dCOpr1BOWoxyFYkU4/2HcKxzaoOmelIHtHuvC9rEKYcZBCdydF6Ic63PC?=
 =?us-ascii?Q?u0fRQsxG2dkijfOsN1ifBHkIyM3C8SjlTjX34ZwXzaiylhX1cNswyktAuEQw?=
 =?us-ascii?Q?KnsLvlyrsWJKlfJzfruXeHGj7lh+dG+ELcurLpsEHVrEXV/aqSS507gzAkGc?=
 =?us-ascii?Q?eFC1YEgdwP7KlGUNGEKZv3kMRjPRGfyuUQruXhEuZIKOJ8B9hlAsw2ZgL8Mv?=
 =?us-ascii?Q?jLebhetggt15FLiBGGlPh5KvkhywS6KQ5qSEheqY49Bp1NWj61w9PM10LNSf?=
 =?us-ascii?Q?JkmWmZevjWIvBtOyP5sZfWNOoTOAzXDE6bLOUSz1lQ9vISC05aBLN/Gv96B0?=
 =?us-ascii?Q?REPgMw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88069b11-1e26-4bda-cf55-08dac7666b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 00:06:32.2365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00b8hV0EvM6i+koremHVeQ1pvab2LzyaGS3FzE7nqU+9A6F8/wmcW0d4QntyjpzcILMgQKsfOyNMn6/Pw2FNGVLB7x14kbOyQA4Fv5ONYoky4z57UVGda33+A74fqAnp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10645
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, November 15, 2022 5:34 PM
>=20
> The RSwitch2 and EtherTSN-IF clocks were accidentally mixed up.
> While at it, rename them to better match the (future) documentation.
>=20
> Fixes: a3b4137a4d4023e6 ("clk: renesas: r8a779f0: Add Ethernet Switch clo=
cks")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Tested-by,
>   - s/ethertsn-if/ether-serdes/ to match future documentation.
>=20
> To be queued in renesas-clk for v6.2.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesa=
s/r8a779f0-cpg-mssr.c
> index 800fdc104edd657f..f721835c7e21248b 100644
> --- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> @@ -163,8 +163,8 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] =
__initconst =3D {
>  	DEF_MOD("cmt3",		913,	R8A779F0_CLK_R),
>  	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
>  	DEF_MOD("tsc",		919,	R8A779F0_CLK_CL16M),
> -	DEF_MOD("tsn",		1505,	R8A779F0_CLK_S0D2_HSC),
> -	DEF_MOD("rsw",		1506,	R8A779F0_CLK_RSW2),
> +	DEF_MOD("rswitch2",	1505,	R8A779F0_CLK_RSW2),
> +	DEF_MOD("ether-serdes",	1506,	R8A779F0_CLK_S0D2_HSC),
>  	DEF_MOD("ufs",		1514,	R8A779F0_CLK_S0D4_HSC),
>  };
>=20
> --
> 2.25.1

