Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA844AFE9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 21:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiBIUiQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Feb 2022 15:38:16 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbiBIUiP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 15:38:15 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A4DE00ED48;
        Wed,  9 Feb 2022 12:38:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZNrd0+Dr1EuHpggWudyD0eA6OMJIu5NWsLrgAPqbGsgWnUMzuX2BCOygQaJOGHiXpQ3+84kTsqsaXRqBPYxVUoN08dPK/cF5+y+1Ejr0Nz6CddIqdTW50wFGeZaSnzOQxV8XIea0U1YltvNIX7cbDInkGKG/eQ20P5rZ+8i2tPQvGTtQkwgHnkH5/W1yvFzfOgw3reC6fI5W4aOAs7iZym/Mud0IzU2wc5PpwIo+ryoderq2gZY5apyF9A1ZaZpfn0wKb7JatboXt0xzUNYeDikYj5dRg/RDRI6FaoZEat/weWd3J2mqFeyJRo95pHTTtPcaUir0rcpwf8KpLXJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeHK1TdM+jrRf1CWVRl7Fl4L3ovzqYbSovHzWWRFUUw=;
 b=RlIrINKC8eHVqneOFmfnf+7FvmbDzD0iAAyHU308BppExsgTCwrperqxe7wUEcCqmSveJiEzq/4ZBy3aOQASWEnbPMHw7CwhueVB+trA0k6fMRp/lHH1PkSmFceunQkXhDkCNR70CkjUKdkmWjwNjwI3TWMlHsNboFQsW9oBFlfSZuofGsyyRz/cYY01U6QEyTq1p3QI49UAftJebxRGMXKHPiWZOJyuB+QdHYGsFZ+xFgCDDQNu2FhshvX6pRW2IPK2vPblmeFyjmbvv6pU5tu8ZriGOMiMKwrOesSHoSNx4hwgxxjfz691y7m7MlWZ/yqJdvzr1Gl6CWNyS/Cn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeHK1TdM+jrRf1CWVRl7Fl4L3ovzqYbSovHzWWRFUUw=;
 b=CV6YIxKPGdoylEMvCPEuVJQqZEnKRfBEDaxGAyWxKY1R65TA8Uj92GVhb/rFwptC0tSVMIqnHs9rumthGZ1vsqDi3G/8KNZkMhd+HJNZoGXauCdoxr1i2tIM+XFWAzSN1r5eff2In43QxTAxM9R179vQZuONkQq+5CnkUPhPKrI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5458.jpnprd01.prod.outlook.com (2603:1096:604:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 20:38:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 20:38:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: rzg2l-cpg: Add id to struct rzg2l_reset
Thread-Topic: [PATCH] clk: renesas: rzg2l-cpg: Add id to struct rzg2l_reset
Thread-Index: AQHYHdmlWPbddFa8ukuO7LGb6gJY66yLrULw
Date:   Wed, 9 Feb 2022 20:38:13 +0000
Message-ID: <OS0PR01MB5922C06657E4565EF973F4A1862E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220209172236.21151-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220209172236.21151-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 895431e5-3fd3-470b-0b2f-08d9ec0c17da
x-ms-traffictypediagnostic: OS0PR01MB5458:EE_
x-microsoft-antispam-prvs: <OS0PR01MB5458C3682A82F4F601748AA6862E9@OS0PR01MB5458.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pqLd3BieOrk3341b89IsUU+XhLjOsLsAO0vaL2uH5KLNYL69xue16SJmFgSYCBwiFHjvKkuJvHMzmsjAuCLkHi27jSZVCcq+j917nHWbbU+/g8og8ft9F+D1h43UvqRfaYYG+WHuMJi4Q1AzO1L7T9AeGHos1fSuZ0wMklzvMOiXC7iyXtx5jxNqFeAzq3dAcfgSLSgT/hdY/GLcNZv3RvssLrBovuZBZIrk93ZiXjBCIQfiIoTnxtvd6tVy5igjJt5zndgz8MgsDfRZnICVW1DOCha39klZfq7sgmN7GknEYcT6Xdzk5V43d0E1TMfhX2g7tGa7pgfa/Ca5MkpfeDcGoYZLr/HP4yiwee/gUx3ddjmZACftXWahmXJkfK4rCTx3itjkTN3H9sQ6AFQnhPLolgRzRePlLqis1N8Ffe/XCSKz/kNtmoNDOccT6z93w1koVQzbvxYYO+JEsq3E6Moktt9TALYyenQHWs4QZQZs1CsGcvWiENvM51nhZ5UJVPtuWPKaE+7/n9PTJu9mBwI1/H3FLEJ3eixx+9jzCifgH7ZdNVHMbuFz0VPJ1ak360z+idBHBhFwx/AYgn6/YgYH/0/8wXEYqmWldaGHn30ymxmjxSAFaAkRTpEHetIFWmCk1Q/P8TqkP2dNNfDB1nFnzOfY0cY4ymnN7vR4tIR6TALWJ94poeVp3zAj7Eq+ZYw8MxTTN6UBS4cyZToi5UM99zlMMMrLOOT6QHN/5JkK6dLBgGphO6UDo6VF6FhxNlFkWVXwc4RbCveNINuxFx1ALHapUTwKbhif3A63USA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66476007)(71200400001)(5660300002)(52536014)(122000001)(110136005)(316002)(54906003)(107886003)(38070700005)(66556008)(33656002)(66946007)(76116006)(8676002)(66446008)(64756008)(6506007)(7696005)(2906002)(8936002)(9686003)(55016003)(38100700002)(86362001)(508600001)(83380400001)(966005)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5QPPErAVIw/nr7fu6FhYH9ShZNzlYmFyxOAB4P9Vc4Rn1QHLNmwen18Aga91?=
 =?us-ascii?Q?ZwP0zzcQEBSkZzuYCBG239kiMDyGMrv3pEhO5Dtu/adOT7RQ0Ttt3v7bcL4L?=
 =?us-ascii?Q?TrlVaUytGmUa15Ejp8nkoqad5nhM2xgscvhyViRIhTOJWQzXuQA202AzBkBF?=
 =?us-ascii?Q?a3uw6rW0mAAIaVcxWj48gvYwyvGHMZfZiUs1Sb2gdjOX/rtjZvL0ItIfBZ1p?=
 =?us-ascii?Q?exbc9iqQfgmeRIeS6Dx6frbaLxnduudUGiblyJCV9iM6dP8zlM2tpgK6D3aU?=
 =?us-ascii?Q?JD+OGcLe7ffVRQZMc+hjKdP7673iS9ihgyGFiKJGPiELwX0q5hCElvwarydF?=
 =?us-ascii?Q?FgN9MOvfJrK+n46G+rCpL5DjNcOA1X6/XolZ5GtcFJFsxPmilwawxkyKvF2t?=
 =?us-ascii?Q?BSapwy2IV2aMjhU1Y/XbalCGcfob/ifQ8Ep+1ibF/7tLiE9eJQNlIqqRT22j?=
 =?us-ascii?Q?efpXItxAjcbzqO+vxB2yXdSI0RjtuNZW8WiJIYbVS7qTAILxngzqLGsyOJPu?=
 =?us-ascii?Q?nH057MBbKNkCs4Wvc3HGsoFepdOe2cm4R62rH0iIrYd1LvXKQ+98w1mVtnUP?=
 =?us-ascii?Q?Lxb1C4TjvfS51b6mv9vcGKYt7k56bCq/we7QTFcPHyJtWcveV/dz+w5RRD3B?=
 =?us-ascii?Q?PwiTuxB94AWzyu4cKX4bi79HEa8nV7iiSg915b0UuZsRPLG+pM0u1v8/9CuO?=
 =?us-ascii?Q?qLTM4KlseSmi3D6DWMc2dSIH/e2ThxmXyKNqGugEyoLuhVIjZ8nlLsvVqH3T?=
 =?us-ascii?Q?emiyYkVL8kK9XYWHR3Njqlb85MzaYQclFJ8q/aSbSVU9aiRZKGPE9HNNqLQD?=
 =?us-ascii?Q?Ip8/oqjnUw3WdyeF/SIOtPA1g0EUSz1Z1qBSN0eilgPFWufwv3Kvw+mF8Ueg?=
 =?us-ascii?Q?OolhUrm+18X+5WtIdnV6kWgSXJj9LXZOoVMQwb42HD7dY9yf5fyaOGstpyza?=
 =?us-ascii?Q?FwECMCZrxX3ICUenYmSQvVSK2MNMMfUxUXcOxAGJL2dLJhCp77ZvZvFBjpcz?=
 =?us-ascii?Q?SFi+MyshRtZliWjXERn8BZWMdEwzYVNCIVeWQ+uJ5E2Fv2V6fBfPraM9vtVl?=
 =?us-ascii?Q?pSzZnfiTOOJyWOBWD50oc9dSiHOXTOfOHk/MHQ6iOoAqiMkOtw+LvNoGwGr0?=
 =?us-ascii?Q?2NA/mnpl4HlT4xpt4jdVXSXnduPnrFiv9aJJyf379EHH3En7t4LYWr3ric+/?=
 =?us-ascii?Q?cHzzGY0ThwJcs6tqgQvDwyNJQgwe5E/YqyAV52C9heJL1DPNgXz7M8F3s8mF?=
 =?us-ascii?Q?g2das8g9HFTqPEmfduP1Hhl5pMgL0SGPLRD/RhBLaNxJHTcPCmUeo0QXDhX9?=
 =?us-ascii?Q?fIno+62hzj9XdFrHSts1tTzI6QOZTB/yw+/oLqiNpL8hMA1NiMwl4aLCf4u5?=
 =?us-ascii?Q?BeNWqlZA7EZcg8rZLHNIyQVxK1m3Jek+Tuh8uMKhhtJFXQqh9E9NNNgS/1vn?=
 =?us-ascii?Q?zcS2xzkQ5aKZiXYM065sbez62z+Zm6fRDrzj0SPn+n4QJy7/M3QxBJsLXv7e?=
 =?us-ascii?Q?NpZ8EwhTkVJxZkQ3VS6DDBCzGu6utGOeDK6dV9uBlstU8YUsEOfSUUK3b3FI?=
 =?us-ascii?Q?UN7+pMme+V3953JfYFICbbqo8IMHhIYaRDe0wn+QpXOiTAOWUBAaYodzF9wd?=
 =?us-ascii?Q?i6+r5Ow9CtGLXJYyMrrmrXrwafLTPCAkumM6H2eU8Dh8X7c+pHfehWSWn9ik?=
 =?us-ascii?Q?YvRVsA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895431e5-3fd3-470b-0b2f-08d9ec0c17da
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 20:38:13.2782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6BqLupVqzhVAW8EZGMIXRFEoQeZgx6Mecu7QhtHvkMq1vQa9T98H+MgjyBnNE+Mlwi7Mndsp0Kc89HvNnvLV3wafFE9DXQ1CenLgVs7Ed3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5458
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

