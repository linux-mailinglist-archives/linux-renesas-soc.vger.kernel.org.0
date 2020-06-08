Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD311F12E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 08:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgFHGfW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 02:35:22 -0400
Received: from mail-eopbgr1310128.outbound.protection.outlook.com ([40.107.131.128]:52452
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728022AbgFHGfW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 02:35:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXaEjuaiK3RHPExt5M6mEOZe+u3RSAcIEh/ufzSmnHoM4ed5MkfjSI93YLlErVf3/dHEiovg7YNzeaM8r6UQkdzmrMwfg2/KBP2FWua+LuMARAQw6ZSeXR5IMXVfMWKpftdTylr7fYA0mfYBHQnUHl3YHRx7WRAGGKK8bKJdBrWqDDhK6qsVLPnJy6A9rwQB/zmCfvUrDeRA23SczOOzil9tQbt5hA1td0ES00jBc3c8ibFhs2tepSlCVswD3nqWe9c6D6ELXwALlHwzUdx0tsa3XBevki0ZVfx1dQlyNRC8c1AFBAiT19hgIOJFfD5nTExvA8j6CMDK2ZE6zE3+Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/gZB6rX3hTKNyb3CNSO4JYVHX78KDTuGNRsJtRoyDQ=;
 b=QMzkhMM+lUCvgZuRn6Xk72fkUwMo4X9TezmHR0tmvKeleeDEQ/BLNtXzAz6Ib1V1/CSaswTbmiylleZRuFCUYj1bwH0amHK/wexm5iaTVNsM2jgN3D0UiuhjD2mQg2etYe5HiGathUfJQq4gxvSFuhewPqy6rD0WHeeAOATDr5wY3U/Ori8/uPVz2ZLuFI93PwMpaAg1anDF4GfiohEUkQsXLRsv/tgyknRkZd0V0CZXQZ+z8YYzQyJPeEXSMFuesO21W0u9bulF0M+fjHZbe4k004uVBzWy7D3HwGcPeSx4V/rmcp3PWI3G/VemoorhQ0SZRacjfbThQo17YWktpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/gZB6rX3hTKNyb3CNSO4JYVHX78KDTuGNRsJtRoyDQ=;
 b=YR18g4u0+ORn1BiXL/NRCBaXIWXqDQXXgFQjRtpiVNuQilEVZSen7/jgHn9ruQbX0+4qPTpMZIDodHFOxvBoctQ9z9BofLnX7uqYTahilYN6KTWq4u53nf40kPc2pQzF9m8iIOcrlEka3zWSGxypxznvrHYhLMxnJpMJUwOldOM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3100.jpnprd01.prod.outlook.com (2603:1096:404:7b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Mon, 8 Jun
 2020 06:35:16 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 06:35:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Thread-Index: AQHWOmI34Rq2naXnyEWINhVI/t25BKjORxnQ
Date:   Mon, 8 Jun 2020 06:35:16 +0000
Message-ID: <TY2PR01MB36923A1D7091431CE3F73195D8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
 <20200604112040.22144-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200604112040.22144-3-wsa+renesas@sang-engineering.com>
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
x-ms-office365-filtering-correlation-id: 14f1f746-c697-4d5d-fdba-08d80b761b60
x-ms-traffictypediagnostic: TY2PR01MB3100:
x-microsoft-antispam-prvs: <TY2PR01MB31007A37D513BF6C94A0216AD8850@TY2PR01MB3100.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QdVa+XXzWSJGAGBVZ6uxBVboqm1tdIDabKd1QLbTPjL1tunbglf77fcYNJtc9HsBvWEacKGJqoz2H3Sfi3R8VVWQdjTwWi9OiMyWuJqsDjtHL+IWVuNgVlMwxdCFDnb4hFEPnR1N+ZaHKHRlKWwBAfWGcgqSQ59lI+b0RuiDz6ShfBU8+zXa4rLGO0YdqWVOCqVWUTicBK6a7rBHIyBmCfzqemfZwa/gMOpVcaAvbqk/U2YwwPMK+I86/VPSyMDDI5IU20KHJlZYIBMUYGcha8YbZxnmTQtrHcdiQnjB5VDoV5G0Z5R2HFABY2kYVECwuHM+kmFxyzlm0xkLuHOVPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(55016002)(7696005)(9686003)(86362001)(55236004)(6506007)(186003)(5660300002)(83380400001)(2906002)(4326008)(26005)(71200400001)(110136005)(66446008)(478600001)(66476007)(66946007)(76116006)(66556008)(33656002)(64756008)(316002)(52536014)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: gmvh8JixcHqn7ko/XtX+UzSmCFfBrzgty1dIx6QcGKV78bc8m9Tb/LeYzpcpF4YmJEYejkLj0LfahN98ePUm1c1ddX2uY/tXUoUBsBVlWNnV//t76TrTygYu0u2YmRUtd6AKYleciP0QcYfZRcmYAuzxcVTUyiItWyxHl26oPVu2tjmAPs93P3AuTLmXDxack5+iBD4rfnhXKbh5z0SpgT74rgb6DPx6NyUXk8afFvCmP5j8naNeDGXUumv1Ys6muoIoaaC/Szyic7u/vU924JoEALzFzpaUyVAbo49AoYcIO5MtfXSUI6W1owthd8fHt4MxgYxrp2C5MVUHnWXI84FxbPapbFn93D2kWCr9clvZIxt5LRxPI0sX2OdPzwCN0KOJk2A+M5MmGWMt9IX+10xbOlUqXz2VGyjuKTdzw4j4JEh0Lzod1kRG/8wM9yrV726/G0kO68VLzvVCzJg1UdK2AlVIi6404CyEi2v6SphCYaqWq28eYBSOvAaEoj1c
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f1f746-c697-4d5d-fdba-08d80b761b60
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 06:35:16.5003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YbJWkZwdP4+3dUtOqbBpqt2W1humQHuzfp4trgpp1ob1LH2pw58jtuxjGIX6dsoK2tGU0a7Gn59zJ1FeS9zJ4FxdDC9GOWW9APbpJkAuhItKuu4WNhxe1Jig5UWCrMk8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3100
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Thursday, June 4, 2020 8:21 PM
>=20
> Tuning procedure switches to lower frequencies but that will turn the
> SCC off and accessing its register then will hang. So, flag when we are
> tuning and keep the current setup of the external clock if we are doing
> so. Note that we still switch to the lower frequency because of the
> internal divider. We just make sure to not modify the external clock.
> This patch depends on a MMC core patch calling the downgrade function
> earlier.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/host/renesas_sdhi.h      |  1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 25 ++++++++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h
> index 14c64caefc64..58a8c9133ba4 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -59,6 +59,7 @@ struct renesas_sdhi {
>  	u32 scc_tappos;
>  	u32 scc_tappos_hs400;
>  	bool doing_tune;
> +	bool keep_scc_freq;
>=20
>  	/* Tuning values: 1 for success, 0 for failure */
>  	DECLARE_BITMAP(taps, BITS_PER_LONG);
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 15e21894bd44..589a59fb70eb 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -117,8 +117,12 @@ static unsigned int renesas_sdhi_clk_update(struct t=
mio_mmc_host *host,
>  	unsigned int freq, diff, best_freq =3D 0, diff_min =3D ~0;
>  	int i;
>=20
> -	/* tested only on R-Car Gen2+ currently; may work for others */
> -	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
> +	/*
> +	 * We simply return the current rate if a) we are not on a R-Car Gen2+
> +	 * SoC (may work for others, but untested) or b) if the SCC needs its
> +	 * clock during tuning, so we don't change the external clock setup.
> +	 */
> +	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) || priv->keep_scc_freq)
>  		return clk_get_rate(priv->clk);
>=20
>  	/*
> @@ -323,6 +327,9 @@ static void renesas_sdhi_hs400_complete(struct mmc_ho=
st *mmc)
>  	u32 bad_taps =3D priv->quirks ? priv->quirks->hs400_bad_taps : 0;
>  	bool use_4tap =3D priv->quirks && priv->quirks->hs400_4taps;
>=20
> +	/* Tuning done, no special handling for SCC clock needed anymore */
> +	priv->keep_scc_freq =3D false;
> +

Setting keep_scc_freq to false is only here. But, I'm thinking
we should set it in some error paths like below somehow too:
 - error paths before hs400_complete() in mmc_select_hs400().
 - error path of mmc_execute_tuning() in mmc_retune().

Best regards,
Yoshihiro Shimoda

