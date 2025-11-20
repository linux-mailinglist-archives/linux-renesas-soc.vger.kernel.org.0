Return-Path: <linux-renesas-soc+bounces-24877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD82C736B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 11:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 48BD735903F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29523101B7;
	Thu, 20 Nov 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SjA2fq1Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EDA23D28C;
	Thu, 20 Nov 2025 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763633490; cv=fail; b=qJl7EJv7OBcIlPDUotjmY8aU30123XEs/AgesLfctUKv10TcZKsWhmBiCuRnWYSGHMp9y2JaF4Q9T1tf0Xnrc4ZFaKCyyPsjnlXAXatTOGUkcmV53ypFumZAPrIBfiftYEbU+ceGLRyaUJPThprji2B3IljDiBgSZYQcJraFzEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763633490; c=relaxed/simple;
	bh=kq9KDBw5JjgiSbsz+Am3+rddfOJkCsHWWWtNDV1yyW0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jncXbCFNkiDZvcHTsDS01q9dpfYjFqrYX/mwMro/HDkylcBOX3HA5VQzG/4g5s9VvceBcimsk3GSsY7DQMRv8IdRalpE+LnEYZmY7nm7BVEi9o+66QMvTmmKxknPjKCKxMq4iTkGkcZSKi6nCBKUBilLfCPiNS7mXEHEVY4Owgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SjA2fq1Y; arc=fail smtp.client-ip=52.101.193.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kamJOPO6DIHyMkgHbv0ZMMTTNKPGP8uEG9ni5lf4jHcieM7KM0APRsJv1XCc7mbasilCsxTblPSeLUzDxa6q8oRXOF/QlsbRcm6UguIM563Z37Tuhyux1Gb77MXphpavyl0EjasOME4sUNcoYz3133aBTcKtvJXpzySTq8uM1kgbx3kg5eYGj8ptAeN+EEZe+xjS4ppEtQQJIy4UVpPq/LZolBafxdEb/7HUWXZcMtUpZoANrzQCEM+gSM8cvwUnER6k1dmwQHP6pRosBDIeFP9Z1elcXGcswlPBf9g2w8uvbaftMoHfALLhDjHalqoM7gtLDzV/2WGoaRBolw2eLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv/MYpcXsRCbzeZnHtP8wkAi2D+TOWhWnKG3bgbS6LA=;
 b=b6lciz1+vakY/TLaIm90yY254wQIB1jYq1NkhTgSbA+qfWqk0Aw/2VeUFgi9u5cxDHWlU2x5l9tHu9VHxHgtql8S8xPrJPuTP+R1awFv4D+0n87ESBd99E9opCzCKWVAa3fMgzcw8X9lnP2Q7iBjtQhyhbQIuaAt4N4T2XyD8A1cH13WMBvSAGLAGzhe2dmx9w7WwtH19U/bmV6UbMfGmIdQKrBs6PZEe4n5UGs4+09aV79VHdZ6kFyIR8MwIkNC5pBK85YD+hrK9rg2f6aAdUexy+hO6V3afd7UzRjpm7x5Ae5fdI2PsOw5pfx4z0k5wxEWjT0/WrJOJlt/HvEVTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tv/MYpcXsRCbzeZnHtP8wkAi2D+TOWhWnKG3bgbS6LA=;
 b=SjA2fq1YZMtSRWjKI56W3bBIV6fIDidZ+3iyafESVice5Rpu2HrIOJJTxoWY8QmviUcmlRI5wOdiuLrAOTf+F2xdRhEuaXUrPHDsQgsdIQlf/3sgVR3Chb6DaLLRDmkVNnMvAixVnFWX6Lt3fCYOq5fmM7dEWRMoGDuyxqcVreM35zyQejHr1MnO6e9hAvzKnVelc9+UV0zmOAWEdr7gxVYiTrp1Oi/17FfCKygARNhT5G5BYuM6/lJB6tKV4l47m/Wy8jW8e95WYzJWQ/fTaNnEIRBfgE+FMpeDQR5Sa6CJaQhx3sX/ahB3nE/FzldM+irLjmAo9k7ged6pJBziIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 10:11:26 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 10:11:25 +0000
