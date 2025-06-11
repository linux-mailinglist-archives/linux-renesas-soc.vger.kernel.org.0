Return-Path: <linux-renesas-soc+bounces-18121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5CAD5ACB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 17:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37BD416C456
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 15:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306B71C6FF6;
	Wed, 11 Jun 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kXYgLiYi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57B17597;
	Wed, 11 Jun 2025 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656442; cv=fail; b=hdKqLxS84bZFUhZMJOfYPy8dTlI6nAHkwFpYrYr+ywIYpizWyim6MjyggeoaKZi2gbsMFw/h4IkkxYmf4ECmshQNHFg4aUkfw5gruc69dwu6GQN0n5cgO8l93z4xE49h5O/uFTqXWpGK22C2MdNIEz12//sr+wrIz/RYjpBCaMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656442; c=relaxed/simple;
	bh=dSrAaEtYVYoOwleso0xlh4ehsUoEgvH1Ba+xnswjyrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qVigUr1AUHQV0rV26MbJt6BQBlnJsZGqx8aZO1l8fyJnyZiFowauxPD6wyZvB9+Jp6iR2wHVEBMMpothm0dtdfcBo7MHD20N990eJY6pkc00ISvWPErgFzumX3Pk5ws0fbRYyxFZbg9OLIwyeRL1955e2mEuv4+s0fflimHr2VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kXYgLiYi; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAy5I9OGHoul3VPev3rhzBP1n2ZEDCqps7QUP/Et6kk2sdue5bhf806txmzClQRZXB7bhPkKRKnfBL3Puad22GSc3TWMfK/6nY1CHHI03683Sod7UtTDoRPZJ3TT2P79VMdTnsTwaHh7SELcxmizeYueO5I7f3Ct7Mw+Qe6V2V+Pm3LMN7KUrE2xkxUnTFl96TZVXN6/6NrXb6I3iCN+Bs+b4NhhnGXEjUHElFh88OP7GMkt0BzBSVe8Cy6MIFUmirJjGZwZ5FmcGafqwk5hGCBZtI9o5ENVHgzAMAUwLgmIrl7b2c2MV+Kq1GO9tfDdgGsF3fp7+bZUWSwm5AVQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zp2fh64Igc5qeDiEk91WimpKw0SVImW+X3QyQV9a+tw=;
 b=AbNxTrk/Y7rfrOfBf5L/4hp/0OfJfX/FvIOHI9PJdKTjOwP/Oiv2Zx35AjqYQN/Ba2kelgf+EvBDG7jx73L8wKYQt1aodxbe7viLcvTdn+q0iLXVYlzl1FAtiyWJlfzJfZ9UQfu8J+hejH67V68ZeMaj3UKA5bmRG9cTfpI7Fr8qRGk+FF9uthH/30v6piZw3f1sXi+yy4ITY5vM4yYBS6Hl8Mkim27yoFaRYbkr31yhm6sgnL/ozZzB+7Cwfcmz1Ra4nqYjqu2Uann8ct4QTHbgsoJgdsK22GwDfu9lDmJSHj60iZpfWAf0JYV7D11+6OF3RyO3HxNqwRpcUVg0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp2fh64Igc5qeDiEk91WimpKw0SVImW+X3QyQV9a+tw=;
 b=kXYgLiYiZ7DG/PsL7JI67z8rp/SyoFd4VmdhOfMMPKqixpAKO6FM9VXpZhrdrQN+oaBM/GwCGsig+wS6YPPZnYxG1FygTbnGBILmal6J9w9DDdUtOr7rwOB21ZhZsUjb5gle2pcEbJxuTIBfoS8FrLYyWd23/G6jCD1ViBXMB1POpHo4HyaisjLqsE4vKQiSq20kruTqwwh/PX0j7VV/Yp6h6+BUx7RQiMoq1JZ7NDTtQdfWFKNnPsN8G7zGAdVZb0g9gmPnSl+3L6/0GXf+Rd06oNmuuWkZlpdst+tsCHNSnsBTdvxN/80M/GBtgYLYK4h7AEU+ygLTaN8x1doXZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10287.eurprd04.prod.outlook.com (2603:10a6:800:220::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Wed, 11 Jun
 2025 15:40:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 15:40:36 +0000
Date: Wed, 11 Jun 2025 11:40:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/7] dt-bindings: i3c: renesas,i3c: Add binding for
 Renesas I3C controller
