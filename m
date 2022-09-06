Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495FF5ADED1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Sep 2022 07:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbiIFFRp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Sep 2022 01:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbiIFFRo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2022 01:17:44 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABEF95A81A
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Sep 2022 22:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uf+ya5G8Nv/OkgPBIEwoT5FveFc/oKCv+LigSDynZ9cpHG9ZXzbHvYtz/2NUxYvkCqsJKDyepJCvdXiXl1oMnNmmKf+SOtfMF8CI06TW11+5BcxVbWN1IuOylmb/t+Ie0SW0M2BGqesChYJ9w4WMwj46zlObb6DPF6bo6DKGoIOlXnpwUmmNW7i2mnKfil1yxzhECGnUYWRAPAdnCAcLTOR5HEju/c0et6TAnZZoXk7qGOm0OK8IHqG5eblXoVx0zNS4euQNNtO5pePRu0vOE/AyjOCFxaJD36CIlva3zApum4G0PS78g0iyIUVDw2DPvOf2vYPEV0ll7VwWYCce0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmQw41ifT3cU8myg3JD6jDqSEUI+8V3J4TSEyX2GKqs=;
 b=Ti8FLtlmoUcYOM9QhU2qKtERFqY1f71MUhocaFl/jFI666PJ+6EPR7j4tDMdG5ZywCv3uILL1lwBk2kS3pLeqvHL3oFY0gzAroRCWus2XcvxMljnw/bi/FlA9Rr2sPh9MR8uXB6ODgZBF//1J3+dczdhKFRQT/qsZbeIZyaDzVhxz1qY6HBo3YYy76DtQHe39hyppmf6/6YIsnR00Zzg+0N+ejXw+7j435WYJecXhpqVO7xNAlKmGu+W0J5KU494wgfSVz2cBI2Bz0kkBlVB4n1R7DjELgQ7wU0Cdn49D+rDAR/4HTJQAIWY4ZtCK6o2KKm4PS+jr/bajaE9v1uo+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmQw41ifT3cU8myg3JD6jDqSEUI+8V3J4TSEyX2GKqs=;
 b=DbkBQ6ypqf4+9FDr+OUoDuAamdw7lJMym2dZ4X1E3EX9UwuSaBd3AXJOBYnBr2dvlBSEtqH3qTzlOEV7OzkwTQANu3pH5RPBazYe7dwyW0hkgzofk5LT87Fbjgeed1XIVAR+JZT5RwLhqh01JhZVDfGhh83NSClh/Tbuu2Gv+Wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSYPR01MB5304.jpnprd01.prod.outlook.com (2603:1096:604:80::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 05:17:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 05:17:41 +0000
Message-ID: <877d2hf5e3.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: white-hawk: add missing bootargs
In-Reply-To: <878rmxf5fk.wl-kuninori.morimoto.gx@renesas.com>
References: <878rmxf5fk.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 6 Sep 2022 05:17:41 +0000
X-ClientProxiedBy: TYCP286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67cc8c6e-ab7e-43ea-3750-08da8fc71f3e
X-MS-TrafficTypeDiagnostic: OSYPR01MB5304:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9Elolww5JutqfU9+wU9j2/8wWdhwmFz/iwoDEtEanYiswc2OavhvYSddKsQox2roZqhLao6hJu5OKW4h97zdQ72bajwaaOtk2SRZQuFHoD2dpbl2jGtNBq5iwaPjadUx573UuuD2x6IzHZrqeCnutm0EiF7b3nPGawsw8esPUj4+g5t/XLfB6oL+0THK9/J7xOELGODqjIsHPfR5lfF5yGShoQYPHhE3nrFrvjuhFLm7aUHyXnyyAoRpkaJN3TCvZA5MjeFbNF+//b4w1QLaD9vPVUemFfkTBpoFf+FxueXWJFd8D5/hoAJKVAmpt+oZkNScy1Vm+YINPG9JPnaEAbESEOqxN4qYPAAZ35+T6ClWtCWhMk5AoJbMMi9oVso2qQxMkOWfVYHuiLNfKE4fLO6hEaTtbT5XJ265tbxtq6hhkykA2OaD6EeUbMSjNvK1fseBuZKeb5sUK45V+aeKDiEfegJXYNNTG2QA3/bAyBQ4ZowyxJm23VLkwXfUD3G0VKSa2kzo3HIYG0Ft/iXJyOgZxOARN59jIo9UQIIplMHQmLdiX3GgPf20qZjvE1jac/s3c20uXelKgnPSVrHy4rArZPf9Wfp56zWVsmaDVYkNby7r+r6asx7baTydKXl8//bDJXsAfScaQCMyIojfpM5VZyLHsMxtKYqgDFfkzubc+xSwYrB/BtcQC7RsWdyw0Ke5cahxulbaAq5zodNikZngeOQXMTi60GxlVRaPTcDwd4PJN6GY2LmchW5LcPpMN9uoHGY/qkjRqRvpo4s+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(36756003)(6512007)(6916009)(54906003)(316002)(4744005)(38100700002)(38350700002)(2906002)(8936002)(5660300002)(66556008)(4326008)(66476007)(8676002)(86362001)(66946007)(6486002)(41300700001)(2616005)(186003)(6506007)(26005)(52116002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NlvWeJLJf4/lpB+CaMjxaNNpBAxmG3LLsfTF40+u1QCNClYYIyV1mqqjx26p?=
 =?us-ascii?Q?a+WVHv7aH/qMx3qUXdy3mW/Kcc03fhZNLIDD08Eh7MlUmxHxcr9EnwWXE25C?=
 =?us-ascii?Q?isUmABWp08UnPzr0gQVC3OFkug3s5dOd6VeK90zgsXpaNjhfiCs0qj2+/Jve?=
 =?us-ascii?Q?ZMh+IlJS4GmCYEkIS9GTR4/FuexsOc+DbAjP3umyj7vVkGSfCTQmjpMc+0hZ?=
 =?us-ascii?Q?jD+RbpHFQ6NsdP4dqftnyuwW4pC7CBl4iAwKCK69AuQdryqsC+/0Jgbl7B69?=
 =?us-ascii?Q?lBFz1gWHKv5KTZM+udorA3v2nkD81MWHzn3K9UKAOKgBIr7v5ePX38ZGxtyJ?=
 =?us-ascii?Q?got1Ukoz/1nBJOiTQVi67AB94SiQ+YQ89Hjv2kaCjeXI1WccLGINd5jOhaDi?=
 =?us-ascii?Q?ye17llQfVN6FZdKuYngSj24mY98Aph4KuoiLYmT2jXrO13Ele2PJAnh/v3Ma?=
 =?us-ascii?Q?Rh1HO6wTwAv+EUgZMBB376pOtR6rib3asvOUhF0Da0WKxpMOpmL05bzGp5Uq?=
 =?us-ascii?Q?yNg3kRntK17PUUiTef1qpIrjvDk4Cn6/tZyacTi7SjXp04glrGYrEL3GHDal?=
 =?us-ascii?Q?CnBMraDcybMqF9lZ9j2kfhx0rhbyq/KsfKORrB+QPeTnRnE92H/5wNZXxSe7?=
 =?us-ascii?Q?sFoEl6iO0f7wzae8dc1+ondC8hzNNwul2imvP6V435+bQhEYyPs40m4yxFzi?=
 =?us-ascii?Q?+rXHNwFG7XEPPpzYWjSIG9fw0pOrsFeWf+ahUCRkJElRHE8o9YIvw1e6yIys?=
 =?us-ascii?Q?9ZcJR8n44Bceu0Mm24vk7Pg+fe3YktVOlUyVmk0JkY2n6PVhGBScrnIb11i6?=
 =?us-ascii?Q?qMdu/Cq4pWhWuA/2s7yQGY+0egxc16o3CUMIFiK+8GVw0xJZIhsYO06k8xTs?=
 =?us-ascii?Q?uvPWZKPOZaecKj6XEcS8kd8S1v96MW2XBl4NfylOOiNl7h36jizTCkLSaTMT?=
 =?us-ascii?Q?o/HMwOPldRcEe+dQMgy/B73oDDvf5GcjYG8AfFJ5Md3kgBSNUPf92vGqyq05?=
 =?us-ascii?Q?4qizFQ6RSQi7rtBbe9ZAoI7tJUfKev+HJb2/KT1puNE6WMUh8QNG8gJy1rNr?=
 =?us-ascii?Q?Bfol+hZt8fo9PfEKhnHItbTEWOP4i+mcMVnk1MhQF9491+lRMDUJZwFMwewe?=
 =?us-ascii?Q?NF/aXiBoIVM4p6OBUE7GjmbPZsqSRYCWbaRHIXvl8GLymafvhASPnesEcUIz?=
 =?us-ascii?Q?9n3p5CX+/oHqlrEAEiiKhsdoCueAYO8Sj/LzgT0kuDvPIvyaLl9NOKA1AR1+?=
 =?us-ascii?Q?aQd9T2FYO6BGnAw3hQgaTPIdsmNHK460rvRfx6Fmbm9jYekwEvzyTP4CA7X5?=
 =?us-ascii?Q?RAu8JrsaSvJxMWdFufoFp3V38D8KuQVej0myZ8wou2hfv7oDzGpSVkx1PYxh?=
 =?us-ascii?Q?n1AUPR4u1nAhIzI1QhAXsgMl2apnhso7iI1aEGWvPuXA0pt/GsAQzZ8mFuv8?=
 =?us-ascii?Q?zFN2duS1k7DPfPqcHrGjqvVL8tOigPbu0iX5BEIk890s5D6f3UNmOoE+CP+l?=
 =?us-ascii?Q?TVkWfmfL04YMwRK7kHSihtuLiUdcD88ilUPbNXk2ZbRMvcVEiBKI1VI57odR?=
 =?us-ascii?Q?6oGRqyhNiDWqa7Gfpje7hQ4PM5L3LW8OIdZYUyynkD7XAA/7N1qts6VuXDG5?=
 =?us-ascii?Q?fP7LLbFHbfyIkkI/bx58YLk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cc8c6e-ab7e-43ea-3750-08da8fc71f3e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 05:17:41.3186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq2cH//LvKZDRofZBcxHNvwi+C3ZoJpJ0FBR0cumRSvXHbZq+dxypuxrsTYC353VFHYqj5nUbD94D7+PsL43QsI0YBv5zDG2HhviDK4CBZSHiNKqGc6zUYUZAECQuV3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5304
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> This patch adds missing bootargs for S4 Spider board.
> 
> One note is that current Spider board doesn't have Ethernet
> support yet, but this patch adds standard settings for it, too.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

The git log was wrong, please drop this patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto
