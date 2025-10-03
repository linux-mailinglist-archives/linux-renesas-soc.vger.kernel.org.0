Return-Path: <linux-renesas-soc+bounces-22634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCFBB7C44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 19:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33A1C4A4C75
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 17:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B07F2DA76C;
	Fri,  3 Oct 2025 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c/RUjTKM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320324468D;
	Fri,  3 Oct 2025 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512823; cv=fail; b=ohhlfOIpYBqXmmYHhnzxkTCeA4YbSLzBMCzph23xYrEpe1fUN5byUEH5L+fnUjugNyA9NU/12iOpj7U2H+iWmzqZOXFbtVH542l4TaZRHaXef8b0aZgAj24G1tgg3nSamxHG1U4WWAa3Dfe2zl3UHFKd6dgVY3B3suiZdEfNg68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512823; c=relaxed/simple;
	bh=1/cxHlLsHuDp++3rfs1YzdxsjdxErooZL9VSQXUahlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rUtdZ6sjOhocQUlLpeRWQ9C/20cmpoYkDclTbm5PvWuhgNvPTqJA2d4LGIjcc4wy6SevQIQaNXkOHSUY4Z0AHD8cktGK+NG9JkG7DOH8AuS60AsOob8t3M5cviJIrT4iUA/s61pgLYilXTtXhSJe/f+wzWRwlqRix9mmfNJlyzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c/RUjTKM; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjoJXhMhSQR74q/GF/iCpTzs4IHPvhmRCoI9V5mosfE+VY1VTwT3BhTSP8hbJ15KnWvTJextyBTh66P0xxswIlj7L/vy03NvsTvPDH+D325dvbBLvIxEFohxQeihm2fkfLVcJei4MtoEGfUrEvyWJQcBYDSfjYseJRnamyKFv4a0D53kKZltYvFpAVKrTb6m6f5T42ov7hPRTa9En7Hi+hHhUANiWFYHOUMQ+O9tuB5p8i6ci9tWrsGAozgBUZspbnzdoih+YPa4pFiIJ/VTmGcse0yNKkZROT3JtnU5iQHflrw+eowIbS+pa9L+7QkRAe7t1MdFtaPFGzna9k2L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE2nur7VhG2BVTGH/BvHp+JldGSA1oPT84BxhW/xLG0=;
 b=ilLrwu7svy/mB9+sF9nTUren5Q99Dq0b69cnWYIKp0NW3WJR6elqd9p2XsluaeoIUzwtYCTJ7wn5vO9jBIycOUhS/DlHveHkOBRDO/AbF6WGcpKpurY//3AIzsb+f0U2d3qDzwbc0C8J5P9Yaufwhv6Q8a07wydIeYlopRdq2DITCz0Z+2nrDAbI5lGJCGVl9KNfKjlycUmYhnqmFQbZHtckPYfswS+xHDkHjOS9NQKUU8lXx23CmCTSZs0nNiAN4Migm3EcvneE+YxNqVBQRW31h1tdupZj78g0zRENVsdlRFdzgn1OfP9pU9HNcPV7NcJCPxE+aRVYHS3aW9F27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE2nur7VhG2BVTGH/BvHp+JldGSA1oPT84BxhW/xLG0=;
 b=c/RUjTKM4ptKGa0892/0F4acDVGL0hKDKwlVm8iAYSCq+Bu1JIL37nxPSr/7k+V359gScofJPtkSKS0RPdvyVy+CCu3XbaD0igr6IeJ48xnYbfq7cHKxA7UUi8k5SDiCAcULv4zmOvfYpl7Fv1/zdVJsaHdxbWSNKebuZradMIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB12036.jpnprd01.prod.outlook.com (2603:1096:400:3fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 17:33:36 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 17:33:36 +0000
Date: Fri, 3 Oct 2025 19:33:25 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] regulator: devres: Disable exclusive regulator
 before releasing
Message-ID: <aOAI5cfA1HmEc7Rv@tom-desktop>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
 <20251001212709.579080-8-tommaso.merciai.xr@bp.renesas.com>
 <ae2701a5-8662-47d3-81fa-30e832600423@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae2701a5-8662-47d3-81fa-30e832600423@sirena.org.uk>
