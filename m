Return-Path: <linux-renesas-soc+bounces-34428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8wowFzbPPWrL6ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 03:00:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7376C95C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 03:00:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=kWuYH2mu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95259302D5D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2026 00:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCDD2BEC5F;
	Fri, 26 Jun 2026 00:59:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB37A2BE644;
	Fri, 26 Jun 2026 00:59:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782435579; cv=fail; b=ievq2ACSTpOX8+ukMhan+iZ2aO6dvdUZ0t2Fpajc4/XrVgC109doswBpYnseWWbB9aTzAyXLPYNxjLNy+zK3AjuiYf3hL0hp9XHPNhZFEgbrESH/RrZT7OddPYenD3D7WRkaE/IB3i3UiiDNoTEysBzL1xbMh2JivE3npirHLV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782435579; c=relaxed/simple;
	bh=ZKIA9jYY72/D3ZQ9Jbx69ko/fMfLeXbnRLnvYUZES2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZepJD1V+wZZjGLyBmjnSU2ZfHkaipkeQmY2VsoazMGL7hHl7SqJLLuAV64bA6qgL91qfLiNM1bd91gjYeP6l9mvUpmAZi+akG6gjuOGfFp7JJZ6KThQXLSuQjyXG7/WOG7cYLFyPg1j5vkYpPoiMoUeLF4out0EwtntzJN4CFT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kWuYH2mu; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zM90CjWTxw2BzVIlDZSINTrSInJvTd5ZyNd0A4Yywvsl8scl7TyVl2yz/6IhTKBYWVk9aRYHAP5GbWHhrx4xbDwM76gE00gsSyYcIYIx6EIcHa/AiqPYoQC9HbzQ1l9zYV45DCpsJZ26PbqWNpQYJr0twPc5PMkDEJmjJJaTLwMXaMBJ0/j5t26fmDyJdqgwfCeQmfXqBrfw9CBLuIV878NcxavG3qzGHQOQP55GnjtRLV1DFmAcdGY24X7aQjqw2FkKloGnF8BVFjMu9bllC+QAlcb1DkBkqPYiWIW+4VCOiQ09OfDOMowd1rnOotVL1paW20gLkFiQajKNuHXA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnKvjL+0DMSuJlLXbOtjbLWY5RwhXgC0eT31JCOmnnU=;
 b=WoekNNBx6naZk/s8YFbplb+bLEL19Rx/SOLpUGc2e5vK/rQlmzEFOyYGOtD9SxxUnaWz14B1fywQ2vQ9u27WaHnUYkmPJbRqBvtmZLOvsIjPr04PUpxKdcKdANYJb8feQRCYPHH1C98yjnDQNtqp8FBN4J52iIAhvD7yspm8tCMKAOn7ZPmUlwByaJZxkq/Ur/cOsGcVF3PPrM6dGLjrr6ZM7Zt4PBm5F06UoJ1vLsiyKgYcoyCUVZcjTp8AX5oj8fdppgY9Zzkoh1SMFuYkgqlckVk8fHidYe3JXPPIl1B+0B9OGZPwCAD6nGMNvWe60kMRoMpM5RswuMCIHliGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnKvjL+0DMSuJlLXbOtjbLWY5RwhXgC0eT31JCOmnnU=;
 b=kWuYH2muqwuoQ2colvwaN7updic8CmDor+qtqGOUXzub3/dqIZl9cDESm/KNTkJAMCkN2o0amDqrpyg1EyLf3H2X3sYK4mzykjT0Je/Kn0npHjZjUtZBpha02mE9PuEHQzOTfhJ8RPGeDoO7GYXUabuRfLEtx9IRqo7fEwSXW78=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS3PR01MB6610.jpnprd01.prod.outlook.com (2603:1096:604:10a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 00:59:32 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 00:59:32 +0000
Date: Fri, 26 Jun 2026 02:59:11 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 02/13] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <aj3O36J4q04nIpNs@tom-desktop>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
 <20260513222725.GA2069022-robh@kernel.org>
 <aiqtSWTTa4ZIThrp@tom-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiqtSWTTa4ZIThrp@tom-desktop>
