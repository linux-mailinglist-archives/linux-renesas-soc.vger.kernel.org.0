Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1EA170F78F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 May 2023 15:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbjEXN0k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 May 2023 09:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbjEXN0k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 May 2023 09:26:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7749A9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 May 2023 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPRNHQP7C+gX4BD4sXepTh0lOo7UcoqaJWCagpS1SjKeh1FNBg1BMQboBcPhd+Oh2Zl+g4iNmcCzf44lPCGm2NiRl89HcBnpNFXf7uF50ySEmEDqd7l2sNh1XK4dF4k7fSP3JTRWBoYzm1dXrJuJb4QWhMMOPdHfYWut+Z3yWbp8juhUtDK/CXq1aPU4ZdxcgTx1OAtkf4kGBbdGTvViFE9MsXHupSpDVhIe0piCckyVMYr6kMspZCBJNLUaRihIWvbDe43PuqHD8/NJLd+i5v3RIPL0LaJ/3fVljOEuLMYWultWkuQ3fh0bZq1To3Z/Te6DIF+Dea0OIJMQ2DfPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tYOBlcho4eiXVwRrgoev6ONW2QzJO3pPvTgMKq8M+4=;
 b=JAKzqPQAiSSkoKK1E7Asvx+hXTkwf4GYPXCWsD6vF59ASkGm6Za5cg29Gmesy8qhxt/Rd3V6dpN5QxuQkFFt3/kMcZy9TTOSo1kAQnqD+r4lWQyHGupJd/GifdER8wCJ5eb64uzm8BL7TfpUvfToOWX5HjALbqu1NelNGW5k/IVcUARu6EVLdnvry6Z1+PYuKl7zjE8FqsReH+3koAdQwnuBViiUQ5oBcaMst8K8nQf4hkupOIljXcKLHnnCtOeCJKJ5aJ/5T5LyDICTHO1iEhJcnNdv1SQeWWJ3p15oUrmz8lq9A3Y+J+gUGaD1IdEQ2BjjiVMOFYgEwY60qmd5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tYOBlcho4eiXVwRrgoev6ONW2QzJO3pPvTgMKq8M+4=;
 b=pi9TZ7y73TvyjI52mVI860e4PL8yvQ+EroQoQqBkk6tF/2/2Wd6PpIr6Kj/2k1w4NiPzkLyspjgCOKuNoCzKVg2HfmyaRfHGJxxmTiE0fgdf6iCNJWDi1ZypMOiKo3vwStFAYBdOISIezsqXRO6VAhuLao9ydjNplP/pc3vBUds=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8239.jpnprd01.prod.outlook.com (2603:1096:400:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 13:26:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.016; Wed, 24 May 2023
 13:26:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v5 10/11] regulator: Add Renesas PMIC RAA215300 driver
Thread-Topic: [PATCH v5 10/11] regulator: Add Renesas PMIC RAA215300 driver
Thread-Index: AQHZjJbpP+ZSW9yeSEmNyx8d/5Gt6K9pQ92AgAAonSA=
Date:   Wed, 24 May 2023 13:26:34 +0000
Message-ID: <OS0PR01MB5922D300A81ED5E007F1B45586419@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-11-biju.das.jz@bp.renesas.com>
 <56f408ab-a969-4dac-b55b-80179fa71165@sirena.org.uk>