Message-ID: <aEmjbY8ifoI5Cs5t@lizhi-Precision-Tower-5810>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611093934.4208-4-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: PH8P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10287:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f16b14f-193f-44c5-504b-08dda8fe4f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hz+v+awEmchz+xpccjdnwUOoVw15eX4Q2WOq8kaDolb59UXgFe8PkQZP1nFD?=
 =?us-ascii?Q?ykUPpAdUq3d0j/dMb3h8wD2/y6MNfX96xfpVMx9VNTSy49myqXfMXwqbMqbX?=
 =?us-ascii?Q?jCfOpg1Olxb67FjQ+nJBJCHNPW8aAACDn8o/QfMPO8RVyje7FbpjYplVO4dh?=
 =?us-ascii?Q?/YxrnhEGghYi44b+kio/XsSmRzV8NPzz9qyvUxlSUpMSj5pttVIMwIB2GorI?=
 =?us-ascii?Q?FFeOG81UfbfNNCOe+36z5YH2BBiDJSJHon4NxmhX59MEpX9CeX5bJ7eX3xeh?=
 =?us-ascii?Q?F76jIQxhMsnFfiZucJU8Y+OP1/0iVz+ujQAk9QfVZ+rjtBOTo1EZD6jNIjIR?=
 =?us-ascii?Q?H66U4fpCTcll1LOAEHVlt6YW4QJ6RP+rS5rCxEA3Th7WEla04tXGjfCgbm5y?=
 =?us-ascii?Q?/T+tWi9CQofv08weJlDToahxjXrg2cuhVk+Psd9IF5XlUcFusMvwtGQpZrQp?=
 =?us-ascii?Q?TPNabZ5yxTO/9ZAd+d5P9+1mv+Ewttx6licsT1YXKxTCfQgf8o1yTJ26A0I1?=
 =?us-ascii?Q?hu8UFlqwW4n5zQQCof3Z9eRlALlh1kl5YCa1m470HaeQGFLB5eXiZLNxJ3nO?=
 =?us-ascii?Q?/C5dWRflkDJfANgnw8agcFVjDyrHrTiKzE7tArtgaNANo9UF83X0TUU7sRvR?=
 =?us-ascii?Q?elKvehxyP7SlZ969Cm0NXOK/uc1aF8MRH6f0J/inkXhC18cf8qTpQtdeqSRt?=
 =?us-ascii?Q?nMSo1J2IlHVV5egQkPfo4ySD51jqwh8vpGw8X+fd1HrPFR6hufwRW0U6s4JI?=
 =?us-ascii?Q?1IM4Vgjx8LiY/XOteeoRHuEYoKgmjLLPBYbBXW25aggHY+WH3N+OerKyOv2i?=
 =?us-ascii?Q?m+GgeMUsFWiOAFrVy3YsAWnrwI4sDDHFohckiqUV05FaYIsWDLq2IBZ3nvNo?=
 =?us-ascii?Q?i0QXi3O35QNo0J0gISZGF7ZY+N70I0splb9kfpPjwDDyM8pfcB1OqfcadaW/?=
 =?us-ascii?Q?oyWslWr/pQquJWCazIFqDCx8ObGnViYR5rYKnrhxuqVLs7l2HiHYD3kpte0S?=
 =?us-ascii?Q?1woU7A1UraGWpYyve4r0e/aGqeI2P3R6a6Di5DdTI4GyUhNd+JH8/2cc2OWG?=
 =?us-ascii?Q?uSLUqHZKb9y08GCKHa1YJmmgMQOgrZbH5nwTT6AZLA9s5xVM+u6Yi0mBscU/?=
 =?us-ascii?Q?gZXlJ7VcBxw1+TVxnkAWaal35c5mQngdhq1rZDwDnhY9q5UxLQpVakoGlF1o?=
 =?us-ascii?Q?qPPFSrbwxfstLj5USgt6QXHx1wJVv+P6uCmE+Ao29lnFmtMBf7hP/94eGMJW?=
 =?us-ascii?Q?Rz6wLTfDIX2fALgYZkYiZQj7alwlup5ZSsqMDUuShA7PlkjALCqR/BAYgjri?=
 =?us-ascii?Q?DFB9Eh7b9XaTSRR+ve9gA9dnzjHInAes/ZQGqgujaxVTHgf0CgK+Vshyp4JC?=
 =?us-ascii?Q?hy/u6Pvj2wdtluWNgXAlqw9A0Vh4JbrIU7F9WglZnaTTlq3JlMn9V7Hvt5Va?=
 =?us-ascii?Q?WnmjomQKyykwqdkcr0VfJ/8V8xn07Vc7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UymJtp5eeJQDq2a0Owm9Ml/Eefn+MNlHaDk6BX0qBRJznkOOQWBaDQ5BGLdk?=
 =?us-ascii?Q?2RImRt4gudp/QDuvDJyUYM1Xab9rQsluI0NEvCIWexMj/LuU9yBEW98z8oCJ?=
 =?us-ascii?Q?Dmu0oj32w8XklMfxA3RbQDJdfpP5NVuEBBLhpHMPWg9JkhV0568Qs8XMn41i?=
 =?us-ascii?Q?uKc39ZYkV+UDYy9oAUaLtiVbgNYI2zHbXhBJGlmBxmLPOg+NB4FSZYH07Pkn?=
 =?us-ascii?Q?89TFYFyHA68gC835bPmhQf8CU4GJrOaluAPV02hF7bQofg5r/mkAJUNzbvwA?=
 =?us-ascii?Q?as6vDfd4sWnkay2LKtmKhwKe0hCwaQ/BqK22elVC1Q1+93k3O3/4IepoYvh6?=
 =?us-ascii?Q?M5A9dAAEChdYOzxmKoeiITpoonftTpbeVr6OofbqOXVR3GMTRNbKsCIiaLU2?=
 =?us-ascii?Q?XcSqyBBB4wJAikxb8zqKFV9kXEdHEvO2X3Zrd92yQPAYMxsq0XC1BmH1+80S?=
 =?us-ascii?Q?IuT3Vxremct7KmDazs2UWjy5PRJbW/1Qkidrcg3fxMnS7OO44gWZA+ucjEjv?=
 =?us-ascii?Q?XbXIIBt/yi3+eALSG8Da3mNuk7ZSMSB2162gaPNzOWb8xJxFcAGqtLCRAEo8?=
 =?us-ascii?Q?F9YvqBhpKXANE/jcIA8iUAmIycLG4ghOzXW7Y1BhJEgcef+3aBD0Xg8O4M+2?=
 =?us-ascii?Q?EjxQJXNOKZCExGEBUI7qtF7H7ZTzvwirnZkNn5u2K0A9EuTMx/sTI8Iph3Fm?=
 =?us-ascii?Q?teVOBVsqMKnIh2crdMBZzSAPFEKW/7yQTkIa/iWCRr+X6tDpQv1wdS30AMmo?=
 =?us-ascii?Q?0GSLjXjJknwNIQwY24EJbKwqAe/Ju0OZbyT+psFToY8U1hYhmlfnAVqNF7Th?=
 =?us-ascii?Q?8j+iEWZuZdBP9ZOsVa+t5sLRi012mCRYmvjcwtObal++lv5i3tenRJscp6Q7?=
 =?us-ascii?Q?dfMm0o6caUYrgieyZetRddbwX509htapZB/SQlc/xu3WmyuUkP+Su51OeJip?=
 =?us-ascii?Q?yg53cxH9ve3ib2pQWiX1m0XK9Ct0xlZQG1Xii+yaru7WqQUnV3xkxVJVhg3S?=
 =?us-ascii?Q?GzBDssbyzsfks9KuNt60gY+Cj3c3L43jgVPPgjGhAKf9JDSvHJlsccZtU6pt?=
 =?us-ascii?Q?B1JuW5baArz0IbXYYYO63u57unaFOk8xEn/JA0kfrJOpHD5ba+QU4GJOg8wm?=
 =?us-ascii?Q?0ORq+BJ/E8nQhGrJJ3xclYNJe7ss1X9cpHguCL7sWxoJ4NGAq6RUT+o42ke9?=
 =?us-ascii?Q?sQEuwv3wmQ9v9qUj4WnDfaH/iK9EcVQOvrQX7oDB4buXpLuuoJQu0MQuuLzb?=
 =?us-ascii?Q?8c1mc/WgdFN08nHvW1H96J3+dbAN9SfUvt3BdDzZnsDjWsnWNRh5QxITNkA8?=
 =?us-ascii?Q?Qe72d0B/kRKRGh0bfuwWCP4i7odFmstr4u0RMLBW9iGa3+b5DOGA1/H2flMw?=
 =?us-ascii?Q?d6FiDUAzHCAWKu1wcS/FrngCWBBu01lpJ77QhjCoTElPlEI9Vp/ay2auK4tY?=
 =?us-ascii?Q?QWR119nIYAcPbxEJWQHSWC3B3VcN8zGfou6Pw/+7TcmpC2eDH68TaaGAeSYO?=
 =?us-ascii?Q?mAAJwVNwyUAzpzb1hR36VfXRNmFJTqr9Wzibid05Xfl6/G9KiKU1apWBBm2r?=
 =?us-ascii?Q?HEXYKvsdeAy4qYhGVgEeSo3ZO9VJpxeQxrVwx2ig?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f16b14f-193f-44c5-504b-08dda8fe4f4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:40:36.3874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKwFEzhBc7io6a+VooTTOI3GhWFZFzvr9pVhTD2Km1Bn+zJKbwQohHGYAJeKpO9l5wGDKzldpaNuHxal81WCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10287

