Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857675A915E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 09:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbiIAH5t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 03:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiIAH5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 03:57:48 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4828B6DACF
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Sep 2022 00:57:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DE3Z+/qVlR15zXQSlczkn+KwLSHl+N/angGMbCgHEykGkpwd0Rw61Pp6Tt5hEwvAcU0ebNXEPtf6eIgNtlv2DP31a4rnvF5KBNSd+ib9CExVmiNHvq6pMcPhHs+6/FT63x49GmsxIpzCC8j4uY1xnxeR2pJh+v3IywmOOIWT9grqpBLHc1cIi60LzQSZZTc7De0qP94CNJbvWkusPbel0NLKcbkxuFCeL/LQY6we2kdfzX3gxBxvsk/RaKer6AKgj9d1J3yVEzafeZl7KLLOnQQ33aXbBUC4pCAWxc7uJdbS72BgVcthTA3X9xIYLPtWoa1zuT9zbqmR6vxuoAz65A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Fye5XZZc8Bp+R82adUezkiLQa15lTZCblpNiKH9Fhw=;
 b=edUFwXKmP/Kup6FI+9qHkAj7ozPIhH+D+4Y2iMoyQB2gYDeSfxhMEpzw67H/H3e9ackRdHHXWNcFQOzaRAVazHsK8gDbUnRFV2M/+asCHbRfJzVzP6y7qeTefzudITF94fcBaduIjU3FIRgvRsPMNM2Bhr3p2YoWVdI0JxX/Cvh62FAUuA+REO9QnaGZgHMeWPx1ogvuefMlMBuUhU8PwbKTSvncbM3adasFvswIzwL8+RvRbjLZXjtp/Q00nfNaZW9a/quqqHHl9FzyEVT+RlmBVd/naDpSiLdh8LWEOsl3dLSnD4s1jPBJQ0YMn8jP/ZF9BrZsnRG4j0Z3PcVPag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fye5XZZc8Bp+R82adUezkiLQa15lTZCblpNiKH9Fhw=;
 b=EOVpuoGbHEdar3pCQ1AcbHp9aSFqu3wWYb50t52zKXYFIx/zxzY0uTH7PTP+xCHFTlDWtAnZDD7tqUK+GPCuOWkPfLKE48ydmGrcix4cSKMvpSqWElckOjCk2O27bKpiDrwfshxRVUY9wNu+2vaCT8vVpmQ9RSBG1hVfkOH1c0M=
