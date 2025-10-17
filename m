Return-Path: <linux-renesas-soc+bounces-23257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B908CBEB05A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 19:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 170A735F9E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 17:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588372FCBF0;
	Fri, 17 Oct 2025 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t901VQkn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012054.outbound.protection.outlook.com [40.107.200.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7990D330B3A;
	Fri, 17 Oct 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760721120; cv=fail; b=fSkKvsU4TGdd2XXuGdIGaPlMn474hLluTrMcz5C9+MYtVx7mPydj45J2Cxj3Vi+fgxmYdE4JSx6pey/NZxgLWCIGjJeCwhb0xEZgYckpwNIKc1auJowqFVTPRIfBnxwviDX+WZQmryEve7Y2moa/UHhr3e0fRacu8U3D4ynbTbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760721120; c=relaxed/simple;
	bh=mzP4R+z9/YyYqlN8w6QhHVlBNA6fyEziQPaA7QGhnOk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UU5gRvkLW2FzdLwWVDsm9h6AsWpPvZ8bQhTARr7NZCaLHieVEREr39whendZIVKCO0znYsMy35UGVaudzn17ax2tW/GjhCKQwViKrtbQr065kkZUbByI0jo7RhGToZJ7YYA8TMYdCtAaeysnXkwB9/Kp549TGy7Yt7Cl4hd2d9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t901VQkn; arc=fail smtp.client-ip=40.107.200.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtxu5QYvcLFo13hsbHOcH5IKIPdnqFR7icPxghCgSRHpcUR10IpE7PcZwrw8VvuO3DqeOkSQNWkqZ8QtInV2UB8yNC7JHPBX4QQZ1uhQJRnvXg/lKD7KKbrXumpNY8++V+J6w7pQ6m/pkYV5BPLSsRGm81I7ZRxHzL88pREUaBXVVGXgXXGwPsEJciWLOngjngpsqYd8ZoDG4mNf0da/keFpMBKMO3ykv2BR+WBohSUC5Vldf/LrVPnmwW0Iy3Z557qUuZMKl2gU8d9hubxp7n8dY8fTrrp1MHvkGrD992J6utWSgUb8s2SrMW0cSbjwxel8TnVq3pThYD1e7mPzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpEkzfXsVTuwcrHf7hHgkiG10u8bEqvKFzZp3vXXj8o=;
 b=QakhKsSnT2zqKrQ32kOJ46EIQUjzlvsJNGHjFB/thH/8hKytHvMwvklk61N7bSqR5SynGYLidZE+LiKMIEqx2WlHn9ybZvvEmdhudBlWNNZEXXDsIPCR0h2lvBerOGUxKuv4c2sKizdgThvfuGFfEOiE8+gtbwcwi8NXCV4mhqQbPmdYBp2LZb/BddDYZ/FVSnHIU53z1qPv8IK8NB1wxvXRp5NaHAxvjoDw09ZmIlQ0cwLT4i7KvPkMVT/pzzjiFnLsb8P9DGYUHbjw6jIxFe9ZsIIFh6Fp3xpBLSCSCsXiYxOZXh3Xq86phGVy4JlB+Y0GXgSpfFuSaHSJjGExVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpEkzfXsVTuwcrHf7hHgkiG10u8bEqvKFzZp3vXXj8o=;
 b=t901VQkneCi6TlFZebHP20wOtN4NUq2DgcAZ3FKGTgw/qXUZbBQDPq8XJvgat/wpxrrsnWWZjKduC6pfhz/WCdR5bakwvKx7l6Cw1kwNPQp4E5jTW4roMLCXRmDCv1sqegfRBM7hbZm6Sgj+wzMPK1t4QhgGs7qz+65fRwGYvs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 17:11:55 +0000
Received: from PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a]) by PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 17:11:54 +0000
Message-ID: <6641d925-b953-46b3-9e45-2284d5e2e8ad@amd.com>
Date: Fri, 17 Oct 2025 10:11:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/14] ionic: convert to ndo_hwtstamp API
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Igor Russkikh <irusskikh@marvell.com>, Egor Pomozov <epomozov@marvell.com>,
 Potnuri Bharat Teja <bharat@chelsio.com>,
 Dimitris Michailidis <dmichail@fungible.com>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Brett Creeley <brett.creeley@amd.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20251013163749.5047-1-vadim.fedorenko@linux.dev>
 <20251013163749.5047-5-vadim.fedorenko@linux.dev>