On Wed, Jun 11, 2025 at 11:39:27AM +0200, Wolfram Sang wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> Available in RZ/G3S and G3E SoCs. The G3S has 17 interrupts, the G3E 16
> with the "HDR exit" interrupt missing. This interrupt is put to the end
> of the list, so we can handle the difference using "minItems" instead of
> defining a separate interrupt list per SoC.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tommaso also did a version with two interrupt lists and using 'oneOf'. I
> prefer this version but maybe the other one is preferred upstream?
>
>  .../devicetree/bindings/i3c/renesas,i3c.yaml  | 186 ++++++++++++++++++
>  1 file changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> new file mode 100644
> index 000000000000..e6e6c57bb56c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
> @@ -0,0 +1,186 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas I3C Bus Interface
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a08g045-i3c # RZ/G3S
> +          - renesas,r9a09g047-i3c # RZ/G3E
> +      - const: renesas,i3c
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Non-recoverable internal error interrupt
> +      - description: Normal transfer error interrupt
> +      - description: Normal transfer abort interrupt
> +      - description: Normal response status buffer full interrupt
> +      - description: Normal command buffer empty interrupt
> +      - description: Normal IBI status buffer full interrupt
> +      - description: Normal Rx data buffer full interrupt
> +      - description: Normal Tx data buffer empty interrupt
> +      - description: Normal receive status buffer full interrupt
> +      - description: START condition detection interrupt
> +      - description: STOP condition detection interrupt
> +      - description: Transmit end interrupt
> +      - description: NACK detection interrupt
> +      - description: Arbitration lost interrupt
> +      - description: Timeout detection interrupt
> +      - description: Wake-up condition detection interrupt
> +      - description: HDR Exit Pattern detection interrupt
> +    minItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: ierr
> +      - const: terr
> +      - const: abort
> +      - const: resp
> +      - const: cmd
> +      - const: ibi
> +      - const: rx
> +      - const: tx
> +      - const: rcv
> +      - const: st
> +      - const: sp
> +      - const: tend
> +      - const: nack
> +      - const: al
> +      - const: tmo
> +      - const: wu
> +      - const: exit
> +    minItems: 16
> +
> +  clocks:
> +    oneOf:
> +      - items:
> +          - description: APB bus clock
> +          - description: transfer clock
> +      - items:
> +          - description: APB bus clock
> +          - description: SFRs clock
> +          - description: transfer clock
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: pclk
> +          - const: tclk
> +      - items:
> +          - const: pclk
> +          - const: pclkrw
> +          - const: tclk

