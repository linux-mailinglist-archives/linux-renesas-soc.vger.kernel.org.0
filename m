Return-Path: <linux-renesas-soc+bounces-12597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A346A1D939
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 16:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D230F1887B30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DDD149C4A;
	Mon, 27 Jan 2025 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UgVl/dtE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2C146A69;
	Mon, 27 Jan 2025 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990845; cv=fail; b=fhyMpym2wqF6WFukzGNBIzUc+RuIk3W5oKIEWnBBliPeXp2MhXkEUTUCy/9wmVOjAw+XEWUo1sTA/vOvI93fIuy0NFMbSS8Xgzbr+zcLT/Amsa740m2ZitIzKMLsLt6EVRINS42SwstwDhGdieuGAOq5U+CP5+6g9hxQSq/z6xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990845; c=relaxed/simple;
	bh=zwGW6dcrFS/KlCNBA7jGELsbUTiZJbtdfIA6+O5CIy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JoFGanIIMao/BKyG7PyFopwTXc/V6xn5s6RyjCEOvhYcMEgNVqO3GMlkM2974JQqsym8/A214Frsu3Sf64661lKNoMxMvAxt/kfbalfDs8ZU4dSGYFKk4+6dL2shjjIWs397bJVia2BIvAzu+4Z4KQOmKwdrH2Q1o1XC4d4dJ+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UgVl/dtE; arc=fail smtp.client-ip=40.107.159.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otXS7c5CToQq5FCn1vInV6S1VTFHd18fne14+Ndi7apemmN3BnZkeCfYtSzdWB3PQDuysXsRMHyeyQfi/GJSnOs2k5N2y27JnvT8gNROT2TSu1/phhAiwHPj01kxY+Rt36cABBEmpB1m06TkCpuFTSWnyUtchtZRiz2C2RdWHoKHyg05vL23G3/+elqz1GFM15n2zA9nAcMTgIDLItr2WQ0JiET4xVwbEzQXlhOkKFpzEVb452b5aqOAskqei+6AqrOoWHbWgkM0YTxr8za04ZS39w5y0/rkJI0LL12dNSiAY6cSBuou3Iobf6XGay06nb7mVNlSBMM0vLWqihc3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxTW+xwMEAjoJCn+AqoDP2wdj9gNCIQw9qxueOCKko4=;
 b=ByBbgipp94ZlY8SojmO/hFSRtN06+8dRIaPPUyYfG94ibO8Dx8C2P72o3dPvrqqZtncmhcYu/9z39opNbD02Hdw204+NKsb3RluyG4W/KHVlq+tBBFqvdjX0L17I8+wPuC8LUvJ8mkRQ+mNiHMT1tRvQBmTycpGpGvYoWQ3asWTyokqYUM8VYusgRjI0I3eJQUjAc75YauYbMgq+0jKWc7v9RBWjLn5umn3Eq29hbHJ2Go6maxWMq229utnfnNZNkoc+FJB3NDfUsaMDUUJIgsz8zoqV4IW9OnJiOlyje4/Wh/NZQKoJpFkSdCy53H0MtVREqAof44K572IcOfFBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxTW+xwMEAjoJCn+AqoDP2wdj9gNCIQw9qxueOCKko4=;
 b=UgVl/dtEKaDwxQdNiTYGnM1KGNI/dypYMoRUigzSuj/ZAElXEr3w2n0HpqlUxmBjurLKoqG5+24cRCy9MpmLDwsnd3+z57PTjqrh3nH9sFYcrw31atP92vRPoTdRNcsnhCR1MtaaEX0wjSKVibPuaS34RKf70EDjdQqh3j7pNvRNpnaei5XX486ZlZ+8aE3GJqpL4q0nHnwOIUDrwT+SZDhW26BoeQyXuwCjkxIVi5eqGiW2/goXyeAma9BnyUOak8bO6NEa1mkBWlDnfUB1uE6bpFamvfWQLqsRapiWPjezzr/fhQKKdL/2dOP1175Cn1jxNh7CJdYfVFQg9/Qaxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10964.eurprd04.prod.outlook.com (2603:10a6:102:490::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 15:14:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 15:13:59 +0000
Date: Mon, 27 Jan 2025 10:13:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 05/14] ahci: imx: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
Message-ID: <Z5eirJJp/cZzzGPd@lizhi-Precision-Tower-5810>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
 <20250127-pm_ata-v1-5-f8f50c821a2a@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-pm_ata-v1-5-f8f50c821a2a@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa18fbe-5223-4af1-ff96-08dd3ee539cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/DqJdBz99OoILT4dXHNjAWbVQxl4bJ0CnpSwBzdaseAvTZs+MMbJ3YTl2Sus?=
 =?us-ascii?Q?F7zo/gMhZSPzFUv6VEnwwADcuOANKaxqVnT4ZfVnDlD9GG/i/SvaTA8m96RF?=
 =?us-ascii?Q?IynqrXcKxJpEZZswEWuEJP3E+1wdK7ITiyE9KKFu04WXbv4o8Oq6exZpqxbL?=
 =?us-ascii?Q?kh5vXvl6WGgZ0wCaVBsCSFhFszHzQzGrW01tEfngOzxKs976L11dGhHXWhE6?=
 =?us-ascii?Q?4ScqhSAwXmSAqnNncjlByNiIruTrWvS+2YvHmzGUhqik61p9AZhRzk2VOZFu?=
 =?us-ascii?Q?sA6XOuWvziaCnKlQUaqS1eFzOsBe5agOKwac/QIp2tp7Hdf3ZoIMqeXqZEHz?=
 =?us-ascii?Q?HJtTSLdzhoGK4klv8TbaeGvHGKJwbiZjI0QxSMqwnQog3QZtbujX+G8yFn7U?=
 =?us-ascii?Q?4XdoUQkJ4BNE4022UvrECKgvEBX4iSocizCE5h/LGr3j8GxjFai+/2lolXKK?=
 =?us-ascii?Q?N9ueHFbXcpSjLHSXFlmSfF/nY/IfNTqvwlmLRehrEI6wzELe16lDpKWmm6M0?=
 =?us-ascii?Q?hPil55MsquoLOfykYWxpMu3WWFgTvvBr+0CD4hARJ4gYc1bekCTMOGe4Jwgc?=
 =?us-ascii?Q?Bs4QLtBeHBF1w1DcRPZWZGlbqLtEcZaELxDOQP9BOphfys1N807bpbzEB/Qt?=
 =?us-ascii?Q?8uy6d7ZCcndJkRJP/whiQGMLR21Rn7ucGejOBOn8Oetr5N+9P8viTHMxgtyw?=
 =?us-ascii?Q?Bui173dO1f1ahSu3tx0JAXyl8FvGeT9FEpIVhoREZuSdd1sCpws2uzBOXN5b?=
 =?us-ascii?Q?qk7iMyPiTgRsSercUQxP6Bp4xr3bf5FfrfVQwW/ddu/gzKqsKKNlulTWY+HK?=
 =?us-ascii?Q?yDL4B6I9U7mv0Rz2ap4AWGBtIpOfufZoQBvvD/Vj+HQ5ieSbRD9HSV2mGto4?=
 =?us-ascii?Q?CNlowDrDosTFbsyLmQ+jg3Lo8WpHd/md6weu5sg1zIxs6azp5QYP+pZJgJo7?=
 =?us-ascii?Q?TYkNLRoI5fWpZvUe6i+G4y4z+TWVIRX4KGpYBNYkOKdusq4VLzCCoxIc6+g+?=
 =?us-ascii?Q?0LyiYl9me62Jj7yLO1z/QTV4nEC0GQZ0evzvIHElbgdfVjODDvW43yDGzghf?=
 =?us-ascii?Q?5k0uCv8KV7ig42cg5kFnO8+lLs6lYZ+WQdpsxssHjTA1cRgSyI+ZnmkBkCAy?=
 =?us-ascii?Q?EM3zUsvFXYws0pBj8Bl2vdEnSKEKg2/ApiKdc9r/qZmlP1Yty+vV0CRLefAu?=
 =?us-ascii?Q?WSR1pZxLzZ1ERx+lx9dyxF+qKnPu95+bbQdJ6+LbDok0kUFnkoar7zATceN6?=
 =?us-ascii?Q?sZfS112INmUj2tLf1py5lFYG1cm+UDdifchjrkjgdDdwUpfHio6lmyWHQMEv?=
 =?us-ascii?Q?ztzJjP1jhX/5GYkUZcfrtV9t+u6+uQ4Q3H+kBKTbBL0KYA3CLdvJ9ow/Iinm?=
 =?us-ascii?Q?6x1HwUrA50i1FqWvEJgDKPkdTrtp3HJk7oGovyB5JGfuBEdoXP2QFI17qN8j?=
 =?us-ascii?Q?hp8IJFNi7wZr/pcRLptFb8bqTFSejFw6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xr7Seitt3qfrLNIoiC2VquU994WyfMw3dLF5nzVavNyWjYkRv2/29IzS7/+x?=
 =?us-ascii?Q?NeJyZcaALmJ5mZKjGFBl71pYCj40hxrpA/enQTDkKL/CJAUmSkdaFpt+SJXz?=
 =?us-ascii?Q?veS3g4hKZouD6zA4oScQppnq0N/wLlKNrOG/OO6JYvIkaK72Z1wYrY1gROxT?=
 =?us-ascii?Q?1OaCphvK3XvsDe3h/Ll0O7B+cLEYvwdrkpo2juaEDL3ISL44C1Ia6ndnQWv8?=
 =?us-ascii?Q?egMgLDYyaCS6NZTMLuC34sk/WFzyYAomflHvH+SrLl9UtZ7+ovsTHZMf3zf2?=
 =?us-ascii?Q?9a/q5Dn7+1ovy0OEqRY+Hgg0/UzE0FgMyIGtPb8/2ANy8BMfQVml2rLeuMI0?=
 =?us-ascii?Q?0q3HoNKmhHY5I9VnYtHovq80ETxPu/DXQWkkp7RYypNVpnMpKyxBRGK0W+qe?=
 =?us-ascii?Q?S/p4KAviBppe8calHXfLP0o/7pJFxcIMGFzwdaTVTZwFrz2ND6t6B48LjnaU?=
 =?us-ascii?Q?stjgSAJIubnphPLU++9Gjl/4ctUW26drkc1ILsF/3bzewwQlHJDH09WU4cvd?=
 =?us-ascii?Q?J4t5soAOvjOHlCiK3Xh+uxKJ810MMiU9+RfAz2sdGP6xwxv/V26GsG3jiPzJ?=
 =?us-ascii?Q?IQ6RMb8MLtSua5WyrnLbzGZPlkW2dSHv0ZZzpiu47eacKXjzj9rAcJ+CJMfU?=
 =?us-ascii?Q?uPIP2eKZC1q/VP4TwzpU2l8xXzxmg3MVf3PnzRBw4XaGQ0Fs+cVqnA8XzcrK?=
 =?us-ascii?Q?ckc6z8E6z2Lz3mran4j5CK6ZoCc1uI6olTn/v0de8vrF6zGLLPT7QRmLp1Z1?=
 =?us-ascii?Q?HkCp4FsuQgM9ndPGjv+wI4JVAoySJaesNKT9WmlX3Q75tH6i8osL7Xn4sBKj?=
 =?us-ascii?Q?BZaUQfENzG8JjjK2jfL0Fi4eWLIIGEyq+nQBWg2j5zz5ugWzztrbW9vKSdVX?=
 =?us-ascii?Q?Gz3mPfb0Jzjy95OAr7fXQJDdurc3ty5Y1BUr9Vy5R9EKbcJNmL79Ub/52D8R?=
 =?us-ascii?Q?+a0b7WpdliBUGj6mMj/rUKJRx3PE4m0pUn64/pLaYP6MoOPNdhs4TZWWtnkd?=
 =?us-ascii?Q?3jwIVElm+/AjFjdDMIvD1x5n238hDxTnRv3VynUslL3Qpir+d8qVqsLeV1WJ?=
 =?us-ascii?Q?dXh5WXbVJuFhACeYnS9JlUk8+ONa1vjayvdv4bZwkvm6NBwVLAJmQ41ith2X?=
 =?us-ascii?Q?Fv+2r8Ey+7MkyNsHp0T/jN+gD0qMx7k0FRvPhNsofH8eQMKmZCjqI5cUY8nv?=
 =?us-ascii?Q?PnWWlV3cfzKhcb8qSrviBKRzhE0eQH16Vq+86ikMvD720sDaq1aGSxXmVDAM?=
 =?us-ascii?Q?TgmmgqMwFVh5D8+RnWGumHo4PYDPsSTVUhtILqcU5riWe3szmH1TkLioo+lB?=
 =?us-ascii?Q?rqQywCT3LGrideJW6/KaV3G5qXyxas1h9uzgVbuRPXvt/lI4JR4NlYdvLfUP?=
 =?us-ascii?Q?ohI2aazGV7rU91QQM7DOmWoUBFQh+m41qBzUyz4QYBzwSAWjROsGYFVUB5Qp?=
 =?us-ascii?Q?mrQLjVOL/x9EtjOuH/AOkXz80is4L19KhXySfzhL+sOFDie/f6MF0vhpBr91?=
 =?us-ascii?Q?mvtWSA09YU144CunFe4XaQrIaQK6nbSgMWoQIHKnK82ko01Td5EWZlROYiB0?=
 =?us-ascii?Q?AUW/yiroT0Sf08dLqbZEUNGGTgynETf8F0GiuPiG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa18fbe-5223-4af1-ff96-08dd3ee539cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 15:13:59.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvZDDAtQwKe4v9Vmx3bP+kpSlMaeWbS5dXEcEQ+jRSjrBVSpZZtgVsnwbJE+98hQBXNJfntTjX1gJ9taI4nt0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10964