Content-Language: en-US
From: Brett Creeley <bcreeley@amd.com>
In-Reply-To: <20251013163749.5047-5-vadim.fedorenko@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To PH0PR12MB7982.namprd12.prod.outlook.com
 (2603:10b6:510:28d::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7982:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d29acea-ed01-4a4a-69cc-08de0da0457c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDQvOVp2RXVydU11NE83QUJ0OUNwenFaTkJaNlQ2am1raGxsblJ0QzNHSnkw?=
 =?utf-8?B?SEFqM1lCRUIvVjR1Kyt0WVU3WjlQdzhlbjRVVUxVRkFPVHpvdUVnMStDZlc2?=
 =?utf-8?B?d1RIR2RQQkNJQVcrVXQ3c1k2QVpuU1p5eVo4ZkovZXBVZDRQeE5TV2ovc0xs?=
 =?utf-8?B?L0Zxa1hKbjcyR3REUjY0QmtSMUNRYjgwODBreEFKOGNIWDd1SEdVQUd4c05C?=
 =?utf-8?B?RjNCWjEwQTRsdFFvNklPUjAxYzd0ZkZuYnA5UTZiVWZCclpUTUpyWVpnRFpF?=
 =?utf-8?B?TkZlZU43N3ZsYVorZFhRWkZKd3phSDFxMG44RnhqNWljUXZXbnNGYVVORjZ6?=
 =?utf-8?B?dWQ1R3FXZmNRK0dicFF4L1hiV2E2YTlqT0ZFN1N2bXZEd2pTanoyYmp0Qmdv?=
 =?utf-8?B?NHBNcVl1NXNGUGxEK0xtMFhUcDZZMTh5cENjcWtDR2lpYlFycFIrNWw3U1d4?=
 =?utf-8?B?SnRkWXlBdi9YbEJXZHg3K1RjWDREZDk2TUp6U1d6Mm9RMUNFNXgrc1Y0UjFF?=
 =?utf-8?B?UzJrVVRqMlM1UTZJZkhXZWlPdXB3UlJBTDVnRjlpcVJ1cUlLdmQzRmxROExK?=
 =?utf-8?B?TnRZQS9aWmJkNmxicCtNZW5JRkc4RUZLQmI5Y2I1b0VBOGVnaFI4Ukd2cU1V?=
 =?utf-8?B?N0pEc3hzQ0owb2s2KzBYSGhmVEs0KzQ1N1R0Y0cyM2RNUXAralFjazBjUjht?=
 =?utf-8?B?VDBHeHVlMjBZNFRKai85emNQamRQcXlHS0NLSjhIOEtwRXpuSjJITHVMWndJ?=
 =?utf-8?B?RTd6Vk9wK1k3a3U5WHR5d2tPSmwvNGpiYmI2N3M0ckxFNGRDaVVOU1h4NU83?=
 =?utf-8?B?MHMzNXg1bDJnSkpnWEFwUDZHRUh2Y1V4UFRZOEJnc1ZQNGJyUmZURVg4TmdF?=
 =?utf-8?B?bk5LdUk3UHExVXJhcXVIZE56QTNQWUlUL0ZTNFMyQUl3dlRSbVhZT1FzYk1k?=
 =?utf-8?B?NUZoVlVaTUJuTk5rUXRydlhNQis2WU45K0VqM0hqL1l4dzl6U0p1b2RjcVE0?=
 =?utf-8?B?bzF3NkRqdHc5aXp3am1yUUtTcGROSXFCYytNMCtIVHFiTmI2MTdiaEtFSVhi?=
 =?utf-8?B?dXFRM0hYQmNhV2dFdWs4SHhUZ3RiLzduRnJlU0FmWkltYTV5UEg4bTkyd2Jv?=
 =?utf-8?B?b1RnRDNzRENPSHB2UjdBSEUzeG0yNVFqRWVOV2RJUGNTRW1xTkZwQ3pERGMx?=
 =?utf-8?B?YlRPWWZVL240UVUrV2FlbnlYeG1QM2tMVXk2WFhBYUR1dWVnT1NqanBaQWk1?=
 =?utf-8?B?Smwra285bHJ3R1BTNDlTWnJQMjZFZmNqLzcrSzNJTCtMRlpqVEhXU2szVktS?=
 =?utf-8?B?S2xHcmRBbWxFd3EwSytvK29OVFY2YlJmNkVuZWNPLy96Z09hY2pRV1oxTWlY?=
 =?utf-8?B?QzRqQUxRSldBLzQvT0FDSGt4dDlTc2pZWFNrOTkwMTZsbEpKTTVFSUx3dS94?=
 =?utf-8?B?cWprNnlNa2hjbURnZnk3SWNab3RJdWxyd3Q2cjJLSnF1MzMwZStVa1NESHF2?=
 =?utf-8?B?Tk91S3BkZllkbDNicDk2R2ZCVHhzZnNaUll5TGNtZWhjOXk4aWVXV1FDbG9G?=
 =?utf-8?B?OUFXL0FmMENla2dvcTlFYWc3MGFNbWVDWk16Vlh0NXdsQzVNWm5FckQ2aEtW?=
 =?utf-8?B?TjJQWG1ERWhqaktZSDd1VnBtelBZeWtmeEE5cXU4WHQ2SGdlZzM3eElxdTRW?=
 =?utf-8?B?cit5aUlWSFc2dHFzRml4WnVOREI0VitCVGRRRTBZZ202NTQ1MGU5S3M1TUM1?=
 =?utf-8?B?WU5YYzZJc0w4ZFJMMHVLK3VKZDIzTk9tNW5xUGJMNzBocy83ZWJZa0dVWVk2?=
 =?utf-8?B?SVdpT0pENTRydVRWL1JIeFNjVDRtaE92VTlkUTMwZGQ2c0ZSZkpSV21KTU5O?=
 =?utf-8?B?WDhWemt2dHR6d0N1QzU0YzlhM0NhQUI5TnhWVDh4VTZEOVRBaFVJNVNGMHU2?=
 =?utf-8?B?WUo0aWRFdlpaWGt2WmRNS21SYnd1OS9Xazh5UThGZ3YwbEo1Q0VoNnQ2R2pX?=
 =?utf-8?Q?x3sinOF7fxS/+iVF8yiH5vE955X1fA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7982.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFRVcjdnZUs0YWErU2thTkxjQ0FHMitjdFlLWkViMFhyb1ZjUFpFejIrNWEz?=
 =?utf-8?B?ZVZFMnlkNGlCSW4yRE9zbmNETmF4am9Da1dQeWg0aVBLVGFMWVc3Sy9VczdT?=
 =?utf-8?B?Q3NhNUZUOVhKTHJNNm5aMkcyMkdPMXNYZm1meDdzYzNqNnplRmdVdnpHVVk2?=
 =?utf-8?B?Ykh2WmJyU3dhYWFVYlVodmp6MWYzY1NlOEFhbDZKQXpyT2pURWZLMW9ZTm55?=
 =?utf-8?B?WDJFdXNSUWpnM1dOcU5NZVJkZnJ0dm45cEhSR3lHbGFoVFFtTmFOZUFYcUsr?=
 =?utf-8?B?LzF1Q0dnUzR0emNscWx4YzMzTUdpalFuUHhIMGUrY2Q0aTVpZjZWT3Z1Nmkv?=
 =?utf-8?B?eWpSc0tNLzk2cFBha0NMZmEwdFNhK3lvdzJYWHRSM2UyQXJwWTJhblhLVm82?=
 =?utf-8?B?STh2SHYwSTBrZDU4Wk9FeE56NGtDS3pMeWo0NnJuY3E2eHpjQ2grREtWd2tJ?=
 =?utf-8?B?dkVaM0hVVXlpcUttRS9wVDhFcG1mdFR5Ymh4dHhjWTNQOGxYL2MxMUt5eTdO?=
 =?utf-8?B?WnhIVVgrZk4yMERXVXRNTk5yTVlnNnR5TGliU3poeEN1YkdJeEQ3U2xDWWsr?=
 =?utf-8?B?NGw5TFJTc1ZnUk4rT0c4ZjVZSXdHU3owaWFWd2sxSVVsMVVoa1pmZmxRRFJH?=
 =?utf-8?B?Z0hQQk5LakRlb3ZvclpHNzQzSjZqZjhRMjB4aGMwcnhaMVoxZWZyT0JiZ0FI?=
 =?utf-8?B?WTExaGpUNW83ZHUyTldLcHJJNUljbmFpUk1CNm54WXJGbTBmZTlwVWRMTThh?=
 =?utf-8?B?aVhXQVBBd1N6Tjc4dVBaMGxzL0FxZ2ZVc0ZzTFBFZHI2TzlvWU90ZjZwVUht?=
 =?utf-8?B?a2QwWWYrSVZDYlgzQ3F2dVl5QjJJWHF4a1FFejNGV2RGV0M0M1lVYTFDWUMv?=
 =?utf-8?B?djhqYTRtZWlaZEgxUEpIMzJlRDVaS3ZwQTQxVFErR09Sc2l0OVBXQndMYzZV?=
 =?utf-8?B?Uk9teXUyUTA2cDNNSXcyTndkdzJib3pKcWZPNEg2Y1daTHVsZ1Zxc0drK2c2?=
 =?utf-8?B?SVJSUGppTUZoYkpmTmo5bVptWUxOUzBCRHJUSmk2TmJZUVNQbnEwM0d1UWZW?=
 =?utf-8?B?cVdzTERNWkRiNzN1QnkrL0U1RnFndERzaGhnT3VSNkk0WXFHeDRJNVdtd3pZ?=
 =?utf-8?B?dkZjS0FrQk9jeGJIRk03MTBXQ0doend0aDhTbUdDMzBYYVZwczdhZFQvTTJw?=
 =?utf-8?B?eTVkakpPYlBlRDV3NTdjb25mVnZ1ZnFiTVhxZ0FWbWRNdllVRWRrRXljcUUr?=
 =?utf-8?B?bVVMTWdzcVU2bFhpQmtaRkxQbWRLTlBsMWdFcGtXdDVKakxkYlZBRmhnNWNp?=
 =?utf-8?B?UXd3cks5SW5seC9GbytTdlNPM0lXMHlVQU9KWVlCaFJJbThhcjMyOWlPNlZE?=
 =?utf-8?B?ZUt2MEhhRFdabXBMdkFWTFNpYW9WaVM5ZjRsSUxNckx5bHJmTnRoU0hFc01o?=
 =?utf-8?B?SzV5NDFrWVlrNVhCSlBNZlNBS0EydTZmVGRDcjRoR1F4V01vaHFNYmpvTUpY?=
 =?utf-8?B?R0xmYUg4VlRPeG1tdHN2aXpjTno4NkM2dFlYNzZTeWR2OWozbjFqY3JOczF2?=
 =?utf-8?B?QW45VHJySXVZYkhXeEtXSFlBWG9IVENFTlhJQklYRDZmNDNJejJYTWhJaklB?=
 =?utf-8?B?RkkvZ3FrcHJJeU9nV1dWSkFZWTI0TGdQODNaN0cwWEhMYnFYYTNXVzNsZXZM?=
 =?utf-8?B?c2ZnR25qV2w4LzMrbUwzUXhpUkN5cDBJMGFFU3RQbTdIZGwwU0IyNDlYdU9n?=
 =?utf-8?B?Z1ZDMTZCajd0Rkg5aUFTbjBYWGlMM3hidmxuNThkNUYzVGNEenBvdVFNRm9H?=
 =?utf-8?B?b2tMTGh4Wlg4dmFEZVN6Z2ZjYktWVmttaThHbERxYXhGWk8xdWdIZDF2dXdu?=
 =?utf-8?B?b2s3Y2FGVHJ1dHBuWWR6dlM1ZUZ0UC9FSHY1R3ZaSFJQWHpFVXZKVXhsY25h?=
 =?utf-8?B?UWlqb08yWXhrRzZ3YmVRaWpTMmVGT2pKMDE0SUxwTGswcXUzcEZNaWVwakhl?=
 =?utf-8?B?SGovaTBiSGxjd25hVlg4eUtTaUlQZTZ2WjVMSU95RHpvRkRETlVxeHJBcnF6?=
 =?utf-8?B?V3hmb2RBRWo3UmZVVDNna0s3b2t0R1VVK1FTWVJ4ZVp5c2lYbFRzL0V4Y09a?=
 =?utf-8?Q?fPtx03D0P88+yJVcu20Xb8zXf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d29acea-ed01-4a4a-69cc-08de0da0457c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7982.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:11:54.6884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NQxlHuf06GmRf5sbz/ZTUGpFab3RVYZHiEVhEkWMVJ6sgpMgM9p7CPN5I2zTd9bjuh4BGYxx++CWzkGt0hosA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425



On 10/13/2025 9:37 AM, Vadim Fedorenko wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
> ionic_eth_ioctl() becomes empty, remove it.
> 
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
>   .../net/ethernet/pensando/ionic/ionic_lif.c   | 17 +-----
>   .../net/ethernet/pensando/ionic/ionic_lif.h   | 11 ++--
>   .../net/ethernet/pensando/ionic/ionic_phc.c   | 59 +++++++++++--------
>   3 files changed, 45 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index b28966ae50c2..c5f2231a888f 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -2335,20 +2335,6 @@ static int ionic_stop(struct net_device *netdev)
>          return 0;
>   }
> 
> -static int ionic_eth_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
> -{
> -       struct ionic_lif *lif = netdev_priv(netdev);
> -
> -       switch (cmd) {
> -       case SIOCSHWTSTAMP:
> -               return ionic_lif_hwstamp_set(lif, ifr);
> -       case SIOCGHWTSTAMP:
> -               return ionic_lif_hwstamp_get(lif, ifr);
> -       default:
> -               return -EOPNOTSUPP;
> -       }
> -}
> -
>   static int ionic_get_vf_config(struct net_device *netdev,
>                                 int vf, struct ifla_vf_info *ivf)
>   {
> @@ -2812,7 +2798,6 @@ static int ionic_xdp(struct net_device *netdev, struct netdev_bpf *bpf)
>   static const struct net_device_ops ionic_netdev_ops = {
>          .ndo_open               = ionic_open,
>          .ndo_stop               = ionic_stop,
> -       .ndo_eth_ioctl          = ionic_eth_ioctl,
>          .ndo_start_xmit         = ionic_start_xmit,
>          .ndo_bpf                = ionic_xdp,
>          .ndo_xdp_xmit           = ionic_xdp_xmit,
> @@ -2833,6 +2818,8 @@ static const struct net_device_ops ionic_netdev_ops = {
>          .ndo_get_vf_config      = ionic_get_vf_config,
>          .ndo_set_vf_link_state  = ionic_set_vf_link_state,
>          .ndo_get_vf_stats       = ionic_get_vf_stats,
> +       .ndo_hwtstamp_get       = ionic_lif_hwstamp_get,
> +       .ndo_hwtstamp_set       = ionic_lif_hwstamp_set,

Nit, but if you are changing this and you have to re-spin the series it 
would align with the other ndo callbacks to rename these by removing the 
"_lif_" portion of the name:

   ionic_hwstamp_get
   ionic_hwstamp_set

Other than that LGTM.

Reviewed-by: Brett Creeley <brett.creeley@amd.com>



