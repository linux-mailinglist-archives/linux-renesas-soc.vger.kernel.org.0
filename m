Return-Path: <linux-renesas-soc+bounces-29539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOWIC38DuWmEnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:32:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 970552A4D76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BAFC303CED0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6657E349B0D;
	Tue, 17 Mar 2026 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wXUCBdn/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195CF125A0;
	Tue, 17 Mar 2026 07:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732723; cv=fail; b=GVD3hQUPeJs9Rb7lQCrM+pcV2ZnMWF+dCaGS2s3IUan8+TJTUUHjBtt/abS0I1c0YHH2lBsZeB8tJr0ZVQeCKpGCs3iWe3+sz4Z1I20tJNoBvqOXPiWXeJIlG2d1cyj2gNOgU0++QkA69wlO9MvBT9wyPvuDNP/yG3CZTy8oNlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732723; c=relaxed/simple;
	bh=iY7wO/RR+VGV+9+P9o1+G3s1VjtKtRjSZUX+eQWzJFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L9s620WJPbew8Ux11oqXqfVgZic1MORoNVOwh42ZOZGINhnag+iZygp0av8diQF+5Tr08OjH220HmpJuQtkq4lWuUI1uQBzow1Do1/FFVfbbfXDsOUEMYSX2kOXNRWqnTVWLEZuj9KWkhZSPOcYaxAGrr6AyoaeneTYX33YJ0M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wXUCBdn/; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNaj7KTJ6gMXmrYKIh4qDXFZuGnApR+NIdd/lK7dP0WK69NzJHfwK6Rjfg+Jv8o5vOygvCihJZ/9I4U5wm2VC6xwWchnUpmYL8BfNKFiUjBVH15hA//5DuoC8bOWivxCe2sZkXIlWJ7jSwq6YWei4lbtWgpWudGODBmwEy/IxwkTbwkd9L/zUcrl2nBhvt+b8J9RXt9Hy7zT2dW7EoI7c0HD005/cqE2JnBxPQplBeVHkJaS6GNnbYCnn7maGBSPGAc1aDQaHfZXeHJDB+dCgyHlrMT2IxyjpDw15CEvcHl2JzCmiLmiLnTY3/EhNHV+fdKQLhZ10zLIjWogBkJ+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY7wO/RR+VGV+9+P9o1+G3s1VjtKtRjSZUX+eQWzJFs=;
 b=GOZ7PXzXct3Qpl9YSdT4veYyY5/IqkzoRZOGx6jLRGQLv9iGXEH4MHt4r5dkAtmbrLM8HXKIcaQhRlvj9DEBNFXrje65vzCYAlA9YmMphfa6KZbAMi5KVQQT9rq4MA4V1L23i4GY9w3SzcU8/MEhzJwSwok62kzYab1Z5k96clwbLIEUjXI63dTpNaJVb3i5fsVgAIXeH1rySUwxkTmNyjIExkRGStt6v2FQw9c7bVXeiHBJvodyQNT/ZQPlcjXoA/N6cPcZ9dU+448T7BT8Ri+5NpoDM2u1dlmDOuIP1DNRuq9SBlyJltJN2VBYMjM5lfoT/i5LvsJ1WhIoJ2kJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY7wO/RR+VGV+9+P9o1+G3s1VjtKtRjSZUX+eQWzJFs=;
 b=wXUCBdn/hGNkxkGALFRxgdF24IWLk27fBjsgqiHSX0UGnml+OYGuQb75OABjs8TQoWXjiK+6jX1O/hbXUIOR9esRugCRFpkUVz26Zon2ccvqpIadJMoL9kVZYA6X6QmRNblSvn5EZeaMPlFUKeeVU59bFvA20x6Mvg8l5w3ZwuGOBjoUUtJOVuRnwNCo+tVTX+5IUi6sy12syNfRyYllPeFVaeVttN4yiovGDsrfZzHL2hMu3gPKPHvtoC6S+hBTCaeHOANhKYImWsOvE0aqdfPfxvXSD06kVMON7R5HTq7roAN59Ea9o6s9ySf7dH6fAJHu4+oQhp58tNv7tIc0Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 07:31:34 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:31:28 +0000