X-ClientProxiedBy: MR1P264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::21) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB12036:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d9d631d-c81d-45bc-a490-08de02a2fb56
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZF3Zft8pjyZ3i99tk+6uDEhEzZiWUKesKAycn0dRu0baJXCapYZyn5IEO2Ez?=
 =?us-ascii?Q?V4emlemFheQWXAE3TEq1LmviLK730LYaqDnGgmxHsLx5pHAa7nOJbaCP6or+?=
 =?us-ascii?Q?k1pTHGt6FgoKV5lvIn8T92i2FK3m8zRqkFP+9XHP0V5sENfQmVdCEw8Y78tp?=
 =?us-ascii?Q?/UgI5weUp/Z4fTWwxo7aitjb50+NkJvURcNaSlWvnBwilV//1w9c60wT4IU+?=
 =?us-ascii?Q?JwGQicDL0nJwlJOFFhO5WX9aBRIAKezvuZTJSBIpDAY/0MRNVULSK3h4fWO5?=
 =?us-ascii?Q?js4iOM7Nrxws5Gfpc+/dtRSFgvzQ4eHsfdll78hs9nAhtrusU0/GvIUm3vPG?=
 =?us-ascii?Q?mhmuPSZeyRdemLLIkQ7gtk1rw4ZNVvA9xNVX69yNlsMHbAafgjLKotJt0NAV?=
 =?us-ascii?Q?KCXYbT7ebenyZUTVFDTm3wexioFE2flWqVbzZ3S9M/F2LRNTkVmKQvEybTKu?=
 =?us-ascii?Q?iHJnvIWB1C/gUt+TheEdrpj//9Iy/iC07OAeZsU0I/QO/9zQxOKiuN2tQYUj?=
 =?us-ascii?Q?71r7ukbcln2VqBVZ70zRSk59tR1XFKZzxPJVxz9g/nR5MmhDzZv+r43eUEyB?=
 =?us-ascii?Q?6cPWdAmLV1G6k6frCjOBEBlIlF50bZ1U0Go8NOwjaaVma/4PqEK5ICeOm7EA?=
 =?us-ascii?Q?1++hzRP07l++prtPJQkDZG4xrrnNasJCYN5ksaQtCL3Apv70biteKVNt+3Wi?=
 =?us-ascii?Q?oHfA55YvTU9Hmv+WRMAUbA/xuMi0WtA2ierY8HcLozj4dvOli+UsWlEAdZRN?=
 =?us-ascii?Q?gNKgm9TF7IOtFvB+2S6SDlLe0P5tF2MOSIj3RkCEwXwLh4peJJibuNgD0pF6?=
 =?us-ascii?Q?kWTeZna3DWCQn6O7kod/nyNHSNHri92qugEVJRUZtznUvNBYq1sWzjfGtwqK?=
 =?us-ascii?Q?PENKL6erX4q6qnxlFfirMKKL8/eq0izmQv6f/FhoP4i/LbGdpiL2PEmmgz9J?=
 =?us-ascii?Q?i8FT4H1WC5Gy3trrjQNuyAzqf/DwSwNuduB7buhYhPlBlvblotlftCcIHDvk?=
 =?us-ascii?Q?CGcAjINSPo2AfjnhVDZyzA+N2DQ4jNpEm4TcdtMgHVBNDuPDbbahHcP6Ua4v?=
 =?us-ascii?Q?Qm0bQD4wwrcm+RI8Ryw9kUr2EZ5v60JQEJT9wjO9EJomrW4zASPA8EDQNcIa?=
 =?us-ascii?Q?fck0OA/SPrQUGoCbemC+PJeM+XKX/7UGBk8ZYPYyPd12vxABtCYu3/ETMo85?=
 =?us-ascii?Q?VsyICVzeR2FvGJHIL0/9mQnoCA5rpcN61ac2JX+0NaPkk5G8E/Ul5MFwCWPu?=
 =?us-ascii?Q?1qQq/X0m0S3gwirsEwJR0bI5YfyuYj38ZFxVlZkIVGGG/PiUTHCbNSQpK0LB?=
 =?us-ascii?Q?QLtT+B4MGAPG02mrJI33TbL8id54GhaTIP/7ezjp+tvyyr3po4ZhuF1z5OMN?=
 =?us-ascii?Q?LTNvUHPhhFHF6f7ExKLWA3SXjc0BzFVQMzrA9qKZNZhKI2jIo1q9KX9bOjaF?=
 =?us-ascii?Q?GvWqumFcGBfThpHgsYYQ1AbzpsngHhT6a8Smuieo2EPYCRl4mJNgH8p7+PDJ?=
 =?us-ascii?Q?N/Z5JSvLwybD0SzbBQV1kKOLgSjusmktTLIW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hEoWSHtPtGgYLynnpAQMJkObBwpUwSXMKYd5Z0g4fKelxenIKF1k5lP9rVu/?=
 =?us-ascii?Q?Y7/f3JGyhwoKqURAKjW4GE1fyBVThmVs7vZKtvqedjd28CyhgqMj70R8z//H?=
 =?us-ascii?Q?Xm15X108jKfv+RuZ9tti/2ZK2sZjS0iri1ZKruO/g9h8cMr7dyQN2bx8iY2X?=
 =?us-ascii?Q?he5dK2rrRYDO/2eDCY3CCHJV1rh9mypbjgsGW8rVf2bDzc4+6JPc5B8WZVJM?=
 =?us-ascii?Q?qbeD6G76N2wEPambhbdHDCghinFqMiMFPKxv03N/LYBD3o+hb8URvsztOtdA?=
 =?us-ascii?Q?7aJxfzcSJgFsrK2kY+Reqqu+0W5+glWoUuWKrXQsrDyaJPCfJICcsLfOt1F1?=
 =?us-ascii?Q?/RCXuS5u2RH9NpSTahU1cXTiPjY04dctyAVp8zzWKpwLSq1dGCuz/ccBFmls?=
 =?us-ascii?Q?1G96tdI6B9ofO/2ZwuOozm2WUoIcKeyQKsfhK46n7MyNgBMS+jHJadMYCbRQ?=
 =?us-ascii?Q?OVaCmDuWHsp/zHvYi+JYkNnGX7YYd7ht0pgFGdR2dVUDOy0/e4oo89a1LlCJ?=
 =?us-ascii?Q?aAmoY0FHsGxJeJWRmyN2wQTZk2tezXybmc0d/ML4lL9Q7csNEn/zGdUPHmCe?=
 =?us-ascii?Q?0hAM2AUZxAD9fCMJEEEbFbOiaz61ttqL3LCdMHueBsyCfOtkBYAA1aRkvSiN?=
 =?us-ascii?Q?JuZljlzwJBy3s8YWPXoXX3NJfBrwcNT+F7SoGNcZBYLes9jf0OVUqKsaCIXR?=
 =?us-ascii?Q?EL/JnLcl/dgHbBG/x4Id3r44l8ciUrfFyHyHkOAGpIhxz25u8zJDIrZ186HW?=
 =?us-ascii?Q?SvdQIKMl156kbhVm7ouin/KhiUydo7u9MHqeGBuhCBviq59vDkZfFG3CihVE?=
 =?us-ascii?Q?JdlIGTcbJ7BTDW3KJ8FApmh0hIUWHsITp9YHQc6I8L28+z0XWopFjW7/rJe6?=
 =?us-ascii?Q?Q1jDmYUOalGAlLj5DF0xqY0KqKc8Bkx5jm6T7/sQA6lwybtx83SqMwhRyPtb?=
 =?us-ascii?Q?ALEG/vEZHfDoNU5swgjOBJEriQMXrKrUnpO/UXeL4Mi9dU9WOAg4XLpgH9aw?=
 =?us-ascii?Q?ajHDPaNlDw1cucBu0Z/d+2NbvzjhdpfrwPgX/pSKt1jZvgQqLStsw1u9P9ts?=
 =?us-ascii?Q?pu7zZa4+hR1FOXUZiiosUsH2wihnAD0QPpVF64kKfAx8u5PM5yQ+jD5WcYbz?=
 =?us-ascii?Q?56NlkAfjrVsNcmQWCJy22T1Z99zxMKX6+dhaHlMU/4RKI32NFdKQoqjQD4zI?=
 =?us-ascii?Q?/+125O6vxkyxUABf2jyJkuWnb9Ga9+xRODENXF4iNI2dUkR7s4+CioifKsNf?=
 =?us-ascii?Q?EU659jzgQO9jY3hxPYfZHqGDWk+SbZdNNecDI6czDSCvF4/GKjCeWebwGKTt?=
 =?us-ascii?Q?0D9/UORbUQjtXxKPqOgaMQn+bA8hc4LYVTNMwvF33ypq/BUiqxH7gMFnKihy?=
 =?us-ascii?Q?tFGcqA6yZAVJlhrNTdfNeO43jcNgRvxkoTuBrjPKWPSpHSlHXgGyCQO462dg?=
 =?us-ascii?Q?cDjv6JSHTzIshdEgHQPb+WCVq9o42lthCW5FzV+/IRvxPcIq9FLzEpImVANF?=
 =?us-ascii?Q?2BguehgmvKu1sLoLi4uTWqLy/94H7YbQmZM2EKg0tNW5y5NjopTmMP7zT0AX?=
 =?us-ascii?Q?401DFbly+nGHUUKv+5aa+aWfETnY4m3q79dMS8sdHQvbc6kA2qRDB0JYAtM9?=
 =?us-ascii?Q?bdn1CnuQju8t+YpEwccroFU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9d631d-c81d-45bc-a490-08de02a2fb56
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 17:33:35.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye/D3PxW2tJI8s8r2i5QoaJHAkr55NudiGXwY5yPn+crTxZTfjFoTDWe7OW8K3865KyuUcgxLBekyGDnv/O0dclvuAt1PwFYAzG0FXn9W8pSumAyeFLhY+KTz1QCvFi0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12036

