Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEB95F0634
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Sep 2022 10:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiI3IEw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Sep 2022 04:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiI3IEr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 04:04:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE18B6343;
        Fri, 30 Sep 2022 01:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgWVMowQfpMMxvpQt18I/1JyOEe6xKfk2F4GRyJVsvtohOrx1MlHR6yRaEvpVWzUNy8c7PxnZEjPXfAt4yv2iONNpCx8tOKv6EWjN5wPCsHX7AJGR928srjDBtIRaN5eRLTKBGF2Au+HraaE/FesCIltreojzcJzfFWQux3B1uZSKCF18t66XUtSxWND6Aer0ti7YnH3WQkJHtPO7YP6s8F4oUHvwiS95IHfil0iE865AqUoW6xuemn2L7k95eyu9QImFFSuy/e5pjiz9p5u8wB7CfEq3tZhE4ClgqZa1Xb0A8A+yzIXJVlyX9blSu1+USEPhrD8S+u5ywDUErn76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubrcl4TwnYqkZNCY9Nv7sZVHR48yUpt9zlzHgJOfEoM=;
 b=P1ilv5r4U2CaMrG1U5Zrwk5qVcFkqNWJ70W2hTTpgNBh9kWBy6u6B0jA+LMgJKU0q78yIMNWkumdk4/Q29+391azPwLdxqgvpWwNGwSUsqqwS55yP+gLIzoTV4o3IyiWyXHNqJ6cEl6P1yGOvbzzn+w7BJERcumKAzU80yZpmT01kWWmGx9wBQSud0jcJwOLPTTQcZ6zNHM3cdG77vyP8k2NkV/Cxv5oTQytb4Z79r0LlHaUQgwd6YuYKb6ydhXdUW4WJWns6jAoalWykIuAYh9fIXNzuS7x/qmr32YHBT8I9/v6pRKzmlYM8FUtrXzGKPmGwluWVvq9gKROvBq2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubrcl4TwnYqkZNCY9Nv7sZVHR48yUpt9zlzHgJOfEoM=;
 b=HcvfpAjritbRTCq4h+v7u/A6QEMYSrR9LIBwUhTUab7KMs+YFgOBAhml9Uya/JDqiJJZVoN+qz9HekOMtXaoDVVtvbf15pzy5794xc7wsRmW4ajndsccMUm1n/iZZ+GT7qby1OGVH93q+gpWwHwQQ3YesSVngspkryGvq5y+ahM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5476.jpnprd01.prod.outlook.com (2603:1096:604:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.22; Fri, 30 Sep
 2022 08:04:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 08:04:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     kernel test robot <lkp@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Thread-Topic: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Thread-Index: AQHY01PITw65KpPtl0+JXvsHlc8xea33n3Og
Date:   Fri, 30 Sep 2022 08:04:41 +0000
Message-ID: <OS0PR01MB5922091D0D08306A4EE5AE2886569@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
 <202209282348.xpj6SQok-lkp@intel.com>
In-Reply-To: <202209282348.xpj6SQok-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5476:EE_
x-ms-office365-filtering-correlation-id: c721ec80-44d5-4a3e-9114-08daa2ba6ddc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HkUDMrffYkPxzdlxWt1D3mM2YByxe5Cos367SeSs1hCqCjmDg+8vdKYB6ux3s9BdjYXSsS51YqBFZQzN1WgkAjm5wB7wGcWUedqib04OTO5pIo5+4VclmOzihGE0jrTPOgeWQA+zdH+qrCXCBLJKnALXQ2HIcoM00g7kCmTEpf2Et4VaaB6ii2cQf9peJWbx47uNMtuvnXJgSLSuhZ3x/sDH5bSwriVI86J66tN794pOi+x6cILG1OFmxNi9+NVBNNxaBPwKepMvg4wGCPom09j4q2sVjBYLk0cpod/0SlKdX7yEmXDGcxqHK0fbel6bxMfVFQVFGY7A/u+mNEXqXXZUB6+umcxO3FDEVJDsW4uUVHsmaLd7zbGKlk8AordWsDdVNbn4JTIF9dCz2TmQQCxzb/0MhIavEPDvHflUrGnNCy/wFaq6HKHTiHtlkVswajaWMwVzBWXAR634XY9H5iNdqppboaiJ9yD/p4LIupox2SXbAC4LrLqzHTtaLttZ7EJUtF8UTFfLAnssgrRATCRmNIMZDU+O2rn4rNVfn13/qq0/aVP5LgdPO3IeJoxRz1JDBhYzSS7bNFGpHYHPB4rpeWFzcaihKf9nyvnfkulmjPU7desZ89ljwalKGfTlQ61q4x18CYucG0vhyeUlsigwq6ETNMTN9IsZ0DxsBW68zQjWehKUmQdqAvqI9W4PiSZtB5V9HvEgWb6uv4bPSJA/qDGsIjY8fE6Z7Fl3tUbW4bby4w0s+AYXs/pZYv4JHe3Ly+vstSTM0uEh1VVNyCeE5Jq3tZS9098cnYLEEL0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(2906002)(110136005)(6506007)(478600001)(122000001)(55016003)(54906003)(4326008)(64756008)(66556008)(66946007)(76116006)(66446008)(66476007)(8936002)(33656002)(107886003)(41300700001)(7696005)(316002)(9686003)(52536014)(26005)(966005)(86362001)(8676002)(5660300002)(38100700002)(38070700005)(186003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?75B6C8jsdhpkFjAxDmw5pZJ2w3M4bnQReBcQGQwKnpjT+bi11PtS3m8xeVw0?=
 =?us-ascii?Q?wzg6DEIxZEy0TMbvqDhBf8JSLDy18qYXQaveSpvfFLOkvgedLspTeuapuFYz?=
 =?us-ascii?Q?tesn95M6iTLdon7JAMpCgdXEbyJEKtP86ki3XwnY/Gr4bqn7eQaYJ9zGCBbI?=
 =?us-ascii?Q?wZEHerLm7JQrWXyYaQynXBhGeBZDed2LJ0FX799OI9/i3Q9XJW4/TxVO37xv?=
 =?us-ascii?Q?cBdnzbeLMw0BJB4x4rnN+uWltizgXb/ydXFRm7vZQ1+X4/gkLeLMX4A9XpmR?=
 =?us-ascii?Q?aGqBhPFAloZAFQoVSlt97Bx4uZ1liVAisuMl/VD92OxD8FlBzmM4idkC0aML?=
 =?us-ascii?Q?19gqGrVbuOUHqUiGLZ+DT5rOQ4TWBKeXDC3aCj6lVIIb/zNWcNSKDU817QoD?=
 =?us-ascii?Q?babLh4OOvideO6FWPHcRyJPh3hM3f228PxJW/bETqzVrUdnIJYQBSAEn0Xmr?=
 =?us-ascii?Q?roS5PW6PNW2tD4vEAxiJzY1W6O7OqQuybvq/ckK4H2YCr7bIj44lZeStd+JZ?=
 =?us-ascii?Q?3npLYMKTtwPcvURcQrUFZ+gL2kRBwjHOI/u5hMNF3Y4KNaOYYh6GiZjRdHXn?=
 =?us-ascii?Q?An4I9akRTmBIOW3GvJ/IIKntpN7yn14Re8w1vZ6XkHHI3x+moRCpMNzF29bD?=
 =?us-ascii?Q?AmTGH3JK8Ztvk9kZF/aIWXLnhVvqnVYNzAb4PEVCHqb2iXiUKjueM+Ql55Jk?=
 =?us-ascii?Q?mxogOjC5Mgsrg8FBahBhg1gWsU/b+zGrEi/5WVbGv+155gG7RFA8ziUfhuDO?=
 =?us-ascii?Q?qGLu0bPXI5ffRsyspV1VBJopxN6rpQ4TkAPv6dqpWte/2OHYq9I4Vk9/tMpO?=
 =?us-ascii?Q?HpvzOiORjNwsZo+iiS9eibKgMT0lmWNqQnVeJykvQNxoeSDFND/PAQ9QtGI6?=
 =?us-ascii?Q?6ic26vFUWILHfGkKoVz73PIokvLavbFIUN8lDaq2AlCxupBgAr67UYMzE3fF?=
 =?us-ascii?Q?qUyJQwNEO1UjgxkCi65n6ft7mRoz7ccGtuC7nDbMzqD58+8b8xBmxJ4D1iej?=
 =?us-ascii?Q?jYzR/2RHe+ABwbvhQE3hh93oRCcOLh1N9T1D6TYcaBmuYXxhaCf0tM8P13xx?=
 =?us-ascii?Q?3P3aFDlQcEQi70xokdnu7O0BWGTl2iHmcTGvAb4r6jHZVFPiwOkKqsSfXTqV?=
 =?us-ascii?Q?fZJqJj0/qCCc1d9IovFMDnw3jNvcx9vzOfGdv8Z2GsEkspxa0P/tLjuCHz1q?=
 =?us-ascii?Q?Vo/X8fdJC0NrQobpUj91nQYOcwmw7Tl6kY/n7v1z2G3chtCCiXAp3Z5xrrJA?=
 =?us-ascii?Q?/zE8+B8qd5h6GFIriwd9b4nLwK6c7Phh2JqjE8bBscM13fevn/iwIDtmp1r6?=
 =?us-ascii?Q?e+21aJuSxwHT8UFF4pMNO7pvsONRIuNzN/TCC4Z9u9KoRt7ap05o1kP/8QwY?=
 =?us-ascii?Q?FFwjC34p0Y4J5fEq9AO3lLFGYAIy1SB2Cd5+ohbi5spFN6FOOax4Dz9ETbWN?=
 =?us-ascii?Q?RuwHbY0lJgn9B5muxoMbGIi0gq9mg5G1YBN5pWElNHxxCHpemvlRaXDqaPpc?=
 =?us-ascii?Q?+XbOX256aIXKwDD8K6f4TCzyqLE3ikNzLMUcIU5Evpg/2Wix6lGZLuAPXKvu?=
 =?us-ascii?Q?bi3ueaa1UJkr46sZQShUZtNV3WzrksJjRu5VaDzrYbXYYJHZ7VpBm0G4arsW?=
 =?us-ascii?Q?FQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c721ec80-44d5-4a3e-9114-08daa2ba6ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 08:04:41.6822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FMEydTjETMCZ1wEgsOywUuKOrx7kFrqTZhiNGkRp6Cfc0y7OkBH45x+4VZ7w0TBroKzkY803AFq5kBtJa/tmuap97mIuKnGlANRA3keKA18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5476
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi kernel test robot,

>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: Re: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
>=20
> Hi Biju,
>=20
> Thank you for the patch! Perhaps something to improve:
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> drivers/mmc/host/renesas_sdhi_core.c:164:34: warning: variable 'i'
> is
> >> uninitialized when used here [-Wuninitialized]
>            new_upper_limit =3D (new_clock << i) + ((new_clock << i) >>
> 10);
>                                            ^
>    drivers/mmc/host/renesas_sdhi_core.c:132:7: note: initialize the
> variable 'i' to silence this warning
>            int i;
>                 ^
>                  =3D 0
>    1 warning generated.
>=20
>=20
> vim +/i +164 drivers/mmc/host/renesas_sdhi_core.c

I have sent v5.=20
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220928110755=
.849275-1-biju.das.jz@bp.renesas.com/

Cheers,
Biju


>=20
>    123
>    124	static unsigned int renesas_sdhi_clk_update(struct
> tmio_mmc_host *host,
>    125						    unsigned int wanted_clock)
>    126	{
>    127		struct renesas_sdhi *priv =3D host_to_priv(host);
>    128		struct clk *ref_clk =3D priv->clk;
>    129		unsigned int freq, diff, best_freq =3D 0, diff_min =3D
> ~0;
>    130		unsigned int new_clock, clkh_shift =3D 0;
>    131		unsigned int new_upper_limit;
>    132		int i;
>    133
>    134		/*
>    135		 * We simply return the current rate if a) we are not
> on a R-Car Gen2+
>    136		 * SoC (may work for others, but untested) or b) if
> the SCC needs its
>    137		 * clock during tuning, so we don't change the
> external clock setup.
>    138		 */
>    139		if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) ||
> mmc_doing_tune(host->mmc))
>    140			return clk_get_rate(priv->clk);
>    141
>    142		if (priv->clkh) {
>    143			/* HS400 with 4TAP needs different clock
> settings */
>    144			bool use_4tap =3D priv->quirks && priv->quirks-
> >hs400_4taps;
>    145			bool need_slow_clkh =3D host->mmc->ios.timing =3D=3D
> MMC_TIMING_MMC_HS400;
>    146			clkh_shift =3D use_4tap && need_slow_clkh ? 1 :
> 2;
>    147			ref_clk =3D priv->clkh;
>    148		}
>    149
>    150		new_clock =3D wanted_clock << clkh_shift;
>    151
>    152		/*
>    153		 * We want the bus clock to be as close as possible
> to, but no
>    154		 * greater than, new_clock.  As we can divide by 1 <<
> i for
>    155		 * any i in [0, 9] we want the input clock to be as
> close as
>    156		 * possible, but no greater than, new_clock << i.
>    157		 *
>    158		 * Add an upper limit of 1/1024 rate higher to the
> clock rate to fix
>    159		 * clk rate jumping to lower rate due to rounding
> error (eg: RZ/G2L has
>    160		 * 3 clk sources 533.333333 MHz, 400 MHz and
> 266.666666 MHz. The request
>    161		 * for 533.333333 MHz will selects a slower 400 MHz
> due to rounding
>    162		 * error (533333333 Hz / 4 * 4 =3D 533333332 Hz <
> 533333333 Hz)).
>    163		 */
>  > 164		new_upper_limit =3D (new_clock << i) + ((new_clock <<
> i) >> 10);
>    165		for (i =3D min(9, ilog2(UINT_MAX / new_clock)); i >=3D 0;
> i--) {
>    166			freq =3D clk_round_rate(ref_clk, new_clock << i);
>    167			if (freq > new_upper_limit) {
>    168				/* Too fast; look for a slightly slower
> option */
>    169				freq =3D clk_round_rate(ref_clk, (new_clock
> << i) / 4 * 3);
>    170				if (freq > (new_clock << i))
>    171					continue;
>    172			}
>    173
>    174			diff =3D new_clock - (freq >> i);
>    175			if (diff <=3D diff_min) {
>    176				best_freq =3D freq;
>    177				diff_min =3D diff;
>    178			}
>    179		}
>    180
>    181		clk_set_rate(ref_clk, best_freq);
>    182
>    183		if (priv->clkh)
>    184			clk_set_rate(priv->clk, best_freq >>
> clkh_shift);
>    185
>    186		return clk_get_rate(priv->clk);
>    187	}
>    188
>=20
> --
> 0-DAY CI Kernel Test Service
