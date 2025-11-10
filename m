Return-Path: <linux-renesas-soc+bounces-24431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87548C49A37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 23:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C926347073
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 22:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319372E62C4;
	Mon, 10 Nov 2025 22:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="m6JF0VQ5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7CB21B196;
	Mon, 10 Nov 2025 22:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762814644; cv=fail; b=igh/h18RQYRpLCHCkwrA70Pg5rIWq1hPSWPpZSzCGR2D3hhHFHqEhO9Zfdpaker1OpyeONMaHg6v2kCAdhIb9e3XMp4s4/5rcIprhXcZ9THVGw1CeBGz7B3YgJpSOB91Ifys8BRQkz+A7+Nz7jjBLHrfq398/WvnwoqOKzGVB2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762814644; c=relaxed/simple;
	bh=sj77rn9t38BJ6me4ou49BKlV+6bEayQwWqpGnOlNAPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ve4VKBolqYAWXmKME/7KE2GV6+RI3chylqKjOlPBIHZeByZRHcW3xT7TBolxFNzPiuZc39HCAxGVmyVMALUI9e+CXJM84PJjNwRLIk3sv0zjMIxIJZGBTEp6Pkow8YC1B8nxFY2fgNcnNZXaKdTOpmnQLct5aOanpIrzaFPNZZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=m6JF0VQ5; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL+wl1zd1cfO16IVPS/Ga6a2wGPYkWZJw1pRENIIO7YkO8j2ZFsdHxV4qr81FFQ+bcOnAzqiu57cD5/8THbIaV8jPUhYbDyX/VU1Ij2FEUFeOgAOZjwuvxtqgNOpTmL9asumZo09BrTOpq7BVpw2+YhbUZzE/FTNN5E7VFedIw3fWlUc9UNf9GJKhyg7m9gyBvcjNID6Tz284pwMrRidZVOdIuvmbqK9jna9f9jnM5JdPzG25huL1dG3pluVFaqg5BVKtcr+7fk3z7g7GAf2UW8lCcHW9d+l4PTL886ygWr1wWMW+gVZA49xhOtTY/X69SBoLb0gYGUsmr20Z9ln2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8cuSaCSYEvWX1WbsM9sOn8yV7tKHxPqAn/rGCUQFzo=;
 b=oRc0kONelyb/hhN9lhbtCBDLhDZThqCuRU/m6yoVUJm4ib2HuokEilecWXmYpNH9ayLssDEP+v+cnsYk/pKmooIzayUzBEN/1iptRZqc15uk0edCgCRV30IVm+iYxlk3OU13N2NynTQzEcNSpK+2Y9a0n7G+4t4xu+abh8933X9yqCfYTl9RyxCBnAgrHZUxarzBhJ9DzKpUr/HzPEho3tR0OTdXsh8YhDJv64scMRQE/cB5I/U7YGwIpcmPzkzRc30h2s/xjqQX+7hIHGGI1UjdQN30tT5kmkludoXgOX6hX2fwX8LMijUlx964EOzfB4irz9d9eeVdnsfbjezaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8cuSaCSYEvWX1WbsM9sOn8yV7tKHxPqAn/rGCUQFzo=;
 b=m6JF0VQ5VayEd0Yp7eWVPqrfRS18HkxgDWqcMQDU5dgOG1hig4PurhVz2nRiyHZlHJ+Z2B1Anc2Tbd499Oi+QBHbXpNCitFbvcZ1+4cXOLqiM6Mdvm3jvATA5RVCjYNFJWTFFWGU+E/bzF0ENdhqKiVVrul9DqVKyDDzAjWdaDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY6PR01MB17512.jpnprd01.prod.outlook.com (2603:1096:405:35e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 22:43:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 22:43:57 +0000
Date: Mon, 10 Nov 2025 23:43:37 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Document VBUS_SEL mux
Message-ID: <aRJqfh7p9M3NHfCS@tom-desktop>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <20251110-resonate-strict-c3d6c42f3e0d@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-resonate-strict-c3d6c42f3e0d@spud>
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY6PR01MB17512:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ef3437-ccb2-43d1-050d-08de20aaa1fe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3kSUrYUOqoJtOST3ceTzbSLPgJ3Ho5viAcsu0Vs/PeDYBHa/Pug+/3V4d1vk?=
 =?us-ascii?Q?ss7PlKqsf5vRMBA7Fqjam/zdyhrTeqGPGl9HGqQRz/3As8WDeD/K+s6YFZMC?=
 =?us-ascii?Q?i6lNZJdg1JmV2tb6eWPy8C2ghjyF/WhMBq/HHUWLL4xHJ+Kbkc2M2O27esos?=
 =?us-ascii?Q?eG5rPN7ltVchpbgg11JNCEZccY17GpC9cMAYZ7Q4D4kV8ghTVKXM1sEn5bWz?=
 =?us-ascii?Q?mfEK3I0ori4koJNLd6hGv06xGuGkg4i/gnUrm+YttB5IOQGs3VvP6eHTguY7?=
 =?us-ascii?Q?U1szLPhS9+zeMP8x2SDDC9bPXTgc9BBbcWh51v62ljoBWpVM7uF9hAx6FGA5?=
 =?us-ascii?Q?m1yDdtta0NnMi4iInd5QkQQBgh2xbRKusej043jCDOR6XofouzUvw7z4WOjT?=
 =?us-ascii?Q?wFYCFtMXNiDFqcbMoUtgjfrJqbrZvS1yr8dJauQVVhGzI8qWRTunHIcyyjjx?=
 =?us-ascii?Q?3AtQXk+v73/x4Ev2jKXfTTOJOIEz8E4e+mO0id9O+cIauIN6cSwP/v1C8MWS?=
 =?us-ascii?Q?5rwLY3bJoN5+4E+OfKE++TOnmDDABV9lTSvPxrAq5eJ+IUuoSZO4YknmBqyF?=
 =?us-ascii?Q?Q7/p1wmY/AgCo5bv9HBTeL9Akc2ScZDSSApc5JO8BYXNL2VcYowEMNs4e2HV?=
 =?us-ascii?Q?wVGaJEq8fFMWKZ61fzbkTHCUyWEbkLKywjYiRv6UplpxRdKLWY+krddtVZJU?=
 =?us-ascii?Q?O9EY3aE0kQnZhtbIkJ3p/jYhbf1ITSDCTS84vkWKfZTMrlDtpGVOELwvJvi9?=
 =?us-ascii?Q?cwUaHbJ9Tt9Lfjt1oqWp6/18RHV7eZL5T+teWDe5eIGgGwLdMVGzyBAS3UEh?=
 =?us-ascii?Q?ufwD+pglYiPUww4p2lKtyiDsanXrPih1KX2EDMpU0MtocTM6f/xasU/CJTym?=
 =?us-ascii?Q?IIquUYWefa6rh47FWMDmSpHwP5rGowO31rc3t8AQ1rta2cusSx7BRNmYhFN8?=
 =?us-ascii?Q?mh5B3J9cj2f9kYb/N41mHCs/ybwILNY40R+YcDXipASrPkNNxNuhtLHCqDdJ?=
 =?us-ascii?Q?ckN5q9Ro1M9bTua4hRKh380cOWft0Q1e6zqho9oLeL1ocI/lPsK9KJpJQNq/?=
 =?us-ascii?Q?eqE5Phv0qpSEW+rtPjdV5EIGbuHD+J09lywbrG+aZhkqblwN3mfBghmKKGP8?=
 =?us-ascii?Q?m8/8ZAQsnDi7PivZiVxlkAINTcfpiYoFNLEmmMEw45SpVnJodMRh86X5brsZ?=
 =?us-ascii?Q?omMrrkIfESAYVAuEbn6wKZBTGx3ZC2f9mUIyDM5I1DFv1w0w2xS8KM75kqHW?=
 =?us-ascii?Q?kaFSjW8GtcAl9FvrVfp1ENnei+NP8zEWIh9739mINRq7+CpnE++y2/OkfFtn?=
 =?us-ascii?Q?OtZoQW89MtkNfqitrAViHj/3ZBZ1R7PIk7gZqeN3Ul6iWrud5iwnobYWMc6C?=
 =?us-ascii?Q?kmdrhwKosmFhLR1rE6vInF772A8Bvc3pqV0y+V8ye6nHMnTxPmqTPyUzHZCd?=
 =?us-ascii?Q?H+1TFTZ3IkFuYhFs+EmlXrrJS9fr5j+6WkQFPfOXkyIEASErMkv1fZd9v27g?=
 =?us-ascii?Q?lLhYlCFB71k+PIwyrZbmwqITDZxr8muj/iJP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3YpOma1U2M3WDmsikBavoBmgp5Oqzl0zovjVCvruI7c9ne/zKyY9MS1cgagX?=
 =?us-ascii?Q?qIuLzceNB1a+YQ9izmmrAov+LfpDjHT2ucZlmqk3Abe2Xy0ZdB0L1WUe3+IZ?=
 =?us-ascii?Q?rhHSP3Sey7FXo0dhfQ3Ve1N24Hic8/RNTdfiRxVmxYKhZq182jYv+J5MAZK0?=
 =?us-ascii?Q?VHnGFsGNW6FCJ1OHY65nBeNLm+iBsJPUNLPzEUI3VtFYXjfXLpDJsnWRdcEB?=
 =?us-ascii?Q?aqmm9MKf+FzTETaq5QwimxNdUJHNqmcYnHXKr6WewexIOKb75vTN1PpfhOed?=
 =?us-ascii?Q?yDGy3gMn9WPfjVlCQhJ2r3sSFXF2YCnSZIDEm948FANZMM4cNGmuTje145pT?=
 =?us-ascii?Q?LyTRdqiseruoCu3vb4+LqOzKyr7ejnCs9vzq81v4eA0RyGcCbXGENloyErRd?=
 =?us-ascii?Q?vZjUWa8IQpuH4d86gaILqZNuOiIE301VlGsf9E9/cru9WSvv1TVOL7mWq9R0?=
 =?us-ascii?Q?vbMismEtKhM5fZUDBOjLPmcydYlcBwk7D/ZBGCRGdAJqUoOxRD8+mikdaHqR?=
 =?us-ascii?Q?zPLGIF2s4Q3zyAwxSlHvm9oXve02JLgUcJMHzNiGFBK8DgvErkfTwkRV9nQW?=
 =?us-ascii?Q?Zhcqk1TLdijJYYnoB5cNd9OfO6uCnGt/i+7H9ctfrq1SnMfQbEHSJ/8D3r/l?=
 =?us-ascii?Q?/+M0Q17YY8riIWn1eEUXbSrkYRILDYTIn0x7o3LQ4hVrsjRCK5sN2J8YaV4Q?=
 =?us-ascii?Q?PxCSuT/e23mmSyTisdA4ScD4h6Dyo49twfeea1XcU7owcda9IDSoN26YQ+qQ?=
 =?us-ascii?Q?NFoqicTQoSyKaAchNs93rAkGKw0eQQpKbAKf4phAVY1+sQ5ibHfvjKFLsbxp?=
 =?us-ascii?Q?gTiuIfd7V9ai6hjo9+NZ4+08C+bpcCmmHxH/j1Sk+VW5IlXdTVgcBayXOunL?=
 =?us-ascii?Q?PxbLW2ZdmQAG6ZKPS81PLoj47SNdYZsAcHskI1dR8TwqU2CL0a0bhfVNpSBa?=
 =?us-ascii?Q?U7mEhQi0wIu/ruSpOEr7BocApY8vb+AX5Q1NcdGrRRE8Qp+DQMQG8m78TQLV?=
 =?us-ascii?Q?qcxGU7bqGM8UW2HNf4oHWKPcRmiAdFE85OFYiIxeIzb76g0E4HXNYWhJihzb?=
 =?us-ascii?Q?stdwgLyI+RliPczrIHj2jipoMRXapmBmpofk2cksfPy5GscEGyaqP6lpMwrY?=
 =?us-ascii?Q?pYUwpiUdWIzAf8zecyrZ8TZefhhzEhoYJD8ZtiVzyD07NWubHMkE/QF6VDWI?=
 =?us-ascii?Q?mD11JAoz9zwLCfWzVRduSN5DWaeszPb8qb5oK5BE33HfKDBqdsE7w8OnKPRM?=
 =?us-ascii?Q?eAWsY3FSXOTj40++ZHHhWAvFLWo4Hu/cFcTyPHz3vohuWNmgJDXG4q4s77/V?=
 =?us-ascii?Q?znUei8vY44yjc5CjYJCv2sm55mMe9cc+T+aKo+5XSHltupMdKQLSEU0HQPMN?=
 =?us-ascii?Q?f++UpSO4ujNwysPQyr5qHMcIrbFn/gOyvSafOopNG5Y0eIR+2HbPm4foHQCe?=
 =?us-ascii?Q?jsm/DrR0UcBfn20ZeolhTgcbEYG16xAPujtdyDF9UfF9q4s+I4M+KZMCjg77?=
 =?us-ascii?Q?FXRiBOdysiePvMFJ57PzfmeGck94W/JQkBqtrxTzQ3Jj3wqPXPF/Uik/kN58?=
 =?us-ascii?Q?th38I/OK1wP0/XmW1l5E4BM1gSnKWmtR6GGtg/RrTU+YVkyJ1yQPI4p31REq?=
 =?us-ascii?Q?gv5GYgyhSpsUF1sJZIfgaO0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ef3437-ccb2-43d1-050d-08de20aaa1fe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 22:43:57.0689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJY84llQD78MNQu/b3GIQegISCDxOFMYGWHIBOTHVvceA3h6kZQOlIkFyZCCxhD3Rx9fnJzVqM2ptaN4+doBAbXOxal6JocX4tFtJVz8ffKgYJweIgncFt8fWyVmm2L6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17512

Hi Conor,
Thanks for your comment!

On Mon, Nov 10, 2025 at 06:56:31PM +0000, Conor Dooley wrote:
> On Mon, Nov 10, 2025 at 01:08:04PM +0100, Tommaso Merciai wrote:
> > Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
> > USB2PHY reset binding to support describing the USB VBUS_SEL
> > multiplexer as a mux-controller.
> > 
> > This is required to properly configure the USB PHY VBUS source on
> > RZ/V2H(P), RZ/G3E SoCs.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v2->v3:
> >  - Manipulate mux-controller as an internal node.
> 
> Why is it a child node, rather than just putting the cell in the parent
> reset node?

Getting "make dt_binding_check errors" [1] in v2
Adding #mux-state-cells = <1> into:

	usb20phyrst: reset-controller@15830000
	usb21phyrst: reset-controller@15840000

Nodes.

Please correct me if I'm wrong.

Thanks & Regards,
Tommaso


[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/961741af7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renesas.com/

> 
> >  - Improved commit body.
> > 
> > v1->v2:
> >  - New patch
> > 
> >  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml   | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> > index c1b800a10b53..03da74ff2d08 100644
> > --- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
> > @@ -37,6 +37,12 @@ properties:
> >    '#reset-cells':
> >      const: 0
> >  
> > +  mux-controller:
> > +    $ref: /schemas/mux/mux-controller.yaml#
> > +    description: Mux controller for USB VBUS source selection.
> > +    type: object
> > +    unevaluatedProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -44,6 +50,7 @@ required:
> >    - resets
> >    - power-domains
> >    - '#reset-cells'
> > +  - mux-controller
> >  
> >  additionalProperties: false
> >  
> > @@ -58,4 +65,8 @@ examples:
> >          resets = <&cpg 0xaf>;
> >          power-domains = <&cpg>;
> >          #reset-cells = <0>;
> > +
> > +        mux-controller {
> > +          #mux-state-cells = <1>;
> > +        };
> >      };
> > -- 
> > 2.43.0
> > 



