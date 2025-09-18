Return-Path: <linux-renesas-soc+bounces-21990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026ABB825D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 02:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD70E4607A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 00:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274CC17A300;
	Thu, 18 Sep 2025 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CahEq9A2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950F28E7;
	Thu, 18 Sep 2025 00:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758154807; cv=fail; b=umWPe2/ljlpB599/uVcCQSO2hhaqigYAmJ90ySK7QCQefNvNLKetJGcgam7yETQ39hrR5myXgyKKWEQI3MtcrAE2Rn+2G8nS9gZ0qWT+DyZEqAXf+FLkqcSLtNWP7vduPA+eo6JiEsbtLDSJzBMcGFl7j9oMk5tPwCz4BYiyXQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758154807; c=relaxed/simple;
	bh=n0jAew2uAZ2K6eUwqobQUCABBuNQlSytdGAtb+M5ZIM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZvhozDpcYLNtlk5w9awamoyTophKtxDS4oj5aBAa5vU3Rbu6mWrmzur7C6LCJ27yfa7gFyPKYmQCPvXoXkg0j3aywfGvhYONfM2aR3+YmilPW42Qt3WJp+o/doeC5BNNeNYg05SPi6TT8bIxu97QGX9hdjuj6yQkXUWcYanJLAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CahEq9A2; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLpb8F1xmOSpP9gXvPCkGL5aR0KEPo74j3oYhbpnH0JZ1Zu6KWoV0c03S1w1oxiRrjbJI83oQMgGk+C0o+2yNOXHvdQQD2i7Ms0th8agCiT8OLaucco6zZzpD0nR1EKeta84ALLKL8yrcoygh+q8gt4AJBi7W8owRKDe+g38GaS0RrPBWR8cQwi9kABT7qwXbgjeVK5rlem5umh/dzq+tVXWiNB8D8zh19LHC3G+kLK0MgYdDM0r2hNU6XazE3q03n+O3ZmEXSFAI5DsLkO8Vj+QUBCqBkRwsIlhIdR9I3837OcmlP6hTYQYK6LKmmuckCFQnaf6GiNQ/TI1V+jcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1hrD2EaAI8fLXMLR09RWk+LkneeQ74KzYGXe7ezNyc=;
 b=nf2YMWlbM+r3no3szuOd4W3X+JsG/tpgcyKLXl9gACA+CFzsSTGN5xy21OAsBfCirt/LznKd1zJfV46IE6XBn+fbkED/ASvkoceRaWYstwE5GQsqS5WBwr7mrc4muAOf6rmWBItB5mQteEmMoSfuR5pI3aU/a67g4y9snNWsKjFaIeqVoJMkhAt4yVPrvZOCngfNT9Ci6RwSKvo+qozPnTMmuL89xbuhnKa6QF7BiDGPIxeiTmghwPobh0rjO3l0uTtBZLscLe0SS31mgw5ga1bLKhh2JFH+c8BUUMoLzCZKXBSbjd8SQa1JUK56jqiIcRSdkQxGHluqLjbOJtz+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1hrD2EaAI8fLXMLR09RWk+LkneeQ74KzYGXe7ezNyc=;
 b=CahEq9A2v7EOOmol4J/tAPNsLZvJpb0nSEZDOSjOMmoYCBxzx2xsPgNUgI1KIYa29kn3h/syGwWbhLKdwtFagCnwiiVihXGTtn+x99Em2msLxJi3zfqUOWTIJiYc1p8Xj1TRsD0rqRYf9wPxwdJJnN+c55AGkfJo+/jPOdTUWL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB15738.jpnprd01.prod.outlook.com
 (2603:1096:604:3cb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 00:20:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 00:20:00 +0000
Message-ID: <87cy7opq6o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marc Zyngier <maz@kernel.org>,
	"Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <aMr1QjI8vfrP_fwD@shikoro>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
	<87ms6vi0js.wl-kuninori.morimoto.gx@renesas.com>
	<86v7li1xs4.wl-maz@kernel.org>
	<87h5x1afgr.wl-kuninori.morimoto.gx@renesas.com>
	<86qzw51pmw.wl-maz@kernel.org>
	<aMr1QjI8vfrP_fwD@shikoro>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Sep 2025 00:19:59 +0000
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB15738:EE_
X-MS-Office365-Filtering-Correlation-Id: 2661ca3a-9cc1-4ad4-3092-08ddf6491aba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V7kdkDf1DsxWKjXkV3tYhIbtZOdpYB9OyxbLTcPDuSjsg9rfCXMd9qAhH53I?=
 =?us-ascii?Q?GQ6RypCruo7Wk7jtflACJpZjgV/kl1RztBkMHTD5ZwV7jkb8PVgRgVNLMAlf?=
 =?us-ascii?Q?NzPezeVckns3CWvYSUAPPNCzEL5P3YzqYr8XHLtTv1xB5vJZK/9yqrNL2JI6?=
 =?us-ascii?Q?8QJnhQFrNr1K/1v+s7EYSGzcga1cje+Ca3vyWXsDIl79uU/U8IIq3SVqEP2H?=
 =?us-ascii?Q?RmWFtVBRApxqqHJpcLiD343i/i/BdyFsoYdKgGflP8gjsFFMcF8xBYmyuB77?=
 =?us-ascii?Q?v5NDrwCegUUIrEvGcAEFdqWXdg5Dw1n51mra+ydyk33GmZ5ZubxSFzWHxExV?=
 =?us-ascii?Q?E/+XwO5qpImqOUzdBXoQb857J89EYqGq6uUDI8ta8yCQLoK3ZokAzGeP9owl?=
 =?us-ascii?Q?Pf7HKgUnbu6Q+7BRXFIN880pXOgZJgpCmhM5HRwIhrNmGcVycw13+CwL0YWy?=
 =?us-ascii?Q?bSdwx1y/zzV585uJCRCZBN68rCf9dcd7+PFLzTyNOzC7+L/0r/dfL56PjZKp?=
 =?us-ascii?Q?t9XhBam/AMQbzjrv/VnQFbqPG5+4kS0ifdoxJMYuTpjWKZrYG07Phn5CpfTm?=
 =?us-ascii?Q?eWT2CXR3drosuiCqNiFejEiC2hJs53hX96TSLg0hCE/Uz+q0/TidDNwMisEx?=
 =?us-ascii?Q?zZT0jgF1a8+Lnt1a9NeDbrQXu3N58rGDn5a+4giPqkbuqUcHBE5i6amW4dd2?=
 =?us-ascii?Q?SEm4Wlt0LBdmFG1NnQE8umRvrfWgzT9BIRAGRVPjK1CKYjU6N0uxUYouW73p?=
 =?us-ascii?Q?Hu7i+uL9B7/s6wc1nKUkq+rJZs6Lza3m218Y++Fyc+vp+IACrfmqjbQgpchP?=
 =?us-ascii?Q?B+taZOTNPNauLQJjmpsAL1/BfYlBQQpbxJBY5Z/DIQT3ADqNXs35+zDV4JVf?=
 =?us-ascii?Q?CbFhhiTg3pqBQDGc6+lUFdvyA97dvPJL6TMHSQ9g2bSwTDx5jxzZvm9fJpmb?=
 =?us-ascii?Q?EibY2mxMF9ban5Ke/wh+k+gp3i0rArkNFmer/wnjlxxsbLi/qgeTNbpsmpek?=
 =?us-ascii?Q?UPUPGZ6FBIIF72AXcWsHLLs5W+LPpbiamM0mGwnbZ5gF2hxtiTqVpFagIuOt?=
 =?us-ascii?Q?Foc+SNDJQug+ESyRT31fmzGHHcHMKmJY9V4Rz7XlAMJ8Y09rcOM+ZgZhtBXD?=
 =?us-ascii?Q?j/Q7PLBGKuxiIfEa/oNe3rjfTH29JtwiLE/NLNLc5eo91pxWEmQPfS005t8b?=
 =?us-ascii?Q?c/6HAuWQq1eJqXzZKHnEgdPju1b4b/gWwcSXYC24wK4t5kttQryL+U9AEwED?=
 =?us-ascii?Q?CEDuIlOsdRowiFoRNuw1viOY3GJd9PQ69RZSj++gakpLdcHMe1HtgKyfMB9d?=
 =?us-ascii?Q?50ZP4XzSUQxeWIdEQYUpuLhasePMDLvTyY/1DMbSe+ZBXvMLiE1qU8uPu5RZ?=
 =?us-ascii?Q?QkYaShNwY1aLth2lNA+7DjmCS8Dl+KuD8BbF/N38cEw6XwKAYZXSTgTu2LkH?=
 =?us-ascii?Q?G0797co61gfKaoAvjkuK9gtKI2vB4jffpCGHjCIfNkv/ge2dOQYtwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j48JXckX7QYVvqxi11w73NS4uf3WdHXPwvHuuSGP4/pqBHn63h9AdhzJaFGG?=
 =?us-ascii?Q?gW1cTDZTIHO/6w4eyPHHxLJimmtRgRjOYLgeJebp32OYt11Os5/cvPqYLTJX?=
 =?us-ascii?Q?TNSacNZFxXyII4nCe9SsEd95aB7gfEgNwQLoqCWOtufbR6dmhBiXM5oZaagV?=
 =?us-ascii?Q?ekHC+xbnZXu5WJDkeIBJh8PiSBaP2j8n2bFrUVzaTV/YVwx3czA+Ulyjb7E+?=
 =?us-ascii?Q?FmW8rASN7gz6DzavYK0pTueGs3GEC8slOnR3kPxj+M+UwQ1yMujivux2sKv3?=
 =?us-ascii?Q?SQjTgq70bXm4d+yEZR9p5kEnVl5azQaM4alEd67c6OwJZyAe+NBP6UDZK6rg?=
 =?us-ascii?Q?RQHoYjzjn7D3/IWTMHbioqGQw1zykEvGDR1/dnqiKoKRArxByKuvp/vH9vCj?=
 =?us-ascii?Q?Ta1ekNkpnQyQaGl1MBunsHJwvlcFCESmvrFQxp7rcwuqBlemK6XB99Jg2DCg?=
 =?us-ascii?Q?YnP2M0sfI+M1+ZvuQ8ywaacMonq0nH+J9ga4Uw/1fOOzpQ2p9TT30Gwk4eIX?=
 =?us-ascii?Q?98mnkU8j2hbVkzgR+8yjCfF8MQOGmxHKAtyVdU5Jj5YTkoiaRIwkM5e6254L?=
 =?us-ascii?Q?bToNQYV/qdMR3pzYSNGOf1su07LwhZoQ2lE5Cqi0ueRwm9xQhgFX7nCbQwxk?=
 =?us-ascii?Q?tHMjxGHp7ZvfZeaXveMEtvxNxEkim88EwhXMW8TAPYYEUz3+Vlu6Lcji7w5u?=
 =?us-ascii?Q?CU7zuRb5kdLhx2vS9ud0ybCKdqQfAdsDesKkp/RaOB0F9w0liw7pwA4Pg2xL?=
 =?us-ascii?Q?nNVTk78oqlA5hxZXyAPg8paC3kqc7yYSnF22ARbRW84AQXbSOAxpXHO+ldbL?=
 =?us-ascii?Q?JAJhHNM2pTP7PiclLFA6FfSo/izXjCQr4018DBG9h/PTxCdIfjfxM11bMe8s?=
 =?us-ascii?Q?FbISA95ozzqmdIDFMzZxFZan1HRH72dbrKUq7p+GeVUd+JVPv9gq4HGxwX9i?=
 =?us-ascii?Q?UM5NHra1+BbdJKDCkSkaTNi+zXQAGixH0ZxAOeMlpTcm9i1UliU3slxwbPYY?=
 =?us-ascii?Q?Ef9ihFIKF+fbWwyjmNbgF4hcnhOXt+9ZmbUiyVAm5Xrs9SSUnRl9FHBJMbY9?=
 =?us-ascii?Q?IrfOrAzhf4d2JD8HseRTcvfZDvXGsaLsMcqgkT+xaA9MFCUpuv0841EgY+GI?=
 =?us-ascii?Q?CAob6jvm0QIuO8pkb3RdjeBfismaDPgvs2/rXukyC4K+5STRtPCwHU6wsupE?=
 =?us-ascii?Q?Ksf0XZuhvf6BrMMLjeoMH3NGpzEOCG3dfunPKfVtjqpayb+q5+/ofNrDCLq4?=
 =?us-ascii?Q?PCI5a47enxODm1c23RKmDlhy/FwMrChdiA+Q1KTsgRDMNbwbCgOacOmp89oH?=
 =?us-ascii?Q?6urh5FLaD1DnPsbju+WfzIF97jrG8DvafG7bG4hEH5LdWP24UYgURYiYhaPp?=
 =?us-ascii?Q?ElJlE7E1bO9yaow57KNFoGioi7/Su7NCwHl9sp2fu/g52r9t9e/ey0JYpgXi?=
 =?us-ascii?Q?5k/++AJaLGkArkAG4ygA57/ATnZettgY9gXrNuJtbmcoreFmPv396HsvFD7R?=
 =?us-ascii?Q?5T4yMlsSShENy3qcO1dJhhqvgId71Leal9zgsg3OJUHlxJPA+CmGdBQ4clty?=
 =?us-ascii?Q?oO2kXufd1XkdHocj3rIHfA8+tZaPiW4z87vXiR3kOhCtvtx+DpG2949aN42E?=
 =?us-ascii?Q?I9tltCRG4XcDxjbppuzGiqE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2661ca3a-9cc1-4ad4-3092-08ddf6491aba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 00:19:59.9693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOBN6vhPCRudU0n99dsJ3O3Z7REtc8Y/hIXxcD5jOFiMLw6BSv5lheeDlJYm6HRRnKTs2OnrwAqErf1M7KyAi8y5cZ0TommDQJLslDzvG4N2wlbKu7/9gaXvrS2QEiZ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15738


Hi Marc

> > > And, the datasheet is very complex, I don't think people can find it by
> > > himself without any hint.
> > 
> > I guess we're just a bunch of inexperienced idiots unable to read a
> > TRM.
> 
> Please don't feel offended. Morimoto-san really has a point here. The
> datasheet available for us is currently in a very rough format with
> *lots* of attached documents with hard to grasp naming. I am dealing
> with R-Car datasheets for 10+ years now, and I do have a hard time
> finding the information I want with this one.
> 
> That being said, I agree to the point that it is not very helpful to
> reference such documentation upstream.

In normal way, you can find GIC base address on datasheet as "0x38000000".
But we need to use in Linux is "0x39000000", but it is not indicated, and
there is no hint about it. You can find it in tons of attached documents
as only 1 line.

Indeed the person who can get X5H datasheet is limited, but I believe
that it doesn't mean hint-comment is not useful though.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

