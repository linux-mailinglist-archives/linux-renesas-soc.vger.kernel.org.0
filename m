Return-Path: <linux-renesas-soc+bounces-26322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DADCF8EA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 15:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A53B8300214F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 14:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CF932F75B;
	Tue,  6 Jan 2026 14:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gOsuizIk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC432D0D0;
	Tue,  6 Jan 2026 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710962; cv=fail; b=OE2PwG3y4aR8RdsZPgvGTnWFdoK2ONCbUioXmUqOFfy1sVIS3CZ3Vl4s++INnLf2Ft2zFilXxvMUB5kEFsNKsZ37P2HSLoK4AWripMpwOEYYgKYIAzKkrE+OTmmOtBKjAH1yDHO5287rEml5EI3VddoY65VpB+u1VXP59RuY0n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710962; c=relaxed/simple;
	bh=KSdYEVbCxmn/f4nTgDm0SLNBvBcbQn31++hlt9eKIgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uRJD4dj7WzUyvv/YTt9Y6yAmTFXl/j6NvbENUYNH5O+pweDkNRCnNGfDq/IhJchMeKiLwf2bp/NDoW2JbV1sc1OttMDPmJ3yUcYrwKGYcU51FWDgAldSCZXBUzKP2hJZs5WCAL57Qv9FJjnLbiIdGlYj0Vr3mnowlmOWRKFpRFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gOsuizIk; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbrK1YaghzoRkPv4OFpU25i26ovmDNHi/qGfJ6SBcAwj1+3/krCQDNSpnb3mk2Ue0GtRP/elkK+WtFYPNn6QPPnHDpLSmRMjAZ5SL1QkJRDNfFV4hJMkVj4lr9FcEvrGGqjYQ8FXfjLTGaldredOIxpwEYtjLeqFRXTw+yvZE99yLsk+Q1fJ6pKhQwZFUGRSddBmgFpYjFsneS+JGmF6QRyMwmwQW81hfyFKOhucKE2reb+N8GHLePGaB1X62N0lSABGuT7eAhYedLxJEAw94PZ8NZ15Zq5fpddcHiGG5ytnTzmVEuWeLNJX4al+OEkv013XTYrZjTryPs9Yr44HPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQDd1KGH+CrgSwr5g7Bt72ZQCKK1PNyQN/MLiMD5BBk=;
 b=J5s+M5h2jBIHGKmVsAWKuNN5ysSlPxe7AcBECfTnIRdbUzeq+74HQP2mxYclQhxaovAEBdb3RTzc5eSEJ1GhemCqXwm3FyOYh1z+qtDZPTj4nIkhnAgfsxGYOmXMJFduGsVggjDUT/UAlMSV0JjuWczqeHZUJABei3C9IdH+U4IAcqx9PgjsFDbIbAo05xo+V79yJ3qQcKVhteOGBkWKKiTypdcK5Om3LO9+W79wxiG3GxmsqlHRMKVo3pcZ4cWvTB6OIDjC/d8KiU182rW1g12rCVWITy4GuQ+goR5QHzxl+1nIMQpFTimj19uieWVgYpBbA0EVuWh60YbiRo1B6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQDd1KGH+CrgSwr5g7Bt72ZQCKK1PNyQN/MLiMD5BBk=;
 b=gOsuizIkcfGEiNtvZQyB2yuftV7LNIjV4hcL1GyKFoJpssGyMkOa7rC3wOqhECaL/UxNXFx7Sdfd5KcqGcJxCO2CYIsa+uyk9DF73FTEWX4RSEjDYumeG/LOZHtwmIQlLMmW+dWlX2YWauEiruwPOYFKxRMfYO1lueF4IdFjpatYQXMKoUp3gApl7tkRmevizU+PRpoKlAkiMSLjEAuGh62MUEV/4aMxzcNy6Ja+sbhJF4Ljn9yIE7vms8A4b5BCfE03+Ag0jcr1lNgGwyD1JLRT57AAxxwbmG0qTYuCdSfGLSlRUvLXVjNoIOFtEL1bat7SJSuAq4SpraB498nNJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 14:49:17 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 14:49:17 +0000
