Return-Path: <linux-renesas-soc+bounces-19583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0151CB0941B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 20:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AD311771D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 18:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419111DF968;
	Thu, 17 Jul 2025 18:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fvunkLBA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010011.outbound.protection.outlook.com [52.101.84.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6A20ED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jul 2025 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777639; cv=fail; b=r3RJ4CvRP5lEviTe2c0D4QGn2TqxdfaxwR5ugnL/trKDnfXPHH7dqznLR/FqiV5Ul/+DHij1Nzo+tpw1Y1AturJ+oIfRmc8ZpxTWr43amWNw74vFcv1fY+gr7rmkMbbU1JnPCYjZDboveddTr31mtl2xVClpoVxRUjzOGFA0+rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777639; c=relaxed/simple;
	bh=+PnaueFHwlXFCg3V74L8VwfUSrnODxI/raXbqffQnd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EbA2DOjfgDvgkPi8eC6ABU+BnbGoJN0ARlavm9/gGgDaQuEKB+2AjrkiUJ8Fwpvo7jlsWHsIB/cVACUgjix/W66Ic/x7wCIjF4UqS4tgVU2NvjTavJNjubo7zjJK3UHl5w3WjYsk0Zk7z2TpdbG56pUJ6QYtccJF32rt177mPPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fvunkLBA; arc=fail smtp.client-ip=52.101.84.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUupI20AWgO4sXxcOityrXu4ruoroZGcbtdmwjOdBO6c4TspNGiGz01/e+qQr9djMz+2DOycuouCSmFT8DpWrKC1xL8v3Ira0utsqYG7B5OSByJ9DNTVHwXxNp/tZpd9quVviESzzET7WbxP5Ai7aIQPbslZ6bUH49/K/LZqsySl2mQykrOVS7XQVGzhzBN7QJLMg8mkUZTxonQdcrFKhaz28cIqtik3W2Glyqs48F1I0HsNfuISf8f5kAeGuAGOo/0hKPeRgF0kX7ehh0nVjlxE4NTdoJ0tJRYjgsg/N9EW25UI9UWA6mMG6/1HvkXRuq2zIA6C7I261BVhnUftTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLOJpPJ1XikL8S0haKZ8m8F0dabsa3Ir9BLOOTUhsmI=;
 b=F9M+xz1gPAU+Y8u1cVQHTfaVvMe03kUTweX7TsDXTXCHUmH4vORKRQsaPQQWPHxFsI04tAob+lQTsy54spr/iqyMD1+80S35byTs14LBYpsMIo+XFCtBmijud8FmEZX6ZKIIoXPX5BOCNVO135khdZaKmM0LUbAVeyWHIYVVJkL0ExOF4mrXa2MQUkoB1WTYKM7IB+PmAR7d5QDo2npna4MPeyw6Y5rOMVVktlNEb+MO6LY6et9QqXdFi9qRNKDx/7B2Vy87iYvcrWaORmLJNhkA6roBpGdoYYe2XAhegfjMJsYv9Ra4gs9nEOJPaDmQYuU8m1xa5fRVEMErx9j3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLOJpPJ1XikL8S0haKZ8m8F0dabsa3Ir9BLOOTUhsmI=;
 b=fvunkLBAXqei50u1r1VO6JygxHEGPlkB1gPUBKciTzKQHwicAzXuY0hg40hyole7AHCMBSNtxE99QZ6syaAVqPPKIYnAB/s98cuhAp5C/xburnDFz6hqENFTeYgyYd5fIRqH6/vSUHUiU9ewyV33ORtFE8kRDw4AzolKBAhHm8W9/AofoLY7UFZ2363IWWAl3KeS6xS7STQeOVel+jyCg5MU3iuOoG09f8Ltb0tyEDIrNHBfPesEjLi22MoPOq2MBVyPdkfDNxLvBIGUSG6ZdLBv/0Nd3ifQoVjEuUlh65Ry6lekQDnHFHiVHM7c8W/T5eHeY+f1PAweQkDTAFGCiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10576.eurprd04.prod.outlook.com (2603:10a6:10:58a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 18:40:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 18:40:34 +0000
Date: Thu, 17 Jul 2025 14:40:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: add missing include to internal header
Message-ID: <aHlDnqjpJQpTqLHq@lizhi-Precision-Tower-5810>
References: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AS4P189CA0056.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10576:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f31a4a8-ed61-4908-ebaf-08ddc5616a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NMbNRI0S7MxzVhH5HpuOMBSZM9h4Da3yNC5WEWNNk6dmtQ4yLz8r/OwGau55?=
 =?us-ascii?Q?7Lm61+UP2H86ojozwFFn9XRzW+IPNY0Qtkx6+mTLoDdHopU3cUuAZhKKsSsb?=
 =?us-ascii?Q?P/dz+BMHvHcIBhpK2+Eztwidrn9mTCVdyFvwE4yWEmMQYMYFQTOHby8aEE9k?=
 =?us-ascii?Q?xtwSUY9RliCoex20qvcbhqgGLRmkr6963+D7MUCeZBsSxees7KLk9UPLVZKL?=
 =?us-ascii?Q?snvBbu1XIKrn/RlDyGeXbXgyZpmx/0R+P7dSQYoRkZ+zD0J6VFPWdfDsRg5w?=
 =?us-ascii?Q?JwVK7HhcIMLGFHclBSfZWUoWlbMXnA1V3b2BsNmPk2mcqJelSSy8ag5tJ35S?=
 =?us-ascii?Q?Gvd/DnuzJ3dorPNOmEmYH41TNnlRRmphE55JHqRxE6jw6Oqjc0rzUwrYHJ+C?=
 =?us-ascii?Q?iF5EJYov7mW5H9AxHYrWWkeShf1jgj0lP8579mXub4EvY01tu+1eQtr/gTXM?=
 =?us-ascii?Q?tbGxTlqhuC3fuOc/qkKJ6aC6bz3iMftRJDKdRVZWnBx3/u1yfKEqH+Rfbv2p?=
 =?us-ascii?Q?BX2veHUVis5zEa+IaAbkr9MtK0ujWspUids8sD36MXIEMr2/PNAG/63Amqxb?=
 =?us-ascii?Q?3XS4mc07aNM8TQMxGMndGxaLm55TBkxYVjL5A2ol5yGMAx1nbK52MBtoFnzB?=
 =?us-ascii?Q?6BEmuca9nQPQHlPtrPD0Lg+F+7z4ScCo/Og+TwPmtMvrwqchPzJ6kz9ui5E/?=
 =?us-ascii?Q?l6sztALRi32UwH6/YDYhDx8OT1NvDcAkAd1Xl5Kd2rnaVCcX+22VOT96nDg/?=
 =?us-ascii?Q?697Fok+8VPwRBgoPg8ARyVbWAkan8H+Evm05eSLjpFstKhly+hkRdB77kipg?=
 =?us-ascii?Q?+0Jwj3Bi9qlqGssaC4oqX0y/NCyWmPAglDYxo6Mhp0MWcYqI3EjyIqiYvKIp?=
 =?us-ascii?Q?BGNEFiGVxuABBG17joNwWaLds5K2mTM7Uv3vp0WMpNjgLswZ5c8zPDNzTLyP?=
 =?us-ascii?Q?gYIxAVgfV2aJBzFM2435hOf71CXz+chRxfchfNdvCyN1GOsosSPG/X+IgvHR?=
 =?us-ascii?Q?bg0Xwb10V56D/9bbNGJ6Kd8Iv0HhfdnADnzSA3Cv6uyoNHqvlNvrBHnbNNfZ?=
 =?us-ascii?Q?rX1kzokP4PNtxQr2Rp7QIAb6lSIC85Nph1bEi9KT7q08IZn+K4lh1h50fi65?=
 =?us-ascii?Q?m4g4dcqqMdb61L+nkNW8DfD9v1IKdPLqO9SQ4D3aP0BOr1U9VnByi+T6RSs7?=
 =?us-ascii?Q?W/enO/292QDvRQjr1qgCG6/IkZQTMfuQIV7bWcZgCjOGKOVyB/7wXeR6zbRP?=
 =?us-ascii?Q?JsYtiCiYy+l4eg69AdYq29VsW1PXOoQboHShtghVAo5ijUlwKkaBnumJ7jj5?=
 =?us-ascii?Q?zKwfm3jphEUuGcPFUSajBeQQcNY6kxmI7vAMVaw9YCAPqYwWmOqVYFl1yIEE?=
 =?us-ascii?Q?fumDR/j7qlBE3lx+ec5BEQrbN5/5u40VXwrnCQhhxRnlNFPBm5ajxe5wmCgV?=
 =?us-ascii?Q?ofkBFwUkAzAeT/z2v3yiSSW/uTVTQ65bXYn6YJ/O/kwH4xXvAbr0QRF722Fn?=
 =?us-ascii?Q?myuFuRYQnAWlGy4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uVLePqW8drSga+7zFr9LlJgle13DwDOhYgP2hUtSudV28nBb5VNpWteyb9aH?=
 =?us-ascii?Q?URyeY4NSuj4ng7RkT9+mV+7o0Folf7a910Ds8BOlqgbW0rU7QkdWWd2kFcXU?=
 =?us-ascii?Q?UvogpdzMQR1m831odYaWgdk4xZ0fD7aZXE88vKKX97CFvQI3GJLU2sOATN+Z?=
 =?us-ascii?Q?5tGFi5RQPN+dw75JruImzhQtyTahauUliC3xl3UhoMS282VeSrXV6TKLhbpw?=
 =?us-ascii?Q?dnDkTgkwxHj3cArtfRHGCBKTtLdYoXt7BpsUSp9pnMmc6KlO6QIE2OGldyc/?=
 =?us-ascii?Q?Q20mGnm1BlL3mF8TQg8hsepIqMwzz4Ud3hdz3D9AnUQ1dZjNiUSx/Kjc9PX5?=
 =?us-ascii?Q?09JOROUONo+VlBFReHcFMiwpY0CLnZj+Lk5SdX74CyyxKkH9LQ8w2HIFnzJ+?=
 =?us-ascii?Q?DyJ6idaMJB/R6g/T1KKFUOulKQR9BlnQ2TJbq1ly8aJEbjuGOG4DAloa3Ddj?=
 =?us-ascii?Q?07kpt0NHo/jw6UZCqVWDDS6P59sRcCnBzaSGNTsmNBMoqa/cBeqjer2UvBDz?=
 =?us-ascii?Q?QRdgsdO3LDBKZfydfc6vieBeZNkzj6JX7Pe/NT726B+8vYFan1Qng7RQEAHB?=
 =?us-ascii?Q?EiYWcDV/BC1WsPHj5/B5P4mPOk3eLKwNRxZyxzAT4ywp2+QTS1IYAZ6ltJuB?=
 =?us-ascii?Q?vEm5NLyrEUwCgvx7VR6L177ReI91xDWKPprXs9rGxR7ztvISjs2pljmAnNSE?=
 =?us-ascii?Q?kcVcDlDQtT4Jpx8mUEw9u3yuvaHM2OqHRrhfzeajtiEkxSz+aZRlmOJmRu5Y?=
 =?us-ascii?Q?A6Z946QHzRKqbd+CNrxCkf4h7Gbq72WX8RURm+PW/NB3a/lOlm6vFkWew6EX?=
 =?us-ascii?Q?o21Mr41hkMiO4aeYsddOi0mQTwEIoh6puqVKVMCOyKYCp9S+N/wgZNweG43t?=
 =?us-ascii?Q?b2viLTN8UgQXtB3ZdxmIcUpHM5A7YHZ0ctV1kb6N3vVVEh0OAT+uGSepzLNp?=
 =?us-ascii?Q?alFBp3Ni66YqO12u6TwA8CsiPQgDRdMCUctVnw+9hUtt/ukhN9PPB8L3esmq?=
 =?us-ascii?Q?rgJWBpzjeqYlAAs2m3xUlCzMiayNDqyTyVsxsBpp9xGdkRuG775tXkzgJt4c?=
 =?us-ascii?Q?bC6oiokDwEx2wDeaposFh58gKwNVddOGBH+GeWdSUJDC9L+o/wuhs88IoxYP?=
 =?us-ascii?Q?EE5ZXBOArYOsSViUz/v7Kqm8bkOf1HIivOpcZ0RTNyzJAK0OXbbq4fu4cVgt?=
 =?us-ascii?Q?NZhtlDEAbgIxTMj6oF7NVcDxpJU402Tz6L1y+CJoNi13oqVMd0A7ThVSdiYm?=
 =?us-ascii?Q?jqOMQ2QzHAxqim+wBYCQIu0r3kd5x9HCQ79nD1zxL8b3UiyvxftDdvd2NYRX?=
 =?us-ascii?Q?/eqyypBymFvJKWEJDMRu186jbs02HVgtrTO5VXkEN7TpA7zilP2vExBkAuyx?=
 =?us-ascii?Q?emOEHtRDIwEthzhWZwDX3blt51q5JlomjpC9Cer5ArnzNzw9CTb3GR8VL6F6?=
 =?us-ascii?Q?5M1nvIziXGmB2U4gIAXztZAZbFuJzIyRBOVtOkBKH70sXr3JiAXXWmgYmkYQ?=
 =?us-ascii?Q?3W2EEmYMdRSf93c3jZVcUlsP7TWIx9YV8XE9pnKxDgUuk+GCMImTNv4v029t?=
 =?us-ascii?Q?zy+bH5QhUigJelQL18W90pAinWtW+pHt9t1x/NZW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f31a4a8-ed61-4908-ebaf-08ddc5616a6f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:40:34.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaLJxbCJv+py72y5As44Uy3FwM32Z1PiC0DTWfpRYVVtM6DHSIVdZY3Rsk8zV50PASFMjSBpT/ekvF4/No9dOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10576

On Thu, Jul 17, 2025 at 02:00:47PM +0200, Wolfram Sang wrote:
> LKP found a random config which failed to build because IO accessors
> were not defined:
>
>    In file included from drivers/i3c/master.c:21:
>    drivers/i3c/internals.h: In function 'i3c_writel_fifo':
> >> drivers/i3c/internals.h:35:9: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
>
> Add the proper header to where the IO accessors are used.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150208.BZDzzJ5E-lkp@intel.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/internals.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 67ed1c44f615..1bf6aecebcbb 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -9,6 +9,7 @@
>  #define I3C_INTERNALS_H
>
>  #include <linux/i3c/master.h>
> +#include <linux/io.h>
>
>  extern const struct device_type i3c_masterdev_type;
>
> --
> 2.47.2
>

