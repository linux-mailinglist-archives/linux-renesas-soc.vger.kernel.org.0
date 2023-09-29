Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864747B2B01
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 06:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjI2Esh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 00:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjI2Esg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 00:48:36 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7450A199
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 21:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDD96I+mhFN2YBq7w4iHPwGLMdx5DaL4OFVGmRWH/Ifkz7EYw9kX4XoLumJPx5pNmyNHWDlgkcBw1t8mFpCZXvUnK32ERQ4Ww9tHKEueOszIGzIjUzx7lE/0IZjzZbeS1gt7wiQ+Tx214phvp7Lmv8kv5cUYbRbjH5zBC3cJhAcoBZeKnkyQR4wfuSqH3SoyVdBuNbvf0rE9DUIxBwL2CcexJYQ09aFn+ygaFVIkgZq/TUQxDMi7IUAt9aQ6e+ePOBlvtVc6wIr5rxEVRwWrwpdi4cS+INZEtVNebwiAyXAksEHuaHvX57huaUrVKpVv8dYCzq/ZGYOrNbnvIPM8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZX5Zm+TwnnK1sDDI0ke68iG2RdE69AiV+kT/LM2KDo=;
 b=J3lDHvYrCiFwPOlEhfNCFZfCENXAxLso5oYpDUu7EBdkHQBJbTL4qizgT5fhS21JUVLoezjEndPycuC7JEWl2PfcafskH4TqaR6E4KAfbnBfSXcl5Cx4fRkbdsU2J3k6TY0RAWGJsSQb/ZvKh67mTCxAncUBGCgVBd8hlTdEbqu8lOPXF+lUPM9kZrRLQBtWA8rUoFITJax6g7S7kmVqmqjq1+nJzuM6GKEMF3gBhgVcCxxCxyQDDz/Wpa650tTbAp1DzG6LKNoWtRyDjTOn49vS6hFzuiwHWCAznkl3QCfo2HlAMtevTyvkFL8xs4fABakcZh/jhYbbqDOz5lg/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=sang-engineering.com
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZX5Zm+TwnnK1sDDI0ke68iG2RdE69AiV+kT/LM2KDo=;
 b=ovDWwcLSS/wDAAMbPJFexKB1Zy2OGqHoVcFAht1ZHPJyPwBEjolyipADUfQwC+hEek0KBgr7C9XTpwl//+kBiJNJmQ2x2id5KqvDLwlxq2Se70YS2AGyz8+MSHB+GCb0BkyTzJ7ABbJ7OF89Iljk3upA7Iw3KJd7ldr6z3aE6avzsE+XV8CkPhqjIb8OgbMhKb41vccX6c46Hy9qzk5e5SFMdPMur8qitEhwmneOIpkgqEmCcqzzRkqj5/8ZN3/RGXt3Iu+6IpV3IiH/VahVsk3kROS20LOipF2kB731cDaGZzNuRkjaD12CyMaz7OJ1Svf0Q6rJPSUaD7cCon1pkg==
Received: from DU2P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::8) by
 AS2PR10MB7369.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.37; Fri, 29 Sep
 2023 04:48:31 +0000
