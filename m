Return-Path: <linux-renesas-soc+bounces-12915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2BA2AC0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 16:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE5BD1883D47
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 15:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E271624D4;
	Thu,  6 Feb 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="u6R6E/4t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF6023642A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Feb 2025 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738854195; cv=fail; b=G8K1nvk4CsvjLcRLdhsuBXJ00d1yRwb27SRu+fHki8rtyQLat+6lH/48O0mVdmRodXeb8Q5QKPKBHtp25l0Hgjx0NRcbgjemFtyEm8rr1QGBDQg8BVF9cZXiy2L8cneD1Q7ZvU9fIkSNEXwv7/8eUkPnLRJzn1N4TxkVN9AfPmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738854195; c=relaxed/simple;
	bh=LSK2yf28jD5sJvMwKhg90/RzqC4uJOW5uaqIzGSqv5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EyoCoSRPQVpzuhKOJq87Sx3/zlpQtCAunB+05f7bU50J14prTUjx46jG9HBF8OiLGyY4sHi+Zld9JRnxhXbWdYedmi5uXXo+kFc1EY5nepct7Tk/D/CNar6qC04uMRHIP3OxEoDj1lYarbn+XaXIVPIWViX+thGfwCqpPMt+GGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=u6R6E/4t; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBApUJTY67vnyriSHhbxCxW2Hcg6msUTd27wMvhTNmFGH52visnjgJLnhF7tUYIaCMCf6EhHumS9yMA5u5lUPjFiuIRCpoAWur+T+xHJ1eylNp/AkY24/fPcjDKHOK77vitkjLXxs+T9/keNXmrs2bU+k7DSPnQLGr5vetEiuWr1qDYaKjTfp2yO0HVZLZ30z3ptbjRZcmB8UWk4kph+N54QgHX07oWqbcEe87KpKCXJypzyuGhCHUvVHB1mKPq1iVCnYsIQtOgu4Pn/zQhU2LblLAlV0c/rNBPngMrEqQN1jExR+cSeYUku2YmkKT4Pg+K8TSgF+1ucnJ1w87+eWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq11dvumKz2UtgIuL+McONR7qvQ3eRf/WfKo2zQwxXk=;
 b=wP8piqzeFlCHOKQl5wXRDf5u4Ijl8YWVGYw6Wao/uYIKON0nl1qKrl8vNSCYi/CMUVvdeJUJrAeNfHqhqFkk21yL2ROTTOIqukEYkF5Xg62tpqxV36SmCs4qnGxZFglKp6oyesuxLsvgan33Qj1gwJgP8oeSC1Z6hl4dMSUXTuKZXTSiJHw6QmSNy2DWjecd9SaTS3cs8Nw63y7u961Qb84FgmvyFosRjnQqSARr2kUquO+6bGY16T6f4ckqiJuGklrWRgawyLtXphoMotnzVlDxUafhaNaJjV9eLRyCaF+HeKnYlJJQmvN9rqjUnJjAZcJjjHf+9CGUsZhnctOsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq11dvumKz2UtgIuL+McONR7qvQ3eRf/WfKo2zQwxXk=;
 b=u6R6E/4tyb1EU/sg6YBnx1YYT0GSaRAagavMDrBU6Zu1iPpYBKf5lpFSe1HkHENhxddZ/+WlQy7pZC4bMM/JD/U/inMDR3e1u3wSkOr4nWYnn+AVcjVGtmP+NjnxL+6IHDB8fI7ZWv/2Sm5xc2WUAt2qE5QaaEmbw4kR8DYDxpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TY4PR01MB14539.jpnprd01.prod.outlook.com (2603:1096:405:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 15:03:08 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 15:03:08 +0000
Date: Thu, 6 Feb 2025 16:02:33 +0100
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/14] clk: renesas: Add support for RZ/T2H family clock
Message-ID: <Z6TMwF9s6hyyfPgC@superbuilder>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
 <f52b6bda-1606-44da-bc5e-6fcfdfbaa3ae@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f52b6bda-1606-44da-bc5e-6fcfdfbaa3ae@bp.renesas.com>
