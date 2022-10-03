Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879505F27A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 04:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiJCCKM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 2 Oct 2022 22:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJCCKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Oct 2022 22:10:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0956E23392
        for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Oct 2022 19:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2jFnH/xesBtxeX1YJBdl7XEkO9XW1ypcIny6MFv/R9BzwGZ/Kzwmz1dBCnSUrnXOVUDbNabBJStr/bSyfpR7jFNzoAKOgn1LrvFaqoQzJXyZ+hceTFUVbzaiR/10oqjJ941J/h2Dxanma/XxPFGgs/Sk/BI6aiOY2wtsTu18t5JTo7/0SuoSbNik4qCexBQMlKJfru+lanfeG05IfxrPcEH9G7786yWgEPVTSEuc88OEbkXYu3ClDHug5RTKv2wcHAAQ6myrJQdbk6HHZtA2CY8YOnFnatqVWpYhNVIaxxo9l9Ya1JTSqCW4WqwCpieqMulVjPYy0/YmxIi3NYRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftkmZyCmZK4Sl/1cW281IpFxN2e2PVvMI9LOEZJe+cQ=;
 b=fKrzJ/qIpHE573N/dKA/07Mp1IxrV+hVGQUS4h9z2CB/mK40Nl3T582h3BbA0kPa8/tZzjzunxykU4IFGnPMhfyUK5RYNwmdqoUrvqVRegW9jida1XsG1RfZ4yAO844AabeYNrlfgwDsRSqcY2xbkXDXdSeyKwJ+e0o/RilQKMM1mv1/ybwcv3AbIl9LHSiJ3DUmWA/vyK/PxbNCiXO5u7BUOAMtjVyVNnlPw3V9hBpEobDjxJmvrTPfxzWmuerrDzycPtpWxvu3vvDZCfRf3LF+sTzRkzHTO1LyNW4RWGyMN2BfffzvIxT9g2/Se3Nj8nYB892QEj3LzICmieEgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftkmZyCmZK4Sl/1cW281IpFxN2e2PVvMI9LOEZJe+cQ=;
 b=Juhb7qP4tELcXqqjWAFuWxm4910REfvI2hzpZ0M0dT1dhbsK4br6cdCbSqOAx8muJl+FxKhyAHFU4XLVnXJVwYKRBAlWkbafLPqXOvJZM5Zac18fTOpOn1pp5JQOL+MuQwnE89p2gBW6woavqxrqHezL8I0lgg5NxcryW8ikTts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8570.jpnprd01.prod.outlook.com (2603:1096:604:19f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 02:10:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::41ed:9175:38fe:1134]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::41ed:9175:38fe:1134%6]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 02:10:07 +0000
