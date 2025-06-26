Return-Path: <linux-renesas-soc+bounces-18807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35557AEA321
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 18:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C986717C47C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD4E19F42D;
	Thu, 26 Jun 2025 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VcevGNj+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C8143C61
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jun 2025 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953648; cv=fail; b=XQrpFPX82FrXp7fJAkf/zAdAzclSR3BLf2Chi3T1tqbdPFOAskM26MMPxFqoO9J0bnId6aLR7QwEvo4vDj9n5BsHhRt21FjFYC8G8Gj2mGzATpTVAtcQriztq2HgfL16eHFar/SB0zsGvsXTCL/FOjhZz1h0ZPGSZX8XzQwPR/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953648; c=relaxed/simple;
	bh=/fiSJWKWRQDLezEKEFJoqOfwHVfRNmqCqTJZbTtZuFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BCYlH67bggl00XD89VQXrKPzISsaLWPqNk7wBEC5YGs9jOrrn1/BAXt4Wl76BZ2miZONvY7PNmpdeYxrKbWoPxN2bPP2OpdbeFsPiG+kvaKzSXYrvck54YyBGv93uTN08sS50mrEV1LylqWjlvONp+dT1N0F2Dyn4zJSpg1qt40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VcevGNj+; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfrFoE940ryyOJCQOnCssfjPJEZ09rU20wy6qIlFKze61bwkSw7rxEE5sccIWfB+BkGyBQzw2D1s4pdyuFqg8+UEbhEGRcObWgZziC4Xpq+JAp9r3DMeKmBxMKkTgPDBUnvXS1mX7TFVZU+i01qHqInv2A6KwUUKLXkHsob5gxV8w20IYiK4KQ3Cn3snyOLzVErczTapg3IlDkq6szUqTHanxtnhHpAOvB7GluwkTbIHh8ND37dvRsKUhOpJPZDnJPlhCOVO6vT/u+bZlHSB4F8T3PCUF0jhOhtQKEzyCnyVcCp6rfZEnxD8kmAMpjcnCy4AVBxnm5FuHPyxUjs05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qvcdfdiw6C54LTgzlgVh0/Hv7TvLqLtHgXd5LJzlnP4=;
 b=gyFfd8MMD//nMsFIwhigJTsFiPtPPHMsfbRbFTxOQBGHW0QX0elROpo887SLl8bTPXj4HjN4BUKfXGBFPdZtDfpvsDTiWYMf9rSRXZlszHZ4j1njkCShjePUYTRyohi66Nz6dXxLLcwTQxsB86XvpeWknLvt3QSVOX8SauLpqURinjNAERrxK2QndBjlcPdRjLgfPAr6G9u7KLEiJGNgxYh9tRl5cHh5SpgasQwFxs3Q8EtQ68mtvP9PSjITxKq2HjYkGk28i+eeuM0ETvIjjbnb+HEjReakJWWKWSQtbQhF2J8iMX4hYOVPKtNtCoZnYW5EWf0YB50oP2rsPq63Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvcdfdiw6C54LTgzlgVh0/Hv7TvLqLtHgXd5LJzlnP4=;
 b=VcevGNj+Qu8W6DF7sJ7CWOCKT6S8bKvVU/ePvcWpCuhXQMstVyL/iJfTsHdG5AccLBpJBmQmjGLPUv/pYHx6UQzw+Mk4jqefBDT1Jzsfj7Ofivj9g68CE2Y7HKlTOjupXKF/zg/c1J3dq0HRYsT4Ui6pEI689GT9XAc5WxKWt33kKkUq9Tql1ib349R88atwnA9DDFKtawwfMG3z55d0oJEWbP9kRXjPn/WqpcrjY0AICdIq8FjXou2I8mSatl7J/FcYyUk4rbIe0vBPTWlFiNeuVH/ntaiufEnR5UHZvDmjIceEH6IkPmyRJL8Wd/P5renN3mnTUJC5ZGHCBsOL8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8997.eurprd04.prod.outlook.com (2603:10a6:10:2e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 16:00:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 16:00:43 +0000
Date: Thu, 26 Jun 2025 12:00:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH 1/3] i3c: core: switch to use SUSV4 error codes
Message-ID: <aF1up/4F8T59ilA3@lizhi-Precision-Tower-5810>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
 <20250625130918.14507-6-wsa+renesas@sang-engineering.com>
 <aFxcbGQyfjaHOHDt@lizhi-Precision-Tower-5810>
 <aF0OvNnmOIfpKwmQ@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0OvNnmOIfpKwmQ@shikoro>
