Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23AF27717E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Aug 2023 03:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjHGBjq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Aug 2023 21:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjHGBjp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Aug 2023 21:39:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C99A100;
        Sun,  6 Aug 2023 18:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSGvA/LG7o+tHcHIiFoNnN1bXpeBMJErKkeOLr68aOcn8hMRK61wKC9YX9QHvURWPBIyz/T7F0ChLrwJyUiDtvbJDGEsdxUXtsWUOtJ1z4kOgBisK3VXp/6wqFIolQzKlXPqsRcppBvvJR0QYEBQIAfN6Y0FiYW7/JcVZkkpf3GxW0ZF8OdG4Iu8HNH9qwgXwAfX/nJU40iSZpk8E/2v8c7xRwdDIh0nSlFLzylLPrQcBXwq+ohETu8HsB5/LUb2suGdUh2DzM2v101lAOfmti6i70bpOaROQw3IR+lyW/h/JVswpqjqMNUIxKdH2VkCwXfcunYU1sGogV4bNAS+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZjKFaxx7OsipnERz/Wu4WErphJrQEs+goSe71f3MD0=;
 b=ljvpWCKD+CKOE27qWFRFPCzUztp6eGwwhyfHABBdvYI9Uh/543gWDlWj22z3a5Xgn3bvX9IhiVzgFN1/saKTeFZ3BPOtwYRhbjLvX/GlesjSPKKoAoORztUxu8Iw8ujwefh74UpYmCYBxjQ1AXQ+CklIzVbUvYhAbL82Vp3a6BJ1kSlxi+O7nQ62xhC/U+mWpoD5E939f4AlERym67V1G+apGOgcg2SC2bcwkmYrGxYZv0pFDogh0H+9v0hFd79ne+Wh00+q7rITxM4iu/2kHAYGGIyAXaPYvH3uo0KNTZhedzuQ/ENY8cFjBvUDC54FY4xzcC0/IigbgfyBb9vuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZjKFaxx7OsipnERz/Wu4WErphJrQEs+goSe71f3MD0=;
 b=PQDpC1EclWVVb8bMIRdY/8wTX8AIUD8yu6gKumi6xX73GR4KmJNNHdRFXM3nVnC8psvt5o6y6jYchfC0rh7ANt51v2ulYJRoALtCN7dK15RL50VlVeeubu2BssCAx0RhlbfUlS8iR+wWslniFClhxlrx9QEvEwZYn0pLUyGoRhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10365.jpnprd01.prod.outlook.com (2603:1096:400:241::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 01:39:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 01:39:40 +0000
Message-ID: <871qgfd410.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/9] clk: renesas: r8a77965: add 922 ADG
In-Reply-To: <87h6pjpro4.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
        <87h6pjpro4.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 7 Aug 2023 01:39:39 +0000
