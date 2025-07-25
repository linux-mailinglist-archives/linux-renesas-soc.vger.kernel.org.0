Return-Path: <linux-renesas-soc+bounces-19690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FEB11F83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jul 2025 15:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7771CE2835
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jul 2025 13:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE8727472;
	Fri, 25 Jul 2025 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lwO/i3ja"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266232E36EC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Jul 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753451261; cv=fail; b=RSfS697owLd1J/twArvKcG0FLTcMqQWnbQ2wW3MpN8qNV+0BfFeli/2LYNaUA9SGbLBZFy/KBNg4aU1PfzWkyvNxOtzjCQ5jcRUHP6ewMgwFGot5ESLj4xTNmWQIb2n98QpJVeXJSdZBY9Ma7fLBmDN/+nMkd2kK+Ka+upt7sp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753451261; c=relaxed/simple;
	bh=sWFhFy0DCHkit9KEltrPIAdWhA6RoODZZuJP6Kkgmq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a7OH5nuL5E0uTGp8Pto0TIDhjKeCdF6sAUA2YhFfJ6ZBQxxCkSy2AsrHTdTsAumjkN4FOMTocq3GBeNl0x7GI2kImltz7TL4phyba+7i6+AR/dZxex7dvyitCw7Rsil5Qo9LKxnP8X3hqiLUQxZQasddltEeqAoPR2skOp9SrW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lwO/i3ja; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKPan4WfMyNGj9dHneDuUYK+qNKw+iouNpbiJ8NWlZDxWS3NRNqcjHYH8/dAh5RXFozMJdLDCsKI7plpr2jZQ7wPM87OXat+hv44dEkIPxWJOsqRIryLT4gITkxOdjvNAgUwQZNyDYafnQGc3ZEWitwmBuHSti1zktSDwnQJ1sMQ5TyQrsT6gI4c+otk9/9JUp70lgGsV9ZpXlea9nAejuKmHw7EP3C3Y4plOQujTdIC54MYOgy0CqHy2u4P6yCwUcCRH/C7OZwGkgfej0ycMfBMpPL6EqFfW4hIx529nBonwY/SIHa1x150M11pyOeRfOB/FoYUDsfsSNoCKyi8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIP3bqqcaQsfj5Bh8E//MRQkEOsb2jDxQMHfg/gTww8=;
 b=fTfiLzzSu+vs1QAKAkZqq+xVdi/aMvQTRXbMalVWjNAVKPe2gHXOmiXpr6tyv77H+ZpwZOIFcy/5TFedNum0QcHFXXvriBAIuRa8c1R4FS7BSwEC9O1rHxU6pi7aKAk2Vf1kLR7ZdQqEtiggEFhDrv9A2b3t4WfvAfZHwRc4B+O/WhMIsK+1xuAdywboAGbUtFClQu1Adb8Ut1gtlxDzbvURLyhHu4OY0+9VrwnkFRyiIR1uWlPIifBbNrFdJn0g+QPerDB4UOeB/8FIKOJZIYqkyVmrn3oIqKPDyoYryP243oFGSpj6+GjPjtTYqiNeNtjdfcj6CJj/KJHQKZwMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIP3bqqcaQsfj5Bh8E//MRQkEOsb2jDxQMHfg/gTww8=;
 b=lwO/i3jaxpiOBQSYxAtnUpKheqOIm6pYlLLAQOAX/ZCbwz9zYqoFQ0CBGeMO74kwPaVE3K8KQr7E6PcadQweupHmKUvUXg2XlLiY8Pswds5grnHMXIITjx5BTwmyWYqBuCJ+i2Fh38az38FUbUnSrbPAMENNpsvZNos7Sfp6b9FkfQhq6pKOr5KT36IwFvAT+ttBiS2EJE7R42dMupWelusBDLkgjs8KxtvaAG45K2liCwxdk+dK13KSZYzEunIv7reGvTZ0kTWud18bQ/hIXvEZDZlUQKQssuAwr0AAnZWg/JrWScesOcSwzewhxbQ1EEc9zjuPmKR/aGoVrJbIMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9407.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 13:47:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 13:47:36 +0000
Date: Fri, 25 Jul 2025 09:47:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v5 2/4] i3c: Add more parameters for controllers to the
 header
