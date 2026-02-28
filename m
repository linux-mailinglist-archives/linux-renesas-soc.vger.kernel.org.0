Return-Path: <linux-renesas-soc+bounces-28597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZheROGJXomlK2AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:48:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A711C004E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B4013061BC6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F48A2DEA90;
	Sat, 28 Feb 2026 02:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DVBM6Lk8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDEB1EBFF7;
	Sat, 28 Feb 2026 02:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772246878; cv=fail; b=YG9G5DylpQUkUqOs39LhaY17nDg12ff6ttG8fdrkosAHWb0z4V7f4h84ILKcbQ2RLSSDWt46wmVUpRsTDhsrnzqZ0nVsZ8+PbqBKhuYt5cPC1mMm0MLvGdfYHpVvbOA4BPLzvJq86Z2+zY60kJC5SfuWusgvCRSEs8KUZ7XA9Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772246878; c=relaxed/simple;
	bh=bqVpXGmB8inwC9D8GglihYFqEDlIAWQpoDXagSJ8yQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kSp3menq5M6SRn0k8BQq0yfBfIIpqc2QkIaxiD08jS26dHFVDCGr9jYwuDie7RJvNZaveUNX3M90wTNJUkl3qJ7dfsxMjENOLQPtAXnxrPcNEkIXyGnzeZpTwsLs35V/QLgbohN2HBr2I8wpBcukSOCajaYCRESh5J0DlsVClqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DVBM6Lk8; arc=fail smtp.client-ip=40.107.130.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yicSr26e78FyRj6B3sP1qFrPjZhBa56ZleD9B5IqhMs3VYP+LeiKI5VC0wJ6i4+fNZqLHEd5KBZr+pDTO4Pw5XT9XYPJlOfjNSzRYq+Pry3eyeg6zxpFhIUOeeQ1Ez/EskQV/YD/dJc783GmAjGeEpLxnEHr3yVdVi8L+QUy6PJEZHMeSbL/uauKeUXkCZCWRD9jkRfmsOIbjezbeZx9a9CydHnVdUXgs5N7n9rYr/bN8mMQzUu8pRvJZJQZRp+BdMD9C3MKNdTz5z3WPtbc9CJy+7evsHcMPBBgQUKHUHqThCn9a8nx6uVOgLZ3gEbOtgaLNGMY2tfCtbmKGR7U9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iu+IzWAgytarsP/qANo/zniel5RYtu59lfpC6qSskUo=;
 b=jXdRzu2lQLEHdk6grC421elM32lKsZSvBpE1GBZAawDpvk7ddL6e64ex/yfNzadVhESlhCd3/xqXaB8sHFAxvY/arabkkGea28Am010a/UtdUrw/2UkK0I6eIM9c5LkTnno5oug8oOhIG2DUEhQoLMtelbrX8KfiL6op0ghzo+7rMMHin6nEZ+k/eK3ktoddhv022+XcVrbACnTHLEHmAD28LyfdITV2t+K88vtjjdZAJnrJTCtaxr+kaYrL5hdKVosO5/8m2JhjrfoBNx/7Jz6Sky/ecZuWdC0+yWRqyKlt3bFFFMfRa8I0AIXC0YY0M3DYbPJhquY98Q/oNddvCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu+IzWAgytarsP/qANo/zniel5RYtu59lfpC6qSskUo=;
 b=DVBM6Lk8+1PSaSAVKFT48uNLp//RvNhC1MwnsGjfHP9od5UWjJ2LdltgT8f2biiYqRbxmj5XA4oLHoG25lqCTzhVmNehxwbQZjqP8pRXD/brpR16q551iv5wr1lutBCOn9YUarszLUHfU4qFXpp5cc6px1SZ0liwSQGhEI3RTURz73d6zMHLbzAm9+lS8qKIortBrcePRNksHLWL2vqJ4kTwTDaOaVju86cnSMF9/XfVWVXFylk0211f4wbiMAJ+eu3CUzUQi8d1riojDVctEpbeKInhw7AiCexXW4EDtGeGsJZFAKuW6V2pJnej2vjxXI752HevPpMIAWhigbz88g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8773.eurprd04.prod.outlook.com (2603:10a6:10:2e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 02:47:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:47:53 +0000
