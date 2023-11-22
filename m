Return-Path: <linux-renesas-soc+bounces-98-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE177F4376
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 11:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A8601C2088E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 10:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D93F3C6AE;
	Wed, 22 Nov 2023 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJPINaoo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729AD93;
	Wed, 22 Nov 2023 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700648271; x=1732184271;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lcEqE+U9cXaYuhTh9GmrnYY+OaX9wpxMzywGGTmhpFE=;
  b=hJPINaoo3G73pCb3ci8hcNgoaPBuPJxSCfFt+l7K5a/O6nI+PJbicjl7
   ao7QlS4puk6yLtk0fP6PO9KSDNU2fiKSNsa11UdgoZylaeUMgNGyQqPH1
   4fzYf6X/SPm49/b3uupjps3gpk5yXsHi15oxic1YbFaiv2g3cmUgGgdih
   6IUDuN4ZFsmEcuF6Ak1LOzmvB4mDQ6fAhqHhrcDEoXz5bY0VAPz75yC8u
   lo0LWG7mL2IoVHYi45etmDN2ulrhq+fgzRUwQF9bEAvqrtFJsFj76GTw5
   BqLAFQOLgIrf6iQaAAmXvR5F5BpK3NcrSQiGEguQGdIM2494Pp/PEfwJN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5218169"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5218169"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="8386692"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2023 02:17:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 02:17:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 02:17:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 02:17:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 02:17:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSxmEE5m5QLvTOexcpNrNqpDTvHEDqAFbfr3VuBVVFoI5SreuQnv7vuFuMFZ8bdShfREGaMqVRxXEDY5uR34IjGUL7r/pOQdfw56O0z3bq2U0XLZIKuRf+Wr9akx5vi1rxFXtDtKPgbX8pBLyiooRg88Ou9H0hvFW0HC578suWE39WinsVvyII96X0i670qKrQs8dRrdZ6h+UqIz4eM3wYVmSmJoMyljzpK5T5A6vcEhKkKIBqEUHXP/hvrMvcLPg8vXgtHJDTg00mM3LKUYQcz6qauRXxhHEN3mEC13Z1iDh1AdrCD4dO5PnF+vO2X79AVGBcU4A4tH6lIMu98J3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQiQVkd7nfF8ybd/zwGfjjcp43tW2vH657BZCdKENiA=;
 b=nmTConpXLQ7iayPko5TZ9y6SElszEaapm9VIHc03IgVHi1upi2Mgrj9dBJwAr9Qq4RwDUWNQrVsrbLx9NZezQpYApbmLbEAed92za34bKFFNCLlw8lxC5ObnzByGVFQYumjpaVwRaiOo2appAIWVr5cnV7CL14FJDN7SmEoBtyT0F4w+jIP30bQEcLxMueIOLyWHl8aTjSbtNMWtOe9Kuih/Hg7/umhTHlJMcj7Ogz01S8EUJq4GM9TLk/hbbgTr1bRbPNtjPGmJuEJedNT6fgEHVuLXTAtmOGvvDiAtarQ64cFEskYBbj7I7UKd/AzQ1JuXleRnVwAX/4rpW2iSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Wed, 22 Nov
 2023 10:17:38 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3%7]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:17:38 +0000
Message-ID: <1bbfaa5e-b9b9-4986-846f-6292a6b36ccd@intel.com>
Date: Wed, 22 Nov 2023 11:17:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: rswitch: Fix missing dev_kfree_skb_any()
 in error path
Content-Language: en-US
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, <s.shtylyov@omp.ru>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
 <20231122051143.3660780-4-yoshihiro.shimoda.uh@renesas.com>