Date: Tue, 6 Jan 2026 09:49:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aV0g5j01beuz5CO+@lizhi-Precision-Tower-5810>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
 <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: PH7P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::24) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a34889c-d01c-486d-6b8f-08de4d32c421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MDtPTrmIhGmicT7BHkyxmv5xqluw59ROYhAuMYJLM5deDrZXC7TfFvDcnk82?=
 =?us-ascii?Q?w75oVNveay8gELiOebTiK0zrvYSm21j5Voi2/Rzx+/mvvjL0l+feElCCMzK5?=
 =?us-ascii?Q?k4Yaj75yDRt00szoVebPkeBb2hX3/WVqm36IF2qU197kdR3l1IPaussJ9EF8?=
 =?us-ascii?Q?Kv/EiTPhRRi2S9N75jvevaByOxhrg1xLVwou+/+4Kdc1BpgDm7t8t4ZcLXo9?=
 =?us-ascii?Q?gJY4E95HDbdPEFT4XWSgyPv901M5WcU7+z4wob++1L/7ALtrlbQdIf6ih+UW?=
 =?us-ascii?Q?z4OhXCh5qSkO06aLa5pbUW+S61nV2jSHTA3qL5JzbGQJhK8G1LX1H5NklOr9?=
 =?us-ascii?Q?VgNPLUVpo7L7QU4Npv+iLvDVDLjM58CmGIMSbbfF7gwuabGr5f1zv00ScxDG?=
 =?us-ascii?Q?1wozzBwxoGxRgGPDWPr4RIP9SePaXR7ZVCl5jIUHsfsznaqSprQsHN4WVtKf?=
 =?us-ascii?Q?TWYtx8b7erCc1Fo9BT47FXD7sLG4GEbLIsEM2OkBY2vp30whdrY+mBkqPj1t?=
 =?us-ascii?Q?hePmgI2CwXZ/P1X3vGe7iIxRo2VyI6HvJ015uHFCxViajZ3//eFUPajdwgIS?=
 =?us-ascii?Q?qKELo/VWYS4TTmGu7KGR+WqBUvLgguOQ3ZWFuz/Rtt6Jk2Z/B46sbk2kUF7i?=
 =?us-ascii?Q?vyPYaGGDWgFKRZMoMWO1CzOW7sdV/ppJQCfPezuK7+U5UL5e2ZRNcoUyJ9ad?=
 =?us-ascii?Q?Q/ZLMmNABKrlEukaEOMyFBeYHla2W2LwqNovShUPxEXgNGLT8NH3vy75Flwp?=
 =?us-ascii?Q?PloJE7Slv2QpQ6frULB5haj43y93O3YO2cP4ZVbmAlrEvN/3nJzs/YqObmKP?=
 =?us-ascii?Q?a8ahKxOR6HQyM+JzRpka5ELVNOhniElX8b6LCPWnWQgaMNJFSt2nChk1rwDc?=
 =?us-ascii?Q?bawAVbNYyEktcPGqA3KSyvGtNeCbY6xW2iSVx62EnyQDcx2v1Z2hPwebxILZ?=
 =?us-ascii?Q?VVU4x5StyDmcOogw5RIJJn5htGqOXBIWHSxbxTClr6KDqVWej1FRxXNucFlv?=
 =?us-ascii?Q?KWVI4YPMKGPMQOIDxy0JkyDDqWAMmhvcGNdhSq7U75Dsd3zb6zlrW16GOOP6?=
 =?us-ascii?Q?NjmUDTqasvKfCGUDF8xSG3/6vJjqzKa98tE3r9W8HimRuxy67p5ZZ7DW+d92?=
 =?us-ascii?Q?NONr2qUYhgJPMHVC0Opgv1iDnqeCOXnhThJm5embANY4Hl4D/Hbxl0fbICOy?=
 =?us-ascii?Q?Egq1G7lqDTKAH31Y7RFcrBiVtlu7YrdK8+4yHIXqiyZv3Z81YYJ9rAlnk3oX?=
 =?us-ascii?Q?J3/gok02LWd0v23i1WmJ4hLGJgTq79xDYYHCstEQibJyVuK1xD1aDho2GpNX?=
 =?us-ascii?Q?wFWieq/AlwlwOozmB3/8nfZfPsFiQRqNIfdM61KDDlVZ0eag8ROAs7enSxnh?=
 =?us-ascii?Q?1Zy519hNrbSKxMewW8pXLet2O81gYrFdYHUz1rzrgbYruA3ATb3anSjeF/yd?=
 =?us-ascii?Q?9+h5xOwCDX8y8o1ZCedlRn4EVio0LTN3EL5bGMRVooRHN5uMfIJirPJ3VKbl?=
 =?us-ascii?Q?clbz1DytFTXe9vY2p2xlJ/cq/ZAECMC/7C76?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1sQA2cneFqnlw156lUQaLzQNsgp+m9uvuaB1mBrbi2ozXn2oXK6HEHSEJO3O?=
 =?us-ascii?Q?zncCz800w2t8oon3egQsYTemInP/ph/XJNJRs6vmDSlReE+xuW8hL+7G5f0L?=
 =?us-ascii?Q?6MGQmAd69KCosCBY55pP5ZcSOo7ZZT4395ag+U6bUgItOnHyoei4yg3N7rn7?=
 =?us-ascii?Q?6avLDUDAfr+kmsEM4CscrS8W7L9UnDb/i7IAXROrl7fibAhuVTukmpis5FIP?=
 =?us-ascii?Q?14RCh4/xiva3gx5PsEn/pg6SPVMNBzKOwlfUmpcHH7ywkZ5WSXwYze3fgf1t?=
 =?us-ascii?Q?XSiht9iCWar4OEgRm9Sgvlxi4DIqQ0yixiKZpWGfbvOzBunrTIhaU1qcgIlc?=
 =?us-ascii?Q?7gFegLiSCwEsgP1PlRKniQLrsLbvUp0gqxqAcNqb6Kbp5LXqZRuz5eh1i/Qg?=
 =?us-ascii?Q?Vm5RmMtX2vttUnvoCq1OZ7+gD3Fa5sNi2ri0dfdNSzpFLay0JcuM5f4VsdMb?=
 =?us-ascii?Q?gDhXwx1QcM8k+r2Yl9C//u1j6hPD3uvyJujzVrrHFAXOerfe2hYhAJlxSbnh?=
 =?us-ascii?Q?PRcKZWOCf6Gxa97jQa4S3XH5pAu0jRFABm3JmzvUD/6k7xFkv5gt9xApHSuJ?=
 =?us-ascii?Q?CcjjH10q8LSD18dsl8i9oqTskkfAqjrK0T5hu1pdzkOQ4OOlLt7Dl6MDM8FR?=
 =?us-ascii?Q?FN/ERXSJweup+6zSoYn6zTrOz5UnO4N5hIBUe2zIbHtIrtv6gcXQgn1xEP6M?=
 =?us-ascii?Q?z6gEy8pH+tmFEGmYpxaovM8qtdWFal7NMkjDiGucdQBKXlwqd9PqkXOB17Vj?=
 =?us-ascii?Q?ufJyjDIy1jBFbhGjzU6oR/T17ZQwe4nbTpyDaffFW7aCKHFBZt764ey2qsFF?=
 =?us-ascii?Q?pVesAPMeRHj6FqTmH9BxtySusntxMf0vJ7J7ANR6ZWPxIzn1N/IhHD8bpYlx?=
 =?us-ascii?Q?OEaqkUZ3JFF9Yu7xhtofoFtWT8wosjOJw/hkQJOfkdy/bwiRze3pkYAG1J1r?=
 =?us-ascii?Q?MQ7ZEF3Ax1kCHSFOPRNpoLJhyXUXF+nEtv/UZ6peploFhsZ5HzQ4x/dWkAwd?=
 =?us-ascii?Q?jOiEAHehVb4e+2wj7oees1aIfsiQOJCBeV3dPsjD7W33YgCFnHCcaGLdte83?=
 =?us-ascii?Q?WlqfOkzvb4xRvqaQn/ENEqoS/i/LKJ8rkkSfMBdbhuR/blFuxunGl+DtmWtT?=
 =?us-ascii?Q?zR94bdKLBKnietlfzAeFsuqTmBoc1nMo3tDgSUGkiB6KhYPRVGh8SmKEA/Ew?=
 =?us-ascii?Q?TgvEnrqsSj1wujcZoJPSDjLSzo3VJvcsJ58tmpLzjqK5xsHTadHA8x9ayhBx?=
 =?us-ascii?Q?nLUaPpVv9pZZAC4R1I3GggZKRAZrkUJZwig6Vyr7IpzZtXwjYHd0AoXJ09Dv?=
 =?us-ascii?Q?PxXfHryu7c2qdh1eRgdSbSCeOPYD51owzWRQyapyk2FWyxUtMfIRFr8BQxZh?=
 =?us-ascii?Q?cpJpm7eKzGS8oW3PXFNcFsFnp3EyT4NNYEgwfHwOiox53xbNd3JkJg+Jer4H?=
 =?us-ascii?Q?vrwcSpuDc2qX+swIrlGRrmX6FnmXhlu67OzVDFCdzCvia3fKTj4Z89JVCMFm?=
 =?us-ascii?Q?ol0Q+UYWMF9gHAk66Wp9ymqTP2/6ZZu3Jl6Bgj2aBRJrc+Luw5Vwk80JgurW?=
 =?us-ascii?Q?nHv+JuWUhiZ/3jkksZt5vE9uhI6dtWmeSV82FBbzzf+/7zIYdP8cOmtcegVw?=
 =?us-ascii?Q?aUx2RWNX3T9vJvFvVrFkN7ww7j/+ZQus5sddf5IpUTB5WlTAVN9A2lrgny2D?=
 =?us-ascii?Q?spS8rna9Ck5W45fvIRUCiSjoRJFU1bH5T3gDZd11QJ4q8lx/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a34889c-d01c-486d-6b8f-08de4d32c421
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:49:16.9504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsJYWN1/DiKdb5NE7JzeZCJSxv3CHHcnf6v8u6KhmbUTpxaWf+4i59+JHjY4emjj/xvaMmztXw1/iogZA93pJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8420

