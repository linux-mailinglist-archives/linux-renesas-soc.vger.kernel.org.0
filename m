Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82DF753FD67
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 13:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbiFGLWN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 07:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242757AbiFGLVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 07:21:51 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0873C25599;
        Tue,  7 Jun 2022 04:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBRR2KfNE7KF87Y424ycQAijI8JJSPk6bhIHuqb2IgNUwobZfu5QUwoz9fSaCJN+Zxu2jssTEDC2v0xUJPK6pKROF9UKeFwApsyChJHTZNBuOIZ67oRrLEVOZBMfhr/9cMTuvKOZ5k9GfYkqDlYpDJU7Ynq2s2TbGyao9GZr90bet3FMfEyWFwlE2przL+2WFmkuyDEB/Z8yyOjZoaDfWYN+a8LAhk94Js//7ftuOit6WFLbIarldo6pDlKfftf5wv3YNOFCdcdGOgasalo49NNDGp6npnu6nlirZLv7nhzTAyr7GVtJquE7Dggjs3Wu4Dxq3VhargoRXZlS4LBr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIiljw9HJJlhxUSw4z/2TuTjjc40tJ0daRRWb3Mw1Us=;
 b=Gqj0q9vTJFAQjI/MbpFOgj0msasLjxh4sxocTDCK17yDRzDgxuH/R0pdipMu0NYLL3/BFqdDnj8kbpdtO5XRt4irJusiAqLavwh80QjbbXFymLawj2DbwhxrDB54AtehZEpJQ9N6Vyt3TbJzTBlmgYFJmnBOeA3ooLLs0X9uTrByUUv8+NJX+dvKDZhnSD6fpuOUiof8Loci5J9p3EnUOPsQKfpL6FqDvb3sDtlnE6HACaSb2g1PP1K1Cr7pos66Ysfc4Xw81UADE8hHB3ip1qIL49Gwzqk1uNKtnCr9XtBVEo/zRK0CqAK8p90pHpX8fpy14UUuXmrEw/Cw9cpZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIiljw9HJJlhxUSw4z/2TuTjjc40tJ0daRRWb3Mw1Us=;
 b=t9nARXQqBE5GOylGfXaFVfXl+VLYbL/7EXMWiTC9x3/6JQ14SYd3XYxSU3FVzkKDUTyxKHUUs/PxFRNgTQjXvDX7TyGhzDSDhRMCUb6UrY+MOe2DsgxZaXMWThSq61jDRSXpoCGM2C0B/B7lbvwrbAl9TVGEtYFgXiLeByHCFQI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5727.jpnprd01.prod.outlook.com (2603:1096:400:47::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 11:21:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 11:21:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Thread-Topic: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Thread-Index: AQHYVxaFuP5oz6eqt0ObmMSIhSpBsa1ECf/wgAACeACAAAU94A==
Date:   Tue, 7 Jun 2022 11:21:38 +0000
Message-ID: <OS0PR01MB592263A853A52DE428D9454A86A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922E60C12F1B49A949913A286A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Yp8vAJHkJAQuDqMx@sirena.org.uk>
In-Reply-To: <Yp8vAJHkJAQuDqMx@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 078b7f95-2dd9-4cec-6a77-08da4877e3c6
x-ms-traffictypediagnostic: TYCPR01MB5727:EE_
x-microsoft-antispam-prvs: <TYCPR01MB5727F31F307B85A68AEB569C86A59@TYCPR01MB5727.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0BeQ7Cb7/Iz5qJJfN2LhZw9SkdURIQJjBSf8DG68SUn6aMQR3MgFI+9qqJXRKmnS1tMIu2/PhvmnotL1oWUstpfOQ3fr3/Zm/Yns3bgwgpKKEesEzB7kpPTWIa3PnPOlSKGoKm7+b4hm81f90MDm1w82i/gXb1l4lTTgWlIpR+0uPUrBA9YCFg0TAeTQ3By3ilCHO8sJfthDu17Q5IpMJTTDiVUWT976jjARVvQORwpww7NAwtUBWae17YV9MwEgRlZ6b800m6LJ1aIvBId8vBUoxzlz5G7sjnvtr5HYWKHK4kxp+MupP0Y9M77ae6hJGGd7tiYjCbf7gE3peO8UbOJha5aviZcKnooL3otHo33Uvwtf6766Hw6Lxe05+LXdn98ZsN6nVkv5tSVxctUxXwS7OQQEIfs2u8CikMmnxEmACyabgmhEExO9rUKaWFRCcUfhj++/szol1sfZTzUIaShlPYxFvKlCGkf+pRl6+T20vMqZlngYEsCc2GM6n2+JjMq65xDKjVSSxkq/pnXF6+/1jm4/MlVbM3vNu2+RPXU7kKARVYPDnPm+oxGKSy3lWY8ZJa8v4e1442OfoHK0BVm+cTrnd20IZb3OmvQtj6IhrybmCvwBI9vMxUL0irB4g8yG4hmyiA8UZU6afNEdKIMPvJ0N0voLpwuruVq23/khuxv+DrtsVC0WgyOy+VNM6sWXtCPSyf+gwlc9gPMJqw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(7696005)(71200400001)(54906003)(76116006)(52536014)(8936002)(508600001)(186003)(66556008)(5660300002)(64756008)(8676002)(66946007)(4326008)(66476007)(66446008)(6506007)(26005)(55016003)(33656002)(2906002)(6916009)(38100700002)(122000001)(316002)(83380400001)(86362001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8n2clnELXjmnKSuPV6kn9z5OquULUZOryGBRRv4vPkNX/jKUez0FxJ8N7wv7?=
 =?us-ascii?Q?LMqbN0oSWo5wYOUzs8yL881QSd2SvOG/apkKXJGorWKxo3A5unb3MRRMTpa6?=
 =?us-ascii?Q?Qq9xbmo/KU2xCoPXxbhc73Y9zCPLhac2SuTc9mn4huVRhCqClNwP/1ovxiJN?=
 =?us-ascii?Q?epg4E6bwQ3hz/3yxAJzqvAwEUAU8MOY7evJ+9nJUFHGOtHeLWFTXlhrSj0n7?=
 =?us-ascii?Q?DWSQ4gpOIHJjLxreEDOnV9a35+tqTzHt5xgRhOByc2lNuVIdzdZLPI6lR8vT?=
 =?us-ascii?Q?MnORcXmj4C9QO6pDsnVOXsCNXeCTsRVewuqqeARwjxt9RPpOKBDBEM2NW/Cw?=
 =?us-ascii?Q?Kr9a+F+hWdWWjPmsmoetmhzoMuPxA0itf8Ivr5YRxnCwpy4ZD48KRLFpBCOv?=
 =?us-ascii?Q?XDGKaLYmvKofvnaFS6U5H6nCb37voRjogOM3dBWHAC88nkeJIePgZmPcDDcw?=
 =?us-ascii?Q?MtChiTc3tKJejEUlAYyWTcpJBi5gqjIy0zqN3KDKWGjwwz3hTGO5x8lACxW9?=
 =?us-ascii?Q?pquAB4ZCSYsjL7imnNnqO/xDYKYwmWuHvZZatLlImwQXsDdeUhr9C5s4L1na?=
 =?us-ascii?Q?1DFb3Xad/Qj0b/S73O2hK0nLSHqp17mf3HbSpJoEvBL3msCafNvFq5QLYwQ2?=
 =?us-ascii?Q?8ZmvOmWvE0VRYmx8RsocmUpFmna0Bn4ke4Z1vEfFFJNzePYUVknflzVV3qti?=
 =?us-ascii?Q?kpHI+Hz8tIZwmvO4YWBfjbuGYEF9yXHgKj1MHTUKk/76yQZEKIqBzGZ+mefI?=
 =?us-ascii?Q?741cvw142MoMdS24bAb9THUaM/HODmChHsEXXMkPN+WEGI5cfFepymegzkcV?=
 =?us-ascii?Q?sXlBqUsbxg2dPkGUfE57Q5Yn70rcCG3JU+qL0GO2a3Tqp5Zz0JdTjnxoUe1Y?=
 =?us-ascii?Q?cP/3FpwE+pli1yFxqTfe84jhKNx9cY2EByc2yB9AaV5p6Vjp+daJVk/80AfP?=
 =?us-ascii?Q?nb/Q5hNIW4CTCkL95NmGjB5TUgqZqJBqo4Ml6NpgUkD1/wX81VVRVyVIvlVM?=
 =?us-ascii?Q?Zk6LvZ+BoaK3n2tGRKfP+DlnT29lLf9vuEkkhvTwwqIWEr5G5NzG/hWcAZwZ?=
 =?us-ascii?Q?9UyEG6ueiwfJ+DiPh5vt71XKJcw6ohjNc4BordPL+NM/YWQUCwZyZBeXX/tm?=
 =?us-ascii?Q?ejcr+GgTBTiMTmPctYr7f4zNTOQzXbuV1ZEByvwz2q6wn3+Ru+hl60lI5gEo?=
 =?us-ascii?Q?8xnG2If0BmQy24NNlMw4sV116E3JfZ9jSodRWZBP0bq8NF4Frb82Ce5pw57m?=
 =?us-ascii?Q?16YMC/d+aEYEbejlz57ArtJZalU0oN3aKZUcnDsZ8owaD0rJ0lA4uVhYA7Aa?=
 =?us-ascii?Q?AcwkCmpk3KAVFZOhsmiIj5i17/XocQkhWXM/bsXxvzzriVapSEPxVCdOZANm?=
 =?us-ascii?Q?iWyXK/JXQDq5gWIn2AYQPGToHqav7UQGOi7AjTdMnhEfsiECoSepx5dkOvl6?=
 =?us-ascii?Q?telmDtuBezPHqCX3RdfGnjRIWsVfL3hN78Z7eK6dnubfkc3ZL9qqQCRgqO3E?=
 =?us-ascii?Q?kj8zy1OCzErVt+FCc+aVdguYm55xhTzQbMobBGI1rjvxy25+y6OqvoNDSyLl?=
 =?us-ascii?Q?6smhhtbtEbvwUPo0niRoL2FrKzn3ePSE2LUlKrWlb/63nNfJJAOEdbbAqRyT?=
 =?us-ascii?Q?mQXMRttB1qs9UoO7tnoynzaV7wUzh+7d2U9WMxuXFTombT+0OvHSbergxBby?=
 =?us-ascii?Q?6Co1lZKhDMjUqdEZkBtHf99qiAPEoIIBR9vir+09dNnX4xcJK2OZoalAS41J?=
 =?us-ascii?Q?RES9jbVi5PSCiMNBuRx1rmHDleakClk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078b7f95-2dd9-4cec-6a77-08da4877e3c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 11:21:38.5461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQJYP6vzMvmbr0tVRmlUSHH4RWApjVY5QtYybLhXHqxg3IWbz827bKK53cdaAQN4qRTvo1920+hk5YjaZy1Vjzbra9hwOWQTN1yjLErFJ8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5727
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

Thanks for the feedback.

> Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL
> SoC
>=20
> On Tue, Jun 07, 2022 at 10:49:22AM +0000, Biju Das wrote:
> > Hi All,
> >
> > Gentle ping.
> >
> > Are we happy with this patch? Please let me know.
>=20
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.

OK. Agreed.

>=20
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

OK. Will rebase and resend this patch.

>=20
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.

Agreed.

Regards,
Biju
