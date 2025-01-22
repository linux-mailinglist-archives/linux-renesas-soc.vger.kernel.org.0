Return-Path: <linux-renesas-soc+bounces-12320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ACAA18F9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 11:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79B8E1887C8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEE820F970;
	Wed, 22 Jan 2025 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wazpoet2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD74145FE0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jan 2025 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737541459; cv=fail; b=dUUCpx/VBN+4btaRxEth+qlFi89bxlCA68KhEasFAXH6rhJabBcB9mqxRBIs3Dwfrjch2yoDfYgmh2Yew4PqoVR61FcHo+Vj4WoqqYjcueIDn4jBnq8BLw3UNzRJD7qgeoALUQawuXEx92Aqy6nlPfsFTaeEMpjC3vjcKHqNdBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737541459; c=relaxed/simple;
	bh=edY8O//ZrEjKfxynsjvxf9/amkJN3gcWZVVh0pOCpXM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r4EKrACW1jnMGRuEDts38+0MD+2BJIktK0vj9T2g7F/6i7rp7s/FspoWGTR9lOa5ZFlS9jHOOhy4/sK7drN+t51vVSKX5efMl2EJijzQXuqvA5ckDp8A/z50t/xnULSvBGGOXPDmKrpOfgKhX/imXlwvq6Tzl/tM603rJXlzjy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wazpoet2; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8ssQ5dBnWMFvzNTdnxz4mOpnLRZAghCRNbk4JBNXbJ3KJeG127RJXL4Wmy4bP9/84e94DEIQS4daWD0bcubXzwn9D6cRIz1p+fafDQ62fuxMhVOTmvBgWyGdezu6siqDka98S5uO1+4AUcb0tqPmQKaZHoeM7vQwgaGug66DeymDvfNl4IQtNi35OC8spdcpBrX5V7WunPvM9XcWmbWaw1sz6dtuQQ3XwoHz0GPhqLax06mjoFClh8p8AUROTdGr6qtgpJq3reybp87670jsJcC6GZZOXBs0Y3BYLCN5E7r6Y/wB1/p3G1k10r7CMDhrwGNq59QPs/pnsaCIFsUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INM8rsW/1h3ViuRhurNLk7W1BrVH+kdjePreGdRlB48=;
 b=p28ihQ7LrCea/C8abyvH5DCtHZl4vZPdH+B1kcADePv/aCQAHGok3UIReUoNtnQfImkNWeAMEa7+vWvGHQXYBBWgfaX6ncHREwjenW8VODu5je9L0i5jRCt91lcNcsaExcUbYTT7xKn4W7/KH16N43iE9Sg+CazkXSqRFUB66SPkQeK+7DqDO30B1rUzdlKzZYUjFw+Gr6KsWNhSWDvCjtYNsff3WvCcGbAIo7PXlABHzy7tVMFAwJ0ecphtn2Cs1lkFQhHCJWEAt+WNMZjUAceZ+NCnSTOh5Nu516Qo7nzXEtF7SdoEQVNjaiPt89LuAcIqYaI6KFZxekchDDNwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INM8rsW/1h3ViuRhurNLk7W1BrVH+kdjePreGdRlB48=;
 b=Wazpoet2fJjqizcN8mfzcsL+A87nymP5Oro1Au6q41VI3IoXJkIa7bZU4t+faWO/p5nm1SsTx6m1lH4G/rN2rB9p65z6TzzKsSVZouIgREpyvEwvINErQKNJNdtNnlluqPQSsszKkNKDr01WqNb2fgWePZq4+2DIYu+FvSfvMKE=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYCPR01MB6899.jpnprd01.prod.outlook.com (2603:1096:400:b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 10:24:13 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 10:24:13 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 03/11] irqchip/renesas-rzv2h: Drop irqchip from struct
 rzv2h_icu_priv
Thread-Topic: [PATCH 03/11] irqchip/renesas-rzv2h: Drop irqchip from struct
 rzv2h_icu_priv
