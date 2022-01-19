Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A585493BC2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355060AbiASOMG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:12:06 -0500
Received: from mga06.intel.com ([134.134.136.31]:55879 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355040AbiASOMG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642601525; x=1674137525;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G4661XO7LFPvrFu/QUObKukTr6sqENCcEbAP3Xy3WNA=;
  b=NyLOWurolxfM/x6ZJKhFLK32lQtZVqK0tDVZc5EbfrP3ZNmCHV6qCajs
   q1HBjRiSlHPiAv36/OHDormOJe+OottoemErzt/THc8xDF/bvlp9DM0NU
   gw+NeeXTgjaN+D0k2BZX8RblJwPCdl7QMXgH8AsfhAYe1/D62OQh5cxbt
   2YuZMQJLNRIp92drmqcAPSdmT3Eb6I4k3h0vYvS6eBFspIEH4SzkzKMsV
   Apm8MjZ8t5b+IVXun0ylEZsKOIB4PlSkIloh2S1ea0RU0k59XETz5ASnf
   BDlphZCezDU4twhKSFV22GC7AM9gIhp18cmUdCmDJbKjFGbK60Lg2uVkl
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="305804154"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="305804154"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 06:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="532301193"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2022 06:12:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 06:12:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 19 Jan 2022 06:12:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 19 Jan 2022 06:12:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNOiA9sx0dfce6zqDtGRjoQ5hKEwCNgSZjWtWDIh7pphikgaF2a0BN6ymoeksT3mEBj6JggRLhY3ye5dcnS2vCAFdYf9PgGZ7oxrRJ6f5cZfDRckU/PVZjjQPXq8VJzW9n4fqU6EosJp/JaE8TsOMelIOkIXoA7ylnGN1qidM4eP/n84PyqlqSSXtjp9IMaw/1tMvqNJ3W6ZC8F+zcaHS+EpBjOuYWZ9cUncRDeZLfos+19ZyYsIymMIUIzg3/1ylDTjrTR2UPzQbrjoCmrYS4kIq3YWLx7M4atbAdqFXfHaOKDK3mhS9Ig8Mt395GTfcDoFHJw9nlLXy6QjlUy1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh/XKrRVvA8vp67aVr4+D0jYFcYw35viB57Z4SIR94c=;
 b=cEAeo6aLuyUugoFQpOqR1Taz+OJCE7MYZpqTwy0qCRfXuWmeqdOdg6NpF/uPfTpmaPnZX89XqUmlaRQJJUW6jnrByrQjqmwEHd1kGl8PWOVczW0DcLj3ayhs0/3S3mbA/TZzJG+8wLpQV4NHb8rbwIkHXBsuXls881RmL25na+nK4Ln/i1d03g2+AosT3H3JQVsH44o5WHt6+hrF0OfdWsrRL3z6UQQNXajAbqTRhCBBA/1pL2ckN1EcJKIkZXAXO+4IHml331gh3DHgLQ8Twy5avkI78VWap4yizvZ3BwAuwSIwWbiGs2RocznTG9rrFJ8H9rbqOJI3UNSQcH1RkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by DM5PR11MB1481.namprd11.prod.outlook.com (2603:10b6:4:9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Wed, 19 Jan 2022 14:11:59 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 14:11:59 +0000
Message-ID: <c085fb37-23b6-ceb8-422e-7143209ede6d@intel.com>
Date:   Wed, 19 Jan 2022 15:11:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v2 0/5] ASoC: sh: rz-ssi: Code cleanup and fixes
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>,
        <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220115012303.29651-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::26) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70aea69a-e722-48c3-024c-08d9db55a841
