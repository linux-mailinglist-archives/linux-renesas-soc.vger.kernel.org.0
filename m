Return-Path: <linux-renesas-soc+bounces-97-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52F7F432D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 11:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21648B20F36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A774B5BE;
	Wed, 22 Nov 2023 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+zr4sNS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD1910C7;
	Wed, 22 Nov 2023 02:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700647465; x=1732183465;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nqSHwDjFKTfvjHcEHBDxvemVttyq6/rCHvUkKwfVLkM=;
  b=T+zr4sNSpLEN5csURS6OPT93729jcYC9AEmKW7kL2vH+f7UyPrzrUo+/
   ZzFQ3WHyxtMUivuJpEh+0pXvmFJokWUvZ8Z4GK1b6KYQAobfJICZ2lXve
   U6PO2SSz0B1rjYu3Nr2U1okLDY5WuuL9YCVudPh1ACrSe6XVtLB302pNN
   VLF1JM/Um1mHCnr6Pm/KyshKX1vCpqnMrERM7Et0GeepqObaG+AOR5/Nk
   I2v+2DRQx9Yjfr4OSLpmo1tGoR1gozkAp0W9mVXA1rz67qvAjc3ucwYjQ
   pdSqw9MQ4BEx8FnCfMHYizqN6VpmZAk3nc6I7/8GRG11RQttS+prrZNYl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="478231357"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="478231357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014184372"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="1014184372"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2023 02:04:14 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 02:04:14 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 02:04:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 02:04:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gatv6hUyVGmzGCqZL1qjqgdQ3NsstZMZUcx6boC5uFfdpeZlaKhJQNJ+iJAGA9i9xgMEzGSR9WYzVcVYjaFWqcYzx56GKI8h46cbie/fTa2Xqk2VzCK2hWpo5aPhjrGai3XGnLE1vtD0tD/bFYEZINv+TQ6TksOJS23H1BXXnHHBfcyE6TVqRnlpJIH/4y4bGFvkqxTgSDclS5xm/0dOEz4IWY6LWdG3+uzRUlP+I6aOA714q+jQP3Y6cPARdivq6emd8qJr6Geto1dH1aF8kFEzdO6kKlTs62w+fkNtB81YCe0EYpzeTRa592/V1vTuQ8ICyDJWOX18kXIEfaJkgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gfasm14BXN3kNgn4z+HO1u5Zsp4/q7hz/zOQu+t2R2c=;
 b=S/djZbrV3hCx1sBmo1rmwVu/vFpe+u5lX1nEaUkzLy41VW+UDY34Gw0NGHmdbncEWHrV1fnwgiZQONlLS1JCdLCqYuLM1w8bTGk6tvil50BE9O7N4x2sT4wg/8j1+yvNR9qsjXz4/x8KHuPJsJlaszC90m5iMjmWENvvEPsFMYwFHSueAHndutTyWezSQf0C6Co8OAue2gbK1qc81e8F8lKQmQmUJaeb7sfleA4UQ1pVfNthmDW9OjsxGWYH0GQ53ghkpTsSY2ic7+8UNcl5TJ1bxvI5XXrUme2Wh9Bmf9c7xngC4OPUW9x+U0t+RbW0wCDNPTQcQ2+l+32t5mQojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by PH7PR11MB7027.namprd11.prod.outlook.com (2603:10b6:510:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Wed, 22 Nov
 2023 10:04:12 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::49fc:ba56:787e:1fb3%7]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 10:04:11 +0000
Message-ID: <9e989150-021c-4b8a-850a-40f222c1c50c@intel.com>
Date: Wed, 22 Nov 2023 11:04:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/3] net: rswitch: Fix type of ret in
 rswitch_start_xmit()
Content-Language: en-US
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, <s.shtylyov@omp.ru>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20231122051143.3660780-1-yoshihiro.shimoda.uh@renesas.com>
 <20231122051143.3660780-2-yoshihiro.shimoda.uh@renesas.com>
