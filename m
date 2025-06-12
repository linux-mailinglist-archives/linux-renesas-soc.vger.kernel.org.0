Return-Path: <linux-renesas-soc+bounces-18176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D652AD7021
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3F91BC654F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 12:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524ED18FDBD;
	Thu, 12 Jun 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lXG1ToSP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0A2F432A;
	Thu, 12 Jun 2025 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730843; cv=fail; b=HCmmICQsQjMEe0LcRcQOdBA8UkKRGthCrermZEORMIcDS4ABYvFFDWM/cNStosQ7HF88XXMpMRk54xQDwfskE4rszGhnbbUon10Y70EmkXC8tpLC5UXJgoZvyYo1xaTG5iV7Uv1T7n8bgjz63UHiC/99n8IPl5dxCxK1IlP7hKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730843; c=relaxed/simple;
	bh=30C9h/cEOKsHSCGtJyRvcTK8sYx2OnTltjjIvaIdKEQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X1xOsaR3AIW935PFcUcWVlkQ+pYd4kEx2XXuEC1RsAG+N26og1aeNbedEyuKmJDLI7lY7qAI0Hzm3Ce/KrIdSNTJwgvopiJ3UBXTYG5nDXJPrEfyE14IS4fjdefxx8HcS4EfHb5dsuSxeZVJmW9CRnRP5qxolnfqPMLMd6Uwmzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lXG1ToSP; arc=fail smtp.client-ip=40.107.100.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbDJwWIJ4IJKSAvSpBySR98hR0WCaICEsLsrfSL7NH7FujI6Ogv9SuDog9ja4frFsuxOj0edn4PxK0lfsHWTGEHkMOTm5/I1EgObMs5LvVF0mW9OyB4SNLhGqjFHwPtOWE7vrADYIgD1Rc38xuzqdLB1dj5QozbOYiqZ9S06NZJt9jTEePK8FFWdc3tSWuCy1CwVSDW0s3fPt4ALmiawFUjG50UYAyAjYU8lwKl/hoqxsB62X7SUFYdrHmJcL1cP9VwjrMU132YRT0MKWWjusZ5HGn3zle71DVG/ru42stXMfR674pJspeLRzhMK1mo+GqmjCLhuh+zUbchmiTS3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XgYN00K2y9REaODNhDsBJw+tS+KrqunYn7zUsXQSmw=;
 b=jl6jV0YrBWRNR5lEeiSENhhdUbfkJ57hNtnVbBVqRCeqgPo75/d94Zx3LS1LODDg0ftJIKbNMtQMo3VPazgTzSy7X5d/oXUefL25rJoegCaa25khF1YqtUmhMkp6yTgMf0zg+VckcA8VcMn3IiqdcpoUuEHvDe5Gg3gh/QMy7HWNE0ISUhuYhrJUZf8NyW2tvdq+Wl1ayMhr42BtD/TbufNFpVqz7vXFnyMKcAh8zQ2jRB1aStHlZ48LTqpEfd0XmSqxrtmeSFAzSkt8PhUfDukw8xYNJ4sVplBI4msT5IAq/cGblWXMuM0LDgcu0BhJLkMdU48WJMnETABxHO/XfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XgYN00K2y9REaODNhDsBJw+tS+KrqunYn7zUsXQSmw=;
 b=lXG1ToSP708ee7+SdpOUi9SlLKGsx4L1vEtmpItJP9IeyMfc/6WHV8q1ASrhZEQClxCpUvllNTeYX0dIWX1a/RWNq7aHaqGgoFfMe86pZmkhg9/P2rp8HM6lbketNh4A9T40n/YNbNbx6zyoLvJB3J3rf7GRHUuzsrxmxukcGZrczrgKKHqsEt6VKIqFDQtIYj3Pk5WrRZfbjMI29HaWqi/yP+KjD7RyDAvMuh0Mxhq9Cq5Do47i6DTd4PIPJWvenpyORcNOXPzeVGnVDH2VPhaonxpkW+agFHPe8vkOWcBvd5AdFYo1Aeds14pQ5cxDNdntwPbobAXF10QRfoPeUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 12:20:37 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 12:20:37 +0000
