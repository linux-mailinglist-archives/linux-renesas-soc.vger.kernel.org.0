Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701EC1B5971
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 12:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgDWKly (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 06:41:54 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:58944
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725863AbgDWKlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 06:41:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUtrNVW22uR5GtzzBJQ43EpLPlJUCZPqbpCdaTLgOpGs/vD42xYhvpW6ibnTckTvTho1IttWIqsX2CYiw2zWOCFIJ1gwfL82SJ3AL5AIpLRbVtxZ2BIZN6iK5wVNcS92UcF6qyBNSdSSEMQQU7pD/K2uMGB7Hi04r5YLzEdiPUAjXBxZm8Ct2OMgf+/gb9ZZjS530RktFPHTHttRbzN74UJFN9V7s6HYcoZAWUcBNoRNKpXi2p5yVXssgstxDpRvPfQd1atGnmQyp8luPh6XRcvbeuV7KnILD1dqPpFuxpqywm6pbHU+Et5HCAYGUafhcR/1bkJcstmWghBQyyXjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oSuASPbKxsef639Im18a3cojyIqOHVNbA0tTqsk8zM=;
 b=EPjphVOEBiIs8J1TZj7wm3kOTFMZJSbQanGlrtDTh3Cy0qxk6Xb7db/1EQBKVaVoljRoAwSUJMybhy9xSdplVgJm2gFLpqM0vVDqvuUr/Xz+gbSWik4rhbIqlwcxZdw8eFRhkjjR6tuhMO1unV3Ai5pqWn3oFaRdNATtxq1HfcRjOQcZKlZ4MnuBEQWDHH8IjEPZFZ2F75qgE/BotudV54lC10jgQTAisO9XyawY1yaG2+ePoFzGiEcQivdFZO12dVAHF5jT5MlflK6T4heVzfObEUYBqjaIMYjPlrgizyrW60wUlH4eLEFVZ7DSmIg2k+XgF+0G6S6prp9MvslqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oSuASPbKxsef639Im18a3cojyIqOHVNbA0tTqsk8zM=;
 b=oXYdBNUmb/L/a59wwgD9KTWYh8pOcPzFk4yNz2GoFDGij2mtl0EffAX50v2UH8FeBXVZMd+YmNdSkGxI8+mVqbtoMp/Akme+URIkdyWzsJpnXZPa3f0LvTQgNQMhRDz401howvFkWmDutybxw3COa5FyW3Sf4hlOmv1/+MKqBsg=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4605.jpnprd01.prod.outlook.com (20.179.173.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.26; Thu, 23 Apr 2020 10:41:50 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 10:41:50 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: avoid bad TAP in HS400
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: avoid bad TAP in HS400
Thread-Index: AQHWGKXZ5RvEk4kF+kKddrDTRj8xsaiGg09A
Date:   Thu, 23 Apr 2020 10:41:50 +0000
Message-ID: <TYAPR01MB45448C2024C50BF3FB6B7EF9D8D30@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20200422125914.16590-1-wsa+renesas@sang-engineering.com>
 <20200422125914.16590-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200422125914.16590-3-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ef112eb0-8c50-4326-efb3-08d7e772ee39
x-ms-traffictypediagnostic: TYAPR01MB4605:|TYAPR01MB4605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB46056C3D1E146C0597B696C1D8D30@TYAPR01MB4605.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(2906002)(52536014)(8676002)(110136005)(54906003)(316002)(76116006)(7696005)(55236004)(86362001)(66446008)(6506007)(53546011)(66556008)(66476007)(66946007)(64756008)(81156014)(26005)(478600001)(5660300002)(8936002)(71200400001)(33656002)(4326008)(9686003)(186003)(107886003)(55016002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fRhyoWXZuKFF6rdUZMPQE3LSxYQuUSFdCYzHr1GUpbYOTrawJe5+AmOb0VzBjAumANkQltOjIvuZ8+gK5hJmLxF2ESrazHRxNi7PdDZQISQDZFxWQGkzMz0kvEo/ow/j5onM23aXexVLy9/wsnHe7C6EXNjEji/Cu/WcS79SaGShnt6cfDJk5AK4BFvRstjZtnlqCHmU6GGHiw95ej7kSoVgmLD88xol7LXEz6jhRUyN2OVdbJl3WKM9dwZAu9SoYUNrMUJQ/kwc38AVF8nViJUjvJPLpOgaOJ8fSJdFl23N85GOAOyaR/OCOj7LhmEyemtTdaFE21wkYmpYH5Ttz7653ukUrCYGhtLlxu8qg1vCzHWXd74rEk2u8wUQnU84aOk0lPNbKsBlXbNBSsgocGxyOr8kFUUQJhwuUthKOIk9HAPtFKfnJc7xwvgEA/ki
x-ms-exchange-antispam-messagedata: wLB1EWGQT5aLBpTVFD+psIDQrDGoJHH+JVrWAFKLBg6+cxc2AeQSUbnBXefitD6Eu7FBfQ6jvh2KLmpF86KVXuIARk4YdXcmVc8f9q9RgokRlLYteRnu/ARLs91feVFSYLrEtetWwMKeZ8AxblqXHw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef112eb0-8c50-4326-efb3-08d7e772ee39
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 10:41:50.4257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbS+XrRJqaK3mIVwnfPqpYeJDi+F1+FubhR9Gl4W42FjEKTB6qvZ+0kVWrpMccwwNNNnBw3l97HEqQ53ZK/bXygyn5VFrGUsUcrgF85eu0zqNJpB7k72Psws3r5sBKQa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4605
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Wednesday, April 22, 2020 9:59 PM
> To: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Yoshihiro Shimoda <yoshihiro.shimo=
da.uh@renesas.com>; Takeshi Saito
> <takeshi.saito.xv@renesas.com>; Wolfram Sang <wsa+renesas@sang-engineerin=
g.com>
> Subject: [PATCH 2/2] mmc: renesas_sdhi: avoid bad TAP in HS400
>=20
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>=20
> With R-Car Gen3, CRC error occue at the following TAPs.
>=20
> H3, M3W 1.3, M3N... TAP=3D2,3,6,7
> M3W 3.0		... TAP=3D1,3,5,7
>=20
> (Note: for 4tap SoCs, the numbers get divided by 2)
>=20
> Do not use these TAPs in HS400, and also don't use auto correction but
> manual correction.
>=20
> We check for bad taps in two places:
>=20
> 1) After tuning HS400: Then, we select a neighbouring TAP. One of them
>    must be good, because there are never three bad taps in a row.
>    Retuning won't help because we just finished tuning.
>=20
> 2) After a manual correction request: Here, we can't switch to the
>    requested TAP. But we can retune (if the HS200 tuning was good)
>    because the environment might have changed since the last tuning.
>    If not, we stay on the same TAP.
>=20
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: refactored to match upstream driver, reworded commit msg]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/host/renesas_sdhi.h      |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 56 ++++++++++++++++++++++++----
>  2 files changed, 49 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h
> index 86efa9d5cd6d..14c64caefc64 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -36,6 +36,7 @@ struct renesas_sdhi_of_data {
>  struct renesas_sdhi_quirks {
>  	bool hs400_disabled;
>  	bool hs400_4taps;
> +	u32 hs400_bad_taps;
>  };
>=20
>  struct tmio_mmc_dma {
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 33b51105c788..4fee26e6b66c 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -325,6 +325,8 @@ static void renesas_sdhi_hs400_complete(struct mmc_ho=
st *mmc)
>  {
>  	struct tmio_mmc_host *host =3D mmc_priv(mmc);
>  	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	u32 bad_taps =3D priv->quirks ? priv->quirks->hs400_bad_taps : 0;
> +	bool use_4tap =3D priv->quirks && priv->quirks->hs400_4taps;
>=20
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>  		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
> @@ -352,10 +354,24 @@ static void renesas_sdhi_hs400_complete(struct mmc_=
host *mmc)
>  		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
>  		       0x4 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
>=20
> +	/* Avoid bad TAP */
> +	if (bad_taps & BIT(priv->tap_set)) {
> +		u32 new_tap =3D (priv->tap_set + 1) % priv->tap_num;
> +
> +		if (bad_taps & BIT(new_tap)) {
> +			new_tap =3D (priv->tap_set - 1) % priv->tap_num;
> +		}

I think we can remove the braces.
After removed it,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