X-MS-TrafficTypeDiagnostic: DM5PR11MB1481:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB14811CE9C5202073ADA9458BE3599@DM5PR11MB1481.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9ulQzHl0gOtGSoy2N837s70veSnIJomOBg9smEVzEixVovDXSez63HokO53LiUSfVWNc06Gx9U7VlYPv4gSrSc9Xh5Ui3Rr0eD2udpLAmekULe/Pbq6UdspTAuULDGKtwR5apyzeCcBkO+0ItkQBKKBPazv3waBJHgYEtsZ/C7k83r1UnywJCcDa5hyHc/6dxU9dKs0CC4lZ4LMjW8C9YjdICUbDu7AGkBUM4iqhKVwNOcQ0Ow9QgccvL9RCwxmGyg+eMKbylcXiO7V1P5selk0krXWrslw5TmIbu8y2hBONJUq3sYOVYOyC+zRqLDFEb7Pa47Q+BlNZ6q8i6Kar3iFx5Dof7DQRnCaFDZ6TPJ0N90S8oP5rqQy8rQeLT+grxe7HMpZkH5+jWS6j1tkmykg2JyqiS9i0AC01arnTKq5mal94oGO/okqfByYh0YVJGSoD01d5gWPDMTAdLBPHAaQuyl82LXu2uAZ0JcZZdA/38Cb8bGDaTaHcTVWBilIncwABgwKqWZJatJQrK0Hw0oUTSIeSPTJxnrUUWfefiWFTVK8sJ9TkrJu2zTa3CiBYQhtjAFhSbfAz3Sprn+MqHe1yk1uJ2lZcRD1QCCDugXMboIDz7b2rHrR0hi3VLj4acljq2XiS628pV3zQJvzMAItK0HmpWa1HxoEDpCjiQUeLcEyaoVItOx1TAR5kUN2iuC+P3F1Rde0w0nYqbV9q68Zct9lZsptKxKm8uaLYA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4049.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(186003)(6506007)(4326008)(31696002)(83380400001)(53546011)(508600001)(36756003)(316002)(5660300002)(2616005)(8936002)(8676002)(54906003)(38100700002)(66946007)(31686004)(6486002)(26005)(2906002)(6916009)(66476007)(66556008)(6512007)(44832011)(82960400001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzdPbmhreFpGWko5UkplbXloS2JERUNpQ2NBcEpqYXNQaFl3L29VaVZGcHh1?=
 =?utf-8?B?elhmQnUzVUR6ZDU4VHdhTUJxc3RoYVBmbWtScUw1akVISlFucys5VW5zbFlu?=
 =?utf-8?B?bEZrTldhazI0TTZaOXlRd09pOWpueXVqa2RwVUVsS2ZXMU91ZmVvRm9sazVz?=
 =?utf-8?B?VmdKZDdBVlQ2cC83WUJpRDFWMHdXbTI4Q2lQNngwVHU5TlY3TXAxWFhxdGdI?=
 =?utf-8?B?VERFTXprejlNYmh3dTI5Q1cyWTU5TFZHek1aaDBRRnRjOUxJOVdXZ0pUWTFh?=
 =?utf-8?B?b25pMmN5bVhGNjUwVjdwYUdFUU1DWXg5OU1RaWRvYmZMaG8wRkpXVUIvc2xG?=
 =?utf-8?B?TDdEL05Ya2phR2c3b0MwcVMxZUlNZUZxcWNDNnRpTFFqTXk1RHA2Q1NmQnY0?=
 =?utf-8?B?QlI4d0JYYTBhZUJZdHhtZG9EaGxnRWhDVjRITDhIU0ZmcFlTaTRYUXNBbTdZ?=
 =?utf-8?B?V29ZRGZQUXZmMzdDTVdaSnBoNjJSSi93bjlKZUk3cEYrVUhRb1FqZHVJZmY3?=
 =?utf-8?B?RSswdWJ2UVoxb240MVNrWkxRcDJ2YnpIMlZ6NjF6TWs5RHNydEg0dXBxTzl4?=
 =?utf-8?B?RktiUzU2Nld1SXJWR0tvR0t4QUtEcjd5Q3h0M211R1F2T25DUFpmWGxYYVlH?=
 =?utf-8?B?SEhBTUMyZkszQ25iZ3ptaTNRT0dRcFBTYk40QTR5amE1OGNMRmFGL0VuZStz?=
 =?utf-8?B?QmNwZTRabHBCbWNBYmxHQ1lVWDg5SlAvZWw5WHNRdENYaFZtaGQ3aWVXYzFJ?=
 =?utf-8?B?RVlzV3Yyb3NLVG5yUFptY1NYOE5ZN2JTdDVCQkZWMlNTQ0xua0htaHpITE5T?=
 =?utf-8?B?ZHVKTGc4ZFlUeU8xbXlKSTFXYlZ3amtKSXZEcGgzaVkvYUtKS20wZmovaGdJ?=
 =?utf-8?B?N21ZSGg4T2xSd3VFU2I4LzZxTFRtRDFzajhYcHludTgwOVl3clV3cUdMVzc0?=
 =?utf-8?B?UDVNTnc1amhVdERJMTZJcFFVWnJQMnc1QzJhd3N4VHhxZEdPQkMyWDIvYWMz?=
 =?utf-8?B?c1h5a1RSMkFXWWliTjdEYnZ0S05FOW5nWE12R0w3Mjk3YlFhemRHZGhSTm9F?=
 =?utf-8?B?anhjTjBOMHBuZFByVnhGVHlMblNKRGpMUlZXd2FWOHpmQVZ3VE1GYm50djZi?=
 =?utf-8?B?ejRyQjVodDJTYlZDeTJrYzNXaEVFRHJWOXlNMkNtdlQycWFac3h2bURWYWJS?=
 =?utf-8?B?RGRhT1BLYS8xSjFDbHg4SldXUXBJdkZKTlRkeUVPZnl0bDhtQWFrMFJlcUsx?=
 =?utf-8?B?UncvVlBsbGhUYjRqbiszQ3hXNzhpYy9UcHNzblg1emVwOENLUEl0SEp2V1Rw?=
 =?utf-8?B?UXdnR042NGtkQjYwaTJFNVUrMVU2bCtUdi8wU3RmenRnczAvNnk4bEV3clo3?=
 =?utf-8?B?cmhYeUp4bFVmTGZGdGdmcnVCc3B4dnlvOFVnVEpOdk1ia0dhc1AydWl5d3Jo?=
 =?utf-8?B?Sm5Wd1o3bnc5L2xyU3RaT1ExT3ZIT3B4U0t3VEc5M2s1RVBsVHpDYkg5YVZU?=
 =?utf-8?B?N044eTVReHJ0MjJjZXBHNjJYR3lzdUd3a3pRS21OZzZzNXJwVTNyZVJOcFZt?=
 =?utf-8?B?aVJRTVFrVzdYZG43NWc2c2YzMWtDR09rK05MMUUzcERRNW1GbTFOalZRMSta?=
 =?utf-8?B?YWNyZmZkMHRzcmFSeWJvdnJmdzFoeTlZR3huQ0VvNEVXOGNkR3UzMUdWNUYw?=
 =?utf-8?B?MUZ1Q3o4WlRmVEcxYVJkeFUyME9Dd05rK0lYdThwajVGWE9pWVFhbFNtcXpw?=
 =?utf-8?B?OWF2YXdkd1Blb2Y5dzQ2SkRzcmw2R0h0dG81eGJDT0dhTGE0NUxSRmVOSTR6?=
 =?utf-8?B?R1NMMHk5cks1YVdtclFyV1ZUTmdyUmk2OEk3cDlCeDdsaU96ajc5ME92REFR?=
 =?utf-8?B?VlZwNXB1RjBZeHN3VkNDNG14OGFPSEtid2pNY0pJSzBJNEpoQ0MxT0MzWHVM?=
 =?utf-8?B?Yk9tc20vZTdJN1BaKzU0cXNLNExvRXhxSTFKTENYblRjZ0lORXU1NnJzdmhj?=
 =?utf-8?B?TmwxZXRoZ2VVbUtwdjNQUWhnc0YwVWp6N2xOOEdjbkYwUWRqdm5wSXVxSDdo?=
 =?utf-8?B?TE4zcDl5eERiaUNSN3I5ZGRFeEpuTmgwNlRHT2hvT2d4elowTEZPVG9wZUht?=
 =?utf-8?B?VFpVK20wV1NaYzgxc0FuSWdJTkhSdi84ckpmbmUvUU4xUEZEOSszODRmWkp0?=
 =?utf-8?B?TStTcnFPTzFFRFVaYlloK2hYOVdSNlllY29mWVoxODVlVVNsWXQ2M1E0V3RQ?=
 =?utf-8?B?MTUrdmg4ekJhWHhOcHc0SFp4a0JnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70aea69a-e722-48c3-024c-08d9db55a841
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 14:11:59.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3Ak0dpV7G/PMIWFg/GXoRuSq3v2x8za43KK6gtBTlaZE/vFF0oKsF2wrT8CwDjO/E3ZZ398kG6Wf5RWNr2nHc1rT88QcYJwCzsQo6pPIbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1481
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2022-01-15 2:22 AM, Lad Prabhakar wrote:
> Hi All,
> 
> This patch series does code cleanup and fixes to the rz-ssi driver.

Hello,

Suggestion for the future contributions below. My input is *not* to be 
treated as a blocker for the series and is not a reason for re-sending it.


Cover letter should provide a high-level view of the series. That 
includes but is not limited to the overall layout of the series. Here, 
it would be good to state why the fixes are made. Also, it is preferred 
to have the fixes leading the series, _before_ any cleanups.

This summary suggests that cleanups are leading the series instead. 
Think of cover-letter as of news-paper. Subsystem maintainers such as 
Mark and Takashi start here (read the first page first) to get the 
general idea of what the contributor is sending them. Being transparent 
only helps. Good descriptions also helps reviewers to know which patches 
to look at first. Fixes are obviously of more importance as they usually 
address issues troubling users of the release-builds. Such patches are 
also often backported down the stream, increasing the importance for 
their review.

There's more to it, but for the scope of this cover letter, this should 
suffice. It's just a suggestion but I hope you find it useful.


Regards,
Czarek

> Cheers,
> Prabhakar
> 
> Lad Prabhakar (5):
>    ASoC: sh: rz-ssi: Drop calling rz_ssi_pio_recv() recursively
>    ASoC: sh: rz-ssi: Make the data structures available before
>      registering the handlers
>    ASoC: sh: rz-ssi: Drop ssi parameter from rz_ssi_stream_init()
>    ASoC: sh: rz-ssi: Change return type of rz_ssi_stream_is_valid() to
>      bool
>    ASoC: sh: rz-ssi: Add rz_ssi_set_substream() helper function
> 
>   sound/soc/sh/rz-ssi.c | 107 +++++++++++++++++++++---------------------
>   1 file changed, 54 insertions(+), 53 deletions(-)
> 
