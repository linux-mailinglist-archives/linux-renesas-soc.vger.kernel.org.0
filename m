Return-Path: <linux-renesas-soc+bounces-28594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFebFRRVomng1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:38:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2C1BFFE3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52FBB302E90A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CFC305962;
	Sat, 28 Feb 2026 02:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EDJ/Ld6p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCF2233D9E;
	Sat, 28 Feb 2026 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772246289; cv=fail; b=HIdJu7aKhaMlSmeWqi7WjOqRxTweW8nt+YPT/Ko9zd0Z90hRfCXfIgS32xxla9WbZWcZsfVvg3Z4GoaDN1qanQHYU1g4KqvZSe7gUgNhtabsLoW/Uge1JQ5mU+AN/YLkTGi60O5BwXpyKt6WnlnGSPfv2YRu8y4cW9aZVQSblxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772246289; c=relaxed/simple;
	bh=iZjXVMXPfHz0cuBQIzT+wfJ/L9fKyRQxlsJ8wRHsmVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TimYAY5QassYxcpVu7HRzfojNkPtdyUJlVkVcCd7oo+anLmU8mTqneGkOHHwQEHPovZBfmihDtSfhgJJOm9ufuDNAkUjAXvFufNpvr62vc+wS6RGcup9Tfmxc4JF3FuQthMxu9xfjtk+Ppo8rTr6C0ESqpYXvGExZN3Dr/9b4b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EDJ/Ld6p; arc=fail smtp.client-ip=40.107.159.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8cm203u6qxpfBVAcdFGWEwrPK4Gii8w1RjcGDBcqC2llZzNX86AkbN+SVS8h3G8RZ6hw/R8/qAFzkteLslpihWq24qIKiGs35JBEiM3+pUIOWExS1DrS2ROX4yUdXwcOxG4nD3gEbA9TuX6CsqSTtN63zUTk1MdILhpZVStviiI/FmhOko8u6CyobqUQwO1JgSGEYNYErPUbJdmAXGz0Faoz2y6i3QmVZhQykbq+kLFbVrdAkQhwcDHSLZYmgBEUrAfbPlJPFEQu1t93CU4rRVAnoZRJQKlzKhEyF6Z9UNp84T5fxSDrCm8vfnYLpW6VlUstxKED5LVkIktOFc8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMGYkAQIOG49ez1mVIJqxvB74bsYSi9RbNiAMdyzpWk=;
 b=EAI6RawzWCl9knMHek6P1hz+H4wDPMg3NHwmSMQv1jBFQBAYneSd1tAcZZefL9kfU2IFcK3HI0qRjJAHej+gNAth4eEju252uSvtzszFuj8zER0tJWgsGF3HxO+BWAGfFPVko3YAh4kGGhJj68RzS7AqRMITgVTlRidX7DJo57tkWF9HuEwxkLyfKgZS+4D8Hrs9kJnvphccdYP9CEBU1nGHvs4tH8hBpJpAT2R3Ey3IKJNxp0c200Yrezth96Hsvb7V2OLgs2ItoiI7oh6/AC9ZRR6S4EaDlAJccR6f7VYdh8/XB40XlRA7KgfwXnNphmFHvefqHGhhqvbLM4zULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMGYkAQIOG49ez1mVIJqxvB74bsYSi9RbNiAMdyzpWk=;
 b=EDJ/Ld6pLVbhiiJEBPDOUhTyw4XIwQS1UOa757LNJjLk20jX0mCcG23EefsAhxYo9vvTokRaF/kn26d5F1J+5wRMeOklENmB4afTtPep8Fswglb5swH9bD2L5nkSA+6NB+cWd4+fcrLAV5R091pv7gJPF81/giYUb7vvSg29VnLmRcq8+dw0T23ZXPAFwus5POI+i7f8/lmXfTTUCBMVOmzCG517bFHX99r56MfS3A9HOn+yxVM6J1qCfY/UhBI4SYUk+oA2+0TpzgQTC4IKKfLKwS/GUGu+AT06rZBRxggkeQrLfhVXTiQre5ahVgUp6IMIkiFX1sZIyHU3xA7vMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 02:38:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:38:04 +0000
