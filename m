Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE21A78AF44
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjH1Lrz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbjH1LrZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:47:25 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20713.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::713])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837581A6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mq5ih6m56LPpZ9Ut0akpGFfpPavLdwN3O6nePJe8Rn23k5INiAuWScb0eKlinCcG7o9Xo5784HtxxJxnCzKHNJAxcNa3l2VDJJ8umUrFrDx8aJ270gu2DgaJsPZX4yLa/EHyGpPY9e4WYaL1KexgEd03jBXa5EUenl3dxahqaVHs6fdBqMgnIxwdxtdBC3keABCSWT2/Gz8v28hwyhJsTKkdB/JMx4m6oRN2vIuaJQEHZP/C2/qFPyVLmZ1VxwR71BtjWKCdNZhrucb+7BUtRiZavFYXIE7KDl/CEsaBkp+HVPQpFXgPWW9AOdwAYXaWNb8IXsrgr+yegDLPOxAPkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bzl8oXz2r6rB8MrwjIzOYdt8pD0PHsH4kpKxO2x8jg4=;
 b=EBSxaxijhFME1g5c9UZIXbwIdJex2PVMJiSg0YzLcGehmwSOxCL6ZJ+unneCHKIFD23mFXxFDoDjeE52CLBrJ9DgZmXOSBOfSjAejiocrAUo9H0gl/3lNMAq+pDXlZxynjNlIHbceHXZexU6pxqP1u8EYQcSRYdbdzENwuVMOdxHN4EnhsRe2sLLcv0T+g7xXotVkvIYI2TosogJ1MTLseeRP/Uplru9EHonbu+bhp9Imx4/bMZYvogu5/W24wuFlaTWiW9z3g/CaAVWyCoQNrq57A3/tBVd+1SY/JpBRYLCH/BqCT2i6041ZY6Xypok6uzVoYnbhP0JZN945uopEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bzl8oXz2r6rB8MrwjIzOYdt8pD0PHsH4kpKxO2x8jg4=;
 b=DsAgNkgejvnkyaiNNTy5tE+NeNmjEZ5CuHVhL+/PZs2k1WrRf0pCHSO3t2avSCer4N+O/m6fs3EaHzKqX5Utx/QBrdqOse3i2+luoFWRnlTa2IwTnuTgYPr7eAFQtSTrFHq6iWIQklK+OekwBqf1+9IyNkMRF5V34atWNtWH/OQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10812.jpnprd01.prod.outlook.com (2603:1096:400:2ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:46:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 11:46:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Lee Jones <lee@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: madera-i2c: Simplify probe()
Thread-Topic: [PATCH] mfd: madera-i2c: Simplify probe()
Thread-Index: AQHZ1/41J4X8vjfRGk6gbNpHd21Vg6//jEIAgAAN8nA=
Date:   Mon, 28 Aug 2023 11:46:00 +0000
Message-ID: <OS0PR01MB5922BABAFE1E7828C672FBE486E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
 <ZOx9Ei3PIioXdQLu@smile.fi.intel.com>
In-Reply-To: <ZOx9Ei3PIioXdQLu@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10812:EE_
x-ms-office365-filtering-correlation-id: 3cf2eb7c-2a0c-4423-ea7e-08dba7bc59ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N7vaInRnjNs8IY3Dyg+0voa0bROTG042xVQXxILKO4swwAk/V6OEo1Z7gwHnaIzZVy0YiHMilLdR8B1hMHuC6PW/gXXNga3Do3dvfBWKYiuN03COKkFf2D3SurtXTUuRXr98Ecg5H5Ih7B2MX2oFT0ru5thKh1TqXptr7AtpKxSs/Pt3ZF59OrXSlRVVGCTDxO2SeG69rE7DyO2IXj5pqZHAsnxoN9oQS28t4waRabcNSjlbfe7K4EG8ZfZqDQ+3NqZ8QBDx1KhgKbaMVrYlXTAQvPBJfaoJRCss96i91Si8PgJknP/y8JxuZT4zXZOU4i6MypVCu2LAEBpBm4wqhvwRlbHsyEtYzG3rdRN8eZ2S6inXzypQtzOdIHt5h2n8TxpwIiLIgAvfkB9FHA0Ai6zlNfJi1Jt40vWVMa7Utu0itEbV2pwiPHEEJ+2l8HeFzZ0CrMun/kd7wjJ4OZuN3M05TTqWcRutfm9BIf8hB2vP8ep1Z3ud77foRQxFpiLfj1maABDe8ZiOosNgcxx7kgm7SiMHpEuavWAdHNZWFqR5/eEaCPDJahcrOkQktcziJCx3+J0B35ytO/11Lwov8JixUgq7FKP2J/r7vqtEL0xTs70VGBfxyx8JLG3D9LOH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(2906002)(6916009)(54906003)(66946007)(64756008)(66446008)(33656002)(66476007)(66556008)(316002)(76116006)(5660300002)(52536014)(41300700001)(26005)(6506007)(7696005)(9686003)(4744005)(55016003)(38070700005)(122000001)(38100700002)(478600001)(71200400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t96230nKo6J4JDWZ3XLKTzHuWXGFEc37FCEkJI0S7wtc3xj2oarVvs5KCTOH?=
 =?us-ascii?Q?sy9qOZEDLYIi9cLJv8DCkzeng/mdzAukWGEApehcSwNQVVDbvyDNwYtGNM4Y?=
 =?us-ascii?Q?B3t0QG4ldt8Rindl5aCfNA6Bi+MnOvHJRGlX8MOzvw44WpXVt/cpQLSQqQJl?=
 =?us-ascii?Q?knlHY6bFuKjnVQpTjQ0V+bHjZzb8/Pfoc7cvZwXMRnGK7nh7BvvNHUkS5otn?=
 =?us-ascii?Q?YGc3DAHvZg6IELGpQIDn4mLPdeAEA+x5u4k2CDBrn3VZTPZEneRtLCDOxk/m?=
 =?us-ascii?Q?IMrkS8pu+7use3chECBoiDOA4mPjAnX6buKzGgVBgX/ZRc4vbm8BdpjVkASH?=
 =?us-ascii?Q?Dxct1/p+gHrxml6b5e9G9FSZG476gIru3q0GkHbqxFj/ajgaySEjdXZ/I92S?=
 =?us-ascii?Q?BlmILGP4cEsYpwaXOBtBL8YjMxn+nhbqmJxngGTahbHeefdYa6Tq1hhkQDkZ?=
 =?us-ascii?Q?HXFw35LUWMzZMnRCzSkt0R9MR69Nxqbgm29KiSEPiGxVnmvGjkSpqVNiXHx8?=
 =?us-ascii?Q?/qkkz28QKShfSOHAe171pQkLQJ9MkXES/1lePny5gN4k1WQuaSfPHjRGl51D?=
 =?us-ascii?Q?lsCMKXUEo9nl7JI8GQcryMKQfHHKhaZkRh7OtimPciIk+B/iL1D8qjuch1FW?=
 =?us-ascii?Q?LHijp7xTG3tjeV7j6EvzhPZyzZzNeDQQ+MOVDjAN4VOy5XF+0cHtgym9KkjB?=
 =?us-ascii?Q?ZYK23WgnwaYso89fLCvCQlc7W9uLQeaJ/s6tQMVPrCuvgsbb2+jLpeg3ZJzV?=
 =?us-ascii?Q?OCSIAp8skZhsppvr15Y2veSKMM0do0JhXRgMyDKLYlcfrV77LCjsr060vTmO?=
 =?us-ascii?Q?ybvT3ZuJok0G9kcARQDCxmEChiil5vdBuM8j5tFpPBZzo5OxdPVEg1UvREU1?=
 =?us-ascii?Q?VA5O+iv+qyh2OdEy9vKFK/bgWyY4SS54S4vohRDxQj2fOXcGX4xf1+Aw6xYK?=
 =?us-ascii?Q?Ith10H4c/QBHgMNP4i8Sxy1F3cNkS6nraGnyHLxKudqzqBXwitJU7jRiA32R?=
 =?us-ascii?Q?APXnFZBJzrMc9uCHR6Lc/6HH8VQGNU04lLkoKcxiqP11HdKl0Qle2sBAfzEM?=
 =?us-ascii?Q?NtRGAYZsY6NeHWhQlpVuWUyEa7R8vnE/Y+O36z4BJM//4+XlOz+AvHOAJawe?=
 =?us-ascii?Q?46LPMej3moqtMZ0JvSwJCc55cWStzAeHsXvSCQ8rZTngMahDqOXqkDI3uAvQ?=
 =?us-ascii?Q?mOHMdqvIYzF2xypAQr8LcsPcRq3Z06FTorpswXnppl0ZFt+ni37f5Z8pUkns?=
 =?us-ascii?Q?iiM/Sjajoz187avInGgyG6oKHsn/nZvXiklHYzkoNpVIA3tYeZfJhp0RXtVI?=
 =?us-ascii?Q?812jFnlfG8aaTxPttV1GM6zti6LHzzn8aA82CreetVGIRsoZUuxTr2U5NlK5?=
 =?us-ascii?Q?ZeUCxOSBgssciM+0qVCkdNM/eV2GpwZq7WfH9j788U8hHIomhO0Ae/q6xlCL?=
 =?us-ascii?Q?LhFo1NtP9fAnoRRPX17pHdLxWgeo+D2sVClIf9nlX7V3NsX5NAJZrNCi+wlT?=
 =?us-ascii?Q?xWyHWXqfhyWadJ0AvtBvGUEIpG/X/FyFQSdDNYaMw6ZCPBITTRP1va1BEv2P?=
 =?us-ascii?Q?8FPCEHvrdYjry8nloO4hPOnBm73yrKdXk5giAtvei9TV+GrHEFeuD0g6Pgi4?=
 =?us-ascii?Q?mA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf2eb7c-2a0c-4423-ea7e-08dba7bc59ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 11:46:00.7421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cyn20O9uY8wInT8FIGXGqEQJXVug3jyGJxiM/MlVcJPhJWRv8dB9FS9HgiLlwJLO04BazGo0K02qH1PtWHFPmU6SWsreeOb6PcvjIj+eKys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10812
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy Shevchenko,

> Subject: Re: [PATCH] mfd: madera-i2c: Simplify probe()
>=20
> On Sat, Aug 26, 2023 at 10:17:51AM +0100, Biju Das wrote:
> > Simplify probe() by replacing of_device_get_match_data() and ID lookup
> > for retrieving match data by i2c_get_match_data().
>=20
> ...
>=20
> > -	of_data =3D of_device_get_match_data(&i2c->dev);
> > -	if (of_data)
> > -		type =3D (unsigned long)of_data;
> > -	else
> > -		type =3D id->driver_data;
> > +	type =3D (unsigned long)i2c_get_match_data(i2c);
>=20
> >
>=20
> This blank line is not needed after this change.


Agreed, will remove it.

Cheers,
Biju
=20