Message-ID: <aIOK8ZeHQN4AoNuF@lizhi-Precision-Tower-5810>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
 <20250724094146.6443-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724094146.6443-3-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: e11334c2-09fb-48af-03c8-08ddcb81d032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TQWiPnPOFpbHc2SlyYtYR14RSmmyQzXJSpNkmlnVGREiG0FD0Fr0CUKFMM3V?=
 =?us-ascii?Q?Y1Cy+izmdUIAXdGnprCfSxuX096LRGx6w09xHOuVoYxf+pxpDu4OWDcxTTmz?=
 =?us-ascii?Q?iyMJmh2r1tpwP0UVefqLOuem04qYDckAwQKjnfYidzvZYyG9opZ5UQeIbkai?=
 =?us-ascii?Q?TYqDqS1A2JHYNNEroPRZbnHlCE8sLhkIiVD/+O4oJzbSijVO0oI70O6e0GTE?=
 =?us-ascii?Q?TYKgRGjCxgZ9atCIGYXzb5oYLLvarMMMrFBtrZJj6MYl5nN7O2iGcs2iPLkj?=
 =?us-ascii?Q?JT06OaATiYCaResanRGm9VJddOYY9liujipebWEMaFvx5Xc6EbkHlVRtv3jr?=
 =?us-ascii?Q?pgyO7ynPhqNYnGgg4G1XVygU/K5PfZ0gdR5DnSFKnfSQX2M4xgQ8bAUVCT54?=
 =?us-ascii?Q?NRf6G31fQ2nVdvqaQdYy2ZP0L0d+qjtcM0WITDPahRCFrEPd2EA2INOERQK0?=
 =?us-ascii?Q?R7W620uB/1eoaw0hTIcpygQCZxgZaslwONIaJOlnReyAlw7tsSNNG1QUNDTw?=
 =?us-ascii?Q?FnIrRmyJEReHlIw5XPQ19oV+k0UOgVX88OKv+wXfZfCUCyf5RzIsd9PodosQ?=
 =?us-ascii?Q?mvuULPAtKNowU663wGTj7wtQ2PKPSCcv6ER9APlnqexEXqJHahxWmrLYBiLz?=
 =?us-ascii?Q?yu7KXj4b5zBc5NKXrlbgqwrViff/slGaDCF9aY4quS2N7KcLohSMDeBIR7b4?=
 =?us-ascii?Q?hdMuQqC8wPmAfY0kkFFlIQazDPOHncwmhJT+uSDymjY6wF7A8fRiWp0DhHxE?=
 =?us-ascii?Q?0r+C1INyc0PPLhx5bBIUjFtv4978OpRVmKgZV+KzD8ubwG/15lsTRm9uteRB?=
 =?us-ascii?Q?04caIFZxnKmncakD5ICwPAusNo8rnhO7JXGv48Y9pP6w9zUTE606Unb36jGO?=
 =?us-ascii?Q?GlsMEsuQKbKfBEKGXPQcpfrEWP3ZWfgs2SY4SyZHmZQH658gb9DemnlGrcYG?=
 =?us-ascii?Q?EnF0bM87kfvUTEHKWRQDRDBqTj9CR07PpyR4YpAEx+X/4I2kAnJGxUQHDsQB?=
 =?us-ascii?Q?V+kcKKdiKv6XU6lJ21zkSs8gPzCc1nenul7zruzxClnn1Leb5SZhCYpu5pvC?=
 =?us-ascii?Q?h1DuPX0RTu9sa++us5hhIqtszoyF4wRXCs3A5dVHkYHe3bHhv4/JKhP3jr1m?=
 =?us-ascii?Q?VFFVsBKGJf68k1JqeAWK2aI+jGNi83fZI9h+jcMEL268+pZm2Xvpgol2LWWN?=
 =?us-ascii?Q?Yniu9S6chBoZ273ZXO7d/o0Z08+DZVH0VNFfomvV4zaN5M+fsMOWTXQImaAt?=
 =?us-ascii?Q?kapdjBucn5LtdWBGrFBPqujQoFSIiiHZThoD4siMP0vMaKds+N1yK3hAVjZR?=
 =?us-ascii?Q?SSq81DbEYq6dIUxR7dEFShFFwAUGHBXR5T086bokCnUc7FHGZZfqBjaNa3IN?=
 =?us-ascii?Q?S7eK4L8JerAeOF9IjdMTQLIih4QjAsATkMmf9SSD0OeAKzt/JD/BOtMslN/6?=
 =?us-ascii?Q?mCOq+Od5O4n6piUcefnJuvfLgH1qegFh7RPTARoZ2lHE7TyfPcYt/5ZMto1/?=
 =?us-ascii?Q?dyAt5QqE3ZFJ/UU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jm14hFseKeOe71QVT1gWx/qPN/ZFGCgeiOD35b5TAqnMc2ojM+Wd4+9p2dAj?=
 =?us-ascii?Q?uEvSebIlAjIQmVyn3pB97KqYslIfa8EKiUICptzkwi6D4z9/Sej7k7AO1EPN?=
 =?us-ascii?Q?wcE0pq9CZn3C5hFHbv/dZc1rURKE413+S9zeSGMjarnCQiGpv7EsY/3Y43ym?=
 =?us-ascii?Q?eh2/r2SGGaPJKt0MrvaHAEQrToGxUR6GhC9nWDM6xhVnWDvsBLhMbKSBXZFJ?=
 =?us-ascii?Q?/TLH22mvNLpOehbtq+crVmxLZ9znt0Y7RQ9JcHIXQA90THjp/5NlrFZD/L+y?=
 =?us-ascii?Q?DX7nlMyyuU3zT5RuGJU1EvHe5gyY7bp0J0j+QWRYgXGKl7XB9yV69X7qjbKd?=
 =?us-ascii?Q?Hy6OnDO4jqi2zIGC4PmdScCnC8CvZxqGu+XCOHG0ghHyhxcfrHGkXK9C8tY1?=
 =?us-ascii?Q?t0nGXcrQgx6gqNV6adaUaiocpbyXLo7I7sV4ye1SpqRq57NdaF3IOhud/1Ug?=
 =?us-ascii?Q?UQN2u72O/jINDlL+Qf69JnIwBXv31Ok/HCn4sfwMuu+/dtJklePJnyXYNMam?=
 =?us-ascii?Q?bKpwOjkk7og7Wsyt39CyDLvAIBxjfi0hA+0fk0gob8UUIz4f07FemANVatpY?=
 =?us-ascii?Q?uyWBhjvl7YlRMvjGhYxmluDwAaHdN+4uIkbKn2e/BKgF7cDPbAJlsxKwSOou?=
 =?us-ascii?Q?+9sxPhlEbpPtokcRIWTjkO+LqKJOzrd1Avm1ObEaOHZ0+m3D8o2bl2oEm+cp?=
 =?us-ascii?Q?ZmJIT9EulNFlcYfQDMp4N+NG0HIhofD1JnJG2Jj/ES8DMR+3e1EdF2XqeCPK?=
 =?us-ascii?Q?b1msWD5ohRjwez1teRWfB95yOJvmdYr938iMIXtC7SzV0z1V493kT+Ki9HN5?=
 =?us-ascii?Q?MYswc4wHmTBYR/nVxAFj82RARp3UCGR7FNE5oY10fTRleCBZ2dYBnKjO1tPt?=
 =?us-ascii?Q?nL4ka+9bj04Vm5IbcyY3+uqxarMul0Mb+3K4fmUloyy2O++oTTeJ9FQ8dM7k?=
 =?us-ascii?Q?cIhqaTt5ynb5geAyDSKRCC4ennBNywA+9+MTtuv6g/+cy6uCsv2wjmX/X8GO?=
 =?us-ascii?Q?/73CbiG/tpZ+f3FIUX5Ycxz23gNIQok9yhh5FlvRlrFDpURJUBcB1Ywsm/94?=
 =?us-ascii?Q?N83frFi0M5mxl2+knO7VQ3hvzfnQTtmfld48D5vS9cP/pwuQt+Q+RFGFGAbz?=
 =?us-ascii?Q?HqBHxMLssjZf69n5ETw8fxW1hq+7OxcoMBSfXxPAPbnAOC/rsjxVkih+Bpk2?=
 =?us-ascii?Q?pgS3+1IieNGlZplRYMBFJL35bHdrU3P3t9P5UHZGOqfTM3gkj7bFK8Ojg50O?=
 =?us-ascii?Q?pTr0Kw9MysyFcaFfvVs1HS5pB2QCclDl67ikCbl3xoMF56TuoJGbLm/6lcP0?=
 =?us-ascii?Q?g4JsMkfAhqsvtJlScaF4gPdBsqaGVYGelE/gOSwKXRBKylThZvAgKQYIQI22?=
 =?us-ascii?Q?lMjwen0slP3JSTJV0NAs0DrOKtNNCzI4Kmsyv+xmAu5IFXJvCNQq2RAolKEP?=
 =?us-ascii?Q?eKeTM5luecNPVzW+2fOI2osYDP1EbuqqYvyp4mXkevUO6lhbgId8nMQy1PDu?=
 =?us-ascii?Q?N2ydu2orFP/6KOy+mEWhqK4pRwTnDVPKoSc+mboRVnyUlOf8wRH4iifbE0kr?=
 =?us-ascii?Q?VyjwDMcwt4DMwXNTF7wx5xLdf/O4YwQLA8W3IrTS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11334c2-09fb-48af-03c8-08ddcb81d032
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:47:36.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLaox4v0kEHN/PN3p+qVCQBves/0EH1Vc4KjaySh/hPklddIyJKjYl9nnpCLFKS6pV6wF1OAfQbh1MjJ1qWrLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9407

On Thu, Jul 24, 2025 at 11:41:41AM +0200, Wolfram Sang wrote:
> Add standard timing value definition from specification.
>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>
> Changes since v4:
> * fixed a spelling error in the commit message
> * dropped the subsystem wide default timeout value as per:
>   https://lore.kernel.org/r/aIH1zUb8tyIlyC3S@shikoro
> * added tag, thanks Tommaso!
>
>  include/linux/i3c/master.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 7dfcbe530515..043f5c7ff398 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -254,6 +254,10 @@ struct i3c_device {
>  #define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
>  #define I3C_BUS_I3C_SCL_MAX_RATE	12900000
>  #define I3C_BUS_I3C_SCL_TYP_RATE	12500000
> +#define I3C_BUS_TAVAL_MIN_NS		1000
> +#define I3C_BUS_TBUF_MIXED_FM_MIN_NS	1300
> +#define I3C_BUS_THIGH_MIXED_MAX_NS	41
> +#define I3C_BUS_TIDLE_MIN_NS		200000
>  #define I3C_BUS_TLOW_OD_MIN_NS		200
>
>  /**
> --
> 2.47.2
>