Message-ID: <d05f2c03-fa86-4fc6-9b81-1a7b5592c2e8@nvidia.com>
Date: Thu, 12 Jun 2025 13:20:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWhwJTbJOBhKmC9YUaSebBg-9m7euqmxqJLCXdr6++siA@mail.gmail.com>
 <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <bdd989b4-a572-44c2-ae7b-2c445c09fd7a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0002.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::8) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 3265c71a-25bf-42e3-1637-08dda9ab89eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djFqYXVPWUJXUlFndnl0ekI2OEU4L080WWdGdGxtT0RhN0xuYkx6dGYxekpm?=
 =?utf-8?B?Zk9tZkZKODE0ZkJ2QkpNK25mb1czZ3hPWlo5N0Yxb3BxMTBtMG1oSDZhbWZi?=
 =?utf-8?B?RFpmTUdqSlk1SHlGZy91Z2hHQ3NkMEM1amVOeXVvWWhGazNzWC85b0RVMnE5?=
 =?utf-8?B?WGV2T0NHSTBsK0o2STRCblJIeHhPSzdoaXpLVHhpOG9idGlXNFdNNFFIZnBp?=
 =?utf-8?B?TGh3MXFoY1lJM0lZYXUyY3FINlg0YXprdThEM21KWXQ3L2h3emF5dFg2Ym83?=
 =?utf-8?B?ZlIzUFFkNWpoVzVmU1FHS1ZmemhTL2lLVFgvL3k0ZE1VTjhTK0huamU2MXFL?=
 =?utf-8?B?eHdaUEZtVU9pR1VSM0g0Smh5cjJLdmNJR3ZWa05PQm5yaDZabkhJc0lwRUtG?=
 =?utf-8?B?ZVBrMTdHMGFYdGdYazFaanVRUGozcnduVCtGbzZ3RzBlQzhLMXUrRUd5b0dr?=
 =?utf-8?B?R2YrS0VnT3NES1B2SjhkSHhDUmFMQnk5RGJmLzkySGtBcWE4Ujg5am81a3ll?=
 =?utf-8?B?Tkg0L0ppS0pXRFNvQmRvQ0V5b1RtTkFrVGtLQ1FLdC9NUVN0azZ4RG0vN1FZ?=
 =?utf-8?B?U2dNRmFNUHBvaytzQzhYUFhIUDRob1lnVlJqTmNlTzdBZ2R2aC9xTng3WlF4?=
 =?utf-8?B?MDkrTlR2V0I4alZ1Qkg2Tmo4dGl2MFZ3aGdFYWRTSmhQWEV6WXYrMmJDOU1u?=
 =?utf-8?B?WW8xbG1kMVcyWGNtYzN1b0NJbzlsRlkyMHltWlpYUjRnaFRPUEdGZjlUOW94?=
 =?utf-8?B?RUN3dGVjeUUxS2NDZm5xM2JOZyt1b1FEcjdpRHFsRjZvZVJxZXdKNzlRWUNV?=
 =?utf-8?B?ODBNNjVkYVdSMzZ0WHJOenljd3YveGNSdG9LZTVxbDJWWXRSNXVacFNQQXR1?=
 =?utf-8?B?TG5yMUdkTXRVN0Z0UW1UT3VPMkV4SVdneUtkT1NrTldxK2RBTDhISGc1c0R4?=
 =?utf-8?B?NWFPOE9WWGNVYXJNc0twZEZvWlZLeDNDMVNPN3ZtUXdEVXdvZHdVRC9UdlZi?=
 =?utf-8?B?VEl5YXZrSEY2T05YdXRVQlcrVDNwQ2lwZUVJdGFpMUhyd01lMWp4K3FzMjc3?=
 =?utf-8?B?bXJFa2N0QlJvSzF3VDY4VUpaN0M1YjJTdkFiTFI3cHFSZmxGZDRYQXhyTHFS?=
 =?utf-8?B?RWxGNGx2OFkweUdoWlJ1enhhRkJlRXovMEhESWF6cjhhSERLTmhON3JTMTZo?=
 =?utf-8?B?NzBGc29vLysvU3BSZU5meHhMWUd0djQ5Q1UwTWlYT256NkgwYVNJOFdRemg1?=
 =?utf-8?B?RHFnYnFMTTJaVzZDaVdDTFVLZENiZGE5S281aEF6dlBDSmpyeGY5cUdFYWZC?=
 =?utf-8?B?b0VnaHphbGFHTWx5eUtnVnIrV2p0WnpUTUFhVStkOFlvaXNSM1VpZTMrY1RI?=
 =?utf-8?B?VUJ3WnZiemVkdm5lY0xtUzNNR3hpUTY3SEs1eXprWEhXUUwrT0liOG14Y2JF?=
 =?utf-8?B?ZzBYaVpBNDRvZFMxMEx5akZrSS9BclBKTUpVcEpzOG1nMkorNTR4d1QwY292?=
 =?utf-8?B?cGdhK29ONUFLRmVhNlFOUWE0WlVwMVhVcER6eC80ZVhqQUpEZVovSTIrSkN3?=
 =?utf-8?B?Yk5lcy9yZ1JFV0N1MHNmb0RBRXR4NUM4QnkxbHpFTytpYU05VTUrZG83a201?=
 =?utf-8?B?VExFSlB0elFiMTZheVphTTR6TUFPQ0hMaTVYeHJGNk5mTWJ4a28wc0tvaU9R?=
 =?utf-8?B?S0I2Vk1hM3JHaXJoM0hRNnVkNHJ2a203Ni9ZaEwvK3FJTHNQNVplQ29iNGJl?=
 =?utf-8?B?dkhNOGNDQnljajhUd2RaRUhDTGkrNGNKTWxYamJaWnJBUWVWNFd6alBaNmtP?=
 =?utf-8?B?UVY3V0Q1R3ZmckgvdHlmTWdmSVNUQmd0eXlNenJuaG1VTG1pbzU3WkFleUR3?=
 =?utf-8?B?cU4xODhZU3dERXRUeXFyczVYcTNNMjF1NTFrTDNsd0Z3eVhNNTU5SVd0cjR0?=
 =?utf-8?Q?Mlk5mmYrXi8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFY3eDdJODhXZTYycHVheXl1MXBoMkN3WkVQLzBGTkxITEpjd0NhOGN5ajRh?=
 =?utf-8?B?dG0wWXN6TU5BbkRLUGxDRzlGV09YWklkRk5JKzQxaHF5dkd4UGdBMmt4N0U1?=
 =?utf-8?B?ck1sT1k5cEg2RE5IRkIwV1l5cHpmbUQ2R1MvZEZQMkIrK0V0bXg5N3Z6eDRL?=
 =?utf-8?B?ZSt4c0hNUWNkN0Z0ZmFhdXNZVXJKazB2SndzbUZiaHYvWWdJTHRsVmVVRkR0?=
 =?utf-8?B?ay85SS9XSjlUZkRXTWNGbFREdFUraDYwb3ZtNCsreHhSYnpDWGROV3hPV2NJ?=
 =?utf-8?B?SHU4ZXVMQTQvRkxUMitaK0MycDNWZ0ZDS2k2ZWxreUx0UkVaclVGS09WdzFQ?=
 =?utf-8?B?RmlUVU1FR3AweXd3YjdLMU9xcG0xODBRRmdlNUVpZmVnRDlRNjkyM2hPUVE3?=
 =?utf-8?B?TTFvUEVsSG9JdmQ3RmlxaXMxR3ducy9ROVB0L2dPcWNIbEZNZGRvMFV3ZlRO?=
 =?utf-8?B?Um5xdEdJNXBiUnZtSVExSzdLcUltWlpCUGNUZGUxRzREWTJkNWYySnVaZ0dx?=
 =?utf-8?B?OEJrTy81T29kVzRyRUppK001T2pFNTRBejRVOERQR2x5VDYyd285UHJDNmc0?=
 =?utf-8?B?QnF2Mlo3S3VBcS9hd1JCSStjaU5rWGprckpyQkVvMGZHUElyclVySldFRkVC?=
 =?utf-8?B?S1kxblFvc2xZYnlQdE9DOThTR1NSZHZrSVpyTXBCZ1Z1eWFBRnRVdzZmTDhB?=
 =?utf-8?B?MHhGZ1Y1ODRjNGdLMFVoeDNSV0xlQlNCVjl2aWY3STF0OHJEb003ejlHdUNB?=
 =?utf-8?B?UmN5Q3E5T3FFM2dFR2FsU1FvbDNpR2FBUHlGUnFkd3k0dGFMeWhCelE4Q2xZ?=
 =?utf-8?B?ZWpaNEdCd1pqR3dsL1FPeVBJYXhVcDBBdElFakFFaTQ0dkFUM3dMMmlMVmpp?=
 =?utf-8?B?amtSTkwyY3JxSXB5eUpocHJQQThyR1Q2NmZZdDJXMXd1aUJQL3NEVjVKbUFH?=
 =?utf-8?B?R3pFR1BCVVl0SzVQdGhIQXNVVnlUTENHSEdBZU5QUmwyRmwzQ1lnRzFIZFZ1?=
 =?utf-8?B?ZzFRS2l4aUZHLzk5SjhIS0ZzSi9zYUdJMzhpVTJEckdZRTh1aGYyeVZPckhK?=
 =?utf-8?B?ZXg1MnpWVEEzUnAxTUd0bFhoMkZwbmNGRzBlNnhrNjVONHlCNXZKSFc5NjlC?=
 =?utf-8?B?QzViZ3lFMXVrOWNnY21vR3doYUdJeXV4VHpGck9KMi9oVnlid3EwUU5yRWNl?=
 =?utf-8?B?ZlNOWi94RzAyc2FoMHBlU1JUL3lIMmdpc09BTFU5ZEdDMWUyV2dDR3Z0b05V?=
 =?utf-8?B?WTBIa000THdXa0Z4c2FsZVVzbTZuV1NoV1VGeDE0Ymg0SUVxa21BQ3JzMTZk?=
 =?utf-8?B?L0RXLzdxU1FFejRKMW5yQXhYTGhjVlltUEJzeVhhWVNPd05qdktPbVc3aFlh?=
 =?utf-8?B?RDZxZjdkOXJOTURqVHRsM2ZDMnl6MmppZVNySE9pNjB0L09NQzlhZ2NjYXdH?=
 =?utf-8?B?UklmOFM3MzlOYzM0bEFON25OdjFMcnhocDZlaWhyZTB6STBVanJLVzVTMnBz?=
 =?utf-8?B?T3pBQUI3NEg2MktSSXFoZ1pQbkZWc0xycHVtSU5Ub1QyMkR3VjRpWGExbVJK?=
 =?utf-8?B?NmhhNGFWMEVySVVSRk4yTzJ6SjdKaXppOUJkVHBPN1pFTHBaOXlQTU9kcEx4?=
 =?utf-8?B?dnJFcWNRM3pUQUJHVUJMS2QxVUNvTEdQaS9sT0JkL2krc1d3ajNUY1NuTWV0?=
 =?utf-8?B?SFBMUS9NeXdwUkVxRHRiWmNLMUFKcnByUUNOUUM1QWdkRVl4Z1pCaGg4VTh2?=
 =?utf-8?B?V3pyT3YzZkxQM2NxSitzMzJJVndIOU9DbmRMa01KMXE5NWM0b3hWVFV3aVJn?=
 =?utf-8?B?N002UytKSDJHS05yWU0rZGVIK0lVRUpvb3JCNTBoUzZabVR2bWtjQUtPWFYz?=
 =?utf-8?B?WURtL2hiQXUxcmsvQUlFTFJ4eHAvcVN6YkpUenlhb1pvcytMWXcrT1RJWlhy?=
 =?utf-8?B?WHEwSFBtZFRWbTVZa2RyaVY2U3FCVzhEM1FnWWFFOUIxTmx3Y3I0dUZtWHJH?=
 =?utf-8?B?R2ZUaFY1MUFPYXQ3cHdOT0FYQTZiemJsc0VsZWpSS21GWDVPcVo1RFhXeGJ4?=
 =?utf-8?B?RUlpQmJLdDFhcm50RWREYVV0WFhjQzlzWDdoczc3azJpT0ZxaTI2Wi9kN1l5?=
 =?utf-8?Q?hy4k/5P8jjU4SdzirQPB6tPqu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3265c71a-25bf-42e3-1637-08dda9ab89eb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:20:37.7176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOWVhNft5DMlUNp0//+YgnopmfYDYAvCq8CPHO2MKQHdCDxOKnSmPZ5EAFgM4y2KzUBhlWtxjWPDB9SmgnPX2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406

Hi Geert,

On 23/05/2025 12:54, Krzysztof Kozlowski wrote:
> On 23/05/2025 13:39, Geert Uytterhoeven wrote:
>> On Tue, 6 May 2025 at 12:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
>>> ensure the Ethernet driver is available early in the boot process. This
>>> is necessary for platforms mounting the root filesystem via NFS, as the
>>> driver must be available before the root filesystem is accessed.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> With this change, the Renesas RZ/V2H EVK board can boot from NFS
>>> which has the DWMAC IP.
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> i.e. will queue in renesas-devel for v6.17.
> 
> With my Nacked, please.


I was surprised to see this change in -next. We also use NFS for testing 
and we use the dwmac drivers. To date we are explictly building these 
drivers into the initramfs but I noticed that that is now failing 
because this driver is no longer a module by default. This is easy for 
us to fix.

I do agree that if we start to build every networking driver into the 
kernel it is going to bloat. Yes I do see the kernel image growing 
regardless of this, but nonetheless it seems better to just build as a 
module IMO.

Jon

-- 
nvpublic


