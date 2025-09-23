Return-Path: <linux-renesas-soc+bounces-22245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD0B97905
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 23:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A982B17C8E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 21:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA56263F38;
	Tue, 23 Sep 2025 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HBci7kb5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013042.outbound.protection.outlook.com [52.101.83.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410E2265CBD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662430; cv=fail; b=OjTY4i9JRx6iAHju03U0/IvbqpZwXBsfvTnyJglA3lJn7/47Hn2iYC6xAcMhZJojzYwlh/X9oGWm7tsps8hDtbQjD2ud6rPdKxFNBXyEXZk1GzHFHauncpZuMmA38XdjhJpbNSklNAq7PBNuU0C4o0m9X6xWLEhgJGwysA3HIQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662430; c=relaxed/simple;
	bh=QcqNhbqpCDRsgwPTtOVT2Q9ZJuW6Kcf7X1ed2sAhUtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o15o0xzZYxTw+SalXqRJB7HDfll6wK9/aszT4n86XbtQu93FDY/jcuUD/0Ks8PG38BulWeungT6D1B7PWBOioOBvcQVFkY4Bre9BfdIozghwowVLhShq2tAdo65vRyh68jZDJrvP7rF0xUzST3EcEMl7S+fC63XCQSIBqedxpr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HBci7kb5; arc=fail smtp.client-ip=52.101.83.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuBZASWpYKbczlo009RmzFHzhvYxfSGyiq3Lath8IGlQPg+0lsU/YO7eUOCRVuhUfMmVm4i4In5gyHvVQJ0iS+Rt8dDJWRincoKo78Sod+CZ+VrGwLxgYZHi8I8e0c1HPnFt7SiGsvvK7BwI43RPfkYIoVu4mNnBKzwePtufy3CMTfgzdzioPdv/fPhG+uCJkl+rQyXQwkkawTfaWKkSLTp3m3hOlQkD0CxJRGY8S89czMWgggns9DEZra18smMyiLkHijZ6kUHCZwzLc3u9vB85+ztLhGcM6CaLHoaOvitHk5j5Q/e3EDg9zXGUSnyN4lSYgyAz5wYUQWtxufhv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/ltTEweAIdBRy5BUBMRGif/ENZ7yhXTrke0qcEA0K4=;
 b=qr3QbKPmuY+xTvDmY09y8tIiY6UuwBCekS4K59t18SWzkJaGd1GicttTVDCJ9oZBPmmVCp9biz/FIS3GFQHsvDcxgio48pYJvBYQfRozD+Sg5VGL6bRYaFNZIvzjegosczkgowF+T7LxLwDF9vtTW0ODLuBQXouD7m441e1w+29J6nIN7jLUErTkrjkdaMAT7CVRRxdCZf6o3+nupGG6h5HPiz/8fPSCZzUwoJCtYpDIPfs75AHaEtZ0rh+ogxCGukwnmzkgWLbAytlYgVozMkqbuZgPjSoN8vIxtGyhz5YyJ7E+smjjDn7dGLwejih7W1f4l5LS/2SjpRZ1AZgcMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/ltTEweAIdBRy5BUBMRGif/ENZ7yhXTrke0qcEA0K4=;
 b=HBci7kb5s134PQKQa2SU6NY/fuECFXlYSGQEIlEomnap9gzJ1a7funuP0rIv9A1gJIxrEDdMxzYZq1muvJIdEMVkyaAr4FCEDSNzwsVsFp1KXhzJKpmwFQ9w6pmAMXpVh46n8sDQ7xf31d8KeJZnTsYG5EP6grM4e18SHdxqrP2hQAAlRDouueg0+jmFZLDkRWgY6LfExTyG9k5m1tvAM2sg7YLGKOigk8lvqkeAUcsyrRoR0ubL9p0P+WGGkmg+NBzEuhlXr03SCdoyPyFijaYrE3yS5fTncI99lzkX5CqE8R/vKBgGT/+a+x2zNnb2PA/n6N3hb9IKsAOv308T0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DB9PR04MB9257.eurprd04.prod.outlook.com (2603:10a6:10:373::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 21:20:25 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 21:20:24 +0000
Date: Tue, 23 Sep 2025 17:20:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: Remove superfluous FIXME
Message-ID: <aNMPEunn+Dvt8jaV@lizhi-Precision-Tower-5810>
References: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: BYAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::28) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DB9PR04MB9257:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf87b6a-8399-4b4c-cfa1-08ddfae702ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bFBAx1h46D8GRUoJVsvC/wz138s87Yvsu88bAWMQTAbvRnigPnROFVusnNxs?=
 =?us-ascii?Q?oeOv3lhCN6P4n1/GK45Jc+dalSA9MVLhXTwWs65ED1935GP4rdCQFLjOCICP?=
 =?us-ascii?Q?eAmEu7/Of67xW5O7CGZUp/6wFyXtPyIYgfS8/4lZ/vnfqFrr9B1xnOVHj0pQ?=
 =?us-ascii?Q?kCsFyxE877A+BZ5KSbvXplQFXfh+1UseqNilwhMQY/hsY1RMi1HNensoGpIG?=
 =?us-ascii?Q?FGzUkdLYUPdUb6GuDPqMtx7SyfL8eP9t8HCv02lzggRDpgMwTY75ilD6Mx9A?=
 =?us-ascii?Q?wiu7oTu0AqLgEAA2pFGZd1MmooVYdNqcku9OmE+uDT1tvh3yrIetNsv8S3cZ?=
 =?us-ascii?Q?wBUOnd0yY5Ekl54N4jwuq8eEaWZnN6gz1PBLUhm4UUW0RfPtQq5qsf77H4EM?=
 =?us-ascii?Q?UXIw88mS4HI6ZLOjj+BR9e5EwSmuQHXZQPMhuAoY2IbLDEWvOjOWNsKWoZOC?=
 =?us-ascii?Q?VfCc1HJdGJH22/Ny0Zm9bTJOYCCPZeAp3a/g0XWrWgpHM2mQOhGun6d67rnj?=
 =?us-ascii?Q?iMKFQ4hyD+aDGBjmYTtlB7FkzBxtftAauQLI/4Dk+7RKNlVOXTpHRm1oayo4?=
 =?us-ascii?Q?I6ujqHPzelrdSZ+Byp0o14s7OCPPSoTrkcc3iyhMAvD0HTei3xjExUXf2C9r?=
 =?us-ascii?Q?yS+aUMjij3p1Lm6r2I60NdRirD7ewsrg0m1TH28VrAy6J4zmC1Mvfpra2E49?=
 =?us-ascii?Q?8Ru6GpJwhR+sw3j0s4tE+/DGkXnZ1KN+j4TLzJbHs6FateypF3FTf1UAuwV0?=
 =?us-ascii?Q?R+MDs9wjam6fZBEGrqczOAnNNfoyFCxq88UXi8Ex2QbxV5FZ306AtGJLWSHO?=
 =?us-ascii?Q?OrXJcMv5kNwor4MW1ZRfyvqu6KzNHswV3cMIItkpNSGZQ+oIAVQ2FTNDFTwx?=
 =?us-ascii?Q?dplFqisMiIzxJuEzMipXLQaMUWN6rp2Z+lV8cAXM8qa9WgtqM+8R/y9qlfK2?=
 =?us-ascii?Q?ekziEKgrYdppykm+mMT2mlW5jedAQTWrxq0bx0QG0I+DiDqX3KFdc0GhTwqJ?=
 =?us-ascii?Q?4FJ5QUpLJZ+7gKVJbhZwK1lEBSSB7rs576/rk5eXvjqKXHcy2mw5LaCsDzUN?=
 =?us-ascii?Q?Nr0u7Fa1AyLTQ5Fvfc+uSXarmWE9OW42YTUyIlpriFtziKAvpF6u8fgR3OjH?=
 =?us-ascii?Q?0eaNlJbWAWTHKg931mlIjPS6+n8yMI0tz9e/AdhIuggsAgTBldrAvhYOtLoC?=
 =?us-ascii?Q?mCjQqoqoX0Cpjq4NhRnze1IOM+irFgNennK8KGP/4fhVSH/SeU558WvUgaDo?=
 =?us-ascii?Q?2aP1rw09b7mpb/O6FIDEVBJHSqYEU1tVvwC0Wa/wXZJ4AfwP1InvsDCW2AuP?=
 =?us-ascii?Q?z3/ey1R/pWxJ2lt8YyRrK8++T2qs6+XtbCapV7Yx5hTcnSoyL+RYMAkDkoBz?=
 =?us-ascii?Q?CkBWY7IJigePVogvzu2ConSM6lPXaVPoJGBoC+absicnasCLl7wFJY7u/Mvh?=
 =?us-ascii?Q?+RebyRt8CFgjAUAHOwcJfED/afGLuNvzJvLe7417tu3Hd7QR3P0tEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E/D+vlIj432KFo+JxM01gN4ubJ0Acexvjc67CF55F8y+bnC+UUuLO0VI5VrA?=
 =?us-ascii?Q?lPf3/PDS6s+aWu//dMXO548xOVq2TlE0RxcLcHaEnoK8h3Cy3JDqVSvirZ0d?=
 =?us-ascii?Q?oDRaUDqbDyS/2dKlQ/4sg3t6b0+8rHCQfWdLjzS7E+Qvfp+8FYM564bhXalR?=
 =?us-ascii?Q?7tfuS4Otzij8o+Cyehgbac4pioVOFT9iGln3j67wdvRR54qIthbsLsKvVVDq?=
 =?us-ascii?Q?cMCS5/EwMbQ5cXFMXSw/nNN6uqo+VUWW6k96k/ufNNMqIpy9CADkqKsCf7UN?=
 =?us-ascii?Q?hCnDplhkGa3PWpp7uEXt0tccVyoJ121RwsfdCKve4BDaHyne1C1Go2cB3DY3?=
 =?us-ascii?Q?Bcx2quShdDwmTB1bgp8r+RmvhJcy2r2IQ9bK7aXoFHjmIqJKffHZP80k44c+?=
 =?us-ascii?Q?b9/61m3x87inePd4iKEDBszqkGjWhIL4aNb69hlJqPtvy6n4dn9/VPLcbcRW?=
 =?us-ascii?Q?HBVbkMVGi4j+v/cAETPx//Nl0IeIO74AHCiDFkWO9/XVQZwDB+2k+TDn+xsU?=
 =?us-ascii?Q?4b3h1yRu8WH8FhQYJZcSxwFntY3ozbGxBgZ7NaGhCOpBXcFJkFqzPTKHoqdq?=
 =?us-ascii?Q?tq9dNbjS9uICIV8RI/udPI9e5un/WecpVv+/MOydA2uOH2oofBlvijac99Ri?=
 =?us-ascii?Q?x+YcWv6nAmMHBlJkoqDfJNIuFWhcIPkpD1RBFmg+G5uB/xJSFaIM4OrA0E5j?=
 =?us-ascii?Q?qVUcKb6356pq4RUi69HXvF5nnpcbeBz0MXmk3wTrczjEzn+9uOHjxYdxjCaG?=
 =?us-ascii?Q?BT4qupBqR+VdMtsoHEUl2AhpFh9Q7ew7NsVvcVqfItcMTWTqsVLNCzaQ4FWr?=
 =?us-ascii?Q?glBdmNpkhv35fAelp9IlLAZ/T3xgswJoA87NGF+ImKCLoX8wWdh7qe6n07mL?=
 =?us-ascii?Q?SM/kJpRe8+3ZMHryj9sN1joPPCMZGi5PEBKJ/Tp6A4yfViz/Oms5ZS6BSoIA?=
 =?us-ascii?Q?V066whcnCSC+qXNAQxztDYwmLENigLVn7e/SVBgYGUCw/mmUsQW8Eu9hE4sM?=
 =?us-ascii?Q?36D5e8bERGEAfQ5a+Fu8MmXr8oHuIi8TyrvrhzAJZaR4HFTZoOZ0TvFw1VyC?=
 =?us-ascii?Q?qRFiNT9BLkcydN33KMga3XI8k4AxgHjW0Pvt1l/Bo6dDff0ZEs4RbB2+5Ylb?=
 =?us-ascii?Q?5LPnmOd5FWk9wVKSkZbKnwySeGIIXT0+MLRNXs+R4tOitqa2NWs1Gi2kchZ1?=
 =?us-ascii?Q?w/keEb5zGJon9r4N/r/4o1+cK8I4laWk3koby8QPrVCn1N4VU7yPf6yheAEc?=
 =?us-ascii?Q?MOFf91+/ikGV97kyLr+zKdIVOot98fEQXIY9UJsCEhbMRa6p9dJteoxdXQOx?=
 =?us-ascii?Q?X2OBSJik0QrhLKGDpcOkvnZm9zQb6NDYfIujrOFqihxxjbhCNlkzuhS+iPK0?=
 =?us-ascii?Q?k1yR6Fp9rbtHmbMGYk10rSVT8ViAFLzUhhQlgZ6hISeEHHmPNZKAJgz8hPaA?=
 =?us-ascii?Q?ttTo5CQfn7STMLd9tVfMBF8n+Y7EHVI8+zW1HnjRE12LdG4pFxgLStVMTlvL?=
 =?us-ascii?Q?r9C8xUmtpWroX9yVxpTzI0HKi67hhlxeFj3PTS2+GS34sAZC5NdtkGpoE+Pe?=
 =?us-ascii?Q?JZLwIyrMu0gAV7ejlKWiGpOIPdgEqlj93WWLAdOx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf87b6a-8399-4b4c-cfa1-08ddfae702ac
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 21:20:24.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nto7tuguCA65+sC5iY+hmsuDIQHGH9vV2ImG/DTWMdU4BXyvFkjPodXR30H1l5hs5NW//4NqLVg6WFLF50LMsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9257

On Tue, Sep 23, 2025 at 10:35:58PM +0200, Wolfram Sang wrote:
> I2C adapters can already change timeout and retry parameters via IOCTL.
> This allows for better tuning to workloads compared to per-adapter
> defaults. So, the FIXME is not needed.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index acaba4d53697..d946db75df70 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2564,8 +2564,6 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
>  	adap->owner = master->dev.parent->driver->owner;
>  	adap->algo = &i3c_master_i2c_algo;
>  	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
> -
> -	/* FIXME: Should we allow i3c masters to override these values? */
>  	adap->timeout = HZ;
>  	adap->retries = 3;
>
> --
> 2.47.2
>

