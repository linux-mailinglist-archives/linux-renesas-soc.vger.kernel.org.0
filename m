Return-Path: <linux-renesas-soc+bounces-28888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM4GIK+PqWni/gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:14:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C521317F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 15:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39A443037C2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 14:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE0938758E;
	Thu,  5 Mar 2026 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="d/UT6o4D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020075.outbound.protection.outlook.com [52.101.229.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133C021E091;
	Thu,  5 Mar 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720001; cv=fail; b=Vg0DgP9XhJiN4i4xA27K13+8gRydDb5ASDtbl4I15J2yTRrKjeG9xLu2FjU730YwN9jZGD/h68cAQ2Ml7jg9Z7k/z6JijKRwjxI8Na829QmOQrhLxK7/dxo0XszWTS2XEhINQiX05vlsVQSGXnGXCGhGAUXnAdPXDM7LSL25Iug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720001; c=relaxed/simple;
	bh=bwJ/ENmvy5mBxu6nRwjyriU1nJ62oR+Q1+l4HNBzOto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lyBCI0QHrK6noqC1/tnbZN5ExTEbNd5ihsAnkEqQQBo7gbtT6LZfxwC0up4dkh+OnWBoF3szfL+8zbJry/SAt1zZjb/lAAWznEionzQRhabtYMELMHeO35yNQ09r4NM4FFfQlsLj7hlWMM8S5l3RnJdz7NeD3l+wfLRfxbNbz3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=d/UT6o4D; arc=fail smtp.client-ip=52.101.229.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTz9fRbIAQxNNik6uoJUVn9lmvrIX0EqAxMWcYSLStpB1hCIi0cDDZzqElyC6agv+5rjPHU8oTRJphxB54Wt3c0k6R7wedVTRTlSd64YTQUdgG9DSa1823649gRsf7aLiNHnqZMNtNsG4f22ZCaPgotCjXgSePmufrBvAbbV6alXh+toB8ykcUliEOEMWPfk7ehqEaGk1BkaSP64tkFZqUMsUEYTiD0lxgAwm/NehXbS5ewVNubjBonA6tazk8HXssLth4SbiBKR9lUXc5sRIcdfV3bZ8Dp3sdLQvIdBFyt9Ht/0cZJSl6iTuZLofWicw2dfYTLqVPzfvzsNimjQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ub229pHggwHR3MviD4KPLrWWufJoUaYvIdl59MCvTNc=;
 b=WerVXnCSonim1JXCcVW898Xx7cHXfQNmgBSfctBOcz94mhwOUH+2o2MSHoZXk2vqeoUVJVZ9sjstL4zjxDk6pUPzbftH+tidCkwW5I11Pp/tLHAz4obQqBLhEqUQfP/PlLKp55e3M61L171OvqOnlMU6aYp8QXxEtWhZY7BjtHKgdAxso3vIpiBGHbCBxhE4CM1WwMhIEZ9bzIcb/AIPMbRdNhceRqM0fxtllUD7cdX+32QOeAntJ/TgFUK0mUMmB8ZbKpKCbQO8dWStVqu92s/ODzf0cuEi5bRXdGSqbK4u36vTz1cSPsIm7+n+fcbJGgUuOqH7BlQ3+i+4AAOQ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ub229pHggwHR3MviD4KPLrWWufJoUaYvIdl59MCvTNc=;
 b=d/UT6o4DYFSPAVLVbrG0uptS2NWtY2qX2l3tZSdRl/eydfW1gXa18hCs0YLpnE/7m8JKe0nqTSKWn3VO5HVtgJIrTWkh9y7TYbNytJw9mgLnj2FolF4Zeh1ry7l+ErhdTy7CRWmdye0LRxaeDEaAPckje2dbVWrnV/8xzaIhWv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYWP286MB2299.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 14:13:16 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 14:13:16 +0000
Date: Thu, 5 Mar 2026 23:13:14 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Message-ID: <zxrmrem2esf2j6v3ifaxtlpzmylfs4gpeohn5ekaqehr4rtzna@4utqnzizwbzx>
References: <20260305015439.1529006-1-den@valinux.co.jp>
 <aakyvxxFnBkl4io5@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aakyvxxFnBkl4io5@ryzen>
