Return-Path: <linux-renesas-soc+bounces-28359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xHuxKVrOm2lH7gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 04:49:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8F171AD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 04:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C790C300C5AD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 03:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A97344039;
	Mon, 23 Feb 2026 03:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P5mRR2LL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012068.outbound.protection.outlook.com [52.101.43.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727DD2192F9;
	Mon, 23 Feb 2026 03:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771818583; cv=fail; b=ryrptM1mgvFOkAmhuzbc7ZD3efUI5RecIL+XxNPjx8PjVVxOQ3Z1jllKHwiFjSA9JItH+mvhiK9JT+5FatApSLOA4TcgLLo5QEOLbOYe6p3J2p2YIxmCkdjgFlbY7larh13IboRoUreG/S0uoBncll/D58jeVTxT2zuh7mDzHPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771818583; c=relaxed/simple;
	bh=JYfjvSMeriy0QOthy5JLsp07J+tlNarg+UKGkV/HylU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qZvrVZfiSbgDIAG7+mjMlhir9VzqTWPCVRY0y/82rOWuqaRvoNNYhXDAkNqyShnaq+WIUzpO52DJWJGzTHXmWikAuPnaK8BgHOtc0+RBeg3uFosXaitoyFKdFa+ticILYn5xgHaiJJWxMnUlLpys8VQ9Q8V526R4iFOqnuNV4/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P5mRR2LL; arc=fail smtp.client-ip=52.101.43.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZKYVHsCP/RaGTTVpM+zb6CworRLtc05nRPcsFgcOtNrGUnaG5yruiWLBTpvcAhEMVg2wS6aLSVIKVca5sTc81Wl40KB2DGmvMypyS8uqxQ4DkW4YaRQJ43ksteRtXw3kCm13NcWYSt4iAE15b91tKXMxX+RfsiVlE6+VL7FBbrVun6f5wYJYcLdkuYLmTRSDVBfA2I0j+OvizxWOaBTgEIGeht1bUgwd64nqHceX6e3BZDZkvOnD/bYmFPPjTm2CIohtINWmwau4jsuR0utOc8FDOc2DIlcL5FvDoD2yudG0Z3UE/6EmZfQSbZgTgDgi/OlAJDLGAenPBom7ZB2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1oTStWRmV2wBdfQLvC3P5Ij4ERm4Nt0ydB81rQE+9Y=;
 b=pcSCmQ4syVkBz8vBFGW6rKzDt71l0N/7KQEz77qeyr4AaBEvdHGLQifB/T0na1rLtrUshrw5QDb5K51uTMP/6iAYAdH+/MwQOZGYf8jEj/t7navFs/m/WzPPyckN+/wNHeOnPCkNXPbgc0Sbg7hTta1Er1Sn6WVf9O6ciwX2yFN0DWO/ecbGCpUmC7vbEKWVx89F6WhLpo0+fKxPiC/OrwuL3Ev0V/dfDSkajjsi/QwU8vtHKipZ1GWKXSe+twSWYsuvClfeS0DpN/+TY1OuhrOASoXDG7YTLLJ50Hqe36F78fAUq/JYVLFFsJ7dttSjLICluMdsyftZkENoTBhsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1oTStWRmV2wBdfQLvC3P5Ij4ERm4Nt0ydB81rQE+9Y=;
 b=P5mRR2LLKic+M/vs6FKtqlvJJaq78PfKH/DXWzMQh1NV1sGvDhAzJV0WpJ/MNiRuW0m8fptRgJnISzE2takTy7zamprdCogJXWXW0wjRy6svCy9zMHQdHqeB071XVTf2m4J0jee02nTPp63TQ+V0WR5DsPvMxG+cI6sdZ7YHFm3gW/gcM4p9Kdgbr+kWR9iMdoQnMSrVa4I4vsWRUPCPu6E13hfHFdBwiu1a51mzm0dIJj4zClh99xeJmBRglhhwLcM6M462aDY+GJxbO9kc7a5rZ/OKDcEp96miUd9TVWOErbH9CJAA3EieXGR5bcql5S2XeoIRQoJ4Vz60UmYt4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 03:49:37 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:49:37 +0000
Message-ID: <236a5eeb-e22e-4973-a693-319c1376f9d0@nvidia.com>
Date: Mon, 23 Feb 2026 09:19:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] PCI: endpoint differentiate between disabled and
 reserved BARs