Thread-Index: AQHbayBgC6TdlYAgCky/jcCRHw9AzLMimTIQ
Date: Wed, 22 Jan 2025 10:24:13 +0000
Message-ID:
 <TYCPR01MB1209355424192E574559A8F7CC2E12@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYCPR01MB6899:EE_
x-ms-office365-filtering-correlation-id: 096fbb30-0918-4247-cfa1-08dd3aceeb07
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?C2+d59jC/vBsjCh8lPu4lZMS4nPzFduPlKz6tEyY+vbaGQ9fP21CPymIo0Dm?=
 =?us-ascii?Q?qkkH+2CtFzoqBCm2LaelPiX78CzeyFvUgPaJItt17FGpnlpqcLGsNNdXnldS?=
 =?us-ascii?Q?/5Fd29mGw2BvjSw3DJlI/oLzjBeD6pZXHTdbIfmmLP76O+pRpl7rye/DLSQr?=
 =?us-ascii?Q?Qc8vyNwx7iZLq74tHXMsDvvNZat0QbJsgekkztEFsvOz4DvtaN5b8dxPok1o?=
 =?us-ascii?Q?chHwU5HcsRf92wqTsg39bPrbp0QUiSqAVUqlTsTkHo01N2xUCyKxH7+NY+dR?=
 =?us-ascii?Q?A18b0Hru3l9VwUbpYgMyr4f9/L9t7zt82+x8Q+sI+k8FtAlcxGdkdt2klMFs?=
 =?us-ascii?Q?oKgu4HXbwKsnkLOgVP7cBBUURb3wx9panaZDhfTqV1d/AYBEkXkrmO8m/E5W?=
 =?us-ascii?Q?HNqDU4RL/Fm5awAsEV3RNtbas6HaaAMVHk10hT7MUuL1+byXse92Jnybh/nm?=
 =?us-ascii?Q?XWs6Ou7AB0/mHmAU1JR2MbrLy5nJWKApG48xc+kuNIAxl1EgUWZpKunmzP9p?=
 =?us-ascii?Q?ffPhiDUBDrHdwuHmLG9UB7ZrjeoF+tZwwfUKvXoir09EfW7ije/Ai41Z4h32?=
 =?us-ascii?Q?i6FEC+M76+mvo0lAzavK+2OgxZaY3Qktk2TY4RPFGB3oj1Tpjmau40fpZWYK?=
 =?us-ascii?Q?hgSokrxFlaRqRS3jEG8FGKZb1NOpdDcNBXMIzB/earHJ3BpTvbfWDLLVFN0B?=
 =?us-ascii?Q?lJmp+ND7luIPkmU2vkmBIfBLkrAfzP7p+MA85/0f7cMf9B/Uj1E26c+aGLfs?=
 =?us-ascii?Q?AJQpVR5SYodPKOcFLkHuUgOWSLu3mhszb+J/4bGGyEV3vDxu3koFvGQM1cyG?=
 =?us-ascii?Q?eeNiK4kUO0nGQutZTnJYzYYv1rRCF7F24s/JXUQJVVg/0tLIc0EUEOa4Ol4T?=
 =?us-ascii?Q?Df/GfIjx9nwb2qHir2JgrPEH1EjxkY6TBX6XGlQnneek1zFJcGs+tUuwJ7KS?=
 =?us-ascii?Q?rZWBF+cmM+Fhg2r0iDBehzs8s1ihKvWZO/i9rcmnus0+dXPZR1ou2YhbHfLc?=
 =?us-ascii?Q?wrtBRfwP0Ro3oY8tZNTdkPfPBen8/pwmxi6GrxkWHOeMwDrJSvu8r/NjLX9k?=
 =?us-ascii?Q?u4Uxhm58eG3SmFW9S9ktsul5BHOON66HJgz3x/Tkx7pNLD+V8Z0i6j2SCCqB?=
 =?us-ascii?Q?cfaw9l/WbF6y105zuyW7AV21aN+SJCsGZKiOqYfQJBcSXGLvf9piKi0cz59f?=
 =?us-ascii?Q?qWHA8ZlL9lvmGOo4PXg0WHH9a9IZgOhOh2a4kssBTYc3MF/EOebuRK+Os8L9?=
 =?us-ascii?Q?BErj0Nn1IzYqS3UVGABP+jg0I3MlSeFe6Y0KrOR4Jb1yGP2P299uy/3xUB2j?=
 =?us-ascii?Q?pJIKTxBRfjd1GyiFIBeQ+tb4Of+jePbJ+cLN/hjsBU+4ExtFULQV3Lk0/Ju8?=
 =?us-ascii?Q?2CMXXRdOGMGwrqb7BX341N/W5lBU9y2ImzLkTNCYT3uwLqYsErb9Rh7xoL5q?=
 =?us-ascii?Q?hqfLMdRIekN1bE2kx/dpRl+yhwHIA0P9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GIk5gEnSvUWwxKzWaPhgy3CjHHCBlPAss1UXCxt/pK2UC3mrMhkEWIGUqpfL?=
 =?us-ascii?Q?swJ3zirpdFZ071/c4Pw6zh6KhVtFrivj4LWLHsjj2jhHLP++BvNYdfQN6gXc?=
 =?us-ascii?Q?Pwyi7FOgk64a4EZd84XW+BfhuX96dVj1zSeDfhk9oIzRuF3iGajXnrO8crjy?=
 =?us-ascii?Q?AYG1i2m+eg0dqPAPFbtO77LXRRoIlE1EqGtlzehAVQ8dKb1F0On+Uf1Obnav?=
 =?us-ascii?Q?31S1tFbY6tAQAryjGKJYAzoGou9Juous6Q93KH5TFRriCnWZDQIirnZiJBbA?=
 =?us-ascii?Q?x9g1EF9pOyjUV0SOpGuaVnDeVYUfK4YVDF9t3+wv53NO3uUlCTpk7CGta5ps?=
 =?us-ascii?Q?MLDa+5+90WFnJACb7lJKusSKKZ2EGOdk4kAyu2ag+8jfzS87piLjzvV9phRy?=
 =?us-ascii?Q?SBKZlcZfI0pcCHR45SfWT9uQrjjibwO9UJvzdT7icYxlTa62HihoaEa8yIbX?=
 =?us-ascii?Q?7moQY4i78qlmwKUcHoRru2m7hUwLVZ5732IzxW579gGeF5Xz/ngxtvW/nDzw?=
 =?us-ascii?Q?FVA5AOi/wGSM0sTydXERqodsVxO8/xakme95soX09CB5k2lQSXb9wcyIaZnK?=
 =?us-ascii?Q?tYzLiMrVCAk6tqXOxNWkx1xX+Qko9ucAR8bsMJ7b9OhIu6SeXdiO79vEKz8K?=
 =?us-ascii?Q?4GT+t/gW0Lb/HQ7jxTb/WvLu/svRC8hbVebYU/UVY0jS71kpu+gtbSyCtmPO?=
 =?us-ascii?Q?LYooIc6H7oQDzoZxmpos+87N6J7P5ALpD+k2SqbPM5TK8rUnZaRuKiZsl/Ew?=
 =?us-ascii?Q?oV4ivqyO7U/LC25N0RB4JygvorqYiedkKz6vJ4iWLgaiQyA9utxhdw+/vlgq?=
 =?us-ascii?Q?h8i8zBxvZK6+Lt/NXwJwCs6D6aivcIFYKNGZtOCzMkwxUM/iJRbn3a3OQupf?=
 =?us-ascii?Q?EI/plyr2bH2P6KzD4GIpyiZfJOHLqR5Oz7YdHX+h51wMmOIWjnINEw3hTB4i?=
 =?us-ascii?Q?LjvvPefTH0Ad4+fwhFIefnvHspy7bVTrNZdkIiNJdGrWgo1ZWsgB9kk1o765?=
 =?us-ascii?Q?4MY6wgNAmn+aa7WvhAntVYl935E2mwGvqIvH7+djJXZYfngJG9sH8rn1kqXI?=
 =?us-ascii?Q?9rapmItfwvFKogUwzVyFyvwjhn5+wtgjdf6wSK4+Pn8GdVEN1rYaqCw0inRg?=
 =?us-ascii?Q?c9EcAhZ9mBH/aXKvCorfFZrMu+/ZfxdoctzOdqKlcu3qRyGrzbpYTKYjvupi?=
 =?us-ascii?Q?Wnn1pJ5Z8oxctdujkT0hqFtQJGBmXG4OQ1Xx9LQG5NLqrwPlzZ4C4Hw+Rh1y?=
 =?us-ascii?Q?mU3xIcRByuFZ4Y0BFZOhIM+Yh0wZUaP5AQ6CY55FEl7AJRve/dlhDj6FCOGX?=
 =?us-ascii?Q?bxW7m4SvlenF1otzxsthrZDCkY/8BwTOl1yFJ2TSK9VS4FyAOHcEYr5aXs+k?=
 =?us-ascii?Q?G+i7mGk4LfC35q8wrJMApGaY8QKuklyAG8zCBgvyFKoTPf9Jo+DbHxArimXC?=
 =?us-ascii?Q?1N/ZsnRp8NirJCGW0Fn2Jg3Z6QwotXsK4t0EvuaadQIP3IJoUX2BmIN8Zzzr?=
 =?us-ascii?Q?LgvMk+lyWOwVE0Iio9VS1pUTlIHGioQdHZn/bK8Z8066as1hAF/lcxvl6kHc?=
 =?us-ascii?Q?D5jkS4pqQjICOJAGnqxCMfLH11dvJFL0bxIOFGOaQU410Xvsprb3PqlFZngP?=
 =?us-ascii?Q?sA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 096fbb30-0918-4247-cfa1-08dd3aceeb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 10:24:13.7232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4txCPlEDFN9WY/G4iuTHMRYkG0Q7mLqy9Zga8NYXWoZEEleKV+OF4oIpddi+qn83aUTgLBJ4HO55RijgwLrw9IDDnAo7oCiURnHsfHGdZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6899

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 03/11] irqchip/renesas-rzv2h: Drop irqchip from struct rz=
v2h_icu_priv
>=20
> Use rzv2h_icu_chip directly on irq_domain_set_hwirq_and_chip() and drop
> the global variable irqchip from struct rzv2h_icu_priv.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index fe2d29e91026..fd432b43506b 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -83,13 +83,11 @@
>  /**
>   * struct rzv2h_icu_priv - Interrupt Control Unit controller private dat=
a structure.
>   * @base:	Controller's base address
> - * @irqchip:	Pointer to struct irq_chip
>   * @fwspec:	IRQ firmware specific data
>   * @lock:	Lock to serialize access to hardware registers
>   */
>  struct rzv2h_icu_priv {
>  	void __iomem			*base;
> -	const struct irq_chip		*irqchip;
>  	struct irq_fwspec		fwspec[ICU_NUM_IRQ];
>  	raw_spinlock_t			lock;
>  };
> @@ -390,7 +388,7 @@ static int rzv2h_icu_alloc(struct irq_domain *domain,=
 unsigned int virq, unsigne
>  	if (hwirq > (ICU_NUM_IRQ - 1))
>  		return -EINVAL;
>=20
> -	ret =3D irq_domain_set_hwirq_and_chip(domain, virq, hwirq, priv->irqchi=
p,
> +	ret =3D irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &rzv2h_icu_c=
hip,
>  					    (void *)(uintptr_t)tint);
>  	if (ret)
>  		return ret;
> @@ -446,8 +444,6 @@ static int rzv2h_icu_init(struct device_node *node, s=
truct device_node *parent)
>  		goto put_dev;
>  	}
>=20
> -	rzv2h_icu_data->irqchip =3D &rzv2h_icu_chip;
> -
>  	rzv2h_icu_data->base =3D devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0=
, NULL);
>  	if (IS_ERR(rzv2h_icu_data->base)) {
>  		ret =3D PTR_ERR(rzv2h_icu_data->base);
> --
> 2.43.0
>=20


