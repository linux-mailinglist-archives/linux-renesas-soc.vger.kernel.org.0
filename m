Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A44461150
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Nov 2021 10:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343789AbhK2Jwg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Nov 2021 04:52:36 -0500
Received: from mail-tycjpn01on2111.outbound.protection.outlook.com ([40.107.114.111]:26755
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229623AbhK2Juf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Nov 2021 04:50:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEjkGMqflCJxD9Dk9YRM48p262XyH44+VeHiGP+Y43p9jUVdbbDQS5biMhygiOjvKi8qBpIbnyP8hry9n5HSBXYXzLRPhLgVHt8nKZT1W2llSkWkSBS/saWdMQzKbpIfGlvNVB8R9igKcGKVEbxpBZRnEwPTiD7RgKP3ZSuqDk+ZYSHu+fY1Sm75LVbPxoIs0Y/Ukj8o+PdhIMr75r9BqmnxLKKcnNDx1T/p8EoE6xJ7JJGfpK1hKZtv5EGJ7v004+6iBwab3vKjtXTzf1m5eFfgbuwEu79B8rO2nAVALrGN08JNIJou0e9bGur1rx/IAkQV94g2lq/qOjyI4lt7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf58DVmEqff9YanmQYLtmOOcFgDdFXq+kznn2BWH8Z8=;
 b=PSMQU6YrONBCrCOgixAuJ0O93O+PVUHcO92jxVfyNrhQePsGPYubPWhkUEyokvu8CmNH7/sU/dFSaPsSdpouBps3vYzKaeFmfIetc1jKLY9oLYpK0q5DpfEiB+AytEr5yOYCH0WjYpPHlpVxhvOEk0hBYvWOs3BxEEF9Srjx0UStovwQQXZgUujZHeOmxlr5GyDz2yQx+gaw7w93ruBCRvmy7UPNl5v1y/pPNyGaHVDYTNmnqgeMIbDNlF9AVd10RFkBFCv/yZoPyImeIQeHhQA38sOyS0O/W2T4+NnVd4eueHoiZTDr9ib0uc1t5LhuHNV/ssLgitnssBk69UN0Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf58DVmEqff9YanmQYLtmOOcFgDdFXq+kznn2BWH8Z8=;
 b=q4dO48aATU4biLd1HWD0I0yxwv8XTIIur6VzpIIcsSu3pzkxGwJXRhgcpu2CfP+QJcRCb5CFdCDt0WnstvF272gkSTTsDrSfgj2Z8dovQKdg5H1qkP1PI9evLU1vSu0m0cGEdBFTjjoSnDGdUoX8KX5RVWDJq70v5eeZ75sI3u0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6577.jpnprd01.prod.outlook.com (2603:1096:604:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 09:47:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 09:47:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "dri-devel@" 
        <"lists.freedesktop.org dri-devel"@lists.freedesktop.org>,
        "linux-kernel@" <"vger.kernel.org linux-kernel"@vger.kernel.org>
Subject: RE: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe ordering
Thread-Topic: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe
 ordering
Thread-Index: AQHX4q8a5cXhcQbc30ydYfJwY8HDu6wVoKCAgAAC5oCAADdQcIAACc8AgARhDmA=
Date:   Mon, 29 Nov 2021 09:47:16 +0000
Message-ID: <OS0PR01MB59221F57C8C9D3245E62E67586669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
 <20211126101518.938783-5-kieran.bingham+renesas@ideasonboard.com>
 <OS0PR01MB5922819388EAA6973EDCD3D386639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <163792426732.3059017.2780398503330070326@Monstersaurus>
 <OS0PR01MB59224CEF31F664A5DA1EBD5A86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <163793825240.3059017.18322130230821103255@Monstersaurus>
In-Reply-To: <163793825240.3059017.18322130230821103255@Monstersaurus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 206c6cbc-e819-4a5e-77fe-08d9b31d3a95
x-ms-traffictypediagnostic: OS3PR01MB6577:
x-microsoft-antispam-prvs: <OS3PR01MB657767561C0B851F4836801786669@OS3PR01MB6577.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P3CjnPFueFbeYz8tkoRV/U9+ad/QN7KEPqSGqZsl82dep7AmiIdJZ0XY4frPbl7ZPJ+ceDpQ4gTAtttD1L+ax36OZ7Nrkm8olWrHgWX+IpXnR1ElmO93PNcKnOnjnMUcEoeiUQjyuKKlWa8K9TyE9PpuN8Yhlh0lPaRsJrap/1NSOYfznQuoAgRmIZevIULsBkYnKLDeruHM9Or4S6SypuOwi8/Zbxbic9rxikm1gdiW3DL+fjYeQqJbtqwpyg1AyHAkxl0016i4c7ve2fbQCTnRCTLql4Z/3T3jt/r3IH45mca81iEvMib29eGLGgCYWyPZ72o0PmJQ7R5dz4NtqJIUqn3EBYdHZ0VkH3xxUBopGY7DWD/7GJYeWopzq5y56p79GRXJLHYv2SIVTLMM1+JzNvfqSQwhYEhQKH697xA2v9QwsK0e9RkB3bvmUsolyQEdDnsCUzWpn4kmSK/YykZu+m5bDPgPiVhB2pJxsX7JpqCAzQeDETYZzEiSrokxjP6upp2TOXWh+4i2V6f4DAk3pZJP+z6fvF2MhUNpS5OdVZvzugdaA/YmsLycHl4gMUxeut/rBnWyUk4R82WUmnU6nc43pFj9Io0YWSPoeevh333L/Guhq+O8WY66ZUdQmrIczgRZRFVboshGok+SkHA55aT91m08/2RsNJm2jYQcu8PkOZkVjGC1zfGeG1Gi/l60Zd0f4jx+8ZehKop3VQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(2906002)(9686003)(508600001)(71200400001)(110136005)(7696005)(6506007)(4001150100001)(8936002)(66446008)(186003)(5660300002)(54906003)(52536014)(26005)(8676002)(316002)(122000001)(66946007)(64756008)(66556008)(66476007)(55016003)(38070700005)(86362001)(38100700002)(76116006)(4326008)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6jJV70PaSPAneTSEURiBSps22ResCEf6vbNR0lNmAUHQJnKFFw6OxKVkcm/w?=
 =?us-ascii?Q?Gl3MqIE7dwIRkflcjBIrAV1PrvHAPI1zcGemvKwysBo3C3zwZxX8g/JnPio3?=
 =?us-ascii?Q?40cHzBerv5IuXMmmHhGbmo0ola9YzJWYHKV6pqnHp0lGojZa2WCcOmyTbfF9?=
 =?us-ascii?Q?ApJjl5NHgdoP/p3D6zVDGYZPgeTgzL0fpyC6SJUl2Cil5avBIRkzR2Jdz3/6?=
 =?us-ascii?Q?Kf1SWrYH5qF9dyIr/ctMqsF5PVbM8zDYzJYt1620gxBJ7CS5pVokMMuQ47J9?=
 =?us-ascii?Q?E9vrTyz5zrvi00vC0t6tDCUbYL5I+J+wfgtONlnb4pmau3DUQX3rZGXbrFPT?=
 =?us-ascii?Q?FGJrcTkCAVn8hmIMXWkBWWwPzZPdLXL5fPW2CCMqnjwSoph5fqs2V9/fcqtZ?=
 =?us-ascii?Q?D01JAY+4Xmw5Iz8RX9fTjuLmbSakE50EgA3qoaf46sOJK34E/trokbIOVhaX?=
 =?us-ascii?Q?af4/sPZ79DRu5yhvDgISXuNsYKL6/Y8jR097iTMFj70X3bzDVhrxwIo0m2/j?=
 =?us-ascii?Q?Ep28E4/Zss2X7r/taZAyolhA52tnJMQ8S2nAINkjTjtzMz4LbvhBYqJyWixJ?=
 =?us-ascii?Q?YrfB+48/U8sXifCQUSsp0j+7ySBmsLYdl9ziGPVnXHLcFTpBTlC9PE22gI9z?=
 =?us-ascii?Q?Y9SSIoQMa5ejCbIhKU4TJSal1o2jOu3O40qja3EvetXxNwtjygUGyywrdXvz?=
 =?us-ascii?Q?2bt4jHNrDcEq5rBGIKA9wBOAoA43y/XVj3snzfgi6SE2vWsQqbsMTWjG7rzs?=
 =?us-ascii?Q?Cj+tKyRom7Opj1npQ1Ui37rNGuDLQwthdiIQ5NEcw7WBEtENsb6/pYhQ/S18?=
 =?us-ascii?Q?NvBzp7vWqFN2LmhNn7VDvP3Yv57acW8tsJA03V4ck9boS7uoixaPYJEVmYfZ?=
 =?us-ascii?Q?ytjQlMupupn8ZEF6l/XvrwE0+TVF4OhjABkGnsQguv/gkYgSTJlOzRFL/1ay?=
 =?us-ascii?Q?2q1FWXcc8ShB5Yi9EAk+CRIL01vLlMFiyuYtYNxjuBJPgtOsvwY7yMXdgBDy?=
 =?us-ascii?Q?HRMDJ9EN1Uo7MUbTgZZCSsePBqgJP+iHzXbQCmcT6y1JHDLeoEhZdDmfnHcM?=
 =?us-ascii?Q?c02x15CHS4z/u1uLjXuttBSjU9Jj/eP3yao08fW9sSs2/VIitNtE7mWcWjox?=
 =?us-ascii?Q?znAamuFOV8GbYsoBnka4V3rfa739G4Wc6e8QV1G++ociQlgG8BCsld/QhOJ9?=
 =?us-ascii?Q?24bvuyFgifmCovhrR8WIG3m7hnEnBWSPRONGHmy9NAbeBBYwzGf6zvBvqyfN?=
 =?us-ascii?Q?02sIvGxSELJ+/3DchiOO5ePGl8qDCk32mIeEVaAlG7ek2Ld4RT4p/BvVE4Pv?=
 =?us-ascii?Q?R4oxMqGMxfsWqaIsnE5kJqqjLCIeG1rQI/41Zi4NfrIyEjlIUCor0tKDdAqk?=
 =?us-ascii?Q?frEiAoEYES0t9pJMZoikw3vsLbbI9lI8jwfQkjuvOOk9geRbmlTom5IFcsLk?=
 =?us-ascii?Q?f0SZ/Rq5ZwoprSmAEV4vMKgkfOQpRpSrdHVJXVuLiMsC0q5+QrQ0xcXKK0np?=
 =?us-ascii?Q?CUiPrbvtOvk8aqVhwXGgblH5XgPCMQv9uTFnOyDxLR7Lg2FaJDi6OYAWnWcP?=
 =?us-ascii?Q?eXcidqaG2rYxSYUtBX/rBg0Zb4CJCoEtrCt00XC4/Ua+yw3cjfxjTHn+bQh7?=
 =?us-ascii?Q?nBhuz7u4piMu4ApYJ44HABlWfs9eah6maWb3kNZcRF6W4Wg3uvwJr6feaQPR?=
 =?us-ascii?Q?nkrQ0A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206c6cbc-e819-4a5e-77fe-08d9b31d3a95
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 09:47:16.6191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9jsMurfF+pkgj8RlF7RH/f+7Z/iu808MagVRrFZWCpCGfA3gdjsRxk/Lz0mBq+s0b4EvOLqHUA0baYNUAZmVRMquWhhtv06pxuK9xLkwjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6577
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

> Subject: RE: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe
> ordering
>=20
> Quoting Biju Das (2021-11-26 14:19:35)
> > > Subject: RE: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge
> > > probe ordering
> > >
> > > Quoting Biju Das (2021-11-26 10:51:48)
> > > > Hi Kieran,
> > > >
> > > > Thanks for the patch.
> > > >
> > > > > Subject: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge
> > > > > probe ordering
> > > > >
> > > > > The bridge probe ordering for DSI devices has been clarified and
> > > > > further documented in
> > > > >
> > > > > To support connecting with the SN65DSI86 device after commit
> > > > > c3b75d4734cb
> > > > > ("drm/bridge: sn65dsi86: Register and attach our DSI device at
> > > > > probe"), update to the new probe ordering to remove a perpetual
> > > > > -EPROBE_DEFER loop between the two devices.
> > > > >
> > > > > Signed-off-by: Kieran Bingham
> > > > > <kieran.bingham+renesas@ideasonboard.com>
> > > > > ---
> > > > >  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 48
> > > > > +++++++++++++------------
> > > > >  1 file changed, 26 insertions(+), 22 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > > > > b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > > > > index 833f4480bdf3..f783bacee8da 100644
> > > > > --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > > > > +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > > > > @@ -639,6 +639,8 @@ static int rcar_mipi_dsi_host_attach(struct
> > > > > mipi_dsi_host *host,
> > > > >                                       struct mipi_dsi_device
> > > > > *device)  {
> > > > >       struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> > > > > +     struct drm_panel *panel;

After this change, panel is unused in probe function??

Regards,
Biju
