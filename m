Return-Path: <linux-renesas-soc+bounces-26274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD43CF2C62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 10:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DD60302EA38
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 09:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5BD32AAC9;
	Mon,  5 Jan 2026 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MUCpN3hr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBCD32B989;
	Mon,  5 Jan 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605346; cv=fail; b=DjyocGEcsulqu98ug3f/3pHabDHc+A0Ts7Fq0dw8MOXFtzi+flbVFW4MNCOHP+qV2/ECetPpk+sgWPdpeQYS0Phsrq0EOh5qMw+9rWrGShBLnmG0EaR1oq75jtpRprNnx9aiMNIegpK3U0axtlC+ystrXAP588WAukQHrWdrzBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605346; c=relaxed/simple;
	bh=kA3m1tNUhAD9IdF4CJURgfrJ8sCmlsfNysj4X68Ti04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZNbWYUGSFLWnDNVAO60pDssJmd2+E26zj9wbE7ZaD1FsZ9nvsoRG17DCLxnjTU7L3ZyhfFtRJPay9ie7Uq6+8YtS5fzKMGjG4hO+Vsqk4zEhlFGX/JLPje7QX0QiTnN8FP8eZxcLOKAfmGWnzJ1OLRNwq9i4N6Xn2pxe/t8fd7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MUCpN3hr; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4uukOixIEVgGo460BICl0JIlGEybgOij0eAuJnfBiNCEyei5wsR10hI9NmRwDq2ZdB0KfZIJGb2guoEqDbv6jMhufVqVjCD8NlV3D5stgMm27IcO3kaemhfU0+kwiEkW77qr9uVPbXk6ZQBE7+cuWrA9b7ab4k7BfSnjwP07b4dANWTyzjCfHF9CLxgmWfn/WTKqIXMFZMsQVjKofka6nXV8jt+iHwh/q3g/sy4l2VsXXF9g7tm7AnacK7uQzEhP5x04pKi701LWr71Vc+wA9x0x9jT3N/MifWemK4mFokyOkTqd4A+OlNMIoRcnAwHB8H0ps7lzdKN7hOgPbQ1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScKCEmBKygoF9+DeGXnFB+GGumLGqc6ltTWAZrYc9A4=;
 b=V+jAXTdzkoMc8PKA1fhoYWIZdZKI3BGJONvn2nI1SXMZd4ncpGDOqc/jRQ47/sBj81MLo/jVbnCXadLerr9R4nciY/rYPWYJrZAyJU//wdkwSmTkvoFVpilhYVY+rsFRnjelyBaF8nbLZkR57I2Xg4NIdZSt73DJRCgPo+qI/uo/KfvkczdkDSAhUpX3nnbb9Ir1FzdHhowpj8U3b0l8bJ6HOU9599vlkbTVuHUECnI+iMBnYEgKWDwSWAuh3aSy0j4E85qhE9ENe0rRVXDzMSh2vtaPvtm0CEs1kHCUA4W+ZpgvWsmTBtBt+icuQUgnFyHBLTSGal5KryESSxPn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScKCEmBKygoF9+DeGXnFB+GGumLGqc6ltTWAZrYc9A4=;
 b=MUCpN3hrD40PX48hrURz166zVcHBUmzoSb3H1SV3ojJDpwtpd2I74hY7GrDLmDujLBmJagRjF2+baXv5P+H17sELb3X8uuF4a/Ip9J+fip0skqlU3dgf4zUSRgqFyavwat/58OK+XiW0o3x1LcOaXHKh1cM+H74RTKLiHgkILV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSOPR01MB12153.jpnprd01.prod.outlook.com (2603:1096:604:2d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 09:28:48 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 09:28:48 +0000
Date: Mon, 5 Jan 2026 10:28:28 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aVuEPIXTckqCxtJV@tom-desktop>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <c6678c398f89eba9ae7b349ec31bbd0a1cf7355c.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB1134639E27E86605C6B6270E686BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY3PR01MB1134639E27E86605C6B6270E686BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: MR1P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSOPR01MB12153:EE_
X-MS-Office365-Filtering-Correlation-Id: 17682485-26c3-444b-0793-08de4c3cd48b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHpWbDNxYWIzZWJEcGo3M2VPUGVBRFQ3N1A3SGhnT05nVnpNWS9Nekc1V2NZ?=
 =?utf-8?B?Rkxmdkd0TGtGTXdWaWVzRmVIMTJURzNRaHlPUnFrcURVYWFXTHVzMUV2Skcr?=
 =?utf-8?B?dHlNQjRBbGxnaEREbFFpaFNKMjIya2l3SHlocTFwc0NyNThvT0pxcHNFRWVt?=
 =?utf-8?B?ZG8wV201UmhWWnZTNkp0bGQ5dDdRWm5GMGg2OW1oTEdWYzM5RHN4bks3QjVo?=
 =?utf-8?B?OE83RVJrWXB6MCtYRFkxejEvNnAwTlMxSDRLc25UUS9JT25CdFA2UDFDaTdP?=
 =?utf-8?B?dVkxanlKU3FhYUdMbFlvMTFPUXZWN0tXK2xDYllXRXpLK1gyM3d5Z2FoTUpS?=
 =?utf-8?B?Q0lZbzFuYzFSL3JBQnBlOThiWThVU0c3OW92SjNvQ2F3UVBGeUMvL3FXN1Vq?=
 =?utf-8?B?VEQ3U24zRFdDUGsxVXY3YlEwSFZBU3J6dkEwd3BPdldsQkFybG0rQ3cwQlpT?=
 =?utf-8?B?QitSVlgwbjJ0bXpyOW90VWpwSkVvRFNKZlZsSk9HRGFoS2xtamRid0k2RnAy?=
 =?utf-8?B?ZlBSNmE2eWRzekczUEJYU2VMaGhPVHlTamFUQkVtQWVrWVFDbm5XRW82YWhw?=
 =?utf-8?B?YnBaRUxFL0o5MWh5WWpyMGNuNFFpMThKNWl0K2VuUitMUGlZeStUVXhsVTU3?=
 =?utf-8?B?M2pjdUhsMjRBMFM0M1VQTVlwTlEzdXB2U1Z6NGdKKzlXTVlHU3k4S1Q4d0dP?=
 =?utf-8?B?aFdVcG5Xb0VZdm5sNmRhbGhZdXFVeVdOYlhPV1o4TjhJZDlpeUM1Y0NrYnh5?=
 =?utf-8?B?cENjRE9idWhSS2pRRWdSMFJzSU5pV1dqNm05bks4eXZrZ3pZS1dUOEFHL25U?=
 =?utf-8?B?bVNUekNYVUdjQXluYU93RWk1Nm94eHRqMHdpRTlEM05NSEJCU2xjdHNTYktG?=
 =?utf-8?B?dUtpTWZDMWFRUkxhTjF1WDhRNlJrT2kwbmhOcU1BOGRZbVJoaWpBU3JZR1ZI?=
 =?utf-8?B?dGg5MmU1K1VwWWJvRVd1N1QwSWdGWUp4UlRoS1V3eTFpWlBUc2UvVlEvTUlV?=
 =?utf-8?B?QW1Qb0dLaTRIeVRnSUVWVExiZVlIMFhQRGliZWx6aWdVcTk4ZmZlV0RtQkhu?=
 =?utf-8?B?V20vZjlmbGszVmhCYVVLN2RlQlpmdUs5dFM2M0pYYlpUNWg0RGZOTXlsRDda?=
 =?utf-8?B?VWJWd1VkcGc1SVpDa2M2SWdPbXNqdCtZUXlzYWNla0hwZGtQS1F1VXBxMXZ6?=
 =?utf-8?B?Mm9adUE2OUhsWjhyRFZBNVVDdXlsaXg5bFRiTHk1a1RZdG5lT3l6UVNLY00r?=
 =?utf-8?B?RWZYR0hpN0hzbktIOG0xdVBzNjBQMlcva0pVK3NaVTJPVUxKWHlZQ2xBeFh6?=
 =?utf-8?B?Nkd6bGN0SG4rVjZkSk5DMEE4NGpZalZsV1A3MzJxeUp0YVdsa00vU25aSTRU?=
 =?utf-8?B?d0ZTS0M1N0hSci9BaGtZUlNBVWo4QTRhbGJRWjRWYXVjQzFXaFExSzl2ckF0?=
 =?utf-8?B?ck9FdG9WZnpzdmtBWnFndFVTbFVjR1EyTDUwblBVWE9kNEllbHhwSHdXQm5E?=
 =?utf-8?B?eVN4TkhRcXpnamtSRDVtYlN4Yi9zMUE4TjJxS245WDB4V09XRkplVnVoeTRZ?=
 =?utf-8?B?WWRlQzkrV3BsSGhoaFFpd3pCNGhtdVF3cVd0enMvejRISXpGR0pGV1gvN2Fu?=
 =?utf-8?B?MGxYNWlCZ3UweDVVU3QyZTdPcjVzU0FzcHRLRFBvTHlyTkdYajR0TXR4Wkhm?=
 =?utf-8?B?VUdHdGR0aHZBQmVKT2RzbTc4R28rRkRrRUp2QTMwdFZOQ28wQzBtTFNFVDA1?=
 =?utf-8?B?cGRETVFaMXRsTHlMQ2ZpTFQ3TXBVcW51cnR6VnM2K0RnWmpTTUI4Y2tjS1Fw?=
 =?utf-8?B?ZXlVdWpweFJKdDdCNzR4THNkakV6Umc1T1E3VXdBUUNjR2FuUXFvMW1WUWZG?=
 =?utf-8?B?bUQzM2R2QStPYUtFNmI1WVhKZ05SNmNKQ2JpSStMNjEveHowWEVBZjFlRzBG?=
 =?utf-8?B?Vk1Rb1p6K3FPREN5Zi9Qb3B3Sk1GbHh4Z0RpQk04bitFd1k4OG1HM01qTEs3?=
 =?utf-8?B?RUVSS0ZwaWhnamRvczF5dXRRTjliYldxSzlONkU4bzFwY05xYVVXeUpHNkNX?=
 =?utf-8?Q?ulWgr0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09JRnIzMVE2ZVUzUmUwcEd5ZGNsNjFXbmtTazFoQWs0cFJmdEdvcjk5alo4?=
 =?utf-8?B?U0ZxSUllN2dOZm5FbksyT1AybUxJZndDSUdCSVBLZmliM09QSWdHK2JGWHFS?=
 =?utf-8?B?M3JlVzBxdkhHSkFzKzFkSnE2RTB5aXdHZTVrZS8xTlJLMisyUVpZYmd5amVP?=
 =?utf-8?B?aG9lYWdJRzd0UzNINFRSNVdWNkgybFA2Nmk2azIzbTZYZmJSQmkvSmw3SEtU?=
 =?utf-8?B?clJnUVRlOWJjYWVJb1VsdVhFZFdJREczTllvTUgzWHZYQStUN1gwSTV0S3U2?=
 =?utf-8?B?UjVkTTFndWdEOXZOMzIyTkNoZ3Y4MGU2ayt5dTViZWNISndlN0ZaYlkxM3pR?=
 =?utf-8?B?Q2xxMDh4YXVMZHRwSm5FdDRHVG9PTmJGZnFnK0V2Tk5NUHJaOWJrWVNPdzQ2?=
 =?utf-8?B?TWN6SVArTDYrc2RJd0RCQzhITFl1UlNjSm5SaFJqYVNjR2VkN1FjbDN1RnBE?=
 =?utf-8?B?VjBHckxQVlVFOWVVMnVsNWhYT0k4RllPYTlkamNOOTkzSTd4ZDBydnpBZ1dy?=
 =?utf-8?B?QUZhb0Z6WEpiNGNsMTUwSGIrQnJWOXN1THFCSzh0QWVEUXpOdE15U2oxYVND?=
 =?utf-8?B?VW5rWmUvOUd5N1IybWp0ZlVyZzJhWWIvYVA3U3dWTVh3UzZFc2s1SjFtN1pu?=
 =?utf-8?B?dXBRdys1NXUrN1F5NFd6dzJ2MHVzRUVRNnhkSkMrQU1uSFptUXhpSUpuckF3?=
 =?utf-8?B?NzE0T0pIZWFFM0N2eXd6NHljdWZxUGQvUGdROCthOW51dGFyS3FmeW5JNlVm?=
 =?utf-8?B?Y3dyKzk5K3c5ZkJsV2dqUDZPNDdVVG9STUw4YXFjcHVLVEtJUWZGRzBXWVVp?=
 =?utf-8?B?SGFtMUR2bDY5dmFGVEt1NW9JRXZBMktxYm5TczMreUhsU2hxeDM3dCtpZEtM?=
 =?utf-8?B?S050dzlibGprbm1rOEdtbFdjZWY3bWIrM3dCZGI3V1J5U0RoMWcvYTVWYnAz?=
 =?utf-8?B?NTYvemh2Z1JBSzBUQnoxMHJ2MjFsZUo2Y0YzUkVBWnpxbTY2QXh1cUt3dWJ4?=
 =?utf-8?B?V2hQSk9PSGdBKzNKSUFXenUzNjdDVVhRS252NXBQdDBnZWZFYnFyYjBtMkJk?=
 =?utf-8?B?YlpUWSt4SDFnZ2VFYVRWY0dRYWRTNGJJT1lzUHJjZWdmS2dlTHoyMWFXMjlJ?=
 =?utf-8?B?aXF6NzRuWEwvZFQxWFNFNEwvbk93OWxjNnU0VDJJeDBrWW9LR1JpQlJiVjVW?=
 =?utf-8?B?dXZiVElWS0pVUjlVOHR0R2dkT1VwcDRrSTZjd0c3YXkyejlGMDlXM0tPK0sz?=
 =?utf-8?B?eHJZbngxMzV1bk5mVGZYQVV2R3R2WTZCSU9OcXlKM0lKdnN1eWwyZ2laZERY?=
 =?utf-8?B?bUh1cDFEbG1Pa1RlU1RmTEdURHpoZGkzWmNGS3ZsNVdrU3FhTjJyYmFXdmZD?=
 =?utf-8?B?cnl5Uyt4OEFjYWxBQ29nTmJXb2VZUG5Qc1FtTDY3VktNTGdWeDF4QU9KODE4?=
 =?utf-8?B?VWpETmorcWJEejd0TW1CRkRyY0NPRXNDZU5aU0YrQ0luRmpSUDNxaFpJUzZ1?=
 =?utf-8?B?eDNMNmpRY0Q0UThlWXV1T2prRXRicFZ1b0E5SHpGUUlDKzZZSmo1OGR0Rmth?=
 =?utf-8?B?WWU0VFI0cGJNSStiVDNOa3JCejFpSkxubWFGQk5iclFMbnFiakNLWHUyVmtq?=
 =?utf-8?B?cWhmY1RuNjc3NS9YaERidGk3SFZpV0RXQkFZQ2pYOHQyaWpCR1N3YjJvU2d5?=
 =?utf-8?B?QWROMENSVGVKcGVnT2pLNzF4cFVhZlRZR2dFQ3Vzd2xQT3VjS1ZmeGZiUjFr?=
 =?utf-8?B?QUdzS2xNRDVBVnNVVHd2M0xqUEtVUDg0YWM5d2RtZVVOY2ZSVWZ6T0ZkRElQ?=
 =?utf-8?B?cGErNE5Vd2QxdWJLVVJBU2dYajBSZEppTUs3SEVCdG9QZE9BOWJxYVBQTm9u?=
 =?utf-8?B?d1NTYXZmT0k1VDRXVlptWEEwNCtaRGc0TDBhLzhFTU5wZms0R3J1Mk4wLzBW?=
 =?utf-8?B?T01RMGJYZ2crcUNWS1JkVkhIS1M0SGlJWmx5YXltWEFwNytkT0VSYlY1SVc4?=
 =?utf-8?B?cHJjTEN1RUdXRFBjczJtMzhsanE0eDY3MGF4d0RhZlNxY1BzZnFjUXJ2eS93?=
 =?utf-8?B?bTArbVA5d0k4ZnVXenFnL25xOWluWEQzdkVPbTMxbDNZaTZVMXNpMDlRa254?=
 =?utf-8?B?Yk8zdVJiV3Jla1lEUEQrNnUyUW01N09ub01pOEF1K2xSVjlVMlFTTDhVemhU?=
 =?utf-8?B?bUtNQXBXOWdJNnBzdGp0OXVvb2NhM2g3NVdmMStHQkRpSGVHNmkzZXNvY01G?=
 =?utf-8?B?bnJNNjFLT3FEU211U3M5M0FiMzFQazJCM1NkT1pOSWxMcStreGRXL1hYWTVl?=
 =?utf-8?B?RlFJWWlpMUdHN2t5ZmNLY1R1OERvV0RZZ3BRc2syZ1dmaXZrNGNOWmRiZHJM?=
 =?utf-8?Q?o0PqV1Dr7VGit98+ZiNa2yktyc1X00A/8EUoS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17682485-26c3-444b-0793-08de4c3cd48b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:28:48.4636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tg2O2H628ysgr47sT3xA2p/txmwVBlz5zcbuEKv29hyYg0jdSFGoZFEENr4vWdnBRB1lnKT3myFrWIb9XjXb9tpvf/ooN4vyxLKlvj7ZILMAO0Fpekw+k5E+1eONV7gW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12153

Hi Biju,
Thanks for you review!

On Wed, Dec 31, 2025 at 09:08:54AM +0000, Biju Das wrote:
> 
> 
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 31 December 2025 08:23
> > To: Tommaso Merciai <tomm.merciai@gmail.com>
> > Cc: linux-renesas-soc@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.com>; Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com>; wsa+renesas <wsa+renesas@sang-engineering.com>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>; Philipp Zabel <p.zabel@pengutronix.de>;
> > Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; linux-
> > i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
> > 
> > Replace individual devm_clk_get_enabled() calls with the clk_bulk API and store the clock handles in
> > the driver's private data structure.
> > 
> > All clocks required by the controller are now acquired and enabled using
> > devm_clk_bulk_get_all_enabled(), removing the need for per-SoC clock handling and the
> > renesas_i3c_config data.
> > The TCLK is accessed via a fixed index in the bulk clock array.
> > 
> > Simplify the code and prepare the driver for upcoming suspend/resume support.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v2->v3:
> >  - Added define for TCLK index.
> >  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
> >  - Improved commit body.
> >  - Dropped unnecessary static const char * const renesas_i3c_clks[].
> >  - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
> > 
> > v1->v2:
> >  - New patch.
> > 
> >  drivers/i3c/master/renesas-i3c.c | 43 ++++++++------------------------
> >  1 file changed, 11 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 426a418f29b6..1b8f4be9ad67 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -198,6 +198,8 @@
> >  #define RENESAS_I3C_MAX_DEVS	8
> >  #define I2C_INIT_MSG		-1
> > 
> > +#define RENESAS_I3C_TCLK_IDX	1
> > +
> >  enum i3c_internal_state {
> >  	I3C_INTERNAL_STATE_DISABLED,
> >  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> > @@ -259,7 +261,8 @@ struct renesas_i3c {
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > -	struct clk *tclk;
> > +	struct clk_bulk_data *clks;
> > +	u8 num_clks;
> >  };
> > 
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
> >  	const char *desc;
> >  };
> > 
> > -struct renesas_i3c_config {
> > -	unsigned int has_pclkrw:1;
> > -};
> > -
> >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)  {
> >  	u32 data = readl(reg);
> > @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> >  	int ret;
> > 
> > -	rate = clk_get_rate(i3c->tclk);
> > +	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> >  	if (!rate)
> >  		return -EINVAL;
> > 
> > @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct platform_device *pdev)  {
> >  	struct renesas_i3c *i3c;
> >  	struct reset_control *reset;
> > -	struct clk *clk;
> > -	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
> >  	int ret, i;
> > 
> > -	if (!config)
> > -		return -ENODATA;
> > -
> >  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> >  	if (!i3c)
> >  		return -ENOMEM;
> > @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	if (IS_ERR(i3c->regs))
> >  		return PTR_ERR(i3c->regs);
> > 
> > -	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
> > -	if (IS_ERR(clk))
> > -		return PTR_ERR(clk);
> > -
> > -	if (config->has_pclkrw) {
> > -		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
> 
> This still an optional clock for RZ/G3S.
> 
> > -		if (IS_ERR(clk))
> > -			return PTR_ERR(clk);
> > -	}
> > +	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> 
> 
> This will break RZ/G3S as it does not have "pclkrw"

Please correct me if I'm wrong but:

Looking at DT binding (renesas,i3c.yaml) we have:

 - RZ/G3S (r9a08g045): Has only 2 clocks (pclk, tclk) - see maxItems: 2
 - RZ/G3E (r9a09g047): Has 3 clocks (pclk, tclk, pclkrw) - see minItems: 3

Then:

ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);

 - On RZ/G3S: Get 2 clocks → ret = 2, i3c->num_clks = 2
 - On RZ/G3E: Get 3 clocks → ret = 3, i3c->num_clks = 3

Then I think there is no need for config->has_pclkrw flag anymore.

And as:

clock-names:
  items:
    - const: pclk
    - const: tclk
    - const: pclkrw

tclk will be always 1 -> RENESAS_I3C_TCLK_IDX = 1

I'm missing somenthing?
Thanks in advance.

Kind Regards,
Tommaso


> 
> Cheers,
> Biju
> 
> > +	if (ret < 0)
> > +		return ret;
> > 
> > -	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
> > -	if (IS_ERR(i3c->tclk))
> > -		return PTR_ERR(i3c->tclk);
> > +	i3c->num_clks = ret;
> > 
> >  	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> >  	if (IS_ERR(reset))
> > @@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> >  	i3c_master_unregister(&i3c->base);
> >  }
> > 
> > -static const struct renesas_i3c_config empty_i3c_config = { -};
> > -
> > -static const struct renesas_i3c_config r9a09g047_i3c_config = {
> > -	.has_pclkrw = 1,
> > -};
> > -
> >  static const struct of_device_id renesas_i3c_of_ids[] = {
> > -	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
> > -	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
> > +	{ .compatible = "renesas,r9a08g045-i3c" },
> > +	{ .compatible = "renesas,r9a09g047-i3c" },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
> > --
> > 2.43.0
> 