Message-ID: <566061bf-7645-48ca-b7f5-086eab81d8eb@nvidia.com>
Date: Thu, 20 Nov 2025 10:11:14 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>,
 Marc Zyngier <maz@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk>
 <1a4d2276-75e1-4aa0-8ff2-c932ce5d6edc@kernel.org>
 <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdXgq=Zv3GQes_d_eyCcB7m--PaEGSQJtUWiRjj-7gBVkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::14) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MN2PR12MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 745af8d2-f06c-498b-bf5f-08de281d29dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnRmb2hwazdlSXExV1RnUUdkZDJjOEdEQU5TbjV1T1l2b0ZKQ0RmeHhKWUxt?=
 =?utf-8?B?OW5PeGFmYkpMaXRrWmN5eTRhTVBXQ0tQSUc1ZU5XWjlxNjJRcThySkhpcXNX?=
 =?utf-8?B?ZVJnc3ZSaTlFcEY0VjJhdks1dEdZRzJyeE1wYXlYZCt5VlhrYWR4U0pRbmd2?=
 =?utf-8?B?b3dMa3RrNjFoU1R1VTNzcWVMUUNPUU9tM0p2ODNRTGZiZDEvZ0o3bEhMNWd1?=
 =?utf-8?B?TEo0V1J4VFFiRDBGUnkveXlBYXUwaklkRDdheStuU1Ntckk1YkNXUm5HS1RM?=
 =?utf-8?B?NG5lamhVbzEzODZNU1VjeVVnREpUYk1nUTVGVkRrZllWQ2k0am5sZ1dIVHJB?=
 =?utf-8?B?MjMxMjdYWi91NXoveEpMZkwyVFJUZmFOWC91cmhUNE02TERqNDdFWXNDbWhG?=
 =?utf-8?B?S3Qyb1JlTE14UHRUb0lOU2kxNUR3cnBHMFZERmJRMmMrU1h6ZXQ4N1hEd3do?=
 =?utf-8?B?WWllZjhjVUcvazNrMXZiK3BvSnUvOWw5b2ZGaE5MMHlnSmZ6cHVyZ2hPbnVG?=
 =?utf-8?B?OW9VTDIrWFYrdktYT2VUUnAzK1dRaTVld2ZRdWx1dm1JUWdQRkJhZFNjRDBr?=
 =?utf-8?B?TkJUVEk4cUJHZ0tIc3RJZmhrOFFvekEySlVoQXBVUEhibXdQOE1yMXA4TlB2?=
 =?utf-8?B?b3huc1NoRnFzUEZCL0FkaWVqaiswYzQ3ZVROV2ZXbCtERDlxYys5Z0g0MFla?=
 =?utf-8?B?OXRtM1p2UDAwTUVZVllrTjdXeHlUT3M5SWcycFF6NFY0Wklkc0xSM2pTVTUz?=
 =?utf-8?B?OXVlZjJaU3NGS1Nmc0ZPUzNIQlRGSDhaS09HaDBjTHZYVXVkV1E0WXEycnJk?=
 =?utf-8?B?d0ExelAyMFY1SDVVb2tuRTI5bVl1bGRQR21URnRxMlhYYnk4cHZ1UVJDWXdH?=
 =?utf-8?B?N3BXT0VNQmkveEtlVklRZyt1NUxxei95cHlxbjUvZ0U5SlRxRHI3UGJMcTZN?=
 =?utf-8?B?MzB3SjlXWUttUjlLQUR3S0UwZkdpcUF2bG5xTFMvVEpMWGtYZVdnc2Zib3Bx?=
 =?utf-8?B?QWJtV2JXL3RQemVYUTNudlU3cUhqem1BNjNmd1VaeXFwa2tNSEZJMHA5M2Vv?=
 =?utf-8?B?OFBNakV0WGpKaEp1MkdpclM3TEdxVTFJamREZ3ZKZ3BhN25WR0U1V3JMMklj?=
 =?utf-8?B?SjR1ZFgza1dyT2R0dklaNXhPUVhTSzc2dFE0cGFwTFVqaDhHNWlSYVk2ak9P?=
 =?utf-8?B?TzV0eHhUbjBERlh6NVNnRHlvS1BGeVRXZzdqUll0WkF1SjFaTnNRU3ZRT21y?=
 =?utf-8?B?bmJGWnkrNkNHY1Q3ekRjclJ5NFd2ZmNYRmRFMWhpNTlPZTFsSWFlWE5tUGho?=
 =?utf-8?B?eVBrODJIQWRTL3pzUlcwSlZIWmtVSStYRVo3QnlTbHdFVkd6TU1mblhvQm85?=
 =?utf-8?B?aVBJYW5yVGdZZm1jcWRzOEErV2dTK3grczhpbWg5Zk8vZktxdzBhVkNGL1Ji?=
 =?utf-8?B?MXU4dGR1WXE2Yk1HeFFzbVp6UFpacHl4UVZmeDR2bloxLzhzRVVRTTF0ZHEv?=
 =?utf-8?B?WWI3anZEN1dPSXVoMkZYSXFBS0oxUy8zN0VnVis5KzVPNUdmTTlFa0NBMlMy?=
 =?utf-8?B?TjNhRVRuaXNNcmJXSTVteXhkYmkxaEZQT29iMUlPc1ZWZjNjYmNqanBJNVVV?=
 =?utf-8?B?REFyWmtwSzh6M2pkU3lMRDgyQUdDbE5rZGxnQlI5MjUxTThTQmhmclVMYVdD?=
 =?utf-8?B?bTBrblM2NVNlUytVTWN6M3UwSkZTNUFJUDFvNzJWd1R0MGw3WnRSSWVRVEkw?=
 =?utf-8?B?Z0wwWXJleEVyeHhMbHpGL08zOG9oTHU4T3UvRlJaTjNjRWJIZXU0QmRTNURB?=
 =?utf-8?B?SnRBRTJPcWx1NWNsc1lwcVd0Tmw3bWs3K0dXUEEzQUVLM29oQmVpZXFJaU5Z?=
 =?utf-8?B?REJSaC90MktJYkZOSXpEYXQzWnhvY3B2eHV0UFBTeFpIVVNwMkQ1QklFZFoy?=
 =?utf-8?B?QlZlS09pZjh6Tzh3SGYwRnJJT0ZqSWlJOGtDaHc1S0lxdyt6dVVBRFNwdVpJ?=
 =?utf-8?B?clo3ZS9Rd3JnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW9TZW9lSHYxejMvM251RWRHOGZpaVJPRlp5RmtadmRpdGFkSTd5cjdETXBa?=
 =?utf-8?B?MHovTlhkcVVsZmlKYmRPSjlHcjd3Y3QwRmw3NjBwbnBBWkozTDlNeGJpVG03?=
 =?utf-8?B?OFNUVDZyYThmTGpwRUU4ZTd0d3llLzh5Yi9ZZ1FrNmRCUTdQNzBUME5qUU5n?=
 =?utf-8?B?a3VaVlJabmdvcEl1QVNYMkpTbk5HZVl1V08wWFRSNFpCR1BKTm12ZDAxYnV3?=
 =?utf-8?B?SnJFOVNtdmd6RWxWUDJHRHh1OFhDY3dLYmt5NkIyUmt0Y0NMNkZMa0svOG50?=
 =?utf-8?B?WGwveTBPZ0hGY2ZDaU42NWk5VUR4Z0hzVmpPTHBKNEp2UCs1S25zeC9vbzdT?=
 =?utf-8?B?SUFETzJQcHlQYmtuQ2NLa0IzclZKWlJSaG0zd2N4YXhaL01DQlFJTC81UGV1?=
 =?utf-8?B?SlZaY05OYVFXNDh3amFDOVBGcHlQRG9hekZQZUxab2dDQktjWFNJVk5wMjJZ?=
 =?utf-8?B?RHU1Q0hRb2VwbmZEWVNxTFZna2VJVHlnNUk5NjNGOWJqOXNTc01SZ2ltSnVV?=
 =?utf-8?B?L05JeXY1T2FjaUtzQUF4OFF5a215TFJmUWRLNm5OZm5Za3EyTXEzUEtrcFd1?=
 =?utf-8?B?Z0phTGZQUG4vbEcvbnAyVENwQjFBTmZKcE55UmRVUXNER0kzZ3VnL2dVUWgy?=
 =?utf-8?B?OXYrM2tkbzFlbEtrVkY0bDNaUjVkVGMySVRWVFBNeTJCamZmMnlwbWU5Y1o5?=
 =?utf-8?B?WFNVSzhJUHhuTDVYZjBJcTYweW5USnk5cG0yQ1JtUVlFOHR3MU5YMG9jUzA2?=
 =?utf-8?B?NWJGNUFmME5FVFYyV1FuK0tlYUdHUFlUemdkRnJjMG1NdDhMc0trdDJJL2U4?=
 =?utf-8?B?TGVzQ1psbEdRTkdFbUxDOTlORko4bzlER3dpdHpiSU01ZXJYVlplWE1PRHpK?=
 =?utf-8?B?a3YwdlZUMHRHc1kzUURNQnkrV3ltRDhFWm1RNDNLSW5NRjlCd1FIWi9ubVFk?=
 =?utf-8?B?TXhWc3VsbEU4OVVHd09uQjlnK3VTOEF2SkxZNXhvdGMva2VzWHk1dzhkL2NS?=
 =?utf-8?B?STF1a015cUxBaTNmNlFCdVJHek9oYXV4dlRQZXgwblV5eHVJREZNKzBNcnJj?=
 =?utf-8?B?L0R1UUx1K2ZQUGdSUkxMY0UxeWJuTm15d2IyVGsrejNUU1ZoK1d4VzRFOGYx?=
 =?utf-8?B?d0xpaGwraVFUTitnL1U2NFFEaUZ4a09NeU5RSXg1bGtteHNPdDN3RzBQUEdE?=
 =?utf-8?B?L3pzWHJLRWs0SFY2WFZlSG83S0YyRDF1U0p0L1dyMjNjdGVDOEw3YW5sTVRX?=
 =?utf-8?B?WC9xVFVVMW52RHEwbFZaKzR1WHY5aGorNWdnb0loeUpxNjBIcGFTUlBzai9x?=
 =?utf-8?B?d25ERnFxb0taaHhVZnRxMWthWEF1R1cxandyUFd6UjJmMkVRNE9YM1N2QVVL?=
 =?utf-8?B?ZWpjdzNPQUlKdEhiSFhlZmo3SzlmSUY5TVZCTzZwd051akllQjNPVlhQTlFS?=
 =?utf-8?B?Nk1XRExOa0ZsRlprQSszM280TzlCaVVWUm9UVFdST1hNc1Y4Q3lCeUVGWEFu?=
 =?utf-8?B?a1RIVyszUVA1TlpDU2xoc2wrVllQUlkyaUQvcHFZdXFtNG9mWU5NQ3l4eWNI?=
 =?utf-8?B?d0plcTZKbkNEZU45TGJ1dks0Zjk0cnNmRmxSR0kvMFRkenNjd2pZdURTVGNu?=
 =?utf-8?B?Njkxd3poWWtlTTYwWUUxQlEwK3Z1cC9PaFM1UmJqT2ZYOXhoVm1hU1Y4SEdw?=
 =?utf-8?B?YjNGS2pNVHRuRG1jSjV6VCtxa050Z1Erd1FuL0I4eFNCTnd3cXc4YWxtUDhx?=
 =?utf-8?B?SGcxOFFUWVlNL0dYUzFKeGp1V2Q4bDUwem9SdzdrWkVRTGJOa0h0aWtMc2Rk?=
 =?utf-8?B?TGJBR0c2MGRURDZ2OW1HS2lEZlNWL0pJZlgwYkUvWnpEakdDRlRSQmNzRUEx?=
 =?utf-8?B?NjhkcGRBbHlVMk8zS25Qd3I5TjZCSWozMFVMS3FZcjhPV2d4UGNCOFoyaDRZ?=
 =?utf-8?B?OUo1TjVQRDRsWDE1QUIyd1k2Y1p0KysxZjlmR2s2SnJ5bDNBSmFxcDVoVVoy?=
 =?utf-8?B?amQ3cXQ2SWtKZEVvMHh1Sno1UTNRWHpaLzNhcnZSWkxtT0JTWGloWFVzNlVw?=
 =?utf-8?B?VEZlakk0djF6ZjF4S3RObFAxWDRDL201dlUyWVk4QWYrUXhBVFNoSktrNHBn?=
 =?utf-8?Q?VhldXKAiYUfnYT+u45d9XVudd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745af8d2-f06c-498b-bf5f-08de281d29dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:11:25.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOnIPwFetuwkbIGz9yHHOybSjyxylcaqWWN/g8RS3fsjGhgkfAkbCWiNrF5EnugihtCfYtT2byN2eKpZkAZPKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405


