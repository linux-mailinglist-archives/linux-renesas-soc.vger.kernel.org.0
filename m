Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E631A53FC1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jun 2022 12:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241776AbiFGKut (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Jun 2022 06:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242205AbiFGKuF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 06:50:05 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4CBF1353;
        Tue,  7 Jun 2022 03:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWPSBdB9RxrMA8Lw7AfOVUEZo59e2mxW4pJmyY4pGdZCDzr1OC57Kpx7msD9KO1Tv9l/M3VnTFWsKyfLNAWA/zVrP+/f3vqNnhxsefNFW7mJd5SSlWhlkm4UbADlAjdKC7Sf/Sh6/XZU/e+0EUdQd4MNRplMK88i13zy1M/GXd7Wejl4P3ELLoam49Pl/vp7Qx5MOwFbqnHiu9gAz78uxBlHZmRnkxAVdwBkRQR2sqDxxFZVmfP1G0NitKteB5g4IWPnJFavFdHKz0NWFT9iMcDJsHyfaRy6CLth7CxfkX1TKcLUzZJJmSJq42ASryJu6361a9F8TVlUbXXHQMomEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj7dZD0cAkvORn2yT9pHiAPD6Z3XLBYmOo+K2vy/gjI=;
 b=CbtxODmneh6l+nO+fvt0BmZHUOt/5P2nWVqBnV4HkMFz4PMH+ffWaeXW6/aKhQyQFTlkWQOi2GCrEi2RVph5b4r5Pg0n5ze7rl6yPTwWZ+hWCoW98DPMAO4L6TqUupyZvYDlVuOrnCIddsv5oSOejKOeP70VCx/WjG0+zQokA8UF529b5Gy3qW85r2DcBBOKUzvjBSA9unFjwxqmJLdX37JR8OHmjTLgi65U/YAWbjaFQdIy+0r7ZW5l6UTP7YOn8ZbDvaVV9dGn2RroXKejeSkru4v82Sc6EhGM4M+qq6rqn/8MOIWJpyC554hQgyj4GsdybXG6UYMKQZkWlJ62XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj7dZD0cAkvORn2yT9pHiAPD6Z3XLBYmOo+K2vy/gjI=;
 b=s9WRShr0oLBmPwRQXAVJvpYdtJHi0ArID/GTU4qGyHnFJk4pdz54NhJ/HUKUg20o5HWpI7sfBo9tMC9Q7J/cyGzWaNUhl1nwXeXdiIu1rd5zSMUsnddAa+KCGWnPYN/kxaMd1iB8RVeFukyribr+BD0of0ebb3nk1KshDzWCR1M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3105.jpnprd01.prod.outlook.com (2603:1096:604:5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 7 Jun
 2022 10:49:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 10:49:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
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
Thread-Index: AQHYVxaFuP5oz6eqt0ObmMSIhSpBsa1ECf/w
Date:   Tue, 7 Jun 2022 10:49:22 +0000
Message-ID: <OS0PR01MB5922E60C12F1B49A949913A286A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6b4c370-697f-48d1-2159-08da487361cf
x-ms-traffictypediagnostic: OSAPR01MB3105:EE_
x-microsoft-antispam-prvs: <OSAPR01MB310577DC4F46E5E8FE41A15786A59@OSAPR01MB3105.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2dxd/52TPXuQ9ehmlydu1Uwy0UttLNoP1z+Xrocg8FDW8qUYwwV/q0UpX9nBnlMYmDW6lPlUKzJzM3wJuHzSlwbBZij90lMJm0OxwDWxojuKc66LVf4PLjiV1Xywqqj3rEp3jplE9Mr6FfNny3R+kptFP8rqK6ZVq8ATt9OX3pUTQtuCPd1kAIDdupkN3PlspBYVMz9D9cUXWPrj0dhomKcjTAa1NaMfELnhtzG4j6h9+g0SgI/fwlRW8mKg1YlICw8uK7OOB/EdAPVYlfkulPiawvozwgRDCKPjgkZ1oIjwupSisiga+XM0PIMJ7P/yO7T7AreoloqYOI6mYP4n/s6Ec40QK92t2z96gFL8oB6k5MebKx4X1dT5Lajset3vQKx26GFKp6sIYpBHbOI4Z1d3KTBuEUNOa1yAqvbV5TLD2n751YYbxxWm+snHBbYBzuFuoreUHM1ifY4RrVRAvVEaQQ+04QKr0cOvzZxOVXvI8up0tzhclCI2DI/im3VPts5ipfza9R6QO+ziCtEwtmPJHHGP1WoceU7O6BVpzeQntPNxVqimTKY2Wa/bqXb7Xxu6t4bJMiEmknYr+ZtlOyxSIMIyszPsqt+IAjukkbbyuL7PEMCHPHNQsAHZfHs6JNZg9X1m7OTf4XUOTC7HN6BtUy4ZzhhCA+8mLVPoQFFduuzhBODzQ1k1GFOhD6BdzaOYrsk0rswzB6Oz1Pc9rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(8676002)(5660300002)(38070700005)(122000001)(38100700002)(86362001)(76116006)(4326008)(316002)(110136005)(66446008)(66476007)(186003)(83380400001)(64756008)(33656002)(54906003)(66946007)(66556008)(8936002)(55016003)(71200400001)(9686003)(7696005)(2906002)(6506007)(508600001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?groLRwF1ELL6lMHcZyzczLLwKYmbtO65DKqkKZ6DQU3sdp+YSfe3rdc5Y6QA?=
 =?us-ascii?Q?Q+kuOcZyBNhOoJzDAl6FyrPsMcB1Xtm+BwjdJObPQv3YRUU4jTnTlp5cbX6s?=
 =?us-ascii?Q?RAZR4kyLS7JtahiQU2N2+fvzxmfkiPCIowKqFbrTPUdB4venPHJJGtpRboWb?=
 =?us-ascii?Q?VDbQ4Xwk7MGy8sH5Fkq9TaZD5kWPg0iNk56aZ8eLNCD4TwEq0Cw7hS3eZtYC?=
 =?us-ascii?Q?rBQO8xs2/RaLwY0EjQ2bZsHsH6biPtnc0T9LOFBebAOrxryf9dIhVY4YxLRM?=
 =?us-ascii?Q?iWVF/dbpirQ2MU+VrWd+5o/qo02+DNMFv2enL8VvumKSL9l3PggI3qxtsCiK?=
 =?us-ascii?Q?oNObnhmleH3BTKuCvNVlRZuNrugQqe0AF9RnZKh7e0mls1BS8jdYv2b8jdGH?=
 =?us-ascii?Q?SSVajNKyG6su/ph79lHYemGuxboYkVmoy2oqnIKYJsepm9l/4vsEu3jS2s0b?=
 =?us-ascii?Q?hQkl0rh7oelHbs3DbM8KzjL2/B1Xz33ymkIjKa/zYUWS1JOFXb4zQTo4phqA?=
 =?us-ascii?Q?6ijwn7U9Y8FbgnNV6CUXbIJm4ukGcIbYLoP6Z7qSJ+zTvgIjoJzo6DZDoete?=
 =?us-ascii?Q?QoeNMRmJ0w1NEm5JXfy6+rostfRRWngCX5NFRcT5wh97/MFYwP4N2b9M6lYi?=
 =?us-ascii?Q?84Hbu7h6842+tGab2ALMpFc3Vmwi1/BS8JJv488pmxMeiJ2b0wB3SWYaMer2?=
 =?us-ascii?Q?7JJaPTgg1dku0N+/zoO6kmb3nRQrjeuFAtq2/meic0EFnoss3yniFplNP3wA?=
 =?us-ascii?Q?26pQHfEuI72xRZC3reggKHkd6qydmaF/ttp/ukP0VVr7kvqlayzf5JsTtNiJ?=
 =?us-ascii?Q?yse1qdel7uAd5oatpWaIal1zQqC5+TyRmQAqhzsYh+nahEBnZ+fV1TaYQfn0?=
 =?us-ascii?Q?shN6rr551nCZiX9/Aq0F+mTnT5HFcSACmqrVRFEdSy9KcWL53JgTsOdu9loV?=
 =?us-ascii?Q?sRT9ZBPcdE9o4mk5021DSTVWfUxVEqFpROQPRuD9KGt1nS8R6EwKb5sTC9pn?=
 =?us-ascii?Q?pz2iKK3Hs5RtWZYNdskKTsYdLsvk+aUmDW3UXYxqK2DKv6nj+X947r7o6iB1?=
 =?us-ascii?Q?JXDcRtJiPEGX6F6V+1eR9UDcJw0HSlMaxmcoanbT1qdyNoR2yotiB1hFPV1o?=
 =?us-ascii?Q?w74sd6T2duNVTc8FtbB0aFPFYaoya5hFxONnBkAdruB5DFeVidPNGYDZbkJd?=
 =?us-ascii?Q?h/giFEHWCGTpeLhkiITOOJm4n4/RCyRFxB639HXZvGYZobH5s5IaYlZS9XnN?=
 =?us-ascii?Q?TeLLMwmDKjb/rBbjyN+W36SQ+H94gqutut/aidfkpYn0Yi35t6GVEKT7h5hz?=
 =?us-ascii?Q?+F3O452NxdzNLZk6Uj2+EtIFNzYbK9UZMWIQnjHtMWnpB6a5PYJ3E3xzs9r0?=
 =?us-ascii?Q?C1eTgS9FreAKHhioXb1moesB2C/8+q+2UPsmOaBH+2TZKwR9MRH/+b4NXus6?=
 =?us-ascii?Q?P6p4eK0T5WAhI+6Ll1ztp4XaSDXq1VceErYhw1Mj7xXxkuCShSgJE9b41T8b?=
 =?us-ascii?Q?Xsbg2PuXSZ69KUaCDGc3Ic/DDVcxeoj3kBqPH88KcvLcV4RzOgsDo+v9m8fL?=
 =?us-ascii?Q?MK9XhtmFKjZxLgX8+ZcPqjW58P8/icReO7P9wmpxv6EsTqzak6MoFJBHrIHb?=
 =?us-ascii?Q?vqIy8ucdm4MdGslKXW1eySXx9CzW+rHbBLpnDba5O3pY1Ga5IPnvE1SkhW8F?=
 =?us-ascii?Q?h0qPa+tZ3grGR6tgfxVp6ZuA0qEOuOg8iuGTiQz7nA0zrCCZN5lveKAjJNID?=
 =?us-ascii?Q?jZ0ZtILKcA6L5VKCLPsh9rjHDORSxfk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b4c370-697f-48d1-2159-08da487361cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 10:49:22.5593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tR/JooV4Ok/fyZ80qz1AupCpt7DmcQfx8Q04nlap988oyJZxxLDq56YscNBKlu1sORumin1p7boDeLHhBtGmYsp24XkFiZKMA6pzuhamL5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3105
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Gentle ping.

Are we happy with this patch? Please let me know.

Cheers,
Biju

> Subject: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
>=20
> Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found on
> the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
>=20
> While at it add a '.' at the end of dmas description for the first cell.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> index 7e8d252f7bca..0d9840375132 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r9a07g043-ssi  # RZ/G2UL
>            - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
>            - renesas,r9a07g054-ssi  # RZ/V2L
>        - const: renesas,rz-ssi
> @@ -50,7 +51,7 @@ properties:
>      minItems: 1
>      maxItems: 2
>      description:
> -      The first cell represents a phandle to dmac
> +      The first cell represents a phandle to dmac.
>        The second cell specifies the encoded MID/RID values of the SSI
> port
>        connected to the DMA client and the slave channel configuration
>        parameters.
> --
> 2.25.1