Date: Sat, 28 Feb 2026 10:49:47 +0800
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
Subject: Re: [PATCH 11/11] firmware: arm_scmi: Introduce all_rates_get clock
 operation
Message-ID: <aaJXy2V7oI1tH4Ac@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-12-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-12-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 60bd0ee3-a159-4eb2-178c-08de7673c4d8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|1800799024|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	kGJsqAjdxI/x4GFmuWWfM1htpZjH/jqhdCf1Nc6084xoOGiWh8ROJbOcaZj8XnrsOEG7kYu8JMS/Vm1hCExE2puykI+WyeadSqi3UnrRMJt192hZ6vbgczfMpiHBVGFUpsS4BSEONmcI/Ig5HI8QMxxgg9SLPBwBRXNrC4lSsN4Q4x+VlYnsOCnLwjCbZqgkyCcAeNUC9cbv2BkL+Xu+djgYn4h7F5FDbi3DXk77PG3MgFRkF3z60CaYKGXDr0Uk57H9537nUYjq063Jvdq+GV3h92AaCzxD8avRqmdgFO54DXEbt4dsMQo9QE4zIIyfIdXWWOncSHwaAahfP0My0kQ2dCoxlT66+3TxVV1etKR4MGVGvLiLH0R4t9kp04Qg/s8/FFxsv2mOVtCjfaJjEqfQCPLtsRUeIMs8GN/guhdDhfJtOmQXJu7WFmLKkOHxxnHIiL4BE4+VFTqbM2zdNSNjyyNVrLVeTGBRkBCQdp1wOHqLvOhDqvI39ULS1ma/I7ZmSNP79YPQ05JsinDXoG0bH+CdQlqE9B9MlWEzjsey7Bw1MBksvegwQ/K9S1QZu2bjfNPitEJSXl+3n4FGtrfZCiw2gH1ScHXPfrfbr+WtwvcLu1DhHtfMDhl3RrS7WK1fxYfX7imqJnb9XI8K/Q4rnBf3/WjHYQAwoumURjnc0d4APVHGKtxcMtuvzYT4abZnJtxOBF8ERYm/94Hhbc8zXc9JOvlNSBrnYSg5ftAAEn8ljsdm43fPo1c65MssJI1n9GsEE+nVlQSeXW0j3X9fJ88FVLrkIpKySj3vfMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(1800799024)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r4ChAAFO/t9yQnFqMBqTtEhFYUg95L7Zixsv9GAguj76jJkAT7uPN7hnX0dL?=
 =?us-ascii?Q?fI4BIJ2wbB44ymiHC1pQqm4g+hx6qUi+/LUFaI00pYUQGHxLTYz/UNS4HkoF?=
 =?us-ascii?Q?uo+tFGjsXEtk/q22VQe5iqNpo7QjlIS5NkWTRBAxyJSWqlCbcn1hsBdXbKaR?=
 =?us-ascii?Q?L+j27Iw7c93d72+6AX3SxxkCVTzTDYBE0300TojXWrpUXvDgdLTCb8f606TW?=
 =?us-ascii?Q?E6eCt8oHOhbliMhTmAbbmd64zqIw9hgvPfTr9Hj9yFClQ8O2Z3eaTz7omcxH?=
 =?us-ascii?Q?H1pg9eJRgUDbOlHvTWw6jyLpw9BSbrmT2GWEtjeas3CTK6HZ2afWi0Q6zg+1?=
 =?us-ascii?Q?GQEEp4+iw/z7JXTNWUyHopD90gqAONTYrTDFR5BV9vYkrUhM+cG4aoTE5Swn?=
 =?us-ascii?Q?w96fFHGFQz7Gi0iMxBSShrRBDyIkAV2zfoQ01RNJMElSlFSR5cB6cX3g6kmA?=
 =?us-ascii?Q?pLWrbfxURWqTKWZrL/dGuujD+v8oN1AOcpHAbnfXN1npMd7550q+ybp+2+IX?=
 =?us-ascii?Q?pXOh6if1e+vEatDZ8niucIWXu9u+aw6tcExNSbe1a8sWnEvVaG97k5gebemq?=
 =?us-ascii?Q?hnh7oz1gNUa8Ag1ZsJvrRBIizSfQ5L/a29tSueE6C1oLD8V78JUry6gL2U/U?=
 =?us-ascii?Q?PHkfCbVrAxye8jULi4pwA2D/3g5L/pAatiFpRNLMr/WxJocrkDE2JQs2niWW?=
 =?us-ascii?Q?Rg+A2ErukyNf+Y48WGJCC7REG5DY2D2IP/pt+SWqCT/JjAM3dpknZ+NMTuWH?=
 =?us-ascii?Q?wjqola9L8WXNboR5pIDT2q/Srim+dl6pd3q6HRofWqiZL2pRi/g/Fx52MtWy?=
 =?us-ascii?Q?lZ+FXIWiKF4xfVAeD1HQ+PLGIEhG1toKkXVjUhYlkVMEulNx9wgsPGk90a4a?=
 =?us-ascii?Q?i2LaxB+6g5KhfrcDVNsLB/6bv2R2ihFiNr0J7qogLMCmYobMfXgqz0Vjg9Y6?=
 =?us-ascii?Q?CQ9xX70Xql21+tRqYzc9OJtv4To0C25ZEyvSRVQELrEDdrZ2rcUv7OmfyS2n?=
 =?us-ascii?Q?ZvXuRGwnuEnE4tEEV1bocYf1FiwB2NspfugD9HiRyM++2PtPCfGYKArPPSHg?=
 =?us-ascii?Q?p71FOrEH1xXLrRSXiB116Wkzaw/XIiGmIT+asLjNH4mNCbi9e1dGS/Ol9Oe8?=
 =?us-ascii?Q?4NSKVm98txjAukjgeOzdGrtskQp44kCmUPBt82nDiOIc+G6k+AWnxG5vFqm3?=
 =?us-ascii?Q?cg/c9gDCsDi9wswtciwYjG5ZsDuxV02LlUDZ0QVjVgmMCQovuDLMHqU4KOIk?=
 =?us-ascii?Q?3APoRujC6Fc1lnkq8z7UdvRUdJESCW5iBII0hc1i6aDeBItU1rfORLVOgmAz?=
 =?us-ascii?Q?RR4rODPtBeJnRcWZNBg0pZdMlpiE+Gw0QePZtiswGa0PB3EEPuUfWINcWB5A?=
 =?us-ascii?Q?EhOMe5iSOKXuahsswNpSh2Q97KeropEMfNpzJPjke2rGkaQELGyiN60Qil00?=
 =?us-ascii?Q?SR3+p27T5pAz0GfU08UGAEKSVgm/9l//jwI860V0Uvv0KNPB+kgt7Ut549sJ?=
 =?us-ascii?Q?e6oxCeeZAE0md8B21ODY1EB3GXHSFiZtHJfb/snGzc0qib0maGMppXA/QOem?=
 =?us-ascii?Q?iH5jDy2WSdUKzW6FGHnGVx9oqzEa6lZFGRAtNHKrjaALYt4k9cHFk1p6po4d?=
 =?us-ascii?Q?7HQLH64C/ScBk6rb2xM+w23/9DS/4zo2vs57IuoC5IpCPNndrZkKYR5/rV5R?=
 =?us-ascii?Q?nH5VLoT7Ds/WATCAwqRLt1C9LIWNquMs2OnLmIZNA5ZiJxQA2A1mK6gL+QX8?=
 =?us-ascii?Q?K+R6X+XnMg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bd0ee3-a159-4eb2-178c-08de7673c4d8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:47:53.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08xgRmrfgU1YWK43FAU35fSPC1QTmvvsyAtllC7fJa1LjPbm9324DU2edh7U/jg+sVP7WslawDY7dj7a+UNFog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8773
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-28597-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35A711C004E
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:25PM +0000, Cristian Marussi wrote:
>Add a clock operation to get the whole set of rates available to a specific
>clock: when needed this request could transparently trigger a full rate
>discovery enumeration if this specific clock-rates were previously only
>lazily enumerated.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
> drivers/firmware/arm_scmi/clock.c | 85 +++++++++++++++++++++----------
> include/linux/scmi_protocol.h     |  9 ++++
> 2 files changed, 67 insertions(+), 27 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
>index a0de10652abe..c2fd9a1c3316 100644
>--- a/drivers/firmware/arm_scmi/clock.c
>+++ b/drivers/firmware/arm_scmi/clock.c
>@@ -159,10 +159,8 @@ struct scmi_clock_rate_notify_payld {
> 
> struct scmi_clock_desc {
> 	u32 id;
>-	bool rate_discrete;
> 	unsigned int tot_rates;
>-	unsigned int num_rates;
>-	u64 *rates;
>+	struct scmi_clock_rates r;
> #define	RATE_MIN	0
> #define	RATE_MAX	1
> #define	RATE_STEP	2
>@@ -469,10 +467,10 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> 	flags = le32_to_cpu(r->num_rates_flags);
> 	st->num_remaining = NUM_REMAINING(flags);
> 	st->num_returned = NUM_RETURNED(flags);
>-	p->clkd->rate_discrete = RATE_DISCRETE(flags);
>+	p->clkd->r.rate_discrete = RATE_DISCRETE(flags);
> 
> 	/* Warn about out of spec replies ... */
>-	if (!p->clkd->rate_discrete &&
>+	if (!p->clkd->r.rate_discrete &&
> 	    (st->num_returned != 3 || st->num_remaining != 0)) {
> 		dev_warn(p->dev,
> 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
>@@ -486,9 +484,9 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
> 	if (!st->max_resources) {
> 		unsigned int tot_rates = st->num_returned + st->num_remaining;
> 
>-		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
>-					      sizeof(*p->clkd->rates), GFP_KERNEL);
>-		if (!p->clkd->rates)
>+		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
>+						sizeof(*p->clkd->r.rates), GFP_KERNEL);
>+		if (!p->clkd->r.rates)
> 			return -ENOMEM;
> 
> 		/* max_resources is used by the iterators to control bounds */
>@@ -507,10 +505,10 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
> 	struct scmi_clk_ipriv *p = priv;
> 	const struct scmi_msg_resp_clock_describe_rates *r = response;
> 
>-	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
>+	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
> 
> 	/* Count only effectively discovered rates */
>-	p->clkd->num_rates++;
>+	p->clkd->r.num_rates++;
> 
> 	return 0;
> }
>@@ -531,7 +529,13 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
> 		.dev = ph->dev,
> 	};
> 
>-	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
>+	/*
>+	 * Using tot_rates as max_resources parameter here so as to trigger
>+	 * the dynamic allocation only when strictly needed: when trying a
>+	 * full enumeration after a lazy one tot_rates will be non-zero.
>+	 */
>+	iter = ph->hops->iter_response_init(ph, &ops, clkd->tot_rates,
>+					    CLOCK_DESCRIBE_RATES,
> 					    sizeof(struct scmi_msg_clock_describe_rates),
> 					    &cpriv);
> 	if (IS_ERR(iter))
>@@ -542,12 +546,12 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
> 		return ret;
> 
> 	/* empty set ? */
>-	if (!clkd->num_rates)
>+	if (!clkd->r.num_rates)
> 		return 0;
> 
>-	if (clkd->rate_discrete)
>-		sort(clkd->rates, clkd->num_rates,
>-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
>+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)

Not understand well "PROTOCOL_REV_MAJOR(ph->version) == 0x1", I may
get something wrong, should use ">="?

>+		sort(clkd->r.rates, clkd->r.num_rates,
>+		     sizeof(clkd->r.rates[0]), rate_cmp_func, NULL);
> 

Regards
Peng

