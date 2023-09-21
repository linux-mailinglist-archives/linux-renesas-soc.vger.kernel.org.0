Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2037A97E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 19:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjIUR2V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 13:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjIUR1y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 13:27:54 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::619])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E38B2689
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Sep 2023 10:02:16 -0700 (PDT)
Received: from PAWPR10MB8284.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:38e::6)
 by PAVPR10MB7281.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 16:33:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsYjUstqfN2fsL+f2ee4pSxrAnMrLtTOnVHcdu6tieQZ/wPqGPauZlxT3PV16E9hym3WqGtE1FVkTz+baWxdWpGkL1Ruv45aR6XDQudsnjfuy5+3C/nJ+ubB+uJAc8TKpOS+XVqEIM6JC4Ysh6E9w1CP349Lz+8sWheQuDv+xxP5H164YJgzWIl8bD6ZXvtys+sA/dmt1ljEqoZ4vGiMuMrATx3u3k+i1XgsSs3e3yQvc7UTxImBBi7mDxW7+ruiLNtbQaMyP/pONTufaucB8kB4ZHw/oyNoU2v0d5PonJqVNSk+R+N8Dat0fMQW+KkmKPGvQWSlVG208xojCvaUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSYKn6E2bJt1vp7pDt7pKwolSFOPQP07IQvRSvv3Cm0=;
 b=dLfOqsOB/9ZrHEUpjvLzoy0xUvIih65/p3hPj0GGl4lw4dDOneCtSVtIJYmi8rGKon6mhavb0P0EqG2gOwtGO9R39yqW96jX5ucHEa4bQrXUj34RihOaoYfXGp7u8s0/qr1nZ2Tt18GICPdx3/Av7oXGjZVggS5KWx3/DyHpK7m8nZXRO7agj4TLJLzgnWNGGiauX+X4t/RzG5cJaDgjrnLFzvgAe4ruCNZzaX4tSM2lQaTdTVys/7l25PSDwVPDAr7VSu1gMtFqvWbZEA9NuBNF2keIwXkR3idpS3yuyjCiVR9GQ5vNnPeNVbEuWb8ZFw0l8gs8wK0+DtHhHcF+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.200) smtp.rcpttodomain=sang-engineering.com
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSYKn6E2bJt1vp7pDt7pKwolSFOPQP07IQvRSvv3Cm0=;
 b=oQHf7gaO1rIovZZ6GsNrBJMSZoOMDyfAbFvxl41rDzN9G/15ARj86OC9/WF45d0ZbzK+TxFinIr5QXcB6lnbD/95AGgkphuiaAAttGQpa5TkLMSrlh7zzasVOdI99T6wk7Jn+PeudZI6mIrUfiBN3ou2jTPDs/jtZpwIobsq3U1/XVumxHL2izcfZW8om4VUvVO5FbE/TfsbSyK/RJGM+fpvpnhLvxFiwci3B7l+OgDWGvoC1TuPNMXetZQmjfqxNP4RRLbeWlKz89ue1b39gP32VwMbG7z5vk9KjyMvZ+qLh2jUT8VGTuKvGBz4OtISNW04A1/ULfziTvHAy64HpA==
Received: from DB9PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:1d9::23)
 by PAWPR10MB8284.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Thu, 21 Sep
 2023 04:28:08 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::a5) by DB9PR02CA0018.outlook.office365.com
 (2603:10a6:10:1d9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Thu, 21 Sep 2023 04:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.200)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.200 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.200; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.200) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6813.20 via Frontend Transport; Thu, 21 Sep 2023 04:28:08 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.200) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 21 Sep
 2023 06:28:08 +0200
Received: from FE-HUB2000.de.bosch.com (10.4.103.109) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 06:28:08 +0200
Received: from [10.34.222.178] (10.34.222.178) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.2507.32; Thu, 21 Sep 2023
 06:28:07 +0200
Message-ID: <7b93fb3b-378a-2c82-e5b8-428dd0b984e4@de.bosch.com>
Date:   Thu, 21 Sep 2023 06:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Extend SDn divider table
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20230919123722.2338932-1-dirk.behme@de.bosch.com>
 <ZQtY+NHFzFBWhrZj@shikoro>
