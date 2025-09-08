Return-Path: <linux-renesas-soc+bounces-21545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A642B48263
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 04:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335B91792D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 02:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C78E214228;
	Mon,  8 Sep 2025 02:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GUfGCuHu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E791FF7C8;
	Mon,  8 Sep 2025 02:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296965; cv=fail; b=dFYIfRJaiHgyQnYcqR+f9haKacu+0zTNxgcBSuYqNQcOgAaBRcLli0WWmucXBiUSGHTIgkKZH/lXHyRxOTkPaWCKxwK/khGEd0lURZndk9Kn0QX3o+3KRwYjoN3vb8MAqMClf30LgrbqCatAjLYI+hQulgn5e6H+tg17lOdPtKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296965; c=relaxed/simple;
	bh=aj6v/pDDa3z1ivdD6DEv5ynjikDGtF90rTlqJuWcnYU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=r46sUP5zDw86f/QmU0KDRKhnqi/IGEzgNPDpqYpuflQBJ3Axh5Jo27UEJipeSlvZGBgpOzaP/DpCfqsKQ9E+PKp+2XoV+MW1Yt0NJFLN2l6OvWELwJh+G10oTml/HlXXQWlz+hN/CMSdxWVMMQ/dNhTCZWQb9+hWQ8N4kCrCKBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GUfGCuHu; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuCjL426AFeH380QDxXI9/6Mb51PwFyOVdA1JEE27ub7e4UgQoHu2J1tb5T0lFBtTQvUevkKA2DKCdNjg+eJLx0FZTll6ey/3gGNbpWo7pYiyfoafk/GpA3/sY8MuuMepIyFZioEewy925NNShUQZABRSFD1FbP5fe5pszXFuX+xDKSnPsJGA1XAe/cYWCPsoIKbyG1XjXeWVEuOF39CsjwOba++28w+v1asSewXzmLKDb7E8ydfWwPUi9brWTIlZ/tkPDSoV3UgI3uO0uRtUJZhuVp69tb5SX2Bx0DHsQeGR8wAzdUQ9vFLDPHM1r9epW5Y84vZI2NBIlaLNbdiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8E5myfmy78h11l54q33pBa2UGJU2T0udxbgaixtLEY=;
 b=Ybnf9ZgP+7v6kuqp8Tah24VflJTMA2jXqxZxej43uva4lDqMtuOr/fMD7RKIy6Q/UaBe3MTxZyasSup8xsMfUriSK2jKCvwOfsT0APkbLw8ulmjQJTbfzbA+LcPZDX5Lq96KhphDQWfeUIt5tjae75d8fQ8E/Zai/tsq7h8g1oJWSgPwTDzkO6D1WFyRQeGkvL08ioKlhrgB/KfXNQZ+7D2RgFtiHp7bYA0+jWKVKkMbFz/RSEZrthGerLnEC1bPSAxbvRgOoTVJuZYqDXvUFygtJxZ842moWUtsPV7OA/Cnw5pib/XonBOFmP2dsr37opCrM82PRr3pOIGq1p8A5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8E5myfmy78h11l54q33pBa2UGJU2T0udxbgaixtLEY=;
 b=GUfGCuHuBlfTi7u7TBEGeJx7Eme/0Fg3xS506m81Ml1BPBmreTgPvTME59wipYENV0RZDlRJ9MesVcu23hm061BYuHMUENB/hA9xrgLvktMEAyCwk2iBRETs4ZnZqXvdbxeCccn6mlbmvrIH3l4xIykLCXHMrPHRgozfvoL8N28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9721.jpnprd01.prod.outlook.com
 (2603:1096:604:1e8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 02:02:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 02:02:39 +0000
Message-ID: <87ms751z28.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: chenyuan_fl@163.com
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan CHen <chenyuan@kylinos.cn>
Subject: Re: [PATCH v2] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
In-Reply-To: <20250908012810.4767-1-chenyuan_fl@163.com>
References: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
	<20250908012810.4767-1-chenyuan_fl@163.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Sep 2025 02:02:39 +0000
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9721:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f1c81dc-ba09-4e12-baae-08ddee7bc9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hVUHcLXhWD6hJCZpwSCUX5zD05Tbr1B3UNlRzJ6w6fyDE+jBKgVYAYgEQZaT?=
 =?us-ascii?Q?1mwnfw9iBqoQr6k3DGkeM2ynh0/KvCqx8X50CkLXvlhEkGll2jgrNTQ2BFPF?=
 =?us-ascii?Q?1fHHvYnGZhORnsZVRAZmzyYwC+pNgoYMgHbeLTPhCW2Ry2kuJS5Oewa/W0fF?=
 =?us-ascii?Q?klY1lV4ox+e3TI4+r1Lx0QNic/Ov4500X+MoZkiuoH58gwBqRk1zzbjBCz5i?=
 =?us-ascii?Q?TpMiG07JCU7y6e3+SRsoyveEO9n56daUdLypondH+w7lz1BK1dmkCyfS1Pqs?=
 =?us-ascii?Q?dGkWTG+eJRKusiPyo04dH5Q42nrdRlXvPGX6fB8Rvliwti7QjHEGBFSzfujx?=
 =?us-ascii?Q?ce8hb5J1RwKHo2JjS+EDYkXfNERhM+HcRL7wJFXQ7k/9uV6arx8wOqVDR05u?=
 =?us-ascii?Q?6l/79VrDnetkxWOlH7Cw39pOnZ6lDP21LLdP65XgKL5dzJkxJWte31hsUn0X?=
 =?us-ascii?Q?rs051+4aM7NuQLaoJ75vaKJZSjdtjWZkB0AEEYethopjSgeMHuqdE4QNzfLV?=
 =?us-ascii?Q?MxGR549Uy0FN7J5LZ/gzc1tHD17icgs2OSTXKNL0Z1pfKUXgGuE3qrdcAsNy?=
 =?us-ascii?Q?SPy4M9X6xLQdUCgBeCpUxrT6hhynf5mYFITYPSBlPe5I/hDDzd4HW9JhuR2R?=
 =?us-ascii?Q?1IT7WoBX5QT71FyTcbYNmp/a5VC9iyfjEJrSIXg/QWkxKOTI3jPpYZStQIy6?=
 =?us-ascii?Q?XCiLQCfLRXZRaKKsf4Zve28/ae/5QTVtwQFcVFwgkItiTvxPkZlS+dnz6mBy?=
 =?us-ascii?Q?HX4GSK+VfQQQ6tBCSXOsPN9m+0Nwi1UB8uLnMGfJAuqdA8GwU4klkK5GLt5m?=
 =?us-ascii?Q?259iRcAh7PLGGIf7GMt6NoBpeoOx214XZfozedGEzghHwy9T6GcbRnbZCsP+?=
 =?us-ascii?Q?1dN7FCg7Hoes3PuSVnjZhGFgtFFgB3lD83aZAm+QPeBDz3ZOlzR0r3hnTApT?=
 =?us-ascii?Q?rUUBuAS6/OIYPWRtJf3ewoCrzwiJZ4pgIo5947V1he6dFC1FjckTHon9mDLz?=
 =?us-ascii?Q?lsWwN0WhB5TSRnXr4iROtE5usNNMw7rV5+QrHZjLYo0x/sbVV33e9Q6osXRA?=
 =?us-ascii?Q?CQjQohM0M/cH2QU1H6A6klb5Joxl2Mb+RvcIdKyntjKkq9L9PQ948uuUrbCZ?=
 =?us-ascii?Q?LCQ6UGziVHV6qrlElQIcdi9+tD9JSnOdlix2J5S+x5Zvp/glUz3DCM4ngtV5?=
 =?us-ascii?Q?0iFkBgDQjlLqGDfS59K+7CyjD4/mD9Rc48hbyAxisWMJhFWmB/uHgzi5L86u?=
 =?us-ascii?Q?5g9e0REjWL3rKvqGsUStrcEfkyY9aPSb9SU2gC2KzUbx6GQdNBz97WIZpjJa?=
 =?us-ascii?Q?PoD+bYNtjeEG6Sa8BwfhyCc+0QNb5lkR+kc68lyu3a4Y+HWoOcgyu6oSkpWN?=
 =?us-ascii?Q?/WyPJNIvXEchITUz0QtYYa7rVPwS3k3ASlGPY7zzoXMjmgPK6PHwpOuo4+uH?=
 =?us-ascii?Q?cQxge6KwuS0o4w6fK9MzUojYWdeEmUOpEOyiyAT9a6k12GMMkNTJdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SzGA9/dWKe4+PCKH8C+iI9bOHHp2hwqY/Nzn5MSeWiQK+HWFr1p1SqPAda6q?=
 =?us-ascii?Q?FMrWNjtQvcfhbmLeZTwr9NUmqiePS+QHyrRD40zY2C3urLLm7vLeyirAt1J+?=
 =?us-ascii?Q?o0gzThGLmEvESCxy2cgTTDKfd98bb6vpuyY5uf69gHisqtoH8z9jH2/6X4ED?=
 =?us-ascii?Q?cdZAK9HmEudqkt32HGKqmcTJ0czBIeHQG4BLYiFVn9azk52xYFGD42NH01Nt?=
 =?us-ascii?Q?5CSrnKwuSyjt2uJ5LJQC1h3qo0pC29VyteYA/ERbf8f5XSBO4m5M5YFHEKMp?=
 =?us-ascii?Q?CcR8haDdGSLsOMkkabGE2ZWIT3PlPV1RifDeayrJ2c1rxrbhyS3L9GcOZON3?=
 =?us-ascii?Q?/UYSvCtE4XrSnwDbqupYsvbzALyR/IcVCBpXDbQ+XPowNpwyN9ufZKKHPcmG?=
 =?us-ascii?Q?5wbSINRRnD+e9pDpEYLPcXQFIigVud/jEWgrBKQjAzIXAFX6k3gRVdRUa57x?=
 =?us-ascii?Q?4ShDy6ligtAb9I+LAKsbEDojzf8IhUHvXXTxhXqnBO3F/pQdlVwuZ0WIRYa0?=
 =?us-ascii?Q?nB6DIN3DVmpIyYyN2Fdfv7KrGRonwUXkMhkYT5lMKUeU6ev/dMPOdZNbKxQj?=
 =?us-ascii?Q?zoyffitoYWhJJ7br9HFYWJhEJyE8tv2wUDi30hTjnKUJgy9iehSN63iSIx92?=
 =?us-ascii?Q?tooeK+n3uMz7t1BppQZcm8eiQZAdnHlvcIgGaOfYppjBsATjcEhfZFDqvX8n?=
 =?us-ascii?Q?Y0R/qzLSxX0grc+jW2CX7BpIKcVJi3fRCupdn49RYLOJwC0bUCaUlUACeA49?=
 =?us-ascii?Q?O5+aDr0mnCbRheJz0g0zXUmLrMJBvdN7wzVJ4qiYSGkV3BH0lf5xuzG9nO45?=
 =?us-ascii?Q?gIp5Rzw3VwrDUojfECserZjbFB9IuSpk08hdJVJ/wVFQTlcDpbOsB/KC8yl4?=
 =?us-ascii?Q?jKz65I1LBWAyUNTSJTSpqN1PynTYiK1zWwRCgQmRPx7WEgaXmbzIpq0ghpeV?=
 =?us-ascii?Q?Q4xaEMdNepR7AS+CJUNiBgS8hAqY4qsvZ8ynzzytbHPyvPG4LVHoaj4EeE1i?=
 =?us-ascii?Q?VGPn+Rmgt0YV+4vN3/sAfhbCG6EKMhad4BRUj425xCy4k0mjuohq31YJ1Uaf?=
 =?us-ascii?Q?AxnhZq072WO6NyXmtFn8gxjt4zrtPaNQIXr8+3u/FwIphOVfcvlDVXue5Npo?=
 =?us-ascii?Q?ac6/uDU75DAS2S/PbEsLRTtWo+h8f3UhIWaetMdgiEHdYZCSoDIo8PTHKKmd?=
 =?us-ascii?Q?f/Mi8xSTPyw5ejRiA93m5OLYi9vHipUm9/XUWVAFwUl3fFfSyWCA5Wt0kGmy?=
 =?us-ascii?Q?B1/nq9AvwqZBKYCVb4UuvW2WtwCfAcoxAlNkz6OwdC32SP5knmst2DgdxQo4?=
 =?us-ascii?Q?x6zYAFs/n4gPY35fkK00vR/jAsIV0hyfDh+oAc+XL6hneIBRYQhH00wRCpFV?=
 =?us-ascii?Q?CJFmcyHJjLyWHTBNrSe0vKgApXSwyG7KsUQ98dfmjR6wNqWD9r8o4L17ql5c?=
 =?us-ascii?Q?/1GTfrhRiVadkNwZ3z5TDwcC8/+WP+R32yHw0ceg563IPY66MeUeFsjtfOkG?=
 =?us-ascii?Q?tX3BMbF0dp99LArAGaUP0NRG/BEEY11t1gtiD2fvOHwx81qY4My7JJspg3oS?=
 =?us-ascii?Q?fpSr2hu5c1FBJPqtHusZGeOSdKDcaIiDdZBwA5B33UlkGEtB/96fFvzspwVA?=
 =?us-ascii?Q?UG3EM2kAcMqYPu+UUp8AE9A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1c81dc-ba09-4e12-baae-08ddee7bc9fb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 02:02:39.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyFD47VnwCUlKki23mef8Emj7Hc9eVGlQwxKCGp71A0jDRwzsJY5CdNY2ckaDYpXNS4rpejZVjt2CIixmcbdgjWNLFnzCMYX7ps1iImvNURVdb+YMtKWruGZACMiol3h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9721


Hi chenyuan

Thank you for the patch

> In the current implementation, when krealloc_array() fails, the error handling path
> incorrectly sets the original memory pointer to NULL before it is freed,
> resulting in a memory leak during reallocation failure.
> 
> Fixes: 6aa17547649 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
> Signed-off-by: Yuan CHen <chenyuan@kylinos.cn>

You want to use ${LINUX}/scripts/checkpatch.pl to get maximum 75 chars warning

Patch itself is agree, but I still don't understand the git-log.

	incorrectly sets the original memory pointer to NULL before it is freed,

I still don't understand this part. which part are you talking about ?
What does this "original memory pointer" mean ? And what does this "freed"
mean ? freed what ??

I guess you want to indicate is like this ?

	In case of krealloc_array() failure, current error handling just
	returns from function without freeing alloced array.
	It cause a memory leak. Fixup it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