X-ClientProxiedBy: TYCP286CA0191.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10365:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f2dedc-0a66-4e70-8b76-08db96e72aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjDjwpCyTEe+aQ1gQ5rjYEfRiqpfeBnCA9wnJ8enC221nlG6N0bKQJVLlAICV7JO7L39oYEeO39dniT9IOaF7uwkrjhG/M2YxJBMzjbWEEz2ybKLfh+CTg7SHJKOh4eEP91RnP2vj4+gv0qVjmA/iqxm3wWF2sd3eSk+lajs7AZDkRBS89cbjcFW2oWoT8ARix4/0bOh4RM/oTZqwrFxdZAD87sa3jx8molfgVs4g+ZSXG6n0PmSdwKFW1O7f5JHdnJi34DSwEACqG+ueXY6YigW6vcvnvArzcSRKZKY8Ac6uYKemr6CkJQd5iBYZ49LVdS2bWysvkoGiLvMw5ETm8zZM7pyDFwoPQ0Gx6J6+uY7CiQJMY87xR0NR7RoI2GYZnjyXOVCnz+AgL/EcIRuRY5BGdA6xbyjtIrLb3cgPiIfNJbpGBFVitKhcVgmpIbcUUAAjMg0TbnSJBF7diCxCk1Fnvrr0yEPjGj8uolNs3O8Hij73EMJOYPxtxpUze6FJHFspsKBdF1PiUjxl09w56Mdxj7qZ0CeZlngk0iZHJ9JTvyp8wsfxL+GVCMU2zv0LzCbPNfz2O9Xq1LgvfJ3mcM6hz4jV0954qnN9ywEyF4sC++WZq/IpWKhTbDBwW8f
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(186006)(1800799003)(451199021)(41300700001)(26005)(2906002)(5660300002)(4744005)(8936002)(8676002)(2616005)(478600001)(86362001)(316002)(6506007)(38100700002)(38350700002)(6486002)(66476007)(66556008)(52116002)(66946007)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TaQpcG9JZdfTZTY7w4zWtWzkS5xpit4rLr873LheMtpSIAPL9+R+DDAjOGOT?=
 =?us-ascii?Q?Lwhk2DE75gwDE2dm/CO7YOZF+Qf0vc+z5ZvcKWjBMQGrK30LNDfP9oQDLsBc?=
 =?us-ascii?Q?9RfiF2Zxeefxm0yNwdHCGbliTU4NKJC0pbIGB60d/flSeQooKHExYFRYhsvC?=
 =?us-ascii?Q?5AU08C5OGSsRLjCc96o+MDY3k6YFbfyntVEvEYxCr3d13mM0ECeijIXKviJZ?=
 =?us-ascii?Q?KMlrMjJ8gEDsYr97ogn0/Rf+p7bgTizmS8JaT3+jb36y/HaGJ6s+uuT0K5Vm?=
 =?us-ascii?Q?a+CsmNcemtqSxNtKD3HpAcl/AuQR3bTzM4CBE/zqP3aUPg8xsAFEwchERIl2?=
 =?us-ascii?Q?6fKTBkriPiopa1H67zUa7gWOXj2G3gGNp4TgMTn3gzXDUdPAppH18Dovp21c?=
 =?us-ascii?Q?7avvJl3fcEBnck88FzSM3OSXFg0oqJ+H3KGXW1eNnu0bljr94JZCTS+QBSq8?=
 =?us-ascii?Q?FesfYvIp93Mjg/ItcrTnqTCoqwJXbuVHC/YJTFzfqRFuNxIv8gZQHFreir0D?=
 =?us-ascii?Q?mRmQWwTdFGacWiuaMA+ejb5UmGtynBxIotUl/cnji6nNNQ1G//mgl6BragaD?=
 =?us-ascii?Q?LHK+eDFM0lXCdnzIpzlqiVQojzBIpD8n5200+FzuuoeZKDqOXaWl6w14z2h1?=
 =?us-ascii?Q?FD8dU6RdKI72JR/3utMDVA6losts328HiVzqTUnW0gg+ITOJiv4sBMsR2qIK?=
 =?us-ascii?Q?mPBmBVpU8CRc8bKtZ5bs76ktCtrIV41MC+dObviHll341s1ko+zi8kVfVFsd?=
 =?us-ascii?Q?gGKy6CqMwmQqsHxTL7wKpaDbjnRUVJUX1pDQXkhYFcqjQiBhRYVV/3pClVxv?=
 =?us-ascii?Q?DAepU49WZZjrGL5i0p3PNmlprkw6HvHi6D/bgMjckG/St/WLfphFZyyVEyMm?=
 =?us-ascii?Q?3d2amy7h0vCfIE4o3wjjWmE2X0+Rt6ICcGkNN4hJr7IlpZv8dEw1d/lgFWr5?=
 =?us-ascii?Q?wc4GZbWlbswmuMa6BK43VByn8rBNhc9AbetqsWIr2O/lgLyp5vfZUKlSTRsV?=
 =?us-ascii?Q?AHdAU3EAhwp1Kq36kzOTmIt6rW3cVVcNJsprRxFsNrx7q6dMkJvqcIRYzZv+?=
 =?us-ascii?Q?CyjhNufgNhwTbg+ztXqMPoGPtNrV8t+yAI4EPxK49hk3NQSzFXFiFiEX/Xqm?=
 =?us-ascii?Q?fRnutFr5M03sglPxCdUi8/vSybo0wxEgWtHtj/zOgLXXry2MsUyEZZmP6F1X?=
 =?us-ascii?Q?3h1FgMcLXyF1dpE3wEcwPr0eLbDcOlR127sQ8Gz8K8m+ZliVo9iY2af9pBSb?=
 =?us-ascii?Q?+wgqZFt79Pa3wvM4R9wvO1nkLc+zFf5AdYS1S6ef7Ct8dMo4Fnxm7wZ/O9tz?=
 =?us-ascii?Q?EEwx/O+WYTvDTRo9YFb/2OERCLATHsBt0TX6U1PAmoYJGUrPwR0mlhoEZcD6?=
 =?us-ascii?Q?UFGP14UiUQNYkLGwc6oDzF6U75BdlATSmedIDyHGghdFKNn0FOE+YcTBp0QC?=
 =?us-ascii?Q?TdJK6LAJR+qyNh2gex8xjnJ18VfF82h6skN0aiS+AEXeiMADE0RjK2jI40Lu?=
 =?us-ascii?Q?1EMGBwe3/kifYIyQ1ewXpEAkqCEWR/iVx6Xsk9oPJhwRM4wGpmbGTVlb6+BS?=
 =?us-ascii?Q?dmiu1zONjPPqmwZUyKNwFq5ynnL2ALQ5JaW+b4lCofO644dxVgfpboH6IWUB?=
 =?us-ascii?Q?mTXYt7akw0H751hr0DJJ5ug=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f2dedc-0a66-4e70-8b76-08db96e72aa6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 01:39:40.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eDhvrCUn9MUkxKc7QJ1OSMEdpddVMYjoPSp1Sr7oeTjhzju/KlfjjeaGIyQEtYIIEf0+pRQquYIxSbeZVYcYCtXYVVWiJC1l0/HB4h5J/W0xb8hdXjZ/ffejuWSF5JD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10365
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
> clk_i which came from internal S0D4. This patch adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

I got these

Tested-by: Vincenzo De Michele <vincenzo.michele@davinci.de>
Tested-by: Patrick Keil <patrick.keil@conti-engineering.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