X-ClientProxiedBy: PAZP264CA0247.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:239::7) To TYCPR01MB11492.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11492:EE_|TY4PR01MB14539:EE_
X-MS-Office365-Filtering-Correlation-Id: 0010f50f-8d99-4582-b57a-08dd46bf5d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FosoQFS1nD6EeIoDGRmaexi6kCh5rtzhx+LnMOEi4Nfck3Nzimhlz3cG++j9?=
 =?us-ascii?Q?30qHlCbLNXz16hX6oqx5As+NRR4eNQxD9j2YI8SxfBdEydkX9z7RpWQvM3Mq?=
 =?us-ascii?Q?PxzjOoLH/JiY+SXAuQGexIpZYn2SaC3htekKoUW+JS8rXcy8coT5RH+aMiv/?=
 =?us-ascii?Q?oL83sY3A6cIKrUpJHOCHwCq4F+nX1xUxEZkgwvriosF/ENTPz1Bxc5E66YnO?=
 =?us-ascii?Q?ZmDUAyKoCSJTZH/y54S88qxLO+5cq0w0yOvcCEB06aE+IgkyEy5CWjFc3mNn?=
 =?us-ascii?Q?2tU7trEplC8Ef1W0kBKaPP4xc9VVLgjpKmyc10SUljBOKw3XlL3dozFzKAGz?=
 =?us-ascii?Q?YTiIaNYuWYAceV0XemNVTBsoI25btO/5kXUaF4MxA0IgLUeU8fkgBbQI8Bl3?=
 =?us-ascii?Q?R9Rds9vlaEgW+NrGUxOz64J3yiPRqOVyeaq8WYY+yJ2mvrHoCFCdWhF3sN3J?=
 =?us-ascii?Q?wL34KWGrgK+ejwPEEVhT1Em4zVCkPUd7hZE3/yIFKQ+jqE4gRx4gUqe8Mqbo?=
 =?us-ascii?Q?d8Z5RaVxLG8d+XZy0dNYZIBoZgABLWn7MqKPKvZInnwG9OL2juhMalW43+oK?=
 =?us-ascii?Q?5RrOXOm27PaxpVkYqYaDJqvI8sGX+CiYIMnPngVT97ltwJDdwafEd+lNQ+h9?=
 =?us-ascii?Q?XoB5zp3E7nk4whF9aRfl+fSbW5z6J24pmsOWoYOysDM+CsOesln/0Z8WNhLD?=
 =?us-ascii?Q?p5Bor/J3oOQs/svlAtCLB50f2z8+h5+n2XzI+6GpizVnkaXmQO2jWGZ7ETiQ?=
 =?us-ascii?Q?8ZhjSb5Dmb4PwI7Vibaiqb0U8X+VktozOLFtIqBgdBLTzgb/sFcW54N0+UBT?=
 =?us-ascii?Q?oWnyd07dHh6Cwad8mRmR7kd2cQvsIsjxoDKkawhL/6GKwsFrUdhdWqspffr2?=
 =?us-ascii?Q?3Ptk/VZ1JJXsyNbUPcUGB+TNAHzBinsfZyTGt+euwAn+6eaWkvzo1KKvCs74?=
 =?us-ascii?Q?SDW5P/hMvj5UZ4fOYGHiB327gyfTr+UTeMvY6gbuWjub3nKJhV7+AORqliGx?=
 =?us-ascii?Q?jeQM5mEU4OkvnuMTQii+iwdWCLfpFxyiL1zAkId2Ct3A7hGqZkX7GK5uTYIo?=
 =?us-ascii?Q?rcxrBkJWROeDujYhoxa+UK9vdE3pRfX4CYe6FhcT0kFMi7qCzpVwQBGULoo4?=
 =?us-ascii?Q?1J2gmOL7NxtZBJuJB4QrtXdcjs2xaToV+Lt+ooacnq+GgS5rOPR9emVdmIjh?=
 =?us-ascii?Q?kQDw4SwJTqnxXa3SASXhMzcVrlujjjLGf6wLodAW4mt9RfRUJWDQZrWvg4L+?=
 =?us-ascii?Q?rZumb/iKH6eajCuPbrEF54YE+lKP8CfYwt0CFVI2SqedwQ+VnD3t8YJ/U/FZ?=
 =?us-ascii?Q?2Q4d1dUydLZ/iI/g+04JxzlS51v0ss9Ss7BN+LeTnKKYfKeAXBVseTDf8MA7?=
 =?us-ascii?Q?6T7PITssAORp5IDS2MXa40Nlps+r1R5XkpiZrfDFDtqMT9unW2xSk8Keaf3R?=
 =?us-ascii?Q?p7FHhRqWdh9ftqoJ4GTUoTPHlizWBm3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0jBLTiGtgF07Ylx1MTIWe6mIa/OyxFUJjNzME3HM+AUwMOl4/utgcT8YFzXg?=
 =?us-ascii?Q?aNL1v8T5GszTDhXjXejRC9PlUJO31nxSIsWpmq9yAehyq/gVLbu6HY/2emLp?=
 =?us-ascii?Q?6S5U79xMjBaMT3VVQ3v7JBcz112fc48t2JCcTvVhS1fzDPlKtlVxRr4raE/k?=
 =?us-ascii?Q?Grn45uFyRwZf6LgjrshPcnePTmnx1TQ0/WBC+p5Ak1D1PnoqFTnn4FtGnWPF?=
 =?us-ascii?Q?Bji8EAyWeKcwUi12fGRlWDI4JENEUOs0rJL9FqHuXSxoShU9eqFjRLg2mK+k?=
 =?us-ascii?Q?I2Z2Br9jJnt8QXZ7NGWqJGdI9txNE4LSuMW3ofj7rsXVQC0aBCLanyUALDrK?=
 =?us-ascii?Q?amdeVbTSqGsZXZQS9BmBnUWpqsj1iG9k8drHBHZ8vDZ1QXy1csakIn2M0mNE?=
 =?us-ascii?Q?stz9O+eLnN8tdmAmrMdBqy5fKperUS9mbqA++QmWQDWiQiS2haIShGvHB0Gr?=
 =?us-ascii?Q?Bfk4VgXQOwLgEI8AOBHO+n5MNSeCv/KE8SbNYuUS6zI6L8cqBHohxqgoogZY?=
 =?us-ascii?Q?4qCbW3TSSHjXoaJbQJBgR0+JoIkwREjDHqHPlEPCmL2mmi6J7BjtY/QGjtZV?=
 =?us-ascii?Q?3TjgCUrS22/E+PpmY5DhwciJajPFqyIzP0d4mESgkr6XUrYN2cJpcJ9ceAXW?=
 =?us-ascii?Q?pMkMEeKapJwNELqq8hkYcjUGbd8XmAK7K45kMpwxBWJlqzYGevdc1J4CHZdj?=
 =?us-ascii?Q?Cb3lpDOAcKZGcWmwrXZmDV64frFef3CTNtDCYUP7pkj26Ys7ej22wD7dxKxE?=
 =?us-ascii?Q?633eZhlGW+0mj+fbAMsaivHH7WAUOFADVJGcSnUDKwE8BXosmUrchPZYsPYB?=
 =?us-ascii?Q?/5XgE5GRx0He6VfjPMPqWH4L55EelxLZwMOebDlt8umaSsuo5HgEkTPdcnxn?=
 =?us-ascii?Q?vQprvn56NMVsuIK9Cq6C0fzC+b807okNqA7cAcAAm8HST6CoL0xM4QCoR2ub?=
 =?us-ascii?Q?4ni8gus4IpHvUGzt7s+PkBx3q8d/4a2WmHuh/WEAIbAaOY9vG08vK4lsMduy?=
 =?us-ascii?Q?Sd37KBT7z9TK5iPstnPDX5ZiYobEzuer03NnKIxOEmupdgKgM1XVIm6GfSX0?=
 =?us-ascii?Q?+eWaFSB6oiEK9J5oBgkRSJO3a7twS7tXzHvEQ8btQYtx+nQwOEO5YJDBqkbg?=
 =?us-ascii?Q?CRwwpK9Qthujy5UDOqG25BASyEv+pa470XAAUxzXwUMxbbBNpuvA1uQ23YOx?=
 =?us-ascii?Q?LGKOOyiMSme72L5KnrtruUZW62KeBOJYAGTNs9OZ9z55cGTzq1D4n9wbG6NP?=
 =?us-ascii?Q?KT/ccDBdtEnWxxqh5HTK8zExCIIWyAH8tT77BczndFqSyZ5vPiQwXAd+y2Ep?=
 =?us-ascii?Q?EEXMGKpzhJYB36RbQI16EP4nXrtt5qazHfT8qt8pAjC9BSnA66R79AV6erju?=
 =?us-ascii?Q?E3pPXaV918Uwrawv10OzPqfZO9mben1WM8usut35RiryR23Bc6gQbgBwYKzd?=
 =?us-ascii?Q?Ffs6KsB3o+UiP1CculnICjFYinjJWwWvILkTN+PjtjMyauiEB57YBmQuczuM?=
 =?us-ascii?Q?xWLOJ8kA9BxGzAC1F6GP0W2D6YlTCzbciOHcH2ivalovQAT4P8Ng/zMSA7JU?=
 =?us-ascii?Q?x+usli8M+j23MJsSS5jhpFbGM6nsGBpgy/F9huTFCux7wjyVRPunCE7we4jq?=
 =?us-ascii?Q?uR8ScjpNz8jRpSTOPqTe17M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0010f50f-8d99-4582-b57a-08dd46bf5d63
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:03:07.9265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXU47vGMyBPcQm2RcKEW6pzIMaM6GsN54kacGDvctRceoQvpVBvWMm8QbqyoN1/vVtM2CrehBi2uO+r7rQkxBoKsfM9GqvlYIbCfL6DjMIbEoYNzofA0IcTPjxfM/pIL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14539

