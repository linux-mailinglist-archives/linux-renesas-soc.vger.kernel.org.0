Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C3F45F047
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 16:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345231AbhKZPG7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 10:06:59 -0500
Received: from mail-tycjpn01on2114.outbound.protection.outlook.com ([40.107.114.114]:8931
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353998AbhKZPE6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 10:04:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5qcfLR+i8m7ASgh3fZ3dnYnhL4dttIr6QuhpECqb+al6yzZaQGobhggYws1p3ViU1vZUqSbc0yvmaXM26WUGEvW/ElqWCtsnJ4JzUpls62+rtPvsqxLTmSH6d7PR6Mj4ydiP4JX4ox5uWIVoZQNc1PevOa6oXGWFsZJ2u/q0H7XNYjB2kQ+5RZNd1DMpbL+Suetfc8zFtLlJ1QgJZ4oRd6lHim3HouWw5h6EEIo3584auH4t6Ig7RPxaxN+wSXDo7JYdT5+ozizA6xsyw4mf/HyaIYiNO/VF29aANlj2fJFi75fvJ6tNYZU/SHj5/fjt1vrU8RtuQJV37jGRI4G7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+CvTxxtuNSdqI1tGtFeSwCMsMAPNCbtG1WoCYs9fTM=;
 b=gun/2Ae6X//THhKR17iqEb0UQuGlfCme2vIPKqKjYjwDCAPc6CuEcAVBql9gkeHgPo3tjyz8a7TtsOmgQlpJxlWgYhcR6flVXt1piCbCp0fWSKe4dr9tnimR9hnJz8oD6g5042okjuPs0JslCtkzpaGD6SeYFHGgoJqmg0yA/5afi80YEZnTelEBYY+F+S75KzqgabJRVjvwTlPV3JoEV3bIvA9S/JyUR/mXtGPkooakCZ9jDUAlpF/rBu1qLjtzkbGu3dK11guQUV7/RNIU/SD35CebWpqbifJ526xOrY3qPxakUIS6h3THA0tG2E+cIjWcFqPcm1VSmLWJH4YGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+CvTxxtuNSdqI1tGtFeSwCMsMAPNCbtG1WoCYs9fTM=;
 b=n2WpR2AoRhX65aS0tVOwZa04lnB2HGOHkjRd5cYz5TF383mfV1aozfGadjRuGGuvFC1Sn8y6Rpz3g4vmmFjIvAeAwyom6YeAXDxHTTE3QqbULHFbDiJueinUDt0TXsmyVcJZ5zFPgq2FEh8lyzIEDpqhS8E0B040YXjo1dCOPjs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4022.jpnprd01.prod.outlook.com (2603:1096:604:46::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 15:01:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 15:01:42 +0000
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
Thread-Index: AQHX4q8a5cXhcQbc30ydYfJwY8HDu6wVoKCAgAAC5oCAADdQcIAACc8AgAAAhlA=
Date:   Fri, 26 Nov 2021 15:01:42 +0000
Message-ID: <OS0PR01MB592268E02CD0E411AAFA488F86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 27640215-89ba-40b8-1431-08d9b0eda814
x-ms-traffictypediagnostic: OSBPR01MB4022:
x-microsoft-antispam-prvs: <OSBPR01MB402246027389F66E52DE2F8E86639@OSBPR01MB4022.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NrzqE1mKzo3JVa+vrlu0pXjAhaHcZy+WTkyh36S0KAn+Yqo58hjVjP0jrc0N75EO7BLicqvIfrej/rKjpFv9eNZgk0Hxyzm0MfmD6+LHJDZvT5p32TaC5ob6UFKsksUKQp8WVInZkZrN96Na+YjGZoQ9dwvDMEmONKo7hOTENCi0E1rVcfTI8xBI8vC7EuMkwC05q3qpAxmXYVGic2SgDUU62ak05s96GeChYx2bbNas5NpFIMKrYPMH0ylKjO33sE3wCneKie/Jhkkby9mMPRqko71m/QdnCUYdzFAxAEsBKIn475HNugvGqJhhluEOAcDi0v7gLnR0BthwY+lvdQ3LMgLpGN9GWgO/g23uxaz2P7rif9vvUqlK23U+MbKrA0dLbpxJKEzh6J32S+c6KaE8Xu4gHxg5214pie9wi1FC36DH+YkWJ1t8Nn68WYeIiK2e/rcfsZBEl/LUgJnzIxOWAHCMXI32tbYRBB0ErwLXQ6EO8Fs7Jb+Sffdrz4bb1wxxCLxDlV+/aVFJECduVnromgNFYPwPGRyltoZ2CG/X84o25B/XmJD8y/DXZf94ZxhmpDmSV7jS1m9XnxDNyi8IJwnEqdqcBmg1Bnfm1eMbU9+r2PqXGikK9Q0Jc74PzopDeQgUP9zMF5M+cwXNyWWG6DrFAmE09pgyICRN06Z7bf18ckb53LJurXvuDKqFMbM0ajTKU0hK2GiOYyXyKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4001150100001)(83380400001)(7696005)(33656002)(66946007)(316002)(76116006)(6506007)(2906002)(38070700005)(5660300002)(66476007)(66556008)(64756008)(66446008)(52536014)(38100700002)(9686003)(122000001)(110136005)(186003)(508600001)(26005)(4326008)(71200400001)(86362001)(54906003)(8676002)(8936002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wwk4Dlz9/g8RhgnjFFsvKS1XNIU2e4t6U6Ct+TA6ICCdwyT6czyIpwa2BTmc?=
 =?us-ascii?Q?+2V/xEm9t6XUEgmMHQSrfQnsSNFxyeEQtpKvaU7XfYsQ/N6QV6LWbSBoKuyz?=
 =?us-ascii?Q?44nXVOGm4yLjMSu8GmRd/vxPrvUkdKhtfus4y9kND7wiwHkD5ZEPtLPfce4N?=
 =?us-ascii?Q?K3eQ36jcdv7l6EgRn7t4lo/XS92oCxPpJIG0E7WGoz6fzS9GtuDHB8PELeS0?=
 =?us-ascii?Q?ohPDScVZUeDi4u3R4hImQGvLAW9zY/CexCskWpj9EYPskG7TaGczQGIqrw5p?=
 =?us-ascii?Q?DGQXVsGGXLFIq2cbl+RUoH1y+9NBSm+7bVrjpqWqID+b0C+JeYAbr/5Qt+O1?=
 =?us-ascii?Q?R6bfTh6aUCRFvpvHb2WU4E12DCLNFrZHo0Fc3FhWZqW5WmSmveudgUcVJVkv?=
 =?us-ascii?Q?nJRqoPqA0G1dTQcH06oF9hOu7Xicbk8j2Wfji8BofWdjgwCC6r3orlM8iRmT?=
 =?us-ascii?Q?K1bZ167pbqi9TUCA6/5zoE9U1s/YrjCn0nMTLCXI5riLH3bLzjL82VU/fK0x?=
 =?us-ascii?Q?6CIxK7FMNf8mu8R1IIyn+e2TzGkTuSbCGpgFcvU2z0fOSQjXMFpvoHxsxv/2?=
 =?us-ascii?Q?WdGcsKrEQ0hPaCXWtzDr+6kLxS31fSrrcvhccTBRYfDa1ACKVL4yA4o4EQ3Z?=
 =?us-ascii?Q?GOnWpqNAzRny7ZcUVxl1orbFEM8BJhaG5N9bWucK+LaPsAR+Ugc2mrVFINp3?=
 =?us-ascii?Q?xQ7skMYnNY8nRAIMNgqHuKV+2m/t1T0djeXmdcpBy8xKIL5zz6FvSHz4+fAC?=
 =?us-ascii?Q?toMfvGtpi5XbA01eT59tRlW8yyo1pEbhnaA0wvly/1VE1ntzC+kdrjRqc/J1?=
 =?us-ascii?Q?NVqU9ctxMfSuE0Rrp3TmwSa+cguTMj1wIuyADvqDWZ/1XC50am+LGM63otRg?=
 =?us-ascii?Q?qcdzDG9SsMtZE51lvuhAKIBmBbxEV/ygbS6S/sJfgsQZrb3xnjnx2YI7FnMZ?=
 =?us-ascii?Q?4QBfTO/drktJV/UiV3QVxJ2SHZiwZQKidq6GN3EGZxnBgSJkzjV2aDf+ShQ2?=
 =?us-ascii?Q?Z7dUS/8MdKNHHMMBOHV/bhnqJYzMNbrqbdsgtQjWypqIelpmZTif9qUuNd3F?=
 =?us-ascii?Q?PtRYUrP9pH05baCDbGvfTVqD6XmBHjYSpG61lVEtY0o3tiPrbQXnayDQIfI/?=
 =?us-ascii?Q?/berzrhOHB+kat8GIyinYO8ioc/CPPR7zjIJn5Hze0HRdC6t39psQ3bj41hA?=
 =?us-ascii?Q?RNgfrrO2UbeUqNZQ6eHubTfKPTYN55avh14vIg2YShc54EdneuvVUm2rTLtn?=
 =?us-ascii?Q?M9UN/R1JvzcFREKMhKJfEgiPiF9oXS617LLvvn10magmr2QlI9htaQcaniKj?=
 =?us-ascii?Q?/YzicVNlUX3QGBcUDW6IOrnOsflK1g84zL9Ns9MslmgFSBWqfYPgumMakjL7?=
 =?us-ascii?Q?ELWUoDuurl9ZMJSF7ujsdkr0fM8I8KwHmJwV/SLWwyfvDWbOI75j/fDZkooA?=
 =?us-ascii?Q?AxciJ4RLLgRd6D+q8IXtN0bOR7kql022ONWffxG/o/94LvlwyKE+bwtFGAdx?=
 =?us-ascii?Q?N7tLZ1c9h2bO1gGlO5FYY6klORlDhqqtGmu2uA2tjVPX6oNrD7Q2qKETmo1A?=
 =?us-ascii?Q?AiIVpx67u4HoVloDZSNNa65Kivucs3i1IxihV5L/RzXCHgYwiMuOcn2L212+?=
 =?us-ascii?Q?o7dCedNbuMCLhnz6v1YNkBdxMmBgCt0V4SAGgt190j1eakDvsOWG5EuZmp4G?=
 =?us-ascii?Q?Ab3oyQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27640215-89ba-40b8-1431-08d9b0eda814
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 15:01:42.0205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QeXDiqjBq0d0RYt2FKAXBvkncCCfvQz+dTwanghweeM21OGUrctxYcSqp3rNUQV0da7b9SQo+fHKo8sKWC7HwBfVB2N5xSwR7Mtk88pgtxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4022
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

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
> > > > > +     int ret;
> > > > >
> > > > >       if (device->lanes > dsi->num_data_lanes)
> > > > >               return -EINVAL;
> > > > > @@ -646,12 +648,36 @@ static int
> > > > > rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> > > > >       dsi->lanes =3D device->lanes;
> > > > >       dsi->format =3D device->format;
> > > > >
> > > > > +     ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0=
,
> > > &panel,
> > > > > +                                       &dsi->next_bridge);
> > > > > +     if (ret) {
> > > > > +             dev_err_probe(dsi->dev, ret, "could not find next
> > > bridge\n");
> > > > > +             return ret;
> > > >
> > > > This can merged with previous line. return dev_err_probe(dsi->dev,
> > > > ret, "could not find next bridge\n");
> > > > > +     }
> > > > > +
> > > > > +     if (!dsi->next_bridge) {
> > > > > +             dsi->next_bridge =3D
> > > > > + devm_drm_panel_bridge_add(dsi->dev,
> > > panel);
> > > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > > +                     dev_err(dsi->dev, "failed to create panel
> > > bridge\n");
> > > > > +                     return PTR_ERR(dsi->next_bridge);
> > > >
> > > > Why not return dev_err_probe??
> > >
> > > Yes, I think it probably should. This was just a code move, so I
> > > didn't change it.
> >
> > OK. Do you have any plan to add DSI{0,1} in rcar_du_output_name[1] or i=
s
> it in pipeline?
> >
>=20
> Aha, no I've missed that.
>=20
> If you'd like to submit the patch, then please do. Otherwise I'll send on=
e
> next week.

I prefer you to submit the patch next week, since nothing ready for DSI
from my side.=20

Regards,
Biju=20
