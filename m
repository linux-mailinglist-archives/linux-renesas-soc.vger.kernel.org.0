Return-Path: <linux-renesas-soc+bounces-12528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9968FA1CDEA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 20:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C746B7A11F9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 19:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA171632C8;
	Sun, 26 Jan 2025 19:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P9JLbfDa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD9D25A642;
	Sun, 26 Jan 2025 19:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918059; cv=fail; b=NSTgL/N6n6W/3mXsdS96xFN9/XS8VbHp1PU8Z2A/AVdaqFK2Bom+tEgKH2+Vw1p7FEOwwBvy64onORFm6u1dTVDcvrQ/AVZrOQGL+jRB0smOT9pekJWCihXlmHcEepW6HrW2MwssgAYttj5aWdhlpYvOKe+hlH8WkubqATl0tss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918059; c=relaxed/simple;
	bh=XBlHV77xoVyFgVWqQ58/TsRYMKnArfDvnFoDqsHo+8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=haTD2Y5wvip4YZHO29WV3enlyIoKIreKuE2JKwD25Jp5X4L3LLwxfAkbg6d/mVg+BPiGtN24fjJJERTn5jK0AGHxd3x47RJOpQiPOhpXL7Q+wmD/FaW4peLD1EMh7DRfR4PUHYrdsqgiAxGjcVj+AZ3W71JUsTn7eMufYJfEQpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=fail (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P9JLbfDa reason="signature verification failed"; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtosKL0VstGc0kMI0HEs/Ms6H8JfPM6RR2DXfRiJP2Gv1ISiwbm2Cvg92iA/LNE5OiQnXfFYW8Tri5diNdee3jT3DWL46/aYwlM3DzsFr3qHAVotF9+GraaqIXYGjxwcGlIRPGgcULVhYNdD7m5+JglWcdfrMd5Kuv6IPxlXfgJuETM1zcULqSjul0fdSwLG0AxA0vCMIGrE4pcZhK0n4rDeojshQOt7wsJ9qpLPG3Z4fon2M8QFzk8YrV3YSfszZiU5lfuwHjr7tr2uiosjc9VtidUCEV8IXao1HKRe6iW0NWxLCTH5iTh/UjnxQma0rPy4bAonit9Fsk48WFuudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXyuzIyi7crlm+fQ+yeh7gJYMrJwhEuUtpzA3Iw3H6I=;
 b=ENArpeIDylwpkWuDllYLXNhT5FKnTirNGm75Ubi6qC78QGnQ2SLOn5QNUrb3L4leuttA7IFS30O5frP6/kc+mzMhHEx1t9XqxqvnObhCjW76Yfr4kjzNRKWfof7xSRi4/GiQQswRSsgWzqA3POaCB9BEG+5XE6GZ3I9+J7QTa9vvtAu+Xys8xxzSjJuZS3wmXgKm9bHIx3ICu5i7t7Pkfiw3Bq4Mlmt1FSV63esIG6Zurab6j73inIiFfscO4xhY0ix29PAhjuL7dIaYQaVTHs7veF7atEnguLBHLIcTPmKjMspnujLzLPUCqN6alBTG8JNuwrqBDrG+mrSZPszA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXyuzIyi7crlm+fQ+yeh7gJYMrJwhEuUtpzA3Iw3H6I=;
 b=P9JLbfDahq9KS77qvFaWzhHl/FJrhcSCNm047dAv2rgmbcFLgSgTOdVrEVVPNLbhBTcsz3orBBHB4ekQ0DlXsnJL0cEJRMiQqIMZY2YqIPxJRd44OIhS9a+3zSGPHSi+K53sAZkRJ6dWeWAf13ZcPlmGXLIeqKbp+vOPd/FKQ3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 19:00:54 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 19:00:54 +0000
Date: Sun, 26 Jan 2025 20:00:45 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 4/7] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Message-ID: <Z5aGXVEzGt8pVFBl@tom-desktop>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126134616.37334-5-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::10) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: bee0d5b7-b87f-48e3-9e73-08dd3e3bc269
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?CKfvK7JvasTgD9nPAFa3i1ZajOMoH8khJirV7HKlyaerUlD3O3m9/ZbLDz?=
 =?iso-8859-1?Q?hiZReQMZxZLNKuCr3tWDM7HB7/ja524uMXwihtLpR3+nq6ALGwdw7u6axz?=
 =?iso-8859-1?Q?JxJHGAD96EVWaMYg/wW/wSaBRoetR4hVaV8wGl4jjzqPHGUMy10deMdqGW?=
 =?iso-8859-1?Q?xQ2mU0t8/IvvuloWlnDPFrWpIeDpOzEbk66kjvwHbbNOFdiYrpEEZL5p75?=
 =?iso-8859-1?Q?bUs05k2C9zawXrrnqlD7QTcKelWIj+81deE6uVdlo2cwWLWpEMsMKG6TwT?=
 =?iso-8859-1?Q?otjs1xN/HovauXcpXKTqgnxDN3fh6Gjc0LEQ3nJNlMzO/YKSjf01pko8kW?=
 =?iso-8859-1?Q?PvZr/39f26VvJruOY+AYS079J+pZnDuoU561snOawA8Ncyibusmnac0Z3p?=
 =?iso-8859-1?Q?al/83gcv06It9g+Qe/WM42AnK453FqaQuNTzD7gz1WA3YrvxBge8GqWbAB?=
 =?iso-8859-1?Q?ciHBSIhf7sgkGBbHCBa2D3/iPlApvEVmI2o5z5AOKMli7L1HwQ89MByFHp?=
 =?iso-8859-1?Q?H2/vTXK6SYvE3ZGG/T8K16BE29bdv54IfQIpPWF7EJ/Q9G5Sct2s/FwHx/?=
 =?iso-8859-1?Q?j/CiTWnsnc86y++LMKG04qQ8xJTZQdmVFnwjwAkRmYnT98+4JkJvSOPtKj?=
 =?iso-8859-1?Q?gVox/ZRjtFWTDssGr/cCxc82f/MI7m20G89rf9KhcPBa9BrHePr9dFAzMA?=
 =?iso-8859-1?Q?aBMViLdML1yQEU/z/cUTJxs+fuPyIShYB0C+SZE4Gzq+E30D1tKLxCydYj?=
 =?iso-8859-1?Q?UQsKr+a3AAKn9QeL05023pdd4V3l7lDesxsXhnsCVp30mg2LRh0lVR95sl?=
 =?iso-8859-1?Q?xb+iBEMGtUq/r3HVOinvUAZYmF6RtUlqnhpYJwJavikQU/3oe2Y38AUE5x?=
 =?iso-8859-1?Q?wEWvoA9K7hsAeGbK8SC/6TmA23eHbd97VZiKXg9ESPbpSKQcQeiz0REyQG?=
 =?iso-8859-1?Q?coLgYyM3ybuGOH3joUre9+aARdVpDf5OFdsJFTmiSGn9a3/WE6fRhJ+zFg?=
 =?iso-8859-1?Q?bARi3PTacB7+K+TVM/nozo+uY6vIFYUNZPo6RZLwX2Zltdwho5o2x3nsaw?=
 =?iso-8859-1?Q?BbGI5TxrrbiL/x/DllW0tsmT4TV/pRnDYcmDOs9z72L97Rx2MyAU1GEISS?=
 =?iso-8859-1?Q?CTJt3PHeA2yLUl3qJJWzr4YRDq5byLtN99eWcm3emea2Rij+1ezvgewlbf?=
 =?iso-8859-1?Q?L9KGpWfg/SQdzlqNQtWVA0waQlb6QU4gyFa6ngDt/tSSJHA3GumN9AXdhF?=
 =?iso-8859-1?Q?k/ipzQbAP8kwBM4Qv3K5dk12sWzMacWH0QF5ue5rycw0eOEqgqI/56zSnr?=
 =?iso-8859-1?Q?Uu85NH8SxxAM6aGYCdLETcKnnPP32DF3VkKbXV+2diSaBgN3iubS760h+O?=
 =?iso-8859-1?Q?3S17J3jWrcxARe4fxRdWLPySa8q4BQ0xACXbj6cdtaZUalTOmOpxwiQqS0?=
 =?iso-8859-1?Q?YxFRvhwLQgKJ8DSGrnVMIWimOfAqiWMMSWaUAWZz5meEE8sxTjUl9l09qN?=
 =?iso-8859-1?Q?5GV0P13IGGBq4XZEreR32K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9knkXZlqOOZ3mYF3I+fUe7ovdrPUw1fn7i2YvA0WeEwlLahr++Bxw/wdfh?=
 =?iso-8859-1?Q?wAKM4G2jE/IXNaSMp25aAE3nbBUbb5vyP3Ox54wabJDBqw4ul4zJ/2KHgJ?=
 =?iso-8859-1?Q?K2OvleW8EI8Z9MhY137VBWLUuV1Fi0QVeR90RBslxid1t1nCqTXCMAO4pi?=
 =?iso-8859-1?Q?0zX97wF2gWGxbel3AsrOl0i0Wwj9Jyqvg03UOyHhgWxZg3XStrAvXHKGFm?=
 =?iso-8859-1?Q?BzZAdgIXRX6BSFtRjAFUoYHHSewenc88gW58wfuv70g7msAQQE1BiGoPcC?=
 =?iso-8859-1?Q?cr8Nbv+jLL7AmlbL4/XajEoxRJzEQcrXLZ7BpA57S1ZKjTDkGAdAaCTFSH?=
 =?iso-8859-1?Q?8tZ9vfyDFioK8n11gZuHq8H1XvGSsd2MtDVbuhXSbsmgy7nir+e+rMX4xS?=
 =?iso-8859-1?Q?HEKqovHu8tLOo/ARlUQvo0aUmr9uvmkWiQmEbz4hHLs4plcChJMwBEMDO1?=
 =?iso-8859-1?Q?10tM42F0rB6ySflBB3vcSM0J1xC+Ymyjmt042ofLm4agcLe2+IkpoBXQYw?=
 =?iso-8859-1?Q?pcS92L5JTVjmlgLND64GUQmQeeaR07+giZhels36ab7sqtb6xdsTdaWkUP?=
 =?iso-8859-1?Q?RZz1RdBABO0z095Rv5Vpc60WeSBMyycQhT810CNvE74JhuMsMjaix265HE?=
 =?iso-8859-1?Q?eJgoU2pxm/iEb76w9XKn2PL74B5FqaS2Wf/HrtZwwrm5cfCFS6F93FnOvg?=
 =?iso-8859-1?Q?9HdMwylKU3pkIO1GntMqfK77xcwVH5GracXMpXQmcJ19CXbvmKqa/rcabA?=
 =?iso-8859-1?Q?foWJL1pEjxaJFUE2RCL5vMHT0NmKiEwslmFLhCkurzGyMw8Gb2uX0ALo6t?=
 =?iso-8859-1?Q?T9d+YUwTSirctpsDo83pZr8Qn/6eTZQ8BBFvxjvD+EbBPEjEAxIhzrxU3n?=
 =?iso-8859-1?Q?neF+lB94uj4M98e+bqZKqBmWQW6EL6IWi08fVMa3lznETJWCDm27MhkiGA?=
 =?iso-8859-1?Q?BNl7ShYNkOCvQ08cRuc+bTOgVoM3U3N8Hi7LDkr34ksaKgdiFjFaHsmo8Q?=
 =?iso-8859-1?Q?Vez+lE2eivobO8/BeIenJgeAbhMNai46UhM0+zQSSMZMqRWibyD7sRCObj?=
 =?iso-8859-1?Q?wVpN5F9yxaIFGHfBlO5kwpz9U2NVfIu6DdfV4Sn5/G/5IEpltgt/OD8gLa?=
 =?iso-8859-1?Q?gJjt5FE2mLHrF9y2H9YpXZmGjroofWLAdGcVZafuIXhKmjy/OEHqOVIbTG?=
 =?iso-8859-1?Q?UeyoXqU1H+4aB0hZmwUJ8d6xNP7DXQWpvXSkTnyHOs/wWswMHYvey5jhum?=
 =?iso-8859-1?Q?+gUz0YqO95gAx6TLRjnpq3msuKRWkZ5I2bn/P+g1Wjy0zdPcxHq8oV8mhw?=
 =?iso-8859-1?Q?DOZblJ0rDj7XDHwfOrxy/zm1kIfUDVOVXV0S8U3js/Mzp7MmQWVQcchd4N?=
 =?iso-8859-1?Q?XxBZodo6wt2llghMh7wo94eqTKFDgU1zjsycoIwQ/yKaHJkFyE0Gf8VYRJ?=
 =?iso-8859-1?Q?imaZI0LM3rcRxH0GXJbjzBAWoybgFtpbJAUQLro9latIkpH84XOJd4i9Db?=
 =?iso-8859-1?Q?cpHF8JfKIqK2pTgBhvXvjG//eIEknFMtjrVv/1c8ZCClBae/fLA4Eiauh1?=
 =?iso-8859-1?Q?VSTwSPAtka1/UQHcOWs7RQ9mln4tSVGhRI1Lmywghg0dQCljL6T4Js/Qj0?=
 =?iso-8859-1?Q?nA1MRaSuv7WVmmGpRF8amEw7bR1ZLNMfPQ/qLC+3MRfN+ycFkpsJL3vvIg?=
 =?iso-8859-1?Q?t4+0gLn4hT3H2uVpgEI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee0d5b7-b87f-48e3-9e73-08dd3e3bc269
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 19:00:54.5152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enb4PJlo3crRigJJnI0im6LdimLQywHMPUvoKT3A2rwpptAZk51HY1VioSxtLNQvS1smIZlt/+OndK6gztLEtaS2xl3XpA8ocVTChG1iJwKFFBHVXVMohfLcwHzjWBCR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