Date: Sat, 28 Feb 2026 10:39:59 +0800
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
Subject: Re: [PATCH 07/11] firmware: arm_scmi: Harden clock parents discovery
Message-ID: <aaJVf6q9r4F1RKzu@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-8-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-8-cristian.marussi@arm.com>
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9384:EE_
X-MS-Office365-Filtering-Correlation-Id: 00660d12-0f48-4c35-fc20-08de767265b1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	gcbSKZBg1FkYuTnZkKJbuCvwJU3w0cy7kgVIIzXOt2qeOoaNBRYsZT5xDuvdebok35DkGZGkssMAPOz8mTZ4glF66BWURN4G46ihOWf0GoAyWAuoti5YSvlfVqrAk+8xpOaiFivrrMJ5ZfxERrg+qtxufZlus0aktrvQdFhH4yDtXJbo8/SGe0OlRqelvnDwc7/ZIWW0dz8CazyhIf5jqH5kxbKSdnmsl52FNwdFi1+g6ESn/0ul3AGlNx6MUtjJu6OfquVHKWYXEZaKybI+9Swxn9TBAftmgymQ7/th23d+iFqGe84ejUXoMXTx59FXNg3SmqBuVXPMm5++3KQbof5HBU+AzMf1TXFa1RDxKH8OswHajXk+CFsnB9snYJm1imkYDlmbSnlBzWnjt+nOYlWokDp1b+dydRR+5Ss3tF2lYayM7iQ+S6os2F++6ZOs+quoWgr9h5lXty2gE5npz4WDRsxS+kJh9rSY2wOsW+yrUUTd7ENVHWQTx25sUA2SuSQUb36FAdHn7Yr4JwwgoPDhFhULunAd4PKuhtG7N5f3VR+BIm2U8I3Pm9BGmPa8Iur/4LcHeCXfVKKAtdlXC05G2JHqspdy/LlTniwfJ6Aj3+5xWYJNn90Wx+xI4yKLd/t+pHTB84A/ubFTKwSmbW92oK667X8KcHGJdcce75otcZrNZr496O38oNGPgpGYg0vhL94kbttHPpT0xX+4LfrQ2SaICpe6PKSdGknjWS/AombigbguBiKpyggu5BCAVrsrXe5ungg23rJG/miXm2kCkm8R6/25QFyMx41uzvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mNHo6UTsuwnZoWIdqXdCXSjeMzkDch73zb6kXdUSsh5pc8adM6mLGPzNuPDU?=
 =?us-ascii?Q?ZQk4idakvDeLyZ9h4pf9y5T7T34Sy7X1Q3PSHzNY5rUyCHxOW8iMXZnIOXMh?=
 =?us-ascii?Q?X9VaszxkFakgWu6Vwtjnqxqcxdzj9uJsEW/fvuXLhwoYT4HEHxUXkcoARC2y?=
 =?us-ascii?Q?SnccobbBLt28/gmD1KzpJX4YxcBgn8768ZYJEf6W87QXKakkWfxG4N9cQ+EY?=
 =?us-ascii?Q?fHDyWWpYPQqRdq8wpMvo/WJpP1cbwbBjIsqICoYRnIFliogsFo80pxcxq4+f?=
 =?us-ascii?Q?1PJJNIV7OH/9va1dpvVjyWhlj/qnobOZdhhj38xZpQNerqHpm7nB8n55JMSR?=
 =?us-ascii?Q?i5DMRlMCld3DQZEgEma+2HZLTGgSvfaeJ79j9eHVhhDu/JIkHG2TImZU/hoU?=
 =?us-ascii?Q?N8FqPvEcYVx7wyMUtXgF2C2oFtlFe0lClnmsOTu9RGcShEUerRLAmdJrtP3D?=
 =?us-ascii?Q?oIGtAQidWJxwYrPnoRcsqaFjVyb3tay3KITUPvX2Fqn9tppOmDlAIu2tXT9i?=
 =?us-ascii?Q?1MnVj3nn9lZNci4KmB5637hdpQz8YwXfdtNQEc2h0wJXwX+C4WNO5/y5Eae1?=
 =?us-ascii?Q?BvqgRrO/ovOwu829/QQTaKVi4Pria4vNg6dBRW1e5ffNoFhqftJgUpf6v+Hb?=
 =?us-ascii?Q?1BWLriZEqF2MOc66XZnk1SLueIbvVZLCseu+QLLxi+BOza++KtkDXlXVUTZ1?=
 =?us-ascii?Q?2au/NKlKpVno7iA9IW+2AW58u7bFElmDKHAkUYDCnANqM6EGDXa9lR/PkX8S?=
 =?us-ascii?Q?RCCrlFQzJJqq/aaH7TSk537jnIyPJM/NpI099ujpt0FhzCsF7nChDiYT6O/w?=
 =?us-ascii?Q?3AO4bvgrq+XTcYZTM/xXkKNZ63e5cLtvS5a/i89iTbTlMuR9wuYHKgeZ2q+X?=
 =?us-ascii?Q?VSHXckXfj4vEMhrnuYURKrS+SiPZn7HFwru2u/eSNvf42WChYN42gHU7VT9O?=
 =?us-ascii?Q?AundBFFCJzXTTgbA/woNvn5lSEKH56AO2p4FvLssH5pp3WLX69ICbcZIigdC?=
 =?us-ascii?Q?9xWO5mIaImveHMwjS7K5hatRoepGDUJHPF26c9TAtgK0SeyKeiiAzlX5pzEk?=
 =?us-ascii?Q?3APEpZZbjVrk2ihq5pBPKf17+hTVV+DFSuLuydIdUKC+MeNOv3tjrbb50tbj?=
 =?us-ascii?Q?1bt0C/VunEf9b5t86HSDDBIEUThEHNaMoPb1cpFRA5nRzFNtccApuPx+Xs6n?=
 =?us-ascii?Q?KWIofrknrwdwr3PwiudzMa2wg8MbD7tTc76HSS7OgrRG0yHR/bjLUesqZnM+?=
 =?us-ascii?Q?snZvyonfSujIG5VsFwkns367nvu+W7IwfS0QRdU0jHd/fNSaedwy1l7Kxw2E?=
 =?us-ascii?Q?y2ErLX1MaxmQhWcW3y0IsheUqvdRs3c6QVVzOZrdrS0+G9kuwTPG/D9s0U8q?=
 =?us-ascii?Q?A6mcMGPm5F2hjAOG9lIffr3xa5tcoKJ/ZjKfn41O4AEjN9HWEBIVn89BNAGo?=
 =?us-ascii?Q?RmLIKVD3CaJaXXmZc+l+3j8263qAPwpfPRbZkUM8l1AfHFWGfrxJhkyo4qgM?=
 =?us-ascii?Q?+kZZlJLzNjL+KMCfMoszt5uTwmuLi1dKJoqL3dZZyPwwdGLNYtN5Y7Tx9RcU?=
 =?us-ascii?Q?/sjI9SSIj6hH8jyVMxTTwLdKzgHaHaBbPRtj+43797/ptScLU/VG4PceVr/x?=
 =?us-ascii?Q?Rhso+l7xbv8NpSVgAnu/PYsTV4pnnmxF5b/3lg71oPhJt0j4vQfnihkpNfxV?=
 =?us-ascii?Q?3BmNdHVWLpjdEvYINMt172OEM4KX+FNzNGHZtBuixFWdVhyaINAsJwAS/BdH?=
 =?us-ascii?Q?ZOToPVXJPg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00660d12-0f48-4c35-fc20-08de767265b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:38:04.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnbQlbGaBRwy899jfhAIUuiQJKZscaKkXCQleN8RIa8LEAjyd191ei8eKzYnYM1+aFxjSUTMaJBzw5w0ovGJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28594-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: AED2C1BFFE3
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:21PM +0000, Cristian Marussi wrote:
>Fix clock parents enumeration to account only for effectively discovered
>parents during enumeration, avoiding to trust the total number of parents
>declared upfront by the platform.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
> drivers/firmware/arm_scmi/clock.c | 18 ++++++++++--------
> 1 file changed, 10 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>index d0fb5affb5cf..15faa79abed4 100644
>--- a/drivers/firmware/arm_scmi/clock.c
>+++ b/drivers/firmware/arm_scmi/clock.c
>@@ -270,15 +270,15 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
> 	 * assume it's returned+remaining on first call.
> 	 */
> 	if (!st->max_resources) {
>-		p->clkd->info.num_parents = st->num_returned + st->num_remaining;
>-		p->clkd->info.parents = devm_kcalloc(p->dev,
>-						     p->clkd->info.num_parents,
>+		int num_parents = st->num_returned + st->num_remaining;
>+
>+		p->clkd->info.parents = devm_kcalloc(p->dev, num_parents,
> 						     sizeof(*p->clkd->info.parents),
> 						     GFP_KERNEL);
>-		if (!p->clkd->info.parents) {
>-			p->clkd->info.num_parents = 0;
>+		if (!p->clkd->info.parents)
> 			return -ENOMEM;
>-		}
>+
>+		/* max_resources is used by the iterators to control bounds */
> 		st->max_resources = st->num_returned + st->num_remaining;
> 	}
> 
>@@ -293,9 +293,11 @@ static int iter_clk_possible_parents_process_response(const struct scmi_protocol
> 	const struct scmi_msg_resp_clock_possible_parents *r = response;
> 	struct scmi_clk_ipriv *p = priv;
> 
>-	u32 *parent = &p->clkd->info.parents[st->desc_index + st->loop_idx];
>+	p->clkd->info.parents[st->desc_index + st->loop_idx] =
>+		le32_to_cpu(r->possible_parents[st->loop_idx]);
> 
>-	*parent = le32_to_cpu(r->possible_parents[st->loop_idx]);
>+	/* Count only effectively discovered parents */
>+	p->clkd->info.num_parents++;

It maybe good to give a warning, if mismatch between 
number of effectively discovered parents and "st->num_returned + st->num_remaining"

Anyway this patch LGTM:

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> 
> 	return 0;
> }
>-- 
>2.53.0
>

