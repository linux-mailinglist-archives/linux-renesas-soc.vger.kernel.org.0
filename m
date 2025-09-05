Return-Path: <linux-renesas-soc+bounces-21467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3956B455DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27D5F5C3C34
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5E334A337;
	Fri,  5 Sep 2025 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gP4EubNa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40B0342C9A;
	Fri,  5 Sep 2025 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070656; cv=fail; b=IMbsh32di5SKjinTO1xJKVE4kJ1bFB8hIJ2+tV+Gnzwgo0r8NeTB+8qXBLQiauJZd/R+9ZhpE7n7U8J0rEhyz+XVKFKf4ZzsCqFunM4Ds0wQcU7RTxBD3/KEVOAHJOejtCvKT4eM0Su3tyQ2BmgvwMmDpUD5T7A4mkApqEGr9bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070656; c=relaxed/simple;
	bh=FzbxXXfXpcUKjXkg65z5LAfivouyyYBHdgSsgRn6N1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fS5cHWSy2rZrJbaEE3apzIjWgdVYA1QlsIuhNc/HTidYP+92FEf5WQ14VXIUOBFp9g3dQjlbS8RkisjEPS5IHs9l0vB7wtMKgnY4Ygmu3bxGtZLvugmwwp0j8RD5iV6hzVoSRAxA9faGvO8mlPZr0xN7DFraPBRB3HDsfd0QYCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gP4EubNa; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gN2EFwNJK9g1ZySH+Dqxiw2MYnEGm7XvRQia6NaX1xzIZ2z/NCtXR8QlQ9CRnUfGcLE+1uyOKWbjeHWUt8POXSWtLVExuWDEEgKV3aZcrBuEjjcYgAr47xFgfn2cPx/l+QNykBnN+V5KlX1HgihOtGNCXw+ZJk46acw8C3+gHNoGuNZbRaGgeKxTSsFN+hSGXbEAMIVGxHhF7jZv8gEjv0lZkxWuQQ5JrVpoo5PCuJnxnTM5HjEvkhlCfOGWUebbR5CFYIJQEmlvTIHoncnOnRDwXjr7h4zlJRYJqFvNTwjEi60WOwEk48Hw9p6BWceYt2rD9Y5gO1U/5VYLb8NBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDz7OkQq/vyqQ7SasPVt2qTQOPWx+/lQmfRaX0oIsME=;
 b=crccgeQWP69dAbBwausGHibFrpj5Dis66rhYLghM8fnKGTPXjZLytOVd8Z8zC4iYiT9v0WrYTy3+rDb0J20JuF0Jj5W12kmkqgrB08pjgTZQ7SUJsP/op0lFvg6hL++Yurg2UXgK3gF/w0iD8bVUfzy97msl3BoDs4xjy7nQ8GgyYgmd+pnpMaGWkgSve8avWhewZWQMLPodoGrBHaLY+lAFCab2X05k26YJuFkc7BELnwXzBwNTVXAVAxaixEWp2OTtDzD5fLeUuLMOi22kb7uGA5UercruGteuLQcIdIugGhRCnSMTEWY4NT44ZM8COkI0mWLXq+94MxGR2jPQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDz7OkQq/vyqQ7SasPVt2qTQOPWx+/lQmfRaX0oIsME=;
 b=gP4EubNaJwWVJMuPwPm3+R7vJmCbpw63Aj76yk8Oa/uu34VYnhl/+dNHy+GJCFDk9+xKVzk04/k9CJmjvtayfSTrWnSnkStaxCsEUSjLyZgCE/2AHJmlmwczIOSYYWR8F0AXjHUfnMajVFLLP7zlKeaqGq3zk5DbWARdkEMQ2AI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB6950.jpnprd01.prod.outlook.com (2603:1096:604:12d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 11:10:48 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 11:10:48 +0000
Date: Fri, 5 Sep 2025 13:10:33 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N
 support
Message-ID: <aLrFKb27MFPFhDHt@tom-desktop>
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-ClientProxiedBy: MR1P264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1a2d92-7061-4681-28fc-08ddec6cde17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7YDruee77oNGVWv6wDhBXET+7D7u7ag8QGQeuvxCzD9KPL6zp5YgsqBQNV6X?=
 =?us-ascii?Q?1MRW1WvX/YwTUvmIjNaRU7S2vay3H5mu0rEPToEAqvLuKHmwoDKoosEtgYGo?=
 =?us-ascii?Q?IeIuJRIJFVC6X+Ug/VF4ODbCyOPxmR66+fch+D6LMPtc8uIrLs3eqmf9n8/Z?=
 =?us-ascii?Q?FAuU9ooeAyh+FdFLAFAKU1t2/xnzdD/pAsCWZwrKdtieF1ZrluaJulLs0z3u?=
 =?us-ascii?Q?B/fyfEG59EzuA1FeYzW62MJt8ZFn8hJwILZ73LCQHsNpktR7y2bc3YjJZ37I?=
 =?us-ascii?Q?CGmxYWjJbClDlKlH4KDe3APxVdRNQDtgjeeVG+cwv9KodON8JNVSClOAznv9?=
 =?us-ascii?Q?/WPQTCMv+iNzNlDxKHBVTB34TWu+X4WadY8iZ5J/Y7GW0XWZXvAK/Oyxd17T?=
 =?us-ascii?Q?ruMTsnART0UUxnIP3xf9jM2k6GLXicsVODnQj8SSC0rUCF8ICZJ7oSPcJeO6?=
 =?us-ascii?Q?zXQ43W03auvEj5bpswem0CuibI6z+YvK5R99/eCex8ZOisI+WZnx5XY+EO4t?=
 =?us-ascii?Q?1k6XrY5+dOPLqaMvNm2uyEw40cf/7aohtCqLbmYdlpKoyA86KvhTiMn9NQzk?=
 =?us-ascii?Q?TW5Nq+QmrRYewehc+3tUYnA5G3E1ZyAfz+hijpoq6CKhS2l+/1JEfRqEkp6Y?=
 =?us-ascii?Q?qb5VWUW2/IIF7SquxajJhVwuAHH25zy8AVuTar+YEd2XIEd3KbfjQ/wv0giB?=
 =?us-ascii?Q?3nKvUfo/pfOqEVudV2mhlKCi94zU/LH10VAo0kbP31il73UNf9ZtR5x7xZVz?=
 =?us-ascii?Q?JsYhUNbzfQiCDTUUI0vOHY723vSUmAeN8Vh1xlyOdQTh+qbdxoG9u2yQOYS0?=
 =?us-ascii?Q?mCVOvvmiOuwjmFDgK7cHlXCHZ6umst5cmaab0wg4j534XLVpm1prifP9lSD2?=
 =?us-ascii?Q?Bo+Ctx0WFpZ0O7UiDsZuV1Hse6C/PkZ4SYh1DrlaCyA3S8vsF/okFoXWf4lS?=
 =?us-ascii?Q?Wy3Dj8zzFuW2wMM++DdOlrqe2xgh6+qByyRB+tVxHMaXh2KM5Y7wqdCRyjaJ?=
 =?us-ascii?Q?JVPE6PPatuIys3oJP1MxC3JeOK3Cwcb3u2+PHPlLhOfp2zhoQDwCKxn2k2+x?=
 =?us-ascii?Q?kIy4rH0/ONcb3QK4/8qYNlPP6x1vp41C+Oo5VXZF+5PJu//6bajgGmPLgaJ0?=
 =?us-ascii?Q?/Mol4mX2JJbZEhx3XFvCtomGY0QhWsF0283zMogYn9Xq1qwcoNS/l5JNcoAF?=
 =?us-ascii?Q?x6cxK+0lPfBR9RKassJjARBz8Zp844lYC5XotIzB/0TF64gK9XqqezMC545I?=
 =?us-ascii?Q?uK3818I9u5Adf4FAac+YmnlbX3wHOd0JsCZvya352JOj2VeqwjNw33AN+6O2?=
 =?us-ascii?Q?CirtY9wvyrac2cMpY8SFe58ORzscwJC+mBaJmTqpvhSrSpm8mwet9ByiipLg?=
 =?us-ascii?Q?T33f6qWXgVQcZEsk68looh8wEA4bh+biaCaBUp1JluwY2KdqiwyMlN0Ykhwm?=
 =?us-ascii?Q?dUOBF9alsQA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0KL9WwaiGFRW69n/N+J+D9DpxxU4vMfm02yG7pJuMmxP8ZhVyc3Zelq3ybff?=
 =?us-ascii?Q?7cWdHQFLvu9Ri9fq17T82u77M9nRru42416WE+FNqfWWEHTUYBECXMS/oJBZ?=
 =?us-ascii?Q?myeiFC7u57Dwd6+yZwJ+sznZ59Ogg/QbnmOUjW+fnfSJIDAzQpndEbjFzusc?=
 =?us-ascii?Q?kvj7iSxR8BdE3uwsCBFsKB61b0SaEjXM2hcbbw5uU1jEtTfDXAthSFTL2DcU?=
 =?us-ascii?Q?iig1U7j36QjgFTSjh/YuMoeNkAUs6wjJaP0OqM4G4aPdGRPNj5B62NiYx6UK?=
 =?us-ascii?Q?sDjR1D00HAT0vrzTWcNg6FoZUDuGnCzDbIvlJVYxFFAoNo51UxqChwjKVrSR?=
 =?us-ascii?Q?9XDzwnOG2AKoGZfAFeCPvnD0HrLpdxUcqfXj77x6Fhx4YHgixlZ/Qe1l8krE?=
 =?us-ascii?Q?83IlyHY90LlD2Mcd/ID6nyO9/9YzeD2L6R94Pvx+B1TGhLDz2uKDojY/2rGE?=
 =?us-ascii?Q?a9EMHX/G2YtOgjPCsyEMmnyYstP07fp5wR98ARjYVMG+RPh5XkA0NkXTXJ2i?=
 =?us-ascii?Q?ovnSHaPKYD3S+Zax8HsM1BE4MEL25+2Bh9UkqiijxXyRwUa4aKR+09UaPDSO?=
 =?us-ascii?Q?/9rtbGS5k84d4KWJ50ISzmxRzXzN61F1loqB7IB97Vy4K1yOWguabgtdXAoS?=
 =?us-ascii?Q?Q/J+gCZ5FDO8BhzdC7YP5ndy1Huf5trccClGB7RLdqXTrSB4neCHBv0oPREe?=
 =?us-ascii?Q?rzMvXZH7MQrAjF4uVdPLyHUF0wmB5lV2K0vKZx2fvU9k10SgkmKfoEdlnou8?=
 =?us-ascii?Q?nFEtCOp7tvojBfML8s/cWR1NOGv+FenSWtLzfkO/rWzVFMMxu4YaMh+RgOwj?=
 =?us-ascii?Q?iHAhobVWhNV54WfCH0KwMeoZdReCR5pcV0dbjyPrtn08mgGjuj+rx5Eo5TB4?=
 =?us-ascii?Q?kWxFHcHNk3O/K5RzQU7VVRrhS3Ue+R8yx2PMBVMZMGlo47MY4NTQqEaO2uzx?=
 =?us-ascii?Q?zgfCQF+VqpnyQckKDS7GduaSH0lF4SJ2aE2KTJOw4A5RAp8eUWNlGR+wHZUo?=
 =?us-ascii?Q?Fd75ZlnovkpF5R2CPl/670+bu3E4QKN8PtD4hgjZ28j9rkyCA5ERpn4m6rDq?=
 =?us-ascii?Q?MCuxFXfb6EZu3geye1WT1sEABbeICuWS4AGtyk+pJMShhgCIjJGyxWMrsHUz?=
 =?us-ascii?Q?2eimaMP6gdpm0cVya+nTycw2aeAvYm6wSOTWgfkhas0L7UUXUykzXAxh1VBS?=
 =?us-ascii?Q?8hHox7OJ0MeDaSWdLfoUrOulDdU5bSTMZHmsOtX4d3QdN/82SAaFlQPu4m2a?=
 =?us-ascii?Q?mtpnhbC1gPy2eXThgt5kVt8kWId/wZteubZf6BcT6h+cZbhbb/FFoHWRS3Dp?=
 =?us-ascii?Q?w7vOmn2ZZgOl9q0YpSDAEW0zgXwJ2AeqL7sp2VZpMrDtXnkfcBSk68xcjR7z?=
 =?us-ascii?Q?BjvAANu+3hUUblg8VKHH34C/qw7wYcPx6W6C65zx8xMogfxlZHN6ORRcTgv6?=
 =?us-ascii?Q?pNPUP4xqdjhSy8n+XADaCdKiFAqWjQUC/nQ7+z5qKD+5rhi/urgk6R1k537i?=
 =?us-ascii?Q?XMhj/8+SX2X2pstJiGWQqEVldJEZlc1NyGqCtkN6hekDJk/X3jDvIz8Fe4GV?=
 =?us-ascii?Q?DJey3Rb0ZKKJakCD+CGm/7X5jG6p1uD5+Ky2m4JNXBJX5fr793YSaEMKaRAC?=
 =?us-ascii?Q?2qKyd+LjY+bikDvNfD9uFMo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1a2d92-7061-4681-28fc-08ddec6cde17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 11:10:48.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ODlAJEKxRLd+Zd1UCNPtiqrlahxYWUBrCVRRH1lpDqPP7L0IBpErjV882iSxiSWi9RX/fQC5oA1asYldf5/YHpcDGV7vRiAfIj2nRdrBYkKpACUNwu8LBz0/mUYFG3S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6950

Hi Prabhakar,
Thank you for your patch!

On Thu, Sep 04, 2025 at 05:03:05PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
> 
> Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
> "renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/i3c/renesas,i3c.yaml     | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> index fe2e9633c46f..e41ba3ba4b58 100644
> --- a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> +title: Renesas RZ/G3S, RZ/G3E, RZ/V2H(P) and RZ/V2N I3C Bus Interface
>  
>  maintainers:
>    - Wolfram Sang <wsa+renesas@sang-engineering.com>
> @@ -12,10 +12,16 @@ maintainers:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a08g045-i3c # RZ/G3S
> -          - renesas,r9a09g047-i3c # RZ/G3E
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a08g045-i3c # RZ/G3S
> +              - renesas,r9a09g047-i3c # RZ/G3E
> +      - items:
> +          - enum:
> +              - renesas,r9a09g056-i3c # RZ/V2N
> +              - renesas,r9a09g057-i3c # RZ/V2H(P)
> +          - const: renesas,r9a09g047-i3c
>  
>    reg:
>      maxItems: 1
> -- 
> 2.51.0
> 

Looks good to me.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>


Kind Regards,
Tommaso


