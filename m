Return-Path: <linux-renesas-soc+bounces-19058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65742AF692F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 06:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BB021C252DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 04:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954DD28D8ED;
	Thu,  3 Jul 2025 04:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bSEDS6xN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A51D54D1;
	Thu,  3 Jul 2025 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751518290; cv=fail; b=JoWYKW1rUjmBFg2veRAXOCNWy1j2JSWTBv2wUltqzWhYAjyy0Ry2+7FT+lXeN4He9Je5+aE/d4YNXu3KQ3tVdN7iEqUKYRdhku6lVJg2/JE0o5TfGxevidl1C2BQ2CwjfXAjPX5f/f+NkSAdIZRLeN0SwK9xx21bIwMVOFnXY70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751518290; c=relaxed/simple;
	bh=mMixE0OQXrVPoL46W3fwQmz5TUdzHjvuFR8TScu6wl8=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=Ww12j7IvyTtQCIOgolllLn/wRhiLQ5zV0SZ9ECxX+7iI8lrWVLIqD4e21TaFxMhHpGTa26GbJw6D+cLP2JVRKtEqwSeDkvm7MdetBwhWJnWOrRzjvbbxQ1IeYjjdZ9G7eruhT2rC/hsjcRRUpBuz2561ADP+6Z0L9rTBXqLlCno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bSEDS6xN; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLyGVq61WhjfTSjoFVAdy75qRnr1gIDtBRwGmBunMv4voTACGN5WFcOfORDsY9hRqxc+va9UtuH2ZmoreRKof9avp/4FPhgST4KZsl7LbI7zldFvENDaKS9xaxSLf1kao6IFtKVyEu8wsiHMx+pBzkilHt6Fajgt/YTtiAXHVdX0mYRaCH2AZsSMQFIRMwmjnii72zYDCnmpV0QLkcD3TiS8nJZxMRAUj4bl3RXr85Kq8k9rtwGvL6AJmsqbGIiUpY01Opa0Hqvp7PFfFbSO0NtyuxC4Rvt5ydGFvEhsYEeOyFFxb89KfHeLfuqw8qRdoOIO1cPQYWcCVIuk2+AhBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEyDvS8aItR8Mdx45TR5FtOt82aGf3m1FC/v952YPwc=;
 b=aHcNHTiMxDwS31htbahObTwVCzYdm3ptRJyvhR7/i8F4ssoGUYq6ky0zVVGNDBqVAd48D2Ids1tFGz368bVjw1posMowKURj9tYS/kYOBf0wpLJkXp+9Qr9gIPAJZle0OKPLd4p6KPgyClVHoHTbRqy6/Vm2p60AFctOHX6UeztHAaHzQHbSynzubqJEpLjg/ojyuWUMF5lF6+mnkMJJqSyjRM2ivfrhJLoWmyteslw6u4Z6due68DoqIZz9cZxmeo92i8JN8+KfHf26M930G76AI9I/oofx7coBO97uGxS8GrDGyKG+8hlXF0PErpLydsNnapl8E7P0YyfFzWfqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEyDvS8aItR8Mdx45TR5FtOt82aGf3m1FC/v952YPwc=;
 b=bSEDS6xNz05cKQqL2CDefs2IBZ2lKsO0/DLIkqNPBJ1J/bScWIqFGlEhkwv60Gd+D2pHGUvn5gbK+cs3DVxZLcWPlrgAaXZt3k4atVHG6b4rbFY1mXPSxCnrjQKjvO6rL/sQtnMTYasW76Pc06MMBjpEkJ5BfCj3nVnWGyK7mic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8499.jpnprd01.prod.outlook.com
 (2603:1096:604:16e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 04:51:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Thu, 3 Jul 2025
 04:51:24 +0000
Message-ID: <87frfddghg.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] serial: sh-sci: Add R-Car Gen5 support
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Jul 2025 04:51:23 +0000
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 485f229e-d2c6-42b0-f7b1-08ddb9ed4310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DQqXSm/Ge5gvHrkzrDNza3w1VZnuGvS77OCugl5u5AqhH7RtkXqy9EUOjdtX?=
 =?us-ascii?Q?Esn6bJU4aaBkx3jP+icyX//I0MLqX8X+Mn25uIUj0JuzU6idBcGws0saugd+?=
 =?us-ascii?Q?NbVJvlsuYtwwSDBPYlR3gqjxQ6lsokzpqj/kEVikC/KejcAyNtwBL9SZoqkT?=
 =?us-ascii?Q?tlLNjAu/8CYz7JnJXb7qSQU8M3RsvuESbKLA0Vj3cGOYfZTMU9EH4TL+nSbM?=
 =?us-ascii?Q?lwb7IvT++KZFc/GNh31ZK+0zwT+GAZNUsjRraYkxJS/9sISJQ0efoGpS9zQB?=
 =?us-ascii?Q?Qr+uU1DXv2L/oxVZChGd75Ls+lGbB1IhxpFVKNBCEIUZDHtxe0n5l3hKi5RL?=
 =?us-ascii?Q?ZogWstKIV+00l/r8mfY5GrD672z7NUgXjYGZ3nasK0ODRoDvKOGv5kG0mpqc?=
 =?us-ascii?Q?Tb+UaReG/tMHSBn9hqZH0H1Mbhl5JY1s88MIAJNCtxrwNMlAwnrq3DrWJ0At?=
 =?us-ascii?Q?9rGz5g23QLZfWkwMoUtAIVT6SL7IG/+y/cl8PXpw51z3hl4nyxj1L192Ipw8?=
 =?us-ascii?Q?1XPY8iOIPwN7m+IC+usz8Vl7X71TbvzG0fTcOnAYaHaUKTuncUpXNIupRYob?=
 =?us-ascii?Q?w9NZ/Dwf1Yac8UIPOpPwXc8i69UydN+XNCeKypG+aXZStI1IgyYqvTfhkAVE?=
 =?us-ascii?Q?wByGFVrfT9XB3xyHsaYjzsWKFnQxM/I4dWYhXgP2FO9jD7ewju8RCoTkrtoH?=
 =?us-ascii?Q?t1YGbdWXV1AIJSX19n2dxm1vFMQUCBxdQDi5++y8udBNcMOYU/vZOzUxjvu+?=
 =?us-ascii?Q?iWnoGfS3M61ZlR34wIOz9+aNRQFF227cF6PKofDRWUKgz7MEVizIz2oiDY2a?=
 =?us-ascii?Q?7oc6W4qSQt48gUIkUwjh2gcp5LBN3hs8EvvtTNaJkNM2QvlULyYaXpvsPPce?=
 =?us-ascii?Q?Jgus1uKxPXg9P0j9z6yS7alqhL4h99Bw7PNu9cYkmjKaeI5atWP14VgjbAGh?=
 =?us-ascii?Q?deinzqWN2NpE+fBXrU9Hx+Nugr8aw1Oyh9z/p8wfdib2f/TTxdPezxYexumk?=
 =?us-ascii?Q?h6lQa1WLUoS5+YDtU6PEs5sS1YqFA8GdcJX5pYrz98oa4f3EdFI5qrHVOBRZ?=
 =?us-ascii?Q?ae7tmLz1pECLa3wF8r65ZhnSWO5Snu1sbcKUOC/ZkPu3c8qbEzwQxehapGtA?=
 =?us-ascii?Q?HFmV9sSRa6p0jEefy0X2vAqf6rCP7ZnbOluGDbznfhkctuUHjgzAFaPeOUuc?=
 =?us-ascii?Q?qZlBUsvuXva/cea09KFrz+2xpCtUT42aKqjYNBa1sc9YC4URSbuekM4ona1i?=
 =?us-ascii?Q?3Wuh2WyiJtjIXZgepsbykM8SgkLxoz3M4nRAQHV4caVHpb3jWSNIRfR/H8jH?=
 =?us-ascii?Q?0IFZ4FmU0ZXkR5r8tXlaAPKtJbjQ4SUd4XsTSIDma2MnENumGQqpFR42BUXk?=
 =?us-ascii?Q?OHcRtAAi6jWpPkWWA3dD8xXI2roARhk757KTwP1sMrnwDQpc0veyUPQZDXbb?=
 =?us-ascii?Q?4wFEscC8GQNoWtMRCXk1yGdIpM1LNRd+lLWThUMhLt9JzUDcnjpEknRgTELc?=
 =?us-ascii?Q?ZzI4uqMLj1JYgOs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TnQiNePopfV968zoesD4wKs7HnDycsQ3lorNQtd4Q/XHl2Ri517cbJckJcJg?=
 =?us-ascii?Q?FGVzv9KKexLckbKigzrXFtU2nK5RTvGJXS0bR2f2AJlJYPY6FX9cAZHUPTY/?=
 =?us-ascii?Q?tTQ8vN323HzWfL387ny7NCAmkBEXOnBMyC53hSBkb9ZIP7X2jEVDr43xXDdV?=
 =?us-ascii?Q?jhc5aRDX2DpNf7mBZF9diUHSDLFHjkRLDmUOmG73wc8cuHEpjsaJOv7etvnx?=
 =?us-ascii?Q?yMQv+OXBf3ZapyZvEZgrhBAhBO1pBBAr0mtoYfTCi5Shiv0U+fK2NfdVWIqa?=
 =?us-ascii?Q?3/ABdhYNTJFPXkz5rLaxo++YEzYMSGOc157IAbVrjwK/PjlPJwx8ItUb052f?=
 =?us-ascii?Q?xeDDj5lZ7T8zK/jcFgvzHo/CcOFpid28f364KJh8niz/Z3nhLCakNq7YPL07?=
 =?us-ascii?Q?5nUVHKDpF5q9/t0IgaAess9NgA0+G4ijWzxMMsMWSPf7zgMMuk/RVl5+dj49?=
 =?us-ascii?Q?BEnZrYfn56iQ74o5lR1/fHr0SZmmLl3aW4o8a35pdwneTzMcd7A/bbBk/2PL?=
 =?us-ascii?Q?FFsNOnlhKsnkCh+4oxqOM37EPz3tobyVzSj6frQWl4vLghhVEofaZozdB+2w?=
 =?us-ascii?Q?V74AmYnl8pw1Mkr3BdOGIBBnmXwtr+dk14P6vMoZ8iwQBvOsBvj7DTFxmC0q?=
 =?us-ascii?Q?H3p16aXgUp2bEnZV7UxuedpX0mTotFUOt0jUP7BAfmHBZ7lTOcCPXFt7iwrj?=
 =?us-ascii?Q?S/xlMwtsW9Y3BYMbC1//TksJ/xumw+Uju6PAwcpZITi0DjhWcamA0aNt3mqC?=
 =?us-ascii?Q?JEVKzPZRnix9D6gwWnMFtSZQu9ia5hBFJjE0jPqv9Y/HhLaPDfYJFYcrPo6r?=
 =?us-ascii?Q?Y6p7Hcm0VyRwiEpmEaaYoTk8rsxUuvvPY5r/uyIb64yUUaIdX1bUcdCZVFDh?=
 =?us-ascii?Q?h2Fx6R6k5Ok6o2QCkjNVN5TbEAPyxFFS9TRg5b3ZvBZBdSPrbxmI39Zfy3wK?=
 =?us-ascii?Q?iOPWXhFTxPBQXtP0CfALpOIVspjRVXmznwAg3CLdj97nE28npddpnS92RxE4?=
 =?us-ascii?Q?OvjtAFdPSU7jqtIHDtrjchGPiml+pHU0OL/yntRx+csltKNk0rkjVBCz9Bot?=
 =?us-ascii?Q?6BSpU8FMZA8izuVtwf/GpRzVvFXPXcubMWagFvgmZlBVU1ACkP/RuvrKcy4f?=
 =?us-ascii?Q?ACKMxOE/TLhfPKf63hAizZVC/wa1OzcwhCN/uke1q29oXyjkFBVrVD9ZEaGl?=
 =?us-ascii?Q?/t8eQQhv5zmRQ0jArOZjk2J3zcw2IzGzd8rg7MEWANYQLzlA6hECHq9qoKBp?=
 =?us-ascii?Q?ljE4szpEa4eXlFtHSQaTpAo0uZrERW0BCHqVSsit7yc76+44+IIxxzDrw+Nq?=
 =?us-ascii?Q?I9nj0Iv7wfZhtX5Hzv7fyG7GpV3QkVEQk6HWcQJy+/6/edVs7qvgAZPCinTm?=
 =?us-ascii?Q?+fWJUzMz21GzZfgvi1dS2cdlv4LDfMEMy5agIiE8MDQQnGvnYoPzGeHzaJD1?=
 =?us-ascii?Q?pXW8mZztBmFHZNmgxplIfIaEEV2BJp4lfN6Sk8pWoXXwbz2yA+bFtqlVTE7U?=
 =?us-ascii?Q?NdMbAVKpwwHOWLojdCD329haPcNycXLHCyHDra/zuiU1EuoX+WXAj/AImsXy?=
 =?us-ascii?Q?dYAqKYxSOZj5bQuTP05cMTnYFIISld82/ObXoMmAAMoUTTqiYzh8iWg+cX00?=
 =?us-ascii?Q?JD7rfYYGfrSZIlY78XIzOIg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485f229e-d2c6-42b0-f7b1-08ddb9ed4310
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 04:51:24.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQSlsr4o4+qwAayCRjBJCyqEn6zatZZOznsaoFu2G/j3DhLOTH3dIfWTKnGLDEImPoSr2/tQDQ7cTHpWcawrgLJlp9plPH4FGI01UoAZetDeRwPOCqLca7EMQTKujwx5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8499


Hi Greg, Geert

These adds Renesas R-Car Gen5 serial initial support

Kuninori Morimoto (2):
  dt-bindings: serial: sh-sci: Document r8a78000 bindings
  serial: sh-sci: Add R-Car Gen5 support

 .../devicetree/bindings/serial/renesas,hscif.yaml          | 7 +++++++
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 7 +++++++
 drivers/tty/serial/sh-sci.c                                | 3 +++
 3 files changed, 17 insertions(+)

-- 
2.43.0


