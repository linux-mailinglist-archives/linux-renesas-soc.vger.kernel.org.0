Return-Path: <linux-renesas-soc+bounces-27303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC8WOHlEcmnpfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:38:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F169062
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 158F2300050C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 15:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5693344103A;
	Thu, 22 Jan 2026 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FukNBNwC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301343E490;
	Thu, 22 Jan 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096311; cv=fail; b=AMjMX5hXAAqH9aEQJpwanrC5TtvdEIeq8aL9EStBDjWMAk8Hv0ysXxTJqNyQgbVm7SREU5kFTYXU+EZLQzz4qAIT3XbU0G4FPco+r0bZejGr0SIp/FTxJQtxr+VC9bQbs+p2X9H9gPIDB0IQ3FqMYpIEMzyley1PqDRq0MKzyiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096311; c=relaxed/simple;
	bh=tUllh8LAW6HX1dQ/q7cw94RANPXv4BECd+b0QLynxcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CWqgOD8Rir7ANo4HUoBseJ2LerIQ66yfnafaYBWEiXYiWD7+sEZjevnbjq3IFuoNNQ83rBQenU72LZEo2kmQf2xDU4C4hMQd2/zsshB8NmRZDX0ove+joX3kUV2SOxdkZS+hDdTGOXKepHUW0+LCvPI9wGn5mQVUy9WCHaiQTwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FukNBNwC; arc=fail smtp.client-ip=52.101.84.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEe+Da/zV/sqN9Qj880SxZil18vZeUcfsP2lxTEXVzJ0CqbuRMNa8Ty5WMlOyaf7TRFStVh3w6fWoPy+1qH/OileS9z0It+N0noZ3dePHTYV410dJ8mUpi4JS53aVju/ubXClaJgqN4SGl86OpPjTgNWyoLzu5QslZ281JKMGScSv4ZL/SrUgm1kZhuBYyVtSVrsom5jREOPESRQ6eitqXZ+Jlx2CjRNG0JqRWSHpq0iZfh+qmjDTssbfU8bxtRHgD0nkfjm4Hqs4nsa8OFNPMtZbNAVmIcI5zF1Ap91zL7AdWasvicMEr1AIuHufbGjyMX/ygSlayDNVRcydwwFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U82uajGgeS1ObO4IXFYBGclph34H8/r4n/BLkRmQB/s=;
 b=ttGUEan1QUQ4DGtnd3ArCbWT8bNnNszszM8mjK+eLzb28hs5awbRaurYPhB3g8huakODCWSSndEHQnSdzwPrvnJgKeLgVQvFzsrFnZdB8LAKVNpyDeIxOv+N7qcinzTiJTvJZUoePEmQZC0We9ZXIGkY2QFbvLIJ9w95N9PHo+a8pGwqWgEVkDW02dne8bzgGc9dZ/AOFSJOKoPsgp/buD0I5s1RCQrOIbL1CNOFWeJFKxUaY11ezasIaq9FByNKp2YBxdP7VWXxhTPiNgxqgDbk/+wiDIRBp6q2BnDUcf7lFY8+9dgjdXA6WImIAGtK24687j937TEWSR08m+Lw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U82uajGgeS1ObO4IXFYBGclph34H8/r4n/BLkRmQB/s=;
 b=FukNBNwCtBCKUvu0/FPeUlj/PFQDkDS9LhPqJx18TYG2NRLTsoXq8PJtGlhXN+qN5qaoylVTMgu+pZ+xxaY+eXRAwdgE6dN2jrXvDnKdv9I8CV3zsm+jRuAoO9Xk1fCKuct8reYdRl63Hqvw1tbPP0PjlPCLs4vN9aq6wXdiRPW5XFapAgJlc6DhvSBESMclqlsbZWhsHsmcXfLnUtVj80JcP1bMVxAhhNsrHmM/1LJVg1IhuddNLqLCubzM6LzQuTtHJjJ1bTahQghLqlX5UQiUUYuiCuTCHtMLyKSD2cUJUmMzH+4osebFIGUvOQHfzQ62knXV4rKB65VBSfKoNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by DBBPR04MB8058.eurprd04.prod.outlook.com (2603:10a6:10:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 15:38:26 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Thu, 22 Jan 2026
 15:38:26 +0000
Date: Thu, 22 Jan 2026 10:38:17 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Cheng-Yang Chou <yphbchou0911@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Marc Zyngier <maz@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
Message-ID: <aXJEaTPIhDGFb11C@lizhi-Precision-Tower-5810>
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: BYAPR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:a03:60::20) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|DBBPR04MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 10adc506-98bc-4ebb-ab11-08de59cc483e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nn9uveBSwvimnlbkIDNR9eLnK9yZtstqTnk1WQ60Ax4Lx02CuAaT2maains2?=
 =?us-ascii?Q?7KJ84OkVCOWxeyK4J1sB/M3l0xt25rnBive3sKH3PVzh0D60/X02a86Mi/B7?=
 =?us-ascii?Q?CBPo2UlhLZsQglc/n6faxtZirKMnS2JuUBW0ziz0mXVtaOD1mtVMXc6rTo26?=
 =?us-ascii?Q?2X5+i0JTZCUtvLfrjQgya0kdnQBTuy0RDOXIibuqjy0ftPGcwPFDOYJVp1Tn?=
 =?us-ascii?Q?EH1natalhRyeJzvd2Rvcu9/oErxeJ3ekpEK1MfzDpLtUu5hfjaN9EK5BuB+Z?=
 =?us-ascii?Q?/UFPqbWv+NG+hMUKn+U0T3Jq9Lzii6/XwYU4ig9nxV4LaJh+n6okBEWIwvng?=
 =?us-ascii?Q?1RUz8svBlBOM7SktA0Q99NihuDvHKih/eNOvaZBn4caCCafThTRcMQboHtp2?=
 =?us-ascii?Q?5Gx3yxKE7ztlM64sw/IpfdaC3xWEkg7fY/IzyOmRmve6NcIWJ2pAjBj2BDZV?=
 =?us-ascii?Q?nVOyKpXlCkc4Hqg/nxuljxw+Ta3Nsd+NOUUi06W4kYLpvcjIj0j8O6m4Awmj?=
 =?us-ascii?Q?siJG0IZgzPcjg6SyhZiAiHIN1ZZEg/skkzEfEJeJ6wl8C5/Utn1G00If1H2v?=
 =?us-ascii?Q?UgZoAMqDe7hYmjWi5fKV6aaaMrNeoEIXR3F9MAQ7ewnnzaNHuMzGHSvs0g9j?=
 =?us-ascii?Q?YZhu7W36T6vzLGlEhI+FuRa9DFQxwfqCCYOkVjyobHO4hq73iiriScse7kwS?=
 =?us-ascii?Q?+TrixtdO7DHvm+03qKiHGbzAkAiT44fBbT2g7OQ81SjgPlNcfgkz2NFEzlZA?=
 =?us-ascii?Q?s/1hT2Wb+alMg1rUIGM3vtv8ulr1FrmMuZFMsYUfNNxjPF9jw0DdBfbKmLBa?=
 =?us-ascii?Q?/cdb7PE3DqqMFuTRCu9PiXBzjfdUk0old/W94M1Lnd3doiV7Bgz28njmTZuJ?=
 =?us-ascii?Q?Xh5Wf9P4UueTBnGHgfp8EEo0iz/ZdD+nxkFO/FL3LEfbUKoet7EFP6PKsaik?=
 =?us-ascii?Q?IB9bC9INz0gh0liVxr+XQD0Jxkr111FdKC8OMDRiLk/pO9ynGsRsRJDUreSI?=
 =?us-ascii?Q?eXiRpZwiAJ03yXyrAbBhb5zoQLUYYGn16/fBXFgZGX65OaOV/t+rHVHtvdOr?=
 =?us-ascii?Q?qsBwJadePB87UjtrQW80wImXvmC//2yJ2aOVmgOmuUhHppUw56wKQrhV/m1Z?=
 =?us-ascii?Q?FkdaHobgAwPiuEcnrsNmkuUBkXbDRcTp5F85+ie8OB29XCU3vpKkxLzZF89p?=
 =?us-ascii?Q?jOuPrFqycefJD1SN3gtNAysebyZl4R7avmcSxMHXxuRsJqP1rRHy4IR3vs5c?=
 =?us-ascii?Q?AGnqTb8UfAA1ys9qxsER/9m79qw50DNEohipCnml5kjCYtLUsOMBGGpol3w4?=
 =?us-ascii?Q?I/t7RyVb+rNbFRl7ct5TT35iFEk81A5iEZioqZL/0Xik1nzlOvcsovzqDH3p?=
 =?us-ascii?Q?CMO4V5pJSQmHRGq4nrQ7ybOz1q/EhWXVyUd0PnbvJxu/8YCnNHsTjrWy7qjk?=
 =?us-ascii?Q?97DgpTmAeFwWbzlJjoQgLkZ/sUypMOWub25VuF0vI+deB1FwIZVQuSxQifZB?=
 =?us-ascii?Q?9cRe5JpsYjxJDitPJq2O53kMfuZHmNblT9KUoRjF7NaE7jRPm41Gw7f0gqSX?=
 =?us-ascii?Q?WkI2q5RXIEZsb7xrOcxtzFR4j+puX6r57xRV2BA+t7aoEbyzIXucoIg7/nz9?=
 =?us-ascii?Q?w2vIyF3D8Mlf3UHvDUE71wg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GILcqrtefqOeTopqk17pBCPDRaX7EGc6nRvVRgoiVgfE+PwFhXhq0zVUUa+v?=
 =?us-ascii?Q?VWxxtlr5plC1ZZ/xJ7wrxag/DD6triCchKyaVILArt42XwJBERp8uEqrRZXl?=
 =?us-ascii?Q?lx/ut5sQQvMQRFEe7JM8lI/NAxGgqG1M8qXWsXNskEwbzXnyu6r4UWb1K5wB?=
 =?us-ascii?Q?3KdKzWUx3GCtiFzPwIsq7zgrq8/re82LzLtzEmH0aeUoJFeMGCNN7hPcotKB?=
 =?us-ascii?Q?Z0grgn7NtoJMtciNVpLUG8IOiZOecMweOHkFK+FjUeTLe1vVFE9vIUwk0KD+?=
 =?us-ascii?Q?eQETv9U4JgWwkoPlhhGWYQnqNZTnFYoxde718kX8cT2FHantMquOJ0Y3DodL?=
 =?us-ascii?Q?akJavTTIn7gRjts9xq6oz0Xrb7xCJGyVwKvzi0MSpNrgfTCq2aY7TIeurl67?=
 =?us-ascii?Q?+qUvEVMYLxSId+4oZUQpm33BCFp5aK2xhBjXGfNgdnpoLCT+HWbJXa4A3N+x?=
 =?us-ascii?Q?UFF73NWwSPuY5vD3BY2Qk7WGF5CiSmnmtn1gbsmmPnePiE4q9GttqsU59THb?=
 =?us-ascii?Q?839HV6rhE0TiRqDAl33z0XovaoAAb6j2NrIFh2OQLIQlGjlOhlf8mYHls+gM?=
 =?us-ascii?Q?oa4UYQbFAxE5049yjZp3WGUXWi/oSJ1YVRLDafXH+QNTb2IYvbJduQr9ZXF+?=
 =?us-ascii?Q?l/nUgkXBFjiBBD8C6DNHT82Hx1MjuJuZgJWQGjoI5cxuB4rGiRRwhD4o/AtU?=
 =?us-ascii?Q?Y49cooUzGW95qYkxXvqtVijMZ1dPWjtZG1DUKqJHiSDcwi2P89kainOJbpI9?=
 =?us-ascii?Q?y2Ry8qpHsWix2sP8bH5AWNgh8jrWiXICVRMALgUKCG8T4QmRPO1ObQua7Ddj?=
 =?us-ascii?Q?Gdcd5PCB01K+el90oYqXtOeA1phRlSffM4UlMriyQ1bfNWu/7TMPFctfBsI1?=
 =?us-ascii?Q?vO3JuMMXIoO8b3QxOI6iyARkcYyJh4AYh7yiVqI7yaU/CFrWMHN7NwNZ4PfN?=
 =?us-ascii?Q?QYtWrS7DqL4t8qOwvMBDKgqDWEyinNCfrH+1kf5E5QOFpf9uj+uMg5dJvfwl?=
 =?us-ascii?Q?sJTeYgrebCDORbrKXV62KeLU41CuFvwxBzHgANYBdKfiSkQDXz6iphhSnlc0?=
 =?us-ascii?Q?2S1SerYqTPJ0r8qojSX6+EdfzFBk3bRDKDI18GQxFvMO/B7wKsR5Qxxclfyc?=
 =?us-ascii?Q?HeK7P7ugPbBIp8MJYKoXX/xbhRpvLbamx9CQ3HNueGBcjjzlaJhdnUrx2HEx?=
 =?us-ascii?Q?zXiKawveQH1EluY6Hw4bsoBy2jeetbBq7+K3qB62gCVhZRYxMt3D6ShhPwBT?=
 =?us-ascii?Q?8nkD7/cONe2sMPlLxczVIl7GTno9iNHNceOMi6XaajYNmoTSeGjGJ4H9Om09?=
 =?us-ascii?Q?fI17Lywm3GFMyBxYWmIpYhg0Zl+SXNi0gRjtaJ2OS2SCFFGV+aONfKQ6xdXH?=
 =?us-ascii?Q?iaG4JMHoWsKXfqrdVCupgzSdC2U+5JoJ/cxH0S+5B21+r2Zuna83cCxk7MJw?=
 =?us-ascii?Q?r1tzUabLRagEdATzn+O7Ss+Xk7eXAFAitbKJTAHlATcN/fVLSrp7sBJS9ubC?=
 =?us-ascii?Q?sLUeQqCWNUZkV+ZAbaObgzY43f3BRlHa1QA3tT/e1rzgnOfIyj8OwUOMZMi0?=
 =?us-ascii?Q?O1TDgSPOKUxy3eloGh+r7hdb8BZUlG4SwXSBfhDD1scrXB+ZNJlKcZSi8etE?=
 =?us-ascii?Q?SfMbBiSFt4FeCyf2kYc7ZSRsOJcp4wcjOP7eQi6Ro8kg/Dg4EyKc9cpoO1HU?=
 =?us-ascii?Q?G3SceBOcM4jzPjEtC/VgxuGyo+xrcawe8HYkszX+Bkzmv13N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10adc506-98bc-4ebb-ab11-08de59cc483e
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:38:25.9536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsGVBkRYTgvBicgptTMLzVJfm0nEjyptMS3NParQNapTwzkXHOVBZmftHgsz/Hhl2KCRyLGS+FaucGXrDU/jvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27303-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,gmail.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org,linutronix.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1C0F169062
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:23:47AM +0100, Marek Vasut wrote:
> Introduce disable_valid_irq scoped guard. This is an extension
> of disable_irq scoped guard, which disables and enables IRQs
> around a scope. The disable_valid_irq scoped guard does almost
> the same, except it handles the case where IRQ is not valid,
> in which case it does not do anything. This is meant to be used
> by for example touch controller drivers, which can do both IRQ
> driven and polling mode of operation, and this makes their code
> slighly simpler.

I think it'd better to give simple example here.

Frank
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Cheng-Yang Chou <yphbchou0911@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  include/linux/interrupt.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> index 00c01b0a43be1..becbeab4a7473 100644
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -242,6 +242,21 @@ extern void irq_wake_thread(unsigned int irq, void *dev_id);
>  DEFINE_LOCK_GUARD_1(disable_irq, int,
>  		    disable_irq(*_T->lock), enable_irq(*_T->lock))
>
> +static inline void disable_valid_irq(unsigned int irq)
> +{
> +	if (irq > 0)
> +		disable_irq(irq);
> +}
> +
> +static inline void enable_valid_irq(unsigned int irq)
> +{
> +	if (irq > 0)
> +		enable_irq(irq);
> +}
> +
> +DEFINE_LOCK_GUARD_1(disable_valid_irq, int,
> +		    disable_valid_irq(*_T->lock), enable_valid_irq(*_T->lock))
> +
>  extern void disable_nmi_nosync(unsigned int irq);
>  extern void disable_percpu_nmi(unsigned int irq);
>  extern void enable_nmi(unsigned int irq);
> --
> 2.51.0
>