On Mon, Jan 05, 2026 at 06:06:19PM +0000, Biju Das wrote:
> Hi Frank Li,
>
> > -----Original Message-----
> > From: Frank Li <Frank.li@nxp.com>
> > Sent: 05 January 2026 17:12
> > Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
> >
> > On Mon, Jan 05, 2026 at 11:49:59AM +0100, Tommaso Merciai wrote:
> > > Replace individual devm_clk_get_enabled() calls with the clk_bulk API
> > > and store the clock handles in the driver's private data structure.
> > >
> > > All clocks required by the controller are now acquired and enabled
> > > using devm_clk_bulk_get_all_enabled(), removing the need for per-SoC
> > > clock handling and the renesas_i3c_config data.
> > > The TCLK is accessed via a fixed index in the bulk clock array.
> > >
> > > Simplify the code and prepare the driver for upcoming suspend/resume
> > > support.
> > >
> > > No functional change intended.
> > >
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v3->v4:
> > >  - Collected Biju Das tag.
> > >
> > > v2->v3:
> > >  - Added define for TCLK index.
> > >  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
> > >  - Improved commit body.
> > >  - Dropped unnecessary static const char * const renesas_i3c_clks[].
> > >  - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
> > >
> > > v1->v2:
> > >  - New patch.
> > >
> > >  drivers/i3c/master/renesas-i3c.c | 43
> > > ++++++++------------------------
> > >  1 file changed, 11 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/renesas-i3c.c
> > > b/drivers/i3c/master/renesas-i3c.c
> > > index 426a418f29b6..1b8f4be9ad67 100644
> > > --- a/drivers/i3c/master/renesas-i3c.c
> > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > @@ -198,6 +198,8 @@
> > >  #define RENESAS_I3C_MAX_DEVS	8
> > >  #define I2C_INIT_MSG		-1
> > >
> > > +#define RENESAS_I3C_TCLK_IDX	1
> > > +
> > >  enum i3c_internal_state {
> > >  	I3C_INTERNAL_STATE_DISABLED,
> > >  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> > > @@ -259,7 +261,8 @@ struct renesas_i3c {
> > >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> > >  	struct renesas_i3c_xferqueue xferqueue;
> > >  	void __iomem *regs;
> > > -	struct clk *tclk;
> > > +	struct clk_bulk_data *clks;
> > > +	u8 num_clks;
> > >  };
> > >
> > >  struct renesas_i3c_i2c_dev_data {
> > > @@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
> > >  	const char *desc;
> > >  };
> > >
> > > -struct renesas_i3c_config {
> > > -	unsigned int has_pclkrw:1;
> > > -};
> > > -
> > >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32
> > > mask, u32 val)  {
> > >  	u32 data = readl(reg);
> > > @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> > >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> > >  	int ret;
> > >
> > > -	rate = clk_get_rate(i3c->tclk);
> > > +	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> > >  	if (!rate)
> > >  		return -EINVAL;
> > >
> > > @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct
> > > platform_device *pdev)  {
> > >  	struct renesas_i3c *i3c;
> > >  	struct reset_control *reset;
> > > -	struct clk *clk;
> > > -	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> > >  	int ret, i;
> > >
> > > -	if (!config)
> > > -		return -ENODATA;
> > > -
> > >  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> > >  	if (!i3c)
> > >  		return -ENOMEM;
> > > @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(i3c->regs))
> > >  		return PTR_ERR(i3c->regs);
> > >
> > > -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > > -	if (IS_ERR(clk))
> > > -		return PTR_ERR(clk);
> > > -
> > > -	if (config->has_pclkrw) {
> > > -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > > -		if (IS_ERR(clk))
> > > -			return PTR_ERR(clk);
> > > -	}
> > > +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> > > +	if (ret < 0)
> > > +		return ret;
> > >
> > > -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> > > -	if (IS_ERR(i3c->tclk))
> > > -		return PTR_ERR(i3c->tclk);
> > > +	i3c->num_clks = ret;
> >
> > Need check num_clks > RENESAS_I3C_TCLK_IDX to avoid outbound access at
> > i3c->clks[RENESAS_I3C_TCLK_IDX].clk
>
> I guess dt binding check validate this as well. Eg: a single clk defined
> in the DT instead of minimum 2, will give DT warnings.
>
> Do you expect additional check in C code as well?