To: Niklas Cassel <cassel@kernel.org>
Cc: Koichiro Den <den@valinux.co.jp>, Damien Le Moal <dlemoal@kernel.org>,
 linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Shuah Khan <shuah@kernel.org>
References: <20260217212707.2450423-11-cassel@kernel.org>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <20260217212707.2450423-11-cassel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b481c2-f603-4102-79d8-08de728e90cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXVEd2EwSlFYdmJvdjdKWVlRTXpWYStaUU54N2V2alBXQzVQYVYxYmRHMHBn?=
 =?utf-8?B?RFMvcnlFRktrd3duRlZKRGpQQ3pNM0tvT3o1bVIwK3V1WlBaUEFoamFjOGtI?=
 =?utf-8?B?bG9zMm13ckpQbDlBMFhEa0ZsMDdwNG5idnJCYmVTWXU2SlVPZUVFcWpSMmRG?=
 =?utf-8?B?Uk1WZ2JTdFM5ek50VWgweTI3UFZIWnRWbzRqYjQ1Tms3V01oQjltVllMTi9u?=
 =?utf-8?B?a21yeTIyOUl1WnY2N2QzSjNzcnJFbkRSaWdLeDR2eHN2TlU3a25OQzRTTlM2?=
 =?utf-8?B?SjNac0R4MDdzS01KMGgvSGkxR2xWcUg3Y3hsU2RIRTRQZ0JPbGd3YXAraGZU?=
 =?utf-8?B?RXFQakVKUlVlTDR3K0RTRGNQYmM0dnFiVE9nellUN081TkhXVlBXdENRRjJI?=
 =?utf-8?B?c1FldlUyQmZmbXVqeTF0YnRhTm5rZjNMWXp6R2VCVW1mVisxQTE5OFRYeEJP?=
 =?utf-8?B?ci9rU21XK1BaWFZGaExUaGdtMi9IOTRFQVE2NThkd0c3WUd0MDA4bm5jR2Fm?=
 =?utf-8?B?R1pYREcwSDM2akMrYVdiN2JlWFhoRldVMEN2d3FlV05oL3p6ckpYRzhFejlu?=
 =?utf-8?B?RkFoNGFzVTl3UGtmTkRoNVI4bTBPMGxEcngyMnFBZnJtNXVCZ0daTmM5NTFM?=
 =?utf-8?B?dU9vYjdIMEhMUXJNSHppVXZxa2lqQ24xU2U5OFlSVTZFUDB5MUlEamVMK0RT?=
 =?utf-8?B?MVY0QjRXeG9pblk4MENDVjAzRmRJZzFZUytVaU5HUHJrUVRBZENwd3EwQXVG?=
 =?utf-8?B?ZVFMbmprdTVIV2N6eDhuMHVYWC9lSnU5cVc2bm9oMWloeng0TDZGZVA2d3FE?=
 =?utf-8?B?SithVnNVRmxRb2N4K0lacHJCcUYwY0JYT3NjTkRjV2l5RnFSaHhURUtvM0Ri?=
 =?utf-8?B?SGxvS3luTHA0aEQ1Y0NpNkROcFVUcFVKR1FUVXE0MDRGWGh5OHQzbWVxSFA0?=
 =?utf-8?B?dVRiNVgrZEJqZ3F2eUJjNysyekFkU0ZFNW1rWHdBbkJjWVpVdmJqcllzdm0r?=
 =?utf-8?B?cHNGZlhDVHBvS3I4K2Z2Ym0vUVZndnJpQW5xRUFLWnpkSkE0d0Q0eGlFd0Fx?=
 =?utf-8?B?ZEljV2Q4bFpPNU9uczhCUUxvZUxzNW92eDEyYkJ4b2N5YmwzcnNrZmxRd1cz?=
 =?utf-8?B?R0haS29RTFc5T1pBVS9XN3hmRGoweC9GKzFtZFdtU1NTUG8xTzl1QUFwb3pN?=
 =?utf-8?B?dWt3c09rT3FUQ3V5TUZleW9tbDBmU2RPOGRHanptalBjWWxSLytWTXR3a2py?=
 =?utf-8?B?L1FKUnpsaERkSnZlVzd3bHo5UFBNOWRlOXNrWWFqR2pCeEpMdWRrM040L2g3?=
 =?utf-8?B?dnBpakk5MU5obHVCQWlVZllYSGMxQWYwTk9WclJmcERhbVcwT1hTbU1vT0xV?=
 =?utf-8?B?b0NETTdJMU03eExnb2VnL1FUdGNpeWtpWlVzVnhiaVp3bGhMeitoSjFSakVi?=
 =?utf-8?B?YWZrMmpqS1A2OXNadWgxVUUrVURncXE2eXhQZEpqbmlnSUxlQzlGc29xeHFR?=
 =?utf-8?B?VHBqUW9XVVpoV3NyTXYrUnJYRnYvRVM1VVhwV2VNQ1lQYXV4aHBuRzJMemZt?=
 =?utf-8?B?alEwem00U1poTlF4U1dyQ0g5bVZwM3BIUlo1YXVITkQwQ2l5eFdhUWhxRHA5?=
 =?utf-8?B?b2MrdnZKWlNlUlNQQml1a0NmeGpGQVBVQUZLNVVoUWUvcXI3OXl3QUtmZ3Z5?=
 =?utf-8?B?L0Q1dEdjS0lzVDdxMkJpYlN1bXI0SVJNb2dVeFlKbStwMndMeVJ1akc5Titu?=
 =?utf-8?B?UGFGSXFKTXNJbXo0cy9ZOXAwTmlpMXdjaVNLRVlHZkhUdjBpb2hUNmpXSkFG?=
 =?utf-8?B?ZkIzc2NDU1VCbkFhYXdWS3RNdVMxN3JpcjRaRGhCTnNQdGdPTTMvRFBIQVZL?=
 =?utf-8?B?dUFySlNDejg1UWMzaUw1TWxVRVV6ZjFsVTYySllsQlAzVG1HdVVjaEMvcjI2?=
 =?utf-8?B?ZXA3eXZQMzNlcHQzc2UzTkVWdmRRQlk2WVFEKzB3aSszYzdTU3NhUlZuZ0N3?=
 =?utf-8?B?MGQvMlh1bU1wRlJFS0hGd09GVHg0VklnSm1hcStKZ2JhREZPN3JyN3VKMzVL?=
 =?utf-8?B?QmhtSFlKODF0d1J1THo3eHplejlQdndNMHVTdzVtZldkYUFpdndiUlJyUXB3?=
 =?utf-8?Q?sIcw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2JSYnRhbVhGWHFtWDBVTTZyTGgvbGsxSkJXUGk1U3VYU2RVYlFFL2RxWllV?=
 =?utf-8?B?cVF3dWIrRmZnWFhVL01sdE9xLzhrZUFaNEF0V1NoenJlcHUyVUxLb2hvOXJM?=
 =?utf-8?B?U296UHZzZkw4WGhnZTk5MTQ0bGNYMlduU3VLeWh1VFhpcjJZS0JvanBDSDVW?=
 =?utf-8?B?cGpuK3c0Vmd2blBtYXFaTXhWb29aSHg2eEFINzd1RVRWdWN3eVl2WUNuNGFj?=
 =?utf-8?B?Q0xpUzArUVpoWmpheHk2SFBwY090WWRyZmFTZWJ3eVk2VGcxaERxU2V1c0k2?=
 =?utf-8?B?ZlZHWU4waHgveVNBMVh5TXFHaDJEOWkxb01CSFY4cUJOYWpsZlVlbXNWR2FW?=
 =?utf-8?B?WHhwYWRZZ2J4VTd3d1Z2N2NOdHQ5VWlQOFpHN2VoVjdQdWFNdHJVWm04YnA4?=
 =?utf-8?B?bjZ4dkoybFBzQWEyYjlGVEN4WHhzYWd6TTNja05zdmRScHJTWVVrL29KM1lj?=
 =?utf-8?B?RjM5YjJSRktlYmV5WXB3L0ZQSlpET1JSQ1JxbGdRbVRuU0JlRE5kc0Qrakk1?=
 =?utf-8?B?L0xJMkdBWnBQNWo3WWxnSU9xOS9Zelg2VitscU1xZHhnOE9DaG5DcEV6VWl3?=
 =?utf-8?B?SmxyTm1IbEhVV2Q4SXExVVdZQUo0aW9ZeVFMRnRMZ1RyTTQrVE5CTy9EVldZ?=
 =?utf-8?B?eENIcWFEdGRPdGpwZzdieWlIWHVqd1BEUGhCcTU1L1k2WmhNYUFCMU1KZXBI?=
 =?utf-8?B?c1NUNW5LTW1xcjNxeU9ENVluak1mMmZoVEp2R1VWaCswc3FrZnpGN3BPM28x?=
 =?utf-8?B?cnN3SzBjN1p4QzRaWE1Lc3h0SUs3dlI4cXlQWHR6c3pxZit6SnZVRlBndlls?=
 =?utf-8?B?ZnVSYTJYNEExTW1UMENyRGoweTN6Yy81NVJza3FYek1UT3g0cEYydDhyOE1R?=
 =?utf-8?B?Qm4wdVRQNlh2UnJETzFVSWhBMXMrTkhmd1JHd1U5NzRQYWNuMGRoZ2VmUC95?=
 =?utf-8?B?OUxld3NhamxEYTNmeG4rWW5lN01wb0lzREdFL0dwUXFGTVdUb0ZRTEdVODUz?=
 =?utf-8?B?WDkvb2hCZzQyL2NsZXB1WG0rNnpKWVhpZW1GQk5TNU1INWNtNXBNOGxJQ0V4?=
 =?utf-8?B?STBFY1pjbklQVnZJL0IzdnQyNjhNZXl1SmVPRlErZVRSakRXN1cva3NGTFNp?=
 =?utf-8?B?aGtyR2c1V2ZmUlZjQjJHMXgwRG1NcCtHVGxCTlhzcEUxQTcvcWdQOW9rcXBi?=
 =?utf-8?B?OUZMdy9XVU1LKzNrdURvdkduTWxLdHJqb3VDTHF4RHVJb1lWbmJ2a0tLcTFK?=
 =?utf-8?B?Z3MrMGNobEpKUU1WZTM4S290N1N6VUxQSWJNTUVxa0t1cVlkd1AwVVNhU3dX?=
 =?utf-8?B?OFVSY2NVR1Y4NExOMkg5N1kxV2NSM1ozOFpzRTQ1ZnJoRHRVVWk2MUhYTFp0?=
 =?utf-8?B?Snk2eHpvaXJkbjZvVnBUVGZlaGxha1o1c3gyVmF5NFJPK1Y2WEQwSFhpcUsz?=
 =?utf-8?B?MmsrQks1NndoUlA1Q1M5eTB1cHgxdnFWNzlCTldXMzcydURBK1NIR1NYS1FC?=
 =?utf-8?B?dXNWbUtJVDFPd1lnTVFMOFZQNXhCM1V1NGVFcURUcmluaUpyaXVGRlFjME9n?=
 =?utf-8?B?RzdGdzZtVit3NVRJVW9laEdLV21kbHFHdG5ITWhNbU1aekVLSEVEMyt3RktQ?=
 =?utf-8?B?QmdiclNTNkhQSFcwZFMyU2JEbVlMV1NPQ0g4YmtWQmNDcFZjdHdmZzBNUThO?=
 =?utf-8?B?aFF4RHhrWENpd2xETFhuaEdoS2ZqbEV2MlVsd2ZMc0dmalRuNHc3RENJNFla?=
 =?utf-8?B?WjYxTW04Vlp2Q1VsMGtkbFhkMFlyVWZ2SW5EUFgzMVJkelVmbTJwd3hrbW1B?=
 =?utf-8?B?M0RTWlNWTDBhSDZ3RXpSMnliR2I1QnQ5Tkppejh0aTRMVzVPZDQ0bXU2RlNo?=
 =?utf-8?B?VmVlc0NyUkgwZVcyUDRMck4rSjV3VE5kQ0ZZaXNhVDRXR1BTMlZESlIyVW53?=
 =?utf-8?B?czluaEo0aitFMTIzWVpIelRqZzBrQUIxY1BLdFkrSHlaRUg4SlpZTWFqZ0xt?=
 =?utf-8?B?ZUNhOE9rUVRMVUZHWTdNaXZreUdWYUIzdjJwRmFzLzFGY2FPd1B6bnA4UEdz?=
 =?utf-8?B?ZWtVYit3eEZIYmVEa0pZbmlLeUQ5T29tdUlFTkhFd1VqcjBHZUMxczdUSmpC?=
 =?utf-8?B?Y1FJUUxLdkJjS1pGNzJPc0FUMU40NVBGU0szY1hqMkYwSXJNMzZKM1NJNWNV?=
 =?utf-8?B?QVAxbDNqYlRralRFeGpFcVpMR3JmVFI0MWw2cFJYRXc5ckxyNG52L1FKK3VS?=
 =?utf-8?B?V0VlQmRKclYzRk04amc2bmNHdzBwVDZsZ2Q1T0tkTjVZcXI3eWpDV3J4K3Ru?=
 =?utf-8?B?M0poSlhYTWVPbm9YR2ZYTWp1RWU1czRwemZDSFRyamsxOEIxRlhpNjdlZVZ5?=
 =?utf-8?Q?X9p8wdh0avJsP+dI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b481c2-f603-4102-79d8-08de728e90cb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:49:37.6692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tzq2nK2r6dC5N37IyB3SjAtlJ2nlw0fKZESv9XnyqwR2LVXUhA+oHS5AtRU89vylSYS6BNxKY+srWljpoaELWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[valinux.co.jp,kernel.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,axis.com,st-md-mailman.stormreply.com,arndb.de,linuxfoundation.org,ti.com,google.com,nxp.com,pengutronix.de,gmail.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28359-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaddireddy@nvidia.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 22F8F171AD0
X-Rspamd-Action: no action


On 18/02/26 2:57 am, Niklas Cassel wrote:
> Hello all,
>
> This series is written in response to the patch series from
> Manikanta Maddireddy that was posted here:
> https://lore.kernel.org/linux-pci/291dab65-3fa6-4fc8-90a2-4ad608ca015c@nvidia.com/T/#t
>
> The reasons why I decided to post this a new series was because the series
> above:
>
> 1) Adds PCI device and vendor specific code to
> drivers/misc/pci_endpoint_test.c. We've worked hard to make sure that
> device specific quirks/limitations are communicated via the Capabilities
> register, so let's do the same for reserved BARs.
>
> 2) My review comment which suggested to convert all uses of BAR_RESERVED
> to BAR_DISABLED (except for pci-keystone.c) was ignored.
>
> 3) Koichiro has posted a series that allows an EPC driver to define exactly
> which hardware backed resources are provided in a BAR_RESERVED BAR. Yet,
> this nice improvement was not incorporated. (While Mankata was part of the
> discussion, he was not CC:d on the patches that actually implemented this.)
>
> 4) The selftests should return skip instead of silent success for a
> reserved BAR.
>
> 5) As Mankata points out, but did not address, BAR_RESERVED is quite
> ambiguous, so it is better to introduce a new BAR_64BIT_UPPER to more
> clearly mark the upper part of a 64-bit BAR as this, rather than reuse
> BAR_RESERVED.
>
> 6) It is possible to remove all the dw_pcie_ep_reset_bar() calls in the
> DWC based glue drivers and move it to DWC common code.
>
>
> Because of all of the above, I thought it was just easier to post a series
> with all of the above addressed, as it seemed easier to just show what I
> meant rather than to try to explain things with words.
>
> The thing that is missing is to add a patch for pcie-tegra194.c which
> converts the BARs to BAR_RESERVED.
> Please see patch "PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window"
> and do something similar to pcie-tegra194.c.
>
> If we are missing some resources (right now we only have
> PCI_EPC_BAR_RSVD_DMA_CTRL_MMIO), then I think we should simple add that
> (e.g. PCI_EPC_BAR_RSVD_MSIX).
>
> Mankata, it would be nice if you could test this series, and if you could
> provide a pcie-tegra194.c patch that adds the sizes of the eDMA regs +
> MSI-X table in BAR_2 and BAR_4.
>
>
> Kind regards,
> Niklas
>
>
> Koichiro Den (2):
>    PCI: endpoint: Describe reserved subregions within BARs
>    PCI: dw-rockchip: Describe RK3588 BAR4 DMA ctrl window
>
> Niklas Cassel (7):
>    PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
>    PCI: endpoint: Introduce pci_epc_bar_type BAR_DISABLED
>    PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in glue drivers
>    PCI: dwc: Disable BARs in common code instead of in each glue driver
>    PCI: endpoint: pci-epf-test: Advertise reserved BARs
>    misc: pci_endpoint_test: Give reserved BARs a distinct error code
>    selftests: pci_endpoint: Skip reserved BARs
>
>   drivers/misc/pci_endpoint_test.c              | 32 ++++++++++++-
>   drivers/pci/controller/dwc/pci-dra7xx.c       |  4 --
>   drivers/pci/controller/dwc/pci-imx6.c         | 22 +++------
>   .../pci/controller/dwc/pci-layerscape-ep.c    |  8 +---
>   drivers/pci/controller/dwc/pcie-artpec6.c     |  4 --
>   .../pci/controller/dwc/pcie-designware-ep.c   | 24 ++++++++++
>   .../pci/controller/dwc/pcie-designware-plat.c | 10 -----
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 19 +++++---
>   drivers/pci/controller/dwc/pcie-keembay.c     |  6 +--
>   drivers/pci/controller/dwc/pcie-qcom-ep.c     | 14 +-----
>   drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 16 ++-----
>   drivers/pci/controller/dwc/pcie-stm32-ep.c    | 10 -----
>   drivers/pci/controller/dwc/pcie-tegra194.c    | 20 +++------
>   drivers/pci/controller/dwc/pcie-uniphier-ep.c | 24 +++-------
>   drivers/pci/controller/pcie-rcar-ep.c         |  6 +--
>   drivers/pci/endpoint/functions/pci-epf-test.c | 24 ++++++++++
>   drivers/pci/endpoint/pci-epc-core.c           |  6 ++-
>   include/linux/pci-epc.h                       | 45 +++++++++++++++++--
>   .../pci_endpoint/pci_endpoint_test.c          |  4 ++
>   19 files changed, 173 insertions(+), 125 deletions(-)
>
Hi Niklas,

I verified this patch series, along with the one linked below, on the 
Jetson AGX Orin platform:
https://lore.kernel.org/linux-pci/20260222193456.2460963-1-mmaddireddy@nvidia.com/T/#t

I reviewed the BAR details in the lspci -vvv output—all three BARs are 
enabled.
I also ran pci_endpoint_test, and all tests passed successfully.

Thanks,
Manikanta

