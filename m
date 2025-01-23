Return-Path: <linux-renesas-soc+bounces-12374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9EA1A108
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF3C93A4FD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467F620B807;
	Thu, 23 Jan 2025 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YQRXNyYq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A506222301
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625564; cv=fail; b=mWik4p8JD2NrFo7Qmx87RfLr4LyMAsiYDTfgMxjJQduSqwuvp0+akUFpdQXiMg3N4yJmSmSUbteQTtMl05UYyggLOSSmsSaj8YwLFRrKNQDPkNHDmh075cmAr1qEac3jskB91X9UGjd6UvJpsXGqgcjtRhUKnDdbZa8moocCuos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625564; c=relaxed/simple;
	bh=LHx7RJNPYRs5m5eoS/u0I0OjLgvJutZxWVPTFqVy9MY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p98B2xloq7y2+phsSCeEyI/cTSSvr5r1mseH5HYbsXEei5W9YbO8LMf1tJsoTXVoJfcobSx7kg90oPuXtZhyo5ZVFx+3i6TIg9T/czXj9MG7XDBx5B1DYVVp9zMOHc9Yas1IJmVlkPwfufmSdLc/39snrgDt0irH9cwUbvJwwc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YQRXNyYq; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBpiitdz5eJkzU3dM7Xoxo+mEvW6D0yl/7ZLsRIy1YuG8ZqgRz8WGwj2iQr5hmFsXebGsOXoJFUkUnndRlPK5DfdAicaoG9fY4AcD39mznafLQPzHQbsyfOQYuAlKnRqWuKwolVODrXYfvsw582EMrfqWuMMgC7HFIu/wl0WHrxTsM832izZ3I572H748nQlYCyd12RPLQngJvBznegUMgwAGlXvQQ5gk2kypQBCdZ7p+r5FEGX9ism8bdj7myc2vTzhDEZXma5D5sApc6lEYGypYCNMhPGMVe8op1gY8kHbDgXhX5f1KiS53lHfYRUuTN0lML7hgrs7+hJ+QHGSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqZPMtMSTsxAl4f1qLfQPzbb2oIRezwjs1T+TB90rNU=;
 b=P1egpJVfs1LASy0dOXDJu1nX5xNbK091gejaPGunEhbNep6HtBMpbSPRfYIA4TvsFNZ4Sr0aba+XlW2H7EboA+4aWVbEybJtMpDZPQTJj9h77H+dXx6V0sVxdBKi1RMEMAvEY659mOVmhOB2bnVUSDPWtRYNYB/fzjqEfDdwG3DSvfhIw7LGI1jvt1VnnaUKtpizsctHCk8pSg9dznqYFhpXLw8oKD7SDKCtJpvDSEQ7ThVCvEtJWOvYj4o0jhrggO4EIAkN31nnsTbwY/w99GymZ7gg6Vy5+SbdjL7Ayo1WgEYO3H5qRadvXM3NWiF6T9IO1NjODV8k1cPZA67dWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqZPMtMSTsxAl4f1qLfQPzbb2oIRezwjs1T+TB90rNU=;
 b=YQRXNyYqAl/0oMaDpJmffSyGQJ+6zcVS4tPbfgDMYA8C282G9GQjExvESDKrJXcJccMiWTSvP0A7GywqCstGYe9ddvgP9fon4so0ELUCbTL4v9TrLXW7QS/MF0d5cAyiPZBNf/HbctVuDaw7lncdyWjko7Yi453qv4DRGES8iKQ=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB13964.jpnprd01.prod.outlook.com (2603:1096:405:21e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 09:45:59 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 09:45:59 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 10/11] irqchip/renesas-rzv2h: Add RZ/G3E support
Thread-Topic: [PATCH 10/11] irqchip/renesas-rzv2h: Add RZ/G3E support
Thread-Index: AQHbayBjpT2dKBGvaESBsWH8vky+C7MkINoQ
Date: Thu, 23 Jan 2025 09:45:58 +0000
Message-ID:
 <TYCPR01MB120932EA1C1EE325210629082C2E02@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-11-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB13964:EE_
