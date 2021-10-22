Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4CC4377DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Oct 2021 15:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhJVN3O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Oct 2021 09:29:14 -0400
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:52614
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230264AbhJVN3N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 09:29:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AV8IvXr6TRtfEJrZvVK7kSdqvsAYtzIq4vd7EZ49wjbQ0nbuRU5h+KJof+aX06yurQnp3CSBkzFyMaPSDrYoGYWoA1gMF2352Iq3g801kDxzf/Y9hDsCzvlROBBqWgnu2pSXQKx0fdKyhHIbIwFcrRlvdBqnVs3w6fRiiiSbKUawybQPPGqk4+vKmxlCeI8ZMlyQlZQJjn/RDTESU8qsUzr7yUekVt4YpJp4oufNBQkBI317zUzRxZqsUc/PC9QFgwb0tfr3yWpTdtLaLdsAYcqtSnj7Hf9ru4E278BPe7wQNhSgiIIr5yj1r8aonRhbc1PDxasxdYh+PhtkZYCNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpD+gz+rGrhUmyC5TCs+WnKzIXo6zbvhkk8XNTvcYs0=;
 b=Mj+AjuvCfSTsGKTYlBmhSWiD4cM/z3zsY0jxjgoeuM0kAj/EFTod1q4IZ54VDbBint7RDTyLak2p73llVKVdILKB8/AUkX1a5a1qGUSf71mqB+TNxMxQeDTpl7/Ns3QCy55kp4rOcy3Ewn/Ugv+iD5je3FsXf1CLrWLIhj/XfjNbDfqC2AJV3NeneiduL/5B8t5nC/anisn2KJEdImOQRDZcKl4/fSXUra+MnFKFbcBFbeBqNm25VJjEUAndqsUTgZ1o8gT900p5gmcnQmPB/oxNA79tXxsT4HJgROJs/xcw64PkKaRRo7XKIBpTlpuwtUT6gEaT8jrNpdnv4gV5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpD+gz+rGrhUmyC5TCs+WnKzIXo6zbvhkk8XNTvcYs0=;
 b=MRj1jSYRS/UHEwjIvbI3qRBwYZcaDW812556LAqPso2GumgLJ80LYXsuHOpKl6+zn71TlUbVC3RQTtdxMGsRLmhWC8kNaydvbc+nRVPjR4GZCk4UMz0RBySBb36/NgvFyh1Azm0KP68AfKadJctOO0F+K1/Gk087tZKsH+fhQHM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1697.jpnprd01.prod.outlook.com (2603:1096:603:32::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Fri, 22 Oct
 2021 13:26:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 13:26:54 +0000
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
Thread-Index: AQHXutXdv6ZsGiNewUOReWqD4pnIGavfGfWAgAAA4cA=
Date:   Fri, 22 Oct 2021 13:26:54 +0000
Message-ID: <OS0PR01MB59225096C400E25A6DF6A29686809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: c5035817-826a-43e3-82ff-08d9955f9d48
x-ms-traffictypediagnostic: OSAPR01MB1697:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB1697555E1D3158BDDBAD589786809@OSAPR01MB1697.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kH0u26bXg8BbPOyIgFwuvsTJv80H2JF7h6BBrV+i+RLeP+MQZCaVPBIINcwZqEPvoffZmD9dQ1GPe21AELEbI0jY7bgN2PZM2hRXFyhmk6Sk0sRlYccIlplNL/kHjH6wXyaO7kNKDBLCPb9n3SIaHXFGNDlup3IbEtkErju8ayy5B1NqCh9P7L3Axmtp+vwvww6HNamo3VsCUx5uc5UyU5f3XYNi1bPG8eSan/b9p3oSxZXnfWAMt/dBZONs9bAyd4V9m9s+CsNlHrG09+rfz5M7F8i5MUC93zpKe8vf8Qs4544fNs+KW6LFs1ehMc5JMQBVvQd4qa7VR1im2hGjw6raqKEqwQfmMaueW1cQTLAa5CMGxePUKXXJWH+gYEEnuBLxWoBxPgQ5rTSJefwCAS399fg/cnitiS2NtObjYXXXyuxbiGp4XCA/Nzcav5ZH7hadeohlctk0o+NMqwjMyp4CY4aE71mv01gGhFAfdgkX/rop4W51RztS0eWwXXDOBOozYEnvWqZ3okwbGHvoUjF8RRAdhYycZ1ls/rgTg3tLHuZ47smVNiYgU0YSn9XBYiU2d5/I2uhAoaeF1W3H1FHaa34QR9yjzYJsT2FIMyIERzs99B+uft2qFgfBX7S8J6b7RgIV2juvGXPA9Hj0eRyI+kDe0jR7EQJ+ooijBtbBCYDZP+gusGMG8qUQh4rrZbOilHmw2AEx2qPFSK1bUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(54906003)(38100700002)(4326008)(66476007)(38070700005)(76116006)(66446008)(86362001)(2906002)(33656002)(9686003)(508600001)(83380400001)(66946007)(8676002)(6506007)(186003)(122000001)(52536014)(71200400001)(64756008)(8936002)(7696005)(5660300002)(316002)(26005)(53546011)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ckes3EtztzeD7lkhboPu+Cyrd+9Q8N/mhf3/XKCLryxK4eLjyNRZMilk6h9V?=
 =?us-ascii?Q?aS/iQpygpHajJ5Q4K6HNVHykzR5IwkJcUjch4Jr5zKvBUuh0q7V7Oksjckuu?=
 =?us-ascii?Q?hqKzuSnk6BPzB8eekaUyFtxpg8PL30KB5ZluK8gk6Mq3l9YN8HKtb+s0K99n?=
 =?us-ascii?Q?5ABt2QC4ZWrODzrV/HTUmFnEKPGnC7Y1f9D/PWPLvmEjx3xwqxJOVy0xRAB6?=
 =?us-ascii?Q?1/jOrOQEXx4saNpwtE+1zAZFaV2JuPaZcndxTDdq7uKqVNytaL3DRE4lmRNh?=
 =?us-ascii?Q?txUCKv0/3zoyV1V92/OBxCfXzgzxMunX2irjZznGeFYDiX3qxGxnH4RgGEoh?=
 =?us-ascii?Q?Ocg6pTMG7sHm92rSZ3b+3ZrvaK+BkLfFKTo5CC/7+bWlW3aK7af0lvLphohi?=
 =?us-ascii?Q?tiLfuCDHiL9KwCvY34q9T3wNX8kS3fEh2rzIIF4G8I51y0BRS7pkkvrDAa24?=
 =?us-ascii?Q?+/wRlDFUGOuQqUxhWKyzYtfBvqoSzGeBJz+WlA9XcH7lSl+xnVfjL+uBff6d?=
 =?us-ascii?Q?9JojzH1dNcT6XUokvndwAMG45AlCKXzcs3lefbTcbBOhuO5V0FMCIR3qfCCu?=
 =?us-ascii?Q?CDZ54DUg5ufqyn14YfDoMbQJJPcCsROFbM1CFemLhL7fYV0MkYcmAoY+fnhd?=
 =?us-ascii?Q?xmnptygVjq4gtmbWAyzehrXk989uc/BKCRdByBMrtY7C+3o56Oj7hd9qF836?=
 =?us-ascii?Q?tcYX68RVRKzYneg3/7DLiLGMy6RFGEqHuBejQ8NpB1PYEjD1iELtyw4pisIY?=
 =?us-ascii?Q?bm0Ra5cYDZyGQESZE5Xb+zb1OVrfn9NjhCSevPLzAiF36TJrrUNxqNK7GgHX?=
 =?us-ascii?Q?D0sYlGXaaBhC97IE6trZ+xs/bT7Za2cXOgb7gB7S4fXcN/ZDiOgaWLcTPyiE?=
 =?us-ascii?Q?KlnJbMb2HiZd6bMEDZOpo3U3RwEt+SOwYwhkd/gUois0ZEWVD+dI5oMH6x85?=
 =?us-ascii?Q?uNEn9+y8+Q7AO+NV8lUu0d493LvQaOHJ1GROwTCK/JVjokPJ6eru1NuABYcu?=
 =?us-ascii?Q?uer5Aj0R6n0GSYOz51tHDBKTMyNENYT2rVL5z7DiNR9k9Oe3wUwm8CkLsbIf?=
 =?us-ascii?Q?1bMuEk8FvqqmSmXocK1jQH+wKPTcxhmHEV5WoTm9YsUK/Vab693wVNi/IRja?=
 =?us-ascii?Q?8hTG3DDDnUq/Mv1puY/sw9kk6OBXcdqzL447hqa0QRdzc2BKNFMxCYk0L4M/?=
 =?us-ascii?Q?BjXl8KIFP4mbhxKWGnHGUT8cE4hhgIayGEMH/PsQZT1bxwGfTJ6ZYSceRQaY?=
 =?us-ascii?Q?XsqWQao2nE0FtqNCXj/Ek5SeHzh9+3exx6rOyMdDLmSwG4w4D3WLUZ13cuZK?=
 =?us-ascii?Q?NAElYzi32dfuwsFofYcjRHAK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5035817-826a-43e3-82ff-08d9955f9d48
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 13:26:54.1239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biju.das.jz@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1697
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the patch.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 22 October 2021 14:22
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; linux-mmc@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org
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

It is much better. I will test and let you know the results.

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

