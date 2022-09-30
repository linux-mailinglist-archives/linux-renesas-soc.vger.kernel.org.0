Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1A8D5F02C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Sep 2022 04:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiI3Ccg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Sep 2022 22:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiI3Ccf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2022 22:32:35 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DBC121127
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Sep 2022 19:32:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du4aSlAFfg8eINLz4XDHXRb3Mce7U48I7MzA7CV4fVSd8KBdNT08EHFjt1RgK/mOtyNOxhkQP6GPSVigRPHl6Py9DD5cbu1X+Q7JzpuzoL8QFh0adNgXjjOTneDzI7D9obF+SGLObsYW1ljGllDlW9x9bfVdD0cONhJ756BAmgoCBBLR/0DVNi4FG6Kh2ub5CO9uLBuVVjIKwkh4RDdD8naQxNpimTDISz0JMPpKz29j/Z3S3A+7cgOwvJL4QXcPeo6Xf7pG/y/tYRZgwReKyBG15CWJZ6Y/g6VCDeOsxlvRB0vDm4c6FUbeTPgIP7LiOm023H6/oCdINzBPaoY7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31iHuESXKQI0ZSrRqbAAQoDqL9HZ1wdh3ppkDmzTad8=;
 b=KL1Lbolg++Qx0kKZ1XshN3iPLw67z/FeHsAaC7gQeeKjtSi2xmYcaq6KsDp2SicFMF62Hq90p2AhK5FcKT9wFdyP2P93SSH0kEOc2kFPJUZGjyCwTtbhSQckUQgH/NpPQtekL6AoubQLZdb4FJdKzZhaphbOshdPkJi0KDJm6JosVRLewcVa2qp25vqEPwpOZRUZrS/vNiCj58FyfcWtrI5fhGkkv6iSVIy/GJ5NUlc591jcR1T+Nq+gfSve9AH/EzI57a0LIn7wXBYIMim6rqoPD6ojDd/gMpGmMkV1Z7X+XbRwdrYaMYGu/WWxzymVtOW7JoctHHuALERQ6dc1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31iHuESXKQI0ZSrRqbAAQoDqL9HZ1wdh3ppkDmzTad8=;
 b=d6lfK1brxHAp3RF2dCz+Pm5idxzon88i0S10vbEBJSv8a6In1pUbgOgKl+dkJC91RVSjwl9CTzfph5Ie1ghq05+liiHURbvKAG41RMIMgwg8TAzfgiXy+E9uwIKF5ti1EGhSOsjuQr8log+5NG9OY4w4WW3DYDPUxO1qdA+FGNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 02:32:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::ba85:f278:e161:3581]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::ba85:f278:e161:3581%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 02:32:31 +0000