Content-Language: en-US
From:   "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
In-Reply-To: <ZQtY+NHFzFBWhrZj@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.222.178]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAEUR03FT049:EE_|PAWPR10MB8284:EE_|PAVPR10MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 28879482-104e-4ea5-c7f0-08dbba5b2873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jpYeuBOEfxDs8ZcguHonbrg+CdWaVtUQ6D7NjtCDmLDH2dAGrfwF6kiW33tqjrf9C6JXqfXElzNtPEwpqMj7xwJfL2ZaDEePADgiKerOkbyoBXJ56jdDZKt6LKmh7FccNkEuxgv7g5IdI9IL+unVUV8skgRnc5r1xW+op2w9nrrFSRDiKnCKWnyJ42wVeh09g+MwkZScx/qr+po1EOPIm24oyAxe4p4KU+ql7/BWYExH7YTxrjq0YBFZEKl2vMH4IYkKCbW6EgRS8HNwRtL2tFTG5wE2KsaHFb5yhkD6GO9VGn7S9836YmC4nmaTJ9+dUg1NoottRE2a/Qgne0R8kU3WBd9HPAndUC8Nm/uE4LZN3rsscADkZBQ7bREx5/A1x6HaBIph0MR6PgejSaz6Hl2YRm3E3Y1vEZhzfI2Z0i75w82QegC9XCY2wq7nWukRKjLCsxiTA1rvk/bstQTdFf0Ip1Jl6NUeirO9GRQNrcTk8/E/0U+hP+3VRIhuKzWmncZySF9g6UeuXIIfZ1KY9twPCGWcjSghA6Pkite2M6Fp+Rs7nRkUqnkHXIACGU3MzykbvmyPjqwkpGaeVpXFHqFAo4vtxA7wC7I9Ewk0Y5bH3zm9M0GyCb/9VxPlUgT1w28VsHxuAxE6znrtT+xU9MYTnneIPdqeF6dw1DQhdJGl3sRhAvtfZMRYZcERDqVlSUeGJyFv5FO1aMW6USuiLFODlB5tBVoD4bynz9nodUMZttwAlmP8O561e4eeLXn4yWFKHnP6aUfbGTYONkWXw1JWNtYPFZm1DLcM1WX9kz2G7AKIW66tgo5CpqNnmHX9/sn1ZCbDuFAbMc1A8FF1oBrN/M/C7fL5pfwObE/NM2NQj6UiU4Z8uDEqe0gNTU1l
X-Forefront-Antispam-Report: CIP:139.15.153.200;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(40470700004)(26005)(82960400001)(81166007)(16526019)(8936002)(8676002)(40460700003)(82740400003)(2906002)(86362001)(2616005)(31696002)(356005)(47076005)(5660300002)(36860700001)(336012)(426003)(83380400001)(40480700001)(53546011)(70206006)(70586007)(110136005)(31686004)(6666004)(478600001)(316002)(41300700001)(16576012)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 04:28:08.5273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28879482-104e-4ea5-c7f0-08dbba5b2873
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.200];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8284
X-OriginatorOrg: de.bosch.com
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On 20.09.2023 22:41, Wolfram Sang wrote:
> Hi Dirk,
> 
> long time no see!

Got a chance to look at kernel 6.1 :)

>> There are Renesas ARM Trusted Firmware version out there which e.g.
>> configure 0x201 (shifted logical right by 2: 0x80) and with this match
>> the added { STPnHCK | 0, 1 }:
> 
> IIRC, that means that the ATF uses 200MHz for the data channel but
> disables the 800MHz for the SCC. Because of that, I assume ATF doesn't
> do tuning then? Isn't that risky to operate at 200MHz without tuning?
> 
>>   static const struct clk_div_table cpg_sdh_div_table[] = {
>> -	{ 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
>> -	{ STPnHCK | 4, 16 }, { 0, 0 },
>> +	{ 0, 1 }, { 1, 2 }, { STPnHCK | 0, 1 }, { STPnHCK | 1, 2 },
>> +	{ STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 }, { 0, 0 },
> 
> Anyhow, since such ATF seems to be in the wild then, I assume we should
> at least support reading such configuration values. I'd reorder it like
> this, though:
> 
>   +	{ 0, 1 }, { STPnHCK | 0, 1 }, { 1, 2 }, { STPnHCK | 1, 2 },
>   +	{ STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 }, { 0, 0 },
> 
> And probably add a comment that the duplicate entries are only for
> reading and are not recommended for use with Linux (which will still use
> the first matching pair i.e. without STPnHCK).

Yes, I can do that :)

> Geert, does this all make sense to you?

I was just wondering why this table includes STPnHCK? I mean, this is 
'just' a translation table between the value read from the register to 
the divider (1, 2, 4, 8, 16)? Couldn't we mask 7 instead of 8 bits and 
with this drop STPnHCK from the comparison? The resulting divider would 
stay the same. Or even better just mask SDnSRCFC[2:0] (i.e. 3 bits)?

Best regards

dirk

