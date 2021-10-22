Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267AC437A89
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Oct 2021 18:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbhJVQEN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Oct 2021 12:04:13 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:13801
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231796AbhJVQEN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 12:04:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyWXWuXHLTyk7Fb0NuVUacOyKZToueMks6wlp8AieSh3PD1d33q0vtaTNLsNVGfnngPEpldWp/sn0nRQliXRMQdWPO8idwdgA0DmpnBpQr6Kfcf7B8y+ptaE4d/bY4nnwImCAli3ow2hUpBxo3KIDcYbU95HwsaOu11pP2quvEL1XvfmuuMcbR5mqfdvaXMRPKhuj+qHUBmBCX5Fu2CkQ4NTbIowXVHEOinQE+Uyq95o51/UjnTW0Y8JP26aNA1zRdP7oMWJzDIZptnFXi/atvGEiozUj7BDt7ejYG/eI87fAzbQR41GEzfvjWTn8juzoqdR/gu9HL+Fo82CTvC0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id+vHhSzPFfTdbyKonXydrm+yxOwtzEFvuDWFyTl+08=;
 b=LQ2FkkfXZ7cVOO1xhd2DGorVbEU2r/8erYRtSPgoPuU8d8zpasx/5aE/NRVtbR94derjFBvP5ldeF3+2WFDwCRqD8Buzgnzt7LCuQJzw4LagE51LNrIiwMU1PLCilp+yeNqUMuy9tcVIq4U8Kp3MXhlRkMen5aoNBEnFISMY/X0HA92nm2SI8Xif1aRk+zy0ZogEfRScuriepWvlowl7+26xRuywqRUCgtM9H1+MfoYfVJRvH0OtT6rjz135oFiLEqqDJ7HhKLVi9hgRqktOw1fVhKCPmli8Z244ZYHWDE3kyAt7tywFe8JomweovTOBzTXaaKEhSZWuV8athXSxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id+vHhSzPFfTdbyKonXydrm+yxOwtzEFvuDWFyTl+08=;
 b=T6nDX4Q1NschT3iVjbK3bfc8p4aTEPwhKF1vjPBg2GGwVz7UiBrIQ6/fsFUkJof3Ax9yaM0CrruqKaz1RZ/RpQfhudkT3O0cDRgGY52lQFraiVwaDY/ZqXck1WdGfYN8lbRjt2V68h9P6ymeZaxt1B3HlqvYiDKcjUaPp4FElkw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4694.jpnprd01.prod.outlook.com (2603:1096:604:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 16:01:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 16:01:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Thread-Topic: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Thread-Index: AQHXutXdv6ZsGiNewUOReWqD4pnIGavfGfWAgAArXcA=
Date:   Fri, 22 Oct 2021 16:01:51 +0000
Message-ID: <OS0PR01MB5922DC39B54A0B8D7AA8B3DC86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
 <YXK7AfUYxuFWl3rl@ninjato>
In-Reply-To: <YXK7AfUYxuFWl3rl@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a619965d-3d7b-42e0-214f-08d995754332
x-ms-traffictypediagnostic: OSBPR01MB4694:
x-microsoft-antispam-prvs: <OSBPR01MB4694F92720F9259C75EA0FD686809@OSBPR01MB4694.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8/TCu9WPo8vWXLVIx5lqwJihqs9/LH9bTaLGO/XnsFKm/AUcwil5WsL/LKKxPm777FllDgeUWxdDmyyc3xRy9TpzrgRbtrsfl0FCBWcXZaPkFmfRs90wdqGDT+C57wFhVVKypofAN1+IA7PrecpMND1IPCGQjIHZD93dadqYjOVpRUUONCJPupv1UgFhpoCRlUQxA3xzn4tB9QRf3j63eEjX0LzFpfkm7pZ/FhLFbUHgZHenkErgz2x4+1AkW+4hQR2/63Ubn/faVEau1UKTbmBG9bY0jf2xsDUAjcxhZxEOhpIcK7sSm5v439MecGVZ8JgMfZGBO3SVN1xqjZ7weYodN5b5robHfo6e2DDNvhpW4PBXh3fgR/Lhw3nKLtOKKGcBq/M/jQxhUnZXXcZ7Ffb7+oUVSfXmBeeXDsZr6taC0f7yxGM8kObx0pHmkrZYwWSjD43UI+HBr1yvTjPomF4b6rjDPT4BrrgvnAwMNXANIfUV5Oe+yg1/iXIDEyK1+nskws1Q4gb2gQmFqvtaB3F6/Xb2eMRvRXqn2WvdIq+F6Jb+Lgx9omZv9Ku9BuD39F+eh7TUs4hwXAn/UqwktvSmil3mFHYkXJgpyOR1735wwi3oGCLCUzCHDj5+/uk6PRDLoObhMj8dQ1R7+3yHjRqFIbCANH4moycALSJA/x90fJn0uwIZ6+TrpK5TEGAkUdZcLWtQYqdL26eiV5IQMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2906002)(7696005)(33656002)(38070700005)(66946007)(83380400001)(26005)(6506007)(508600001)(66446008)(64756008)(8936002)(54906003)(86362001)(9686003)(55016002)(4326008)(52536014)(316002)(66476007)(71200400001)(66556008)(122000001)(38100700002)(5660300002)(8676002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cnST/mslnN782x/rvLxsVqc419ajA6+RfMVPIO8e2dE4V7NC3XrUV4FIRgDg?=
 =?us-ascii?Q?1B7IlSwWyxv+N1STdIwCZCi0c8M0Mi7mx0EL07NRS+gUbC4SlusTnbuxaCyZ?=
 =?us-ascii?Q?sYbYc+xZNuAp1GeTzqgZbEjkaljRnD82zQQBuSfxs6hfhFJ+I/ZLFCja+/fI?=
 =?us-ascii?Q?XYD6wzHbdQTbx/+ZDBnB2ker2NOg+Bx2NdBIabdbZMBK5Xd3kwXcoCObZqK5?=
 =?us-ascii?Q?D8s0BH80JvEHvridwQ7yAdHG/A8HWSYI8pqGrcboSXd0cr1JtL82jfi4Dzk6?=
 =?us-ascii?Q?rV7DWi2rT073mSI8uxVdO0okdaA4ZL6C0Y61qmfT6k8u9lLj+FaKL9Qbf6jJ?=
 =?us-ascii?Q?yD9LsTE/SeKtPA8SlADQ8jX0aa7WwvjtGCMcqgyucO/B+0kOwMRn7LhQL1D8?=
 =?us-ascii?Q?SAnRr5nK+3mzQWA3RMqnWNOAvr609y4x6Qn+aDbbb68l3LWZea2UHbCSHcz1?=
 =?us-ascii?Q?C+zxTNT1HjlO5s0svctjKArouaPc6XH8eTWCU/kz6DXCFlAK0H1ZnIiCji+h?=
 =?us-ascii?Q?2SLaZrcaCBk1Esw2svnYouBBjbMGtRWuT05cKLAuFEGH0Lis7bwxwd1qQPM/?=
 =?us-ascii?Q?rUBxs6KW8riv9GkbAXU7b3e3bXKnjQWe9MC3PFe77q/r6lqotLiOPCnOa4E0?=
 =?us-ascii?Q?ra3c7GJ/u/rkLIAfek1az7ZNNT6Ac+S0YhyyttHxoKW/KHBzrIAe5tCvM9TX?=
 =?us-ascii?Q?RCoxqLlk5utqLln2+Y9pH3aBsd/rrojieuD9Q6Ep0pj7rF4ZUbCssLn0kN4t?=
 =?us-ascii?Q?2LcP27Qw+iEO3Tx+LbRyiXJywsoApocc1lyId+/T19yFRG6xKINiwAqwprrJ?=
 =?us-ascii?Q?EVdAFQp6N1odjW1W9Z9K+E0comP58iwTZUutQsx5DvcECdPQVPIWbt87YtSl?=
 =?us-ascii?Q?ibPo5cQEnn8TdiIJiT9lpRK+TkPN+Hx8MLl+b0Z/UJH6XfX5+Pp6CUm42zUM?=
 =?us-ascii?Q?z/CU1jKrLex64Mk5cFX8rZ9OJqRd4e3x7zc7slSWMI/FCe6JMjPgQ2jYAVLp?=
 =?us-ascii?Q?AtQ6wxRh2sDF6klUH1twgZKxA8dUTtyOMUdAT/3P37uaM/FyhwlcwGLERBkP?=
 =?us-ascii?Q?+sMCxFgBAa8J8JSho5G4Y+UUSVNMequtv3xrnMDfk8FwsrgwVFS0r+JCgHJ/?=
 =?us-ascii?Q?Cmazil4sbhG3VOhdWupQwE1AnPXOA4ErrS9LXCIxR7xhK46OPU1haYhz7Xd3?=
 =?us-ascii?Q?Y1+nJf3hBMNZP6xYRhrYIpqOAj4ExVytNDgKFKi97NBtp10B/O+XUbXKLt9Y?=
 =?us-ascii?Q?DmUs5oCY3gZlSu/EpdrpmVjJNL2XKs8Fm4WogZjy5iWQb+x0F+XYTwGVoAow?=
 =?us-ascii?Q?aEIXyE2gCaqceVVeRjo+6lFExngENeFYIIGkhu/Xw0RCCK3X93Qd2z+eg0bL?=
 =?us-ascii?Q?4BwVLQ6D+E+CAlF2M+vNPOLi1o8NDbX0eFtQk222jlTsnKBqAjAmWq0QlkQ2?=
 =?us-ascii?Q?fBURFjH3XWNwzCu5o6MhuBne8aXVwVIa?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a619965d-3d7b-42e0-214f-08d995754332
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 16:01:51.9064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das.jz@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4694
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with har=
d
> reset
>=20
> On Wed, Oct 06, 2021 at 06:16:05PM +0100, Biju Das wrote:
> >
> > This patch fixes internal cd irq miss after hard reset by enabling
> > internal card insertion/removal interrupts.
> >
> > Fixes: b4d86f37eacb ("mmc: renesas_sdhi: do hard reset if possible")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> IIUC, the following should be the apropriate fix. Can you please test it?
> If it works, then I'll make a proper patch out of it.

I have tested and it doesn't work. This addresses issue from tmio_mmc_reset=
 call
from tmio_mmc_core.

But  tmio_mmc_reset is called from multiple places in renesas sdhi core dri=
ver.=20
I guess that could be the reason this patch didn't work.

Regards,
Biju

>=20
> diff --git a/drivers/mmc/host/tmio_mmc_core.c
> b/drivers/mmc/host/tmio_mmc_core.c
> index 7dfc26f48c18..9416245a7b56 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -195,6 +195,10 @@ static void tmio_mmc_reset(struct tmio_mmc_host
> *host)
>  	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host-
> >sdcard_irq_mask_all);
>  	host->sdcard_irq_mask =3D host->sdcard_irq_mask_all;
>=20
> +	if (host->native_hotplug)
> +		tmio_mmc_enable_mmc_irqs(host,
> +				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> +
>  	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
>=20
>  	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) { @@ -1185,10 +1189,6 @@
> int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>  	_host->set_clock(_host, 0);
>  	tmio_mmc_reset(_host);
>=20
> -	if (_host->native_hotplug)
> -		tmio_mmc_enable_mmc_irqs(_host,
> -				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
> -
>  	spin_lock_init(&_host->lock);
>  	mutex_init(&_host->ios_lock);
>=20

