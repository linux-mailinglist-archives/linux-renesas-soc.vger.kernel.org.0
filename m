Return-Path: <linux-renesas-soc+bounces-28360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPm5Ltnbm2n98QMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 05:47:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146A171CC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 05:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B13AD3020D67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 04:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1127D18FDBD;
	Mon, 23 Feb 2026 04:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MFh2b2kx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916D32BB17;
	Mon, 23 Feb 2026 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771822038; cv=fail; b=Qbc4ReQYi9Jwl1MrsY0LkZn8dbrziLtd8fd7p0mhBIfrYeoK1tvgTUme/79kGj9BdcovXH1N0teaQNBBodzhIleucEWOHUX13K2tM5RM+tlCbRm44LFTm4ff5YFDm0zzNWS/keRFubKgZWTRIKaPKOF497cBA65xAV1BXM2clKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771822038; c=relaxed/simple;
	bh=A9Sljt0mb4wtL3EZKqRAirQG8Ot+kWInSMXLeavq/Dg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nbRZwPn3HzV3GX89kYbWwmVhpgVQRxTIrQngubtlguDc0SPnsWUO7U22u7fBQXTokoVfEF+VkyqwQLgPXlpK2m8Bps5HAAa+fck2hPXk9bLKML55Qgpr5kus/uF2aBnwgcNirTbR8rBdmjaSJWbmGQX2vM4ks54Bx5HlpHCNdaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MFh2b2kx; arc=fail smtp.client-ip=52.101.43.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3ROuSl9QISza8m+jRriwDZCBClPX9/HbQYC9k3Y6Ri0NjywZYh7a/B41z57K0SOj8ShJBhZ3W6Ra93U7wl/LMH+6XV7cfg3kaaRW2f799gOlw1PSqcUS6AhlS1/eBALnI65Rk/aaYyf7LC/+HICy2jBJJGK59Q73bOLuDhmshwWOYlFzL1b2AaYYAM6niUfuD8ugkmDfM/9Bf3OF/xoi3GvW/1o0r4XWrc9ZSoX3B+NDMPU7cA46RsiySIPUwewrNwQ+7QwetD196sJg5D7yJWg+YVTxBc7cPfHRj7b1WkLS8ceqovmTfXDCDcpPF9pNFB0cLhqpOvkPg+NKZDrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdxnlW1dAYeVpcxB+9cPMwRsm3aCok/F67z2cr3O9ss=;
 b=I/jwkjfiSMbedzka1RG0bo4RHbp0zTplvfyyjTz+9xWR9f/IWaAgx/JiDzYWZwKoK3cfnjoxQL7TsBMuwqC2VIUZsuen6w6rfpTe6rRJ4nOXE4GA8l9swwZv/a1ziXj12IvD/51Bgo4xc7CmOXAkcXmSTeOJ3mGabYTRIRXTE2diPuJ6fzn3o0QbOPIzmZe7WW8uiJz5p7L7hLb7r4QmQyzb7x96Id8AOn2ypl3e/+r2iAoySd17W6WNFhOlcH0sK3trmy1lPttRv/DuNLH4UHhsrarak/98Flfu04epEB6kyRQXZsCUsAnLr0nBUcG83F+PjHvSRGRurtCsWuZ3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdxnlW1dAYeVpcxB+9cPMwRsm3aCok/F67z2cr3O9ss=;
 b=MFh2b2kxaOCpgtleaxHt0MYTO87cj351ptLHRSxsfe8o1hp/N6J+vwovIwaGUE04IJG7qoXmQAEZUgJCfOW13bnj5u4Ws8dJ47qvmoWcUAJpuu6Pn62CM5wSsP69P87dvrRK/nv9904un7Lkrydno9AmQJnfJW6aH0eygIyd9NFsvlPF77+ZI74LlB4nDg4W1Oh9dRDxIIFnB7PNP8jPl2LuzS/0Qs249rT5Z+MGKy4xFDRgw1CMVHtkzRzknnyE+k6EfB2N7PxcEzo33z6r3O+l9rpHG1OJZ6Ei/TNW9DPGi9/V0596fNBtp7tjUNtP3Jdv1R8GB3iUFLN3ll+Nyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 DS7PR12MB5718.namprd12.prod.outlook.com (2603:10b6:8:71::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 04:47:05 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 04:47:05 +0000
Message-ID: <bc3e8be5-8ffa-47f3-91e2-b3c0e9f8a28b@nvidia.com>
Date: Mon, 23 Feb 2026 10:16:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in
 glue drivers
To: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Koichiro Den <den@valinux.co.jp>,
 Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-16-cassel@kernel.org>
 <aZToh35w7GYrOmgc@lizhi-Precision-Tower-5810>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <aZToh35w7GYrOmgc@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0067.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25a::6) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|DS7PR12MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf370bf-62c6-4989-35f9-08de729697a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qnp1UzQwY0J6MitocWllTUprbWF6WHVYR3k4RzByWU1aWS9LYnpSY25tM3Z0?=
 =?utf-8?B?azJpNEdZQkxEdXd3MWNNY0hUNFEzTFV0aGU2aGVpU3Z5WHRSc1BrN3JNMFpj?=
 =?utf-8?B?eFhDbXJ6blNyQWp3RTBFN1RvUmI1TVVlU2R2dUs0Mk1YNVVLN0pQbEVuRTU2?=
 =?utf-8?B?VW1qcmloRnRRR1hhZEZRR0JLYlhMMjVvd3pCOTRrczJ0MDZnajFrUnd2VFhV?=
 =?utf-8?B?MTZaaGhZY3V0SDM5d2xRdFdjTGVURzdHckdIbVFxWGthajBnZ0lOamtobDBM?=
 =?utf-8?B?c2xEM05ncC80SW5mVmtQaXBJWEZReXR5TEl3MmpDMHJKSnV1N0gzSlNJMmhL?=
 =?utf-8?B?RzRsK3kyNlVmOC9Zc0pyczVFQjhxMEdqOEwxNVhXRHJ4Y200em40Y3NacmxT?=
 =?utf-8?B?b205M2p2ZE9seWtlaVpLMDhQVnVDMldvdjAxaGJ5U055cEhSbitaYmVmY3N3?=
 =?utf-8?B?QjNSNE40M2s5bktjZGZYd29vaFlTMGw5aUhqUWxQUE9waTM4eFdGa0ZKSllh?=
 =?utf-8?B?bXZwL3RCTStWQkYyOGFRWDlSVUY3Zmt5YXRyTkdWaXM5NEcwQVpJNE9TYzRK?=
 =?utf-8?B?MVdKMnRSQ29lYTFGTisxaWI1NnRQdW9EVWxCYzhRcTlmc2gyd3I3dTFEMVlV?=
 =?utf-8?B?cDBqN09aUUQvK1Q3cnpRd1JwaVNDTjd3YnJseUV3RFo3YzNRbDc5Z215TnZO?=
 =?utf-8?B?SWN6SDBsS0k1ZkszaWNlaWF3M2VFL3dVRzBvMlpuOFNBMi9iQ2F2ZU1uM0cw?=
 =?utf-8?B?YzhaeE5kWVYxcVVMazhsV3lyUzF1NHd1amJDVXR2a25BUHlGWkZiSE9xRzVN?=
 =?utf-8?B?Tzk4UzJCYUoyajlTQkF5NFNDZCtOVm1EZU5pbVlIUUhTaEYvN05GWE9GNENk?=
 =?utf-8?B?QzVvelk0aXpJVUtIMGZSU2xEN0lidUZ6eHFZWkhPYllpb1JzYTc2VTlSdUNa?=
 =?utf-8?B?NWQzNU9JNFhuYTV4NjEwYmRyRlVodTBYN3BKSThUSEJCWUQ3ZjVlajB4S1RZ?=
 =?utf-8?B?UDhoNXlCRnpVVUM1dGh3UGwyeU1USkkxaWlBdGFPc3JIYUdTU0ZzdFJFekln?=
 =?utf-8?B?VnBCKzJOdzNjRnlLcXdQUXl6ejJqaktWazc3TE9YRFJYekRGck45Mk5DcCtW?=
 =?utf-8?B?WU5MaXo4ZFpyb2FJUHJNZXFKL09FenBZSjlBV2MycFRzV2NjNVA2UVV1dTRH?=
 =?utf-8?B?RjBFbEQwVGxNcU5ReUJXK0VlYm82blpKRTdyM2hEMDFWK2RHcHkwK1BHVFdl?=
 =?utf-8?B?Qlk0czJlUWZKdEFBM3ZobVRvZzRoekZqd1VzblQvTThKc2JkblJvZVE2Q0tJ?=
 =?utf-8?B?TGlzRlQ5ZHNsMTRCY0o2S25tSnpGQ1BWWjYzZzBiL3IreEQxRHlRdW03MDBa?=
 =?utf-8?B?NklyeTlpZWlCbXlFNERvaDU2RGx5Y3VYeTN1TFVoMmdSeE5neXZCd3UrTUUx?=
 =?utf-8?B?cWRUaVlLTDZVNm1paW1ydDd0V0VqSG9iOE1Eenl6RkoxZVpaQmg4eHlJU3Bw?=
 =?utf-8?B?dXQzTEVCMGdhVWxQQW01SWVxa0owWmU4OXJxcS9lMHI2K040bTdrZ3AxV09r?=
 =?utf-8?B?OFlmZXQvNXhiVE5NY2pQV3lWT3FyS0ZZc1NvY1VYZTNKQ2dGVUxlcW1Sb3hV?=
 =?utf-8?B?enQ4WGxEd3YxYVREY0xUcVNYU3lUWDRYUmFUdk00MmlEUE5zU1g5SzlWNGxi?=
 =?utf-8?B?NkJiek1GTUhWS3NjN3I4Y21iYkNDSHprbFh6cjcyV3czUVZwNHZhUlZwTEtK?=
 =?utf-8?B?U1F4SHBldlRSMjlIS0xRZTNVMUtOMUg4UkE1RXhlekhmSXk2b1FZeEJZNEJz?=
 =?utf-8?B?TGEyUHV2bDBlZTRucjdscHMrckU0eTcyZ3ViUWt4OXZ0RzVBWEJjNTA3WWVi?=
 =?utf-8?B?V1BWWjR5eDFSM0F3dWFkZ2VVRWtOeDloTVNhOGNnTE1WM0l1MHNNYzA5Z0Fh?=
 =?utf-8?B?ZXRNSlZiYjVCUFNHb09YeW1VaXlqYW82SU10MjhIZUhrSEtOclZqTlZiYTgy?=
 =?utf-8?B?cVNZSE9Md0ZkcVJONTJqS2JyY1hoQ3YzY21xVkNYYmRIbXIwR053eFFGcFFU?=
 =?utf-8?B?V28rK2RpMXZiUDVMTzBYSlJtY01jODBPQnY5ZU03ZWhhM2l4emNmeWZXejdE?=
 =?utf-8?Q?C8uk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE1GNE90SGJpN3NncjlaQk1pT1NXVTh4T05xemJXRjBPL1lrWHpYbEkzVFlC?=
 =?utf-8?B?UkNHdnJGaHA5VWRWQXUzQkJlTHkxTjRHd2NLVDVRTGZKQ3h6eUhOYWUxVkNE?=
 =?utf-8?B?bVpMN25PeVdDV1hMcXNacDFSTXhyQ282WDMyOG9IVU1VNWtnZ2NZWnVCSHNl?=
 =?utf-8?B?RXZKc0V2bTh6N01kVGhJaDA0Mm9DTUxmOG1jUzlkWEhLbzhuTUQyRDlnS1FU?=
 =?utf-8?B?VHF3S0luODFGdkJzUnBuZ2IrUWdXRkc1cndEdjRzejJnYXh4VUljbGYwekc1?=
 =?utf-8?B?aXNsMU91L214d1R6d0Z4VUdhSVpOdHJ0SDUyL3R0NGxlZmVPRTRLS3phZ2Ju?=
 =?utf-8?B?Q2FHTHFaSlQzL0ozdjJWWnZMZGpsclNrUTJLR2xMb1BVREZuNXE5blh2Rk1w?=
 =?utf-8?B?bmU2NGpIZThvcnZhWmEzdXROdUpvZ1dLR0RqVXNvQXUxVTZxbFpveTJnSzNX?=
 =?utf-8?B?OGlSRmZucFhLVzQ4WlQ3U1JxY0tMVmxDVHlVejVQc0tRRW11VGFtaGNpVERP?=
 =?utf-8?B?VWZwbitxQ2xDa0xtSW9NNVp2TWtRY1FrRW5DUE1jUHhPVzMyVktGaFlsRnRv?=
 =?utf-8?B?L21pMEpteElsZmZhOTdtbk5ralBmR3N3MDBxL3dYeGtHYzNHZytFeGorZ2hp?=
 =?utf-8?B?Z1krQWZlN05ubW1RNXNabTFOU3NBQ3F3eUpqMDJSZTUrWHBBNDhCU0xrMXdW?=
 =?utf-8?B?RE9rRk5nK0l3OTBRWFVTdEZzdDBkR3FvNzJ1Z2E3T3BvbGY4ZXhtYk5oZGdZ?=
 =?utf-8?B?Y1RqRThDTUhqV2dTS1RlenA0ejk3SVh5Yzlna3pOY3c4V2d2R0RTdEEvWTZ0?=
 =?utf-8?B?TDhYaElpa3ZJK3hUQ2NRR2lUSzhDQkpENWVLVFp1b2hyTW5UU25RRjFEdGIr?=
 =?utf-8?B?NmQvak5zUzZlK20xazc1elp5VEQyeHRaUmFjNTU1eTh4aTJ1Yjd3Q3BnclhR?=
 =?utf-8?B?QkUzeG1rNlhNNmttanRSSTlOMlNBTmRtZWR1c0NZdjFWdFMrRkMzWHI4dVJ5?=
 =?utf-8?B?VFJvWUpKSDhROGNMUiszUHZkeVczcnVTNnVSazBxcVJvUmZHYmhhWVk1aXRr?=
 =?utf-8?B?UU1pN2pEVENHS1MyYm9WSVh3eU1LMHlWRExiTGRBVlRMTnM3MmpRVlI1eHdv?=
 =?utf-8?B?ekVuWE1UTjhzM1J0S3ErK25mcFpzUkJIK2xtVlJvNmYxT25KZkVjQkRuMUdG?=
 =?utf-8?B?UWFUdGNaSC9TMmhFci85WngwN2Z2TG5EVENqanlUZmxHUUp6dTdHRVRCUDV1?=
 =?utf-8?B?UjF5dXBscDIxdzNoaUVlZ1ZiaWVQWEJjblExUTQ5UC9OelZvUHZVSXlPa0hN?=
 =?utf-8?B?SHpzK0tON0hWeHVpTXIzK2lKQW1rbXh2Y2JwbzIxa3pQZ3pSTjloa25FNGhm?=
 =?utf-8?B?OU56WG9jZlMzaXFwdE5PaGVIdHpkZ1V6M0JLRnBqRDZtVnpmaUorbWNUWDFK?=
 =?utf-8?B?cm5wdzZBc1VoaU5HbWxNdFJteXRVTk5YYUQzektteDV2V0FuUHFmT29KU25m?=
 =?utf-8?B?YmJBWXdpeDJpa2tTSDB1SlZFcXFDZnRKYk5OQ25rWDNjRUowTmd4eTFGbW13?=
 =?utf-8?B?TXBhcHBTcDU4aDJVd3ZWNGdKY3NlZUtSSGZFMVJHa2s5dXJXWmdMWndtcFhF?=
 =?utf-8?B?R29yU0tJSjYxb1Q2bEFpVjk0QlIyc2VIbndNeXNZdEF5ZkVxamovVFd3QjVC?=
 =?utf-8?B?dHVFaDN4am40Y2lBMFNaK0g5MnR1ZWRuVEt4eTlGZTVLdk4vRHJ0VEk1TnJF?=
 =?utf-8?B?aEFkbG5NYTQ4TmJwVHhDS0doMEhLN3NoZnFjK3hpQXJaWEhqYktLaDMzOEJJ?=
 =?utf-8?B?SzJiMThKUWNDd1ZkRDEvQkw4emw3djVWM3k5QnZuendtRWJlMGYzQWROeVZ2?=
 =?utf-8?B?NEdkQVhwalNvcnBPMVNBM2tEQllsYm9kOUJBL2pxT3JaOXNlRENwWWROLzQy?=
 =?utf-8?B?cml3Y0pVZHhETENqaEEyc1RoQWI0bmJnTWI0anYzbk1DOXJtZElBdlhKRVFM?=
 =?utf-8?B?NUFzTGM1aWZRcFRGa1loZER6bWZ0dVI0R3BNMUI0ZGR4VnJzNEJCa0pxYXlz?=
 =?utf-8?B?QlJDbUl3MmNtYVdVc1EvekhJK2RJZHEzV0c0MHYrZkdrblY1OVhMRUxHSGla?=
 =?utf-8?B?VGt6S29VMXdWR0p6ckZhTEpDT1NSUmw4MWRMaWtWc1VGWk9HR3RuOFJhd0Qr?=
 =?utf-8?B?VVNTb3FaTklRRGJzRlBraU4veEYrY2ZTS2Q1czMydnNSQTNnT3kzSy9qZVlR?=
 =?utf-8?B?bDd3NVFHenBYRUZPd2Y0cEM2NlV5bWgvaUJoQmk0RjBjR2ZhZFJzZUZxNE5h?=
 =?utf-8?B?SEk3bGpwM2l6V00waFJOT0dCM05LZGVMOXg3cFErRG5TSk5IdUhPQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf370bf-62c6-4989-35f9-08de729697a9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 04:47:05.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeJHeafxF3GC4Jrr2de09V9ggsYfXOcd6Lq6oQfLcX6RN1/Kx+p5AvyIwvKItoQpHeNp0Wsr6u7rq8vf8yPQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5718
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28360-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,kernel.org,google.com,gmail.com,renesas.com,glider.be,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaddireddy@nvidia.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 6146A171CC5
X-Rspamd-Action: no action


