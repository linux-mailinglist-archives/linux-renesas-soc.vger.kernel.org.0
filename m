Return-Path: <linux-renesas-soc+bounces-32384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NN8ORTpAWoRmQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:35:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1F05103E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A7A6306F8B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033813FBEAC;
	Mon, 11 May 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="bMypxiIH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021089.outbound.protection.outlook.com [52.101.125.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0756C2BE056;
	Mon, 11 May 2026 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509229; cv=fail; b=s3uvuc1LL0HkHEghmaqgriM0kXe0MTuSdZ3quoi/BApvm9ACYQ4h3NdXPN3KIJFzT8Fzl6Iaun4pAGa+ZayMvl2odKOrkNHWTb+b/VXBMppzJmBBs6u+UB5X55dATyX7J6YBAsao62YNUIEoXRM3zEvQUbqTXa+8itnHzulXc+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509229; c=relaxed/simple;
	bh=DzNlIrq+YUINuKRTRWhYXcFcBoWLTnBx/nvy3MeiIsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I3oQhtseJM/kbpEghEsNJSDAChUmuXo0AvpgT1pa6Hs8FboX9MbqBDiv2xTx2JHlgY+QZF2zPELSEj+Phq4p5TGAc8Vl2HLfkFY0Wfhbt7lLkLoLgDBBWn0K4A+/LKM681QWfRELPxM9TE9ilemx2ywp8jGBkHfBEkyiDIQ1b2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=bMypxiIH; arc=fail smtp.client-ip=52.101.125.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb5S/begdVABkW0A4JeykIYQlg5RE4JGPQJpwS4fFzfJ/x9vskhqNahbWymdhvA05H1mXmyk7Ull2VULA3kzlkSLNh9in9NAWGiGzf3J5Y/wCdIhoz0drztlinwPj3JA5ykHxRrD+/bKKiI0lTNlWohOJMJriGL9msEDSNkZfPYKaY+S6offZ3pvHvRBNu6ZDfINOw0sKgNupDkAaBybEAkABopIhJoiykmNVwqs8Y/mLbTTMi9l9u0L0M20G5zNLOX8NUne174HTsT0K6A/UVRUiz3NJiz1iA26+RnvILdCT6xoiaCQA0V1/Wh/6VQuXhs2qpMCQMGvy9sRA0xBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS8Q6HXWCxX6q9dWQIAmFoOJpl2j2TOjDv+vHYJ3X/8=;
 b=BWwUYxKMFZN+H7THr0ET88+ql+OAUgp4aUcp0e3drZv+ajFK+FwtsN7YzR4jymvW+uVHzuxPLXmkLkkpI3kL/vcYSM+yV4ary3NZ4siHUXDG34a1dcYZ1LaovJ1wcYE3EU2Yt4VglFTSnVhbD60P9WjsyVUlKUhwfZHso5ha3SZSnZTrXp9h+AeQt1QtVoNY3Bb4cwkQ5mlSqvQITS6VHmhkkyauKE6PU0l3MB5IalDrH/SUv0u2lNhoovRZmy6UGdxh83UgOvEuOyGgxC/hRulitDA6F884GSUkhlCx7WFJRjq4Pgx1/f+q1+FKPOGl7Y9DQEVIqVUToG4zWCRc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS8Q6HXWCxX6q9dWQIAmFoOJpl2j2TOjDv+vHYJ3X/8=;
 b=bMypxiIHtlxufxaxautB8yCc9mcwnHADLHmdofL3yeGgOylt04MG6LT8/3wvgORentcxhlKqPHiQdHwczG9wCVuHhFZfPAebTQc4RFrnM8V2z28n32KIzkW8EtQDj+0ZvzFszh9CCpbFDuyGj3FIOU9bz3Rgtxs3b1Uu/9pYLyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB5412.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:266::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:20:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Mon, 11 May 2026
 14:20:23 +0000
Date: Mon, 11 May 2026 23:20:21 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and
 Max_Payload_Size to 256 Bytes
Message-ID: <wpv2alxxrf5jtdyoz5kpry6446srz2k7jc3lbwuwwbfvswjuce@i75vxrpxw4ox>
References: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
 <oeb2uiudm7afzzzy3f5rykzctfnxlsydit6ww5raohcbxo3v34@hmnqr2ud42kq>
 <66d050f4-5d21-43e0-af8e-39a0d6c4b0ec@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66d050f4-5d21-43e0-af8e-39a0d6c4b0ec@mailbox.org>
