Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2FC628E23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 01:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbiKOARd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 19:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237384AbiKOAR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 19:17:29 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F36C1D312;
        Mon, 14 Nov 2022 16:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmorJdJ6MNdGW9Q3w3YOZBqcSX8S2AZTKOj1GGC0YpwvJ2k2nQAfCIm4tf5ykQgGu2UXbuiirL0jirBj8TKaF50jemMSL05XW+UrDHvLe0CSdB8wLqQ3DlWV62iCieA0rTBN8cROkWyrlCEWugRDQS4AC/xnkxav3poOJklJ0tZ+j4iZbJNsIHRjHFpCOgEFi9JpNxU/O085mlOvoY3jn1YZj5Q54HhlLGlQ+kXAX1kUjd/sKod/tOpbZjqZP/H5gdPWjmETZ36pCwyjz+nPAMTB/lnFQQSE+Aj+wqxE4k+DGANjcFBaUMVdoh14lcQCEM9/kKIthbsrOlbBOXDqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJV4xQJRRgOz2y8V+BfXjht+/G2cxrdjfJAicj6vAUY=;
 b=Fs/elD2MwSIhZeJTPEfB26r+EyJdx7WwSqm0WMtGSUUlnwNxQ2gWHPO1mKBziE3Q4w/vuaib5RApJX2Eda6sbrY6S7h/UUBkpLjEdGL2j+KtGFBNbv24NzhY+mNkuiAC5uiIl12fXhjSLpP7wkIWIcTUh8TBsaGiNPl5c1OyuLqphEg8oiCaz3Nnl+ZaqrZBTiJ3mqiwx2YB7oR5rRehlB8GwonpqoHiwGMtuveofDFT8DT70LCt93Htes6a/icOLVvDJBsDAROOyjWS+hQ2FM8u6yFhp79JYd+ycZWoMW1vqy2cC9ZEX3kc9K+XmAaFO91lRMgrmMyZP2nuUkoFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJV4xQJRRgOz2y8V+BfXjht+/G2cxrdjfJAicj6vAUY=;
 b=nQXSEM0TR53E4FzqmiA8nyDvFrCswnPzdI1cmHdPhxcCPbBSzbvEM2PwwTaefGwoW+BMxUg1hvrm4PyJ4rzmEc7Zy/KhksbiJkWRQhfjOJMiJ+mfZtA5GhgQBy1aK2LyoIeZO5v1+EPrbx5FW0aBRBKeMS2/XbiP9+xlFai9xwU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYVPR01MB10877.jpnprd01.prod.outlook.com
 (2603:1096:400:2ab::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 00:17:22 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%8]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 00:17:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: r8a779f0: Fix Ethernet Switch clocks