On 18/02/26 3:45 am, Frank Li wrote:
> On Tue, Feb 17, 2026 at 10:27:11PM +0100, Niklas Cassel wrote:
>> Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
>> epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
>> ep->ops->init().
>>
>> An EPF driver will be able to get/enable BARs that have been disabled/reset
>> unless they are marked as BAR_RESERVED (see pci_epc_get_next_free_bar()).
>>
>> Thus all EPC drivers that have a BAR marked as BAR_RESERVED in epc_features
>> AND call dw_pcie_ep_reset_bar() should really be marked as BAR_DISABLED.
>>
>> BARs that are marked as BAR_RESERVED in epc_features but for which
>> dw_pcie_ep_reset_bar() is not called in ep->ops->init() are still kept as
>> BAR_RESERVED.
> combine the same condition together to make easy to read. like
>
> "For BAR_RESERVED bars, change to BAR_DISABLED if call dw_pcie_ep_reset_bar().
> and keep as BAR_RESERVED if not dw_pcie_ep_reset_bar() in ep-ops-init()"
>
> Frank
>
>> No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
>> BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.
>>
>> Signed-off-by: Niklas Cassel <cassel@kernel.org>
Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>   drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
>>   drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
>>   drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
>>   drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--
I see BAR_RESERVED in pci-keystone.c driver in linux-next branch.
Do you have any patch which changed BAR_RESERVED to different type
in pci-keystone.c driver?
>>   4 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
>> index a5b8d0b71677..ec1e3557ca53 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1433,19 +1433,19 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>>   static const struct pci_epc_features imx8m_pcie_epc_features = {
>>   	DWC_EPC_COMMON_FEATURES,
>>   	.msi_capable = true,
>> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
>> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
>> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>>   	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
>> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>>   	.align = SZ_64K,
>>   };
>>
>>   static const struct pci_epc_features imx8q_pcie_epc_features = {
>>   	DWC_EPC_COMMON_FEATURES,
>>   	.msi_capable = true,
>> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
>> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
>> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
>> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>>   	.align = SZ_64K,
>>   };
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> index a6912e85e4dd..9dd05bac22b9 100644
>> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
>> @@ -422,10 +422,10 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>>   static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>>   	DWC_EPC_COMMON_FEATURES,
>>   	.msi_capable = true,
>> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
>> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
>> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>>   	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
>> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>>   	.align = SZ_1M,
>>   };
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
>> index 31aa9a494dbc..9f9453e8cd23 100644
>> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
>> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
>> @@ -1994,10 +1994,10 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>>   	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
>>   			.only_64bit = true, },
>>   	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>> -	.bar[BAR_2] = { .type = BAR_RESERVED, },
>> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
>> -	.bar[BAR_4] = { .type = BAR_RESERVED, },
>> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_2] = { .type = BAR_DISABLED, },
>> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>> +	.bar[BAR_4] = { .type = BAR_DISABLED, },
>> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>>   	.align = SZ_64K,
>>   };
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> index f873a1659592..5bde3ee682b5 100644
>> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> @@ -429,8 +429,8 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>>   		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>>   		.bar[BAR_2] = { .only_64bit = true, },
>>   		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>> -		.bar[BAR_4] = { .type = BAR_RESERVED, },
>> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
>> +		.bar[BAR_4] = { .type = BAR_DISABLED, },
>> +		.bar[BAR_5] = { .type = BAR_DISABLED, },
>>   	},
>>   };
>>
>> --
>> 2.53.0
>>