In-Reply-To: <56f408ab-a969-4dac-b55b-80179fa71165@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8239:EE_
x-ms-office365-filtering-correlation-id: 76538413-a503-4c42-2e5a-08db5c5a7ed6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +F9wSrTCi0Bc2UnDBDsuVoFVOa4+IxXFspw07lL04gqOpVkC4nIMeR4PcpntRfvlarJU7OhR/kWiy81RaiYW8+oWWYCBftBvwsm2QLr1BkKML1zlL1934Ba/3OGVxkk1DYtcQrP3GQcNIow5h8Mqe4Z14pEAK53+5g5jKAR2Rlg1kszZHLW/P5/hDr4ogCA8uTMNjS2emQetzYd2P+ubsmAg9kHHycQGAEjZ6t4ynGkqMUJi9t8MNRib+pU+lrNLudxFZc6g8/9NeUCWW+B3F7loSL4Rw10DQJPHDV95KXlU3XFjrEwNVQg3HObfotqot2Jv6WIvNXKP722TDI51K9SYkI3u+2o2nUeTLk0RVlnoG1AWwf2XTkOyb1w6cS9jHJNFSxVJGaXuDyrU/KFzljNBorSBGZFztxJtIV9+zMQHZ41BzimeXWlkllzp9MPX5ABxAdKZYTJjhSiaSdsFyDn3aIn4V44l5MB1ulkQH+0td2qQpjLB1aOqep6mOVEmAg2KK2yD4PnGJ1mWeFqZxafXw3B5xiYzGKiBpBqmES026PG3bU874QO2sOHNW4WsraxfeHYDMAv6z90JimQbodcg3G6fzRdAhtlpY2lP4ds8GG0/FYi/Dap3orpU8vnw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199021)(316002)(122000001)(5660300002)(52536014)(33656002)(38070700005)(38100700002)(55016003)(41300700001)(64756008)(66476007)(66556008)(66946007)(66446008)(7696005)(107886003)(6916009)(83380400001)(4326008)(76116006)(478600001)(186003)(8676002)(8936002)(86362001)(2906002)(71200400001)(9686003)(54906003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?++3taxUOJawBXejPG7mjbHu6Z9IE5fckCWZUILqtP6kUNBb6ly2cdKS8MDrq?=
 =?us-ascii?Q?Xe3NtL2Bg0PlqL0enXEVADibFiOw4qtEBJC+OCxsYhvlPMsdnfp9SpX1mZ1r?=
 =?us-ascii?Q?kaDm7yqbrUTTqBfJXq71GSoEWflBZ4rBNTLCWpGzJJV00jkdkUSq6+Dl+Oz4?=
 =?us-ascii?Q?9Wp7OUfuQLMfFtkIHjqu5pfNkggT+O0p+5RDPVK1Ub0vTaJRfPtIcnrCwgwQ?=
 =?us-ascii?Q?s1fIqn2ZCpVRc4O94RL9SyA8miv/srGGWDvFsFPcr9fiSKlimNDo4EWOGVza?=
 =?us-ascii?Q?r2KnHEKFR68rQekXyeACGYQjZSjZgY8ktEIkeinN9LA8NKJwlGWUuR0ebN5a?=
 =?us-ascii?Q?7TS0ltE2KhgmBp9fLVeswBJUMMR2lEPsjvI2SWawMUDgK+pKyKjP6PDgCuhQ?=
 =?us-ascii?Q?oVO8U6tN4lsZctQzvgyKDvBcxzWScWeMvkDTt49hEciB6GXI5f8wH8ABrHAR?=
 =?us-ascii?Q?mmQ0EWIFbiALbBP7rbohOfoa1lmGZZ0Q2IhEBQWMsgJKD3M+yI0bSffPFF7i?=
 =?us-ascii?Q?xS3wEldgd+iVQkMevnYtMmraGb31TzJ2iv5Fa53ADNKWdF5yVR+5WjlBCeD6?=
 =?us-ascii?Q?h3MkZmzLudySCQ6IV0KBfg+S/0wrrXpTPkP4yqHMeSs8kI+EYHOaRO62dPk2?=
 =?us-ascii?Q?y1BAhOED9Rtfc6GMghab2Qn+kE10AMg5b73ozJ17XDLmybdKvhGeZaQe8cjo?=
 =?us-ascii?Q?KDcw7ngDynyhs89vL9CtME4sx8w3ZfgNqblQRiFqELvhkaMiLPQ3O4LPe4Kb?=
 =?us-ascii?Q?4zdcxeZwQcj8EfssekftBZe9h0SNJ1B0fDY4WdDHHa9OC2Jf63mFFxfKbnSE?=
 =?us-ascii?Q?bge80zw0IFQf3sf6EGmAcjGq2U9fQk8JmVSMp5SwpJyqD4hbGbxhvH4N1xp4?=
 =?us-ascii?Q?fjQluEoKpvRvR8PNRdI7kq3YD0jNeV8thGazy0hzkMzo3giqj+8v/qh4FMXm?=
 =?us-ascii?Q?U4RO+L4M8mpNpuTDVkfXpM3tmO2QwmgzLWLHGBen5EZPvbktIYomOTMglmBG?=
 =?us-ascii?Q?DaYRvgoyNVfCjE+pQ+qG94fZyj6S8nT74i0rHSSLVq5aTeYR1JoM1vE6mSNN?=
 =?us-ascii?Q?vWfAKKPW/iX9QrYbbsBxOkaB3HLICo/l2vwAr4r7+7hd/7fzc1CZLo+5BYrL?=
 =?us-ascii?Q?ylpzgFIrwGIbkSRY8NxfGaPCGEAaTjK9uiCuqojsxLzuqRi/wbX4JjXG2EF+?=
 =?us-ascii?Q?ebX202VVs/rI2Y9wR6vn2W6bwUVKB/lAXFxvHk5lsXTrVTej8lx7k9cjFM17?=
 =?us-ascii?Q?Wwct/HhrZIew6cgUlEFvf59ps1Ae6BB7kgHHqwVc/nuhRXkNQewsMb+K1Nef?=
 =?us-ascii?Q?S1MK1eSpN0bfjw0Iivth7XDiBAYZPiiCVX9Csy2S5+icQYNZ4strdQsKiyjB?=
 =?us-ascii?Q?pNamXQRr/5cowBMpuZxVnE0Se7/b/lJFRm75XH4jy3Tp6TjZYQXpa/BlfULQ?=
 =?us-ascii?Q?dOzStIgDX9dxvOqJ9Rv+yRQuemzHNBG17tAsk+qdNfapCOf0KW8ZG+b+3wbQ?=
 =?us-ascii?Q?wexyMIkHFPd7cQiYTeaMC4OzovzJ9Jy8gpN+uafrQYods/9hSBMRyVx+1YqZ?=
 =?us-ascii?Q?y/pAPUaCDY4a14XGgd0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76538413-a503-4c42-2e5a-08db5c5a7ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 13:26:34.7818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HghjYArZe8dMK73mLGtBNLJSTaY/y1AZv6mBdvsrUscCf7WMrdHbEDZcj0UHnkHBzP0OqajhZW34v5qAlx46vuk7qeL10NG2v+hEoRHudrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8239
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark Brown,

Thanks for the feedback.

> Subject: Re: [PATCH v5 10/11] regulator: Add Renesas PMIC RAA215300
> driver
>=20
> On Mon, May 22, 2023 at 11:18:48AM +0100, Biju Das wrote:
>=20
> > +++ b/drivers/regulator/raa215300.c
> > @@ -0,0 +1,102 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RAA215300 PMIC driver
>=20
> Please make the entire comment block a C++ one so things look more
> intentional.

OK, will change to C++ style comment block.

>=20
> > +static bool raa215300_is_volatile_reg(struct device *dev, unsigned
> > +int reg) {
> > +	return true;
> > +}
> > +
> > +static const struct regmap_config raa215300_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xff,
> > +	.volatile_reg =3D raa215300_is_volatile_reg,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
>=20
> This does not seem to make any sense, the device is configured to have a
> cache but every single register is marked as volatile so nothing will be
> actually be cached?  Either some registers should be cacheable or there
> should be no cache.

Will change it to no cache.

static const struct regmap_config raa215300_regmap_config =3D {
        .reg_bits =3D 8,
        .val_bits =3D 8,
        .max_register =3D 0xff,
};

>=20
> > +static int raa215300_i2c_probe(struct i2c_client *client) {
> > +	struct device *dev =3D &client->dev;
> > +	unsigned int pmic_version;
> > +	struct regmap *regmap;
> > +	int ret;
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return -EOPNOTSUPP;
> > +
> > +	regmap =3D devm_regmap_init_i2c(client, &raa215300_regmap_config);
> > +	if (IS_ERR(regmap))
> > +		return dev_err_probe(dev, PTR_ERR(regmap),
> > +				     "regmap i2c init failed\n");
>=20
> Why is there a check for I2C functionality here?  regmap will do the
> checks it needs, and it looks like the check is over zealous since it's
> requiring full I2C support but since the device has 8 bit registers and
> values it should interoperate happily with a smbus controller.

Agreed, will drop check for I2C functionality.

Cheers,
Biju