Message-ID: <87edvt383k.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Condor doesn't work on Linus/master
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 30 Sep 2022 02:32:31 +0000
X-ClientProxiedBy: TYAPR01CA0080.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c872455-d1b5-4390-f063-08daa28c06b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2Z+WKo0oU/bDl+b2nDgUu2wEggT1CyxN5zP6rFfCsMlFL1yHy3jX8nzebhIwR3p+egyreZv0pdE6Yb8KnEegL52AGXk7J4gdCzyskHv/QVbTKVr73mcMQKaQfHJLiB24NCjGo+ITimBkKcmrpFvgf4Mg8LwuMYEfNIFMiHwzhsNNQV+VMm66vtefxKjuu0Ne4Ve3RoXj2l8J1LMAlqLC6gOet95DZO1mKnoYrZB6K+xOTZrT0H1GcNTMQgtIPLo0k5I6KB51n+MD2d3kdO4cDoQ7nlWk2QNnJLsDEj3i0uf+m0s/zzfWnTn8WCt28A9v0Rb7KWWgbu9OkF+gKLlUoyB7Re5fKQWC4Kb5QnKmUCnzOtN2TTtE/Dfa1leATLhPQiXTdrvB08NlT1B8sdABKlrjzaeDoD6QS2EocAcuZ22e3PtLJpbp93JmSGGZAI03C2GQvzQIeEU6akuCo5MLcSfoL3uE8RdgQ8C/R3dcagmq4XP9a1ZDW6+weD7vaLrE6HuE2bZFBBf6TuPGpf3/kGuuuwLMsWivG4K1qY0fjcLEElFpnq3qXyF/YjFEx4uMemb36jpHBhzucEpvi2OV8fvglSe7VEErpO6ehCynL/HpAFUThLKOEaf4C8ZO0eAS4J0hWaueiBO2hoq6n35B6anH1IF2bm1DDkMaBZ9zL95Nb0OtQrURXPPJSFK8G6ZHSPz7JxMpWJ/6JTgkqBFv9cp/SxD93TwshcgD8doOpyIafe11V9SC9RUnQuUgYLhAzOINJELUuN1oDu+soovOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199015)(83380400001)(8676002)(8936002)(66946007)(66476007)(66556008)(6486002)(186003)(478600001)(110136005)(316002)(6512007)(4744005)(38350700002)(41300700001)(26005)(36756003)(6506007)(2906002)(38100700002)(86362001)(2616005)(52116002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HTGeyfAyslEcZQOInrSyG90kLy4b03dEbQ5poVucLyQgD0it24ia3z4WB9OW?=
 =?us-ascii?Q?7sPo6m2yv3W21sBWR4qk/jvjWxkyC0Q6i7V5BkOcscbdOTg4ZH4NcSYlhk//?=
 =?us-ascii?Q?2AoenrhJIWSxMu6BhjMCjyDiM+bIzqncbFyq2JYb2nJaJ4FgiFV3/8XSrsPy?=
 =?us-ascii?Q?s38BnJTuE99Shhe9459n9/zOoBSlU0ltm4hkqFGbrGSph8F+LwHt0slTeM3s?=
 =?us-ascii?Q?csXzb7OWXMyitBWXD9rAjBepeKDp/IQOXLopgm123UNdyq167cCLPzwNtODu?=
 =?us-ascii?Q?/s+VjwK2BIXYHv47OWUIq1W3jMuYTe+dQaNDgonnGV4d3+TglUmPnmwiUpjE?=
 =?us-ascii?Q?B5z+L/uYhrzsHLYAkdmRbp66jMKegAEsCkrPn7rUbi069U0KttkCKmnV++Vd?=
 =?us-ascii?Q?G4q5LV5bh6M9UOsvVsKfA7LSAEYRGpzL7h4UbiLqDxE/UYDUIShfgAAzIcH5?=
 =?us-ascii?Q?7PO11ZynAkXgFmS3GrzD1wjtTLw3DOhuARvqfd7/fho6esYM0PonQoUV83oh?=
 =?us-ascii?Q?X/FRTTKRzxpaFr8JkNWDfCmtShM1vaDTuqzeeQ/ViTaTH9EMtq6KRqqpqKFm?=
 =?us-ascii?Q?qel5QrnPtcYLoGvIXJyACOs7MqNJI68wTGaH3mbH1fvkupOMPFFfsYlMprxq?=
 =?us-ascii?Q?0wkFNZN1MbCZxdnyyOrxB9zqKWaclfLxva17R0Hkm+q45TvRGCEJxYiwyOkx?=
 =?us-ascii?Q?f6eCSimTXfpMQpVnLmv1dHerX4ZKYwcc8L0uMwHRL2uXdDtI+z84dboWdMZo?=
 =?us-ascii?Q?BjZR9RkJbA5uYoOykC3M/C1RGTpgDJ1P293lRDg45hpgt3eQ/RLjeDTznhUr?=
 =?us-ascii?Q?sbVcYZlc3ymqVpDsEPInkTM7uUEySfQuxGBEDT/UGL7Nm9EVrBKsuR0DuUs1?=
 =?us-ascii?Q?yT4bmGTaOWJ0fVXOg/Gc6fn2flgDNNvj+daEWrSHw5X2OfuNY4EEm0hLoKA8?=
 =?us-ascii?Q?Y9hZfKnWqRBggq6VmViJkUzyfPJF0XsL6KUCamWNfAWwa6wQs6nTojA1nAJp?=
 =?us-ascii?Q?GGFQdgy9siS3q6w6KGtDXUnNyE7xp3GxGIdMhy+LzXQIKxacXI80Kkt3dr2f?=
 =?us-ascii?Q?Ku2wXAA4cBWmZwcmcMe/6QwQY9u49nMLtkM00b1GLpxG6rN3XNO1iRrMnWsU?=
 =?us-ascii?Q?4RRC6onsBttf5JrOj6zKsfRIyBbhD6BBk5RHd5oLoJaSWcofJOLSxCbkWSBY?=
 =?us-ascii?Q?RvDqe4DeOkKyJolx8w6tG5TWeffbut5HVlnLcxlzl0ELA7mEpjUBplo3z+jP?=
 =?us-ascii?Q?pXeVsmJQMmR/6lWe1D+DwwdFwQ7Hw2R1SxAon/mO/H/KxYLiLmrOFsTA0cFW?=
 =?us-ascii?Q?JUN5rBKksTeFO3tcKIJWsXVHzDuUxSZ7O6/Lun18YqvdOX6QtUxGkR20eXXF?=
 =?us-ascii?Q?HFyZw2nk0uVCBQl8CKOwbtmmKKq1JMT2TDKOBFOEFr+BWjSMzod1n4/ZT8Qu?=
 =?us-ascii?Q?fdhssEwQZFsrRWUL2b7u5N95pqZ6St6RUt3k2lWsobtyJ267kP/ovlhs+4yN?=
 =?us-ascii?Q?J8Q+1EDWe04OWN6xIj5e0NGWN6IGjMeRwVtkSbzW4s30y8iHHfDBKlbwh+iw?=
 =?us-ascii?Q?YTGD71dpQhhzGdtjdr0/r1HYTajf+Y3wRIKO2bYev5NLjVJjdLgeibZrpb3i?=
 =?us-ascii?Q?rYzCKNuLB17e7wqYDE5wnv4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c872455-d1b5-4390-f063-08daa28c06b2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 02:32:31.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1YCDTzAZsHTl/vSt23XK0bWij4QIDFU0ArwyfrU5To7kK2GJ+szZN20GOKM9+B/JvfMj1w0tI1MhPJdBp9CSHkqdTsb/EZis6sUSeVYuVZPBSo5CslQVnDQGvmzIuWr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

I noticed that Condor doesn't work on linus/master branch.
It have worked at least v5.19 kernel.

I tried git-bisect, but couldn't find the issue.
Because it will keep getting compilation errors along the way.

For example below commit can't compile,
and I'm not sure which patch can solve the issue.

	99f6b77f74c88ac1bc4c81e089dd0cbbf882aea6

Thank you for your help !!

Best regards
---
Kuninori Morimoto
