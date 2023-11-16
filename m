Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF767ED8C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Nov 2023 02:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjKPBEq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 20:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjKPBEp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 20:04:45 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DDB194;
        Wed, 15 Nov 2023 17:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDk9kPLcaX1qyODuQ59CuZZo0EKGVOB2Q2F8ZVnfB7meCZlDUyVMN2AbKbhP78fZdOOf2QK9mimqT6J0lyVI7/gg0wt5aiKFso3Nk8tYHZUu0g7Zok0cU1yH3OTICnkryWdSQfJPBVW7LGbYTNJUwoFZWbY/FAWp2l3HXBbTegOf8jAwlgzVAuWLHXTfpuwgXeqGT6QbRVxv0HYqu13X/OQhGv9b8/Hg5SCWvxDiUvBSMjMNBZ6JA/NyM53iymtMuvRye7K/AZONfRV6blsN4qpYt0smP3rnluLlf2Lb+1l6V3fz40xZIsC1FSFALiigGyF4G6sUZWobXQSHr8m2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjQ6xJuZ1xTwIkbGjEy2wfE2BYgDcscqS5bm2+wZdj0=;
 b=aj2BdLxj3V3sVUfx7BweaIaIkLQZsDuhq4WKrtayj7Tmk8OD6+ImHmwC+oNUj0nkzihjezBq2n9GZ9+OsUYD600FKRlqOBWQXQAvq9g0JXvGq2oKxkv1VGvuq8TESg6NtcAjZtHo4M8BxuZQeezrsVyIUtII5CK0Xms/B6IXZ2IFlVesngG3DVNHKWrDxn7V5zwkWEFKrBDyHXqYa3SP13pCnSbDc9Txh8h7O5qNLI3/4a+7GndXw4jy+ytqhMUGJEO9MhvW6OG02kztsItFyZThwPpef8otMcGkwYjAkneEa+jDdTNfE1At6ZANeHsIp9eYjVsEImEXcUpUGynlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjQ6xJuZ1xTwIkbGjEy2wfE2BYgDcscqS5bm2+wZdj0=;
 b=bfnV8agfmq6aj2urDfz+NeAGlTMM5zcpKy6iFteiM7IOgeO6CyGudyqDdljDgx9bgFcmZrPJhxL//N8swDPzdcm33WNSR7jvdw7aVWZ/pz3DO/7WAOFcvJHTnk4B3MzQCAmuo7WBv7wKWTsSQPtQDhX3Bv98OUnePcVKI3s9VxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by OS3PR01MB10154.jpnprd01.prod.outlook.com (2603:1096:604:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 01:04:32 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 01:04:32 +0000
Message-ID: <874jhmtso0.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, oe-kbuild-all@lists.linux.dev,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Aymeric Aillet <aymeric.aillet@iot.bzh>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
In-Reply-To: <202311142059.XrPUseGq-lkp@intel.com>
References: <87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>
        <202311142059.XrPUseGq-lkp@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Thu, 16 Nov 2023 01:04:31 +0000
