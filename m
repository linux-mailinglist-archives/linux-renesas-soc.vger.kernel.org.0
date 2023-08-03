Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60DB576EFD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 18:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234787AbjHCQn7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 12:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234465AbjHCQn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 12:43:57 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528F53C0A;
        Thu,  3 Aug 2023 09:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqd3LGRqKwsPhKpL3ylH0DuQduvvvJ/AsIAI+Yb8B4n1lukjslh8uv/nGciVYDel9JvIBZsB1e1MNeQ4XdslpYxevVa2ohkCrpSJkW1ASUAVmPe8wGdpuvFgk5+UoFKhlV5gkQ64HenkdhFKyBFBQFwz0XsutU+b3WXwkGdPKB/Qf+igm4SyJexDWUcj/ENDXRxMv57E3Bc7G7tq2fWtQkXZDTtvmq6i3V6ESoj194WNbqGrUtc00NkdXI1ZKdK9arUsM3RJPZc4pvM18PnXeTKfFORiansiWwQjO0vMZvZXyn8Fq6FPwkGmVchfYE8PHyfuFiiFvsHXNflvBA9+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VCpSF02pnIWkjAQHoLvD09tBrDctz0kWwlEPT5DYkk=;
 b=GkFbjoBwkRj7tHqgKCzsDe3mfloZ6oeGICIjCgGXzblPRyDHS5d8eOuXMQ26FE+AOhoqJmmb+C8tPsnWqqgApuqdaY3gBxJj09izqiP5IzE8uxmkTDKwT4CgztDam5g0lKVqwAQpt1+K27IyxBuV1aYAS58LhtTpGLKM8NPKlZmzImE5R7gaaO7Mi3+Y45t07BU25tMC4YEza7h+SpAyKGlVe26jFYrs9LAP6L9CPz96HkOEGx0CNPRK+FCuej587SLnOOZxA/MKJ37Bto5NqbMp+WBJWHVcz9yPADQMfDEn1tUmWsnvwQJcedV/VRGufieR4E5j76gBQJ2Lf1Ylsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VCpSF02pnIWkjAQHoLvD09tBrDctz0kWwlEPT5DYkk=;
 b=i5xWDi7yJgDznL7JtAdpELOofPFYLMlBV1Ec+vSZn6t4Y65gfixxdRYHsOiruTV1R1LhcRrYVJsUla4PSG+HP7S6GFfos336+sAziNuxnVYLq+kswrz2pgsayqmG8CwWVPdmqmjxAYN/AfUbcRrYIoulxl0/iPupQDA4uw3IgS4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10223.jpnprd01.prod.outlook.com (2603:1096:400:1d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 16:43:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184%6]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 16:43:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Conor Dooley <conor@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
 clock-output-names
Thread-Topic: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
 clock-output-names
Thread-Index: AQHZxTxohvL0NbUaxUuWUT64bxrffa/YvVIAgAAAhFCAAAdVAIAAAXBA
Date:   Thu, 3 Aug 2023 16:43:48 +0000
Message-ID: <OS0PR01MB59224E3DFE3F21D6BEFC554B8608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230802122510.275420-1-biju.das.jz@bp.renesas.com>
 <20230802122510.275420-2-biju.das.jz@bp.renesas.com>
 <20230803-imminent-impound-559c483b75b9@spud>
 <OS0PR01MB5922B71C39F54441D0E8EDB38608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230803-derived-patchwork-596f8864b589@spud>