On Mon, Jan 27, 2025 at 01:46:00PM +0100, Raphael Gallais-Pou wrote:
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/ata/ahci_imx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
> index f01f08048f97aa230877e413ba6e416d79779c1b..ec75a16c630a79ce10ea98b16c44c9a3908f869f 100644
> --- a/drivers/ata/ahci_imx.c
> +++ b/drivers/ata/ahci_imx.c
> @@ -993,7 +993,6 @@ static void ahci_imx_host_stop(struct ata_host *host)
>  	clk_disable_unprepare(imxpriv->sata_clk);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static int imx_ahci_suspend(struct device *dev)
>  {
>  	struct ata_host *host = dev_get_drvdata(dev);
> @@ -1021,9 +1020,8 @@ static int imx_ahci_resume(struct device *dev)
>
>  	return ahci_platform_resume_host(dev);
>  }
> -#endif
>
> -static SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(ahci_imx_pm_ops, imx_ahci_suspend, imx_ahci_resume);
>
>  static struct platform_driver imx_ahci_driver = {
>  	.probe = imx_ahci_probe,
> @@ -1031,7 +1029,7 @@ static struct platform_driver imx_ahci_driver = {
>  	.driver = {
>  		.name = DRV_NAME,
>  		.of_match_table = imx_ahci_of_match,
> -		.pm = &ahci_imx_pm_ops,
> +		.pm = pm_sleep_ptr(&ahci_imx_pm_ops),
>  	},
>  };
>  module_platform_driver(imx_ahci_driver);
>
> --
> 2.48.0
>

