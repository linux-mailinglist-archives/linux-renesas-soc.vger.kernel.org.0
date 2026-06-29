Return-Path: <linux-renesas-soc+bounces-34536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PRAeHUnUQmqIDwoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:23:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7726DE9E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=sOGi0pA4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3900F303E4C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 20:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89E838839E;
	Mon, 29 Jun 2026 20:22:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC953803C5;
	Mon, 29 Jun 2026 20:22:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764523; cv=fail; b=UnZ/ZWS0XstH+YlsiOv8cXaZJoTLnCOWU2nH5ovZLAcvpPD2ALzxWuk3zN5adUtJHD+cxSlYVyX21md4GislZt8l5wWTLyjCOygcVNqJUJJ/+OWbXW9tLFYc8/dO55nmJhTPlU6XIZkrP012Tj6pfYjgcIFneiONHW/C5cc3kMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764523; c=relaxed/simple;
	bh=bK0E3iJ4kk7hhc1YH1hvG75SoOcVzLfgtjyaOKT84qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ed3GPQQWF5YLcRhQ6QY6y+mxAGCV5s06KjQhHPdDLzzd62g+Vcc8+7Bnx9S/dBysIUv6mvIFjK3LO7ES40zYB0p3jBs7pp+mgjhps5oNxjnWoGgb25SR/wRe9HwfQfN9BTdSZ5RviSZK4MCjTQ4EQrEWjFyHe7TlUkCncBk2etg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sOGi0pA4; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ij37sENbuETm1jxqmMpS6qwA9QJAbbyHukZ8hQ2hijuCYfZp83KZ+gKLJ1iA97F/UIRZdltrwdoCBZTxaPFN68rFgo0tLMe7DfRSsxKVU90rflfS3g63JXiyBOK87XaXRYMOBoeHa/zcZk+6M2D0/JfNJrL7juUGeeqKJOcapcc/oLu3TaFKVM9utEVEOd50yudbmeb8MuO4b1KsPkU8zgGbpoPSxwsi7i14t26athA72MWnb04L7AwKeYKPZnZrmOA+NmaBxNy2SddJFlunwgqHumyFpJ5DwX7I1af3zDGK8Mah0ZMD6RS/OD3s83lwg5/VS5isFe+HoCL3mUEEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYoIGJFk7B9QfSZK2Yke6eQq04jHv4meA0kxiUyD4/E=;
 b=BUM24qRnxSEZ9KkJVERKEyAd218mSCnZ5yiTC8mrz8Zvnb5Cc5cSF2o6cDatfr+9i/6UX9Ff+GZ4UTvrko6DfnWONeDCVKb/L/d7EXHOQ417K0O4KtDqm4HAUdaceTrwXFVzYTcFnlTjDQr9OoEKpjqpTUljFaEfttlEov5zPDZudfSug3+JZ/kiIcSvO4Ze+Ya8EnavvEav5JTTfzhImkQL0869DPRYgmh2rUJInRiNJgvJUmXBrxGJeB8dyA9Th3EM8bzzZJS3G/REv5muOU7nVuHtflGN49yOzp8l6TlvMaWxO78sRBuKOW+5azcDSjlSpZe0uJOV96R+lIepSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYoIGJFk7B9QfSZK2Yke6eQq04jHv4meA0kxiUyD4/E=;
 b=sOGi0pA4lU0V/SfWF7VYEW5WIP+mUmgynCOFUIgLUkmIK771h6Q6n8F9cAR/x6Yly7yPL2fuO3s/d2rtET7029g5ki1WzA2BOWA6aQjF266bGpuKZm3+xv2mk+Y7pt4S4Grs61b5HzHUSCiAS7unQYYiNVDndinvxOly0jrzxDPx4qXcyKpmg/pCK43OJYjAcEQfFmKMSppmc54ifs/BDGLr75uOKixZr8L7Edm05/G6jBJ4b+mrnBi8nqmHupf03+1/FR98awqpUPPmDyFQtfmfLxmHr/1wfp5WPRUYIXifx1WE1G7nipWvDF4pYPtn4L9GBEOmcc4kt1dxi+/c2Q==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8970.eurprd04.prod.outlook.com (2603:10a6:20b:409::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:21:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:21:59 +0000
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
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
Date: Mon, 29 Jun 2026 16:21:41 -0400
Message-ID: <178276437492.2460000.15705061275095440688.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF00013306.namprd07.prod.outlook.com
 (2603:10b6:518:1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8970:EE_
X-MS-Office365-Filtering-Correlation-Id: 592899b4-e710-4ab2-a58c-08ded61c129a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006|23010399003|22082099003|11063799006|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	pfJWHMCDu0FtFSeHhyXJZrZlj+gdVVKQlK6+eOFN2x8rHaHTgWpJqxKoShoTZdQPck1a1Ohu7YN10L3yZ7/ml217sceVV9JnJ8JB0krKm/mr6/KXY4JrxXcPsko8SUX2nyaLCLNBcWaY56859ZeLp6jVTyyvXbWr1CcMlAKMTIjwk5oSLWiq4yOFnIUbQKVqo5mXIBFbB7akQhTDdpTt2PYKKEOpMdF3LPf+z06yhbDM27nKD71qMfBQHC5MqYs4i7rOLO1gLCCE1roWVdmu/E+YTBUT/GV7Lg6m4y2kAbJ80WIHRrhJy+DamdZp3ozWrDb+S5XDsyv+0Ixa3byQgnIioH1wv3jZ8YGKhnM+UM9qXAIFUwUwiv/ZfExqHHQtofyUXH4kReTgG4tN2KdWq7V9jnUlQe7hv51tsZDXtNnyA/hkKzIsJfNDfBERg252eKQyv11A6RYjQO9EI+67PS/6f4w8GBXyKo0MajfmLtFwUaA2CjAb24uhRddqScFtVzr0A+XivKZnOpooTScYWmjc28wr6z7zudGT+gYFI1/aqphyL9MPlfx44TAgvJBnSsjIOG799UUyCVGYH4GDscWsDxDVxSUcnr1lnpg7HWtGclpTFJ7fq6d8rq089/6tm3C3gM7c3EOKv9kVa6wYwESGjW1Cb5/V/ixJhqndbAyx0g20W1y7DSTv2KrgDoiOJqNrMrfdb8NcmWhofEDN9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006)(23010399003)(22082099003)(11063799006)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU5Bd1hUdlRlQ1Rjc3h1bjJDanlQRnlpeVIzaGZHakxZdUhJTjVpa0JrMmF5?=
 =?utf-8?B?MTR1aU1TUkNqU1NKZWUwRVN4Qng1K05jYUlvVmVaODlWM2pyeTgvSkJoKy81?=
 =?utf-8?B?b2xrRU9qWC9zS2FSQWZCS1NOc1NYWW4yNTZHRFdVbWJKR3lsQm1iYVJOWC90?=
 =?utf-8?B?dnFaM0RPamZZWkdtWG1JcEw2dUFUbTUxQTA1Q2p3bHNKMmNJV1hnRFRLZGlR?=
 =?utf-8?B?Uzlxc2xkZnQ1S1dYSTNIYTNKWjJpRGRGRVVnZjdYVmZNbnFCYVB6bk1vQmpR?=
 =?utf-8?B?NFhIS0tBSkIrK2xocE5BYSs2Q3I3eDJ5VysxT3JQTzNiSmFKaXE1cnNhYmRh?=
 =?utf-8?B?clZCN255S2VWaFhuNGxBWEpVaVRUNW5CL1F5VmE1N3J1Q1VTSHpSYk9Ua1NT?=
 =?utf-8?B?YUN5T1VTSTVjaVRMSnkrRFhYOXB5ZGlGdkg3bmk5S0s0M28zM2p3S05oYVJr?=
 =?utf-8?B?VmVmSGRvdE13TGhkWCtHYzNVT0FTRFM5ZE9WeEJsbHRMbWJYWjdYNTZBd0ZY?=
 =?utf-8?B?TGpGZkdHTDhMS3hxK3B4TitOdzhYVUNuNnJvTTdWLzFJbVAzL1p3cjY0TGF6?=
 =?utf-8?B?R2ZqcVRqelhCOWlOY1JKaEpiWk5mZTRvQlNuT21XNXNNb3EwMVZuK0tDNGV3?=
 =?utf-8?B?RktEZUZTZHoyckJpYlFYdnZYT1lBVDg0eS9EaWNhM3pRSkdNNUNFaEJ1Qndw?=
 =?utf-8?B?TUpMZWNRLzRpcDBzbG94RXNZcnFGUTZVUXQ0bHE3S21pZDdNSzhKNDRkRTdw?=
 =?utf-8?B?alBETm5YbU1Wcm5SZVcrTFkyOVZPWW0vZzZHbk9EMWpCelE3Zjh6V0pmbkJL?=
 =?utf-8?B?T05sV2c3TUErSlg1WTRkNWNYcnNDOHJpMU9FMDNtcXlGMkJGZWdzcTlMWkt0?=
 =?utf-8?B?cGw2OTlWTkRBblFwMjVScjFjTXZJYm5jcWE5clRLOUM2V3B4SDVzb0o5bnBQ?=
 =?utf-8?B?UFZzVTBGWDd1ZTFCSHE5T1UyN2FXdjZuRm5FSHp4dGthbUU4OHNlQ2pDTEhk?=
 =?utf-8?B?RDNUTDRZNzlDeG1tSWFuamQ4aVoyN2RvdXZSZ3JkcG05U1hPWjRGWHdHM0cx?=
 =?utf-8?B?ekt4Y1U5a0Fjdmxnckg1QjVwZzdURUpKMnZiWFZQQzdVK0MxUTJjT1JudGJU?=
 =?utf-8?B?T05PN2YyMndHV3ZRbGtpSmZ6V2hTM0pBNzMxZWdlV3ZlWml6RXI1U3FodE1M?=
 =?utf-8?B?QW5GZW1GUFVCWGNSeUVxREF5ajhPTk5vcjkrWlUvZmI4V1lBUXVqUlFxRHRV?=
 =?utf-8?B?WGZUbXp5ZnF5cjBnaHZmaW12Sk9lSnA1dUlxeGhOT3JDWU1SeGxPcjlmbTg2?=
 =?utf-8?B?SmpaU3VHQThyZmp4eDhOaXVnRDJNeG5mSmhjNDJvaGJWU3RZUlhJR2RhQVpY?=
 =?utf-8?B?SUZObS93OXBiUlF0RitpS1M5L25ha25tNnlIWW94N0VFU0x5aXhCamZqNzRM?=
 =?utf-8?B?cm5wZjFJbVVmOVZYNEM5eHJDcGNTaXQwTkhCVG5PWHBEMTZQL25tSVhIQzlx?=
 =?utf-8?B?MlhqcCs3WjlabWwvRHc3US9qanNaT1lDOWRZRFJaek0wTzdGaDJEVm9DdjhN?=
 =?utf-8?B?U3IyRk5UdGZ2RmhJS3QvVjdRaWl0aUxsTTQ3dlYzUzVHT1NHM3JXQndLQlpp?=
 =?utf-8?B?aFdzYkg4dFN5MWhNZW9rcmZuU0lTZFY3SmtYYVN4OEtpb1hYcG1CZjMrTzhD?=
 =?utf-8?B?MFg5UTJETUhhUi9IdXVwNXhvRFpoaFlFYlFJejZEV2RlNkwweFcwQ0ZNUXNl?=
 =?utf-8?B?ZThEVFpSc0t5N09ZclRKVitxTlVXTmIzcEZlWFNZYXpwTmg1ckVKK3doZ0l0?=
 =?utf-8?B?ZWh3YWxZY1J2eGhnVkZiQk5hYTgzZ3EwS3J3Y0N6UWxMTzhiU1VzNW9MUEo4?=
 =?utf-8?B?ZDhFRC8vT3VLTi9CS1JIQVZ0QnV0eGxhd0J1aEVZYkp2Znp3TGxPemU4aFBp?=
 =?utf-8?B?VW1waVRSK3d6NTdsenMyMkZJN2ZzVzBkSzhsaWt3VktTQUIwL2RscThaU1Bh?=
 =?utf-8?B?VjdxbENZYWdaUHpzWHlpdG8rYk5uT0NEcDFHQzhRcFFXcytVQUpwSENPci9H?=
 =?utf-8?B?RWM5Rk5WQ1crV0dDQTdqeTdKa3VaV3VPOGsydFpjelA3UnlaYzNpZndveDI0?=
 =?utf-8?B?bnRwcXZtQmswVisvWWVtRUJtRjR5ekxhaVBWMHVDaW51OVoxOVJZRVo0Sitl?=
 =?utf-8?B?cThIMDB3QkxQRGo3a3VEOVdkSEtvZTYwZm1DTDN2VGxyNkR4WjZndktYckEz?=
 =?utf-8?B?YnhYOU9KSUtWWDQzUWVJZ21DNk1hMHVBRXBMR1NjaUVHb0daeVltWnhrTWFr?=
 =?utf-8?B?NUJVMWxpTlFweVhvTE93MDhGaTFYaFVtc2VFanB1Z0RpUzI2SEY0cHNvaDVt?=
 =?utf-8?Q?vqRDONX935m6L4YkXqzSfsYlWQaaSVlBIPZ8K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592899b4-e710-4ab2-a58c-08ded61c129a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:21:59.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JBQ+SRjjHsAj+RAAs/HmZjEOZD+17hDt+GGz6QS31ednjZOACmDHTmS3fWTSReYcOBfRdWrtxof8HfS/vJPEp4g77Ufm4x3OLy3PSlbFvW7/nny51s0ghWRtYWG4rXQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8970
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-34536-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF7726DE9E9

From: Frank Li <Frank.Li@nxp.com>


On Wed, 03 Jun 2026 11:36:06 +0200, Alexander Stein wrote:
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

