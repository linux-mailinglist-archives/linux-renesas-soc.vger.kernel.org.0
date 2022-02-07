Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47AC04AC1D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 15:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378573AbiBGOqQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 09:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349401AbiBGOfG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 09:35:06 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1DDC0401C2;
        Mon,  7 Feb 2022 06:35:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hv8/259d2ymk5Dp8xciFJvr6TtzPo1dUyjWz/9FWqoNRd75QFcr8OLDZ+FFhyzoeG8uuU8KObBIRkyKJy8wTBfnK/TCVsFgF2nLsfwlYVsqdxg11q3pruP49ZCvbwNxIRMYg+mO/M1fLl+iVhg3WrVYieyLSBRUStBbzLrE7+pWw2nMdbIYDxNgeQ2VAdoqx3/L7ujORYEW9mR6BTW7Lo8HbUnDt2qyNeS0mkE/NfMpyY/Luah4OE5nrgYXNhdVCKYyDAQRW5YQdIVSuF5sUDpHg2wwW1l0OrkqgDy6nzGAxxgRSl4k03BNz5sQ1spxBGlqo79E6L3w54LudvPcfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tYZp2cKxyf5QuneFgBWAr2NqylKTOPRpGvw0FIEUbQ=;
 b=W66Xk2/IkfpFJm1eA9jjirG32HOGnnAIHYaE5CdyzcxOlkk+XfytWtxdV+zMiDs1frCEewJuFIiPeVFsDuxKvzv5ozcCpqpWRsk1Y3aQB8pMhs1FD5Y5gA3n3JgucUzodsanuXhMfMykWW5GUw3lU7tH9+RVtfiWl+0V9ESrx6BMuqUxfmFnqeo7f3Xk+NwLB1sDNhM6srhvVFea/+SLGgzOTOWgOi4ejP+FHpQgnf5NsJy4uGj9d+ccHX+d8qdbl8K4LRgodQ5Q5DAnjDatjjKZYTMrEDhOXqcjkz4dYdXs6vPIO+aSuzz6KNegY9mq6fZ1IQ7ZH1HPpT2+wPHVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tYZp2cKxyf5QuneFgBWAr2NqylKTOPRpGvw0FIEUbQ=;
 b=n/y00i9bV98fI0Aoy8njxWiDf9aepd26YHY/5zfKF+f85qv5qv5xCsI3uu+Pcbog9PnjCe7EaHtTUoT7lrb1ShQ9S3F89nUMGszWwlrP3v1Kq7hGQq9sGeNEbz2SYshlq8HFoTcnG0XhND2UDJ/tK31pABAlla7jxROB6FRA3K8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8336.jpnprd01.prod.outlook.com (2603:1096:604:190::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 14:35:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 14:35:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Topic: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Index: AQHYGmv+73RtIn9kiUW0cM1i3/rU4ayIJ8uAgAACFfA=
Date:   Mon, 7 Feb 2022 14:35:02 +0000
Message-ID: <OS0PR01MB59229CBA63FBDFBC8758A762862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220205084006.7142-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXqzQOatPXxEPfuSRyzJ81ADX0EhR5xng7XwpoCAh325g@mail.gmail.com>
In-Reply-To: <CAMuHMdXqzQOatPXxEPfuSRyzJ81ADX0EhR5xng7XwpoCAh325g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16ef7789-5aba-4fa2-5cfc-08d9ea4706c1
x-ms-traffictypediagnostic: OS3PR01MB8336:EE_
x-microsoft-antispam-prvs: <OS3PR01MB8336761D367173FD1D221BDA862C9@OS3PR01MB8336.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SGkrzar9gswb9JVCbYh/gnmeifC3obK23j6xhBnie6ZsU4qlNDgOHMHdCd4KzpP5LqSH8nukEZHeJ+A8wfFQlk/7yGuq/OA6pnaMDCgRdJyWLtNtAyuP7UlxSxS8w7xnAdRi+mX17rncNQE6MR0tnXam8ckA+87i1K0tqKmrKGVhVnVKbYzsxgzy75zsEXRIm9WNsEMak/AoGGNf0qCxVe9xKaYrDdp0q/kFXov5R7H+JThAoq0NJNLnCj3tp7KZfMJMjKOoCRhVKxeiv2D1FH1Yp7hyNNDKn+uxnlvvbSNgSAo9sxo0nGKN8yoC4dLY6n4qzkLQvDdn/D7I00bRMESiZvKI/YEMg381uaJa2arj+mQqDSIdka2YlV+wHBfdx7bfTPeake570qfmLLZY4hBrQz5MnyaZ4YYXvRpSmk6aR1tscIqV9EvSDpg39EC9V11ZOeheM/2iLyFVo1x1ze4sE8339IYAnwTkgdm1SaqPaY7H7f6OlneOXsylvS13aP2FPH5fpYtCBpOPAMvHomlm+qlSuP5MkFxFFin5h4wRZvGtqZ7VwAs6l0+A5o18DgYgdnp/YDUbsQr8uGlmA1fWMviCfSSLeWUBKTca3yra5BPguR2q9gTSb/Z7J9/RD20kdfoUEAgk6IS6VRjfAAwnBBz3n1uQl+oSu0lYjGoR1GitvTQB4FQL+xNz+7CMNMg7UXGQfBHGxVpFEsnz7u1tO482DWzilraPQqIfeeBni++fyB+gH1hpIbUvbNjXh5VAvo4RoEZ0JXHTjlXrCcSrZlPPODacHV779U+fAmE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(53546011)(6506007)(7696005)(33656002)(38100700002)(45080400002)(122000001)(508600001)(966005)(54906003)(76116006)(6916009)(66946007)(8676002)(71200400001)(4326008)(66556008)(66446008)(66476007)(64756008)(8936002)(316002)(186003)(52536014)(26005)(107886003)(83380400001)(9686003)(55016003)(86362001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1VPDqeYwdK6MlbsAOpV3lv27OorB0CkVK+lxzNQ7CtzBAXs3q9xvebnWGlh9?=
 =?us-ascii?Q?cq5pxIOlcX8p9YuxqknsZKZ9NAYhaktnMbgfEscIWjKfhrrrf0z9C4VEEihB?=
 =?us-ascii?Q?giJ5DtwxQHrp/JE5QdCECpectKRGEceJQ2vyNwEYr6nQZNqHw4Oc9oNbKC2L?=
 =?us-ascii?Q?bSCvSIMAykyD3HAPr+vqnRv0VannkEsXfBVdNxUznMMHHY7YHpBaHM7fjZxZ?=
 =?us-ascii?Q?hROLlRzQ45v+aNSbsYDRQi2iCmjgyZyBs+Q4zO6upkXin3a4LnzKQtGi1aZw?=
 =?us-ascii?Q?a8fJ+pbAs0DfBJVcl0YQcmzwXCTXLqH+f9vfqP9epFXk84UCPCGOqQ7ESCee?=
 =?us-ascii?Q?w946MSKbMSTiE4dPsuJ/rVifPKqSW8//Bw5DZjfnjCuT1ekzsfQMzbIpk8ba?=
 =?us-ascii?Q?wUuZW+mfm9NM3sbUsQL88VWjViGvz2SY0dgJi7+5sS8zSK1vuKI/RqKaeqG+?=
 =?us-ascii?Q?OuYWHz72Arq07nVonBvwHVnenbXJGV1x+/1ulWHcg3dUhKOn4hG9abzmwaI3?=
 =?us-ascii?Q?0xxpdgv9yfgmsS/YqJMpW+EA7rLIFNj9JJ5dNTPzdmIyWg2aJOlacvIK3Len?=
 =?us-ascii?Q?kXabWi4BXRuJHbq8kEaM0JvUzkZYqylhkS1ht33bwsjbmWSylWd9hkmsotov?=
 =?us-ascii?Q?t4hBg+0aW62tiIu4H4kc2sJAjTurUHOhM6Qcmj6z5721N/qGQWlqpOcOxnuM?=
 =?us-ascii?Q?mfBl8OD+gdGfAml/9XokUUevubzOT7J6RrB4pGHE9YfncgXZhrbPcVlz/LZw?=
 =?us-ascii?Q?+vFb3qpnP1L2wKWuiVCHt6kx9daTq1ZZNis7zj9IBdUHeiidM+98eqLyNwCn?=
 =?us-ascii?Q?agIaU/wBGUnrn+k0bVWTzqWN5pUKvFd+3u8ADF3GqZqh6VbUhSA0Y5q9TWph?=
 =?us-ascii?Q?co6N9bpIpmG5vP4rchXWZjJGzoAPkHneOfPdS4POkvGdYvrIE7wJYFZMQrXd?=
 =?us-ascii?Q?c0xE7exMgS6l49XOxXTUUaLUCK52IxwPbHNv1dam5WpffGco+wU5I50rY4Pt?=
 =?us-ascii?Q?MOUvfR4TWOsQVsa388Y7HG9FtfZQmw2P1ti009+uccyh6Rl77WBesSIPHyQ/?=
 =?us-ascii?Q?te93zEeyVLEW9xCccTtaD5ydYqIvq+S1TKD4ODvhoHRxHayR7aVE9psAtsxS?=
 =?us-ascii?Q?zZ0UomCS7/3E5TcFoMYsXSl7QCs7dEsafWq0AScjZ1nfVExVlHY76AxcKK8X?=
 =?us-ascii?Q?bOukcPRxtbTB1YX0rkvpdPCmPzL+CatJXiRubbF8LmGaO+2N3T3lbjg2qgeG?=
 =?us-ascii?Q?bOeWZA28wY1wPt4r0wPaOCk90MvZV3PDJ2Yn2HObNW9i7XONq53goMfkHCyu?=
 =?us-ascii?Q?5NIaLhmTyO9cNEs/rASoXFrVar4bW5fuLxR84JOKimWuQJxIJXfRrCLSkAzv?=
 =?us-ascii?Q?XJRB4vsMdOpJ0lbTWJ2hlKBzowdGm2K3eNby+eqoihhiDblIgKksDYg2o0gE?=
 =?us-ascii?Q?wkj9KC/eYK86bNiQA55pQqTsYdgfLISVnZ4D4rUUA8m7mgbk6xaSWZRj0DbD?=
 =?us-ascii?Q?bjVE3OyX9X7hho5OKokGaPiEnIQUM4+HWldSbPhgyYNmJF9OJ20AJXJ4SkFl?=
 =?us-ascii?Q?y9H2UYLptAn9ZoLL12+r6TfvsDENUCObGYKcxa4n4eNW8dNWlAIYjOTGK798?=
 =?us-ascii?Q?uAv5mSOg4hbhiGwxTECwQAHwm8WZwQw3t00E86OsLl87iXJR+C/3SMFpW7cj?=
 =?us-ascii?Q?6osbJA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ef7789-5aba-4fa2-5cfc-08d9ea4706c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:35:02.5769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9vMzpQj1fZWG+jIIxiPfqpoctHxF5m5+Npx0HHGUy7uVDh0KMN/7Po4vvaVz9di3XfkGxK6m6z2lNxivzbU8KA8VE3ljt4thEX727i2I10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8336
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for the feedback.

> Subject: Re: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L
> SoC
>=20
> Hi Biju,
>=20
> On Sat, Feb 5, 2022 at 9:40 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > The clock structure for RZ/V2L is almost identical to RZ/G2L SoC. The
> > only difference being RZ/V2L has an additional registers to control
> > clock and reset for the DRP-AI block.
> >
> > This patch reuses r9a07g044-cpg.c, as the common clock IDS and rest
> > IDS are same between RZ/G2L and RZ/V2L and adding a separate
> > r9a07g054_cpg_info to take care of DRP-AI clocks/resets.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > This patch depend upon [1]
> > [1]
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> > kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git%
> > 2Fcommit%2Finclude%2Fdt-bindings%2Fclock%3Fh%3Dnext-20220204%26id%3D4d
> > ecd2e54b61686787f36b727d2772e067a46ea5&amp;data=3D04%7C01%7Cbiju.das.jz=
%
> > 40bp.renesas.com%7C820d967550ea4eedc6d108d9ea457c54%7C53d82571da1947e4
> > 9cb4625a166a4a2a%7C0%7C0%7C637798406429941649%7CUnknown%7CTWFpbGZsb3d8
> > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> > 000&amp;sdata=3DHMut3PBVm4oGRV2yFbPvKhWecUvz2yIUOuqZSktoJwE%3D&amp;rese=
r
> > ved=3D0
> > v4->v5:
> > * Rebased on latest clk-driver
> > * Added base commit ID
> > v3->v4:
> > * Added common/drp split for core clocks and resets
>=20
> Thanks for the updates!
>=20
> > --- a/drivers/clk/renesas/r9a07g044-cpg.c
> > +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> > @@ -11,12 +11,13 @@
> >  #include <linux/kernel.h>
> >
> >  #include <dt-bindings/clock/r9a07g044-cpg.h>
> > +#include <dt-bindings/clock/r9a07g054-cpg.h>
> >
> >  #include "rzg2l-cpg.h"
> >
> >  enum clk_ids {
> >         /* Core Clock Outputs exported to DT */
> > -       LAST_DT_CORE_CLK =3D R9A07G044_CLK_P0_DIV2,
> > +       LAST_DT_CORE_CLK =3D R9A07G054_CLK_DRP_A,
> >
> >         /* External Input Clocks */
> >         CLK_EXTAL,
> > @@ -80,252 +81,285 @@ static const char * const sel_pll6_2[]    =3D {
> ".pll6_250", ".pll5_250" };
> >  static const char * const sel_shdi[] =3D { ".clk_533", ".clk_400",
> > ".clk_266" };  static const char * const sel_gpu2[] =3D { ".pll6",
> > ".pll3_div2_2" };
> >
> > -static const struct cpg_core_clk r9a07g044_core_clks[] __initconst =3D=
 {
> > -       /* External Clock Inputs */
> > -       DEF_INPUT("extal", CLK_EXTAL),
> > +static struct {
> > +       const struct cpg_core_clk common[44]; #ifdef
> > +CONFIG_CLK_R9A07G054
> > +       const struct cpg_core_clk drp[0]; #endif } const core_clks
> > +__initconst =3D {
>=20
> Having a single "const" between "static" and "struct" is sufficient.

I got a check patch error "ERROR: Use of const init definition must use __i=
nitconst"
Which is fixed by "const core_clks __initconst". Looks like checkpatch need=
s this in one line.

Regards,
Biju

>=20
> > +       .common =3D {
> > +               /* External Clock Inputs */
> > +               DEF_INPUT("extal", CLK_EXTAL),
> >
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> i.e. will queue
> in renesas-clk-for-v5.18, with the above fixed.

