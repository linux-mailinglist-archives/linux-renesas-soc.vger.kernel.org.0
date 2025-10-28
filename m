Return-Path: <linux-renesas-soc+bounces-23713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96863C12A0F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 03:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5068A3BE454
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 02:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214651A5B8A;
	Tue, 28 Oct 2025 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NR3/tj8L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0357AF50F;
	Tue, 28 Oct 2025 02:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761617143; cv=fail; b=H7H03cdPaegL0epCI1G8WLbqhhZTmhga110AXwnEXPrXUK4LNuSyeYjm1E/bBPpCujZCEHQIM4uGKRvUap4gigiy6nbM101cN1n7MX7cqsMl1IL4Ca2Js+fUiG7WJgUXqtQDNbaL+r9eAg+SM0J/0oxZZBGjzWAqA/1ntdcTx+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761617143; c=relaxed/simple;
	bh=YCJ6g975OocPIJXRheTQpWFlBs/caIpQ6DyJbkC9+QI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Yy4UwJpDHttZv8qHTnF7pAfzSyKl35umuYDuB6c8HXgLVc8m1oLH3FShxq36B9mWy72/05zPI7iQWRbxYsTk90aMGxSMM9ZCu078b0dOZVmX+sPjswQYgC9U63RpETtzByMK8yG6I3Y77faOSZZRcxYoxMgOZfXD7cy+rNAvIGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NR3/tj8L; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKfcL5ESZKSF/snW23qkRmm6BDwGcM+VFyg9bvyMPEWSTl8nfA9OIPO79DM6UGDTxiEZCxzWzhwmZ6ILZeT2konM/NP3uLqNcaPg+994Qg6ew63ofBEOFQrXmqIwX2ChWs1RchAOk4ee+G6P6oX98kDvVOLA6WcTEEyr0PrvvqnLPYHcoqzk5De47h/4cjEwL1dKeK46O8e5HVVDX5mOtHlOXqQlXCJYJH8u4PVyXS76h/kYFY/AT7IqDNCd5Kh4BqrlD6UCF/fjrPUEJ1NVqEYMVtrv968Y1bRLOGc/k4i33e7Bqq9//z3vUAlnPfYk4GkkwSjZjWMFj721ZB/WsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCJ6g975OocPIJXRheTQpWFlBs/caIpQ6DyJbkC9+QI=;
 b=PoaeDdcfynDDmLaghW9OTegBYDzsghjeZaoKuTFpFOUhHDLiWTHWXwYlcRW/NamMZRZygMdJUM8D6AdQNGmQj5AkVzQoKtChJJuo9qa88eFN6mk2oIWH/WtcufGLDvSCBt0RXKWTI6JCUfRidqemux7Vm9csdhvOiczQe+WqJNkwbzQeog21IGQAdvMrsgKT3coRqK950+L3cgbbF1ZClTSMdo8kYoRuCA39HlW3DDpXKBR1lwdewgS7G69Vb4xQ64m/GNzOxX11erMX1AkZfMRN2P/G/ZhCcqaQJHJv0cPWNLU3Bo9GyerVnH2SvVEvSoOudhR12SHsRBVvK2aqog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCJ6g975OocPIJXRheTQpWFlBs/caIpQ6DyJbkC9+QI=;
 b=NR3/tj8LYgAPGAjuJdz2hzEXoRhivjtYejYP7gEKaITS/y2MgT6I/AU7p439wQVnU8eTb1Zu4+MBk+rv6Dv9s/9MTgVm4oB35EdaxXrlaPAmLXA0iUYeU7xN5sxSIPHr19msTy07H393VGCSjqc1NJ8RuTrEJq/qjJrMUrywkjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7349.jpnprd01.prod.outlook.com
 (2603:1096:604:141::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 02:05:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 02:05:37 +0000
Message-ID: <87pla7srv3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <CAMuHMdWu1GemaT8vQv=vnsMvyK5t7+rAspFEKi53oWmyj1kZAA@mail.gmail.com>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
	<87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com>
	<176129066419.661728.14767654389778601283.robh@kernel.org>
	<87ikg1gcwx.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWu1GemaT8vQv=vnsMvyK5t7+rAspFEKi53oWmyj1kZAA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 Oct 2025 02:05:36 +0000
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: a95a9312-7e72-4d76-e671-08de15c67c93
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VA6D0UbaSSUUy4qjyEOlB0RjnIronKYmfGrTntgFX8ZtJkKPnUdz0B4nUz1v?=
 =?us-ascii?Q?jt/l672tuwXAwyYRbSKGMScS6xsfIZRC/XeUuWaaYXkftQ/ny/kL7gThEPau?=
 =?us-ascii?Q?Mfe+TnJv6C1mD23CZXCzpphPL96y+3wKXCH9mLe9DJR2KOWVTFGfapYff+Gj?=
 =?us-ascii?Q?JrcPvace2JziIJrNVtl7hpgjos9f3BpQN/7rZ0RQezc+Xk2dOhaPV4xJe4iz?=
 =?us-ascii?Q?LGFr/L2Y/ouhqGsj365a8Orw189FhEGLSfkO76dUpWbi5vsS0l3aqtU5Mcvt?=
 =?us-ascii?Q?FRGUTQlvy+6EQ+1FMm41r4/p8eh+tFn+o8Jg44BUpbHOsMwDQaQi4o7Ph0/o?=
 =?us-ascii?Q?E70QktxSbhwmfkx8HDiNiYs18WPGxAzXVy1hnEdjF3zHBHM+PBL0CCnKr6Bm?=
 =?us-ascii?Q?oFaFZdOopjZhb5vEg7XdM3HuISH3bypht/CpYWu+9bC73eQIviD5dRP+lRdR?=
 =?us-ascii?Q?98HP8r2FRehXHJUbyfl2E86mqRQZSLTtVdZ0DHgqjfLqCfZtukmLGXgcub6H?=
 =?us-ascii?Q?OGCPHk/GSeRvQT++QIMty3rdVcuUn/8ol0aP6M/7lrQWZ4MCNttLsYecSTPo?=
 =?us-ascii?Q?TsJU4k6t1GSxn++pkcx5uurrXEGXIhDraHtodgl5416H0j4BM+HBRKyaHyz9?=
 =?us-ascii?Q?gtBy4xDQ3/Q0fses3ZYaVmMkvARX6dMO/N7/EMbuDFvZbbeO/ATnJk7T8gt+?=
 =?us-ascii?Q?QMRhbV4Q1yUZuA8yT/e7gEPBKQSOxfdyAv5Sj1s4fwJHjUzjPztYQvELGHSp?=
 =?us-ascii?Q?ltlg5Fb74n5ci92HL2vlpNvRYn9dLd9/1wlCB4d5hTgiysnj3HNXmhWzvkw0?=
 =?us-ascii?Q?nB3rf4BA/XPscLa+6z9x/sj3lMbqfA5sB23ORP8N7ZzHH0zbqWxvcbX2zfo8?=
 =?us-ascii?Q?ndf4afk/0kBD7PRTP/aCrzJRYZW0NQuSKVeVyB0SwrVDCGyOA1nJei/iTm+3?=
 =?us-ascii?Q?znZS0tfLGdbjd8zXDYLgthjKQuDHostmKlanhSFoy0rAa9rvaNIQ98BEHMx7?=
 =?us-ascii?Q?Ep88V+1nzctQxlL01v2a3kDuLJyQM2JXrf5u/Q4T81ahKAhK++6w0ppg1glX?=
 =?us-ascii?Q?0V8Km5pdmvleuBF8U6z1CGXFFfNtZ8kcgVN2n7/ZSbXlGVTWt4KOS3ewZcen?=
 =?us-ascii?Q?rV5QrGWEtfwJDiEcbN2+763WUiVO9MSAtV26m/qSPxOIcYKADLkGXkukEvcg?=
 =?us-ascii?Q?gJ0GIa6u9jVrXMS5b+2oGLrsdsR6xtGizx7Niy+Src4oqzTHvm4xdy/A5Ork?=
 =?us-ascii?Q?AAXI2bdGgn7BjuoQi3FHiXp67Jw55JMZlIc399O1Vw6k4Oc+d1ioFPUkmmNi?=
 =?us-ascii?Q?Qjdg9DBvTjpe9Zj7myr7+RoFK80XK8VVW3vmyUnxRT2qBuqrV5++GTH9YCqh?=
 =?us-ascii?Q?gpOfpmcA9BV5+zFQFqCfFfMC9AaOJh+vXlyhVA/Gi3qecmbEQbRfm+L6j0+M?=
 =?us-ascii?Q?63i0jEUuK9ScaD8dTs5Bwv2sq8E7uENRLp41Xj6CcmSiJSpuDtpWM5z8hJGO?=
 =?us-ascii?Q?UH9yakYZ1PYgk7q2qFGzmkdyQbFpoMnb+qPG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sWG3CXW9prIF7ZLSZ/r5aarLfbO9FW+wkicL4NUxZLJ/gTev/dXt6lchYY14?=
 =?us-ascii?Q?XvhJWm77XnTI6OeyZUM32kj+TaPE5KJb0LRpTMk73r62sSV0CujO+g8k4akZ?=
 =?us-ascii?Q?rgP12u2Sn9s8+oHQgUqJvCfYF2nmYq/oX07PlpkgZIgk1SYCXiojvHRlOT+y?=
 =?us-ascii?Q?RTAY50xCWwSrhTgJ7pqTVNzkZWD/8P78Ed2fyi8dDF4SueFFggzXC2s5WjKn?=
 =?us-ascii?Q?x/CT/Dcp18Kd49Vd1SPUfEsGlE24ZgNwzeUnKS9SeMCCMsHtwBSMBSUr7w0J?=
 =?us-ascii?Q?t21AynFVfBjq0UzNsS92IFDT8mtqYaO5GI1Fr0OmRVGNPac0D4el3B6G+oU0?=
 =?us-ascii?Q?XFbDjnxuDPA/tBTTpxpmtEG4OCThpn0payPfc/GHHentj2pk5WdHfXAZJPwT?=
 =?us-ascii?Q?R8N9uJILKa0QNVRBSXE0NQVA9rOYcoApI86JZwDECaKFeOxIj1LA1NNWUdhs?=
 =?us-ascii?Q?K36/3liM/kw2yVE5YxnWXV4kdCQI+hOGXd5zL3EwYBpfnjisaCsIfUMLK6vb?=
 =?us-ascii?Q?FSi81qTqO+kz498BLbqfdGu3aqZkTmCRG6s6e2exOgUo5ybEVd49eqFDxN4E?=
 =?us-ascii?Q?tGVFjBNsZCiAmnA0occ1zeC0nWKJKpzZhNWTsEL24Pob3fyM0+ku5QubdrGd?=
 =?us-ascii?Q?h05tSr7pRzaKt6WMKKpD25X1NyfYSapasM5BYYcNrFeOmW6Yp9WMchxwVhSD?=
 =?us-ascii?Q?Kx+/eT2WlRUWC50ySfM5FSArq2mLLAARvVJIHR2aRpYQ5bGXe8ZTXEQdjU6h?=
 =?us-ascii?Q?NaDLJmBG+pmwA8uFQYlHIXUQO14o7Fzif8oJQBeE3J06WZzDBD2geac3AZOm?=
 =?us-ascii?Q?pkAjngMUtV0xULYQx5dQIwvhVphRmsiQmNVzThMcYEjFDoTT164VsP3r0Hfi?=
 =?us-ascii?Q?lAYBnrdZlEDWOoT2SrGuE/4sP+TxDiLJq7JRwT+oRTEl4coPZKAFv9ldch79?=
 =?us-ascii?Q?jElAkzy5vT5QkCmDAcbJRWxDiKCyVXk/vytgP9YqQnQRsOw71EcPYlBlAvGs?=
 =?us-ascii?Q?2gZuITlTJYlAhTzDlN1RTRNZund5WcDWAC4GZz6kzjblmXcpN1RxQjUS9ROA?=
 =?us-ascii?Q?C90PJlVw1Pmxe/6g+NrxENHbEv7vpNmFNS1lyxsupl91WRfZrDsvDjh656o3?=
 =?us-ascii?Q?NqjiP5EG4RkH+SlR194IoDskpZnSHz6zRzul7OiOjFrfvg2DXQSITHfdhuAn?=
 =?us-ascii?Q?vB4kcZmfhbZu4sk7lYnVcGOfmwjfXvzpZKDP3hwQnI5PYrZfEoDBK3q+K3lX?=
 =?us-ascii?Q?i6S5uUoCxewHVEbueu+Z8UzuzzTk7hQmSeMNukLCb8Q2AHHxhY8PAHOkbe6m?=
 =?us-ascii?Q?c4HA1ftIscT+CdlA6hKJvZGxi0lLMVSCvju3OK5Gi4PWdbHTZquCXDUwHB8z?=
 =?us-ascii?Q?s5Pp/7t2SylYull9Mjp6DWR4RPbcOyBjB4beyNICHdsuiv9nUhlBdb9jJzgJ?=
 =?us-ascii?Q?/j+Ggn+pc0WcL2iGSYAmVKIkYyxqiOeQ212VcrRAYJDFO3k7j1+GttdonrXQ?=
 =?us-ascii?Q?8TpbAF1PqMTqpCF8Rz8CY66n0JmDps4c+Uxf2k0WG/XhUtoMJvhtaar1Rvsb?=
 =?us-ascii?Q?WWQ2BznfVheqbfGycJSIqnZByspH4F9QIrX6z+oOngsCTQ9U4MdsQ23vMduk?=
 =?us-ascii?Q?7i8Tk6JYiZMKvVMzqB7uRRg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95a9312-7e72-4d76-e671-08de15c67c93
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 02:05:37.3026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypQQQfwJk+prYeWx2CTCEOK7GIQ6vqHdztJYf0xwxUVuEkHYonJq4gMAivNMJa7DIAqA/dr+io+k2F1xyM+3jS6eoHes3+jykT9al2Hyv0m6VRqVfqWcXdVGQrKqh1H7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7349


Hi Geert

> You are checking against the wrong bindings file.

Ah, OK thanks, I could reproduce the issue.
Will update files

# I couldn't notice about different file, because Renesas Mail server
# changes the URL for security reasons

Thank you for your help !!

Best regards
---
Kuninori Morimoto