Date: Tue, 17 Mar 2026 15:34:02 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 13/13] firmware: arm_scmi: Introduce all_rates_get
 clock operation
Message-ID: <abkD6omb0Ic2JfIZ@shlinux89>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-14-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-14-cristian.marussi@arm.com>
X-ClientProxiedBy: SG2PR01CA0161.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::17) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 373f5b25-300a-4548-999e-08de83f733df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|22082099003|56012099003|18002099003|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	tCi7dLvZU+BepuQ2PPXt4hWL9GkFenF6ctF76T8wahkk1r81qrw2A7omfZHG2w5YV6eX9pSECGeETeqM4RRDuAYY4wAChzXQx19jW9olrOx57uJxE+xiBBzl9akPupZizuHNvH2yN7ZsgGvD2EHI9iUQ/Xqco5kSEUt2xckrgH0yM7cHmThHEsR/nkyFvw7BFjKFtIzE7WRSBItLkcPKIJZVIsjrZLJ6EctUvNJ+CQlf8maXFbckhnhXBk46R8ViYCTupU3N7ywC3GnKImOh+IPS7Q07aUSZC40ZVA1SriFK6FkXidHkPO79vu5B5wvIuJtjXZWj3nU4Pm42BCkmzPFQgNMody0TsSsvH4IDAviE2BY1xMz25XafP24V6B8D9J8oc0PgmESkHTn5u/8ZT9TzR88gBoj4VrxjuhFz3lF6vkXC1anDqlboJM01jQRS36DmU28oIUT6hu77OBxNxabpWc4BQyXYkBAR6vF9yLYADLQdRwKZx+eQkT31CS2i5eN77EI/wMX+jWn/K9qYA0CQ7i7RHULsPNDRw72G4zXoM/ivVW5lnCAnmkiUsC1xE18kzbpK9d+Sz+vkvlOPgsMyn1pQOJGRLAmRYmgFDrl6GqvqsDPRnXl3APVj42gwP8Ap8+CyYZ8pUerh/UiPeIENIxiHR8DKLvrqESPOHAOOi8UDVI6QWYoIu2E+kGSj/CCLZSDmakOlkOUHriwXA1Fyx2xgleb+fthgv56Z9fYw1ZSVsM2D8s3oWiTRGlSRN62cMkJ86aQZPl5S1lG5czfa4qko6hIqfMmgYf/Mcys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(22082099003)(56012099003)(18002099003)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fywAixRZK5Opal5+ABWHtzJTJBq27lvnRLo3LxPqJW52+spyg5g2+sD4zwbf?=
 =?us-ascii?Q?2C6dfHC1BGGo15IJE83OCTM1UYSOuQmdnju3ZlC+acaJIQPlGUnCxPHCdGGc?=
 =?us-ascii?Q?wtc2Sr/BofDP++zoeo2n3zYsx/bFEI7qTmWtg97lqzgVgDqNDhPwg+3l0d5v?=
 =?us-ascii?Q?uktOCd90MS5Rr3urgLBp3lQnzu2pKqkXl3iVqYVAEmc9VlOAtsz/BmwC/R9k?=
 =?us-ascii?Q?Pz+rvXUvtgQCBywsAr/fcqaP9LhtCSfqUplZQT3i7Lwr65QUQnrvGG3RTxDT?=
 =?us-ascii?Q?Kw85zJo66DeZRrYLskYC3OlNZnMS9bG7MhEbEPlP9y/bVA7qSYPQhRkiL7mf?=
 =?us-ascii?Q?qqDLJsnjrX2D/ZaqGVIcpIpMTwgJw8mRD5u5THfITnMDNa1biHLd2+aV7X5O?=
 =?us-ascii?Q?b5nbYX2zkrT+e8qEF7Bbpo8fpezyWS1S5Sby/6tnjs4qBsnWhiQ3ZDB6668w?=
 =?us-ascii?Q?8yNZLSF9QEKpuRLimyvfkSfnG21QQRNnr9INgqO2erGyqkhNawpjicsjOaSv?=
 =?us-ascii?Q?+vaUaZhnOLK11KfPRIA3HKzTgO7E+syLvueRoLpNTsPdRfYHr+l6eI35ja+S?=
 =?us-ascii?Q?nQYzk7kU0TsrcIoInjt+BS21/aJSW08Zmuc4k8pbXW+Ed3+xiLQEM000pUWT?=
 =?us-ascii?Q?EbuTQMfArUyxBr8A0QG/HuoLnenTUoX707OwEvRCfLQnVlmdVoaR8AyUFe7c?=
 =?us-ascii?Q?c2S6Sv61dzn9gZKK6okbmoJ8RoytrVjw8TLMEriWphZkOzqCSaL8ZF/r1R8x?=
 =?us-ascii?Q?/ZOPFdavuRfOkj2nKBcXfOpZSb2jC45OHtC2d9lJTtnocpXkAGJOkJFK2Gf9?=
 =?us-ascii?Q?6lq8I7ouLpT6EmcLytRpUsHiWBOwHrAve2/liCOJGcu0PCJzdZz/+q9BUimd?=
 =?us-ascii?Q?BCbQI/0Xj5ajOtfKKN+2cVvZaqHgNBQX7K8eYi7LiAaZWRB8/VXx8SBwDP8N?=
 =?us-ascii?Q?Q0VySH50Y1SydfsRhZMQfHegmefBS8av4R2DDsNV//ccXGJ6R0zSnNq6pcuF?=
 =?us-ascii?Q?M0kXlbjpNEvlUQ4Zh/97YuFouVitOdMrANQg8Foq1Q4U2G9iPjZ0ThPTBjwG?=
 =?us-ascii?Q?jY2PYScN8tJMLfsqHCLBN8oOmi48nQrCmNtayFFG1031q14N+TwetOhYGF+a?=
 =?us-ascii?Q?j4Ora0kloHMkH188Yh3xNcdndzdY060GZRU1w9PX+CDGofRxYttjkvvPjoqd?=
 =?us-ascii?Q?t3HB5mWDQS6EXtwMmQWH3xRVGDOQ8miyP0new5GOvW+hrZHDbZlbpRlyo2nl?=
 =?us-ascii?Q?TsdnDFmAADKfMTZikww3XJ3LfObih7GqY45ORwGftn7RJOHjI847BKQWljYI?=
 =?us-ascii?Q?w1NfAbu7H5qLhyCYJwAs0VErwC/ruuT4zy8al9wWoJw9oNPQjwmUOBr/z4Lv?=
 =?us-ascii?Q?/tY9JVhyPUEdklChjHbgx36g6rnSlgD1mK4SZ7uh7fnEMME40X0PsDcmcOLH?=
 =?us-ascii?Q?gGxQfm5ZjTtQThVKLXCTV2qSezLDdt9/CeuRN5L/FLgU8z7QiXMsRtiixOtA?=
 =?us-ascii?Q?wTQWGf0FsDvKoVhLc+XtijYJQEGvqoOmBZtXkn+bjhtVNBFER5nnn1Tb0SXB?=
 =?us-ascii?Q?LRFQo2LQ9U4URBKeTlON+1xE0zyVSBj2cv/BYNo95vixvu+3KtVVKyHdmZz3?=
 =?us-ascii?Q?0DnFUiwqLSfbNgZ2rLqF2vVbvg6/HtQ4Ntu5c/wVSlD/p72UlO80tUn/wdG1?=
 =?us-ascii?Q?2cuqbLLs+F/kGlaoXvgCNvhYyWoABfbhmfBYNi/B+/jrEJBdgbOzwJIH79d4?=
 =?us-ascii?Q?fsAPGW/rdQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373f5b25-300a-4548-999e-08de83f733df
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:31:28.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93ba29t60KMmUr8FYtVJ1y1ISYrfiRO+gfvgso2xnO2BI/UEmGIF+xavtnj/qfEFNzQpe3NCC79ktINTGjYotg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29539-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 970552A4D76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 06:40:30PM +0000, Cristian Marussi wrote:
>Add a clock operation to get the whole set of rates available to a specific
>clock: when needed this request could transparently trigger a full rate
>discovery enumeration if this specific clock-rates were previously only
>lazily enumerated.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

