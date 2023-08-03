Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC0576EF56
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 18:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbjHCQZs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 12:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbjHCQZr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 12:25:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8ED130D7;
        Thu,  3 Aug 2023 09:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKf7eDoisMaFG3kxf1nGAxpui4X7KylaGlEupnoyOJLD25qnJLENJtjWNAVtPHSIpqTvLaa/Gcz5EV+pmBAdjvoVIseeCJdflF1BDB+4N66DuPXNgU7gbGcSCOmS/2vJbHVXc1ZCYYZaPTlZGagVWD54o9k92ddJvDqQArSxU2+G/v+w9vTGdz3IcMJ72/d97aujaJOTpUKGqGrws21VHoKHFERckaMf4CGOPsFwuXQfF39mpHGNVipmZRIQ1DWBnX0+YJCpev4LO7FY06uLQdTtf7zibtW931Bbvvg9pIfmcelJ1JNlBr7f9sMhUdaNuXT83VKvLS1dCobKsRXqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54BR1w5Xam35f0D2oC2awnuCn+JooCfCicOsmQAJeiM=;
 b=hf1RPla1vfuRaOwNa+7nmPbmn0Oy1WKSeLVr6LPadwLTnz3bXoVXAPLU98ZKPFRmTlf9pErkIEEnPP7+1LGnf0DUubKGoKZg/vTpUqSJOH/0bIIByTorbUSfuqCRoAQhjjcZDzNBX0MJ8EhwmG92qPwDWNstXjZvr/hlaR4qVlFs5XOaX1bFX6SVo03ZlSJtFuEUi0p03t2lUg1gPmRBcYZagtIukgG0EhIfi92neTfJGftjhFyG8N07Uu7iDDevSPomtnMxi76Z95lS1RD7l8VVZh2YU89uVfhVkx0uBIcZTnjsem8oKMiN6Y9ZPVV10IjeAZxgZ+qrpdWZD4o5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54BR1w5Xam35f0D2oC2awnuCn+JooCfCicOsmQAJeiM=;
 b=BgmyftuHw2eX2+tzz4WbH1kw2cbFz4WoG/8/AnTCCzuJsl1F0ErMPT//ygT9LH4vOptGKDTeJGGYH6YWmXPYpyFLflgfUNrUCvUNY7vITO91RWF0TQZ7P8onpHrylultWx+B17K/6wE8Ft+QxkLoLA2F2RP5Y0vBqX0JysUS5UM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11429.jpnprd01.prod.outlook.com (2603:1096:400:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Thu, 3 Aug
 2023 16:25:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::865f:1bdf:c364:1184%6]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 16:25:40 +0000
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
Thread-Index: AQHZxTxohvL0NbUaxUuWUT64bxrffa/YvVIAgAAAhFA=
Date:   Thu, 3 Aug 2023 16:25:40 +0000
Message-ID: <OS0PR01MB5922B71C39F54441D0E8EDB38608A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230802122510.275420-1-biju.das.jz@bp.renesas.com>
 <20230802122510.275420-2-biju.das.jz@bp.renesas.com>
 <20230803-imminent-impound-559c483b75b9@spud>
