Return-Path: <linux-renesas-soc+bounces-23897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700BC1E798
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 06:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9624D34B95B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 05:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D462F6170;
	Thu, 30 Oct 2025 05:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O49TDYLB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A52EC56D;
	Thu, 30 Oct 2025 05:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761803866; cv=fail; b=nmVBI6zmNVDx/k+9OjWyXghM+S8L24LRPcY4lYa8pSIoGosVF39Wy+1ENUXH5/OHSABHAz7mu9lr/GoTmzkXr+KMZ5UmMyCNrJz9NRmaPhc2J9br8MKlrs8/ety5OuJkDhcx1KyeUHUmIX6Xmr3udmKCbuRbsj+sf9CzpPuG9uI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761803866; c=relaxed/simple;
	bh=pZEhydyGBEnMky4I7eQR9vxHQuCV6jFCywon/XbItvA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZUs3/BITSyAkRy57Gl8jClHRvetnI+q+CDEsPozxXSsoiwK86jeOueWSPLktSYWjnouN9XaeHQx5tGcxMXoDfEv9ApkQijSkf7JcXdW63ENMmTHFI75vI0odJbAscAAC7XP3V3Vpq5YSVv7VEDDB9LpWVIAtowVqfeuza0Jt1ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O49TDYLB; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phqIcKvwK2XyFQDkkx+LGfU1QVEoBka/gKiCuTf+xfMgk1R/wUjuq9EoRuEuzp21Vo/GnA/TlT6ZUgTuh4N8Kx+7rtCmG8XJ9ivQMpmzpbBAqHDhDe6ylmpNY6t8xLgDVR3Up/qBWDDaD08/tMvw9stQtnSip+szsmnORffgtx3A18iIAbzzSaCnrotauvjsBWQvLNuKdwcnriSYRJyUBqROZoT1yAwflcfxCNyDhTXU+xyB2BSu6YScIeo3+IaPIiFHxCeCZsrdRONZTFcfFOc+n+b1yq8AGCkVbxiIiVpNBr+YYPHiQ7SPu1yjFvnutuEWr6Lk4xxM15eU9tLC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyaZOCTVal/dNXzI7ubxETJzuYU7QIbUW9ufY+5/xJ0=;
 b=Pr1n2QbsWiF5uBCWCP77psy3c0OMZooPG5VbmbpplPsJgtsYBzYnFjGwI6tBCkrskHXaaCx4zoeGCLgF13GsJMYmeHC6KM42LwHAE7no1s+LGOlESkZg+mwJdo7p+fBNE8KZIQc4bQqdb4rwMeFlXM3G1OeSzIhZtoGusmrIgW2wzVwk7VAbb+hmRqNzBCDhuBBOXuRika31GmAye13F4ooQB1FloKBC1IO3mckTb813kc7WQUoSdJd9RKIW36gFtjfe+E62zDHSpwKYt8L+zvsGHbUjTuXBnTqo4zICcAsW4oklRxRInO9ZpjOyBzV4jB0T3U2HmTHEpM/+70f9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyaZOCTVal/dNXzI7ubxETJzuYU7QIbUW9ufY+5/xJ0=;
 b=O49TDYLBakj80GVdRzkDZtY4jq7G0VUOLJR3x2OcsvGieRVN14CqAgQWR8srXxwCI5d5IlIE6cg7aggt5orfWoDbGmBc1C3fO3+8lvCTfWpQnOBpWkzxLBq3lOD8oi2yB2KAeLjtZYfaM4+S9cgF8znkAht8H1JtvBLtt8hZRBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12695.jpnprd01.prod.outlook.com
 (2603:1096:405:158::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 05:57:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 05:57:40 +0000
Message-ID: <877bwd2ap8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <87a5192bbm.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
	<20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
	<878qguv8fh.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdW9sEcKprPjiA50QOWm7b_fwoEkuJcLLKg-srQxwJX43A@mail.gmail.com>
	<87v7jx2t7s.wl-kuninori.morimoto.gx@renesas.com>
	<5dd02143-861e-4b2c-af1b-79e6c57de076@kernel.org>
	<87a5192bbm.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 Oct 2025 05:57:39 +0000
X-ClientProxiedBy: TYCP286CA0318.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12695:EE_
X-MS-Office365-Filtering-Correlation-Id: fca11442-e72f-46d5-d973-08de17793c1d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NyPBfVxMxBKrSkwHJ0hUDwQNAt9+ChkeUYETXtvc2eta8QUQn7PCzOKNmewb?=
 =?us-ascii?Q?76oZ/C4R2LpojsQaHcW8syXQSH2gfW6uT1Y1tth8j7lOfjwzHAd38paBaYGL?=
 =?us-ascii?Q?3CsdAWNOuuqEjqJthGQV5hVxiqpKCke9XRdiA2sQrjE+EKDQLi6AcRccZ+4w?=
 =?us-ascii?Q?+Dbg1NFNDWgFlfZ0PQyVY0OYtCz7i/C1CaIIKUhwT8OWkKbjloFoxgPl+4/x?=
 =?us-ascii?Q?lBwCL58qjli0Q5rMXP5fH4nbb1jx9OIWq1WP6/N7wX4qFLemEHWRte9rBazo?=
 =?us-ascii?Q?30JyUkIbccvO1TWSgUDVm6jpf1dPFfwPsYEBiM921t7ZaB0NnFYgKEemeGxN?=
 =?us-ascii?Q?th4/aahyLt+1x/LC3SwPSD50SyK50+NC71nDS/KSdwehB8BMeZi7/t2hvgKM?=
 =?us-ascii?Q?iin2BMEnxBNYNHeKRyTX0F68Iehy3WKQH6BOhnioUkkaexUZeiObHWu+B2jF?=
 =?us-ascii?Q?ThIS7RqIt3Oycws2HpZbKGeb5nwP91Rs08MU+jLwKSNGyv+QMFOJwGMtjFat?=
 =?us-ascii?Q?HtSCD0z4QKWe2Fpw/vqkvBODg9xCWKI4PYsd9JPMf/y7ij3zBBeL0+07J2cA?=
 =?us-ascii?Q?UHpPHlIMV8c7i29BVcIXFsIu0keuVoMyY/H4csOziFE4xNVht0qLZhue5zrz?=
 =?us-ascii?Q?Du6bnt2sDGYRRTNvA9X03KbyNOXcqLChZ61cFKKU7iJVWM0t0IZnzNTlQiyL?=
 =?us-ascii?Q?OJzC9CoURJmeX3fSpo3xGiXZQgK846n9qVrTTKfrebvklrlUyVkd+nFyymvz?=
 =?us-ascii?Q?2eWGH+LJV0ojDM5/VQnca+ht2tiA5YgpYlBM2KlKM1h24DYTvns282iZOnWx?=
 =?us-ascii?Q?5+Nqio3+e6SLFpQsw2ouWyfup4eIxq3tABN8+zl+7nMbBA819A4ouLa3eLo4?=
 =?us-ascii?Q?bfCWnvhPzYHa2rdu9HRduTKjqHV8NhGHUlqQUyh4Z6cHfx9ATHDsrV+9Zpf2?=
 =?us-ascii?Q?YZ6y+LTMU+xlVuZDRyN2DqmU83dZwQ8utvuVO46Doyr4z+8inLTbEcMuo1lp?=
 =?us-ascii?Q?KDmeyIThpkTfbiEw/d5TBw5b78jMuz2BN1v7XQHobtPP+gEg191WSaFfFT6t?=
 =?us-ascii?Q?fjJa6hUVPKRGyFD2FkpKocuUBqTCR1Sz7e/9WAjfZmtAuKBXV1IpY13TI5Iw?=
 =?us-ascii?Q?wAxnkLlSc/e89ukJPxe+mShKQXbnd4nuKNztCaZU6dlaRflKgZdnZDH89tYY?=
 =?us-ascii?Q?8dUw3kBTQAZ1BC3xN7ljWOwrSrVDICQEukZlm+afSFq4t3JZMcWDJJLHifqO?=
 =?us-ascii?Q?KxJa66O0l57QAOXmYpng3na/Kl9BeyyML7bTdtfrLr4pTlMbxME+dGtfIb4c?=
 =?us-ascii?Q?cq7rx5MJN1OszfKLr6xIDKOfYQvqtk5UbZ4YSxqa8geZKxd3TgCIzUqZtyOZ?=
 =?us-ascii?Q?JzS/xzD3vUTdUT0tvI/NA8T5D9zSzGQyQQ7ZZA/L6OeLUo8R+/R5PNtClrLC?=
 =?us-ascii?Q?/rHO9WLvjrgE2aCldD9D9qutFwjzNpM7vk/kGV41PeF19NUnfszloHNXjBlA?=
 =?us-ascii?Q?NE6udU9Qg5bYnX02Jflgb9qNcNo6rQ+z6e/H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zxE6cZB1ejkNnH/dVMNPKqxm1786buKkFYjb8xFWBF+gI6nNV862tU9vnEAE?=
 =?us-ascii?Q?E0J6xukgFCLFmvAyg84SJ0dbTKkm91vQFfkycd/KbdGELRXBfWByxMK584FL?=
 =?us-ascii?Q?af2kpaTdkpz/d9jlfZ8cSTbKJafFiLDx+5vpJzmF/cJ1OOevLnjhyLGB0F5A?=
 =?us-ascii?Q?aX6YTRkFzPPqjSittSBBWzAcovNM8hI/XjdXWAPTc19dnIT84j/4rA7MGDZi?=
 =?us-ascii?Q?UMFwom+e8a+3RyTuoREUgpWJF+p0tN6E5Rv/lDs73FUHWzSv0vLZoTVF6ld3?=
 =?us-ascii?Q?J7F3EsywwnfbjXaptDb0SQqOqRlNG7Qb/0CcBpYXtBe9H5MX1V2S6tOxCp3c?=
 =?us-ascii?Q?UQBx/xQ9H48C/21txagm1Q1UQ9illVSGdIgMkHL4YMTI210jNujcg1X5QGVx?=
 =?us-ascii?Q?P72crGw1aSsIzdNJVJ54RCxAMSIzIP9aWO4YvwbA6umk0p0NFWl23Rk6IPLd?=
 =?us-ascii?Q?y/oUuTFu/97iZ+6vB5WmcAbQSOklBsimFqLiWvkZZknhMrsRCW3sF2ZuEW3H?=
 =?us-ascii?Q?3s+X3fAckfDK2H4IlW484vXY6LXNHCp2w5ALMZnKuTbsuyYGgJ5WcAPoqgvb?=
 =?us-ascii?Q?uHTMAUHALDEWNkPF15Peykv3eCPnippISUbdgyBsRiuofNRKXJCTvIflZuax?=
 =?us-ascii?Q?DsoQ/R09TURlDDXKlmH270m2gmI8BwregJm2pqNhGd6/AtAv8CR+tEge2YlC?=
 =?us-ascii?Q?lEBZlvTjb1Fypx71WnAYT53g1X/YQLTkVCd+AZG0JClMsPNfLlJ6hylqwleh?=
 =?us-ascii?Q?MKf4rY7tiqxpxnOsHNMlE9/waKNL+KVZSxMsollgcsBd0qBbr4pzFATvx0rG?=
 =?us-ascii?Q?SZWC6puzDALEXeemopdXitOwBTYKsKBkOkY2A2QCabumq02sOxuZxEwnaxOI?=
 =?us-ascii?Q?kGMStAoN/FOHnCEu7s6sWGP0wadyq7nXykdquJE1oDUBuDD5Fan0edkZsnFr?=
 =?us-ascii?Q?zP/mPViyewesauJlmZzW28RyJbgUjJTR0835E7iCR4oPhDjQf8yQmvQFpVcn?=
 =?us-ascii?Q?/2+id9IOKK7cnvbZ+ec1tcH2PaNxS9XJBPFMy7K7ghc6cxa+dli5d6fdPxGk?=
 =?us-ascii?Q?8pqDOLK1C1wMd2dIZIHMNcyUy2a/ffFQXLoI51botXppSdm3Adf30GqH0r/V?=
 =?us-ascii?Q?i2s/r3xEPiQ16IswXUo7bzCYg18YGq4u8piccZB1qNzbokKGTGEFEz5/trD0?=
 =?us-ascii?Q?hCEcmrTLgoxK3c8cYfGclxtxQ0tmCQJtpq+3KpzWsboPN5+K0gwfqP80/xj2?=
 =?us-ascii?Q?xRs/V/6f6t098TrPFBA4Krp+9wYlITjtWimDB7NYJoIjseICs1a79YZaMOuJ?=
 =?us-ascii?Q?AIoBSJxQS4KprjpmxxLPSWGqCj28AaUHNqZNqLtSea4DueG6Pzs2HuSn7GgZ?=
 =?us-ascii?Q?46eVYlLmd3xIlFTWDSlqLgMATNOZo6wBfkFxBUeIFinPHcGPLXFyIh4s+MSr?=
 =?us-ascii?Q?K3or6SFu0EiDJBvNVcTa8QgoFrIRUlkHemkJKWtKdkNJAsrcU0oMsIgZkVZq?=
 =?us-ascii?Q?CbqBTE8KYcRIOpuua0qTjjgsoqqZiamf6/rbbNNo/AsdaQjcGgdbbYTrwk07?=
 =?us-ascii?Q?NyRVP/623xj2NM3AN2CtbWzqQJeEY99OOqsTfPoZ/GJAa2kmpCU6z4n2meCp?=
 =?us-ascii?Q?Y4ICNSvCoROzql4X80Ak69I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca11442-e72f-46d5-d973-08de17793c1d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 05:57:40.1362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOELjbMfhMC+AJO+p7DTWhE5bnIljKG8Ly5prLxLzKbUNNMHhvoL9F3r6Ph9qVFork/TP94t5GlTf/1tNz8kjj0pWVZVO+iNpPfz3DWYjKQdjhWr2lVim8bctwUG/93h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12695


Hi Krzysztof

> > >> Please no more generic compatible values like "renesas,mfis-mailbox".
> > >> Especially in this case, as we know the MFIS mailbox on e.g. R-Car
> > >> Gen3 is not compatible with the one on R-Car Gen5.
> (snip)
> > > 	compatible = "rcar,r8a78000-mfis-mailbox",
> > > 		     "rcar,gen5-mfis-mailbox",
> > > 		     "rcar,mfis-mailbox";
> (snip)
> > You changed nothing. Please read again Geert answer.
> 
> I guess you mentioned about generic compatible "rcar,mfis-mailbox".
> I didn't mention in this mail thread (?), but 1) we can keep compatible
> with Gen3/Gen4 and Gen5, 2) we don't support Gen3/Gen4.

I'm OK to remove generic "rcar,mfis-mailbox".

I think this driver can support (maybe) Gen6 or later.
So, "rcar,gen6-mfis-mailbox" might be added in the future.

In such case, what the file name should be ?
You have mentioned that file name should be same as compatible,
but no generic compatible.
I don't want to have multi-files, but is it recommended ?

	rcar,gen5-mfis-mailbox.yaml	// for Gen5
	rcar,gen6-mfis-mailbox.yaml	// for Gen6
	...

or can we have

	rcar,mfis-mailbox.yaml		// for Gen5/Gen6/...


Thank you for your help !!

Best regards
---
Kuninori Morimoto

