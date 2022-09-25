Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F6B5E94A6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 25 Sep 2022 19:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiIYRGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Sep 2022 13:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbiIYRGp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Sep 2022 13:06:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792E52A727;
        Sun, 25 Sep 2022 10:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGlXh1ytA2ZJ1VRYaWqwzedfj009BIOlkulR05m/lvjmJEP3mgi9vXy72CbPKdEhzHj+lNudKaEiGwBxOLd9kuzBFHl18Pk8MBBwwX+yYxTkHJ+Ox0/GC7wsOECFaXweuYvK64BIsnbpt+JZ04d395wE/yGKDTnC7LcYtuosLw5I4MXzQ9rYOAACfGTpuZ7v+k7OltJprqnkUcDPWiSidONo4RUdHg52GJfJy5z+AADmTTlIp+hAQ4GAXYURVjpjE3f8J0cP6SmrJzEIVWVfw6VoexBeLE92SVh2PewmqVyxmYpPe7GP3UP8wkrI3yEbkYdGVsjtsLCRvU33KmHDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZDgT9Hfh4RpMqH1kYDEQzTeDby+j2tozeAuv0xaOPs=;
 b=koPjbSpzvFcxI0CFOG2UwoRCN7lRbtUyhN2B2vppPiKet/aoagJo2mEXVs1vxJuwwuIjrv777vxMaHbwvOjvrgfeivdohdf8t1DIoYB5RK0rhvgzNw5NCkAfr7c+wAi8UmEu8bXWOCT00Vm2FodDCubN9GxN4UGpsDZWZ2YzomxusNw2pkUTrsQ0cV/5fR76RNZr43AncfcwNqkcKIhNO5wbb/sB/GJJ1g6AjfuPs7TvcY/7etOJSTc0UmMsptWZXI80XtnsnSiI31hdzpfjK+TD71tImucBEU/BWYhr1QqXehr4m2S3UQVQDwp0UXNS1BcMN69Z3HA8elvHyw2efQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZDgT9Hfh4RpMqH1kYDEQzTeDby+j2tozeAuv0xaOPs=;
 b=VlvIK4CZwuCtJaL1xr+cVZLpaw6kXYGAa6FBmArmYMZ6NasHjm+TXWf4SenS+/f6WJzuiDFxdTtvL5JkZrC1iMtCdpHQzY6vxK9xhDknKLNFuNoajZ5Q1AENNH8AfewQ/03W4sTOpuMz6KmDGvf/Nlv4I11JLcis1kyxZz97lrw=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYYPR01MB7710.jpnprd01.prod.outlook.com (2603:1096:400:11a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Sun, 25 Sep
 2022 17:06:41 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc%9]) with mapi id 15.20.5654.024; Sun, 25 Sep 2022
 17:06:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
Thread-Topic: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
Thread-Index: AQHYzmEL8L/KEMB8n02YNi6lLAt7563uYTMAgAIBePA=
Date:   Sun, 25 Sep 2022 17:06:39 +0000
Message-ID: <TYCPR01MB5933319E9510B176644D2BC986539@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220922085511.1078256-1-biju.das.jz@bp.renesas.com>
 <Yy7ZcJ8h2VCtUDnW@shikoro>