Received: from DU2PR04CA0205.eurprd04.prod.outlook.com (2603:10a6:10:28d::30)
 by PR3PR08MB5643.eurprd08.prod.outlook.com (2603:10a6:102:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:57:40 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::ee) by DU2PR04CA0205.outlook.office365.com
 (2603:10a6:10:28d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Thu, 1 Sep 2022 07:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 07:57:40 +0000
Received: ("Tessian outbound 2af316122c7a:v123"); Thu, 01 Sep 2022 07:57:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f579a471bb2b847
X-CR-MTA-TID: 64aa7808
Received: from 2e6c61cf536e.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4193428E-06CA-41FB-B134-BF5BF08C5BD1.1;
        Thu, 01 Sep 2022 07:57:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e6c61cf536e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Sep 2022 07:57:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaWhxVhRB9jNaVW95QgsCky+knQTEgigULVslyPM+j99OcMr3c3Y9TTfEAsXSWlf3Jc9d9GYewb2WLDuXCqJu2SGhzIxuWQevoKZArTn4qK7ide2nehyBpHnlwpXMn1HnnpKkkRnylhEDzGt2bIG9szPE0Ra+BHlDPUmlid2adpWCU3JfEIv/xtwrGUg9K6nJbv4bGzAdRX/lBOlWJEAYuqJK6znlsRQSsyOhRnuwWXLMTMCw9//hV95NflBztAbdFCgqvyVSlBRgd6nj7WTFgUtUmVi1yvYQShqw0fpkanoRUlRyWquKiXAiGq0C+I06HMVI/bcUvFcbmFLzhKHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Fye5XZZc8Bp+R82adUezkiLQa15lTZCblpNiKH9Fhw=;
 b=CY81/O+rEmWulcpRn7DwTIM65BVuBC1wqw6nAFpRxUGwjNnLW4N2k+/l15N2JIXjiquwc74a6Jr4ZMPUa8mwS9XhtbdaaJNY1CExP0BeliISpMoa5qbhZpWLGuzeuMvHxskViZOzFG3uUgAHxeTGWbasV/1P+MUewbOXnMvySoGK21lrkmpKple5etfCqXJ1s4x1B+kUPj0Uc1W3TDigbFnrQssKFZVEnULIyl4802D1fSjhVnj2AWRo602Zp4UiB8YtV9dt+4nEkxdVZGF9jLo+0qWy2xHwlHe/04up//wEzEKI84IhJ29uHN5J+VpmlMXwNelluNLQCNEtzpEU/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Fye5XZZc8Bp+R82adUezkiLQa15lTZCblpNiKH9Fhw=;
 b=EOVpuoGbHEdar3pCQ1AcbHp9aSFqu3wWYb50t52zKXYFIx/zxzY0uTH7PTP+xCHFTlDWtAnZDD7tqUK+GPCuOWkPfLKE48ydmGrcix4cSKMvpSqWElckOjCk2O27bKpiDrwfshxRVUY9wNu+2vaCT8vVpmQ9RSBG1hVfkOH1c0M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from HE1PR08MB2827.eurprd08.prod.outlook.com (2603:10a6:7:37::11) by
 PA4PR08MB7460.eurprd08.prod.outlook.com (2603:10a6:102:2a7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Thu, 1 Sep 2022 07:57:26 +0000
Received: from HE1PR08MB2827.eurprd08.prod.outlook.com
 ([fe80::513f:1ee8:627d:2a57]) by HE1PR08MB2827.eurprd08.prod.outlook.com
 ([fe80::513f:1ee8:627d:2a57%5]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 07:57:26 +0000
Message-ID: <7b05d61c-3f81-c58d-3728-88a2b4a5201f@arm.com>
Date:   Thu, 1 Sep 2022 09:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [TF-A] Re: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node
 name
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        tf-a@lists.trustedfirmware.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jorge Ramirez-Ortiz <jramirez@baylibre.com>
References: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
 <CAMuHMdWdrugZEN=7yqrsSc86AeuFR2=qM7nRk_aD=UXW9Q6cLQ@mail.gmail.com>
 <CAMuHMdWiQNjx9_hDhMEe0gHLiqLw1U0Sy0JSb+bdXHEBMgyNvg@mail.gmail.com>
 <CAMuHMdXAdeVXFytY4_ffNUJ6JVVt4SpVyk4wwDx4yMNY4hwG4Q@mail.gmail.com>
From:   Sandrine Bailleux <sandrine.bailleux@arm.com>
In-Reply-To: <CAMuHMdXAdeVXFytY4_ffNUJ6JVVt4SpVyk4wwDx4yMNY4hwG4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::13) To HE1PR08MB2827.eurprd08.prod.outlook.com
 (2603:10a6:7:37::11)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8b0aace2-5c5b-4898-c7f0-08da8befa48d
X-MS-TrafficTypeDiagnostic: PA4PR08MB7460:EE_|DBAEUR03FT049:EE_|PR3PR08MB5643:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ePlE9h9Tp/dFUtm7mxCKrN63qifL0h+BoFSOZ5eawJkJc5lgbPQRvt43ocowy+KVA9uu92PhBPab0x9NMVZSDU4Oqpo3QTM6iwjl1EZcRZ4Ze2dtx3/KFHOn1gUUtbbC59K0S0Gns/d8IdcXWfiivtFJ9YePubcByVAgJgqrz8n5oJgY9btTklrDLMbdt8dbGpFFoflqII4UcKqW8zwvZ2fM2Ae9j9sYyXTRxvGZbMf98T8L1nBS4d4WTU1k9RbBvlkjERKnfYysBnIWP94emBZqn2HSY/dF4Jf0ZaobtKmhJhUV5hQdPygcx0DrNbK54rT7/q+jVIPhDmbx8ENuHOamk0DGB6STLwjiVqe9A36NFPJrssDlvppEmBI40Js/gCJNmtwjTNixPii3HlLGxbbY9lU+jB3tCUvml/tbNYGl/vVqCwZib+RHIibGqgm6Zsyf1P7ziZAMoy0c7oxV4Iwa5LLhbWxCV7Fki4dewcO8kqwIXLvnJPgTSDozin99KtLwfYRpTGQCkg0NSwPKEjHKEm7aznxOiXRySrmlNhfhH2rqSREs7F9yEffffOZ3eXrG7UHFyBNBjG5S5UlO77crtJMr8zbqO97hOmELOOFVjlTx260hBttIT955ns2AkDQBmuCAusZ7e0bGQ9NNXYIjxlEZShSQ+XOfo+AaYXOC4cj/o0rKK5cj+Gl1uBl0wc+wkofkTVnNuWS6PLc6CETWV2hLpevG2hJTk0xML/7YwoMUAM2Ya2WrS12iYU5bE3+THmXfQ6LdMh56MLVb6zeVcrWeujiJ+K6ilxA2xXfmG7HRE2L9KkQKnLUAWLxKpkbeaTvs7deOBw/UqLCKiu3Od6WoMr8JFc/dAV7RdcQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR08MB2827.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(83380400001)(66476007)(31696002)(86362001)(36756003)(38100700002)(44832011)(54906003)(41300700001)(5660300002)(478600001)(316002)(8936002)(31686004)(66556008)(66946007)(4326008)(8676002)(966005)(6486002)(186003)(6506007)(6512007)(26005)(2616005)(6666004)(53546011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7460
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 33597729-fb2b-4a26-4a14-08da8bef9c45
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dz1Bg85w82oqvbVW50tsgIwjBI4IFBMucnbj06MRWRGjIORDzD8m1k45NHij+zyzBpqmSJb3ncGHozWjmfLAyaBnWzuLAAL0FMrp/OBbUpRuGf8MRIj0HXDq2W6A9hnX/Tz53VuXz2I0czl2qGrx6vdMQLLgHIJziX0moNPTFpEp3PqNV9WC6/+rutRSayS/REDtUQZdKfa/+2u0gwn3mZCwuzRPApCFPQJbk0eKBeV+pyHLw8YsLeO1Gwjf/Qj7BQZhLgcpuHlruvLTwyr2bfsmUVsLtfYgs9bGdwal9tCG7BPe+XNCKLQn7T/JGJTnKGwm23FlAA9AqsyC9PtCxbsZMKqIWMEWCuUNRl1pycdWKD7O8cqjBVDNjDvg6u/EVlX+wHdaqTA+eWpMnl1mziScjZX5H5y9rf3g6bes07BkQrGqoPeKhgZ8dF2e38JTMMzMujV+MYK2FZqmb2MTgwfAJgoqX/XSBBsxH5+OIhqRIIM3S53QdYuDfr8mSEV8eG0eXKBO3asD5a4XpsRuLnEYsvFVUTxpydDOA+9NTuRW32IJzgn0nEy6InexPMcIA7aZfEOMwPfk9WebM3fqd7gjJMYzqZr9wQbrDB645breYw9O4w+QR1VUPAtFKNz9Uy6mEGx5FHInRrKX/ALbQm9cYlhLYKy0gRZaIh5O6rhWpmfhV2kKyX7JVBiWkLssVniZc26WVwcidV9OHUaNu/zRM4G7jLVscITuPMPxO/U8HmBt0NQ4kh0ZV4Kso0O8AU789s4j4L7ZtsMx/uKhA1KUVaOMlAMZprQEB4vhEABkgo6HXzs37tpngD3d8XDbRytvmFNu/7hZ7iDgkdtGT+Lnw+Ca0UKNlkujZVPWVjH4XcisukssTQ6BfxCZ0j/O
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(40470700004)(46966006)(36840700001)(8676002)(47076005)(186003)(86362001)(31696002)(336012)(82740400003)(81166007)(356005)(40460700003)(2616005)(83380400001)(5660300002)(36860700001)(36756003)(8936002)(2906002)(44832011)(31686004)(70206006)(4326008)(70586007)(40480700001)(966005)(82310400005)(41300700001)(478600001)(6512007)(26005)(6486002)(6666004)(6506007)(53546011)(107886003)(316002)(54906003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:57:40.0546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0aace2-5c5b-4898-c7f0-08da8befa48d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5643
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch!

TF-A project uses Gerrit for code reviews. Please refer to the 
"Contributor's Guide" [1], in particular section "6.3. Submitting Changes".

Could you please post your patch to review.trustedfirmware.org, adding 
the Renesas platform maintainers as reviewers?

I will trigger a CI run on your patch (in this case, given the nature of 
the change, this is mainly just for commit message compliance) and I'll 
provide the "maintainer" review.

Best regards,
Sandrine

[1] 
https://trustedfirmware-a.readthedocs.io/en/latest/process/contributing.html

On 8/24/22 11:54, Geert Uytterhoeven via TF-A wrote:
> CC the other Renesas rcar-gen3 platform port maintainer
> 
> On Wed, Aug 24, 2022 at 10:04 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Wed, Jun 15, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> On Tue, Mar 29, 2022 at 2:17 PM Geert Uytterhoeven
>>> <geert+renesas@glider.be> wrote:
>>>> According to the Generic Names Recommendation in the Devicetree
>>>> Specification Release v0.3, and the DT Bindings for the Renesas Reduced
>>>> Pin Count Interface, the node name for a Renesas RPC-IF device should be
>>>> "spi".  The node name matters, as the node is enabled by passing a DT
>>>> fragment from TF-A to subsequent software.
>>>>
>>>> Fix this by renaming the device nodes from "rpc" to "spi".
>>>>
>>>> Fixes: 12c75c8886a0ee69 ("feat(plat/rcar3): emit RPC status to DT fragment if RPC unlocked")
>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> ---
>>>> Background:
>>>>
>>>> On Renesas R-Car Gen3 platforms, the SPI Multi I/O Bus Controllers
>>>> (RPC-IF) provide access to HyperFlash or QSPI storage.  On production
>>>> systems, they are typically locked by the TF-A firmware, unless TF-A is
>>>> built with RCAR_RPC_HYPERFLASH_LOCKED=0.  When unlocked, TF-A
>>>> communicates this to subsequent software by passing a DT fragment that
>>>> sets the "status" property of the RPC-IF device node to "okay".
>>>>
>>>> Unfortunately there are several issues preventing this from working all
>>>> the way to Linux:
>>>>    1. TF-A (and U-Boot on the receiving side) uses a device node name
>>>>       that does not conform to the DT specification nor the DT bindings
>>>>       for RPC-IF,
>>>>    2. While U-Boot receives the RPC-IF enablement from TF-A, it does not
>>>>       propagate it to Linux yet,
>>>>    3. The DTS files that are part of Linux do not have RPC HyperFlash
>>>>       support yet.
>>>>
>>>> This patch takes care of the first issue in TF-A.
>>>>
>>>> The related patches for U-Boot are [1].
>>>> Patches to enable RPC-IF support in Linux are available at [2].
>>>
>>> The patches to enable RPC HyperFlash support in Linux are now in
>>> v5.19-rc1.  What needs to be done to accept the TF-A counterpart?
>>
>> The Linux counterpart is now in v5.19.
>> Can you please apply this patch to TF-A?
>> Thanks!
>>
>>>> [1] "[PATCH u-boot 0/3] renesas: Fix RPC-IF enablement"
>>>>      https://lore.kernel.org/r/cover.1648544792.git.geert+renesas@glider.be
>>>> [2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
>>>>      https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
>>>>
>>>> ---
>>>>   plat/renesas/rcar/bl2_plat_setup.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/plat/renesas/rcar/bl2_plat_setup.c b/plat/renesas/rcar/bl2_plat_setup.c
>>>> index bbfa16927d6c2384..f85db8d650c6b1a5 100644
>>>> --- a/plat/renesas/rcar/bl2_plat_setup.c
>>>> +++ b/plat/renesas/rcar/bl2_plat_setup.c
>>>> @@ -574,7 +574,7 @@ static void bl2_add_rpc_node(void)
>>>>                  goto err;
>>>>          }
>>>>
>>>> -       node = ret = fdt_add_subnode(fdt, node, "rpc@ee200000");
>>>> +       node = ret = fdt_add_subnode(fdt, node, "spi@ee200000");
>>>>          if (ret < 0) {
>>>>                  goto err;
>>>>          }
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
