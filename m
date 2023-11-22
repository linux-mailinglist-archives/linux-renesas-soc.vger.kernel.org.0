Return-Path: <linux-renesas-soc+bounces-154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E768D7F4F7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 19:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 167241C209D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 18:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD325D4AE;
	Wed, 22 Nov 2023 18:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuENfRBF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9222D4B;
	Wed, 22 Nov 2023 10:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700677567; x=1732213567;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lT5F8oFMp7+abb7qeIBqwv1g96OkWqDfr2cZWsFXAi0=;
  b=FuENfRBFOK3XSTEGvEisMO/KGCGbkTGudW6U2fDyKGa6JRN2XYeMqNKF
   0homKzMl/nbc+FkMnmRRADOY067B1reXzHv1/FAsTr2sqTDI4ZMUVyCl5
   5r3UKLgyJKc8GyQA/OaenC+V4nDfLQ2ueQj5Sd3w5DuKVsTvTBbAknp45
   n6kpKajs1QKpiYb00jhzKb4jg5qVFBG57wnGO1cf08U9kdumNFKGbJObg
   Fp3yBX1/XWw5Llsm2BK+mWpg5fcQfJF+aCiRpHE1Pu/UJkvYCVPxVY8xI
   Y3hU8IzHMdaKyll+OUk2fKidCvJks8V+QhSlARk933gVuyx5M6rCL4pZY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382519171"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="382519171"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 10:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="766951992"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="766951992"
Received: from unknown (HELO ORSMSX603.amr.corp.intel.com) ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2023 02:14:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 02:13:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 02:13:23 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 02:13:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIUWHh5eMCUG6lSs96yi3f1V3yKROYtFCvjk490G7n9PQt2o52ScOI8gSWWbo17yqAvcKrjJWnju5jwITnZOCJ8/5dEh6syJU8LA9COHOgEnhb1i091e9OjTXPVJX9Oj8VFMWfdsKUAOEUq0C/PFT/li7IKVPvc6eiBb6ZY9QuvU5nl6GKUtg8dD6opK98cc7+LU1OyFBgEzxCXZQSNrTEJEHv6EzlRgRYShCV/UZwXdom0XEZf8mxsH8Rrr+AtyZNMvR2KABaaP1rOQ1IXroybxqHPajDH/1T31GytvsuOKt8kQyM4MzYhc6Bkqa4sxQ+n0NzwWP/fvD5SlC6b4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmFnVNx+BkFZaH8w+efnfZxBTzDePQ9c4t5841dydOU=;
 b=TJK19LX7ReZJBw9qdKB9MZWRateuZXrJR5FSH5cPV96Y4gnJgm/0riOiZOsnRUeftUE+zKnSuVTFxfuG7MQYN+77hGEJLTLpQNHHoEKwWMVyKA4wHUYLo0+moOax7VXDPitvTadQUXOzRe2+KJfpT55jXhA0QVhLQlj/ReBhK8YeXEw8vnIO/IdoJhAAEY6Oz7J+2Pk3/0XnRmrFL+L+MBErzEhawPh11x7b7Akr3GaJuRVaJFkMG2aTZSX4VS4cL/dk+3jPZQGV7hPPNFh7IV9gYg6z4fsR1TGDWgINZ3aZlvmB8KTncGukMiK0/mkf+EXOb6g6bCWz6OsR833PEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Wed, 22 Nov
 2023 10:13:21 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3%7]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:13:20 +0000
Message-ID: <3ae8b479-9183-4bf1-b8da-7c91955360d6@intel.com>
Date: Wed, 22 Nov 2023 11:13:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/3] net: rswitch: Fix return value in
 rswitch_start_xmit()
Content-Language: en-US
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, <s.shtylyov@omp.ru>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
 <20231122051143.3660780-3-yoshihiro.shimoda.uh@renesas.com>