X-ClientProxiedBy: VI1PR0102CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::16) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS3PR01MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b207a8-bc7d-43d3-172c-08ded31e2ee4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|23010399003|366016|38350700014|13003099007|22082099003|18002099003|3023799007|4143699003|6133799003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
 XpVqyCMjNee4n3BlHcmSndmR2oOcZ8Kf9SZMy2soAj6kC9UJ6giN+CnCg8R3EeF9UyPq8+C4PxiiHy1kALJhHyxFHFzze9Ed2T6+618Mi8uuizpE0txg8YF6AXKmE/arwnzIXhVWglV7cJxRm28o2rjUsXiWmDxjlklvDBIxc+tzTziAVbdb+NUVl4ec3t/7D0Ausvc2K1kVmwdtPFnI10ZN9xzaiLldBQwLjtVLfyeGuqbdglbikX68pCkO5W+lZrcNuGkdRGHGlSOXlDtBZGqymp2sEw4aeICXkSTqe4o8w0BfgzfyUF05aCfHa8YiziD2ZNgquNZzi0xxVik2Yf9SlxG/b3HUVyPFXiggQnVB0WXRnTF290g4lFEX8kuZe0/cPkKqML4vWDYHyqTkuXC5MChDYOdTWmWP0I8OqpHvmnjjR1W8aUQ9eKjFCf/LHIB+anYFIdIa7EBluILxM6i7emczjnWFg2oHUHgz7WdWprH8zMaKwnzmrLEwISwFRRVAGqVvxkkf3VGeMFOXTB04dw/Pkf+bNmfvsMoLgcNEH5YhD9Fg289ELF4I63WD/WtQoYGqk12/H1BUVmVAt5rBqi5lw9Lb8MZ8aVyeoAmYFeMY/vVgantJ3XBxEoeocMd4FRNgm9EqSgbzVET3tcTnfWyLp/4aslVk9AuWTL0HJ/mMfy4Pjfki5sCjIUDqfZRH9ReT3t19T2Tx7QHnubRQqqh2GyMxR+cyYCUC9aU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(23010399003)(366016)(38350700014)(13003099007)(22082099003)(18002099003)(3023799007)(4143699003)(6133799003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Vro8yVIWs4/uvomroXluy6Q2Nj/RVUo0woPcaedsLKVwIevx4OutsZROoA0I?=
 =?us-ascii?Q?62GdJZSO5ME8twEuPZu/S7yJHwRMBgRRu9w5DYtfc2ga7eHBMJf81EBKk86C?=
 =?us-ascii?Q?R3QR8VPGXxuiTN1PAbOyj5f6GI83btXqchha4F8Ryx8H2ieGZPmXirQezxl4?=
 =?us-ascii?Q?8x3luplb9aqZYDiGld+msFiL8C0aOvfZhz0emDbsbFjs2AiBwNFSb4+xK9+/?=
 =?us-ascii?Q?NbZYZw6TXlDszpFynudio8WosrEcEknj0wq7WtQ302VpTReRG/AQjC3Y5emK?=
 =?us-ascii?Q?Yrqcz86AV2wSIKuND8NHIe99DnGT2TBg2bxHNXRSDZ+65bUXAf8LwVXjU2Pv?=
 =?us-ascii?Q?sfLj2bOc22FIK1X2CVN1IiCMW3A2XKMl1ebsOEPwm2Ycg14P90oMRvbByOKY?=
 =?us-ascii?Q?JkvCU2q5uJ/crJAfB3kK7JTUP0Rel3i1c27C7u9mV/kVu26S6wlJYVFZClmE?=
 =?us-ascii?Q?38B/6JOxMY508/oWIF0py/MQHXEpn+7KJ6mpdTVS1axNQ8YkY+3vzddj7QCm?=
 =?us-ascii?Q?v/x5X1kFV+jAYZLFqFHryJ9Y5vgKnHH2WjKWZ18lvauq8er7MaxYGyuRX2ac?=
 =?us-ascii?Q?neIehi6K9DCHXei3q4RfUEUxbrAyCVKC6HNZ3z4OeTI/f3mlCe3OJkWjsl9I?=
 =?us-ascii?Q?WnF8XSjoroSSJJnQcOfw4UVNSsy+HnIUjUoD5nw4f49lCcZ0yhKYiNeiOOCK?=
 =?us-ascii?Q?eokm2xsQvfYmDECkph6MYzky1vNVJ1/e6TVJF7gcQAwEnejLhW/YeMszn/oO?=
 =?us-ascii?Q?+HkXTN0eWx4B3KVhq4MxiAVg11bfqmEp+m0GgMhYOpQPxzGGlc9mDfZM0QDK?=
 =?us-ascii?Q?Wq4YJiaHDksJJZTBGKC95lMizs0KSRgFpqpBSJFtXu1iQhOVDqckcuPgACGL?=
 =?us-ascii?Q?Ex4Ft5w0svZdJtjGI3ic4GG/FuHxyHb2u+eVToMYKDcPQLK5WNa6IEY2UEiN?=
 =?us-ascii?Q?b99+d4bZZK1DliTNWTHbPDfUrDXSsDWTiJSlTn1uIjyp8nRDe758Xybve5TS?=
 =?us-ascii?Q?aygCBLYZ/H5Mb6mF+Xk7xvGn14B1TDLeq57Wo88R/awXhlTQato0pbQLXQzU?=
 =?us-ascii?Q?rqMbIo/X/mdlnsS1s+sSLRYeJeoSGjXDxe30rvxfXL8eYrqwdUizmeurTBbF?=
 =?us-ascii?Q?t0viqLIf8/5Wf4x1Nwuy+IyZAgUS0ISxtMOROByXaIjrd3et7Mbd9vI442X4?=
 =?us-ascii?Q?fW0t/EiMp/y55gNvJfIBNeId8pJ0S/o/PWoPmLCTZM4pDzmaKqaWHLRcK7/3?=
 =?us-ascii?Q?nx33IzI4slmW36K8/Rf0nuZHfdpPt4Ph9msrkk1CUKSm/5Irz8+AuwBMZ7Ok?=
 =?us-ascii?Q?rIAgj4CeX2T/9CkUhkAZblsjbvoZy7lypThXIZALitT0D+dTRBgx65Lj3SfC?=
 =?us-ascii?Q?W9fVXYV6hxXOs6Zm9aiespZDhItUdXE8oUzOhAYDt/xy6IpBmqm/vkok2Qt7?=
 =?us-ascii?Q?Rtj/1eAzlrB/5Bwazpvo1v4RnKNCBeWHTYZk7H8W0q19oA6NV8pOkLTTR2Kp?=
 =?us-ascii?Q?Fneafw+X4UK2Pv6ITKbTu9ULs8mJ+zfU0hikeOvQCnX0iFGBTxEan34QCWv4?=
 =?us-ascii?Q?8Pxb1A7F8zW5OwKf/Cqh6GwXk+DKJMakAvplAN2PH8VlIEQdNPdaH/m3drMP?=
 =?us-ascii?Q?PenKqnuyZAGEWYJB4Nz+phNJmRXiNcAbBdaMhtuJLreqJaudsJ99oPMsHqLc?=
 =?us-ascii?Q?5Hmh2m8FVL3E9R2q9eJDBgqUFcFD3xQz0tB87v8hQ8U/P/YdfZWBNPk4IsSM?=
 =?us-ascii?Q?+yxKT37ZAKRHtsKrPzeSRnCotpcGcGUo2OPSxfqcWDLtBNz6ITKH?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b207a8-bc7d-43d3-172c-08ded31e2ee4
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 00:59:32.6390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY6Y+vj41Lh/TfIrdnLw/Ox6++BWiJt6eXtUKr4+5fCR+weK0YrBbTDpTW5Z6RzuDeVduSJGk287VCbzase3iwnaqPpAit60pJV/H0P4cOxRooLu7zAXEvmZnfsQvFSP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6610
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34428-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,tom-desktop:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC7376C95C1

Hi Rob,

On Thu, Jun 11, 2026 at 02:42:49PM +0200, Tommaso Merciai wrote:
> Hi Rob,
> Thanks for your review.
> 
> On Wed, May 13, 2026 at 05:27:25PM -0500, Rob Herring wrote:
> > On Thu, May 07, 2026 at 11:21:30AM +0200, Tommaso Merciai wrote:
> > > The RZ/G3E SoC integrates two LCD controllers (LCDC0 and LCDC1), each
> > > containing a FCPVD, VSPD, and Display Unit (DU).
> > > 
> > >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> > >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > > 
> > > Add compatible string 'renesas,r9a09g047-du' and extend the binding to
> > > support two DU instances: add reg-names ('du0'/'du1'), extend reg,
> > > interrupts, and resets to maxItems: 2, and extend clocks/clock-names to
> > > six entries (aclk/pclk/vclk per instance, minItems: 3).
> > 
> > Don't write what the diff has. I can read the diff for that.
> 
> Ouch, thanks.
> 
> > 
> > > 
> > > Drop the "Each port shall have a single endpoint." constraint since
> > > RZ/G3E ports expose multiple endpoints.
> > > 
> > > Add a RZ/G3E-specific allOf rule mapping two DU instances to two ports:
> > > 
> > >  - port@0 (DU0): endpoint@0 DSI, endpoint@2 LVDS ch0, endpoint@3 LVDS ch1
> > >  - port@1 (DU1): endpoint@0 DSI, endpoint@1 RGB (DPAD), endpoint@3 LVDS ch1
> > > 
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v6->v7:
> > >  - Rebased on top of [1]
> > >    [1] https://lore.kernel.org/all/20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > >  - Use single DRM device aggregating both DU instances (1 DU dt node),
> > >    modelling single port for each DU0, DU1 and multiple endpoints for
> > >    outputs.
> > 
> > That seems like the completely wrong thing to do and you've given no 
> > reason why you think it is the right choice.
> 
> 
> We had a discussion with Laurent at [1] about this topic.
> In particular:
> 
> DSI ip can select at runtime input data path or DU0 or DU1
> via DSI_LINK_GPO0R VICH register. This can be done by managing the
> 2 DUs as single DRM device aggregating both DU instances that will spawn
> 2 crtcs. In this way at runtime we can select the output for DSI ip
> via the following commands:
> 
> modetest -M rzg2l-du -s 58@55:800x600-56.25@XR24 (DU0 -> DSI)
> modetest -M rzg2l-du -s 58@56:800x600-56.25@XR24 (DU1 -> DSI)
> 
> This can be done using option [B] (single drm device that spawn 2 crtc).
> 
> Using option [A] we will have 2 drm devices 1 for DU0 and 1 for DU1
> that each will spawn a single CRTC and the above feature will be not
> achievable.
> 
> In the end we need a way to have single DRM device that spawn 2 CRTCs.
> 
> A) Two device tree nodes rapresenting DU0 and DU1 design [v6]:
> 
> du0: display@16460000 {
> 	compatible = "renesas,r9a09g047-du";
> 	reg = <0 0x16460000 0 0x10000>;
> 	interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks = <&cpg CPG_MOD 0xed>,
> 			<&cpg CPG_MOD 0xee>,
> 			<&cpg CPG_MOD 0xef>;
> 	clock-names = "aclk", "pclk", "vclk";
> 	power-domains = <&cpg>;
> 	resets = <&cpg 0xdc>;
> 	renesas,vsps = <&vspd0 0>;
> 	status = "disabled";
> 
> 	ports {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		port@0 {
> 			reg = <0>;
> 			du0_out_dsi: endpoint {
> 			};
> 		};
> 
> 		port@2 {
> 			reg = <2>;
> 			du0_out_lvds0: endpoint {
> 			};
> 		};
> 
> 		port@3 {
> 			reg = <3>;
> 			du0_out_lvds1: endpoint {
> 			};
> 		};
> 	};
> };
> 
> du1: display@16490000 {
> 	compatible = "renesas,r9a09g047-du";
> 	reg = <0 0x16490000 0 0x10000>;
> 	interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks = <&cpg CPG_MOD 0x1a8>,
> 			<&cpg CPG_MOD 0x1a9>,
> 			<&cpg CPG_MOD 0x1aa>;
> 	clock-names = "aclk", "pclk", "vclk";
> 	power-domains = <&cpg>;
> 	resets = <&cpg 0x11e>;
> 	renesas,vsps = <&vspd1 0>;
> 	status = "disabled";
> 
> 	ports {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		port@0 {
> 			reg = <0>;
> 			du1_out_dsi: endpoint {
> 			};
> 		};
> 
> 		port@1 {
> 			reg = <1>;
> 			du1_out_rgb: endpoint {
> 			};
> 		};
> 
> 		port@3 {
> 			reg = <3>;
> 			du1_out_lvds1: endpoint {
> 			};
> 		};
> 	};
> };
> 
> ---
> 
> B) Single device tree node design aggregating both DU instances [v7]:
> 
> du: display@16460000 {
> 	compatible = "renesas,r9a09g047-du";
> 	reg = <0 0x16460000 0 0x10000>,
> 		<0 0x16490000 0 0x10000>;
> 	reg-names = "du0", "du1";
> 	interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>,
> 			<GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks = <&cpg CPG_MOD 0xed>,
> 			<&cpg CPG_MOD 0xee>,
> 			<&cpg CPG_MOD 0xef>,
> 			<&cpg CPG_MOD 0x1a8>,
> 			<&cpg CPG_MOD 0x1a9>,
> 			<&cpg CPG_MOD 0x1aa>;
> 	clock-names = "aclk", "pclk", "vclk",
> 			"aclk1", "pclk1", "vclk1";
> 	power-domains = <&cpg>;
> 	resets = <&cpg 0xdc>, <&cpg 0x11e>;
> 	reset-names = "resetn", "resetn1";
> 	renesas,vsps = <&vspd0 0>, <&vspd1 0>;
> 	status = "disabled";
> 
> 	ports {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		port@0 {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			reg = <0>;
> 
> 			du0_out_dsi: endpoint@0 {
> 				reg = <0>;
> 			};
> 
> 			du0_out_lvds0: endpoint@2 {
> 				reg = <2>;
> 			};
> 
> 			du0_out_lvds1: endpoint@3 {
> 				reg = <3>;
> 			};
> 		};
> 
> 		port@1 {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			reg = <1>;
> 
> 			du1_out_dsi: endpoint@0 {
> 				reg = <0>;
> 			};
> 
> 			du1_out_rgb: endpoint@1 {
> 				reg = <1>;
> 			};
> 
> 			du1_out_lvds1: endpoint@3 {
> 				reg = <3>;
> 			};
> 		};
> 	};
> };
> 
> ---


Gentle ping on how to proceed on this patch?

Kind Regards,
Tommaso

> 
> Please Biju, Laurent correct me if I'm missing something.
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com/
> [v6] https://patchwork.kernel.org/project/linux-renesas-soc/patch/8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com/
> [v7] https://patchwork.kernel.org/project/linux-renesas-soc/patch/ff8e401a0667970a42a55420dcb071e34730a923.1778141145.git.tommaso.merciai.xr@bp.renesas.com/
> 
> Kind Regards,
> Tommaso
> 
> > 
> > Rob