From: Wojciech Drewek <wojciech.drewek@intel.com>
In-Reply-To: <20231122051143.3660780-2-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To MW4PR11MB5776.namprd11.prod.outlook.com
 (2603:10b6:303:183::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5776:EE_|PH7PR11MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd7f6b7-611c-4767-f687-08dbeb426026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTLa1pv6Yf7qDtxLcJFtR9iV+aun3j+p0dOi/8c65eRP4hshjqvvV3Ibq2ajGpTLbEsqeFtjQWVqx35GcFolnmxll1jultkfAgPmRCVS27zpBD6L1U2SP1UadBy7+3DZ8U4PrkSsSuBqeREXb1025v7tiUDTfE5ioi5jrj6SW/g10a84NLXLdT9HYGKIozDL6oR2WftSxMeDnvRluRZqskU3/JoBRn5v5K+qFSZs1S+nYVrVo/ydEnSC+2eXTHv+Ytw8WTBsEdGUiD+AxCK4x2lvEYBFUh+IwOdkEBmv/4y5bYW4prjAUExQtoemXSVoRix1v0IbfBUB57xBCVxtz+pEvaKjzLLgQ3YJIB8ds6AXR1RsHCV1HfmWfX7EFnJRNxbUVJsl93rlNf7ndKlpvKMMMV3dE4BSTaRJQyXKrL05o+FUE3w81/A2EeWFQPblwysYElZnSnpJobkc+6W2IYHSNt6XDwHLeLaQFKcY8kceMqkWRDN98CAgbUkddPAKb/KRDB+xrloU/Mw1DOLsmlcIM8DmH7I01oRFH1EoIkQCaYCNiR0bW6KDh2AET2QMmV/15aV/tt7Fff9VF/9IIJN0rN6oGEHn0wCRVGldbGYQ2mP6wbOdCm/2gDz6sLb76Fu6GbGqRqVrGsISikjleA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5776.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31696002)(82960400001)(38100700002)(86362001)(36756003)(66946007)(66476007)(316002)(66556008)(44832011)(53546011)(26005)(2616005)(6486002)(478600001)(6506007)(6512007)(5660300002)(2906002)(4326008)(8676002)(8936002)(31686004)(41300700001)(6666004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yzl2bGh3UURyeWQwVVlPRDgzeFhuMHFrdUVSVFJvZTY2djF2cHREcDVPNUdE?=
 =?utf-8?B?aTA2Qm1SbWtEV0ZjejQ1ZXNmeTVWcHYwYlFMQlFTV3dvUGdwWnBqN2VaaVFC?=
 =?utf-8?B?WkN2YzZXRDJvR2hUTXpFdGo3TXZOeFZCcVI0eVdVa01lVEM2QzN2M25MZFFi?=
 =?utf-8?B?KzkxY29RczBYRjRUcHBnODdEWllEcSs3dU50ZFA1bmpNSFdrcTczSGwyWlk3?=
 =?utf-8?B?bzFpMlBUOXluUlo5SE91aE1zOTFZRGxENEE4a25Xb05QUkxPYlkrT1h6eUk0?=
 =?utf-8?B?dWNtdHQrZEhpWFRZRE55OUFnYVFHd0JJZDlnRzZBdTVBSkw0c3pYNkRMNCtz?=
 =?utf-8?B?d2J5Z3ZVOFdER1hkSTN2RWIxaUVYMTVKbWR0c0daMWMrZ1h1dlRsdjNXVVFh?=
 =?utf-8?B?NlVuSm5Va1cyWlUvd3VKbVVxdEU5WTl1KzN0bDJPQmJpNEtpSUFQemJ4N1gx?=
 =?utf-8?B?anIramx4VVVxclR5T0cvZUdwcmpzVjQ0dmFtRW4rclZyaDlpdjdnNm9sNExB?=
 =?utf-8?B?RTF3ZitkTEEydFJhdFdBR0Nqdmxwd0tpcVd5ZDlmc1NQK1Z6bDJDbUc2SEVn?=
 =?utf-8?B?YkdFUEo2TktwSmxOQVJUbzhuTDRiVnFKUUZWWGVIMGFNejdQNnNjUWVFT2dO?=
 =?utf-8?B?QjliVmVTcERRd3lpQ3AxM01HY2hxYlhTdGUrRE9rcUlBeUVjMFlURkFIcmdn?=
 =?utf-8?B?ckNiVnAvb2gvdnVuaTAva0ZhaTc4MGRUVWttbXdjb2szNFYvQzRkK2pvWGI2?=
 =?utf-8?B?RThJZndZT0lqWEpveEFEWDBLZUNIRjhISkE3ekZPWUhndzZBT1dYdHVUUmNL?=
 =?utf-8?B?UUhPVnUyeWdlYWgzbTJnRDFLM2czQzBzSmphYno0K1ZKZnRuajJiMXFmRTNL?=
 =?utf-8?B?b044cEZ3a3NValZoQnFGbzBSY0pFVWtKaVYycDdFQ3hrUHluaSt0a2FJRUgw?=
 =?utf-8?B?aUVudFhjbDZpdWxmdnBOS1RMRS9kc0d3VFBYZWE4WVBVYmFuSjI4SDV3OW1E?=
 =?utf-8?B?b2hsZ2YwaTRvazN1a2MxV01EWjRIYzdyQkpVTDB0eDhHd0FXMlN3NnFuZ215?=
 =?utf-8?B?Y3EvNFl5eXlLTDBzVWFkRytEMFJWZC9hS1lGNEZmZkhNR05yNkJJMnZxb0xx?=
 =?utf-8?B?QStvUzdtTzgxdjV6cWFLUGRId3BYNEdPOHhMbTFsRm53WXArbWdPT215SlYx?=
 =?utf-8?B?WjNqRXZuSzlaUXIrREtTMUE5WFBobHlwNEdhVk9JTlcrQkp6OUZ1WmxXdGtT?=
 =?utf-8?B?cHBYZmZFZExWOW82U2QrTjRWdm1TVVBXSDRMWlh3czlGNG4rMEE2MlJKcGoz?=
 =?utf-8?B?RVpCd0Y1eVVQenFmd2RackxGN1FIMVVqVTdBU09Nb2F3NXFXM3Y2NGtVNmV6?=
 =?utf-8?B?eUg4aG1QRXRLeVFRaVRHZmhMaEFpaHZYNjAyc21aRHY1bU5xQ1RJcXRldVZx?=
 =?utf-8?B?Yzl5eGQraWVHUzlZZ1FabmsvazBwYkhVMndBZk45bm5oUFY0M0RQRk1JTEdT?=
 =?utf-8?B?NzI5VzAzeUNyZUtFNEp0Z1Fub0VxUXZScGJOUU9jV0UyQXpHd3F1UXRZTm5k?=
 =?utf-8?B?QmdHWmt1YU5GODV3eklnZS9UZTYvR0sxbWNmaDFhTTNlbUJiS2MxbzV3LytO?=
 =?utf-8?B?d09lRXZWYnQzc1l0Q2NOU0l1T2QxTEtOLy95Q0dCMzlpOXZ6eFVubW1Fd1Q1?=
 =?utf-8?B?NXdOVmNUUUtvYlRIaEVkUmdLK2JTYTJXZVZnQTE2djZvTzBBYk80djJqSElN?=
 =?utf-8?B?U3J6U2NqU2REdGUxS1JTVi9GVy9YZ3MzdHFQbi9zanJFYW81bEo0dTlGS1Vy?=
 =?utf-8?B?L0ZtMXBBZit6OGRBUStST3AyMDBVR29KcXNrU1hIajY5VTVRNVAxakJZUmpB?=
 =?utf-8?B?RHZXZXlsUUNFL2pDcFpLY3RQK0QvdkRCdDY3aDFWTUlMcS9IdFM0NHVEWFJt?=
 =?utf-8?B?TXl4cVpNMTIwWjlvbGRSOG9aaUdRVjBwcVFIQ3dNWDY5M3ZjQVFTNkdGaWRX?=
 =?utf-8?B?UDJYSzM3Q3FQM3ZEQXRUb2FvU3k2bEsrUzRtWnVDQ2RBL1J0UTYvZU9VS1dr?=
 =?utf-8?B?YkdST1NFRDJ0cGdYMVhJb2hTNFdxYzEybUNaVURyTVAwb3NGUCt2Ukp2TjFR?=
 =?utf-8?B?REZseW4yZTc1MUpJYTZSVXpDbVA3K1p5OHR3UEhrSHM3bnVVUzdock9RQ3hu?=
 =?utf-8?B?dFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd7f6b7-611c-4767-f687-08dbeb426026
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:04:11.9174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tgke477jFq2JRTMYc9M4ZXmX51x2qnu4a/7UBr4Zn3iMIdK12pijkG+qh4EgFJtUxnzL5/EvnlcbwwsOEwN8n9r9hVVfzJ3Cd+XMJG5SPW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7027
X-OriginatorOrg: intel.com



On 22.11.2023 06:11, Yoshihiro Shimoda wrote:
> The type of ret in rswitch_start_xmit() should be netdev_tx_t. So,
> fix it.
> 
> Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---

Hi,
Thanks for your patches!
Reviewed-by: Wojciech Drewek <wojciech.drewek@intel.com>

>  drivers/net/ethernet/renesas/rswitch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
> index 43a7795d6591..d53d90020904 100644
> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c
> @@ -1504,8 +1504,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
>  {
>  	struct rswitch_device *rdev = netdev_priv(ndev);
>  	struct rswitch_gwca_queue *gq = rdev->tx_queue;
> +	netdev_tx_t ret = NETDEV_TX_OK;
>  	struct rswitch_ext_desc *desc;
> -	int ret = NETDEV_TX_OK;
>  	dma_addr_t dma_addr;
>  
>  	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - 1) {