Message-ID: <87ill1hd35.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Condor doesn't work on Linus/master
In-Reply-To: <CAMuHMdXRj3yisDMNfb5YwB-LD56SOgL1Bi=HtQGPLDky4vwCLg@mail.gmail.com>
References: <87edvt383k.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdXRj3yisDMNfb5YwB-LD56SOgL1Bi=HtQGPLDky4vwCLg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 3 Oct 2022 02:10:06 +0000
X-ClientProxiedBy: TYWP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e2f6c3-241f-4996-6a09-08daa4e46452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rBIbiWtHMqpuXVXuqvOHCzwZYqT7ZSE7vwvZXq8IoeXBlPFDKml3MZ7YhjzBf4p+bHHwt0+a6VnXLxrhMnjeuitVCCBEtGqAJ1p2dC/S7lP1B34EMkI8Gf5yWGDEaMwvk2II2gRZzMMnzXJ2CoUOJOoB58ktzy8nmfryQvPv9Gql9FimDDPmJXgDAtKtxD60+YuqZBOl6AW8O1aEMWzgd/afPllyf7JOZUNAZswl96B/uv79kJsgMLHVpTTxDDtkoKdaa4Y+Jlz9/9P5etDhLMGAsTCkS4lYHP6j7Rx9GXAs9hw6VQWSHmfjAEKZOh73qwv1KJ+afqvlkfPOXay2K32m5XJ2ajAG0NRE8fXWUV20+69UcQAx425PN39f9wtAr/1xvLUFm3wm7hg4qmqndeWQRo4WW4+NR5x3aiZJvv1o3lkzj2dC5zoLbQTJAKXxnV3FEW1b9+1g/3LvWWA/Ph7zLIBmVewIaGhDYI5pYtmJrYIL4X7wkoA6TS6Aa9hL+lxaDQreAiv3GBJQXA56+UjWVl/zXUCmDb3oVRgbE/wq3RZIlSI+KB/PT0vR/lAZwEZO2qYq8iNrhZdcpM3TFqIdEqHuUd9hnYc1GA1xWn7hgkiS1RZbo1VTMOQdHpKyyTmC1vU93JeAAi3uxV11X7FUadAut96aa0QVJ9V2aUPH4wlFHR7c9/03Q3dxDHLTpJjuVltErc4uopK5wlFqjJnmm3+vJSvW59eokPFPWorS0hjEiCh1wf2FkO4eJdikQtLYXiLiyzlFDgGoRF7Cfvaf2PwY8kjI1R497jOykwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(451199015)(2616005)(52116002)(186003)(2906002)(5660300002)(41300700001)(8936002)(4744005)(86362001)(4326008)(6486002)(8676002)(478600001)(6512007)(6506007)(26005)(66556008)(66476007)(66946007)(36756003)(316002)(6916009)(38350700002)(38100700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GurWDxcU/rBhr29s11GF/b7htJbamctQTW3ht1MQT5rAcLz52KTlynUKe6+K?=
 =?us-ascii?Q?CUmgosLYZ/5d4GUJDI3bFvBYYF0+PwxHpqOHpZeuTeUW/UrUx9oogEgspNZW?=
 =?us-ascii?Q?1RJBnkQ1obkkX9nYwhD4S7tuwqWv+Pf6xgAfElXpYvmtCX77rBpH/vmm8RIC?=
 =?us-ascii?Q?UWBmin/6Qe6KDo7SnefjiQsGzXawE1QI5C7cX+nH/8VlNQJbhXw9RGKGTJ27?=
 =?us-ascii?Q?aN+wFylGZnLBisfCc+M+sWL+7xhvmh97EIEA+Pwzv/x4dp72WftE8wjKyQtU?=
 =?us-ascii?Q?P/z51Ku6ohWkiHS3zcHMmpxAPWy1MRRcl2EU7n0l0VOgaYEOOakeiJvDI8XD?=
 =?us-ascii?Q?LEQjLtqU5wt5f8JWhlx1FWFvdvjRyiLVYNQId75UMgDznBupEnitm3BOwmwM?=
 =?us-ascii?Q?nrhtNL6vbSCkniggsM/t0d0CYqQO5JCYPUdp3o9hKB5T8KFRRr2k84ZRwTLd?=
 =?us-ascii?Q?frlwP6i6UIJzL3R3J0/FkCrj22l2wuJxZVRIOBr4IVNU1W+hbbbdOA2q+9Xa?=
 =?us-ascii?Q?UtXCBoMqWYNty2+vBW3TttRPvcNV80Fdh2LNemazVfHd0uTTbxnTzboFFedr?=
 =?us-ascii?Q?WG0pvPSGSjcHbzeAxQeFpGeDe+3kAe8u/A7/EO7tEIA36LJXhYSuAMYkndBH?=
 =?us-ascii?Q?6AOryHH5bduFLEzWoVkVz/qPELi/r5aFBuWh/Ia9zx3n03cQmDm822aZXP7S?=
 =?us-ascii?Q?SodMY5lpdTKzT+m7pMP7CCwRfYFGma/+fNLWN3Lyxb1TglHmpIFa7GJk26cd?=
 =?us-ascii?Q?mmaietjRNB44EEa4WA4jPrgk/FELFvcAal4g3lr7aWSCgT45r5xOycYd3cPD?=
 =?us-ascii?Q?I5CMK0nfYRMYtwM3iPlJB2Noz+DWD6K3O2r5FgG+LaHXIPu2t9d8G6Ws5klJ?=
 =?us-ascii?Q?mdlC0kq0P1QvDF6meNusOtFph6u+wN6o8SumHsjtrxQuwIaXd34h1LjukjWq?=
 =?us-ascii?Q?JbbRPdNsE9oKGSlBSFkYJHueG1I67eZWaf3XK7CCsgQUU8MlCorveDXrFSbL?=
 =?us-ascii?Q?dhGAS7Najg6nkrnZ75CkZT1MacGlBYhFHXYfy66sUFDfhv8skj90Mdl0iPVu?=
 =?us-ascii?Q?p8ju0ihB/YYvVcH5rDHRfRGrXqS+9I7iILWwWpClXtlO93Q7nfqk+jZbxKgM?=
 =?us-ascii?Q?3rvXSPMYS5ERvTdZnYctbBPq+l/3dLCQgSABYIfPLi4YhUvZ/0LSnf5uTHih?=
 =?us-ascii?Q?o3CO4oaw0fbuTgg6Cv8ihDJwAYM6hfhQzozwmfwW2ZSktnk/LW/V0oe9l3fb?=
 =?us-ascii?Q?dZTUNP9WOtuAHfNJoxhRE5RBEP11HRdJ6IAReul7EJBMuZIeiWGrrQsjCOWb?=
 =?us-ascii?Q?SVSMYe8fEd3ZkSued85YIJ4JUPuA5kCnOUsf7eOlAn/Mf2kdqseB+7mPt9VA?=
 =?us-ascii?Q?k9GTJ2+zytlJvkR4yiYh7wcewmPtzSBeDf0NYsrAELPl8CjuWHdxiXEtl7SU?=
 =?us-ascii?Q?EtXoAXIRghxz4U+TA31Xfj7CnBMt7zILhpP4im2v3+dXBqvAZhFO28Qchi7S?=
 =?us-ascii?Q?qS4soHkb/pSEqm80S1UfF7Gjd6e/9GbmNrJtcijJk6WJvbSEsu6ti8ywNWq9?=
 =?us-ascii?Q?DPm8VEEHH8pBlw43KnyNo0VNDZBuz+uJZqRu1epElBQr8JLh9YX2wxYMq0P9?=
 =?us-ascii?Q?kx1LdamBZiBcMbbgcoFdbTY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e2f6c3-241f-4996-6a09-08daa4e46452
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 02:10:07.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1gbefWYwCyTPj1Cfjc5aOuPvV8cY1dp8tt0ICBwBte9+0MHutYcsdLVjefsU4dulp6zyxtK84S7khhvPt+KjxgATZhJG0iGhUrWBRNWa4/Ed9cdMHzf0f1rRVr4BbVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8570
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

Thank you for your help

> That commit is building fine for me, both using a custom config and
> a config derived from renesas-defconfig.
> Which compile error are you seeing?
> What is your config?

I didn't check detail, but latest linus/master doesn't have this issue,
so maybe some CONFIG_xxx trap ?

> I'll send you my .config by private email.

Thanks, this could help me.
Strange CMDLINE was the issue, hmm... I have checked it though...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