In-Reply-To: <20230803-derived-patchwork-596f8864b589@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10223:EE_
x-ms-office365-filtering-correlation-id: 27fc5a3d-8f60-4e26-955a-08db9440cfcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iWs0F//xNk4wY1YPNDTDTB6XURr5LVDtZd4tKrlgfPYy5Pktp6oaHCzoM2ifVamAiup1ibBQIe6RT3rXX8cp62ZcO0VNug2vkDlTT+afV3NnEnPahthU0s9qbiNAFDpHOsi9Q8AxzWMf6gvF/C6MAt7oIAoznb3jsWHsGg9sr54HvJ5rhWnN1b5UHm5jDgNuIm7/zlLj4Uf110CU6J3j8C1E8FYhQ41ZSyOdZqtW8R0wzCIY0U9i3I/wj+jYINUO3DOTXtY9T7m8nEv6m+Cu/fc/jalwJVYpfU/QbEJChgE4M2B+2yUJwUHtw7/OyJ+3SDQumkhPpzbN/CSAWUIXLtGd/37/PQ8NvvsWsTj58I6Bh2F4uRlb8GNDXFkrFtBGVTVfDZlWirrhEg390Ym+KNZjRclSkreLYepsUT8D6ZqgUEuLhorCXfdHyNvcN20UBz8Gev0kTp7LsIwWb55WTTssFI///3wvtI9l99Qm/yQFn0Eh0LNrW2cyvYE+X4T4gclQvnuvHjpnQgAJObJMCAGgDi6cgdl77u5sJ4IG+CSzNLI8IfD5JIbiJp52NBGf3Sf5Xgi8kn4J78yoICDHRTWI20mJG7FkQjMt0xxUa7E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(107886003)(6506007)(186003)(83380400001)(26005)(8676002)(66476007)(316002)(66556008)(2906002)(4326008)(66946007)(5660300002)(64756008)(6916009)(76116006)(66446008)(7416002)(8936002)(41300700001)(7696005)(71200400001)(966005)(52536014)(9686003)(54906003)(478600001)(55016003)(38100700002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cNgZn4taPCG8bSYeb9kmJ41m0ZBwrJIevLYk6hG32qheiZ0h0b4oER5GcN7R?=
 =?us-ascii?Q?b+oVUCGmyP0xTTcO3kweNXipXGk+om09SuC03v04UQxtifT1sHJfpjHTjFMz?=
 =?us-ascii?Q?IRMNHklUXCnQeqR9lk4ryarKOCkaP4kzBZ4f9+EDtvjRwJ2uBlDoXH1FlFQj?=
 =?us-ascii?Q?ZjDYjazGc1JSapcTgRuC6nsKlc8e1+SXw+GAsjPQ4pKxYKVd1fXTIw4tesPe?=
 =?us-ascii?Q?U7uRDqEb/eOCWQrx4B1+mo89F92eOygVE7G6DdAc0iMEaVmjewSI6Hcg9TMg?=
 =?us-ascii?Q?O8GcR56Nf+t0atOJkmAS7ngkbafmy1Fe/0YFq6G/ST3PN/3xoviDbrJp1hpL?=
 =?us-ascii?Q?dLwztK0XbSolaR/wTBuMME6mt9VtAJ24uF6ZNADoPVX1SF5X7NmHX557iYgh?=
 =?us-ascii?Q?MUd5CmtsIND5EpUBPNGkvdE3G7Zu26f8NAvXNOEP7615J8pdcIZ/OtrDXQVm?=
 =?us-ascii?Q?I+vIdfd1ppOG5ZmSu/e8NPbiIsV7HoabTYDRjKaqy9yzDyq2/A+QJRBTXnyp?=
 =?us-ascii?Q?9i7KAorVEQrFOEjr+u4ON29pU7D3gbz2BTSJkMI29svIx/8v+FFID55a2XS3?=
 =?us-ascii?Q?M+4QQpEhoH7mm7VRTQkmh+rO+0sw2jjvzJDvOI0UsLlvpdqEA/FuXxBYkGEh?=
 =?us-ascii?Q?rEQsGnQs5mBE8RQnqDfwnb5DLNjRbm2+5aHUP7WkeDVRMQyx81r7TCpI1WnD?=
 =?us-ascii?Q?BPyHdAKSkca4Z8fNCrGFv5DBy9wU7dn/SbvUQtq2TOgWE0QuNulZQvVWymrm?=
 =?us-ascii?Q?pk+6k8jjX9taxLEU1if5weJdoZlabVXFN2smsiJy8hMh4Cm9GJLoiUzbDAcs?=
 =?us-ascii?Q?/rpfcBDVfGBVezdhVEnavFC/DfL8MxLpjKCJzXSKjXu4cG/bHFQ+UDoiLJpy?=
 =?us-ascii?Q?ovfh5QMmZgl92BGXjoxDYC1UfTYjule2sHMeTDxRZjKtAsfTjTe0DPmhPy0t?=
 =?us-ascii?Q?9SM1jwPClQjd+A9VrZ+uaxi0vUr/4WLkrUfn2TQfIRy8ud3cG5QlZ48RFaK4?=
 =?us-ascii?Q?GmMeWveQsbqVHJj+AkUWlTy0sUycFEwpPmSGgkRMsj2VIOjih63LfURJYcEg?=
 =?us-ascii?Q?5gfs1q2fFrwlGMF8kmxbY8oDM7HrgxyA6hvbxIAkYEW2MokXgkOjO1Frtn2h?=
 =?us-ascii?Q?++Bh+RF/BROcfjpDB4tpJ6dOpTmRFaU9+UDeFU6KHkK49QQdmFpO2ucx5Utl?=
 =?us-ascii?Q?U66fr3H8GEWVjhOUKHYcDSe+LJ8/W7nFPNtAgM5x8hJwe/+fnBxDsA1bUeDc?=
 =?us-ascii?Q?dlHfZPPeNwfggD7dH5fQ4UP9VaX/aZwWXYUvwt5g8Rvn53EB6K7RxnseNAhl?=
 =?us-ascii?Q?cZihyYXpDVlo+MWlOUJWUk5tH0b28ratyqscVFZ6RRHNWtCSDnVWO+FgMaBU?=
 =?us-ascii?Q?zs4A72zFg41+7X2L3VHETPD1hpwU2VteNvx1dPIvQIDqAjpjSqC37cN03gFi?=
 =?us-ascii?Q?LWzA+H4fW+7466Xiy/TK6sJDBhcTXLI1igs+Gkez5VyY1mAGiHTlQ++4nvl8?=
 =?us-ascii?Q?z5COctSnj3tgqIViH4heiHJW0DTQKKBYuNtb2nP7xP1TRjkKFZ3CnvE2tJIF?=
 =?us-ascii?Q?AYT7WkuRQKJAxKvccqZF+TZBz47X+UeWC1RVeDH2Gj24gRc/WW026mV4rtUm?=
 =?us-ascii?Q?BA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fc5a3d-8f60-4e26-955a-08db9440cfcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 16:43:48.7651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D5vRqnvBqOZhznblQuwhwlzGitBk/nntZ1YWoOCcTR7CGZIcZ9j4SVS9dKA9u0wxM0ZNJCjs4JtNEdT4pcsj6VJUsRSJPjmzQehe/GtBBfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10223
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Conor,