On 19/11/2025 08:53, Geert Uytterhoeven wrote:
> On Tue, 18 Nov 2025 at 20:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 18/11/2025 20:34, Mark Brown wrote:
>>> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
>>>> The Devicetree Specification states:
>>>>
>>>>      The root of the interrupt tree is determined when traversal of the
>>>>      interrupt tree reaches an interrupt controller node without an
>>>>      interrupts property and thus no explicit interrupt parent.
>>>>
>>>> However, of_irq_init() gratuitously assumes that a node without
>>>> interrupts has an actual interrupt parent if it finds an
>>>> interrupt-parent property higher up in the device tree.  Hence when such
>>>> a property is present (e.g. in the root node), the root interrupt
>>>> controller may not be detected as such, causing a panic:
>>>
>>> I'm seeing a boot regression on the TI x15 platform in -next which
>>> bisects to this patch in -next, unfortunately even with earlycon (though
>>> just earlycon, I don't know the platform specific runes) the board just
>>> dies with no output:
>>>
>>>    https://validation.linaro.org/scheduler/job/4252918#L409
>>>
>>> It does seem like a plausible patch for this sort of issue though, and
>>> the bisect converges smoothly:
>>
>> All Samsung platforms fail as well. I was waiting with bisection but
>> Marek was as usually very fast:
>>
>> https://lore.kernel.org/all/20251118115037.1866871-1-m.szyprowski@samsung.com/
> 
> Yeah, the various ti,omap[45]-wugen-mpu nodes have interrupt-parent
> properties, but no interrupts{-extended} properties.
> 
> Does the following (whitespace-damaged) patch, to restore finding an
> explicit interrupt-parent, fix the issue?
> 
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
>                  desc->interrupt_parent = of_parse_phandle(np,
> "interrupts-extended", 0);
>                  if (!desc->interrupt_parent && of_property_present(np,
> "interrupts"))
>                          desc->interrupt_parent = of_irq_find_parent(np);
> +               if (!desc->interrupt_parent)
> +                       desc->interrupt_parent = of_parse_phandle(np,
> "interrupt-parent", 0);
>                  if (desc->interrupt_parent == np) {
>                          of_node_put(desc->interrupt_parent);
>                          desc->interrupt_parent = NULL;


This patch also breaks various Tegra boards but the above does fix it.

Jon	

-- 
nvpublic