Yes, worry about a wrong dtb cause kernel crash. Direct access
i3c->clks[RENESAS_I3C_TCLK_IDX] without check is risk.  if clock wrong in
dtb,generally, it just impact function. but this may cause crash. So I
suggest add addtional check here.

Or search 'tclk' in array i3c->clks.
for (i = 0; i < i3c->num_clks; i++)
	if (!strcmp("tclk", i3c->clks[i]->id))
		break;

Frank

>
> Cheers,
> Biju
>
>
> > >
> > >  	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> > >  	if (IS_ERR(reset))
> > > @@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> > >  	i3c_master_unregister(&i3c->base);
> > >  }
> > >
> > > -static const struct renesas_i3c_config empty_i3c_config = { -};
> > > -
> > > -static const struct renesas_i3c_config r9a09g047_i3c_config = {
> > > -	.has_pclkrw = 1,
> > > -};
> > > -
> > >  static const struct of_device_id renesas_i3c_of_ids[] = {
> > > -	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
> > > -	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
> > > +	{ .compatible = "renesas,r9a08g045-i3c" },
> > > +	{ .compatible = "renesas,r9a09g047-i3c" },
> > >  	{ /* sentinel */ },
> > >  };
> > >  MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
> > > --
> > > 2.43.0
> > >

