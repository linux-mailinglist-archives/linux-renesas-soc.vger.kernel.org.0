Return-Path: <linux-renesas-soc+bounces-28431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLccE2KvnWmgQwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 15:02:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0F2188224
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 15:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8204A300290C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 13:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2165339E197;
	Tue, 24 Feb 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ogimq42r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D102874FA;
	Tue, 24 Feb 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941284; cv=fail; b=aQTMfU3wXvTpa+HgC92D/nFa/tF1kJBu3BQKQEnPoowAzuKQ+PLv1M7LxEa7sq9OtQC0KI446U2Mw0YQXcCLBCY3UZwK69m+4jgZfmviImrXTacijGHDq061Ke/k/laMjSHRTXeLH4EyY5dUoBMwn7garhppXJopa0I4sNZMdxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941284; c=relaxed/simple;
	bh=FLcUppa6wUOegBd9WWrHpg0MgfGs2yJfIEdUJcl/qu0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EhxBysXoXBhYYMQ/4oik10sFRutyoTPAkmO+Bcxfy4+5M08lNyylH8tUm1OxY6FLumrsDgkUmvPLNaF5mUP5x9Xw9dtJbUiQaMotkgEOX9G9TDYoEHbhv4+m5SY6VFdjIulwo92GeLLs8YrWRERSpdcpk2rVtwBc3cm476RUb5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ogimq42r; arc=fail smtp.client-ip=52.101.56.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQ0jEeaKEcMGvN6vy4fvB0AzTr0pz+cm9HAv9/GhF3i6eYkps0IDLqdwWNarRXLpIyJF8i162SEAfd8PfRngBCN+z5fsPtIHvgti7obndXz9u44TuN+cLbSLYqlHeUz81cPw49eKzjEI+1V8rVzXlbELMQ0nkwcD5I46uSWI/ToG/HNF58JN40eo5OzxCVPDPHfXm6GcClV8UtGCY6fTeNJ/UMIvNdvXUMzf1Hjf2Y2pAu/5VPKQ2pLvzWQJirx/V97qsFHg3jR0qLjeAObKQ7+dKO5fO5suBe333Q0TZ5+qPx5N7Z1NOhxPxtEuLS9fh/puwHKdPRrLz+C5YRjVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaW51jJjDmSDfiKtxHpqoySjpn5vkTtYcz3NNtoe3Hc=;
 b=m9rIGaN/nsB35mtY4c87oI0YDjft2o/Kzs4g5INWOhQNfv4YZvu23HnmDJvq44LP6DlLE74xME8BoTM33RMU1xfya0qnJzA0ELPvqwQPnBSMZA8n0vy9nCvrJUC1k3sKWWjMod07/R3umw/yKgqyVMDDdYsSao81a5yyu57CCjF1ZjP+GtiFW52iOVNCSbUN9WRNAcJq5ANMoSUyf0z8GTb7jDTmv43YuUpMoOztjBs4aUFmVba8xrA/8zVKaePK8cMcCSCugRbrjK5a6iLIA3tBBZ8EAYOKqxSH2anorhpkBFO9Mvqfqwu8qAaiRWUtgqTPovQhz22uD3v3iZhpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaW51jJjDmSDfiKtxHpqoySjpn5vkTtYcz3NNtoe3Hc=;
 b=ogimq42rRGg0XNS1yW5LMbHtYqk9K+vFSoBk34Rt8WaZpt4njMpK5qnuAVWSRiGTI+zKE2zK5bguZJrjQX29L+R8QYkgG828zUf1VDrV2cxeHKT6rXQ42GRrlUzNYt2SraJatv87wGD5J3DrDIuurR7dFtgW1w0B+S+Xjr7gja+MWqFKeYRWsyKK9lpdp1Gocw/Ww6w7QydxXghF8im2/GEo52clpM4Q8Wjl3lUBwzeWeLI7UVybSdYacCnyFu9sOHRk7P7wc+511+X3r4QGsmdKpVdOFOr1lhSBxiH9EJEzzFWxPvAh58eWcB+tQjK506/kyyFxGpEV/+0mwEpzoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 13:54:37 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:54:37 +0000
