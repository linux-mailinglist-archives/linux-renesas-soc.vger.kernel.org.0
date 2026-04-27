Return-Path: <linux-renesas-soc+bounces-31674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LlzFklC72nm/QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:02:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C784716C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 277BC3001005
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDBD3A963A;
	Mon, 27 Apr 2026 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Tfh48FFy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BD6382284;
	Mon, 27 Apr 2026 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287750; cv=fail; b=Op0gjEqtS4JA7LfeV3yrbWZJdzCBAdzVqTKwYsx5EB9oX0DgFe+clGnfWSR3+yaNvgLgp6j/ilAER+i8VdauHcN55Orl1hQ9nRpuV9azoQhWPhzR7f1QJCbZJLxBz1korXisBaWkqGhydoPFD+9U1QcCCn1ahn/4n73+9OK+sRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287750; c=relaxed/simple;
	bh=Nf9mbvcc3/hXY8gD559nyzTiallJnH+An36q0xx3ViQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n23xrz614r985Mp6YOc2BivyefDmBiMJzNtJtN1hcA8PYf16HYl++fexl1cIm+WCdbT8+n0DuqUhVfT/EeHnh4L079HLasZugHgYlDOer2NoxKT02pzFBNr71jisqUOMmHH2i+KTbuvY/0GbA1a6j0ivskrogcGdPbzcWVYwA28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Tfh48FFy; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNdpCGwqqPUbZt12qq6Mddrf4k8x5W1ueEvHZq+/orm+uNH6Q3yJCvrMS01zoag+GhCZC7P5CTzlGymgz2GvKJYizJfwD8gACYsT9v/KCWdH/NC1s4EUJuERvCPhK10cYM5RBRd8tiVF153Jt07S4K7Y3YuEzAniERX/SZGL2/ADrqYx13sMVYH8vQdnGXDTwewriU0RBxLe9W5IrYysxEnlaKkGZ5NSGHidHq90y1qsL56bu1R+MRo7n0fC1UsIcv5oHR8MqYnYj65etcTARGnyOpr+YzRvlGxjZFbxcUVjpXC8KWsTLvG0mHjlXTu6INqv7ekKYdWJXxoXMwcDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDUlw+WWTpnRjjKLtszML6BYUIx6k381LO1wsE1vz6A=;
 b=LFpHV7LpcHFu1HGAcE/IGADWdQD0OqE+e1h6H99A1x6I47mDYusixV1GT4HQkdc08JL2G0L0It2hIYI30rTJoqqYeaJcRMHkPY0Ep1HcNJqPb/qLYMsIkcQkHOdyel1evVV8DDFFVhbkFggWJ4RVSq04KsuLM3iYOcF9a83Ct+WD86GWhgiSq+0YAnYdzlhGYfXoxKA8KO5ul42QrHsWIHY/l80XfczTLB1J+5u+cDgdNSzD9IEvmfDUiqOWkgxdFISnoFUD+Qgqrv2U3W+9tLf61ERmo6MgcuNuvNO2tQ97rwPrYq+rAT8pS5GasI/jwzJIaxOyR0ampE/JFWYowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDUlw+WWTpnRjjKLtszML6BYUIx6k381LO1wsE1vz6A=;
 b=Tfh48FFy4Vu0Epikpa7aBwjEBQ23Bn+P2vMkiJ73wdevhBbtp6pAZVpe5nHxNiKxV/cOAB9UDgtKF7hysklOmsIwe6Ko/trZh/cJnzRrWG9BuOulSWav+17VjLE/5p3jbeQFiy/bIErNNfTp8ES0wRebcLN/nPbQ+ulXwu7HMaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB9652.jpnprd01.prod.outlook.com (2603:1096:400:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 11:02:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 11:02:21 +0000
Date: Mon, 27 Apr 2026 13:02:04 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, tomm.merciai@gmail.com,
	peda@axentia.se, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add missing #mux-state-cells to
 usb2phy-reset nodes
Message-ID: <ae9CLFGaPPC17n-M@tom-desktop>
References: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXHhd150mpUT5-VPcHW0W5Hs-rFC-Bjrc7Z8Szco9P_Xw@mail.gmail.com>
 <adZaXSDsv4f9d8Bp@tom-desktop>
 <CAPDyKFpdafESpDDN_EaEQJ-5Kb+rxgzD9FYYCv8-+X4EJDd0=g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpdafESpDDN_EaEQJ-5Kb+rxgzD9FYYCv8-+X4EJDd0=g@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f05c78-df9f-4e40-28e4-08dea44c7491
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	oLuIanGMrTchOkxb3gRJg8APogrSV91D0RWHkdv8xUoG9FvQ1s9DP9SLTfqh/044Y4FdYzaRaXC5bqgYJJ19tKFO7EzZXYVJzFbMh3XVf0/GfQBBtUj9CgloH/104ePMLa5hW4J0TT0XlJ2JzT9IHjVwjfV4Chj4jHWnP2oEHDI3mEOfFkfwJXEB+v7lHHhYEpvO4BqAVrPWbjhVln68kevIx664ZlwkSc6M1FfU2Nk+TCdHgFXFZIT+VPbbZif2HiH4VJW8pcbcPAMUVY25265fOgEfZK7/CC4l5q1prWJi7vE2AiDDXmgLj3c1Oj9sskthbWTUtwTvR/0eMCvxEHowSKnJbD4GxmhG9PPMB9DkwHRVrRdjIyN0qMNsBhKNeY/b89jTRALVEFFYkjaUcI7Y7t5lKyoz4oTofrn36v3XZmKzLycDCHIOpiULYDzuq1P89hnJJGp5XFwdq+xjvMWKP+aecOQPcSBVHGatmJTyVn/Ufr2ToUZ+G1TU3ETaLqf58hH25R36pU1suCqz1sT1dJsWVyEWQU53ZA53W6rO49f0cH+5mCoBxxnq6fUVp6HUrFnR3sa6Tp4hmiZOc50Png4Jidi0UfxUygpBq35PIgfXGd/7cy1QwJqodqhzhBK5kqg+DUO7vBBJOlFfivuVH44wn1hHg3PxikmuBAkVYfUYDmIywqkv3D3xgVreMS2dn1WQ7zcp179zQpkYiDK+uS3xpkrHm8CjF6kI+5d4KIAD3ZKWvGPZ2CfbBJ8kI0jn0RUPpnd1JOaRA/rnladrj4gXOjG/Acp+OwfpIk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QcHEAtUx8CGTj7H90m1IMPXAx8S4JljSMVvfgd6wiyTLw6HeKZX6Vci1DQTs?=
 =?us-ascii?Q?DLDyyQIkb+EhvJ2mjHaA6dRG9JaM9Rieth2AFlACndpMD4aVGCBc6KlnFkhG?=
 =?us-ascii?Q?2MHsZEemG20RBeUUl3CacyPV0pvRwD8YbfPPuqf8bhn5R9gsgOvoe4btRg65?=
 =?us-ascii?Q?psmvON8S5LW+zn3jgkYWhb5xmQZG+wpsmXO1P/yDqjY8yo80/gGLFtOPvHYb?=
 =?us-ascii?Q?BlO4sPjY8R6TpwFxASP1EUeToH98hvcNRNZ5BMmV82PQ4TPjw0erQAXe2/Ab?=
 =?us-ascii?Q?osLwxi8wjAiVNdCxAxbVaTiPu1f9TglzSc1hgK+FrXalzEqs3AE2B/y+dMiY?=
 =?us-ascii?Q?9K0k1Jo/bVVV32PdkOfNa5vMT4axoUr2RHFSj7VAiYEg/o3todoPU1nCIeuZ?=
 =?us-ascii?Q?iQ5yF6ChQ8H/FzobcfB9VosheODSaozBiXpmDNbZA3HzaH0E5hFx7UFv/n3n?=
 =?us-ascii?Q?k538nvQAXGs72rHrvWuSOFv4w1SbThnXlDSNoP/ilSiCoKAQeVb+L100Iak4?=
 =?us-ascii?Q?YGCS/FnsQTPYSU66lN5Qg4cqfc7MX57w/5a98USyko4tsve+yOX5M5JVgPK0?=
 =?us-ascii?Q?URSiAvWQQQS8KzvCbKw1BBmvBoRzIkYCay8/jT/S/Tu4caY04+M0XDLcb/Zj?=
 =?us-ascii?Q?qy+cifpPsqp3+DNQn8QHEZNqZl2LFwr7PyqAklkppsSgaaaHcnLqwNHIafXm?=
 =?us-ascii?Q?7NX3bXh/mRj3j+/ABE7z2jLTW+reQByfzcqb47B19ChZvsAQWyHCB8opSBs0?=
 =?us-ascii?Q?0Y5v2b9OjWKAr7hQmNHYl52RfF8XcGT5Mo+1pWzKwQY2+zdVfY65jWJ2qiBm?=
 =?us-ascii?Q?Gg2OrGjEs2IHb18dsgOCpBT2M/MXhN3QyeYXY03eaJRgilrH2z2gstvYf1JI?=
 =?us-ascii?Q?9LTT1EZj40aOUjcuNmv1tHHx+iLpvJHgS6NWpOsKufJYcTZYkfMl5e2aiT2S?=
 =?us-ascii?Q?JqfrcJ/Bfedo3/6gbFZH1DAuCZU7fNBXherBCUUzf0eCz5aI/vrLFkw59QSN?=
 =?us-ascii?Q?ahoEHqlDSXNzro5IdUp470apwZoj/P4eAbykBpTyiZSfqPplAtVkGlfHMGzw?=
 =?us-ascii?Q?OzCHftqCt1S1UyCdSGwkV9pz0QhKzfPWq0OQZC3Q7S6NhvePt1b5r4vyrl01?=
 =?us-ascii?Q?FlDJBYLD+LxdENiM/1EiBAydqWSUbsb/Z1POuoHCGkd7F7UpxB196KlUphbD?=
 =?us-ascii?Q?CXDZ7p96J0Q23FnunLo02VGmhjkaM6OBh6jyxIVrjLrEIIV9y5Xs5qAoy11e?=
 =?us-ascii?Q?lCxMfJgv8uZ5g1vlcbl8EBczK8doxv+OZjk9EByYckhvyxLu2ppIoa7qE2wk?=
 =?us-ascii?Q?62fcpoUy1O4klMY1jy2FPOphl5XQDaRuy/NKcnrddRCcKb7JsOSuji9Yu+aR?=
 =?us-ascii?Q?Vpx6arpAsxavbFyJMIO9ZsLrL9YX4czQxmt1m8dBxQqFp2rdmNm7UEC0TawH?=
 =?us-ascii?Q?6FPiXC6bRumNVH8deV83rPnpQo3QzgXD1e3yVpGjazaUD/Njg+tWuLld4295?=
 =?us-ascii?Q?IJiYd1/w/83IwdZnRoQUwtlivgUrzDoa2V8UdTkLwzFiupj7yvTRc4nWWwLn?=
 =?us-ascii?Q?bPe2ja5rWFVlPUc8cziT/s2JF0WAy5Bi9UnkqRqzdcwgeC7Gmp5hSwxvwWQj?=
 =?us-ascii?Q?nDY5irn+5OlMfcfKh4Y5JB4ee899faK21z2diAbkVr7ef2rR4ak6ldnDPpFO?=
 =?us-ascii?Q?BJyXQ/FozlR4hm7eausCnFg2TNaVux6K1Uz141X0/vE3kYjfnrenH7avDXr3?=
 =?us-ascii?Q?GXogoQtkfBaM3cz8vC1Wc0mz44eE/93thA3mUKBFzXMWIEctIcRO?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f05c78-df9f-4e40-28e4-08dea44c7491
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 11:02:21.7366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8L6DCQqxJbJgWSD9x8LHBMO4rtPNrqC9J+pII/6nUQYh3F9pSmlKBGLbHqKtlTsDErVAtan+jh2ySt4OOa6w8b+XXkdFtyZ/hxJZMgp8H+TL7QXDZKXB1kfZGuMMVPj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9652
X-Rspamd-Queue-Id: E9C784716C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux-m68k.org,gmail.com,axentia.se,pengutronix.de,vger.kernel.org,bp.renesas.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-31674-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_PROHIBIT(0.00)[0.241.179.0:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.241.139.240:email]

Hi Ulf,
Thanks for your comment.

On Fri, Apr 10, 2026 at 03:42:40PM +0200, Ulf Hansson wrote:
> On Wed, 8 Apr 2026 at 15:38, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> >
> > Hi Geert,
> > Thanks for your comments.
> >
> > On Wed, Apr 08, 2026 at 03:07:44PM +0200, Geert Uytterhoeven wrote:
> > > Hi Tommaso,
> > >
> > > On Tue, 7 Apr 2026 at 17:35, Tommaso Merciai
> > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells as a
> > > > required property. Add it to the USB2 PHY reset nodes in the RZ/V2H and RZ/V2N
> > > > device trees to fix dtbs_check warnings.
> > > >
> > > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > > "arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
> > > >
> > > > Kind Regards,
> > > > Tommaso
> > > >
> > > > Tommaso Merciai (2):
> > > >   arm64: dts: renesas: r9a09g057: Add #mux-state-cells to
> > > >     usb2{0,1}phyrst
> > > >   arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst
> > >
> > > Does this series supersedes "[PATCH v5 16/22] arm64: dts: renesas:
> > > r9a09g056: Add USB2.0 VBUS_SEL mux-controller support"[1] and "[PATCH
> > > v5 17/22] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal
> > > regulator node"[2]?
> >
> > Yes, thanks.
> >
> > From v5 only [0] missing.
> > But I think Ulf is planning to pick [0].
> 
> I didn't get confirmation from Peter, so I decided to wait.
> 
> If there is an rc8 on Monday I can pick it up for v7.1, otherwise
> please re-submit when v7.1-rc1 is out.


Just FYI, I will rebase and re-submit [0].

> 
> >
> > I will rebase/send RZ/G3E USB2.0 dt patches later.
> >
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/cda933586ef7ca119dbbcef45a921c29dd517698.1775047175.git.tommaso.merciai.xr@bp.renesas.com/


Kind Regards,
Tommaso

> >
> >
> > Kind Regards,
> > Tommaso
> 
> Kind regards
> Uffe