On Sun, Jan 26, 2025 at 01:46:06PM +0000, Biju Das wrote:
> The SDHI/eMMC IPs in the RZ/G3E SoC are similar to those in R-Car Gen3.
> However, the RZ/G3E SD0 channel has Voltage level control and PWEN pin
> support via SD_STATUS register.
> 
> internal regulator support is added to control the voltage levels of
> the SD pins via sd_iovs/sd_pwen bits in SD_STATUS register by populating
> vqmmc-regulator child node.
> 
> SD1 and SD2 channels have gpio regulator support and internal regulator
> support. Selection of the regulator is based on the regulator phandle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi.h      |   1 +
>  drivers/mmc/host/renesas_sdhi_core.c | 129 +++++++++++++++++++++++++++
>  drivers/mmc/host/tmio_mmc.h          |   5 ++
>  3 files changed, 135 insertions(+)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index f12a87442338..291ddb4ad9be 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -95,6 +95,7 @@ struct renesas_sdhi {
>  
>  	struct reset_control *rstc;
>  	struct tmio_mmc_host *host;
> +	struct regulator_dev *rdev;
>  };
>  
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 6ea651409774..bbfa68ca682b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -32,6 +32,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
>  #include <linux/reset.h>
>  #include <linux/sh_dma.h>
>  #include <linux/slab.h>
> @@ -581,12 +583,24 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
>  
>  	if (!preserve) {
>  		if (priv->rstc) {
> +			u32 sd_status;
> +			/*
> +			 * HW reset might have toggled the regulator state in
> +			 * HW which regulator core might be unaware of so save
> +			 * and restore the regulator state during HW reset.
> +			 */
> +			if (priv->rdev)
> +				sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +
>  			reset_control_reset(priv->rstc);
>  			/* Unknown why but without polling reset status, it will hang */
>  			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
>  					  false, priv->rstc);
>  			/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
>  			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
> +			if (priv->rdev)
> +				sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
> +
>  			priv->needs_adjust_hs400 = false;
>  			renesas_sdhi_set_clock(host, host->clk_cache);
>  
> @@ -904,15 +918,113 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
>  	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
>  }
>  
> +static const unsigned int renesas_sdhi_vqmmc_voltages[] = {
> +	3300000, 1800000
> +};
> +
> +static int renesas_sdhi_regulator_disable(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	sd_status &= ~SD_STATUS_PWEN;
> +	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
> +
> +	return 0;
> +}
> +
> +static int renesas_sdhi_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	sd_status |= SD_STATUS_PWEN;
> +	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
> +
> +	return 0;
> +}
> +
> +static int renesas_sdhi_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +
> +	return (sd_status & SD_STATUS_PWEN) ? 1 : 0;
> +}
> +
> +static int renesas_sdhi_regulator_get_voltage(struct regulator_dev *rdev)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +
> +	return (sd_status & SD_STATUS_IOVS) ? 1800000 : 3300000;
> +}
> +
> +static int renesas_sdhi_regulator_set_voltage(struct regulator_dev *rdev,
> +					      int min_uV, int max_uV,
> +					      unsigned int *selector)
> +{
> +	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
> +	u32 sd_status;
> +
> +	sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd_status, 1);
> +	if (min_uV >= 1700000 && max_uV <= 1950000) {
> +		sd_status |= SD_STATUS_IOVS;
> +		*selector = 1;
> +	} else {
> +		sd_status &= ~SD_STATUS_IOVS;
> +		*selector = 0;
> +	}
> +	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
> +
> +	return 0;
> +}
> +
> +static int renesas_sdhi_regulator_list_voltage(struct regulator_dev *rdev,
> +					       unsigned int selector)
> +{
> +	if (selector >= ARRAY_SIZE(renesas_sdhi_vqmmc_voltages))
> +		return -EINVAL;
> +
> +	return renesas_sdhi_vqmmc_voltages[selector];
> +}
> +
> +static const struct regulator_ops renesas_sdhi_regulator_voltage_ops = {
> +	.enable = renesas_sdhi_regulator_enable,
> +	.disable = renesas_sdhi_regulator_disable,
> +	.is_enabled = renesas_sdhi_regulator_is_enabled,
> +	.list_voltage = renesas_sdhi_regulator_list_voltage,
> +	.get_voltage = renesas_sdhi_regulator_get_voltage,
> +	.set_voltage = renesas_sdhi_regulator_set_voltage,
> +};
> +
> +static struct regulator_desc renesas_sdhi_vqmmc_regulator = {
> +	.of_match	= of_match_ptr("vqmmc-regulator"),
> +	.owner		= THIS_MODULE,
> +	.type		= REGULATOR_VOLTAGE,
> +	.ops		= &renesas_sdhi_regulator_voltage_ops,
> +	.volt_table	= renesas_sdhi_vqmmc_voltages,
> +	.n_voltages	= ARRAY_SIZE(renesas_sdhi_vqmmc_voltages),
> +};
> +
>  int renesas_sdhi_probe(struct platform_device *pdev,
>  		       const struct tmio_mmc_dma_ops *dma_ops,
>  		       const struct renesas_sdhi_of_data *of_data,
>  		       const struct renesas_sdhi_quirks *quirks)
>  {
> +	struct regulator_config rcfg = { .dev = &pdev->dev, };
>  	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
>  	struct renesas_sdhi_dma *dma_priv;
> +	struct device *dev = &pdev->dev;
>  	struct tmio_mmc_data *mmc_data;
>  	struct tmio_mmc_host *host;
> +	struct regulator_dev *rdev;
>  	struct renesas_sdhi *priv;
>  	int num_irqs, irq, ret, i;
>  	struct resource *res;
> @@ -1053,6 +1165,23 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	if (ret)
>  		goto efree;
>  
> +	rcfg.of_node = of_get_child_by_name(dev->of_node, "vqmmc-regulator");
> +	if (rcfg.of_node) {
> +		rcfg.driver_data = priv->host;
> +
> +		renesas_sdhi_vqmmc_regulator.name = "sdhi-vqmmc-regulator";
> +		renesas_sdhi_vqmmc_regulator.of_match = of_match_ptr("vqmmc-regulator");
> +		renesas_sdhi_vqmmc_regulator.type = REGULATOR_VOLTAGE;
> +		renesas_sdhi_vqmmc_regulator.owner = THIS_MODULE;
> +		rdev = devm_regulator_register(dev, &renesas_sdhi_vqmmc_regulator, &rcfg);
> +		of_node_put(rcfg.of_node);
> +		if (IS_ERR(rdev)) {
> +			dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
> +			goto efree;
> +		}
> +		priv->rdev = rdev;
> +	}
> +
>  	ver = sd_ctrl_read16(host, CTL_VERSION);
>  	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
>  	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index a75755f31d31..5970ca598850 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -44,6 +44,7 @@
>  #define CTL_RESET_SD 0xe0
>  #define CTL_VERSION 0xe2
>  #define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
> +#define CTL_SD_STATUS 0xf2 /* only known on RZ/{G2L,G3E,V2H} */
>  
>  /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
>  #define TMIO_STOP_STP		BIT(0)
> @@ -103,6 +104,10 @@
>  /* Definitions for values the CTL_SDIF_MODE register can take */
>  #define SDIF_MODE_HS400		BIT(0) /* only known on R-Car 2+ */
>  
> +/* Definitions for values the CTL_SD_STATUS register can take */
> +#define SD_STATUS_PWEN		BIT(0) /* only known on RZ/{G3E,V2H} */
> +#define SD_STATUS_IOVS		BIT(16) /* only known on RZ/{G3E,V2H} */
> +
>  /* Define some IRQ masks */
>  /* This is the mask used at reset by the chip */
>  #define TMIO_MASK_ALL           0x837f031d
> -- 
> 2.43.0
>

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

