Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76ABF5BC459
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Sep 2022 10:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiISIdS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Sep 2022 04:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiISIdR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Sep 2022 04:33:17 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE22F2181B;
        Mon, 19 Sep 2022 01:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GX6hHuF1Q7QSA3UTBv2hGWbLF+Y/d/rdVpXr4ImVOKkPmsv8lzaUk2thFNtVNohV0V1Dz4y2/L+tZzFECtSYzySc2Q+kRBcZC8J7aR2P7AWFlxCzSRuH0iuRciG2KsMvnQ0DRIEat64InJ+ctqAfWtmi2SaEco7UtLqTkvqmTaEoC6CZdGey+WKQuZwRnDNksh1t284+LZqIEIMiaT4S1JcFXpEnLakSLSDzjohFNMGjbNN5vpowgkEmUuDmC5c0FseaVabZbZjajxbk7WCHWDKMiEKWG2XadZBEqSVnPURONz1IQgzm987h5QetRq8PDs7YqMeKrnw1WsDfieIXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbvOlmhEiMwhOMkylzqvrTtdzwEAtZdxQMBzX/7P1DA=;
 b=Thjn1+Bcm2UDgqWnrbs0P1p3r4YEi7TshQkgRdEKkXChkkYGRa2lijrwox24P5wu5OOv/7PQIHbXVghDtMrYGc/0AOFkCCKiocoEBzE1+PofkjbR16lyD02GVjhrtF5hYviJulhkLKTTZcdzQuHnMiqLfDzbU0zD584ZndqmkEiEol6+tinKu7XtAl3cB/TW+K/U5Cgh9VGoxN02yLzbJaz01jva8xMMe3SCFkIriiz+obUT8Ivcsz6qxcvZTxoZt4XnTCHCdJAQ9Gyr3hlrhqESBoVFV5nBRikzVfxtWXPrB8gSytelQogZI+rxWsxJC7ZGeVKCWA1jJzX6//jWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbvOlmhEiMwhOMkylzqvrTtdzwEAtZdxQMBzX/7P1DA=;
 b=IEQRYGUPRBxjc/xPbbTKPkZQxcFjFZtGFJstK4mA7G/A1wUorywshvS5FbfeYKS2sYuD7DVoGuud/eh5jeV1ljQ/tdyVBHodn9Ys6LwNPWkRts9jhmXqp5ZkZCWNcA3+6ggaaEiEsXPjK4FaGRVmFUSbZZeUi03Aaln+KFrpZZM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8237.jpnprd01.prod.outlook.com (2603:1096:400:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 08:33:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 08:33:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Topic: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Index: AQHYx4wC10b6ZMAwoESpl81Rqm30zK3dmNGAgAAAmPCAAM/ZYIAAqVkAgALV7ICAAFNBMIAAJLhQgAAH5oCABAviYA==
Date:   Mon, 19 Sep 2022 08:33:13 +0000
Message-ID: <OS0PR01MB5922B3ED211F7491701B9FB1864D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
 <OS0PR01MB59228767EFF2C9FA75D01B9486479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922BA53872389BBDBA8A72E86469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWJ+2VHe1--FrzaekSe=Wfn63GrGvpdjZ3uUUKacV=7Bw@mail.gmail.com>
 <OS0PR01MB59224F0CD24972487904C29C86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922B3C19E9806BD30A8FAEB86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592274E1073EDEB237A615B186489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YyTDCeL6FXB4UdKE@shikoro>
In-Reply-To: <YyTDCeL6FXB4UdKE@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8237:EE_
x-ms-office365-filtering-correlation-id: 92691c5d-c7f6-48af-4f54-08da9a199794
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lYVeEl4KhoJVdVFOCm5OFnroInvUhexfRgLBQMAXRkopvBD+WHLTW+lnEdveo2JauO4lAXQWA3PvCMdKFqmFsTqGbjmbRx7lxOhr++23IRtqV2bPDQnAe84SaJ6nBreKp+XZdg+8MdF5i+3/pXxA5h3jHEMpnImTdQDMoTxhFV9PWJUh8JfBCYNLnqs0GvnaKorB/MOPMyALX2fB+mvt6dZHt/ODGAlpSl4+0lpMp16/EIkXRY2rsu+UXD6rhtG2XHmIQEzFIjp6WN1uGmk0XssomWVQnfz/cfil44Dc4cu2JUQUhi1/53XypvqZ2My8D6d1BcT+8eQDkbLBYOwTUG2fvslAPGodL5+D66wRYy1KzCUNwyS8xgJOzSQ00qTHEqNtEtLkOF0QKnC7ykyrs2TfE8B2WC2FZ/VDfTvYVD6RCjcdbL81Jj6xfvTiN0ZUsKNCPWRU49sqxf/0wwfenq2Gqnv+zk5A0BD8pMMHej4O/4MraqCOPDR+Qk17PkZ1UAn/6a3gZcjh07U6FqLC4tzZFjwMMqJXFmbX8Uc95PhKn+Btl1BIJNFWwKk+d9jFozXXkRsaFkJU8wzF30NLRb7Y7uA0kat4Q5Hxxy2SNMCsZ1JyqtmSPb9vkrPWc6b0mU/A0Yj49gUz1ZiiQK9iiDyIwIjPd2Eoy2sUv+HcUUbOxaP2S0WiO5zoK3MmIIgX838Dz/KFU17y4hH0RgIh9PgjNo0gisO9JTaZpQrmsaPtrNIHOAJSLB7iIWRAedV4hJTTCpP9PKlpPR3F1iEneA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199015)(66946007)(4326008)(66556008)(8676002)(66476007)(66446008)(5660300002)(64756008)(76116006)(54906003)(8936002)(86362001)(33656002)(316002)(122000001)(38100700002)(83380400001)(52536014)(7696005)(107886003)(41300700001)(6506007)(71200400001)(478600001)(186003)(55016003)(26005)(9686003)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eky/wTSMJFOiDmCfN0SbkuWjhM4VU88blA2DzlCMUj98RGmslrsWCiW2pHGv?=
 =?us-ascii?Q?80tTrOAsfNvFsA6l9yAf4NrZPuYc/yEfpqbOadCdTdsqICeXxEC9FBTZEbuB?=
 =?us-ascii?Q?zN2X3+n5px0Qse5BqpI6cNFujJh8WX/Y5Amvt2LHaUrxDjNGeIpZO3ajkIH8?=
 =?us-ascii?Q?MxN5NpkuSt5dzBXXT2qCj+ok+xgrssqVKk61x5puGzT+Wr4bWmHbE5o9k94b?=
 =?us-ascii?Q?EPXnlLfB3uLMOgmEOE2GRsCFe522zZ8/oPgA/SFpSjk/VJE1tvZy0refly30?=
 =?us-ascii?Q?gNuPTW1jIgC1kRNEzJsIinJFQbRUiHpjO+amCWXKIR7vkHvzqF+shy+2ANjc?=
 =?us-ascii?Q?fntyB3crlq1IDhfC1z0cYMip9nMA6LCDFdVfiBVSP8BBcmL6JE6eNWKdyz1t?=
 =?us-ascii?Q?HPSRcK6mvKneJVLBRiYRAYw/JqDfY2Wa+QN4FvlGPoG//TSzHrLrlZ8gvwPM?=
 =?us-ascii?Q?P5ADMnIOCgvWB7TeQrFwzX6rgzip+bXE9k8iHuAVCUW3/NpHdOs9R4ekBP15?=
 =?us-ascii?Q?eJA0iAgVC2OoQ2qb7a9YwKmcO4A3uqvDBiGc9JhHjrXs6EHXE6ubRNE4GwCC?=
 =?us-ascii?Q?ZaDh2c7epC67xk00JEqn20SqjMc+EoQIVfjJFN+nLldBHbuOQb448kCIDYTe?=
 =?us-ascii?Q?ZTsmp1vEW5JlkyItTFH/Qt/1qaW1P3wd4b+fajbeVCRmTZVnW0S7Sda19mSn?=
 =?us-ascii?Q?PeEfdqeF7KgI6H6cw7YCeNzfDc5bHuZnIXx1acyyLbYHrsSRn9hHmsMRi4PP?=
 =?us-ascii?Q?motIBsRPhZFe5lC4YSNyrnFvGmzn+a/ZjBFP0c2vdsD4TGXAu1Au/3MrXUaq?=
 =?us-ascii?Q?ErRUMmKeY6omzdgK8VWD9BZIi6JpOBMo4oNLnguwDJpPNUTgmQBh6WHpKsTm?=
 =?us-ascii?Q?0D0BUG0E++BPX1EZXsOY33QEeb0ooFaElfSxcSkImIha16zWRv2uZDmLDEji?=
 =?us-ascii?Q?oYOmA+6pRgPBsuhW9rxH7v/mgAtQJUHJFhskK5qwyJnjat1R7akwb2gkCxuB?=
 =?us-ascii?Q?Z1HXipJDL1vCLBvOK9du6NC9DvrEQiHmlvz3QL3ICqTN6pOQ27Nd2JbqVbHg?=
 =?us-ascii?Q?8o65bEBcf3b2DXnOiPg+6d14QVZHwCVtrV3xt/dOcuJ+At+jGyHOI91vzEv/?=
 =?us-ascii?Q?pjeNkX4bpjps6ZGwrr/CjUZ5l79iaQxIw3qoKEnjiXg5e5+gWpzhnRto8g5l?=
 =?us-ascii?Q?4cI15xu+e+rxWkIr6mjt4eiOip73IYTPhrDzCAfN9HeHIPA1tmBc1EPgTeXF?=
 =?us-ascii?Q?CXv8G2jtj9hPh728pRGSBTJlYyGp/p08kECuQIZ1Foyv0sRUPlsRQovKrtPU?=
 =?us-ascii?Q?dT3spRZXCSCA1QtA+08LDQo669yI4jd04R7rCfkYl6uZpvpMLLhU0NDLdtrW?=
 =?us-ascii?Q?BsayTw5OzK28CjuzjAiSPyQ6LYgHfxG2Hj9Nsso6he/FSzaCH8VLKhW20jTK?=
 =?us-ascii?Q?NwM40wSDi1DdCeNjQEyDlHMmtMcsn4JV5C6q7Cwnbyd8CjE1p5DbLVFE6gfr?=
 =?us-ascii?Q?OI9A0aikv+odqDJrquNh7faIrQ5HVuGDa6L8UT1lajPl6pvammlpdzRrNt1V?=
 =?us-ascii?Q?uDP501N7MXdgzrbLFbs8gtfigg9J7MAtaLPxb8wXIK2DzfFrUXPRvomCH4V3?=
 =?us-ascii?Q?FA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92691c5d-c7f6-48af-4f54-08da9a199794
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 08:33:13.3661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BLk9jK8BVh1ZgMWDtHJjYbNNpbyDo6SZDCkV2Vf/WyyVYKBUW6YgZXsapJRFPz1X/up+9xZHfqxA6IAsDvWyYU6LqeiCJNZTG2vgcr+Yek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8237
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> Subject: Re: [PATCH] mmc: renesas_sdhi: Add margins for main clock and
> hs clock
>=20
> Hi Biju,
>=20
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c
> > b/drivers/mmc/host/renesas_sdhi_core.c
> > index 6edbf5c161ab..539521f84e2f 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -128,6 +128,7 @@ static unsigned int
> renesas_sdhi_clk_update(struct tmio_mmc_host *host,
> >         struct clk *ref_clk =3D priv->clk;
> >         unsigned int freq, diff, best_freq =3D 0, diff_min =3D ~0;
> >         unsigned int new_clock, clkh_shift =3D 0;
> > +       unsigned int new_clock_margin;
> >         int i;
> >
> >         /*
> > @@ -156,7 +157,9 @@ static unsigned int
> renesas_sdhi_clk_update(struct tmio_mmc_host *host,
> >          */
> >         for (i =3D min(9, ilog2(UINT_MAX / new_clock)); i >=3D 0; i--) =
{
> >                 freq =3D clk_round_rate(ref_clk, new_clock << i);
> > -               if (freq > (new_clock << i)) {
> > +               new_clock_margin =3D (new_clock << i) + ((new_clock <<
> > + i) >> 10);
> > +
> > +               if (freq > new_clock_margin) {
>=20
> new_clock_margin needs a comment explaining why we need it and set it
> to that particular value. Otherwise looks good to me.

Looks similar margin needs to be added to renesas_sdhi_set_clock()as well
Otherwise, CTL_SD_CARD_CLK_CTL is set to 0 and performance get impacted.

I will send v2 with these changes. Please provide feedback.

Cheers,
Biju