X-ClientProxiedBy: TYCP301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1017ec39-a80e-436b-c471-08deaf687037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|18002099003|22082099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info:
	gVTmllbiMgnTh3L07C9paCUGcVrwlPKe+uHcPnNteUDo4ff1FJcLFdYWnmAe+2j+6qUwHr66O2YvuA8oO1tMs5WMrw/pxkZEGwZlJ5RFKIKxvqEXHdZgQXqcDQU0od3mp4KTOvy/e66WC7z6y5r3i6DGey6VAlz+PFPkx7pScSAdKnWyhbDmoMCgEJBSwcwyKCdxFDXLPiNXgKIUZWOcxJA12lEGo7AAkJyUaIn7y+Cb6OHGgAG3c5bzAxrHk0bkMjEW6zsci/KS5Fg6Q0G58VfXxMcyJitkfMge9ZA6RpDiAYoD0SMAWopG02WLNSlBsbTm6JrGnLZzmw2r5XeRpwuRAcBoL02iiIw+Z8B3+kWR09MotFiC1UR9PYrUf4NiVcE5sTPHJO3BxMWi6qV3PI+0I/+VU9fbwCFVoAbQ/Efmt2URvv3dNH9AOL9KXixshRj8/F3eG+ycDmMj+bhzmIsgDRaeBuuny/PpG68+NPSKLF+sONhjPNjyKNvPjSa81r0g03dHRueGnuvfNbidyKCXCUV7ue8avo+TND7GKZA0HcywtkHkopQ9aej452oRAPn4m60knuv1vI6SdaXhAp8LW2CvW0KGaFGrIfHbCSDSNpHyggi3I58edgYhWiIjSxmbDmddGyqX5yujPhG76U1Rfe6l7gtkiedNmB03HkKorjRWZ0hGWUb6QHiXgkMzG+wa6a0SL1VbDHOj+im/+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(13003099007)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rlXVAtefgDDlmIZjl/2B5It9G/JJKNG1EDEr5fcmmMXU/NwhMbuI9BKVO3gE?=
 =?us-ascii?Q?i11V5bDb2F3fmWwG+t6DjFpIpD+tXTjhNu9sRUT4vMAg+7wS8CUZLzEdkUzw?=
 =?us-ascii?Q?nxyARKOAfxLbRUMUwi9TUzI9rO7jmsp9Q3BNQLYe+k5bHD20f5bWe0Frhl+B?=
 =?us-ascii?Q?SXCuCkliuyKZvWUbNnJJo4AYVYbjXcXLdqXD1mg+KzpaA/eyrjNDDhI8JoSa?=
 =?us-ascii?Q?j0RzDswFrUinxAXyqOOIVCd9a8p6+ZcMH7OE0p/LjsrQvFWse4ZzB3ZwVHXF?=
 =?us-ascii?Q?VWcA1iXrdpffsAi3MJkiblsZK+eCjyE7wRt4+741K/FMyWE5fdSMOVUwYnkw?=
 =?us-ascii?Q?yT0Nvtgpv1vgSKPwpCSDFF+pdRF+9P4WLgLdF1H1y7YzXhYateO518Yd8scU?=
 =?us-ascii?Q?J3WFGPki5LpLCnQyrPA0bX4i1mDDwB2bBukuSU58Hn7IvP4zGruImjwYYi/l?=
 =?us-ascii?Q?n9bvdYNKqnmVxxVdFHX8tNmdqCV/r49DQMejkD3j1GVr9NlCOfzrYP9sEYa5?=
 =?us-ascii?Q?BTE57/Fmhh5RPfIFqAhPCzOawigwTxFLtjcwlvTBq7QkpbqgUpE5VKBS6O8J?=
 =?us-ascii?Q?3ZeBpipkK+QHNwtErMCF55KIGhTpCsuiGcg1YxMQ4/2HnxnPt4cd8WaDw9H0?=
 =?us-ascii?Q?XSb4/tg2aGf4vIBCQ0jlMaryr5/Vd5kI/4pfwZT66KNqJmzsYJ28koXZ2uLD?=
 =?us-ascii?Q?e3l0529CGXiSYpnjwr79l6VAaqmCu4hWV/z77MG9uW+T9cdcJIpobkUWMgg1?=
 =?us-ascii?Q?CgBXh5EUPKFeesUw1D6Wa4f8qvGZBJX8B+YrSu7lhgcZzJOF3ejXAbeK24iL?=
 =?us-ascii?Q?ZXb9TZgbpWz5F8sUdeGbLQZ+rMl31PKle5DwhfHx3Tweni4gh60D/vcnCGx+?=
 =?us-ascii?Q?t/3Pgg/KvZryrf5ZxxhkrI0Isgtns/qUy2X6G6y4qVdnxlmgIC+zG5tZTeGs?=
 =?us-ascii?Q?M1OdjgK1gBZ72XYYBCEMiGetyA6iA6Tg7mT9M6pt8x4r7VRRT2vh4Akkn0t0?=
 =?us-ascii?Q?RX91zENV3rbmtkf3vtOrGYdhDG1pNnfAWa8GMNSVCwolGU6tIJHIkO4oTXt6?=
 =?us-ascii?Q?PLlIj6xji2U9dfnouBosT4dn+aQJjWSDo1xsr7L18Ju6pAYe/zcNaL0Uz4Qc?=
 =?us-ascii?Q?AHaeIl3qbO+sSWHsqhzwmIml3k6SWbhWsO/9TdxLnbVwDBCysTqrFJjYXUCj?=
 =?us-ascii?Q?NVA4BdvZUTrT8pi8/Rc++y4UoUmCjgsqdwGU6Sql481Ogzb7cV22pylYUyNG?=
 =?us-ascii?Q?izJbAuvczdAb0ip4E3ujxvJM80rCKtvu28ODqJ7col78mq5b6ufloGdBMAyw?=
 =?us-ascii?Q?ypHkAlODyVmzgPsYq8Gjv5gZEZEpBmie2Cq5p+/bgNnoAB2fmcaizwe7/5Kp?=
 =?us-ascii?Q?DHShqAfYD6WAoavJGSDT7gVUqPJyyksYzayKJUlLoGPtRFxHI23SP0U0o55P?=
 =?us-ascii?Q?tspY726nGrJSSvSP4yIQEkUuTEy1ve9g/AEcnXwz7emNQYcVstuu4eZzvQnk?=
 =?us-ascii?Q?kLxGhM0lD61whSvDitO6XEdvE+q9us8AFtRm895TWqP+O/K9WQfsqWNc03uc?=
 =?us-ascii?Q?eIHkg/EumkDhRYNcySyeDCQYaKe7PDUAzWZnOjxy3unrV7OSuKv/x4QY5LMg?=
 =?us-ascii?Q?+87hbvEhDF5BLhQ72wEJgbdNRq8DmNJi/8LufDcU70id6wLNyurKs1DkyYHR?=
 =?us-ascii?Q?PvdPhmOUNlZOScgZvMNEETgp9LxrklvSopiSaU/VotoMT2NoDDPCuPYiga3I?=
 =?us-ascii?Q?1QomCTEgknsv1GAgJyHVRei9xHldf9BavcGCW2YQgOx3L+dRzJRG?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1017ec39-a80e-436b-c471-08deaf687037
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:20:22.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lv9Zyhx4e3cpPqjejJNHHjST8XkAT0lomO1f6OMKI9gyzwjPdcx6d3BmQG5IcE7a3B7KfOl2f1oz+2/f0VZAxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5412
X-Rspamd-Queue-Id: 3E1F05103E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32384-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,glider.be,gmail.com,renesas.com];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 01:54:01AM +0200, Marek Vasut wrote:
> On 4/28/26 9:00 AM, Koichiro Den wrote:
> 
> Hello Den-san,
> 
> > The patch makes sense to me. Let me ask two questions:
> > 
> > 1. Could r8a779f0 (R-Car S4-8) be handled as well, perhaps by adding a separate
> >     .additional_common_init() implementation for it?
> > 
> >     As far as I can see, the r8a779f0 match data currently does not use
> >     rcar_gen4_pcie_additional_common_init().

