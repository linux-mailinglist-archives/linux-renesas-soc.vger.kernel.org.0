Return-Path: <linux-renesas-soc+bounces-21190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB85B40275
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C88033AD94F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 13:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DEA3019C0;
	Tue,  2 Sep 2025 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Mpe+2yPZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD23043CD;
	Tue,  2 Sep 2025 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818926; cv=fail; b=f98mAajFiKKpjHpwCbBPIgLgJ+rxwJi/C/u4siA7L2180LHOUjlv2ROgJmpkjJR6pmY+iBB+o2/O3qK8O1tRaxxerSCx9rMnrHC6kCCorv/t6PtklBejsE5myXCYoKrZN9cvfwry58eOp5l6hP/WA7jcKTEt6ThY9vNFcIcQGAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818926; c=relaxed/simple;
	bh=+WexAm3pxxrXEXcVLDETWMto4oTP7Al+mshjd1EMAVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a34F66X0bo96GOkJyv0eV/b2KNlAQTIraoExvMRH9ymewFPHqeCUheSBOJTI6Beq+HocnkilquhCle3HMyp2PYJctTCHN6ED9HHijSVmc0edVmVpRECIKWmphANZtjV8mJHu0fsxMecCMiWt00Rpx5unxp1MNvKtW05BoTV7kfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Mpe+2yPZ; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeQhP/bQrtRDD2qcH8EfTlLdB9CwO4uiNoFvpGQemmP/AOPsgiWkV3gONaZqw1Bmeu59W0XS/g9SdpZ8tBfcWAnvJIHQkR3dke0b/NcnwKgfYMUcQ7IbPwEzYVled2KCTzQjb/pp1U1RXpIOqVwGg7PesxvANTNF+7x5dHH+Pjcf4tdu17xGAhznuRBbxO/lNrb0c5cF1rWDIB3pkQTbURTd1JK9n6syHhDvypq9FE9VxTlMV9Lo6BuRAXDOiUjEQ4JW/47wU/G85q6B3IBo0AgfAZ/gkLGxoN18dC/j7qOW2+IhIlGST4wQiLJDqXzKOznzzAMCI0nGAKgTl2eWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfxSBd+8crA5WjgorxZokcUAUkdCvoaLwNOT3hUfMRU=;
 b=ZBrLEs+QwNFhOBQp+UZwPOtEZ0yCBMC41pmdpfsuKe0o2K3HpZGlcxiZ5nZzW+X1eB5rNe8U75rk5tTWI/wYnTzLvprbb59EEYRinRgerb03mTVXwI2rsF5X5bJwLFIn5U9GQ4IYV72BFYNGB6RO6kpGyz0hwH9G1/aUKZa/ZwK9nkr6SXflyNO/pJaV5crae1H+ezFqhwo6sKdJxfOtw/t9wQqyySmA5wScvF818hD6sQJ3lK9dqPNqr1tLBYIWWz5cx2M7qU3APBMgtELGWWAUEfz5mr2VDZWbAbnOmAKsZrOFCkky3eRM57+EV92QJc5LyWtiq4OGgBjdd4le6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfxSBd+8crA5WjgorxZokcUAUkdCvoaLwNOT3hUfMRU=;
 b=Mpe+2yPZtWvyB+8nPnwttLnq2nrUVENXYSzJQuqLMS/pelVdOD+aMacLMgvrdSAjKl9+CWIpnQRXTSeN/fIHfpwDdUXtvTkbNTzdroiFN1RWqbM3kzZFdGHUORMkoe/qu8lGrjeN8efkM5XWZXM4OMdV4xiDmdCVE6v5iebcoHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12476.jpnprd01.prod.outlook.com (2603:1096:405:1a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 13:15:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 13:15:19 +0000
Date: Tue, 2 Sep 2025 15:15:06 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: renesas: rzg2l: Simplify rzg2l_cpg_assert() and
 rzg2l_cpg_deassert()
Message-ID: <aLbt2qI1VQT1JSaz@tom-desktop>
References: <20250820100428.233913-1-tommaso.merciai.xr@bp.renesas.com>
 <20250820100428.233913-2-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdX3xesNr7VXjH75jfaQ=aXrzNhAhpPkdN6LiC3wY8sX3Q@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX3xesNr7VXjH75jfaQ=aXrzNhAhpPkdN6LiC3wY8sX3Q@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12476:EE_
X-MS-Office365-Filtering-Correlation-Id: e75df425-777e-4df9-24d0-08ddea22c3d2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vPpRllLZ6nYAzTQWTh1x+58o8/Q/t3ByurKx/YlfcAA5MUiG2WpEkomuaxik?=
 =?us-ascii?Q?MnekQ0cFgunTWEoQffYqAe+53Ysm+16eo0U6B6ao5TO+RBcDXJdChxPt5DnW?=
 =?us-ascii?Q?D9/87swUmZFFNpkO+zoc2RfY3liXGaz2ZqqqVEmS6U6i6yxTglCBiQnlyBii?=
 =?us-ascii?Q?byTHrak82701xm/MA3JEIEIsUvaPtp4G31obiXyQ8ENyDF5obp0VfgeAKzPU?=
 =?us-ascii?Q?1LI37DHP77vTkgV4w5F6cn36tpCscQoRP7Q2ccRe4xHPJumHtezlKn+xcPa9?=
 =?us-ascii?Q?AlXa5KLP3ew39DhqVD6Nb0Nw+IYQblzX1o6DRA84S7TmZJVEiCA+vmaP7c6L?=
 =?us-ascii?Q?Q2Py2XBrX0r6IvlK7rI41z5fAca9mCJMzJUW+mXugAzn/GLuihNBQ9OdNaTz?=
 =?us-ascii?Q?9XIOuvC+nK8Y5Z+px83JD6WcCw3pXHDdmZeIHe5PKM5u7N7YAT6cZeUJPDMv?=
 =?us-ascii?Q?9fjKxlF7mu5RGDQ4WdJKn37zLJktE+voNd0CUJ5hGW94DpXuXZuvU/vEo3gR?=
 =?us-ascii?Q?C6nqx5olxLA+//VvqDD6AvDlzwKfk3zTcjZgzCNoZmP5Da8hqvkz/ZcGrgbm?=
 =?us-ascii?Q?dCtfqFIQ3Fk64EBvLVlm5tRnYCWqIx7OVaQq2w0OIHFJjt2SFAz7aNdMRVFc?=
 =?us-ascii?Q?uMa2vcdL6h2jotRO3Mh2lCQh9MmghkUxSirQT6ozkS/1gJ1FBOx2jXxCLZY2?=
 =?us-ascii?Q?IeC2ca/HCgtPg2HLTE+sTbkIaxvj+BEDpYZ5DdnhpYnvBvrLfRPM1YtuMR7/?=
 =?us-ascii?Q?AeXkQb/yS8478nj6HY9TUuTLR3LbRO54zDZZSsRq+yLO9/EigusslfhTdqI9?=
 =?us-ascii?Q?ttWUgUw1LlmBXbgRcCZY6HDdYbttY5ojE32ANP/xFivfzacZR7cPnSY5J14w?=
 =?us-ascii?Q?g0NTVzibxQbPgullNWi3iKdIiiLok9ekZfEtcv1z+I/gis0asTsxU1rfxCEw?=
 =?us-ascii?Q?/0+oLoCg/NVZqX0/pr52n9VzW2Mj4i4MR6mQDMkwCzP9LJ66uawUGq9NkXNf?=
 =?us-ascii?Q?TmgMyFolQ2hgdkqWUda+F41N/RSrW9fInkJMtoCVeAJnVWpzGqL4D6WikLV4?=
 =?us-ascii?Q?zTLbgCTQdU94oECLNq+U7pKJPI0DpNLiFeRRdLZyRFOqD6DXPrp83z8FYSxJ?=
 =?us-ascii?Q?t1ejRlcL5G0WokaPrFMGPbagThwkWvkAO4jwQ483jznh7xOMMncrkm2/DGfI?=
 =?us-ascii?Q?lmbehdl4aa/ZZnqDH1V/9Y0MnlxYza8x1GNmNWGIFS1/liV85Uz4EylZ8ETr?=
 =?us-ascii?Q?+gxzsN++jcDU/TfgU+oEjLzE+n+TOowq032HCKaUabDKXxfLGAarHjWB1DhN?=
 =?us-ascii?Q?Qwo2cQ2JVDdxPUAxHNitx6gbpqiPlMVZb8m4HLKiZqOZazReN/0O1lc8NVZd?=
 =?us-ascii?Q?3Qg9TbiLVWfNFHChCrHqlEda4laUKWhSgzFWNthDOWfIvAQLG/+E23OuEaH7?=
 =?us-ascii?Q?4EaJW8dYwnucIf2JdjWQhkozxIjKlabXpFL47VwJNhuLkENiuRLStg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BwsHC+50gE/FWT5D1z/7+LsmPISqZbJGSttFh7CBszBpgoXpS4bUSjoB0VmQ?=
 =?us-ascii?Q?3jYCC7peXKF2EeA/qiSZ/C5i3MfbgA+HC590zlKF4g7w0DidVysdQlBnxlk2?=
 =?us-ascii?Q?PD96uIHCmW6JHn4n6LZPwLOkQ5jRLAR1rPHMsvYuIQ+RXJJff+fa6IQIhRzQ?=
 =?us-ascii?Q?LnCakQC9CqLaHz7bkHJi8TTmT/7/Uc9sc6vkxuIFRBx/R77ZrXwazc/EdjRJ?=
 =?us-ascii?Q?wUNk5JnwzVUbqOgpz2A0N2TsBt/oOI5S1t0JjkMFRfIubVqn2sPjYLPIHUFe?=
 =?us-ascii?Q?skCRMTRmHW6xYZEOMENro674jLB8d+Zjul07GNPuUDWsTMtaVRW4XFa2B3gh?=
 =?us-ascii?Q?2m0/4WGqvfzX44PA58xqdZO790w1reOMLyX+jczjbYnPSXJk/VSH3tFtWANa?=
 =?us-ascii?Q?XJRlze2HJXXafEoClJ1FV8wsixS3aj5dgaMjJ8dGGrdadql7HnfFP016E56p?=
 =?us-ascii?Q?w+rRn9DjumQS1silFBGSMuWv0ESsDlBjZJvinqcXUof4nO9MZf6gNoDCedj7?=
 =?us-ascii?Q?dFNSjVNVmHcyjW3x/WX2BpVW6t8Vwy7xS+RhPdL+s+molc3uFv+ajLVkFYvm?=
 =?us-ascii?Q?yY/taL4TzROBMys8+gQDvpsWVbP1bejCwmjL0g2D28WzicHZJHvx5l4xCeUq?=
 =?us-ascii?Q?8VUZH+vMIp7fZiVyxmMWJyt5Y/4eASYJK9D7VJZn4CBeBivRpxda368kwOc6?=
 =?us-ascii?Q?IkGcD1Lx8RDJAClziwpgj6Xe6UVZxZcyE4w7jfdZqy9iGAWOV7lOLQmTF4q1?=
 =?us-ascii?Q?i7ACXl2+mSgFKNS0rUUvBwFQgco29yMTl1oZJva3buEzeKO0FAEOf2w59sUS?=
 =?us-ascii?Q?szwUHqXfNTpUdjl3qHhlKP2apL7IlwzIR+6zFeapnoRSc18Bkw0gHSnMiOe6?=
 =?us-ascii?Q?146H6I9uyoMBCyUWVy/sTOngj45/h6SzY7ldYtfhN/HNLUkYOfUj5zxrCqYU?=
 =?us-ascii?Q?H8fM7IF3jNujDa/SD/rnjSvZ3kD5IOjp6nmwq13iLRG06g2wMHcMwRkLZpVp?=
 =?us-ascii?Q?hiL78kyAPnkuZofxiIdaeDFoeZGQBjDzBq9qyNEvebmowwO2TyW09QVKE89U?=
 =?us-ascii?Q?OWU+XNWbQP7DHKFdyACwDbRx0fvIq6iMWhhl62N5YcS431dRw0C8WozpgHan?=
 =?us-ascii?Q?R5ct6TuUpUV2JVRvVJ0rFXExxLYEwyZQm333bRioM4DcA2inYW1MqZvM11TZ?=
 =?us-ascii?Q?WPCLfKNeNKhBKYVaiNwK2utCQyYtUIzFbfTm3lpmaLNXZZ+olxOKsL85rA64?=
 =?us-ascii?Q?MnmLbps1MHFOWiuzDa+qE08vr807H0XAbZUsMKcd2A0ZL5Mxu3boNdDNib3j?=
 =?us-ascii?Q?bX61Wr+Sr67Svhu8Pfy93nmzAgryroq8Id/nTfrzFkUl/daPYo9z7B8l6JUH?=
 =?us-ascii?Q?Yn+4NBuR9S7NBi0OF33DM0ETCenlxT+OS0IIhBN21LUNcW65/cE7CtKSydcQ?=
 =?us-ascii?Q?d0RcA8oRZw3/6OBcu1cDAg7LVZEPOyQJshPOaRW2SblUW7k1Q7R4RS4ZiUeM?=
 =?us-ascii?Q?IdzYyDAoCCvU9teXJ1iS6O6VKaJpxu2dOgGa5q2D4UVV9f+FZfpI2KXXd3YN?=
 =?us-ascii?Q?tJrZbMiDPzeb87p6c82J+fMkxQ3sMw+txrjM+2cMW19yjrSeZ00NKv2Im+En?=
 =?us-ascii?Q?khNwf1gYgdZofjjTzrNsh4s=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75df425-777e-4df9-24d0-08ddea22c3d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 13:15:19.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpeoF4UOfAHz8SIPsRVEGyFqsI/qixg20doTQ0oS5R4XKGvSEtincVhmA1t5461gnrodlVKgYZl9/ZhQVK33laIlciXHmnVluIOem6trZ16XAC35yBi93W2/GSbt3ll0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12476

Hi Geert,
Thanks for your review!

On Tue, Sep 02, 2025 at 02:12:50PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, 20 Aug 2025 at 12:05, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Combine common code from rzg2l_cpg_assert() and rzg2l_cpg_deassert() into a
> > new __rzg2l_cpg_assert() helper to avoid code duplication. This reduces
> > maintenance effort and improves code clarity.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> 
> > @@ -1664,37 +1668,20 @@ static int rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
> >         }
> >
> >         return readl_poll_timeout_atomic(priv->base + reg, value,
> > -                                        value & mask, 10, 200);
> > +                                        assert ? (value & mask) : !(value & mask),
> 
> This can be simplified to "assert == !!(value & mask)".
> Do you like that?

Yes, thanks.
Looks good to me.

Thanks & Regards,
Tommaso

> 
> > +                                        10, 200);
> > +}
> 
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