In-Reply-To: <20230803-imminent-impound-559c483b75b9@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11429:EE_
x-ms-office365-filtering-correlation-id: 76f1d211-1d06-40b9-6f52-08db943e4715
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Flvt1RzlU9JLAT0/v7EA400vGBLZ6ukdQLmkqDAaU+1SUu9X/a9C9o5LKIhLmiqnfSblRYGs5o18OvPs//Np56svn4NpF6xpMUix4eVBaLCB8yZW/9l1xTTby3MaFGVSq7J3egrxAB0e19xB3lXMSMtBGEKxDX387V9zjuFWO+gMOIsZMFurz9euK616y7qtDlU8m7iOJmmIumyfP74fojFbgNHYkN4tK9WYkDyXIMK6U+7XhSuW9fYJkIBl0IF2CzflYo7lVZqEvwDctxqCNyO2bcX9lxtEBGXFf8b/OK9pEq8rOc/7gZx15ZxlzpGDbc6w9hphabHyL+cXBLL72kJeaJMctNETiJcWyggzqUNHQCCpOg2H7ePNvfKFUMQNEErKcH9SaYgK02BGyjil33GMUf8EH5nphWBwqZHHMFY6Py0Bpp2AMiQGRZB8zPGKu78lRrQJxcVQTQCr/nOt0MqexEkyXFWb7FpqIK79RrRkF0/G8cf9EAdLKpo+eqf93ggF+LfWVOrVlpa5UGSGqWWXCEgU7LshMJ1EBbP7KTVNPDat0j5di11tSO/GgjtRpXWD7nSeCdUuIWpcz/YnQD2gOp+x/8ozPx6/TIMKPA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(64756008)(76116006)(6916009)(66946007)(66446008)(66476007)(66556008)(4326008)(83380400001)(316002)(38070700005)(38100700002)(9686003)(54906003)(7696005)(966005)(122000001)(478600001)(55016003)(71200400001)(41300700001)(5660300002)(86362001)(8936002)(8676002)(52536014)(33656002)(7416002)(6506007)(186003)(26005)(2906002)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gSv0EY/wajTF6ebpw7d/N5QGPoRlJFviwZAeD8+7cHVdEfIcKtz1130ffiMR?=
 =?us-ascii?Q?IdBwJu1WxmORblyL1lyHgcXm21vDTRoqPBIXnEExRIO8USOohM0Y16n30xuy?=
 =?us-ascii?Q?vGXhJWy9WxsBORZzZXuyoEt/7WNd0ji4kPG+HXeDXZASHJV06yAZoVO4H4df?=
 =?us-ascii?Q?Ve7h5YfoayfveVz8P2HFDdkIIDDqnOXpGeJIGP6gYq9N0dWTfTNtuy8yL9yq?=
 =?us-ascii?Q?+bJhIEIiKSBeG5de1bLcXylrMpENjuyXoGo8nvC7HRj+5kJjdrDuA2CBBa78?=
 =?us-ascii?Q?2yOGBCXapIgZ8LDZTWRskZHAeVH+DqJDMcR7iY3bx/TDj5H8bOvE9u4zM/rC?=
 =?us-ascii?Q?Esiw7UbdSUPuTNJCbbLcwKR/jJoYMxWyQN0epikRq5uaZ/rnti0kmqRXKPSr?=
 =?us-ascii?Q?boL/BAcdZ/bXRf824wefnEQNYgVnSlzRLdLFaGFokasp3VlfFyFZnlPQgzHA?=
 =?us-ascii?Q?cogz+ynNAxEh8o7awZV63WEsOiXFvFgNQBHLnVgMmrZuJOsniNhniyr/Kp6V?=
 =?us-ascii?Q?vUatZP/k0PP+L5LfZGEZBiNIM4da4j1DgFBsh618Ele8lgvDNYTHqaeXHLZs?=
 =?us-ascii?Q?MEvEqU7vOwgBSWpii25HBLu+rNEZqbZPxT7zokYnmSji3UqGYrmJOt9z9HTb?=
 =?us-ascii?Q?N+KT+68guZ/rqvWwtbmPAShzgVe5sBUb81B7t/8uKs8gHHw2NaO1u6DviQAp?=
 =?us-ascii?Q?1bc7cblg+L7s6h6bKZ66HmD7NiiN1KCXx8MW6/cut+jGj0bQO9SF10BDQnYy?=
 =?us-ascii?Q?3OqJJqKX2Nukp+2W4ZpUROSoVxBx4Kn8HgGRJZW/RbnOaJzGrAtynVg2M2hg?=
 =?us-ascii?Q?V2+BRTl1ZH8IOj64DQIsqRIZX+0uEkXg/LN/GzcFngXM8SyPZxgd0FdJYI4u?=
 =?us-ascii?Q?AeY+86WRwsIoH+m0EtfvAsMDV/dFTC2N18gtCS7nDUj25kT3CghVgMaWt1sQ?=
 =?us-ascii?Q?nPJt5zuyRXnpsXwsfLfp87+siUTnd/DWyCznTzIDrzfg3e+8SP1qvPrOLCmM?=
 =?us-ascii?Q?ymqPdTFrPuJ97E9/XjISdyjpEH0m7zkqZXtDlb7I55tQTZpxnSJhC28G1wZ3?=
 =?us-ascii?Q?9WiYWmgFppaBDUBWDr/oH5Sh9XqzoUTFlJXxDG/hs2o3/5sf2HHyizMSMhBn?=
 =?us-ascii?Q?LX5VDQBE6pEogghssm05Pnn3R2hJbs+bpOi77rpBOqnpVyZqJY//c/0c9ukh?=
 =?us-ascii?Q?OdaFb5lg4BXTx+1LPS1GRRd0pO6GRIAPWDuvYzHuI5y+W6vp0tmWOCbdj3xB?=
 =?us-ascii?Q?DXFGfO8fkVoB1IDgrdKDunFWP8PjgQjGNu6S2jn1nckg9ioPr/1AJxWIxQJ/?=
 =?us-ascii?Q?cRAU2jRYzVM8jUm776tcc4m/ekc7H4sax0S7sqXIgivowyCQpi1Dj/9IeyyU?=
 =?us-ascii?Q?crzEnzlKDLLeG/oRkMbGCcRF0D9TRh5BexsC7zMurqyH6l0DlI1uul0bLbw9?=
 =?us-ascii?Q?kKJy9jF6/URMhQjxOoWR4+i3bRyt6LdT6F1ox1fM1adoz6WaNPfX+mQ++zVe?=
 =?us-ascii?Q?3jkrCbDG7TwKISyCbhh2qJLrScCVqwe300hbPa6kG0BK2FdbK7maION/1ub7?=
 =?us-ascii?Q?hhSfkrmHD243Cn+8fB1946SrjekllJ4CrVlw7RbuRGTJnndl71sOJJwUzv9g?=
 =?us-ascii?Q?nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f1d211-1d06-40b9-6f52-08db943e4715
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 16:25:40.4175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UlMEHV1V0ckP4r0TMeedVQTS6MuvlHpZ5ZqBHq0GS4ePnQhJDE03DJe6NqGqtPTD97tAyrOETva0VxF3LHopPCpX1slNWJDw6FO5d4UyLV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11429
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Conor Dooley,