x-ms-office365-filtering-correlation-id: 10216807-5161-4272-83d3-08dd3b92bdb2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZZdsLZuK4n+VST322zeI/XKovn+cqLLFd9rv/x3xB14dv8tAlK5HXVgvsHZ6?=
 =?us-ascii?Q?wMig1yNlEmbYE/mqQMroIoHBp0lQVhbUfqMyJVF4GCAjjlCb2lydFPyYaV6f?=
 =?us-ascii?Q?gal0l2+IyMMBiJfuryPju8O+aHIv87ZtsePqTXv++JdAcgf30K+mGrHdI9yC?=
 =?us-ascii?Q?YSDDWcxlMuCcayp0XxH7pMoP/Ot90aK5+PaAqfl+7GEKNGI0toirVlUWw1Uo?=
 =?us-ascii?Q?dsv6mTKXdVylCXVL9zOfdDLgwngY6iMxgdGk/lqH50NjES5ZKWqHpmHWEzX/?=
 =?us-ascii?Q?mV7BAwsCTNROuRg+WCg7Wx7gD1Rwqu85QG4+aS607FAUJkU1ybHt7RB8+kXS?=
 =?us-ascii?Q?BfyPhfoq0LVJQvMew8+CuazooBK4kIpXUbkWYoyf7NyWNT0CFY4iX0cvT70x?=
 =?us-ascii?Q?jogiB8hEfa6Tx5hlrEFmrIuNZGLgEkQ0fmRg+E/58FoN4lWWqmLEL5y6lSyS?=
 =?us-ascii?Q?QuYFweb7WoiiLkXnKrFVOLzACYtaLw5+0gmHp9Pp+IHPYkxoomvdD1geVGt3?=
 =?us-ascii?Q?zOgdyiIcxLjUq0MIaqcg6iBf4ikzyjMkJKEt34NOyzA49j9DxnVnkyFVHWgY?=
 =?us-ascii?Q?wxnOHvUMIu0w/poJzWWbyYof8ICFhxKRimdxHNLiKRnGq6dvJ7J1eXXCkqiU?=
 =?us-ascii?Q?i3JNQcfH01EhK1+3VFPe/CxYBsAYlrZlKgGEMQcOzGnmMUvbYrIlbqyLforx?=
 =?us-ascii?Q?6oIL6kySMJgayB7DMWMu7iYrVm/rxcvg6PTl8RUKttl9Uywvw/8sNbKFMUQV?=
 =?us-ascii?Q?o8Q51SFHYd3u3s6YTwP58jexiO/1c5vtLEGMxS9MWRtFQIaw+ZmIUjpgLpIw?=
 =?us-ascii?Q?h+VrZhCSPDqvcj+Jb1UJ9wFmGw8ItaHdDxM+v++eCC0FhJ5O1F01QmTcbDt2?=
 =?us-ascii?Q?RZkSyoq0FIodAD+nRXTC06eZfDG4rXZvTdhWfZQX9xfKUtFVyfPY3eKiy2nk?=
 =?us-ascii?Q?VZysQ9QbPTGKenFvB4aNN1YwYixn3N22q5ODn3k8h9r0WRAAOflKpY5YOW5z?=
 =?us-ascii?Q?6sQDJrqZG11c2dI1AuNQQ7ccmDIsrEAWHH0A2id0ry9qGt+fjuCQRGYM9ht+?=
 =?us-ascii?Q?Jp8NdNEpWMvX0A9sJB/KXM0z0vh/xGiLZe4uY8EGQYphxWFJwqvc1HjHk8TR?=
 =?us-ascii?Q?gizqYcJhm22D+/BTtifKVk+gNWndM0XQ1hf43sWddhSSvtjQnngYdMC7BJ8V?=
 =?us-ascii?Q?cm7mLclL2nYG+Z9p3OX3xLDXGVDfL4sB5cPP3iATZ5qheuguKyfqzTW9pFhW?=
 =?us-ascii?Q?auftfYa6EMdIq0gMcaG45w8ph50wqRooHXMMSRXAlqTgpLivyZW+DI5TBsUC?=
 =?us-ascii?Q?RiCa0tpMBbtCgdivn7rg0O/dAUqJ6jOxfs7krbXHkjhlcPJlBva31KMG/mI5?=
 =?us-ascii?Q?66H6BScLrYS8j9nSFwGaLGxxRSeem81jd58kw+QDRZ17jKx8U6B+6rBIAcil?=
 =?us-ascii?Q?856R3Cf1xDs2z8qNq1he8OXyUi06WkAq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?auZVkBRb6ILENNQcz2fnrE91ecl5rKlzCrX+3vtZH6Q3dOalkYqEClN48H8p?=
 =?us-ascii?Q?wVskSDn64roZecOdYKYuaO7466Y0D88QTxKAIuJtWP++sHnNwK1LG1fEfNK/?=
 =?us-ascii?Q?WNothSHMcjQLiVzjKVmuV7Estny7HBaFsAx6sKMnXYIv9dYXkl2oc+RYfxQu?=
 =?us-ascii?Q?Hccxb6sV/HtC+agStNm3mhlmLetjXwNszQ6JmlVRDqYae2KzF1ojW9nDPSd2?=
 =?us-ascii?Q?D+FeImOzxKIsdF/KJ2QIuwPlw1Q7C54uX4mb9IrOjMa7HvBg7cOf4RHGw9Ea?=
 =?us-ascii?Q?kXFkpiophiFtEX8e0HedDAqYneubSbUXr4A7VUVJUIZqVmEFmrajAfcIPPdX?=
 =?us-ascii?Q?qalZlrsM0MTcrXDqzgYzXIYvdZzgA2LfPMxS9VYyer4jGwBQ/nzf+HSthEmo?=
 =?us-ascii?Q?Aa4md8fg4VcVYaOQu8H3tg5vt527QryA7mtVhVLd6WVuuwXGPcRpF13Ghp6w?=
 =?us-ascii?Q?qnKg8FO61myc54JT2Zg+19CYfX47Oc0k97soljP5Y1r9v1i0Fkb7SiwMNKud?=
 =?us-ascii?Q?ltRmBAqrVj3Pg8Yhp+ZvXhJf9nnuE22Y1HdHNeaYic0oEGdX5zPvluAvwF4A?=
 =?us-ascii?Q?uT0/hxoKO+o2R5ekIOIhw0sp/NjdxxndUfDx2uauu9KcZ9deytr+mkDb7zV4?=
 =?us-ascii?Q?HI+61OnkA9HsWsh/jJMruBuzRGeYtSHqztfvfvFa/Zp7BMDtBfdff5L9C9uL?=
 =?us-ascii?Q?7p5joXhj8Fh26KvNU/+FD9kue4Jn9uX6KbOChUQR1Jccg3oVXean3eGv98CI?=
 =?us-ascii?Q?hirUgFPQFCYHQUU+yM8iaXUEe60jJTaiVU24tHX6ezGxyoYEfZbcXeRklVHW?=
 =?us-ascii?Q?+MClv3iJyR9hPYVfVsq95uo4GyLC81IA6uFk11yKJDmhIevZtCeerXkWFV/c?=
 =?us-ascii?Q?LvadUoX9qGRm6SpMrH0wwKU1rkBg2MgjWM2acBc+5Jb7kM1sQj0jluWxAKgV?=
 =?us-ascii?Q?FOKabqj9ELdNqD8fo7E/e0iWjADRA3eLdGcMe5jpI77G8Kx8GLMiBRqjBoRq?=
 =?us-ascii?Q?LyyO61Dj4zx/R8g55OZ2+GDYIw8ZZdllNeH/k+4aQpUCYF/hIluAv6vrVvfl?=
 =?us-ascii?Q?N4ssboY0aUyt09y2L1wjUvqO3PsN4O/wEvAaA3bg8oP0D28IJN7TQvCHwTxz?=
 =?us-ascii?Q?b4tHQE6qXqksZxkJ6vogI/TDy11T3H1UoD6AeXSjs3dYJPbTsjdb47qq5u0X?=
 =?us-ascii?Q?BGgp10py0Y5MA8sDz40o4SZ5r6gTS75m6M/bUIVBz7UzZ3scSMwxVXx/YvdY?=
 =?us-ascii?Q?lXUewmBCXntFfQQBZUXbGpWMMSfOYfTTK5thc9HZVDouH6pmdfWmdXCmQiE7?=
 =?us-ascii?Q?LDXmcswuF9cloy8nDBPKuvS7FB5HTOzRV6UgCtitVu5n6jAW2ajX1nSlU/2s?=
 =?us-ascii?Q?KS8cgoBlgrrL++1zLVVm3Td3ERZcB43WvALOas+KvB6qt9Bp/FjWomv1rob2?=
 =?us-ascii?Q?Uwy1iM72iwVCJASoqYlsd0ImKKNOYj5Bkxze36nkFTgC5Vqm9d8uG5yoIL5t?=
 =?us-ascii?Q?PHGOhd30c+XZV2Mym/7XBBsHmqvi5aJ59RO9DcPt/VbDmHa1o9VPfCn3GN4K?=
 =?us-ascii?Q?Wv79ciYYQJbCuLDpQfbrDqcGLKoHoqWimkmWbztzUaHH3G9fL0NdkEQWQDko?=
 =?us-ascii?Q?3g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10216807-5161-4272-83d3-08dd3b92bdb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:45:58.9997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kGsoDQfHRa7cE8YKg6Ee5mVojxBokZPQlDL4NfKCcgwyiaWZ6m2jLnP985fcM9cbn/cn2aJewkIM58VAZHC/DaDGHV552eZqoTSuvSxA8RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13964

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 10/11] irqchip/renesas-rzv2h: Add RZ/G3E support
>=20
> The ICU block on the RZ/G3E SoC is almost identical to the one found on
> the RZ/V2H SoC, with the following differences:
>  - The TINT register offset starts at 0x830 instead of 0x30.
>  - The number of GPIO interrupts for TINT selection is 141 instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 15 instead of 8
>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
>=20
> Add support for the RZ/G3E driver by filling the rzv2h_hw_info table and
> adding LUT for mapping between pin index and TINT selection index.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 47 +++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index a1ca34d33c93..a0d79b357379 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -75,6 +75,7 @@
>=20
>  /**
>   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware inf=
o structure.
> + * @tssel_lut: TINT lookup table
>   * @t_offs: TINT offset
>   * @tien: TIEN mask
>   * @tssel_mask: TSSEL mask
> @@ -83,6 +84,7 @@
>   * @tssr_k: TSSR index k
>   */
>  struct rzv2h_hw_info {
> +	const u8 *tssel_lut;
>  	u16 t_offs;
>  	u16 tien;
>  	u16 tssel_mask;
> @@ -306,6 +308,9 @@ static int rzv2h_tint_set_type(struct irq_data *d, un=
signed int type)
>  	if (tint > priv->info->max_tssel)
>  		return -EINVAL;
>=20
> +	if (priv->info->tssel_lut)
> +		tint =3D priv->info->tssel_lut[tint & 0xff];
> +
>  	hwirq =3D irqd_to_hwirq(d);
>  	tint_nr =3D hwirq - ICU_TINT_START;
>=20
> @@ -514,6 +519,42 @@ static int rzv2h_icu_init_common(struct device_node =
*node, struct device_node *p
>  	return ret;
>  }
>=20
> +/* Mapping based on port index on Table 4.2-6 and TSSEL bits on Table 4.=
6-4 */
> +static const u8 rzg3e_tssel_lut[] =3D {
> +	81, 82, 83, 84, 85, 86, 87, 88,		/* P00-P07 */
> +	89, 90, 91, 92, 93, 94, 95, 96,		/* P10-P17 */
> +	111, 112,				/* P20-P21 */
> +	97, 98, 99, 100, 101, 102, 103, 104,	/* P30-P37 */
> +	105, 106, 107, 108, 109, 110,		/* P40-P45 */
> +	113, 114, 115, 116, 117, 118, 119,	/* P50-P56 */
> +	120, 121, 122, 123, 124, 125, 126,	/* P60-P66 */
> +	127, 128, 129, 130, 131, 132, 133, 134,	/* P70-P77 */
> +	135, 136, 137, 138, 139, 140,		/* P80-P85 */
> +	43, 44, 45, 46, 47, 48, 49, 50,		/* PA0-PA7 */
> +	51, 52, 53, 54, 55, 56, 57, 58,		/* PB0-PB7 */
> +	59, 60,	61,				/* PC0-PC2 */
> +	62, 63, 64, 65, 66, 67, 68, 69,		/* PD0-PD7 */
> +	70, 71, 72, 73, 74, 75, 76, 77,		/* PE0-PE7 */
> +	78, 79, 80,				/* PF0-PF2 */
> +	25, 26, 27, 28, 29, 30, 31, 32,		/* PG0-PG7 */
> +	33, 34, 35, 36, 37, 38,			/* PH0-PH5 */
> +	4, 5, 6, 7, 8,				/* PJ0-PJ4 */
> +	39, 40, 41, 42,				/* PK0-PK3 */
> +	9, 10, 11, 12, 21, 22, 23, 24,		/* PL0-PL7 */
> +	13, 14, 15, 16, 17, 18, 19, 20,		/* PM0-PM7 */
> +	0, 1, 2, 3				/* PS0-PS3 */
> +};
> +
> +static const struct rzv2h_hw_info rzg3e_hw_params =3D {
> +	.tssel_lut =3D rzg3e_tssel_lut,
> +	.t_offs =3D 0x800,
> +	.max_tssel =3D 0x8c,
> +	.tien =3D BIT(15),
> +	.tssel_mask =3D GENMASK(7, 0),
> +	.tssel_shift =3D 16,
> +	.tssr_k =3D 2,
> +};
> +
>  static const struct rzv2h_hw_info rzv2h_hw_params =3D {
>  	.t_offs =3D 0,
>  	.max_tssel =3D 0x55,
> @@ -523,12 +564,18 @@ static const struct rzv2h_hw_info rzv2h_hw_params =
=3D {
>  	.tssr_k =3D 4,
>  };
>=20
> +static int rzg3e_icu_init(struct device_node *node, struct device_node *=
parent)
> +{
> +	return rzv2h_icu_init_common(node, parent, &rzg3e_hw_params);
> +}
> +
>  static int rzv2h_icu_init(struct device_node *node, struct device_node *=
parent)
>  {
>  	return rzv2h_icu_init_common(node, parent, &rzv2h_hw_params);
>  }
>=20
>  IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
> +IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_init)
>  IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_init)
>  IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
>  MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
> --
> 2.43.0
>=20


