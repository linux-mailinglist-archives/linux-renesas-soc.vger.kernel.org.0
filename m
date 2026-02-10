Return-Path: <linux-renesas-soc+bounces-28140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 03REA1NPi2nwTwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 16:31:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56811C79D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 16:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95B323003D29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 15:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D581E26D4EF;
	Tue, 10 Feb 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="fK0bufp9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021091.outbound.protection.outlook.com [52.101.125.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367242AE78;
	Tue, 10 Feb 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737487; cv=fail; b=rD9BlMticALRpc4P28FDUNAZQdjORTeyVJ3yDtQvuZ0nchkJF5T5qPQpY0LeGfb/+Mv8vccL1Q60YGcRqTmZCqs3+xEXb4G/gHe1dz/VUp27c2QOA8CH0XrpYtc2q6Zn7YpdPqsFVMS/Ewd3HRXe+w5ncc5YmKN0LfiaKCgd6Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737487; c=relaxed/simple;
	bh=Q2BVzJX1PF3CWF0D5Th/sp9By8yBNkKIhiJB83i7oOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lchRPg/lG8jPWbDODzOIaDhF18S850iN5KIcfLGPvHIrT0m/miAW/QsYvY5Bx6492p2Jtrumh4aFQq2PMdPMb5/0lxUhjmZ9AYZs06CZ93k2PTXJ5HVKiJKvhCTJ/YjHOnoBatIa59Uy4OCZCSjOM9NoM1fE50tsytr+ln82WEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=fK0bufp9; arc=fail smtp.client-ip=52.101.125.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+UhmYCLfQ6mX/4zIn2QQAJLCKbhRyiXNNrLdq52yzZZohfNvTO/HuioktfgX8Audotm0ffx9KgY7AHvqYmlTwVAYPVAhiQ2/qvHSFmxTSeIbIL9dJ3Qcrk0a+1kxkTNVxD9AgIgf5YTR/CHAHvK0URO+bsOZmny6z48rrp2DPIl31OYaQ0K9yEHGujhXBAAOgrkTZAR02+XV3rUuayPlawMnuLc/zWt0RYf/7PktrTV8gSPOti0s7kvVV8paLHNEpw/7kuk6A8CSnGe0soELx4IhA6/NO40Eua1nmO9e4qokAgpT2XCXVEYmSXwRsBn3g2S6KVpHHXwC4+4PpiSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2J7S+25159rtHo9upR6YprF/Tc4lM+4LorMXMQXWBzA=;
 b=ukjbNS8TjAIamzhI3V1L7hLJY4j4+dcwo/uj+Vd3lwzce8GaAyTwSQCRx/TjI5wTZx3Xn6ka2Shw8S3hpSoOWhIqKGCnNCITHPi0pO9U4WbP+XaNj2WhF2Lqa7k8jFc6gbJrwDSd8gNgZDxI3uPzOU22v/4rytXLvJlFo8PKGxiQ1x7MW3NpVAElf8hMTXQk/DC/mSe3dar5Zd87cb263TA8p50m/2oebRG59RCnFmQjnUe2bZqv1/GDGzQ/ZZzcenUYn2jXKnFKf6QUkKNQoufg2pu58CONr31iZMNWDmDaRO/scgVkswbzs63YZrYO6E/N26RXvxMAi301+GWTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2J7S+25159rtHo9upR6YprF/Tc4lM+4LorMXMQXWBzA=;
 b=fK0bufp9mw48z9K6EfX+AmNI6RFHXQy1O3fetds0LDvZAsGXLdEuFiWxgz6mVSdCTFmlxPv3t2fGfxkUVW+5/u9x0cuotVhztClfcMyg5L3gMHxr3CsGXH+Sne9ffF3rPiJslq4tEK8hYSbUBSy7ZzJlhCEkvpHdiVa65iOdIvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OSZP286MB2207.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:18c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:31:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:31:22 +0000
Date: Wed, 11 Feb 2026 00:31:21 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, geert+renesas@glider.be, magnus.damm@gmail.com
Subject: Re: [PATCH] PCI: dwc: rcar-gen4-ep: Program Resizable BARs and drop
 1MiB BAR limit