From: Wojciech Drewek <wojciech.drewek@intel.com>
In-Reply-To: <20231122051143.3660780-3-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0240.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::15) To MW4PR11MB5776.namprd11.prod.outlook.com
 (2603:10b6:303:183::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5776:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: d734a956-d161-4393-785a-08dbeb43a6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 05+zbjE1IsxiYO6snUYJGpPexlT0/AZ1H67fB/5hootajxanmqzca0JkuF2K/HRARiaUnRy1i3iAYV7TKA2DnP2QcgfsZ8qjckA6xJqW0QTNHnj3ARqy50R2PWhAlOp+KaVNF0XwMCDmM1w5Lxw5OBfNQsNyf0E5ZkO6GYRe+UIe4S3m8dNmcg78FikgZw9j3tUmsFna7OrhNHHDa0ROcUF/vnM8q0kg26zHxGbMZt5al8g5fjMDFNXTpG4BHIQDamvgDcl0BZf2YVCngYn5QuRqCRrG7ziOuIc21KFyrHW0XnfqsbhiIrAf5Z7QOT3Cim7yNQ6Z9PlisaA7qeFgZ/nHF/m6jICp/I5Dqhi2IiKRgYOzQHkra1mvqTv00gyIdwSHnkBQRHxgXe+S/w5kH1kxzTvqsYMT0BWA7QNO/u/cGv3Cyl50fPXIDUBFouUaC7Kudp2RzE/f2u5ermhMQ+c/skTHoa0mKbNEt3HzAFTn+wKpJ7XfmIKkMMQRCdZDWdPDY70D907de0a0jARnsiT5Weu5JiR6CTyaPSt862lieVZWlEncrlzrl999orv2rRgHt4deloDWlmP8K67XAGO8vNDU7I4vb+OD1Q8XwtHhmOVyeescGfOSVu+0usczlMUX1ji/lI1zej9VT/9iNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5776.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(5660300002)(86362001)(44832011)(36756003)(2906002)(83380400001)(31696002)(6506007)(53546011)(6666004)(82960400001)(26005)(478600001)(2616005)(6486002)(6512007)(316002)(38100700002)(66476007)(8936002)(31686004)(66556008)(8676002)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzJsa2hCWHdPQXhiRjBLVXFaVFRFdTduSzRYZnpTcDNqWVJpc3BIems3ekdO?=
 =?utf-8?B?d0hYSWU3QlFKKzNXMVRnTDMrVEl3ZGx5NGRZVlIza3ZkNkhPY09mVStrdnlO?=
 =?utf-8?B?cjA1d1F2RVI2SythczdiTGI5NXpKRGZFdnBISzdBdzJHNElERUtuTjRpL3pu?=
 =?utf-8?B?OG5ZQ3lwbWVMVFpHTG90MWdzZU5ZVk5DSjBIdEZDUVRGYVpnUUV6MHpXcjYv?=
 =?utf-8?B?VW9mYVpEQ2g4SVp3VzhjVjltcFNDQ0VJUGVoejYzNXRNVmUvZ3BWYTF4Uzll?=
 =?utf-8?B?RURGU1BYZHVnTTQzSStGR2FaY2tVOHliNUpKTk83TktkUnkzZm9kakd3OW8r?=
 =?utf-8?B?NnVNVG50RDZJajFKMTYxQ1U2aVk1VnVBb1pveWttaVBVRkNxZnlFMWM3dkxx?=
 =?utf-8?B?by9vRkNvK0JqNzArWkNhQ2grSzN2NkVmVktBMDRHazQ4QS9JSDNvbDFtbUs4?=
 =?utf-8?B?Q3FVeXVtNitWazRscWs1bldnZk5VYVlETGxFQ3RxVWpqSjBIOU10TE1rOEp2?=
 =?utf-8?B?dS8vMEl5WHVMcmZycnRSTkxVVXpINERBVWFhbmlWZ1dwOThZczhRUUlCSTE3?=
 =?utf-8?B?WGVpOUhnTzl5K3BFS2p6aFlaZHcvVVNaK2VpSm9MbmpmdnNZMWVGdmdSZWc2?=
 =?utf-8?B?VHp2eXpXTjhDWVR5RlJHU2VVMVRWU08yOXJXeFR2UEt1T0pVVGpMTmgyRUNk?=
 =?utf-8?B?enloMlBZWXRraG1IbHZMZDR5dkxsUWhNRHVEMjhJdEI5UytCcGlkS1ZXNHF6?=
 =?utf-8?B?ZStURFdPL2cxNlZtenkwTUtUMi96NkZETVNEbHRhQUcxRUo4OUlLekVMdU0w?=
 =?utf-8?B?dGZoNWFWMXhhUUYyTnJPVGkxeldCVlk2dWpNUk9FNXJvNFBvNHlwMVR3TEJV?=
 =?utf-8?B?VjMxbWtKY29sNUpSOEVkeTRrbHBQZDlKaWhVN3F1MGN2V2RBZWV0bnUyUDN0?=
 =?utf-8?B?QXQzTFVlQUEzeGFQdUQrWGRVa2hKVGNXSS9JREdsdnk1M1BtV3FlMXd0STRB?=
 =?utf-8?B?MTVlaGpqQzNhQ0kzdFFLNVBWNE1pMTJ6Vm1WRTVXNmpsbUYzK2FVSm5CSWdQ?=
 =?utf-8?B?a3RVTzRsQmkvQVc2YXBkK3AyKzhLZ01zRndDdDVSRHdtQVdVZkVueHBYelJi?=
 =?utf-8?B?Tms2dm01d01ZVjNucTJCZWk5S0hEMDlubVRTalJ2ZlI1SWhwMDRXT0FMZzJR?=
 =?utf-8?B?dG5Fc003cW9jNFFOcFpxVzVSbG84Vm9ZR21pWUpTOFRTWFB2U05Gc3BXSUwy?=
 =?utf-8?B?ZzBYY2h2eENrMkhvelMwcXE4bFc0Y0IvMUg5Q2lNSjh2a3VFVFlKSWMxYUxz?=
 =?utf-8?B?R3RwQStYWTk0VzRTSFpIMG0zOTJ6RldxcUhNcnl6aHVVYmJwNmIzQWZkeUJu?=
 =?utf-8?B?cHNKUDFOcEtuQ2xLSE04eS9EODgvL2lVSDdRU2NCVlE5cUlpaWkwQXZzNVBZ?=
 =?utf-8?B?Si9sZEU1bGk1YU9lMHA1eUtlYWtqb2xKOU03NWhJWEwrc1pmUEtMUDJBMzJm?=
 =?utf-8?B?RXd2cUxqc2crb3I1M2YxV0lDVTNVNGw2Ukc4eGplUTJpdDRkdXhRN2l2V2ph?=
 =?utf-8?B?eUJsdUduLzJXT2pEVjlkekRPc0kyUmRsWHkxOW1QNXd6WGorTVI0L0dacjZH?=
 =?utf-8?B?V1lnbUxQVFRrVTRaNGVtWUpRQXJyQy9FUTdRL1paMmpsem5sdGxLcmdZN0Y5?=
 =?utf-8?B?VzZRWENISkdVcTF2R2FuS2svam5WaUlnSEdrSlY1YlpBRThKWTloOFJ6Yi9W?=
 =?utf-8?B?Y29EbnhrZUdZbS9VdWtPZnNEaUZ3MnRYbUI5MlhNNE5abE1oYVFZN0lvSEh4?=
 =?utf-8?B?MGMvRUR6NWZXTmJFWFR4eE1RK2JZbVBoSDJibTJzRXNURmZTQVBtUGFobng0?=
 =?utf-8?B?aklGZXpyUkEzd3Jtd1RvNE5pVldBYUpkS3NVZDNpSzVWT3Flc1ZsQitTR3Av?=
 =?utf-8?B?djRuK2Q1UWlKZE5haHpXNVNmR283YzNJUGFQRjFIMjRWOTR1ejZTTjA4dWxC?=
 =?utf-8?B?TFc2OU1oUFlvYlJaNmdMRVZhck1nVmdMaS9Rb3lqWXNZYkMzM01nVnBlT1Ax?=
 =?utf-8?B?VmFZZzNZWlVBSTdJN25haFdjTThBbElZcmdMMStvRW1MM0xQZkZ2Sit6SDZ3?=
 =?utf-8?B?WmlOZmNJbHZuZHRhNFFCalh5OFBGTUhjRGxCTjg2WXQzWnA3Wk9McmJzWEg0?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d734a956-d161-4393-785a-08dbeb43a6d3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:13:20.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWmgZKBH0a9RabdH86IQlOjXgCA5X+/nnf08M253GhPEK7oTR9jtgLpMsk88DhZuPomWXhcB06z6l12Zt7QYxn1LL+2ZlDIML+KYRl/gBK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-OriginatorOrg: intel.com



On 22.11.2023 06:11, Yoshihiro Shimoda wrote:
> This .ndo_start_xmit() function should return netdev_tx_t value,
> not -ENOMEM. So, fix it.
> 
> Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accuracy")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---

Reviewed-by: Wojciech Drewek <wojciech.drewek@intel.com>

>  drivers/net/ethernet/renesas/rswitch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index d53d90020904..45bf9808c143 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1535,7 +1535,7 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
>  		if (!ts_info) {
>  			dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
> -			return -ENOMEM;
> +			return ret;
>  		}
>  
>  		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;