X-ClientProxiedBy: TY4P301CA0096.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYWP286MB2299:EE_
X-MS-Office365-Filtering-Correlation-Id: 4912678c-5928-4c31-7a82-08de7ac15846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	iGOoD/AoIKmxZ6erMM4S40+zAojN6QRqaty8in4DLBuKBWWmfPIw5y6yT+K+r1lCh1pPMtyRMoa+yQ7R/ZfOJE2id+paYUbHjHVCmCU9oI9DTg8YybjIqMNGYG8U9Xe3e9fuIcFdDMX2B4favviZuBmpvmd7u1aEv4dPcUb8bkNCCwKNkf84ncXuva9ItTZFQvIfTBsigMNdMV7j9IQ1ONkhXBookI139iIywwhgS0FwN4+IWykFdDzuEEQ4UWQdgbI46vZ6QILMXG8txCrCMyOuvwhqxYJXh/LQjVU+g9pala7afGNEViegwvWb0IKfocfQ/2ABqKYmuBnF4zGL3wm5p3NHKGMhRYlGRSGxZm/Jn9YBGzG023LvHHqK3dXFfKnXLmQstQEgrQL7kBO0SdZmJ28SG9uppgDsjfe4Hbw0/p7nDt6nH+BYkuYFHYlFSGWQAYLpv5gXSNz9eAtYm3lMrTGMlb2tZyOFuzOI4tq12e2SQDx4LTgnfMp+6AX1IE9VZ87rGORSohy/CFOKw0E6drMDvfnKaI78PJBPAup9FOdvOm1Lu/qYeKVEjlcVlRTypNpkJfIMlj0CBJu2m7me7TKEhjYtccF5uOp3mMxiWwTvK/bpmkOEZRUnEZnYrERbl5WyC7G3J17KAiFdtiEM1GxsX9f6ClKLXyR5F6eulgP0Cd+QWrzs9Z6UjlJfxMnfQEk68GVPn0PLTw/wm2/EG3rLz6GqW9UoyeSTzbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4+vAhgrQH127OWKF18OuMRa23SbIc461Itaouf+4FWG9Zs14i4xvRcHJLNyA?=
 =?us-ascii?Q?v7HAKeRNiAc47xEpqQx2PSlzgRbuC70+yFfOgP7+Jch4SqLAVGMfxXtJbOpv?=
 =?us-ascii?Q?GzNT0DH7qPvCdOEvb3O+n7q/q9WvmI8cbD63n18A/KnG+nqer+eay5hbbdvt?=
 =?us-ascii?Q?d5tGH5rAEYVSwuhiyuw/z7MDo//Oe2ED5ytwzhC0eeWC0Ixx+9rd3sITeZx8?=
 =?us-ascii?Q?xI18tAleS+usJshyuC98+TMoKAQEeaMXXy/bRuzXljJabsd342gGF7wl5mgH?=
 =?us-ascii?Q?bi5+Uj4qvWxjWoEWlZqN3duLQTwvNwFsj+/XkuNe8K/BuWzuEv7lL/79L7SR?=
 =?us-ascii?Q?eHTFW3q0jJl+Da30VLszC07P6QlznxxOimos82iHzmwb/IQ1rrytvFDdvnVf?=
 =?us-ascii?Q?rrw5OI3m7/peTOPKg00RYqfowcVHAs1zSg3QEDpvoyi2aUJ3pcM52tEGproH?=
 =?us-ascii?Q?aUgb0cwzZOFpQhTQGuCzjH6RDA/QVDIfilVAauGcpdAwrjWq2boUiGAyaIqt?=
 =?us-ascii?Q?7+Nmh0NUpJ2Aa+fnLZHHJqWCth97Kbzt5LjH47v20VHndhC3rRSGqPghQxZH?=
 =?us-ascii?Q?nv9At3QmUaTvJIImtC7eW/SyhHUXdF11xoY0GEc1bZDtr3m+WrxriOSAObWp?=
 =?us-ascii?Q?gLa2952+PqxxlbHl3D5ohe713WpWM1iL8ChwLrKIF+giHFL3ClWn4QoFqYgT?=
 =?us-ascii?Q?Ra9tLFKRbwL/woVoyJvDILl/KakZMjXAP05NZBRS6SlHrgW5X/x3yRLefcAL?=
 =?us-ascii?Q?qTdpylWm+IRqkpbdddz9E2Zuu+VLRuAl4r4p6nGDie3JpDsYdg3IXVrU264q?=
 =?us-ascii?Q?UZ5m/OtTiZg0YKoX51EMbusmOQk1PE1yXvyiP+Pl1AnnNBIS+WIJi3b+rIoX?=
 =?us-ascii?Q?8Hy3gm3fWatxL8lBrfRloulr9AeUsRcsklwkbjMBdDkWqmAzXpfQdG47cMHo?=
 =?us-ascii?Q?tiTJ84P1UI5kYWvlxW+VQcfBSd5wWPyhkCAENFIon1l9x9A4FQ9sDm+a5VMn?=
 =?us-ascii?Q?nVxbH139f0TExMEapjbhiW2uRnNu6nrC69YdRVS8vmIfh7hPm8nFphjKTsF1?=
 =?us-ascii?Q?c9hOQnImAhSMNLhINEotNujtDP83JBELHXE+OTthWsHMyKGSNUZZTo1ecQDp?=
 =?us-ascii?Q?w1qBCB6Aju3c5/0/3nohn+YPeey6iwAj40+ISUoY/UCvSSUbIBt3Fh7PiV0h?=
 =?us-ascii?Q?dQis+kb+Hgm4jKr1URCNWiXR/4R9y9DE7fmEOE1KPWuLYaiJNqiZtFz645f0?=
 =?us-ascii?Q?HJKvKzTZaePPuq7ScnmzyDHJC9He0bJNn7Vk/3QbmDMHr/7kIT5jGpHzyMhV?=
 =?us-ascii?Q?364JfSsMwfXPGYmo1mPaqxpmfGiKkp1UPTKBSCk9EnrDpo9UZh0un3HttPTv?=
 =?us-ascii?Q?2VeB75J96Fqe5puT94eVABUvUAKcYmzhCKvCiq9P1ifDBIsMZtZ0zmdeUoPp?=
 =?us-ascii?Q?EdKF2sDRkwcaejX/Jcq2s0Mf5xVzbG25ZZekdWvT7UFILcDLOfL25k/NhX2m?=
 =?us-ascii?Q?aO44uHW0e2cw2oUFo2ufu5pbpu2SsP41P9VjkuezVl2GY3TqFySjjSjvXJQ+?=
 =?us-ascii?Q?BGUSSbUI2TQtYqnxni//7D8Y2Bx0u1mD9lZ5MvzBMyRQBBhk3Hx0OHbS6cdm?=
 =?us-ascii?Q?PrS8Kw+Vh25yMMuIga23m+NwrWmvK0XceEkjJxtkxcc4Z8xlXp1doyPzOsNZ?=
 =?us-ascii?Q?DU8lYG8OazOWFlubSGnaUH2VRa2Gr6Jf1oCPx4Kl1yG9zlICEAt7Q184Tc5N?=
 =?us-ascii?Q?266au5S5k8ydwvPt2q9AnLFgqU6Bp8zZF6MxXbU9SKE7bvpRnT3G?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4912678c-5928-4c31-7a82-08de7ac15846
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:13:16.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CehyAd3jl/aUwExCIIZA7hrVWvXhYuP0RqO5znP14GJFHX0yY6ftAC3iMCw3kkgkDxIpc+x0X8ZA3diDf7Edrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2299
X-Rspamd-Queue-Id: 093C521317F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28888-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,vger.kernel.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,valinux.co.jp:dkim]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 08:37:35AM +0100, Niklas Cassel wrote:
> On Thu, Mar 05, 2026 at 10:54:39AM +0900, Koichiro Den wrote:
> > R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
> > (CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30.
> > 
> > Update the advertised alignment to 4K, as described in
> > commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
> > for buffers allocated to BARs").
> > 
> > With the previous 1MB alignment requirement, iATU programming for BAR4
> > on this platform often cannot be performed, since a 1MB-aligned target
> > address may fall outside the tiny 256B BAR4 window.
> 
> You could also mention that CX_ATU_MIN_REGION_SIZE can configured to
> a value in range 4 kB to 64 kB, so 1 MB is clearly bogus.
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Thanks for the review and follow-up, Niklas.

(I initially wondered whether the 1MB alignment had some historical reason
behind it, i.e. an intentional or unavoidable hack, which is why I hesitated to
add a Fixes tag. But I agree that it is bogus today.)

Best regards,
Koichiro

