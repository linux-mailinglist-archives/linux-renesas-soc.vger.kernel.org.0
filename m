Return-Path: <linux-renesas-soc+bounces-34537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Rs8QO/fTQmpDDwoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:22:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F36DE9C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:22:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=oU0ncdlC;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06024300B457
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 20:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732FC388369;
	Mon, 29 Jun 2026 20:22:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32237DAAC;
	Mon, 29 Jun 2026 20:22:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764532; cv=fail; b=VxG665WK/sIF/mLPWSUsnZ80LYP+lunnEirAYr2F1n46JS7+n7YWZEHwISA2+xd6Fu3QbeSvEFDQu2mgOw0PeFqHzDE6tbYX/VtDbg866bxfVE7WxaIb51uvQBjSrAdZSWSV/O2NDhxOfWIlL5zziydzCjNRZ/6FjDVHV7Prtdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764532; c=relaxed/simple;
	bh=xzxX/b92eeGNnNIZjlTwgkex/1HZA4JsomNFN8aNUSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BlHQj5bO4GJHR9HjIMzyxxgGj1CCT89vRaaSTUNgW4W6dL6ReX2v+9CjnQICumiHdvrR0GqAWv4gT1j3btL9/1Mi0L4lDEzDfC+lf6zTa+7SNdMZWyqKH/OT5A6keLXal6eadX7HslLLS7iLqux+zCldORONJp+mWFOPJVzWkXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oU0ncdlC; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPikP8npsxdTQTMU2cCrDhPnCSa8kh4RbceH4a6hV9NWR/+3oQAIMoGdRY2QBloB4EqFc64rJiM5V6bTJOZxAWh64LsZsTpJht0bCRMJH0FeZAwAW/JmqynIJGu8hPVh9g68x1G33Y8oD+Ag30ysNFuq0y735FQ7GOaMbByiBzUuSgpfkRs/rvycCFnclGKnnfoKMrVmjow1/wRE65v37GmvWRGP7L8K29F+DqZ1aWcEEfTMBIwiRtWfSxREk25BLT4S60k02W16IGqEVMLrYQkniC4SsNFX9NEMfBWhKAiZeO5E630FFAefZjPXWb/+Lpk2UOztOsUDFsU/RVBmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6dXkHK6s0tFhvhO8Q0tfJZzwmDlLqhaa3Iy3FLglIg=;
 b=mtXEzHDreJWoRUSHvVmrdTjCUD0afB7En19YvyS3A0FI6xjWDGz0N3rj6wCStqAlDiCygx0rPgFjw12Z0UEhXmcK69/RdVcSQBIwoeZgyW3W/0ZJ+a9UI5WXO5YeSXUpmt7kNa+BRt2//gVQXk+EIRXki6lu0LPTdeh267mno40h/JIalosLrEIBXTXUwUSG+OKsuiZqm8+oVqehsgZ/9J+a68ts5xoGN5J0iZp5EozvTadhmug2GPafKreuKwMVj0OtCr4vNDDaKcMoPbpl7oGm4VSg45GYgh8XWlHrfTOk3dTn+UgWv+5wBfTcpJMg87T/drqJ1V7yDQEx5BIY/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6dXkHK6s0tFhvhO8Q0tfJZzwmDlLqhaa3Iy3FLglIg=;
 b=oU0ncdlCagekKEpXYLeT2Xl7djJp9Q63QBFvQUstA05mw5p+gjwmnFZuV5sE+EV9ISgEpZbFAc5XXd7WkYquiQLDnsb/JsYpCzYEtyIgA4VqPPdLnooU8hA7NaCBHLy7PdhvPVdr+DDl/bH0G2NOE4y26WV9uYIegbB45+z7EFKaKYNRr96MzWeSwuJsPWdLicHAx56LEYF0asXsJRJprT5YlM56u5oqvZ8hKyeYd48o7nMiW2Jb/rGx5dWLBBKGh72VopH5WlcykyUyMl5g9BPCVAwlrMLFfQC7tvCWlW15izwiVf7ZciDV69Bk5MU8yOgFmlHvY6uXYHdZZIgCJg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8653.eurprd04.prod.outlook.com (2603:10a6:102:21c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:22:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:22:07 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Paul Gerber <paul.gerber@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
Date: Mon, 29 Jun 2026 16:21:42 -0400
Message-ID: <178276437493.2460000.5225996302601429276.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625051449.2560197-1-alexander.stein@ew.tq-group.com>
References: <20260625051449.2560197-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF00013304.namprd07.prod.outlook.com
 (2603:10b6:518:1::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cda9c1-f22e-4cfa-ab4c-08ded61c174e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|23010399003|18002099003|11063799006|22082099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	EdKJDs48w45jBeLOBcCVxdyMSwbqDaHpZrHZ5NRYhpbQMY1mWqCMpLuUKYBcLxN+Gfd0hUXfVBO2MN2DI2HgWl0vf12tPBd6depSnQxgCu4stfUrerlYS/n2FY/REJoQyq3Ev7Qsj4592timX7c7aNNl1FszT1XMWlF44tuNi/XpVZSUMQ4oYpSp0lIUgIlMT1DwOzzXJO8ktUYYWBS/rhSDHH6xBBqYORHkyWwd4UHR7yJQHhc6oCxGRk39b+EVjKgPw1/nrvXnaXaT70H0yyWWnUkGLwuw3MWacIuUW1WpmdRAY+G6dbkzGIurGUQw9yXLvibQwevXH1TP7Cq/xEG+ffD7T3eCWvZZaoBoLJ07t0JsjJCxd+kzCapyVCbT6pbitGCZ4lINaQ0/SU/laBILcxXCLlGnVMVONZ4PPs2FR3QmLKQyg4ZolNK+rWB3cgcxrhOg/qvbECzkagsCcmEp/RAP2+g7wVxM0aZTJpnywLOVZDsjoY7r8QrkrlxHluRP4L0B3Mx3KcGAD+SZO3nVxUh3qRDpL5gdHLfzjL1pHCJMffv6p7RczRplguCo32iBCT//wL+qBkzlgrHzyjtA0k/S6nDRFRMxR6ES/RYXKFphcu69/c1LwvzF6IsQF9GKrEdca7ux5B8e1yRRe4zaXaiie3Q/wb5/v2lOPOuWhXnhN/fu+8bKBeB/2tGPrxj2/BsKWuEU5DUr3Z/mDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(23010399003)(18002099003)(11063799006)(22082099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1NPK2orYjVWaXJTK1dYSjZBZmdMQ0ljRVlFNzVPM210SmJEQzdOYW55WlZM?=
 =?utf-8?B?R21RZk92TFZCdDdxQUxaS1g5bVhuQVBDZWxTdGRPR1hVc2FGVkRPdktNZVB0?=
 =?utf-8?B?WTVKWXgzRG1DVXpKZnJnM0pjY1JsUkNGOUtCUHZsZDVpSStzY1VsVDlVMDVw?=
 =?utf-8?B?ZFZoenpCV3FtRFcyTEhuOVVIVG9kc2dFUjd6cUVQOTZtVlhQR0R0U3VkaVB6?=
 =?utf-8?B?TVlUNXpQSURQK1RmNDBNUGpPb3lXcTVRbHN6dEh5OXJzYlVydzNhaG1kbDNp?=
 =?utf-8?B?ZmlXa1lhQkdIZVZZdlJsUTBaYi9ycGd0cWR0clBLWUZpY2xocHM5OW52NXRR?=
 =?utf-8?B?MDE4V2V0WW12R0pLbjNMUXlNak5ZUytGenlkTlNWYjRnaXFlR0FTb1hGcThx?=
 =?utf-8?B?NDFSUk9WeHJLaUtLNjgycmVBUmw1a1pFTk54MzR5RGdXTDFSQzhoVC9nYUYy?=
 =?utf-8?B?S3djWi9YbXZXZ3k0RTlxZ3dNcGlqY2cyLzl4MlNxazFJeDNVQVlKRFZneWpK?=
 =?utf-8?B?L09FZmk3akhVRVBJNjlQL2pPTi9KNi9CZHd3a3Z0V0VHdXdRU29nZjI4T0xR?=
 =?utf-8?B?bHRwWnhIbkZnRm9JL25NeHBpSmpqQ0Z0aWllOUJrVGxwS1hGSjRGZ2ZYbjZa?=
 =?utf-8?B?bzZmdStpU3ZYWklBbDlVem04L2Z5WThCMndJam5oa0M2dlVjYjQ1N0kyaTRC?=
 =?utf-8?B?VDVwcVVRKzZ5OUhVWk5pUnJ4anR6VE8yMWxwQmdJamo2SzF2eGdGUVVETTI1?=
 =?utf-8?B?d3NBdEFkSEYyM28zYkdFNzFkV1h6R2pFV2xzQWRXaDk4T2RYcEo1RWRuTDdB?=
 =?utf-8?B?VzgrVHVSVEVkVzNOczB6VlZ6emhMVGJYZEM0NHpEU21nSTVMSloySXFyMEMr?=
 =?utf-8?B?R1hMZWVFWWg2Q3dDTjBNeU9ud1Z5eUZUc3hONkd3cWxHTEZ4L3R0VER6VW11?=
 =?utf-8?B?SHFSWTZUbmdieUppSXBLUWtOclhLNDBveVpEaHFHemlqK1huYkJzd0JxbGIz?=
 =?utf-8?B?UHBPVytOekg4bDZaWE1IQTJBZ1FpTi8vQ3NIbDJ2Y2VOOWhJeVE2NzZka0I5?=
 =?utf-8?B?N3VWa3AxUnloeWo5V1AwSnN2YmNLU0crU05CYmdydUhrVW5GSmVFZEUxSFhk?=
 =?utf-8?B?Y055ellrR0d2aitubHVuNXNBU2ZyZmY3eGNIa2hzamVhbmFyYUFCYktEVk5h?=
 =?utf-8?B?SllzMnI0ekdOMkVrSTlNdVphUDkzanZXRGdDUDgyTnc2VTlaTUFkTER3SjhY?=
 =?utf-8?B?WGIrVXJaNFJUSlVaaTRqM2ZrQUNVVXo3SE52Q0F0WHJwazdmakpHRVZqZVBZ?=
 =?utf-8?B?WlhHYlo3QWdYQno0SXFKa1lFbzJJUUNhbWpXT3FHWFhyNFd0akJ4cllEMXVS?=
 =?utf-8?B?dG4yWGU0MEdVRlp2ZkxScHdJaHBqWXFwOFB5OUtRQnVqWU0rK2VHWUNDL0Ry?=
 =?utf-8?B?UlN0cWhNMTJFdnBQWU9rRi9qZnhncHp1d3NScnVDVWlNeXJZaC9ySEMyeGZq?=
 =?utf-8?B?a0NYKy81NGpMUEtKcEgyUUNZVjZQYzdISDlSMWhTVi91MVVpbzFnWTl2eElU?=
 =?utf-8?B?UXAyNkVlSWt5TUxhdEg1YUIxN3pYL3VXaGhiN3hhMVlsVGcraGlKU2Q0TzZv?=
 =?utf-8?B?SkdFSklCbng5TGx0bFlHZ0hUYjhMbzB5TGkzOGdBNzg4dE9iWm96RW1zUTJl?=
 =?utf-8?B?VjJiLzJENVJXMk5yVjFRRkNHWTNyS3ZKSkdmOWNGTm14VXdKRlJpWTE3aUdr?=
 =?utf-8?B?ZmIza1JGYmhSZCtSQ0s4TmdUMFJELzlGZ2ROOElib3pZYkprem1hNFlBaHV2?=
 =?utf-8?B?Wi9ueUlGQk1zdi9ueTEvN3hXbDEyQzdQUG9PMlZQYmlGZ3pBWlZqWmtLeENw?=
 =?utf-8?B?UThvZEZoczgwWjU2cXRDUUtOZDFrbGdwWFBNQVRXcmIxSXdGUVZYOEJQTGY3?=
 =?utf-8?B?aWppT0NwNEZMRDVSQS95VFFyekRwMC9uak1sRllRUnpkTlJGcURTcVk5RDVW?=
 =?utf-8?B?QmFZbEFROERUMVlVVDFBdTJSNTY5T0FvN1FKcmNoWEM3Zi9qTS9hQUpyUGp5?=
 =?utf-8?B?WFJ1dUpPMHdreVNHbnZvTnlnQXljeHJFUExhN29HTzBzN0JzdGFmdmkrQVpX?=
 =?utf-8?B?QXc0c1ROSHU0U1N2Z2dGcnY4VmF4YU5DOTRUR1hSd3E2anhtV3hoUGQxbkdH?=
 =?utf-8?B?aVA3Q2JKNzZSaG1JcmtUM0ppakJ2ZnB5em0rSmtBZlFSV0xHK21XY3F4allo?=
 =?utf-8?B?VWdvN2hqWTlTdkQrOEFRSEZ3Tjhudy8rVzdtM0V6UkxFRzBDRXRRc0NLaG1R?=
 =?utf-8?B?ZzZOcVJFNjAzK0s3cEVBKy9od2JDblN1UXdzamlDREt1UUQ3OWd1WlFBRXlt?=
 =?utf-8?Q?ZQ1nIXKaeRYpdburCQyS3a1V3oyAqAU5p8Zeu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cda9c1-f22e-4cfa-ab4c-08ded61c174e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:22:07.3431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8XDj3Nk+wS/RhlqAfApRBj9vTvlbXigBx6tw09XmQ5Xf0hH5JS4H6MDmQyqfznJL85XVnVGgylVBPCV1a+9Wn4tmyPt2MRc79lJFM1ed0eYAe0Hci2A25X6O3TTh9An
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8653
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:shawnguo@kernel.org,m:alexander.stein@ew.tq-group.com,m:Frank.Li@nxp.com,m:paul.gerber@tq-group.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux@ew.tq-group.com,m:linux-renesas-soc@vger.kernel.org,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,glider.be,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34537-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 876F36DE9C0

From: Frank Li <Frank.Li@nxp.com>


On Thu, 25 Jun 2026 07:14:44 +0200, Alexander Stein wrote:
> TQMa8MPxS is a SOM family using NXP i.MX8MP CPU family.
> MB-SMARC-2 is an evaluation mainbord for this SOM
> 
> The SOM needs a mainboard, therefore we provide two compatibles here:
> 
> "tq,imx8mp-<SOM>" for the module and
> "tq,imx8mp-<SOM>-<SBC>"
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
      commit: 4596f1624bf3abdc7782fbca0385bc0a8afb3d51
[2/4] arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP
      commit: 6f0c003f0ddbfde3a311d350d2b3c1c38ac95dd4
[3/4] arm64: dts: freescale: add LVDS overlays for TQMa8MPxS
      commit: 0d8c74f493e941ff61ce4dcfee75f2891bd44454
[4/4] arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8MPxS
      commit: 3ee55e19db02d25d7c1155c3a6ab954aacfc55c5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