Hi Marek,

Thank you for the detailed analysis. I'm sorry for the late reply.

> 
> I will address this one in V2, thank you for pointing that out.

Thanks!

> 
> > 2. Did you also happen to test V4H/V4M in endpoint (EP) mode, with the local
> >     eDMA engine issuing MRd requests toward host memory?
> 
> I was not able to test this configuration.
> 
> Is it possible to perform this test with a single device, by having the eDMA
> do local-memory-read-to-local-memory-write transfers, maybe using
> PIPE_LOOPBACK/LOOPBACK_ENABLE bits, or do I need two devices with NTB
> connection between them ?
> 
> In case it is the later, could you please briefly describe the S4 NTB setup
> you use, so I could try to replicate it locally ?

My setup was a two-board setup:

  S4 Spider as RC <-> S4 Spider as EP, connected with OCuLink.

It is unfortunately not a small standalone reproducer. The setup was based on
the following RFC v4 series:

  [RFC PATCH v4 00/38] NTB transport backed by PCI EP embedded DMA
  https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/

In particular, the workaround patch I used in the RFC series was:

  [RFC PATCH v4 31/38] NTB: epf: Add per-SoC quirk to cap MRRS for DWC eDMA (128B for R-Car)
  https://lore.kernel.org/all/20260118135440.1958279-32-den@valinux.co.jp/