From: Wojciech Drewek <wojciech.drewek@intel.com>
In-Reply-To: <20231122051143.3660780-4-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5776:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bd3319-276a-4454-cf0b-08dbeb4440aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m40mCft79mSLOyLe3f8inOxtPo05mLkrlU8YiuukCFUACLGUeWR9/Kuym/j4yRL7eca3myrSuLLpxg/LmYp9Zz+vtV+tyJLGPzXVSNzXLvIE+GeCQpMMf0bBEOBD8AWrLQfG0kNAO4ivJhRis+jDOv3sdg8ZEz4rLVscPoXsJs+3Aainak6/vbsGJBe+ElLeO9jSVmix/bt9dsdzHj44/mb9WGYTLlatC+k4zPECUUfnb9N7/OvbjOPIylJb1g4u0HoIeePtsWAI5COizKRFvF9Lsw05IhRYj5kzMES29Bmx1BhtWCJ/MEpCp29omUzgBD2F61SYy2X2r7eAHSI2CAyMtIywn1vixQ2f8x9CmiQ4FFKY81MPvS9FEy1NAxJbtyJKltIUNU4POyaskRw3g3KLP7+yeuViCYDLWa/vjZxwxKnU/RLfwt8qAjnjVvhR2v7cmovvd/yO3YXqM5L5rZPkyC0CO7i3kvTSz3SXK1JFLal2q47tfeCaDkRFmh3GISmi+nsK+5zd/hRWJuSHyD1Cfmlcy5gVqfA8eJrZXWmDiXkwtPMuudwfhOCu8Hx735PZ4AFN7jBH1PHWqfRiPnEAW5n9se2epgSa6zT51eijK9zZ/wrHUTm6IdGXkDZrGjRmlH2rJNIr7+z4R6tUiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5776.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(5660300002)(86362001)(44832011)(36756003)(2906002)(83380400001)(31696002)(6506007)(53546011)(6666004)(82960400001)(26005)(478600001)(2616005)(6486002)(6512007)(316002)(38100700002)(66476007)(8936002)(31686004)(66556008)(8676002)(66946007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dThEQlVCdnpaUjRTd0xYWW9NZFpUdUl5eFQ2NG1Va2liYXp1VEVZQkQzZG1S?=
 =?utf-8?B?a1c2NzdzZ2V1eFVaSmJXbDluRUJhT1NsSW44Vld0ejEzaXF3U0FqZGs4dUQ3?=
 =?utf-8?B?YzlSVUZkR1pjdHYvVWpJYjR6L3U3WE16dms4ak9aUjA5S2FmZlZURDF2ajk1?=
 =?utf-8?B?YnpxZ3RoNXE2eGZOUnVvWC9OQnpkQUtmdW5wK2ZQVGkyUFVGL0NtZzR4TWFQ?=
 =?utf-8?B?VzFDZVBuVjZLalYyaEVhTVFpL3VjeExpVUZuNVRzQ2tHUnpzd0VsampUTFdp?=
 =?utf-8?B?cTFlcmt0N1ZIWml1UnpNN3F5VG9MMnJpLzBWQXo1WWVmN0NwOFcvd1lVeW9h?=
 =?utf-8?B?YXVxdXY4TVhlbHp3QzhEWS8wWGRCMXNwM1E0NmMwSUVsZitMV01vUGNJUE81?=
 =?utf-8?B?SnJOWTF3N1JGcGlTNnhkVHNKMjBoSE1uQ1U2OTJXZmVoMTY5bDViZVpMQzlP?=
 =?utf-8?B?RmRBZXdHem1XNWJ1WUpnV2RwUnFuNlZwZnQ3Sm44TjQ2djJXQTJvVHdsZkRW?=
 =?utf-8?B?eWZTdWpqbElKbS9YaEJaREJEVldOUlRXMzVzU0V3eFFIUkROUFlqMkovSXFk?=
 =?utf-8?B?Tk1MSnQ1QXRzU1ovdGNPT3NFYnF2VHNZR2lsL3J6SktEN0s4N2JOQlVKeHla?=
 =?utf-8?B?REdTMlJQME5uZ3ZLUXRBWS9TWG5sZjFYbDBqMkkvZmI4MzRrNmFuZzVzcnQz?=
 =?utf-8?B?WjRqNTE1bE80QnlmdnVseTh2cnB2OGsrS2xheGdEZm41cUplNlVDdFRKcnA1?=
 =?utf-8?B?VFZiNUlrKzNkeS9TNWF2bjQvVkRZelNuVE1HUng2eVhEYzBuT1BJUXIzR3FO?=
 =?utf-8?B?U2I0c2VQcGJybkRDK0xwRVU0V3ppeERueUllTW5QdFV6QzVzRFVUNERpMDU2?=
 =?utf-8?B?d0xWTjBDNHlWdE5GMzU3SnhNL2xMM1NkOGJ1NjJLaURNUUJYZGVCM0pEVVlv?=
 =?utf-8?B?dktJeHBIYURaUzlXdXhKeWRsVTJpOVFTa1hMMGZTeGtJZThoSkFXVHU2VlIz?=
 =?utf-8?B?aWh3YUlMc2Z2MDFxWUkxNnlrNXJNMzJUcU1SMlFzRSt4SFJwV3dRUWdUVndz?=
 =?utf-8?B?OVVrSjloSFVxV1pic0dxaCtYZkpzRHJNK3NMYXl4aHdEc3FJbTcyNnBoK0du?=
 =?utf-8?B?Ky9YVjQwTE1UeHZ4Tm5yS3RmcHFPMEgzeTY5K1g3SnJ1aW5wWlpFSkFLTE80?=
 =?utf-8?B?TldhdlJWcmRLTExFZWkxVEkwdjhTZmsybW9uRElCMDNpVGJEU1ZIWXl4YUVv?=
 =?utf-8?B?cWxKQjhDTHR4SVVWam01U2dzSFFGOGRlaFAyQVhhMzh1bHdRa1JQTFhFNEVa?=
 =?utf-8?B?SEFBU2ZzVE9hUnk4a3dPc2dlMGw1S3dmK0hQMWE4bHYrcGpvaVhYdGI1ZzdS?=
 =?utf-8?B?NmUrN2x1R0hoNFpVekhwdGJVcW5QQ3dCVllUUjBONjRhc2h1Q2tsZWZ5NVYx?=
 =?utf-8?B?eWNVWWZuTmFWNnNiVjRBSnhiNHd6aXBWZHZKNlM0S1A3R2NJUVM2U3MxYXUz?=
 =?utf-8?B?R1F1ZUFSem01b2JCVEdmcnRTbEN1UGpLKzAraVJqOU9LYlRDbVhSaGlDYUxa?=
 =?utf-8?B?bTlEakNJaFkrWm9KTmFlRkIySE9YY2JyVSswNklvY0Fmc28zYXZOVjNESitE?=
 =?utf-8?B?dzFzMnRyMmpvS29nelZlaE5PYXZPa0xFbkJCem1WcFloWkVnc09VM2F2OG9h?=
 =?utf-8?B?VGdYVkhweHQyK2JEbDh3ZkRWNlQ3MFhrUCtYYlA0TDZBTjc3N1Bsc0FCRzI2?=
 =?utf-8?B?V2ZEd1l3K1lQckx0bDhaUnNrdzEzYm05QXVsdU1rd05RNzRWNFpnV0RscXEr?=
 =?utf-8?B?czdjNUlWZWtJQU4yNVA2QVNnb2VMaDk2T05tN0ExbVFOc0pUMTdDeVFwMUNH?=
 =?utf-8?B?YkpNdjd0Yms5aDBPRDJUcnNBQnJsTE1TQ2EyWXljaW1PTlpXVG9wL2VKOFJ4?=
 =?utf-8?B?TXNTcDlOdTZvWE9PWlRSRUpjVnR2bDBkU0xjMSs1TW5VeGVkYktWYnZ0WTA5?=
 =?utf-8?B?dXhzaDFwdmlCUTVEOFdZcGN2YVdSbU9RZ0gzZjEwcUdxVmJyZGhKZi9ZWnl2?=
 =?utf-8?B?UkF4dE41WklSWVVwMDRwVEtheFh5OU9STHkxdmZCOHpPRHBMdG94MEFFK1Uz?=
 =?utf-8?B?SjJOblYvZ0hnSnozMndYNGltVHVuTFVXeFZNOWpMVTZqWVd1ZUNjRzEwRGpa?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bd3319-276a-4454-cf0b-08dbeb4440aa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:17:38.0519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ3dCDkRcCvBYsLQ3sf3Vapy70HhCfBblpS+Sl/Yj1bWNd1dmEprLrtCFxF5hxovxwJu0CTUovVAN+wVh+oZHkS/C2O9PE50WpI/k1PxgiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-OriginatorOrg: intel.com



On 22.11.2023 06:11, Yoshihiro Shimoda wrote:
> Before returning the rswitch_start_xmit() in the error path,
> dev_kfree_skb_any() should be called. So, fix it.
> 
> Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accuracy")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---

Nice cleanup
Reviewed-by: Wojciech Drewek <wojciech.drewek@intel.com>

>  drivers/net/ethernet/renesas/rswitch.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 45bf9808c143..e77c6ff93d81 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1517,10 +1517,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  		return ret;
>  
>  	dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len, DMA_TO_DEVICE);
> -	if (dma_mapping_error(ndev->dev.parent, dma_addr)) {
> -		dev_kfree_skb_any(skb);
> -		return ret;
> -	}
> +	if (dma_mapping_error(ndev->dev.parent, dma_addr))
> +		goto err_kfree;
>  
>  	gq->skbs[gq->cur] = skb;
>  	desc = &gq->tx_ring[gq->cur];
> @@ -1533,10 +1531,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  		struct rswitch_gwca_ts_info *ts_info;
>  
>  		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
> -		if (!ts_info) {
> -			dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
> -			return ret;
> -		}
> +		if (!ts_info)
> +			goto err_unmap;
>  
>  		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
>  		rdev->ts_tag++;
> @@ -1558,6 +1554,14 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  	gq->cur = rswitch_next_queue_index(gq, true, 1);
>  	rswitch_modify(rdev->addr, GWTRC(gq->index), 0, BIT(gq->index % 32));
>  
> +	return ret;
> +
> +err_unmap:
> +	dma_unmap_single(ndev->dev.parent, dma_addr, skb->len, DMA_TO_DEVICE);
> +
> +err_kfree:
> +	dev_kfree_skb_any(skb);
> +
>  	return ret;
>  }
>  

