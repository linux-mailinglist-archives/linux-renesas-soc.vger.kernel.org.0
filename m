Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E312C25DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 13:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387617AbgKXMlm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 07:41:42 -0500
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:6122
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733091AbgKXMlm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 07:41:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/0x9f4PZoIdVrNaHRsUf8yAYYdYygurypxKdLK6yOZBshg/9YzdximWEtH2odD+RF6wKURwhdM+ArJooj2TkMNraxqA3MMvtarpdguEoZue3AaKkroPGlEIdPiduNI+JHKJuMshuvS5eP/rvKpLStaId8T2v9ZOfHy5UgEsVPDVOBY0avf76X9lA2p2NAJnZFMbwYXmBoZKfGTyGKfKmp2IPotSqH8lv+/ZHJTOzdulLoAkkd39VeJ7twEcciWVafRvAyXx9bVsqHpkE9tKVKSvZFyAZqEhMnb11NiSE7pxHLBlGqBmRHu7tChdoOqJxtX5nGYlMSLo3mzLnGkqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nid6ck3sK2T5KkFX9QvdC4Z6S5G7YvzXQIcOeDKFU5o=;
 b=i9sare4l0s5IR9XvK+KVP4X0+RbAYpOtj9e4eCG8eRHkUk1v0IxzcMKkJ+1nbL1rudo/ZSy84EW+bg2EJ4IpX6/IWKQ3fOVNq94t1fsKwHsb1RoLe9WLzA+wEhmqd/ZGzenmKARGhkyjzCFG9pduug51EFjljRLaujlXa0vDBi39Lfyz0xxsyv+2VdH3V+WwQ+xp3N5yysghuy18y+JtXi1mzoE7LLo83CaOwNKL9+T38pTHk9PGguHAIYYNtuUMDVBGlUIKa9jVp8qeUkwGyEjUjrrun8j0JRV2S06xivdTyRUJolNjnTejNlTlQ0JmZEWoqJ/3jG7g/0rvpRQtxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nid6ck3sK2T5KkFX9QvdC4Z6S5G7YvzXQIcOeDKFU5o=;
 b=dmqGm1ufcX4qszdEMdABimFic3Qb/MRJwe8HVNsyZjBWUnzdc/gFqmWRpmOgaOEzyksSn9brToWfmDdFxEaLE8JqLyoFR/6UWYxp4TNRapFMdX5AdxIafc6sy4j2OftnxchKs1KIX/Fj7om9Mr3mFHi9MXAFOhdXWphdacM5g7I=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5500.jpnprd01.prod.outlook.com (2603:1096:404:8037::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 12:41:39 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::59ed:a6ce:d8dc:90dd]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::59ed:a6ce:d8dc:90dd%6]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 12:41:38 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: [PATCH RFT v2 1/3] mmc: tmio: set max_busy_timeout
Thread-Topic: [PATCH RFT v2 1/3] mmc: tmio: set max_busy_timeout
Thread-Index: AQHWv07MtS/m3xnGX06pcnqVoot1xqnWvzvw
Date:   Tue, 24 Nov 2020 12:41:38 +0000
Message-ID: <TY2PR01MB36925B9010516CE67A9DBBA2D8FB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201120150647.123237-1-wsa+renesas@sang-engineering.com>
 <20201120150647.123237-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201120150647.123237-2-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 36162f67-3895-4350-33ce-08d89076499e