Message-ID: <5kxesjz73i7gpaffna56buhqwmmqrukuyyg4lnlrmbylmmd2qy@756mchjaouz3>
References: <20251023072217.901888-1-den@valinux.co.jp>
 <aYsHjNL_c0Z30-KH@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYsHjNL_c0Z30-KH@ryzen>
X-ClientProxiedBy: TYCP286CA0327.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OSZP286MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de4eb0c-6e30-4a25-d79e-08de68b97216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vui/UIazV5zaryxMhM6EBpt58HCibInUE30UpSbgWu2qojaM9sN0Mt35u11s?=
 =?us-ascii?Q?xDAuNt/1jnim4mpTgLzWUCjHpRqxdNDEZnCmjdOiV2i95Uw0OBy2MXkkqF88?=
 =?us-ascii?Q?MFa8YU80F0Q4XyKN+hrd6t25rj9aRAFZPizF2a0nfTRmIB89NHZ1Zwmk0FKa?=
 =?us-ascii?Q?lTEP0niP6KcrkjNnu09KleAAz9lChzpaavq71wksLSNdzeYrnCA2AaoHZs8C?=
 =?us-ascii?Q?vLQVnPI27GpjIxC8NV4keZ/jjAFiKOQsModZSnKjnoRNfQYJE9FxmNQB7f6F?=
 =?us-ascii?Q?VB3ZgsFp1MP/PzBMPQnWLK8Rm7CuaMA/9Yo8NtEezJTTnu6Kv2qco/Rg8YyZ?=
 =?us-ascii?Q?IeGpzKX4nRCsTuii4U1DBJhmsvbge7jOz3oWov5fcldJPd9IExfPefGJ5Y+u?=
 =?us-ascii?Q?nKSYryB595aLL+NDpB86t10DMPuQEnnHZ5cm816ZRri5eSXQ+P+FJ5q29a+/?=
 =?us-ascii?Q?8LTKPT4QdXQxZNLcjIZrtrymOyZilZusKqshzmIq8bHUNuxAPd9+VNSPK8kv?=
 =?us-ascii?Q?dnu5NICUFHlnJgmqB4sIq230hPiXFUexhkHtMsJtDZUW/xAfQd/ToHAeI9Ob?=
 =?us-ascii?Q?UdiVl/rAF3E8NYoYIZfrgLWUsVqNrJJi20z9yzzXykKaC0bZ54VltbwvrH/W?=
 =?us-ascii?Q?YTSgTxn6XxkaKlkP6EbAKaWN/wjVbQpYxeMitVyQTLMtf/SAl/NbxSS1+R8v?=
 =?us-ascii?Q?F+yfGv/Cj4bEjASIxKtrPlvsYkbwkHVLbM63C/b/47uZRDKFjiLpDi3yqJlX?=
 =?us-ascii?Q?7QMJ0ztqLqc78pLJWPvGcI4jzPWL+Jh14toIxFrc22UFIwZgmnspQ/fdLuAB?=
 =?us-ascii?Q?/uHVC6ewQR6R2gIx6indRmyBrmzHZvtPRqSWmIoPAmg0q8maFWHz3OPVNzpz?=
 =?us-ascii?Q?R/M5qzqOIiSTeJsAlsfZSPVSLbNd8LdbylHP60SPyrnSAE9iX86j8gdtZPw5?=
 =?us-ascii?Q?wGkgvWH7Ekk8GOPquU6sZ1OAeQZ8UvAW9oRB0G/eRubIX8pUPw6tr1kvfOgO?=
 =?us-ascii?Q?safo+Ef2jQ+u3BlYDdckvh/oCdD/wJkG/T4k6kQGSpLXIROCdo167sXLMifL?=
 =?us-ascii?Q?VuDaJqZquTgpf8tYA4zu38DQjboJ9zpPqKk1M6H6CgD2BVVwlf7Wv/4Lf2DP?=
 =?us-ascii?Q?GC2iUabeLhzn7RTFLiIQ34NjtEn0h96Qw8iF+dKdv2f9LNz5mQkSqQfKj5vv?=
 =?us-ascii?Q?+Dq1cc9InS4YV5jTWcu2QY51wLiFGkYYUfk8iF5dlWsK/vXHYlprY/1FioqR?=
 =?us-ascii?Q?KbOxEtKmnFatBIf1bDZlNsUz4X7Zhxx5UX0+uRvJ5j80UL/EyQktdVMMxw+R?=
 =?us-ascii?Q?APqV60i3gKutqzWOjyvMgNOFBoqIpMW1cUanRkZPi8L5V8KeAJUwowd2qveW?=
 =?us-ascii?Q?6xuZNs0wl+0xGfFDm04qZ2Uh5u+5u3qUHe3QyTir1QdOCS5VYy8e8KSeGuVS?=
 =?us-ascii?Q?KlhlDZjFHL821I0VtSTtw3SypYCrCEu7NpzHMZd/qrjiiaf5wfviByBKSIhR?=
 =?us-ascii?Q?Cb93Y/9ocGKEx/IzQOfTfQLxCq+ini1LzR/7cwZIncLkcHfYgsGIt+/jkGjH?=
 =?us-ascii?Q?bTOUrCNMyVrCO1s7bck=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l0C0BmFFGgkgxRctk1tJ5YcuRmIPdLtHw7vCuPOiMdE3SZkHERhtgwHnHayH?=
 =?us-ascii?Q?sS6L5Aeii8DvEU9HxWTxcBcpCK24Cna4v7P/n2xCG4Fb10GCFX4V2x4sR8d7?=
 =?us-ascii?Q?dYn6VwsW8HaLJ9ajN16aPhj83eJjOmf6stSORBHVHOdbQYfbfRvBdK83pRMZ?=
 =?us-ascii?Q?s6NDCu3T1c4ZKquNDxC9zur8te60sAaWfN1P0EEG2Vncc5fpGSy5w3T+nHod?=
 =?us-ascii?Q?X6OrM35+O7DvVrCNN42grWP29azesU2HICPMnmAb2as01/IIa6PyVMTbnV+0?=
 =?us-ascii?Q?i34T0uTrQJNku9rwzmE0eWdbIzbfiAv2/auwF5CfMLkoaxPcS080URLVRq2V?=
 =?us-ascii?Q?nsyOBB7bfgtBIHz2LOwJmcD34b1f7q+cA1nD03+33IPs1MrYAPcTKtNJPG2A?=
 =?us-ascii?Q?fHv+plV/Qymjb+w9Tw6CjghOjaAF3VwgFh3egSsgHWcoqzQ13S5G1Gss1LMA?=
 =?us-ascii?Q?MLdPj8l2tDmv+e30ovY+F0VmKvdc/xI5J6GLExcLiLIJLdrRz8CF4cEgsLpc?=
 =?us-ascii?Q?zdvoTAhB2qpGfu/5TeGvhLPxxt6w4mIbwxDTPhNRbw0BrUqERQH12jFUSFEs?=
 =?us-ascii?Q?MrXKyTNmGPP/x7DJYCdqpILFlVdvjdUolZYgPwge8zLE4YZJlrKRFnfl5ydY?=
 =?us-ascii?Q?1gZ7hzm7JfhpO9PEL+KEb51DUy4iJdVAYjVdoC85Jw9lbansZ7vqwZtqACkO?=
 =?us-ascii?Q?TOIXj3nuwiEvZvbkvlWS0Z7Vi8sQhzCJbBRk167tWsirSCSTy1eDwyp2F4Ti?=
 =?us-ascii?Q?mWef+gu4MuY7dSQoHvf2lYbR0ioctuvs/m54D9qGWiRnuROE34FcxCll+pW6?=
 =?us-ascii?Q?4UA5wmCOK8OxOZtHiX241tnE9UPyPIqBQA/sIj40C5wytB4o6rIGQ6xWlZKQ?=
 =?us-ascii?Q?Gz/uMGnPwPg4PFN0psvjoyEzsobJ0qjn0vgu2CcKYeESLPLEOZQUpJ5bGfIN?=
 =?us-ascii?Q?QpcbdJqNgpVI6pO4kAkeEbKOKnaqoivWwE+ARxcqH1Ll4J/BYtXLoE3mJoFU?=
 =?us-ascii?Q?MpG97b9FsT1j3qTgA9vpORamnddKXmO7YWoM7DXzLRda4o9XmgU3fofUGafj?=
 =?us-ascii?Q?PrMqTcIT7rTOeZ6ouPpLGCYL0SwYsOyEhG421MyYpXY7D2Ekwbaz6A0IR+mg?=
 =?us-ascii?Q?3pslL4yewj8Ifkfp3g9nJ7x6mdwIlF5MwJ257YMYYMZfgirq6qZnv0u+RsfW?=
 =?us-ascii?Q?4VXAzSZJNNUCsBTKm1y8BEFpmn5km696tZjrFxsOjRwGz80tJm7gshAkp1LE?=
 =?us-ascii?Q?rLPl9txCtjeCzVMZEtgmt/L0VcV5ie44WsxjtA+RaUQg3TMmuaCiqjZvu0ak?=
 =?us-ascii?Q?A7mAtWdmfmCjjNt50uxr9tMOJ8S3AHS1hWuV0iIi53dJrDGnBCNBCvzvINxD?=
 =?us-ascii?Q?scyKF0F3X/iovsba7hmmahjz8Kg8HFAMC71a8r6Z3SKNQXiuhyxcxfBS5qA6?=
 =?us-ascii?Q?XjzPmKFzgu9O1FLII/RSb9fHjm6goXgKplvGQHgXiEUDO7cVEIiW071CPeE2?=
 =?us-ascii?Q?vE3OIR430zUNY7IhvfAFP0X/t/+f/VoGNrEl/aecTpsodlbeiBb+AR15WBbj?=
 =?us-ascii?Q?G1VUclGOSpJBIYNmict2cVlyYvMcbEfP03o+T8hbKr0aizepVnG65vZ6uC11?=
 =?us-ascii?Q?flZwzVxipg1XLeSmlEHbwtj+CUART30M6AN+MotEddrHA7Nt0tTG7NOQnkfM?=
 =?us-ascii?Q?VPcwEnXQkb28673fnTjZnPomboYgU2FKPaG6w4uNHMKYdkQNYVwr9+ugj1Kw?=
 =?us-ascii?Q?AS6s6ydm5UWZCbxgYBRlTpNcOlJK2/Yav4VkyprDL9JUMh1HTdDY?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de4eb0c-6e30-4a25-d79e-08de68b97216
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:31:22.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCcGTvj+eyNcvS8pKegsd2AEH5uZsdeXsC2pX/WOztiIBqrmnU3VQxHwF3Um010PK4as5Z7MWNS7A98Wu+7Eww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB2207
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28140-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,kernel.org,google.com,glider.be];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B56811C79D
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:25:16AM +0100, Niklas Cassel wrote:
> On Thu, Oct 23, 2025 at 04:22:17PM +0900, Koichiro Den wrote:
> > R-Car Gen4 (S4) exposes BAR0 and BAR2 as Resizable BARs. Program them
> > accordingly by using dw_pcie_ep_set_bar_resizable() instead of the
> > programmable BAR path.
> > 
> > Before this change the driver left the Resizable BAR capability
> > untouched and only wrote the BAR register, so the RC enumerated BAR0/2
> > as 1 MiB regardless of the size requested by the endpoint function. For
> > example, configuring a 2 MiB window for pci-epf-vntb still produced:
> > 
> >   ntb_hw_epf 0000:01:00.0: \
> >   Size:0x0000000000200000 is greater than the MW size 0x0000000000100000
> > 
> > Program the Resizable BAR control so the RC sees the requested size and
> > ntb_transport can use larger memory windows.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > index 80778917d2dd..dbad741b8286 100644
> > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > @@ -421,7 +421,9 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  
> >  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> >  	.msi_capable = true,
> > +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
> >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> >  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> >  	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > -- 
> > 2.48.1
> > 
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> Considering that this patch has not been picked up yet,
> perhaps resend it using [PATCH RESEND].

Thanks for the Reviewed-by. As almost four months have passed, in hindsight the
commit message sounds a bit too awkward now..
I'd like to update it to at least remove ntb-specific wording and make it more
compact and concise, like this:

  PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as Resizable BARs

  R-Car Gen4 (S4) implements the PCIe Resizable BAR capability for BAR0 and
  BAR2. Advertise them as BAR_RESIZABLE so EPF-requested BAR sizes are
  reflected to the host.

If this looks good to you, would it be okay for me to keep the Reviewed-by
tag? There will be no code changes, only this commit message rewording in
the RESEND.

Best regards,
Koichiro

> 
> 
> Kind regards,
> Niklas