Suggested clock name is, apb, trans, srfs.
Needn't clk surfix and provide meanful name.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Reset signal
> +      - description: APB interface reset signal/SCAN reset signal
> +
> +  reset-names:
> +    items:
> +      - const: presetn
> +      - const: tresetn

the same here:  per, apb

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clock-names
> +  - clocks
> +  - power-domains
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +        interrupts:
> +          minItems: 17
> +        interrupt-names:
> +          minItems: 17
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-i3c
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +        interrupts:
> +          maxItems: 16
> +        interrupt-names:
> +          maxItems: 16
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r9a08g045-cpg.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i3c@1005b000 {
> +        compatible = "renesas,r9a08g045-i3c", "renesas,i3c";
> +        reg = <0x1005b000 0x1000>;
> +        clocks = <&cpg CPG_MOD R9A08G045_I3C_PCLK>,
> +                 <&cpg CPG_MOD R9A08G045_I3C_TCLK>;
> +        clock-names = "pclk", "tclk";
> +        interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 294 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "ierr", "terr", "abort", "resp",
> +                          "cmd", "ibi", "rx", "tx", "rcv",
> +                          "st", "sp", "tend", "nack",
> +                          "al", "tmo", "wu", "exit";
> +        resets = <&cpg R9A08G045_I3C_PRESETN>,
> +                 <&cpg R9A08G045_I3C_TRESETN>;
> +        reset-names = "presetn", "tresetn";
> +        power-domains = <&cpg>;
> +        #address-cells = <3>;
> +        #size-cells = <0>;

I prefer put #address-cells and #size-cells after reg

Frank
> +    };
> +...
> --
> 2.47.2
>