Thanks for the feedback.

> Subject: Re: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
> clock-output-names
>=20
> On Thu, Aug 03, 2023 at 04:25:40PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
> > > clock-output-names
> > >
> > > On Wed, Aug 02, 2023 at 01:25:08PM +0100, Biju Das wrote:
> > > > Document clock-output-names property. Update the example according
> > > > to Table 3. ("Output Source") in the 5P35023 datasheet.
> > > >
> > > > While at it, replace clocks phandle in the example from x1_x2->x1
> > > > as
> > > > X2 is a different 32768 kHz crystal.
> > > >
> > > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Closes:
> > > > https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4Xpa=
e
> > > > jss0
> > > > Y2ZpLCMNg@mail.gmail.com/
> > > > Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock
> > > > generator bindings")
> > >
> > > Nothing in this commit message explains why this is a fix for this
> > > binding addition :(
> >
> > Basically, it fixes "assigned-clock-rates" for each clock output in
> the example. Now it is based on Table 3. ("Output Source") in the
> 5P35023 datasheet(ie: 0=3D REF, 1=3DSE1, 2=3DSE2, 3=3DSE3, 4=3DDIFF1, 5=
=3DDIFF2).
> >
> > The newly added clock-output-names in the example are based on the
> above table.
> >
> > I have added fixes tag, because this patch fixes the clock mapping in
> the example as per the HW manual.
> >
> > Please let me know should I drop fixes tag??
>=20
> I'm just asking for an explanation in the commit message as to what was
> actually wrong in the first place. The commit message says 3 things of
> which it's hard to know what is actually a fix without opening & reading
> the linked thread on lore.

OK, Will explicitly mention it fixes "assigned-clock-rates" for each clock =
output in the example based on Table 3.("Output Source") in the 5P35023 dat=
asheet.

Cheers,
Biju