Note that in that workaround I only capped MRRS (i.e. I did not add an MPS cap).
At least in that setup, avoiding 256B MRd requests was enough to make the
visible corruption disappear.

At a high level, the EP side exposes the vNTB endpoint function, and the RC side
uses the NTB data path which is backed by the EP-local eDMA through that vNTB
function. For the RC-to-EP data path, the EP-local eDMA acts as the requester:
it issues MRd requests toward remote RC memory, receives the CplD payloads, and
writes the data into EP-side memory. In other words, this is a DMA read transfer
from the point of view of the EP-local eDMA.

I have not tried PIPE_LOOPBACK/LOOPBACK_ENABLE. Given how heavy the setup
described above is, I am not asking you to reproduce the whole thing just for
this patch. Also, I do not want this NTB/eDMA observation to block your v2. For
now, please treat it as a separate observation from the RC/NVMe issue. I will
continue the investigation on my side and let you know if I can narrow down
where the corruption occurs.

> 
> > Your commit message
> >     describes an NVMe device as the requester, but I'm wondering whether the same
> >     256B limit was also verified for the R-Car EP DMA requester path.
> 
> This part I currently can not answer, I'm sorry.
> 
> ...
> 
> I made the following two observations in the meantime.
> 
> First, I wrote two SSDs, Crucial P5 Plus SSD without HMPRE (without host
> memory buffer) and XPG GAMMIX P55 with HMPRE (with host memory buffer) with
> 4 GiB of random data on another system (iMX8M Plus, ARM64 with DWC PCIe
> controller too), then I did a read back and compared the data, the writen
> and read-back data matched.
> 
> Then I plugged both SSDs into V4H Sparrow Hawk _without_ this patch, and I
> did read back of data:
> 
> - Crucial P5 Plus SSD without HMPRE (without host memory buffer)
>   -> Data read back match data written on iMX8M Plus, OK
> - XPG GAMMIX P55 with HMPRE (with host memory buffer)
>   -> Data read back match data written on iMX8M Plus, OK
> 
> Then I wrote 512 Byte of data into the Crucial P5 Plus SSD without HMPRE on
> V4H Sparrow Hawk and did read back again.
>   -> Data read back does NOT match data written, NG
> 
> That would indicate that:
> - WRITE transfers from SSD to DRAM are OK
> - READ transfers from DRAM to SSD are corrupted at 256 Bytes boundary
> 
> That would indicate that we need _at_least_ the 256 Bytes limit, likely on
> both MPS and MRRS.
> 
> Second, I got a report of another SSD for which this patch is not
> sufficient. I currently do not have access to that SSD, but I will ask for
> access and investigate. That may shed some light on the 128 Byte limit
> below.

Thank you for sharing these observations.
Interesting, that second point may indeed help determine whether my 128B
observation in the past is related to the same underlying issue, or is a purely
eDMA/NTB-specific one.

> 
> > (*) The background for my question 2:
> > 
> >     I only have access to S4 Spider boards. In my RC <-> EP setup, where the EP
> >     side uses the local eDMA engine to issue MRd requests toward the RC, 256-byte
> >     MRd requests still appear to corrupt the transferred data.
> 
> Is the corruption deterministic in some way, i.e. are the same bytes of the
> transferred data corrupted every time, or is the corruption "random" ?

The exact corrupted values were not deterministic, but the offsets where the
corruption occurred were fairly consistent.