Received: from DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::21) by DU2P251CA0012.outlook.office365.com
 (2603:10a6:10:230::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Fri, 29 Sep 2023 04:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 DBAEUR03FT009.mail.protection.outlook.com (100.127.143.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6863.15 via Frontend Transport; Fri, 29 Sep 2023 04:48:30 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 29 Sep
 2023 06:48:29 +0200
Received: from [10.34.222.178] (10.139.217.196) by FE-EXCAS2001.de.bosch.com
 (10.139.217.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.32; Fri, 29 Sep
 2023 06:48:29 +0200
Message-ID: <737df0e1-c813-3cb7-005b-60e088e26166@de.bosch.com>
Date:   Fri, 29 Sep 2023 06:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 RFT] clk: renesas: rcar-gen3: Extend SDnH divider table
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-renesas-soc@vger.kernel.org>
References: <20230928080317.28224-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From:   "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <20230928080317.28224-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAEUR03FT009:EE_|AS2PR10MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cde704-daa2-4abb-3608-08dbc0a75418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcyHRd1tCcfDHzdYlzChfowEgyT9p+ck2gPFyhbzThCqxhW4W2Ora3XYJT/UcLS9PDN5pT5X1QUHyj3XKs+mH5HWbDnAAsBiaT6xsFpiUJjLfpT0ez+YnTgjpqSkehW2qDs2hUpsORyVqMKBdyRAqpR9Nj7u3X/G4CVGd6J7tCdVJqt6a6NYJOkJqr0nse/zZInbzEZbToJkVnvtJUxgUfhz52ZOaA2a8PKxWffK/2fIVJ8ypTVEkErrI/5kvqubraikzX4O1o3sKRY/DO0BdGWSdP2UGy8LAqTqqJ1niwtoBv9dV7kiZ5DuwgF5T1URAOrvpItP7ca8NcxxEQfqHtCUd7NNSYnNHRg36H9Gi0970AMjzw6LHQBO0lTGYZRI1qzu+CMTZtNv68cofitGh+kBx1I4EuszgRFjWzBxlgNar5dtIb1JCIfBwlt4yuvJINuJ3S0hJr4oGy2OOAV6KB0JyBk+t8aq6bK0ef8xDF5CBN2zSszsXajCquct+nDKje/9ACEqAZ3zoObf+cybOBye3SAGHM0cJ6s+LcQOi3VIGhxa1oMoDT5t8fLmekQSXdPD3huo9JXMCfnFKo85/C9l5PqDCMb9zEMK2fd6FcYP+Q08KjSq+iTqiJTe787nNthcQrGZTbrGpA19Sd62kPU48BvL94Y+1hysIDG6pQmM3im7g7JLAOZFyvrgm6obOa3XciO2I+OXmpJgXYHWXVBqahuNothWuX44rYwiDkKj88OJAhl1ctgCFa+rUpuPbhaM8lrdadAE6msUsUgg5jGTp8srOT7DsHL9zMahho2V/affq51uJ/QXd7GI3SZZ
X-Forefront-Antispam-Report: CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(6666004)(45080400002)(53546011)(478600001)(966005)(336012)(426003)(83380400001)(16526019)(2616005)(26005)(2906002)(41300700001)(110136005)(316002)(70586007)(70206006)(16576012)(5660300002)(8936002)(8676002)(47076005)(36860700001)(81166007)(86362001)(31696002)(82960400001)(82740400003)(356005)(40480700001)(31686004)(40460700003)(36900700001)(43740500002)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 04:48:30.4907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cde704-daa2-4abb-3608-08dbc0a75418
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7369
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 28.09.2023 10:03, Wolfram Sang wrote:
> From: Dirk Behme <dirk.behme@de.bosch.com>
> 
> The clock dividers might be used with clock stop bit enabled or not.
> Current tables only support recommended values from the datasheet. This
> might result in warnings like below because no valid clock divider is
> found. Resulting in a 0 divider.
> 
> There are Renesas ARM Trusted Firmware version out there which e.g.
> configure 0x201 (shifted logical right by 2: 0x80) and with this match
> the added { STPnHCK | 0, 1 }:
> 
> https://github.com/renesas-rcar/arm-trusted-firmware/blob/rcar_gen3_v2.3/drivers/renesas/rcar/emmc/emmc_init.c#L108
> 
> ------------[ cut here ]------------
> sd1h: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:141 divider_recalc_rate+0x48/0x70
> Modules linked in:
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.1.52 #1
> Hardware name: Custom board based on r8a7796 (DT)
> pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : divider_recalc_rate+0x48/0x70
> ...
> ------------[ cut here ]------------
> 
> Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock handling")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> [wsa: extended the table to 5 entries, added comments, reword commit message a little]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> After some discussion on IRC, Geert and I concluded that Dirk's approach
> is good but we wanted to extend it to all 5 possibilities. Also,
> comments explaining the situation. I added these. It works on my Ebisu
> board (R-Car E3). Dirk, could you kindly test on your system?


Seems to work nicely :)

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks!

Dirk


>   drivers/clk/renesas/rcar-cpg-lib.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
> index e2e0447de190..b1d9a9a55569 100644
> --- a/drivers/clk/renesas/rcar-cpg-lib.c
> +++ b/drivers/clk/renesas/rcar-cpg-lib.c
> @@ -70,8 +70,20 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>   #define STPnHCK	BIT(9 - SDnSRCFC_SHIFT)
>   
>   static const struct clk_div_table cpg_sdh_div_table[] = {
> -	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
> -	{ STPnHCK | 4, 16 }, { 0, 0 },
> +	/*
> +	 * These values are recommended by the datasheet. Because they come
> +	 * first, Linux will only use these.
> +	 */
> +	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 },
> +	/*
> +	 * These values are not recommended because STPnHCK is wrong. But they
> +	 * have been seen because of broken firmware. So, we support reading
> +	 * them but Linux will sanitize them when initializing through
> +	 * recalc_rate.
> +	 */
> +	{ STPnHCK | 0, 1 }, { STPnHCK | 1, 2 },  { 2, 4 }, { 3, 8 }, { 4, 16 },
> +	/* Sentinel */
> +	{ 0, 0 }
>   };
>   
>   struct clk * __init cpg_sdh_clk_register(const char *name,