X-ClientProxiedBy: TY2PR06CA0046.apcprd06.prod.outlook.com
 (2603:1096:404:2e::34) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|OS3PR01MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b58215c-f68e-48e5-067c-08dbe63ffdd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YEPmCS0XxmS7yGxQ5/nK3NzO4pXde42yYf4qztuHdOA0nlw1aUytTDwKQkBgMhmVXP+R5mwFDlBIeonmjGBS2A0F9BZU8ZGCx3S675hZrz9fptEkWMn3QmSGagLLK2g5DmcqQXZWFBDc4fzZuWG3jzU9KM6nLx33CoiS9HZ/Qdsqgu2VvESjRq7H4xuxYb0sc7yqvSfc6R8vWXBFtq9D/z+CBDUftnv19gyxSikEmbyNqGBlnb5BMAcVr5UVcBNMjmzywJw+r9FzUL6sir5RnIlBWzTfAZEjgVf7JdRQtrVVPBuuMKwrNB+KWXLXVkOSWRSgaJThVGQBbRQw1RhYZmutI8XkWz6vq67v9FoVPJypsNUV0TYPNzOYDZJQx/w6X32QrjMEuqqwdfE6yjVCNT+sL8UO7v8vA/7tM3eWI/N1eINWIqcrO3K0syYK0vpRd4oz2ST6ByTcSXm06uKyb481B8sw6UaACublfgsma4daLZwRZ2tkekrNc780i734VNCnhSNGRjYAieOd24l60iVnvP1Qw1eWKGz1PE059osR+CeeuPj3XxjuibmNXsay32x3Y5eRsYByfWPpQ/4KW1cVvUJNVYhSRAtZUBCMjZPVRRjOhqa7I14FENbwNxiJdSIv2iFPDARXe454MzTIH17cVxB/zZTlx9EJN1jCWhg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(186009)(1800799009)(64100799003)(7416002)(5660300002)(86362001)(8676002)(8936002)(4326008)(41300700001)(38350700005)(36756003)(2906002)(4744005)(83380400001)(26005)(107886003)(2616005)(38100700002)(66476007)(66556008)(66946007)(54906003)(316002)(6916009)(6506007)(52116002)(6512007)(6486002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6hfJE+lWOBTM4gbm6LKRUP2QY043LKuIJcyZsN5mevd3hHp35drc3FgUqu9P?=
 =?us-ascii?Q?dt3aJAZFpMtZmF6ci/hVcA8MAquC0+z1NDl8OSAyDsPYggX1h1I82gEWOeEc?=
 =?us-ascii?Q?u0OKX0DiFzWpwGtW9oKoMpNzGMd/DWCdCCCFW61s60/k+DFNBAHTUGtIcoU0?=
 =?us-ascii?Q?AlgiudiSbAalFxjDPHriqgNTbXI9X+4ES9wcdGbMLImovmn0LUYqYaO5tm+q?=
 =?us-ascii?Q?flt+vh/01kl7x+EkQ4QnPrqCiiQi/FXG6rxU5ofQnyc7Lg7fAJaS9AnKASU/?=
 =?us-ascii?Q?lu7s5gdds9IX5zBqFOzMr8gEap6cf63WD/MFQIa46z029gNi1dYJ7Za5ALYZ?=
 =?us-ascii?Q?okwpmRaAMocWMEhoAPgr+g1eo9Gr0jRcP2xkSqAbYMsGfzM3uKtXQ5o2tEBI?=
 =?us-ascii?Q?E2QuU/QCi6B77nqn3gwnM3ZUs7lg182gGlNKJXDLFgqyADLD29gET1glffp+?=
 =?us-ascii?Q?NzwabcvE460zvEJsOo4cRP26LbDeGQEebRc8akk2d1AHAh8UWSJ5RrKC2xtf?=
 =?us-ascii?Q?39uxcq2YeuRfT9lihFnnyA0g7p1P+klMqWp+o9IiwRY7vGSGW4y9+kkASKQh?=
 =?us-ascii?Q?QYGOlkHHKmNosbEw0Kzorm3fS1Ag9sgNFRt6C3YLpqCrierlBvBjYrsi0DVx?=
 =?us-ascii?Q?y32xcSoO52LRotRFG4B+Ypd+xGbKc2lLYy1xD7LYL+Icz7kaG0Rfh+2efMZS?=
 =?us-ascii?Q?y/m1zNirBU/vtQ4Zn9LcV/p30nvKADdcCkWx/EnZgIJu+qBxrok2Lm0SeBth?=
 =?us-ascii?Q?QjEUqf4hVLsSIqZqckj292CYOsOlKVg+Rb8fDPubf6v3pVxkr+kG6VkvCfRK?=
 =?us-ascii?Q?zjwzNY9sUHQ4i05OH7aA11cOvdjyYLgs/+gVw6qq4Q/jOolssIywVx4u7uqH?=
 =?us-ascii?Q?jzxO7RIfiWBHxZx5vqBC3aI61nOolQq9cgkcf8chc+MeKEJ5SBX4eZoaOA0p?=
 =?us-ascii?Q?1W44YPPZfs4xQ3blW7pdTmsxIqj1xl/IBYURfAZUbVaBsjpVVtDX2j/uibqa?=
 =?us-ascii?Q?795N6Sc5eHGNkYwDkSIqd7OXKOfCKyx32M3lWvbWbGYahMK8+e+dnK0B7h7g?=
 =?us-ascii?Q?O4TNa8qpJ0dXqIGG3yG2VJ8Efv8JHP5ZqWpNhXVKtNMGdj2+rZZQAotqSPJy?=
 =?us-ascii?Q?4p1RqaAQQfe+SHFh2WRaw5Y1rdOwTdHHNq3sPF5evg1a9nSs9JidHXgPVFov?=
 =?us-ascii?Q?p2KtEWKhB+1glSVg4gEgeVTEo68rz8BiEbVz6COYLGkFTQR4wp3uDMleD5Ai?=
 =?us-ascii?Q?A/oWTBch7Vayt/6rki3qgRY+cDNSGmzIZLG4HSiivwiNMoVXmKA0lZ7jZgp5?=
 =?us-ascii?Q?0hvtuggD3VfTooQRpWQb7hCdvjMDLcTS0Gx2QLGZEUIR4bYi7ncLBcdXeFp6?=
 =?us-ascii?Q?LR5mf6oi466pJfeoX93WTRXCuLG0izi/glkfBr6pb/vrf268HWiqxdeTArQ2?=
 =?us-ascii?Q?UjduUulOmxuNAA9WRzQP0nIqQPvATvAJpD5xL7cPu+D9CPEeH6ck3S1ryOIs?=
 =?us-ascii?Q?l3OhEiNljIzv63sdF2TCpeM993IUnTNnvREIwGMBAtaeUI7Vrs33o5gNJO6E?=
 =?us-ascii?Q?/1gCdk5s2Ydo/GzZajp1x3KkZRScbzWUkcHWQ7IYp7CdHB6fs1iw5Mo+AF0J?=
 =?us-ascii?Q?1YGVsSuYWtmAF396ho+3P/I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b58215c-f68e-48e5-067c-08dbe63ffdd2
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 01:04:32.0577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JA2uxo8TU/qZnkytxKxpP99kVsD7teUKeY2J/F9nzpujdMFgV/QM//oGxruXV0H9D8nivsiM/Ubp28LyOqbeiNsSWzWHGhUh3+dxEViNUlWoYMfJYQv3IsqwZ0bUHP1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10154
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi kernel test

> kernel test robot noticed the following build warnings:
(snip)
> >> drivers/clk/renesas/renesas-cpg-mssr.c:175: warning: Function parameter or member 'reserved_ids' not described in 'cpg_mssr_priv'
> >> drivers/clk/renesas/renesas-cpg-mssr.c:175: warning: Function parameter or member 'num_reserved_ids' not described in 'cpg_mssr_priv'

Thank you for the report.
I will fixup it on v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
