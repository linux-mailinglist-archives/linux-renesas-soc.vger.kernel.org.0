Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0FAF5A410A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 04:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiH2CT6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 28 Aug 2022 22:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiH2CT5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Aug 2022 22:19:57 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E9C6307
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Aug 2022 19:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZmZXFGeQcPdtq6ny4NZAhhNp5fuA9tBpE/2yfoFF9YF3RCh1tH8xouqfBMs2oxr+eaqeZga+gOhMNzd8sR9BiYnN+iD0FPg6NZFu+7bzowQ9StcJrEBfmCdiuQ4oOHs02zHRjOHJxb3a86JR/mFTc/lTVfXy6Rod0/F6MsU7R0IAikS1iF3MSGBwHDVeKtIVkz2PFrsPAz6ENeF4zy//IgDw5Om4Yl7tsPNSeDwBpCUN4T0L13pjTV2PdJsMXdzBvrD6ro4DlHWr4vERvUCWBB+CjB69ENaSgxc+tfzcdjGzfPTuJa406r3+1tL37wB41+TAhiPwNxZsu1LOfaNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63BKuxpm4AagDIBENY6C1HZDKfdNHZewsCjRUcwXkdg=;
 b=jn5U+tvOrbzk4HuZYk03XTlUbUhEkslU11m+gVoYeBHLS8dPUcTidxhdAjH4mwg7dAQk0SOaJk6pFx5AUSvBCY7gO5XHSOLe44XzREDh5qHEGndjS6o4VA5kA1aReulbxthWLXlJhZEx7jzuwR+yOjHbxcN9LtcAUotfuuMGwcd9NcHr0m2IkfKP/nauHzRIpALgBbDRTAXGEVxQq89xCPksHSnKxH+Mh6TTFmTN8IsDKxod+/bhMWtrZyOWFuV5FXU6IPTeRnH6XBE/3/mTenA1FRj9cbshssP2c7wMlkslHpgq5FJ5VwGXOYRJm7G7AIC+T9Gvi6E6nyV3a+2JiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63BKuxpm4AagDIBENY6C1HZDKfdNHZewsCjRUcwXkdg=;
 b=I5GvsBipbG3p4TKTMzfEo3DZJDxFC2XideXmQ2agqdIwgpgSzrumenZFwD9XE/OLI2BRF2WQNCAZY3MBIIKPihrJ4Hj6b9Vj2U94AcbLNRTu6xJNwXMouGAHnBSr2Q8gjKe4CQAqPgJwu9fcc5FQxsBQbcDdPMXy2UuA1GLshQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10023.jpnprd01.prod.outlook.com (2603:1096:400:1eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 02:19:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 02:19:50 +0000
Message-ID: <87czcjeqpm.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: add r8a77980a.dtsi
In-Reply-To: <CAMuHMdV39bTp793CataarD8mu3q9=N00m+vZQ_7J+doaKz+5+w@mail.gmail.com>
References: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
        <87v8qj92cu.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdV39bTp793CataarD8mu3q9=N00m+vZQ_7J+doaKz+5+w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 29 Aug 2022 02:19:49 +0000
X-ClientProxiedBy: TYXPR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:403:a::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a5f68a-8a04-4fa1-ebf7-08da8964f356
X-MS-TrafficTypeDiagnostic: TYCPR01MB10023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6v/XplfH2WxQIJ3D2Cxs1FFtM5j/KgmSZ6S1zELQjbm9XqGXh/tobwKlZ1CyvH2mjQXAT8wSWEEHp2BocHEAX69MCZYLmY6rUBPQRgmDu3fZLBJUF5ddzHdbHj8Y150tWOkyDqh1e4HpRa1EvGmPnE8+BoNZosU/YZpoUFlkmw7DD79NPKDzuRPuVcydPPa/Z2/yUEj5m/+Htd/9BeeuCPFmKL564K05imKeUA1C5B3dXQjR9gGo9oJx+Qm5B0mzhLc+JJMb/DE/O6hfYaLn7KvXBdlPM8oohDJN4O88SD/Fq2owMu6AgK1cteoesrBSbVnl9JEQVfS86XKnj3h6Vm8I6usnyupm9ilPJ1hsuQ5GfSf6uW6elZx89l/4VhJnGXNPmZ72fYCvSKp+btY58kzaozTRtGKEtPrx0PFlJFLoW4347KC5Zga6b/2X6TcxXMBh08rb9pxmU8J4IMujZoGX8xnc2ffg+Q3QB8W5BpULU/6o5lkqlZv/wlOKHBoM7sEYAbfICNJ+/ytaxT+sl1Z7n5seD8hetTZcMHiF4FjZvNqWlH9ov2RXVbmpZxVUA448vJC1vJAjSo0KPlx7Ill3fz2i7dznfrqGbbV4DB9r04DBY5k7b1U1z4PTLYwS7SdrRy6Tr1cqd6QZNCP/ewDDZlRNpFyfoCHDMVm5+aBG1rBB8mPZHBkDLB3P8+NPdR1vAtDDSw3TkXRuR7zjhzDdyf28EFaWnUlpMMvnXX34AOGSh/IyfaRVeuzLLgEVrFxUHuyApNFqu3fiZeAXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(4326008)(66946007)(66556008)(8676002)(38100700002)(38350700002)(86362001)(36756003)(6486002)(186003)(6512007)(478600001)(107886003)(6506007)(26005)(41300700001)(316002)(52116002)(54906003)(6916009)(2906002)(2616005)(66476007)(4744005)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nbE0yrkgB12Uxw2VEloaJIk0mIKatlhrLZm8w/vMLo+7PuuTJVbA9x6RZU3k?=
 =?us-ascii?Q?d8T755rFEf7s1flyU4t6FuEj/Pf1teEJ+yDIKUSomHYMIoRieEPRo4fHIExB?=
 =?us-ascii?Q?gXzjZCti1wL9hvhnZzym+FqaJCwdMPAjZTYinUkMCFGcoD5r3pscS/G3q+jQ?=
 =?us-ascii?Q?TrkkOJkLND10qGuI93YaCzkcduzVEt9+KbI6VPm0pUN1AE9D4tffapG24YWz?=
 =?us-ascii?Q?wf76xMIYtSGLwVCbJILgobcTZR4A96dC6Q4q1j1tSb0pxinwKNVMucbFZgwp?=
 =?us-ascii?Q?bFTq4jxPD1bHQpbjbboqhUy0/gbHcFr8d8AKHsY06Hep51oNpZ9yggAhksdc?=
 =?us-ascii?Q?s3oL7t4M3On4lPJyqCb99IOK7bGbYnRfu9qy8wLKWZ5tMfD3rEKk+373AN3X?=
 =?us-ascii?Q?W2akqjYpl/70Eh8ITasq0ifEkE2nseXAWUt0wYFa4g+nnX2OH3QeXVF5JBt3?=
 =?us-ascii?Q?KNV+0GhblCr5M0cHO26iZ2NSAabGXd8zi33hsTdeRT4KKs0jhR2ifkVd62Bf?=
 =?us-ascii?Q?Cq/N1lNX3/OLFsfVf5O59ak/X0x+gYtsZuDIxJ4fYizPA1h0ZZ+Tt9U8B6HF?=
 =?us-ascii?Q?aqsZKoPFSGpQZYkNSV0vmAcazWIvW6sE1QlCCYOzy3ykCDeVsmR8fFVgcCcV?=
 =?us-ascii?Q?wMHaOAoyydjl3LgP0DXpe3Xqn2JhecDJW4t4jwU7zqGMEMBWtzP5xWN1Ptto?=
 =?us-ascii?Q?iykHoBy2KOtemXIez6D6EA8J2sxC+5Fa2Ut2l5ORH4qRJRxrC8WCIrpfxZIW?=
 =?us-ascii?Q?+LSDQvVpbgju4y2YOXkdKFIaSCCpQbfQ8uvm3vhEJvvrST4yaNboj0FP+ecY?=
 =?us-ascii?Q?ABApN8Y6RXK+vBlIYkmtQxWwUbaq+qDTExapbM9AZYZ7opDafFvf7Cwe4KJx?=
 =?us-ascii?Q?HDCx6u+tWeddIK9TTx1y/DsHgqxhUjE2EjZEA/VOyJn+KeZNbxURepklzYFr?=
 =?us-ascii?Q?uEispJJ8uS8iWNlD9YydQ75lxBJp8GPiTB9GmKFrW/omr7o+QM1omdpcNea3?=
 =?us-ascii?Q?ENvpVxzNLT2UdbRzAlD/lyXeZsDGiJ8EKjVIczqat0xJ/IswVd+ledHMT7qQ?=
 =?us-ascii?Q?DADvXM1zlBwg741t+NfMlwt0IFsiiXMcPipHBhy8XPK0nmInlof9biG7PzoO?=
 =?us-ascii?Q?FOM3KsJdFPdkEkr7v/dX0d+YLs9SMH+hLrqzzfqvkmXpQIPxRt8BoOixRGfJ?=
 =?us-ascii?Q?9i959vrvo6gx+IstYJh5jl7VbfQ8FUy4ZrZR/Pv5icYeRHJNOlaY3WIA8iAS?=
 =?us-ascii?Q?Y8hpz3ZRGxTp/0Edool8ysFYVzKB5nIUsxYDaec65Xk2jBqBen3YLksjHBrn?=
 =?us-ascii?Q?HnLdIP+5Gcr9rNwK+1pTHZuo2cO7JJw9ysy3dUD6Bg8Y2IqoKsviamnHLXsZ?=
 =?us-ascii?Q?vTvUSMOvL5bUCZGGe9P05AMTj3r7N3feElCHDhdLmf7C496dZjGcnl7o77Jj?=
 =?us-ascii?Q?X9BxgUT1/0AtxV37075f32jXcGcjFesHRNE8qxhI57d3yHgzaEEuVSL6qPfd?=
 =?us-ascii?Q?hf9CfwX20/LL8bgR2KPxNvcw3bnBlUO7fY7lMM57Jq6T4XpXBR0lCnadL9Lh?=
 =?us-ascii?Q?HkWTLWISs79/AZQLWbtm/jd8o71mkctwLdecyB5I6QO0gYgFxfdzBFGcowvX?=
 =?us-ascii?Q?Sk9iRe+dtaV3+IFMvL0gtf4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a5f68a-8a04-4fa1-ebf7-08da8964f356
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 02:19:49.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhuHEAazpW9qPOFoJDd51EVTfuAz9hfo0Szd3avLEB7ZWY/2BOuM7lyz894ThVVOO3jv5kLRlhQ0QTNCw9NEHjmUNPPSWWbOa+hZEdPKiTD7ia+qcvpQ9EqQ3YtkEjQk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10023
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

Thank you for your feedback

> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a77980a.dtsi
> > @@ -0,0 +1,7 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the R-Car V3H2 (R8A77980A) SoC
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +#include "r8a77980.dtsi"
> 
> Please override the root compatible value to
> "renesas,r8a77980a", "renesas,r8a77980", to match the bindings.

Sorry I don't understand about this comment.
Is it for where/what or which patch ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