Let me quote from my earlier RFC patch:
(https://lore.kernel.org/all/20260118135440.1958279-32-den@valinux.co.jp/)

  [...]
  * On some R-Car platforms using the Synopsys DWC PCIe + eDMA we
  * observe data corruption on RC->EP Remote DMA Read paths whenever
  * the EP issues large MRd requests. The corruption consistently
  * hits the tail of each 256-byte segment (e.g. offsets
  * 0x00E0..0x00FF within a 256B block, and again at 0x01E0..0x01FF
  * for larger transfers).
  [...]

> 
> Does the corruption happen even on singular MRd transfer, or does it happen
> only when a lot of traffic is sent across the NTB link? I wonder if this
> corruption might be DRAM bandwidth related, i.e. whether the DMA does
> possibly saturate the DRAM controller with write requests and make the
> system run out of DRAM bandwidth.

It occurred even with a single eDMA read transfer. It was not a symptom only
observable under high load.

> 
> > With the following
> >     change on top of your patch, my DMA-read tests become stable:
> 
> [...]
> 
> >     One detail which might be important is that limiting only MPS does not appear
> >     to be sufficient in my setup. MPS=128B with MRRS=256B still seems broken,
> >     while MPS=128B with MRRS=128B works fine. I wonder whether this is because
> >     the "MPS" term in the min(MRRS, MPS) limit for DMA read transfers may
> >     effectively be tied to the DMA read buffer segment size / MPSS rather than
> >     only to DevCtl.MPS. I'm not sure about this yet though.
> 
> I think setting MPS=128B MRRS=256B only leads to the transfer being split
> into 2 x 128B TLPs sent across the PCIe link, but in the end, 2 x 128 Bytes
> of data are received (in some order) into the read segment buffer and
> reordered, and 1 x 256 Bytes are written from read segment buffer into the
> memory as a single write.
> 
> In case of MPS=256B MRRS=256B, only one 256B TLP is sent across the link, 1
> x 256 Bytes of data are received into the read segment buffer with no
> reordering necessary, and 1 x 256 Bytes are still written from read segment
> buffer into the memory as a single write.
> 
> => For MPS=128B/MPS=256B and MRRS=256B, there is difference in the
>    transfer format between PCIe and DMA, but there is no difference
>    between DMA and DRAM .
> 
> But in case of MRRS=128B and transfer of 256 Bytes, 2 x 128 Bytes of data
> are received into (separate? (*)) entries in read segment buffer, and 2 x
> 128 Bytes are written from (separate?) entries in read segment buffer into
> the memory as two separate writes . Could this different memory write
> pattern be responsible for the (lack of) corruption ?
> 
> Do you know whether the data are corrupted on the PCIe-to-DMA side (when the
> data are received from the PCIe side and written into the read buffer
> segment) or on the DMA-to-DRAM side (on read from read segment buffer or on
> write into DRAM) ?

Unfortunately I cannot distinguish these from software alone. I only observed
the final destination buffer contents after the eDMA read transfer completed.

> 
> (*) Since the read segment buffer has 16 x 256 Byte segments, with 16 DMA
> tags and never more than 16 MRd requests in flight, I think it is likely
> that each MRd data land in separate read segment buffer segment. But this
> information comes from another datasheet, not V4H one.
> 
> >     One more thing I noticed in the manuals:
> > 
> >       R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025:
> >         Type00 MPSS initial = 256B, PCI R, Internal R/W
> >         Type01 MPSS initial = 128B, PCI R, Internal R
> > 
> >       R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025
> >         Type00 MPSS initial = 256B, PCI R, Internal R
> >         Type01 MPSS initial = 128B, PCI R, Internal R/W
> > 
> >     I'm still unsure, but this difference might be relevant. In particular, in
> >     V4H/V4M RC mode your patch programs DevCtl.MPS to 256B, but does not change
> >     Type01 MPSS. I wonder if the Type01 MPSS should also be updated to 256B first
> >     on SoCs where the manual says it is writable from the internal bus, or if I'm
> >     missing something here.
> 
> This is a very good point.
> 
> The R-Car S4 RM Rev.1.20 lists Type00 MPSS as Internal R and Type01 MPSS as
> Internal R/W. This was updated in RM Rev.1.30 to Type 00 Internal R/W and
> Type 01 Internal R. It is possible this change is going to be added into the
> V4H RM in the future too. That would likely imply, that Type01 MPSS is not
> programmable.
> 
> I don't think Type1 affects RC operation, but does it affect NTB ?

I have no evidence that Type1 affects NTB either. It was just a speculative idea
based on the difference I saw in the manuals.

Your inference, i.e. that the S4 RM Rev.1.30 may reflect the intended access
attributes and the V4H RM may later get a similar correction, sounds reasonable
to me.

I had not checked the S4 RM Rev.1.20, so I missed that change. Thanks for
pointing it out.

> 
> [...]
> 
> Thank you for your help!

Thank you for investigating this and for the very helpful analysis.
I will let you know if I find anything more.

Best regards,
Koichiro

> 
> -- 
> Best regards,
> Marek Vasut