In-Reply-To: <Yy7ZcJ8h2VCtUDnW@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYYPR01MB7710:EE_
x-ms-office365-filtering-correlation-id: 19e4952e-84ed-414c-80d6-08da9f185030
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yqfsQ9RuudB92/BesgKDgg0Q6x4XBA5oFaUQ1gcw30Ajp7UYDEDGliilYcs8/p/SHtlYkZSc/Ev0cX9jQz8qnw6D7Xs5OIV7RH1Ks9ZuqzklRWK9E+NYAj4hBJ9xnY9L/vRXv1NeCYchcDlw4pXR9hFguR7IcGZ8FbSPaBLtfSIpVFniTfY/KOZRVB4LNTHTysmmufe1SPWLpXYtj5CTXN1DCgrgc3j7PcbrJWmhuj5AWvWjI1PwP4uWGuZLjTVDVzeLnwVZ6oEK7eSryh9ShSeCuK6EfxOPX6GLjIMVpCVy/YXbHEYyGu0lifb3+J7HsCVNSuTjdMJMzughvQebpuaS+ToezEebTmYbz3e/qs4HXs5/y/RH8m/eLTxFH0IO5rY8uWDhT+H0rcKc3Qd/ybRLozx1/BGltsm3t6R6faBkhgBUD2Nrctu77sdKQAyudstULRg/QjFds9oQWxk+ZHbJyb6TR6NMLIzxo91+L0MMund1sESw17DV/ME1E/tjhdzohoN+xxcXfingsgPcqCBg+/1LoqOcj7ELxN1ea8ISUcfW0K3aYkWQXPDBcxhWIrgWVlklfkGxtAjJpNwXpdbLa0PqRGUcvRq32k5LhCRX3R91xdx/SBOtdsLGM1aWUJhCssNdoJtIcDoZalAkRjxsDrxSSnTukn0kJgjXWY+oOott6Q3I0EjQd/aTiNUGWd1kqIUmCHABx6i0AG/2jlc2jyJ+F+1tlHNlSt/kA9bwnfLzNjT5ajl/T4Zo2/7x1ssYumznwc7H/XrD4qYOaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199015)(26005)(9686003)(5660300002)(6506007)(8936002)(52536014)(7696005)(41300700001)(107886003)(38100700002)(33656002)(83380400001)(122000001)(186003)(38070700005)(2906002)(55016003)(54906003)(86362001)(76116006)(66946007)(66446008)(64756008)(66476007)(316002)(4326008)(8676002)(71200400001)(478600001)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DqbkoqGOIWASyYwCG33Sc7KEen2l6WTto8LJgXqVzj7IMFB1HaZIWBldondQ?=
 =?us-ascii?Q?jKxDpjR1i+3FBXeI7vSDcNrdHS/POhGfGf/+OXXzgyxcsUxAmHXS+hMr0EyE?=
 =?us-ascii?Q?aU0aqT1jssQL6Y1Q7xcundSQkQ9FQKzWQRRABad7PsE7pv6mjMNdUlVcP7C/?=
 =?us-ascii?Q?Xu++mQgEQ4az86mRc65K1K3CXEqjF3yIE17iQurTahqK407MT5zARh51FXUS?=
 =?us-ascii?Q?bDGJBE0T/a4l9cPlaLFJgKhhHLGTPFOrtgZ8aNyidT7cSzYeOdrA184Aqu19?=
 =?us-ascii?Q?ILdxtJCs2Ofx4+upRAIkZeUPzf2/TGFvi0cUcaXGs7q+b9Fql98GijXjiCui?=
 =?us-ascii?Q?5Ac3xVlsOQalyBMscIJtCwGm7Gjg/l2Km9ykp9SCYuYE3hs+pEKm2op2SZDu?=
 =?us-ascii?Q?y83jW3nZxv5aYODCItk89a/nFIHN5twCmywEu4F6hIVKOWhzBPBsWuYW6J2T?=
 =?us-ascii?Q?451XUpgEIudymPgB7w4nsk0QDI78n55VJnd221EgeHQ/LTLf0qP+vjV25OCE?=
 =?us-ascii?Q?xDJbne/smCXGkqwqEEvFXGJtpmF3ckozc7PtF1ePegsH7XDQmSaNhThNmDfJ?=
 =?us-ascii?Q?+8DzwM4pdbvYDR7pY/QZVMeUJN2CFTROac/MEpsT+LysIvdKMnoYGj5k/OvD?=
 =?us-ascii?Q?bR52DVeq7ZCyOcYY55pv7WtYiPKT9GoKuuyUUuAzQuXrBuyIYRI5jXw5Jldu?=
 =?us-ascii?Q?Vl+/i2y5TLcFrc0BACNcD7zFlpuj+L9px/f2stGh9CCm2n+5H7IXuVoY+2MR?=
 =?us-ascii?Q?A/e86M2BPGpeE6+bN48BuzU9ueFzyPolinD6N92agwnphEM9hoMGrQ30RhFB?=
 =?us-ascii?Q?pSpQP3OzuUXEZplrB30agV8mJtaWYD+iONZKy6q/vDBMYThtERCyrPut0RmP?=
 =?us-ascii?Q?FGiNizdXjh5pxblMh6NFbh0rv2U/8b/fA3FP7i/t0rfsATWpap8GfAuOH1OO?=
 =?us-ascii?Q?XMyO5kZgW6yb8+eU/6JIAiNAavxfh+irO6rJyR7Rr2EO4D8hSmHyPHJjviuB?=
 =?us-ascii?Q?VAnzxNvQeTFrJ2+GChVtQRxj1LHxfNyI4e15V4ZE/ZcD7u0N/Iz13i6i3L9U?=
 =?us-ascii?Q?cG2ZEe3jd8YEdXsqNPAOB7nlP/kLQ6OhXE9pauF3Qof0nG0zYth2h4NntD2/?=
 =?us-ascii?Q?1U0kEDXk5wmO7ORbiy0+bwwS7g1DEa6L9qIr4iDQ5/GyLY2xVsUHZg5lH4am?=
 =?us-ascii?Q?bayS1bWJsRw9ixQVuvr7fi2J9YCK6T2ZutgmHJrXU5idqJuq3XYb75AYO90V?=
 =?us-ascii?Q?vyNHlvLiR6RsMnEBSl8aBMhDmmR4fNP3ozyzhMwhSZ3+Jf1RqjhTygRLfWx1?=
 =?us-ascii?Q?QVOTcyarvw8aeaZbTTXOhnLQCDRk1/0SF02gBZjk/LKJMNxHnfzVWjLktAHt?=
 =?us-ascii?Q?kq3gtSkkmvp8fHvoswfMm9zOcUmvE0/PmAqN/oIIKBGegneya9tnVeRmcagR?=
 =?us-ascii?Q?4xLZPWs4ca791GneT9RcwA6cxA1ZtnsRzwTs/myjK7J+6Hl24aDRQuou9Htc?=
 =?us-ascii?Q?tX8p9s2pV3Aud6mo0ASUoIFBDw/PQKcMykTh89V/hCHiTeltt03QT0n62CM3?=
 =?us-ascii?Q?1xSCKeUfxTZYLw2ND5DIHCjEPsEqaakFH/I8D57X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e4952e-84ed-414c-80d6-08da9f185030
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2022 17:06:39.9421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZGVXUlJVeJv6IfrQntopdB4QHAjlPn9t21r6LqZQAMAcO7mGiPjCs1nJGLcV36HlvJ1J7oQKrXw1eFElbLKCxsysaUYpHtp0/9+r1GsGu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7710
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