Thread-Topic: [PATCH] clk: renesas: r8a779f0: Fix Ethernet Switch clocks
Thread-Index: AQHY+D3cL3IBwcr8zESbW6wZZOIwBa4/GtkA
Date:   Tue, 15 Nov 2022 00:17:22 +0000
Message-ID: <TYBPR01MB53417C08B941FACDC8C16729D8049@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <0d11da202c68f80345838d23f31c9d565c0d0ccf.1668439211.git.geert+renesas@glider.be>
In-Reply-To: <0d11da202c68f80345838d23f31c9d565c0d0ccf.1668439211.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYVPR01MB10877:EE_
x-ms-office365-filtering-correlation-id: c5ea97d3-b860-4d43-c860-08dac69ec45f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XfThai6xIIE2mBTo8w6DCyU4zfhAVs/CEOL7t0/d8rpelDSTR7yO/NtWGZ9ThNN8poYcX2tjZZtvCOC2rfnnBy6PpPotsQDg7x7+yyi9f/5/p6GPOkyadR9R3OmHuAGh8r1Ee98JaL+pjarQBmlgqJoNy0ZFhaSBTzFJIN8W7p0PPxT7J/oC2t7PmgBaEmY84Tf3S8ROsuxtWdq8dMnzGs+cYb5TOJgWK/PJq94KILQUCsJ4owi47j+0ZB0qcWviRkH/tGzQzg11KzW8jYJp62xmKCwtef6QPGmLtjMGMh5OxzsjKw5P0wmgl/nxyGtxwB7/UYNxm9GUfsNvQqC+0Kc3S4BbWt/rig6dKEGj8S/kxsuQd5P9soRyW90jK7I/+cyTpkDSOETnuY7Pt//fEQjhBggjqRrR5b8Xo9p5JAXQ6CCGRvKeEWeikrQvtwl4esG8PcjVDlisvYSuotlyh7jsQpzolft5jUjPPifAcrnWMKNTkOpgILGHGx7UbVKRG/31+agc8CEg7WKO4JmeppqxmONcyi+fyS+UrXZP8fHfIGJ1JNpOx0nxgZuv/kWaNr9Cx0TZfnv4I2R1GhJ860WbtSieHGVK2DJ15ZumXjuZ7nj2UgHtnJDW+LtqzV6qPVLgvyYEkJ9pAJK/270VH94Ia4KOZBKdkkYxjnl3FF9pERxzZzxtTNeJxGnt6i52ycq6pP0d3KHbsV5pkznkWhXCSYaD6wOIeNKj1HMyW4HSCBlNO6AMpK7lLHlzEOQLxwOsuuVBnu1pbdynkffq6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199015)(33656002)(38070700005)(86362001)(38100700002)(122000001)(186003)(83380400001)(2906002)(9686003)(6506007)(7696005)(110136005)(5660300002)(8936002)(478600001)(55016003)(71200400001)(66556008)(66476007)(316002)(76116006)(66946007)(54906003)(41300700001)(52536014)(66446008)(64756008)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1NMpBZsuALlLE202yPA+dErdxm2LbmRvPU4+W1RdSIkahdOejcPmDYZQ7AzO?=
 =?us-ascii?Q?Sdlnu0kkbYOCbpifml4f/oZ43vlr+l5gT4WEQULJp6bg/bJjrTy15an7C+Ov?=
 =?us-ascii?Q?pCV7biPjxJ/46/gdaht5G/1lJweujuuI7LXKTqjZo3kYjUBqk0JzuhKb0b68?=
 =?us-ascii?Q?5VDhVVB6kJ4esVsj9+OGKoFs8u1DBFrMd93yw6lyNEvxG5tGeKho56yHD2Qp?=
 =?us-ascii?Q?yQTQMd5IEJatfrf3nDoJbH8Sk0DleCgyo5i2KEpfEAPunzFs0VvB+rCwI1bs?=
 =?us-ascii?Q?lA8NNZ/l/nd1X22UKQyCs/HDMVBHghBbyYjT2GcV13la1hJtz1RMoZDeeoV+?=
 =?us-ascii?Q?2exx+vK3Rlx3/9hPqp6M5Ncl0RdGaLHRI6yw5CZE/upXWOnmVn1Fi0th4Uq1?=
 =?us-ascii?Q?QCLt3LjLRJIKIRVuO6N/21Sg4cIGfY7JwwmsDH8nMa9duGgNGRp5KZoOfkTe?=
 =?us-ascii?Q?p0BOFbI8oZJFCfaSb2hJvnThMjdhS+/R9Q4XVBr2s1tU/C6/EteYdnp7GO5s?=
 =?us-ascii?Q?UxAoY0bNS2BSZBX8pIgGhOpoXhMEQVLWgVrIzD9+0K7pmgJCgey/0ClZ4+Xo?=
 =?us-ascii?Q?KwZAvUICaC22UDF8A5qjTjSPvGnNQbcBOP/Z7A3d62lcbKDP/qZ8jnpHgUOT?=
 =?us-ascii?Q?kYNdB6H54tH5rZ9X+Ab8mxpxOILY/+LvhA89jGtg/IldU2+qgCRnjFuduVE7?=
 =?us-ascii?Q?csYTOk1v3DM3hKkvssuWafTWpzSU1BNTWyP+WuS5ueZy5i8byUurRfcztWlj?=
 =?us-ascii?Q?0ndiPA5yHm6yq8JNBs8kAk1zh+Ra7/qAYnkoToLv6f5ain3M2mFXv/XaUYtT?=
 =?us-ascii?Q?V0nOHfzXwn1dqzkl8VSDTRr79i8Km0dnJEbQ/7zEXgkF2rzKtgKYbGEQZDvx?=
 =?us-ascii?Q?QHRbN6V3v+36lNhm2Z5eWl5QAELIyYlKxeFkR6ypqWOxGp2CC6Fv1NWbdL7X?=
 =?us-ascii?Q?s+8Oaoa4iYMtceTQpNwiXYU7TBzQszMNFqmn+uXOEhr6iCyLzymS/IYHeAl2?=
 =?us-ascii?Q?EcehLfllgP+xfqvm/ytGJ/j1X0fV04rqACnAXsKGJYPMeFJs8hWtElv7YqwK?=
 =?us-ascii?Q?LPufedhLZnLTZ5Lu8B+w0TSq2YEhZQBIk5gkfmKNVsBbNVlmGlNXupFJWgL2?=
 =?us-ascii?Q?QT1wW/wavB0i5CSYxTY49tUelsZKxtJJ0smQ5zc+B+dONaAP7liEoK6i8KQv?=
 =?us-ascii?Q?7a28cFMddG9ueACZ+tK7wWFdTaShZ+fuHf5kv8JF/MPFm/KCEjtjOxP5jv2t?=
 =?us-ascii?Q?0+vUHF2axIIBnRB1ifiEJa/J28PHvKOTPMGNtZxC/IoaC9Uc3OuPYPwLnPxY?=
 =?us-ascii?Q?PRseVR3cN+xsreE1UDzciKn8vFiShQ0lGqYWnv33LVyXOqGaC7zzu3Xs1u01?=
 =?us-ascii?Q?xw6IaiB6aJBVisd2/xTOfHgHi0IxG88DPuJaK4YwhDdg+jPnagoyyP18GrZA?=
 =?us-ascii?Q?51ddTh3lqSn5llcUL22hsyVXwt9sfLC6aMJyUSSlTbRMhX/ooDmJ1BeoucnJ?=
 =?us-ascii?Q?S4G0rEIZapnslJLY7QhfGzNXGgrpl4TgQR3CbbvQQOJPAl9jCzvamtWIRydx?=
 =?us-ascii?Q?mjyNGS0yxLby+SvJr47NZbKb5auebc6iyOJjpQHAyNiTlmfGL5dvyPJ93ovY?=
 =?us-ascii?Q?b9ftBBPG45Fc1x72jDJ6Fn/mjUAosJ57/P3UTU4Et2scs1EsOc4jlKegpZBj?=
 =?us-ascii?Q?aYLIZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ea97d3-b860-4d43-c860-08dac69ec45f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 00:17:22.7621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AmOlFaFFXAFbJ49vJsalfqvXT/Z+UEXPbAwD/QPxfOcYME81xBojl9kG0mE5pk6/9JM2Y3XwgD3W6yplCIYbS8HlNyq3Pu64zba5jiEO8/rFa6SUW74o//nHj2KLIs0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10877
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, November 15, 2022 12:29 AM
>=20
> The RSwitch2 and EtherTSN-IF clocks were accidentally mixed up.
> While at it, rename them to better match the documentation.
>=20
> Fixes: a3b4137a4d4023e6 ("clk: renesas: r8a779f0: Add Ethernet Switch clo=
cks")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!
I checked the latest internal datasheet, and then target module name of
the MSTPCR15 bit 6 was renamed again...

 Before: EtherTSN-IF
 After : Ethernet SERDES

# I believe that the latest datasheet will be released in near the future..=
.

So...

> ---
> Noticed while reviewing the DTS counterpart.
> Compile-tested only.
>=20
> To be queued in renesas-clk for v6.2.
> ---
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesa=
s/r8a779f0-cpg-mssr.c
> index 800fdc104edd657f..f03d616cc36da6e2 100644
> --- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
> @@ -163,8 +163,8 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] =
__initconst =3D {
>  	DEF_MOD("cmt3",		913,	R8A779F0_CLK_R),
>  	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
>  	DEF_MOD("tsc",		919,	R8A779F0_CLK_CL16M),
> -	DEF_MOD("tsn",		1505,	R8A779F0_CLK_S0D2_HSC),
> -	DEF_MOD("rsw",		1506,	R8A779F0_CLK_RSW2),
> +	DEF_MOD("rswitch2",	1505,	R8A779F0_CLK_RSW2),
> +	DEF_MOD("ethertsn-if",	1506,	R8A779F0_CLK_S0D2_HSC),

this should be "ether-serdes" or somethings like that, I think.

Anyway, I tested this patch on my environment, and it works correctly.

So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

# I'll send my Reviewed-by after the target name was changed.

Best regards,
Yoshihiro Shimoda

>  	DEF_MOD("ufs",		1514,	R8A779F0_CLK_S0D4_HSC),
>  };
>=20
> --
> 2.25.1