Thanks for the feedback.

> Subject: Re: [PATCH 1/3] dt-bindings: clock: versaclock3: Document
> clock-output-names
>=20
> Hey Biju,
>=20
> On Wed, Aug 02, 2023 at 01:25:08PM +0100, Biju Das wrote:
> > Document clock-output-names property. Update the example according to
> > Table 3. ("Output Source") in the 5P35023 datasheet.
> >
> > While at it, replace clocks phandle in the example from x1_x2->x1 as
> > X2 is a different 32768 kHz crystal.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Closes:
> > https://lore.kernel.org/all/CAMuHMdUHD+bEco=3DWYTYWsTAyRt3dTQQt4Xpaejss=
0
> > Y2ZpLCMNg@mail.gmail.com/
> > Fixes: a03d23f860eb ("dt-bindings: clock: Add Renesas versa3 clock
> > generator bindings")
>=20
> Nothing in this commit message explains why this is a fix for this
> binding addition :(

Basically, it fixes "assigned-clock-rates" for each clock output in the exa=
mple. Now it is based on Table 3. ("Output Source") in the 5P35023 datashee=
t(ie: 0=3D REF, 1=3DSE1, 2=3DSE2, 3=3DSE3, 4=3DDIFF1, 5=3DDIFF2).

The newly added clock-output-names in the example are based on the above ta=
ble.

I have added fixes tag, because this patch fixes the clock mapping in the e=
xample as per the HW manual.

Please let me know should I drop fixes tag??

Cheers,
Biju


>=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/clock/renesas,5p35023.yaml | 14
> > ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > index 839648e753d4..db8d01b291dd 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
> > @@ -49,6 +49,9 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint8-array
> >      maxItems: 37
> >
> > +  clock-output-names:
> > +    maxItems: 6
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -68,7 +71,7 @@ examples:
> >              reg =3D <0x68>;
> >              #clock-cells =3D <1>;
> >
> > -            clocks =3D <&x1_x2>;
> > +            clocks =3D <&x1>;
> >
> >              renesas,settings =3D [
> >                  80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf @@
> > -76,11 +79,14 @@ examples:
> >                  80 b0 45 c4 95
> >              ];
> >
> > +            clock-output-names =3D "ref", "se1", "se2", "se3",
> > +                                 "diff1", "diff2";
> > +
> >              assigned-clocks =3D <&versa3 0>, <&versa3 1>,
> >                                <&versa3 2>, <&versa3 3>,
> >                                <&versa3 4>, <&versa3 5>;
> > -            assigned-clock-rates =3D <12288000>, <25000000>,
> > -                                   <12000000>, <11289600>,
> > -                                   <11289600>, <24000000>;
> > +            assigned-clock-rates =3D <24000000>, <11289600>,
> > +                                   <11289600>, <12000000>,
> > +                                   <25000000>, <12288000>;
> >          };
> >      };
> > --
> > 2.25.1
> >