Message-ID: <efd07d25-4db1-4fdc-a6d9-f6f16ae8a37b@nvidia.com>
Date: Tue, 24 Feb 2026 19:24:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type
 BAR_64BIT_UPPER
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den
 <den@valinux.co.jp>, Damien Le Moal <dlemoal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810>
 <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
 <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::11) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 06af6719-362e-47e1-aeea-08de73ac3f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDNtVEhBQVJpMC9zVnpUNjdnV3UxOFNqMVBUdTRMV2FEd1ZvQkdpSzE3NVNL?=
 =?utf-8?B?aWRDNW1GNHlSMTVGaktVcElCVHU3ZDZPdWc2RlUxNG9yMXE3OWR5azAxeTZt?=
 =?utf-8?B?cGJxZWdxVHZ0MzkyaWhhVTdsLzk4bjJSamFTbkRkaW5DWlBEbkF2UVd6VFJp?=
 =?utf-8?B?bzFhdEwzUzR2STRBWDJ5VkIycnIzdUtRMVQ2QTR6VStxMTVFRG90SndsMjRa?=
 =?utf-8?B?VWMvcVhYaDQ1VXM1T0ZLM2t3VFNIdmEvVU9YdnR5N0hJWlAzOW81OTBXdWFK?=
 =?utf-8?B?ODlXMCszNXBSaUZ1dmNuVmgwN0VuNEIyZXJWREdUYnlhR1ZWVC9pSWg2azBV?=
 =?utf-8?B?S0tEbzU2NWJJbEQ2d3g4emRmQmltQm1zM0taQ0VlUzFDV0RGVFdCaU90VEh1?=
 =?utf-8?B?RldBdGlRcGxDb0s1VGo0TW5jeDlIeUlKY0wzSDZoZEw2QzNBT3JzbVpHZGxF?=
 =?utf-8?B?Y2p6ZWY0V2JINTkwbFFUblA0S0FvTU1Eek5sVUVHTC96Qm94WDIxNG50WkdL?=
 =?utf-8?B?UXRzUU8reTMzZThGdWpLbGJIVnhBMTBZUXN5ZXN5SVIvVEVqRXlaZkZJNU5r?=
 =?utf-8?B?ekM5Z25aRGpaOU93bTNCbloyNnNUeklJYzZGNUxYQTFUd01rOEc0bXNWVmtT?=
 =?utf-8?B?azJVVWswUFhnbi90WUZDV25HNzluUnZsMzV0NldXUko5UTh1cUM3THptVllk?=
 =?utf-8?B?VjdhM0tBbEJkTURPdWx6QmN3UkQvTXFrMkd2bkd1aWRXNjNSS3VZRDNjR0Nr?=
 =?utf-8?B?bGpBUVRyWFZScTgwenlIZTBMLzlaSlNnTlNielJmTm9kME56YWtlREEyZCs0?=
 =?utf-8?B?WUpqVnNzcFQzZFhwTndPRGRCZGNGdHkzM3k0VFJQNW9CSGZ1K2l6dG9TUnlO?=
 =?utf-8?B?U3ZpQUk5TVM5SlRXU2JCUTQ2eXMvVGFmUXZNK1hGY1gvL0ZKbWRnamRHSmMv?=
 =?utf-8?B?Rkc0RS9BdlFEb0lsUmtHZTJTZVpjcEFoam92RGVFY3ovK1FBZmNvWmhyLzg3?=
 =?utf-8?B?b25pbFY5YlZTM0NDVm01RGNFRThmak50alBTZVNKMzNmOGVQZmM5UjVOcGtv?=
 =?utf-8?B?SmxwZm42dWZ1SStQU0R5UXR2UDFHRjhhaUlaVWFFNmJGbWRHY0hFazl6eWFM?=
 =?utf-8?B?d1pCMmUrdENUTGpTcGxVOXdWSzc5Nk5LdHRqK09kWjY4UjVkWXBmK21wM2pw?=
 =?utf-8?B?V01qV1BWZDlYT3VJbk03MWxKWWZkazcxbGRsdS83cFE2WjVGeUM1d3dzaVN2?=
 =?utf-8?B?MitoQ0RPOE1xNldGcUVEY0JuYU9LQzlKTm8zcUwwN1dOcnMrSGVNNXVidkFt?=
 =?utf-8?B?V3hEeW1yZkdVRDFNaTVucnZ3S2xkTTltNWlnQWVTcGthRmZCTmdhYjhQRGtn?=
 =?utf-8?B?VVBhcmZJbW82YkRwNVMrcVh0ODN4QUJUWUVsUWlrSjlXK2pUZjI5QVpZMUZL?=
 =?utf-8?B?QmFxeVcweGZrNTJoeXRETUpRWENldGJvVjhpV0xaS0I3RHhMY3Brb2EwMmN4?=
 =?utf-8?B?b081dkI0bkNia1RZTklvTS90bS9JRGh4S2RaM0ZFSkRoUnBrZ3U2Uy9JS1pC?=
 =?utf-8?B?TjNSTTBKbnhMaUZLVkdqNzZGWk1GSDg4a3pzc1V5VnAxWDBnUzVWWDJXNXdW?=
 =?utf-8?B?cEUyTUdNM0hsbzRvSldKODNoTzJ1V2c2SHU5S2E0Z0VZUW93UmI5ek9VS2lp?=
 =?utf-8?B?VEpyUUhON3ROSG9jWmp1RitxaWFnS1BUeWNDVkFxMzltVGFnWm5oME5nc3d0?=
 =?utf-8?B?NVF0TFU2SmdjdnJETVZDbFVNWTlCeEtVVDRUVHR0Z1FyU2dyS3JNZWw5NjFl?=
 =?utf-8?B?S2hzQ3IwekVTVmdkdzQvS2dWNzU4ZXZuYXIySmR0U2VmWlBDMzhyZEFPaWNE?=
 =?utf-8?B?VEpLWkdDNjM0SDNYS0p6MHM4RjZtcGlyNGR0ejVlc0MrZjhxNE5kRlBCbURG?=
 =?utf-8?B?ajdOQjNHZ1RsQm5QWmVYZWRybjVGS0NRZE5FY05PbEJpdXR2VTQ1ZzR0YU5E?=
 =?utf-8?B?SG5veTJBaEJJREw5WjE2blVlcnlRSTFPUjNPckd3MkRFTjREWGUrMXBFTmd1?=
 =?utf-8?B?T1R2Zk5KK2tvMnBxTnp1MHJPVlY2ZWphMGhtUEh4MjVMSm0zRFZGSHdrdUZP?=
 =?utf-8?Q?zqjI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXk0dzF4dEphYk5ManZKOTkxQ3hhb2QrdEpHWUhnT1c3M1ExMUZuMGJ3amFs?=
 =?utf-8?B?THc1NzQ0S1JLUVFVR1lndnBvRldNVzdPelJqbzd5bW5ISnBUaVp2dERxejB0?=
 =?utf-8?B?a1JDRGF1cUx4dXF4MjBCYytiWHJuaVNPQ2NnanZiSFhGWDVzZWxXSXlZeGRE?=
 =?utf-8?B?YXI1U1A0dndyNjNoZTNGTkw1dFlzN1pJeERBd1hzOFExMngzVFg4MW9uOVF0?=
 =?utf-8?B?anpJZWJuL1JITEt2a09rUHlLcUdKd0EyN0RQOHBjNWJxV1ZwVUwwakVnMVRU?=
 =?utf-8?B?L0tCQWRXcmJ6YS93RVFIb2prUEtJYzhLMDU2OFJkaTk4TExzY2Q3dGl5TUU0?=
 =?utf-8?B?QVp4SkVOeVFRelQ0S3VXa2l1b00wQkZzSmxQMmdvNVozdG5xYnhsWlJlckg1?=
 =?utf-8?B?WWV1TU04Y1hOa3gyaXluaWVtNXBJZU1SRkhHT1V4Y1NrTXh4NDR0a3B0eHFK?=
 =?utf-8?B?RHRHYU5Ec0YwM0JaRFhIYXVqaFpxSVlPMkg2bktKVmROUnVWRUtnblRzaGdW?=
 =?utf-8?B?MkQvdzJ6RmhDNHRJU2JIYkpIMm9WM202NXJvTlJjTXRucUVYdEdTalc2LzM0?=
 =?utf-8?B?T213d0FzOVpBVDkwNGhObStyM3ZNeFhSVCt5SGlxb0toeCtXNVA3V2x2Tk9J?=
 =?utf-8?B?eTR0UVdFSVNtZHhSS0thU0xKbTZhaU5iMlVIYkpvZGdhL0Q3Si80eWh0NDdU?=
 =?utf-8?B?ajVvblFNZVJjbWgrc0IyeGNuZm5lcGF3dnc2N282ZkJmVEhqb1FUb2QwLzQ0?=
 =?utf-8?B?REJrRmJTcTFXeVdodGtWVzAxT1FzSTN2a3VNWm1rcURiSnk4Y28yV1E4WHVm?=
 =?utf-8?B?aTlSK3pSUHUyRDdTZFEvNlRSV0h0aVczeTBkaEloTUFDUjMvTjBQbS8zY3Zh?=
 =?utf-8?B?ZlpjL2Z3MWVqRjQ0QTF1Z3NzbGcrQ2h3NVh2cnptZVJYVExEVnVVT1ZlWDR1?=
 =?utf-8?B?UUhYZEUzam1BQUpaYTQvNXlBcmxzNUlFTlhVRHcrNUxqWk05SFh6dHlsUTZJ?=
 =?utf-8?B?WGpuK2MrVkxtYmVXN2lCMmZBUVpVeHRWeUpXRGdWbm5hTkZiU2RXNEJ2b2V1?=
 =?utf-8?B?YWQxN2I2emp4SXhVaGJyVURDS0VvOVNpWWNZNlZKK2JZdlVNSjlicE5hU24y?=
 =?utf-8?B?R3BHTFp2S3NXQzhzb0lkWVAxZ1dId1dIUEFoNUdDRllUTDNDRE4zTS9HS2RZ?=
 =?utf-8?B?SDNmKzF2bjZBYThGaTFwQ2MzSitkN1lYZC9tZ1AwM3hTZnFPc21SaE8xSG5T?=
 =?utf-8?B?WkJLVmpNSG9iT2JTS05pbmNRNVFkaXJTUmc4eWRFTi8yYkpCWWVOQzBDUEl0?=
 =?utf-8?B?bWhPMU1jcmd3NTFneElIekVSOWpUK21Nbm05eEppTlFtWnhnYmFZbHg1QkFo?=
 =?utf-8?B?bW5xU0l6NnpRbG83NUYvM1p3YlZ2RXZBamVuaTFINXNEVW5ZTmxGcmlIK1pO?=
 =?utf-8?B?U21SeGJFUHBnN1Mrdm5icVd6akJ3eENtN3dtclZLNXc0NytOSkpTTTRnd00x?=
 =?utf-8?B?cFJ1cGN2U3Ywb214c1pmR1VTK25DSEFWbWwxM0pLYVBVNEpISWl2aHJMNHhS?=
 =?utf-8?B?SURoQ1JIU0ZpR2tIbUtUMCtPWWI5OHVxaHY4eGVsQ1VDdDhFUGVnWjR2dzI2?=
 =?utf-8?B?VkE0TWJndzNGK1UvcE5WYW5zOWhmdmJSdVJiSkVMK0JxR21NRzdVbFc1aXp5?=
 =?utf-8?B?UzRiZWtKY0NaYkdRSGpqTldtNENScUtJdldUazRZSmlWTndhQXNpNzR6TXpk?=
 =?utf-8?B?QkRQNGpkeUNOb3RkOFFkNWJ5OGgxa0JWMkZEdHo4QWhCZE40dmJjWjhjb0Rv?=
 =?utf-8?B?SnpycmVUNFk1eDNKWmN0dGVDaTNBbG1JNk56ZXYrZHo3b3pjTTJzOTZDSUxn?=
 =?utf-8?B?eVpVNzlwZmJPcnE2R1lJTGN5R3JYV3BZY3FSVkw5V201M29ONnMzVlNmYU1V?=
 =?utf-8?B?Rm5Eb1dTS0J5dWFqeWdYRlB1UGNQRHRTWnNkSENlWlFscENncXp6dFZVRDBQ?=
 =?utf-8?B?VWlEVXpnZC9GaEM3Si9vOFlqbU9yQkFMalgrVE5Zdlh6WllwZjJveHM1L2dp?=
 =?utf-8?B?TzdNRGorWWJBY1dyU2N3REw1RnFWcHd1UlNwQUlQZnJXNEpRaTFBYnJHNUYy?=
 =?utf-8?B?a1dXQmdRc2YzVE9IK1BHb0l4VjhRZ2N4ZUREWXFlTUxiSTNNaVNJRlJqd3VX?=
 =?utf-8?B?ZHU3VVJFTkswMUxORkdHUFlOQ3BqSUtBZ094Rll0dnNwR2x0dGg0dTBnWitO?=
 =?utf-8?B?M1YxVUVVdXVlL2FmUitORkFjYkpvTjRxWU10cU1KUnlaWm0rZXhkVW1Uc05R?=
 =?utf-8?B?UCsxNlpNQUNaZlRDZFVwS1BrbDd2cVhCd2hWMitEcCtiaCtXVDFiUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06af6719-362e-47e1-aeea-08de73ac3f63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:54:37.2309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dYdaVXNRux2WfutKSwNRGL3AnqGhqXnl88kTXhRyJRfNAk1FYkGLY33DDHrhLq3vVQbm+5RGFtanfhc+XZw0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28431-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[Nvidia.com:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaddireddy@nvidia.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[mmaddireddy.nvidia.com:query timed out,cassel.kernel.org:query timed out,frank.li.nxp.com:query timed out];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE0F2188224
X-Rspamd-Action: no action



On 23/02/26 3:44 pm, Geert Uytterhoeven wrote:
> Hi Manikanta,
> 
> On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
> <mmaddireddy@nvidia.com> wrote:
>> On 18/02/26 3:27 am, Frank Li wrote:
>>
>> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>>
>> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
>> BAR_64BIT_UPPER from BAR_RESERVED.
>>
>> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>>
>> This makes the BAR description more clear, and the reader does no longer
>> need to check the BAR type for the preceding BAR to know how to interpret
>> the BAR type.
>>
>> No functional changes.
>>
>> Signed-off-by: Niklas Cassel <cassel@kernel.org>
>> ---
>>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>
>> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> 
> [...]
> 
> Please do not send HTML emails to the list, as they are rejected.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

Apologies, I failed to realize that compose as html is checked in
my thunderbird client. I fixed it now.

Thanks,
Manikanta

-- 
nvpublic