> Subject: Re: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
>=20
> Hi,
>=20
> > v2->v3:
> >  * Renamed the variable new_clock_margin->new_upper_limit in
> renesas_sdhi_clk_
> >    update()
> >  * Moved setting of new_upper_limit outside for loop.
> >  * Updated the comment section to mention the rounding errors and
> merged with
> >    existing comment out side the for loop.
> >  * Updated commit description.
>=20
> I really like the new variable names.
>=20
> > +	 * To fix rounding errors, eg:- (533333333 Hz / 4 * 4 =3D 533333332
> Hz
> > +<
>=20
> (What is the '-' after 'eg:' for?)

Regarding 'eg:-', I got this habit from school days. On exams, I usually
write for eg:- to provide some examples.

OK, Will remove '-' after 'eg:'.

>=20
> > +	 * 533333333 Hz) add an upper limit of 1/1024 rate higher to the
> clock
> > +	 * rate.
>=20
> I know Geert suggesgted this. I think, however, this description is
> too short. It should be mentioned IMHO that this rounding error can
> lead to the selection of a clock which is way off (the 400MHz one). I
> liked this example from v2. Geert, what do you say?

Yes, I can put back the real example from v2, if that is useful.
533MHz->400 MHz is a big jump due to this rounding error and it has
impacted the performance.

Waiting for Geert's feedback.

Cheers,
Biju