I would like to drop this patch, as I posted another patch using shared arr=
ay
for resets[1].

[1] https://lore.kernel.org/linux-renesas-soc/20220209203411.22332-1-biju.d=
as.jz@bp.renesas.com/T/#u

Regards,
Biju

> Subject: [PATCH] clk: renesas: rzg2l-cpg: Add id to struct rzg2l_reset
>=20
> We now have the reset ID split between common and additional entries.
> But the index is hidden inside the DEF_RST macro and this can create
> compilation issue when we add a reset ID on the additional entry array.
>=20
> This patch adds id to struct rzg2l_reset, so that we can lookup an ID
> entry in the reset table instead of just using the ID as the index.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 17 +++++++++++++----
> drivers/clk/renesas/rzg2l-cpg.h |  7 +++++--
>  2 files changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-
> cpg.c index 8c0a6252c984..adb3353a419d 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -760,13 +760,22 @@ static int rzg2l_cpg_reset_xlate(struct
> reset_controller_dev *rcdev,
>  	struct rzg2l_cpg_priv *priv =3D rcdev_to_priv(rcdev);
>  	const struct rzg2l_cpg_info *info =3D priv->info;
>  	unsigned int id =3D reset_spec->args[0];
> +	unsigned int i;
> +
> +	if (id >=3D rcdev->nr_resets)
> +		goto err;
>=20
> -	if (id >=3D rcdev->nr_resets || !info->resets[id].off) {
> -		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
> -		return -EINVAL;
> +	for (i =3D 0; i < rcdev->nr_resets; i++) {
> +		if (info->resets[i].id =3D=3D id)
> +			break;
>  	}
>=20
> -	return id;
> +	if (info->resets[i].off)
> +		return i;
> +
> +err:
> +	dev_err(rcdev->dev, "Invalid reset index %u\n", id);
> +	return -EINVAL;
>  }
>=20
>  static int rzg2l_cpg_reset_controller_register(struct rzg2l_cpg_priv
> *priv) diff --git a/drivers/clk/renesas/rzg2l-cpg.h
> b/drivers/clk/renesas/rzg2l-cpg.h index 92c88f42ca7f..fe2bcf9cce5d 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -150,16 +150,19 @@ struct rzg2l_mod_clk {
>   *
>   * @off: register offset
>   * @bit: reset bit
> + * @id: reset index
>   */
>  struct rzg2l_reset {
>  	u16 off;
>  	u8 bit;
> +	u8 id;
>  };
>=20
>  #define DEF_RST(_id, _off, _bit)	\
> -	[_id] =3D { \
> +	{ \
>  		.off =3D (_off), \
> -		.bit =3D (_bit) \
> +		.bit =3D (_bit), \
> +		.id =3D (_id) \
>  	}
>=20
>  /**
> --
> 2.17.1