x-ms-traffictypediagnostic: TYAPR01MB5500:
x-microsoft-antispam-prvs: <TYAPR01MB5500AD416E8520F01977D4F5D8FB0@TYAPR01MB5500.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nCqnlFmcYJkj+NNi8GFWrLy7AyPhIluWpJH1t3GYTbFhOtO9Wklv4iRlPtT4/eKksnIeAAdmAS7+doMN8p5c7siPP/XuqQ3BuA0W52h/DlqRJ8gWRIweop+TsE+WMcxItl6D7L09FDXU1T8DF16mkVWFDge0qkb/54CI0DPLOI3icIuMyTkzVjGS73HCLL8j8Fsa2MU1UYZJIXQ79A/y/Le2xFBROFOSIY0E0fxoWVUwsl31JWIEyjedtBGxXtIhO71RPIzM/7TeVfXwvKS4/V+WK/EgrK9YdlMlDc3eh36UjceRuP4Dcvwc198wsQKog2GmXBa1teb0OVppk8H5eQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(66476007)(9686003)(2906002)(71200400001)(55236004)(26005)(478600001)(316002)(6506007)(7696005)(33656002)(54906003)(8936002)(110136005)(186003)(55016002)(4326008)(8676002)(66946007)(86362001)(66446008)(76116006)(66556008)(64756008)(52536014)(83380400001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: CdVVIWU2RC8vyfnUUsJw6J2+cPwyv9HuZJzLg96oiI3CUAlIZ0Dn/jguAGykEVbcglKXOTfe3v02jpSvqTDbnQE9ZYswtRM64b7iIzAqGPQk5vQlLXtquxIy5VESG+cRd9PrmWDvnRGvhiYjBH77a3iMmrtqfwxXB0aPDBEfeQXcjmpe135QBxm0ZCLwYbCcXUPoihFOwxJ3vTOvmNDKrx6HWQwnih1of5nJDeFbFWPulOINShJ5QCQMEh0Tj9olBNmoQXXTXX3lOPUxhs3rO9haspNqlwSv4bNi+jvMQMZxkP45qkpStn69rswqjlgTrTXDl84zDpFubGsv4Xb4MIR5I2Bly66v60Gaq/1HUFhfxoM6PmXOQWQl4y92Rdz3P6fSOjKYZbq/EaB8z0EbOKkQxDOcIFg81izA4mbeFWVs2x1QNfNOanh/vRs8rHOKtX3O1F813R98g38IEdywcTIQO6WVGUWaYwf9oY8SW6yz9NCZQ8CQSYf4BFxPF5VOVrEpHv7559w+PUfMSuSdzJxTaHjomfRTLpPe/Hr9HbsihmMbqdJBUClxURTLwagZhxg3i0VxzZJ+62zIczHbmJCdq2huNwlg74xBiWYRtrOi4lOoArdKNXIHo6K0JzoklzrVS/hefCiw4yHU3LOzYMJS8pZcZtMed7g6a9b1IhQobF5EnPpPNc1EIW4H/U+1dFWQ44XmgnG2smXotsdQl9RR2AIlIV9XS6KYIveb+e+58PtpLZS8HJ9NaCxkpzKDlBCaEK3V6MCZORwDsxDV3MU7Z6eZHloOHkSkQi25p/Pvngd+nJEyrhuny+Y1F9LfJVhaXFQCJNHYW1YC5MIwy1bHQ7ei44QFkKzw5TidWSkuGNl/gLzHLA7Y72edWlV/ff9Nx4qyDyV36F12OG9ClQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36162f67-3895-4350-33ce-08d89076499e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 12:41:38.7481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uw2DikbIrANWc7LJ+KxwZiK9bS0fVG9jvhvcMVSlmIzaiz0B3hdocxYzsyMA68u3DNs7qs5BhP51L4oY9i2WPeLvk3oCuLzT9a4/Bbz8i4p2fPGGJUvxxkJJRyNJkYkA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5500
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Saturday, November 21, 2020 12:07 AM
>=20
> Set max_busy_timeouts for variants known to support the TOPxx bits in
> the SD_OPTION register. The timeout mechanism was running in the
> background but not yet properly handled in the driver. So, let the MMC
> core know when to not use R1B to avoid unhandled timeouts.
>=20
> My datasheets for older variants (tmio_mmc.c) suggest that they support
> it, too. However, actual bit descriptions are lacking, so I chose an
> opt-in approach.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
<snip>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 7f4a28125010..4727fcfdf95f 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -887,6 +887,18 @@ static void tmio_mmc_set_bus_width(struct tmio_mmc_h=
ost *host,
>  	sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, reg);
>  }
>=20
> +static void tmio_mmc_max_busy_timeout(struct tmio_mmc_host *host)
> +{
> +	u16 val =3D sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
> +	unsigned int clk_rate =3D host->mmc->actual_clock ?: host->mmc->f_max;
> +	unsigned int cycles;
> +
> +	val =3D (val & CARD_OPT_TOP_MASK) >> CARD_OPT_TOP_SHIFT;
> +	cycles =3D 1 << (13  + val);

nit: we can remove double-spaces like (13 + val).

Best regards,
Yoshihiro Shimoda