Hi Mark,
Thank you for your comments,

On Thu, Oct 02, 2025 at 05:29:19PM +0100, Mark Brown wrote:
> On Wed, Oct 01, 2025 at 11:26:51PM +0200, Tommaso Merciai wrote:
> 
> You've not copied me on the rest of the series so I don't know what's
> going on with dependencies.  When sending a patch series it is important
> to ensure that all the various maintainers understand what the
> relationship between the patches as the expecation is that there will be
> interdependencies.  Either copy everyone on the whole series or at least
> copy them on the cover letter and explain what's going on.  If there are
> no strong interdependencies then it's generally simplest to just send
> the patches separately to avoid any possible confusion.

Thanks for the explanation.
I made a mistake when I sent the series.
I only ran ./scripts/get_maintainer.pl on some patches, not all.
My fault, sorry for that.

> 
> > Ensure that exclusive regulators are properly disabled when their reference
> > count drops to one before they are released. This prevents possible issues
> > where exclusive regulators may remain enabled unintentionally after being
> > put.
> 
> The reason we don't normally drop references that devices hold is that
> we're allowing the driver to control if the suppy should be disabled on
> exit, powering off something that's critical for the system just because
> we're not managing it in software won't go well.  Consider reloading a
> module during development for example.
> 
> >  static void devm_regulator_release(struct device *dev, void *res)
> >  {
> > -	regulator_put(*(struct regulator **)res);
> > +	struct regulator *regulator = *(struct regulator **)res;
> > +	struct regulator_dev *rdev = regulator->rdev;
> > +
> > +	if (rdev->exclusive && regulator->enable_count == 1)
> > +		regulator_disable(regulator);
> > +
> > +	regulator_put(regulator);
> >  }
> 
> There's no reason that exclusive consumers don't use the refcounting
> support...

I will need to move the refcounting handlingfor the exclusive regulator
at USB driver lvl.
The drivers/phy/renesas/phy-rcar-gen3-usb2.c is using
regulator_hardware_enable() for some USB otg channel. I think this is
the reason why I need this patch to handle multiple unbind/bind.
Without this I'm getting some WARN_ON(regulator->enable_count) doing
multiple unbind/bind.

I'm going to investigate on that and I need to find a solution at usb driver lvl.
Thanks again for your feedback!

Regards,
Tommaso