X-ClientProxiedBy: AM0PR10CA0129.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 74770cc2-4e82-4e01-f5dc-08ddb4ca9b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9SKE472DFxuMTrSgkR3jS6g6Gbkr90zT0bWU4dB1FcxPszUUHGUcuXAIu1Jc?=
 =?us-ascii?Q?1JOeSGTbSYqPIWLxPqbTCqcECRr5I1UazfJO7t0IzsbWFVirdikVyXcYPmOz?=
 =?us-ascii?Q?extsKEEGVrIf/vOaeHhxvbJdtg3MD/Grs1i5W2OOoEJA539r0oUESzQrziF0?=
 =?us-ascii?Q?Y9p5WdqOEnD+uRSKETWdXMDfJk2M2G9TPwpnJlIFVl2wUGdojSdCy4irzM91?=
 =?us-ascii?Q?QoudytNK1w5zWDYeXIMZK8KUujDC87eZ8UiQcO5USRgnNYhnVYhdRrUmzIjE?=
 =?us-ascii?Q?cnMh3amORnDz19GEKEWd6Qsr8F6VyKqny+fhujLGTBPAnfGII/QKNa22lfZR?=
 =?us-ascii?Q?DNQd+E12g0QdzG6AGT/5aQ4RCDrGDtBQg1+kdKZMhoDgBe/guMnoAgaRWJAx?=
 =?us-ascii?Q?jfMdrTOBrSJd3isHNxLMKQ2En8xzJbslP5jZKDsxnn3i/DNCALjp4EB/4NEy?=
 =?us-ascii?Q?uOrWLwcVofd/wyGqGHpKvSvkU7W8GO3B25wgMhoHPPbuGS+ig1yTDZsxsX8O?=
 =?us-ascii?Q?oijntcVTjpsnQmZlGDLo7CiH5YZqRC+zltcU9Xf0i/qjqmyxEg48QVcIyGz2?=
 =?us-ascii?Q?1/K/64sQmCygECwPvXRmGzgyWEqdc7UhqE5LYC4MsmixyEcmPZdfgxxx51VJ?=
 =?us-ascii?Q?nX3eMZ3wut3eqBNJQXLBWcr9kKQfhghHb5cHI+aAo5J9vOzrG/y1VzgzukZ7?=
 =?us-ascii?Q?ipy8kBNmPppTD+wcOepYCd6iMnwNDN/lUfk1oddVzU4gN7WApGBMWnCERUin?=
 =?us-ascii?Q?30n4LU5TEZVkoU7hJB9hbygmgUNe4qJT29kYI+1ycz7pJtQ9PO2+/lK0+dR3?=
 =?us-ascii?Q?vF4wZRoQVdWiNLcchL69AdYTXH1Ju58BMIjHLYimASJnqt2gZ1rUi86QbmIi?=
 =?us-ascii?Q?N47zbq9Po3B7l+akIG2xjRbDKfq7CMKBYnXQyETw8nJRJQcx2pNCPjrz65wy?=
 =?us-ascii?Q?RDsZeEIjlYxF1sJRpRzHThaSBLFg+bu/5M/DXARB7PCKMpRcQdtSP8roMnVF?=
 =?us-ascii?Q?WV5DxE/Fzj+cmVY6tGWfNj8XoIR9a2XwlJKGiFtXRVZbTZK85rDUCvjmtEL1?=
 =?us-ascii?Q?rPPwzRYEeojH9oXHG+QeaNMlroPov0poRwRGiN9KGZDpC+5qY7EJksLVLHcC?=
 =?us-ascii?Q?RdguDnVjzmXhjMQHlAeu/h7tM8FHOlPZG3psWcwrgspS1/h5KpbgYbvlYBA9?=
 =?us-ascii?Q?sfW6r1KZbHWRxrEhG5VyZo1x4Bc7JMORqShOfnga/7EWIT9Rsm9i9gC8q2Cr?=
 =?us-ascii?Q?j76YhNfYzhZdqCSAMU9LWpoTCXd+p8iiBOaPNFccZYF+G7EtOxva5+P5cXAl?=
 =?us-ascii?Q?ZE+kH+tLDMyl9bM3a5J4V26VMRvNA0QpEM4oQestAGOpoi2ISWPfTNj64tzr?=
 =?us-ascii?Q?NwHlQzj7SF5G1Hc6XGIeXTqL6+KaQAbSGB3f+NldBUABVfbVAa20dsEBOKLT?=
 =?us-ascii?Q?IOFdHQwTOj2ukG3+3M2dG1J58ihkIR2c5pQjnnCDhg2FxFuICguybg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nrlab9smb2cJloCDW141noaBJeZTY51v7xNKhM+hv1wFpqjlq7xUcDbdeq0J?=
 =?us-ascii?Q?LRALOxCJaYLUbEec+t1xQq5dqSJdG+HqD6eDEZRr6N85rBeX8voEGpKXz4Vi?=
 =?us-ascii?Q?iK/0OQLv7EFIEgRwDspZkRXcEWEjgeXWEx+mP/hKgsIH9tXThS2mN6C9zZ53?=
 =?us-ascii?Q?LyUI/3YnJwxlrj32F7by7Ba20D1bY1m6b/rFSFZklwS2/rIzSRuAfguc1CTX?=
 =?us-ascii?Q?iamKJbXbj3A43tBURg4Qe8XfRuyQ/8mzVFRbpkDxDSwZR5PLiXnZXgi7WjRu?=
 =?us-ascii?Q?lG/DLB3MJ1X+8IU4HiC19wgdG0UgZLsCTla2tKv355UYgjm7TSNrr/HOFDtf?=
 =?us-ascii?Q?AE4S0siP855YkSt3W6gQf0r0QUPHYbDIcpv8HVS23XbGMlp/FhQtiayjZnI8?=
 =?us-ascii?Q?NYYBqA0wKqug+fQKzoLgOVd+zCAwUSPPNJ6YkHdfmEBGblGWQ3G/6LnJD5hu?=
 =?us-ascii?Q?Jyq2hsFDNxgMfLRSvHcYLaSpOZ3BBlM+pP9dcSXIKgs2B7rxj87RP89Io0Js?=
 =?us-ascii?Q?F9l3hqoQDCi3wvqL/t1lQATubD+qKj7TniD8ItL8GnuSmULLc59kVedI+kCW?=
 =?us-ascii?Q?6/cBB4s4Z0rG5qswNnk8sYGqzVy4anCEjjz6it6gkcw8WxSHWVzMlNEOoGwl?=
 =?us-ascii?Q?ldpnt9jIQc/FjwGeBTqo6xIcxf0V87onD8zvbrkwc59WiuwaHIOBwglhueTz?=
 =?us-ascii?Q?z1uiNn1EPwaXG9YSfDmZ5PRNOFuKYJJ31todSy4PErTCi1hB6XlbqhvoNUwg?=
 =?us-ascii?Q?U5ENzISjskWQbY156q+a6v6twc+beVh74i7uexP+tJDG9Yz+zdnDALDKp3+2?=
 =?us-ascii?Q?OVhcDOPztfPeTUjNrINdF7kuTgzl4m0bc9KI5/k5olV3wPf2Yi7OfP7+ZJAr?=
 =?us-ascii?Q?Y7PgKfThyzuwgSlEPMozUaLpBxlfYl7yB+FJRgCjJ7qzsfOe043DWeIPdS9o?=
 =?us-ascii?Q?sfk05o9CKcDC8MvArI0TE1Blug6RgDyp1+DNDkaeKbR0//YKfZsg1tb4n3L5?=
 =?us-ascii?Q?yublDBIYojVfJneLDwqOlX2/a9aq8tIllf/JkVOdwdX2NrG+uBTYZyorN5Ud?=
 =?us-ascii?Q?lRzd9vUTqesJeNyey1dJMsmgf3rQ3Mlead3/kpfBz9v9FCdG5eScJ1ZkPIzp?=
 =?us-ascii?Q?EmOhHEd3smf68q5uVYwiZKxpY+amralXQP3WJtmzydm9ChGvluHM4f0h9xQ1?=
 =?us-ascii?Q?dkDwxMqW3qoiGrHHhJTK9nLh2EvX2KWBtnWclOwUJgEzOq4FixDPV923mFYN?=
 =?us-ascii?Q?xQziG/WVABLy65Bus5K8+o1BBqr9O8exhRzG+7fr+yZhC28pyPROlxLGf9q0?=
 =?us-ascii?Q?3zeHwNa9Vp116S2cOTF0fvmy4TVa9XOx1dzVXrebqTPoROtdTttfc8pTrt7u?=
 =?us-ascii?Q?1uspKfvGMMKhhXE1+7qjF0e2PC/P2Z+zqX1qktvpyCA9+Mt9PM/t6SjPjSlB?=
 =?us-ascii?Q?VQW8Lxl9TP4nDuByrLqg1JLreJcszuCTGLVZGecXvO4jZc3ZU5n+slAHg3uy?=
 =?us-ascii?Q?fTXKPv53CDXAz+FqNOff/z0o18Ngv16kvs8WSdZX8VMN/DfN7fUAtrAA18gl?=
 =?us-ascii?Q?IucztwP/9r7szCNIWRY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74770cc2-4e82-4e01-f5dc-08ddb4ca9b05
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:00:43.5535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szzoOZd4+5hcnU2dalgcHjTUzy5OmbUm8xamyMsLL1o56uk+IOS2M8aNwM3FhKfs5Tf61qhhIyIv1H+JIoeoWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8997

On Thu, Jun 26, 2025 at 11:11:24AM +0200, Wolfram Sang wrote:
> On Wed, Jun 25, 2025 at 04:30:36PM -0400, Frank Li wrote:
> > On Wed, Jun 25, 2025 at 03:09:19PM +0200, Wolfram Sang wrote:
> > > This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
> > > code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
> > > probably will get one. So, let's convert these error codes now, before
> > > it will be forgotten in the future, and they could slip through to
> > > applications.
> >
> > I suggest the simple words should be enough.
> >
> > i3c: core: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
> >
> > Replace non-standard ENOTSUPP with the SUSV4-defined error code EOPNOTSUPP
> > to fix below checkpatch warning:
> >   "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"
>
> Can do so, if you really want, but "to fix checkpatch warning" is
> usually a not-so-good commit description.

The error message "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"
is straightforward enough.

Frank

> The above text tells WHY
> checkpatch issues the warning and why we should care. However, I can
> probably simplify the wording a little.
>