On Tue, Feb 04, 2025 at 04:14:29PM +0000, Paul Barker wrote:
> Hi Thierry,
> 
> On 29/01/2025 16:37, Thierry Bultel wrote:
> > Add the CPG driver for T2H family.
> > 
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > ---
> >  drivers/clk/renesas/Kconfig     |   4 +
> >  drivers/clk/renesas/Makefile    |   1 +
> >  drivers/clk/renesas/rzt2h-cpg.c | 549 ++++++++++++++++++++++++++++++++
> >  drivers/clk/renesas/rzt2h-cpg.h | 201 ++++++++++++
> >  4 files changed, 755 insertions(+)
> >  create mode 100644 drivers/clk/renesas/rzt2h-cpg.c
> >  create mode 100644 drivers/clk/renesas/rzt2h-cpg.h
> 
> [snip]
> 
> > diff --git a/drivers/clk/renesas/rzt2h-cpg.c b/drivers/clk/renesas/rzt2h-cpg.c
> > new file mode 100644
> > index 000000000000..79dacbd2b186
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzt2h-cpg.c
> 
> [snip]
> 
> > +struct pll_clk {
> > +	void __iomem *base;
> > +	struct rzt2h_cpg_priv *priv;
> > +	struct clk_hw hw;
> > +	unsigned int conf;
> > +	unsigned int type;
> > +};
> > +#define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
> 
> Please add a blank line between these definitions.
> 
> > +
> > +static struct clk
> > +*rzt2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> 
> The '*' is part of the type so should be on the previous line. i.e.
> 
>     static struct clk *
>     rzt2h_cpg_clk_src_twocell_get(...)
> 
> > +			       void *data)
> > +{
> > +	unsigned int clkidx = clkspec->args[1];
> > +	struct rzt2h_cpg_priv *priv = data;
> > +	struct device *dev = priv->dev;
> > +	const char *type;
> > +	struct clk *clk;
> > +
> > +	switch (clkspec->args[0]) {
> > +	case CPG_CORE:
> > +		type = "core";
> > +		if (clkidx > priv->last_dt_core_clk) {
> > +			dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
> > +			return ERR_PTR(-EINVAL);
> > +		}
> > +		clk = priv->clks[clkidx];
> > +		break;
> > +
> > +	case CPG_MOD:
> > +		type = "module";
> > +		if (clkidx >= priv->num_mod_clks) {
> > +			dev_err(dev, "Invalid %s clock index %u\n", type,
> > +				clkidx);
> > +			return ERR_PTR(-EINVAL);
> > +		}
> > +		clk = priv->clks[priv->num_core_clks + clkidx];
> > +		break;
> > +
> > +	default:
> > +		dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args[0]);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	if (IS_ERR(clk))
> > +		dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
> > +			PTR_ERR(clk));
> > +	else
> > +		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> > +			clkspec->args[0], clkspec->args[1], clk,
> > +			clk_get_rate(clk));
> > +	return clk;
> > +}
> > +
> > +static void __init
> > +rzt2h_cpg_register_core_clk(const struct cpg_core_clk *core,
> > +			    const struct rzt2h_cpg_info *info,
> > +			    struct rzt2h_cpg_priv *priv)
> > +{
> > +	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
> > +	unsigned int id = core->id, div = core->div;
> > +	struct device *dev = priv->dev;
> > +	const char *parent_name;
> > +
> > +	WARN_DEBUG(id >= priv->num_core_clks);
> > +	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
> > +
> > +	/* Skip NULLified clock */
> > +	if (!core->name)
> > +		return;
> > +
> > +	switch (core->type) {
> > +	case CLK_TYPE_IN:
> > +		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
> > +		break;
> > +	case CLK_TYPE_FF:
> > +		WARN_DEBUG(core->parent >= priv->num_core_clks);
> > +		parent = priv->clks[core->parent];
> > +		if (IS_ERR(parent)) {
> > +			clk = parent;
> > +			goto fail;
> > +		}
> > +
> > +		parent_name = __clk_get_name(parent);
> > +		clk = clk_register_fixed_factor(NULL, core->name,
> > +						parent_name, CLK_SET_RATE_PARENT,
> > +						core->mult, div);
> > +		break;
> > +	case CLK_TYPE_DIV:
> > +		if (core->sel_base > 0)
> > +			clk = rzt2h_cpg_div_clk_register(core,
> > +							 priv->cpg_base1, priv);
> > +		else
> > +			clk = rzt2h_cpg_div_clk_register(core,
> > +							 priv->cpg_base0, priv);
> > +		break;
> > +	case CLK_TYPE_MUX:
> > +		clk = rzt2h_cpg_mux_clk_register(core, priv->cpg_base0, priv);
> > +		break;
> > +	default:
> > +		goto fail;
> 
> I would prefer `clk = ERR_PTR(-EOPNOTSUPP);` here instead of at the top
> of the function so that it's easier to see at a glance what is
> happening.
> 
> > +	}
> > +
> > +	if (IS_ERR_OR_NULL(clk))
> > +		goto fail;
> > +
> > +	priv->clks[id] = clk;
> > +	return;
> > +
> > +fail:
> > +	dev_err(dev, "Failed to register %s clock %s: %ld\n", "core",
> > +		core->name, PTR_ERR(clk));
> > +}
> > +
> > +/**
> > + * struct mstp_clock - MSTP gating clock
> > + *
> > + * @hw: handle between common and hardware-specific interfaces
> > + * @priv: CPG/MSTP private data
> > + * @sibling: pointer to the other coupled clock
> > + * @baseaddr: register base address
> > + * @enabled: soft state of the clock, if it is coupled with another clock
> > + * @off: register offset
> > + * @bit: ON/MON bit
> > + */
> > +struct mstp_clock {
> > +	struct rzt2h_cpg_priv *priv;
> > +	struct mstp_clock *sibling;
> > +	void __iomem *baseaddr;
> > +	struct clk_hw hw;
> > +	bool enabled;
> > +	u32 off;
> > +	u8 bit;
> > +};
> > +#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
> > +static int rzt2h_mod_clock_is_enabled(struct clk_hw *hw)
> 
> Please add blank lines between these three definitions.
> 
> > +{
> > +	struct mstp_clock *clock = to_mod_clock(hw);
> > +	struct rzt2h_cpg_priv *priv = clock->priv;
> > +	u32 bitmask = BIT(clock->bit);
> > +	u32 value;
> > +
> > +	if (!clock->off) {
> > +		dev_dbg(priv->dev, "%pC does not support ON/OFF\n",  hw->clk);
> > +		return 1;
> > +	}
> > +	value = readl(clock->baseaddr + clock->off);
> > +
> > +	/* For all Module Stop registers, read bit meaning is as such:
> > +	 * 0: Release from the module-stop state
> > +	 * 1: Transition to the module-stop state is made
> > +	*/
> > +
> > +	return !(value & bitmask);
> > +}
> > +
> > +static const struct clk_ops rzt2h_mod_clock_ops = {
> > +	.is_enabled = rzt2h_mod_clock_is_enabled,
> > +};
> > +
> > +static void __init
> > +rzt2h_cpg_register_mod_clk(const struct rzt2h_mod_clk *mod,
> > +			   const struct rzt2h_cpg_info *info,
> > +			   struct rzt2h_cpg_priv *priv)
> > +{
> > +	struct mstp_clock *clock = NULL;
> > +	struct device *dev = priv->dev;
> > +	unsigned int id = mod->id;
> > +	struct clk_init_data init;
> > +	struct clk *parent, *clk;
> > +	const char *parent_name;
> > +	unsigned int i;
> > +
> > +	WARN_DEBUG(id < priv->num_core_clks);
> > +	WARN_DEBUG(id >= priv->num_core_clks + priv->num_mod_clks);
> > +	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
> > +	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
> > +
> > +	/* Skip NULLified clock */
> > +	if (!mod->name)
> > +		return;
> > +
> > +	parent = priv->clks[mod->parent];
> > +	if (IS_ERR(parent)) {
> > +		clk = parent;
> > +		goto fail;
> > +	}
> > +
> > +	clock = devm_kzalloc(dev, sizeof(*clock), GFP_KERNEL);
> > +	if (!clock) {
> > +		clk = ERR_PTR(-ENOMEM);
> > +		goto fail;
> > +	}
> > +
> > +	init.name = mod->name;
> > +	init.ops = &rzt2h_mod_clock_ops;
> > +	init.flags = CLK_SET_RATE_PARENT;
> > +	for (i = 0; i < info->num_crit_mod_clks; i++)
> > +		if (id == info->crit_mod_clks[i]) {
> > +			dev_dbg(dev, "CPG %s setting CLK_IS_CRITICAL\n",
> > +				mod->name);
> > +			init.flags |= CLK_IS_CRITICAL;
> > +			break;
> > +		}
> > +
> > +	parent_name = __clk_get_name(parent);
> > +	init.parent_names = &parent_name;
> > +	init.num_parents = 1;
> > +
> > +	clock->off = mod->addr;
> > +	clock->bit = mod->bit;
> > +	clock->baseaddr = mod->sel_base ? priv->cpg_base1 : priv->cpg_base0;
> > +	clock->priv = priv;
> > +	clock->hw.init = &init;
> 
> Both init and parent_name are local variables and can't be used after we
> return from this function. So we mustn't store pointers to them into
> objects that have a longer lifetime.
> 
> Could we add init and parent_name members to struct mstp_clock, then use
> clock->init and clock->parent_name instead of the local variables?

Yes indeed, but notice that similar renesas drivers (rzg2l-cpg, rzv2h-cpg), and
quite a lot of other ones, do exactly the same way.
This is because devm_clk_hw_register() ends in calling __clk_register(),
that dups the provided name and copies the other fields from clk_init_data
I think it is fine to let it as it is.

> 
> > +
> > +	clk = devm_clk_register(dev, &clock->hw);
> > +	if (IS_ERR(clk))
> > +		goto fail;
> > +
> > +	priv->clks[id] = clk;
> > +
> > +	return;
> > +
> > +fail:
> > +	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
> > +		mod->name, PTR_ERR(clk));
> > +}
> > +
> > +static bool rzt2h_cpg_is_pm_clk(const struct of_phandle_args *clkspec)
> > +{
> > +	if (clkspec->args_count != 2)
> > +		return false;
> > +
> > +	switch (clkspec->args[0]) {
> > +	case CPG_MOD:
> > +		return true;
> > +
> > +	default:
> > +		return false;
> > +	}
> 
> Can we replace this switch statement with:
> 
>     return (clkspec->args[0] == CPG_MOD);
> 
> > +}
> > +
> > +static int rzt2h_cpg_attach_dev(struct generic_pm_domain *unused, struct device *dev)
> > +{
> > +	struct device_node *np = dev->of_node;
> > +	struct of_phandle_args clkspec;
> > +	unsigned int i = 0;
> > +	bool once = true;
> > +	struct clk *clk;
> > +	int error;
> > +
> > +	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
> > +					   &clkspec)) {
> > +		if (!rzt2h_cpg_is_pm_clk(&clkspec)) {
> > +			of_node_put(clkspec.np);
> > +			continue;
> > +		}
> > +
> > +		if (once) {
> 
> Can we just use `if (!i)` here and drop the `once` variable?
> 
> > +			once = false;
> > +			error = pm_clk_create(dev);
> > +			if (error) {
> > +				of_node_put(clkspec.np);
> > +				goto err;
> > +			}
> > +		}
> > +		clk = of_clk_get_from_provider(&clkspec);
> > +		of_node_put(clkspec.np);
> > +		if (IS_ERR(clk)) {
> > +			error = PTR_ERR(clk);
> > +			goto fail_destroy;
> > +		}
> > +		error = pm_clk_add_clk(dev, clk);
> > +		if (error) {
> > +			dev_err(dev, "pm_clk_add_clk failed %d\n", error);
> > +			goto fail_put;
> > +		}
> > +		i++;
> > +	}
> > +
> > +	return 0;
> > +
> > +fail_put:
> > +	clk_put(clk);
> > +
> > +fail_destroy:
> > +	pm_clk_destroy(dev);
> > +err:
> > +	return error;
> > +}
> 
> [snip]
> 
> > +static const struct of_device_id rzt2h_cpg_match[] = {
> > +#ifdef CONFIG_CLK_R9A09G077
> > +	{
> > +		.compatible = "renesas,r9a09g077-cpg",
> > +		.data = &r9a09g077_cpg_info,
> > +	},
> > +#endif
> 
> CONFIG_CLK_R9A09G077 and r9a09g077_cpg_info are not defined until the
> subsequent patch. We should move this entry to the next patch, and leave
> this array empty here.
> 
> For comparison see how the RZ/V2H CPG driver was added in the following
> commits:
> 
>     dd22e5621749 ("clk: renesas: Add family-specific clock driver for RZ/V2H(P)")
>     36932cbc3e6c ("clk: renesas: Add RZ/V2H(P) CPG driver")
> 
> > +	{ /* sentinel */ }
> > +};
> 
> [snip]
> 
> > diff --git a/drivers/clk/renesas/rzt2h-cpg.h b/drivers/clk/renesas/rzt2h-cpg.h
> > new file mode 100644
> > index 000000000000..d9d28608e4c3
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzt2h-cpg.h
> 
> [snip]
> 
> > +/**
> > + * struct rzt2_cpg_info - SoC-specific CPG Description
> > + *
> > + * @core_clks: Array of Core Clock definitions
> > + * @num_core_clks: Number of entries in core_clks[]
> > + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> > + * @num_total_core_clks: Total number of Core Clocks (exported + internal)
> > + *
> > + * @mod_clks: Array of Module Clock definitions
> > + * @num_mod_clks: Number of entries in mod_clks[]
> > + * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
> > + *
> > + * @resets: Array of Module Reset definitions
> > + * @num_resets: Number of entries in resets[]
> > + *
> > + * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
> > + *                 should not be disabled without a knowledgeable driver
> > + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> > + */
> > +struct rzt2h_cpg_info {
> > +	/* Core Clocks */
> > +	const struct cpg_core_clk *core_clks;
> > +	unsigned int num_core_clks;
> > +	unsigned int last_dt_core_clk;
> > +	unsigned int num_total_core_clks;
> > +
> > +	/* Module Clocks */
> > +	const struct rzt2h_mod_clk *mod_clks;
> > +	unsigned int num_mod_clks;
> > +	unsigned int num_hw_mod_clks;
> > +
> > +	/* Resets */
> > +	const struct rzt2h_reset *resets;
> > +	unsigned int num_resets;
> > +
> > +	/* Critical Module Clocks that should not be disabled */
> > +	const unsigned int *crit_mod_clks;
> > +	unsigned int num_crit_mod_clks;
> 
> It looks like resets and crit_mod_clks are not populated in this initial
> patch series. We can drop support for both of these from this patch
> series.
> 
> > +};
> > +
> > +extern const struct rzt2h_cpg_info r9a09g077_cpg_info;
> > +
> > +#endif
> 
> -- 
> Paul Barker






