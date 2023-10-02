Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870377B4A74
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 02:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbjJBAoK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Oct 2023 20:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJBAoJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Oct 2023 20:44:09 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D40A94
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 17:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSD0IuDgxyGxfnkebWb8IFRPeslSNklHMC+gP33M53hmDEtK1J4avtLXyQUw+H3uoPuHUtgD4bi+Z1GCyI4hzR1jGI02JVrd1gpzXiB7MplS6PnKRbvAAtzWVyomSeWGUPvZufsSE8my62cq8uwccRGLnlBrkYrrUWj1QjNn4LO7e/MZSYyFYJpzpmNb/fZcJegnsCa6n7qJT0oIDDI/xOS9ZJeKl/tJVa47Hr/lrYdf90K31YM3pQkQvu7w//fQzM1NvIkhyuTIGsM+uxfTJJ0ysKcedG9RqPd9qIS4j9cKcN7Be5rWMRp86+VrI6jbKm8SthEpMKYXAsuq0tOIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5oOmVtcF/isj+00s7M0YWyhXkZvFd/6WPtcV/UWuWI=;
 b=DUHZV3YggXMj8SwqiG4cJTM1qMTRq4HUCnsQDiBWrUC1TUEX9GTR5NGDpEXjlpQLhCFcnuAqtnTZzRIbLT4jwdiF2xEJqe4aUsd3svbG+OgufzScI26FbrVfA3kG9MZBu0an5yfCzcqKMpVqLpOS+cn0Tv+u7oKiPmMJ4bL9QUrzENzI6tCgI9wvY7unj/DufPwwiXlLA3v/hIbYmUCLM2AO9sTLqYfT9s0ONRmeAZ+fbL/6JhpRIhy2CRUpRlZtIykFIaou69rS56y72w8we7Ccx+A1W97vzm0apq29z9EvKOP2GZo02Eu7OgwrjIc3BwrK8MLMRD3PtY2XIx5PsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5oOmVtcF/isj+00s7M0YWyhXkZvFd/6WPtcV/UWuWI=;
 b=LNNJqIVIb9fx1NJH1OB5JZrnuBq1k1gYjOW23lwIk0DpO5vFHvCsufNCcSvn65lcUp/gKA+pfOp98YgO1awnm7986wSdCKinck5qK1CkjFFXMl/mVQtyeJsWydvW3/NjOIGmSpvoZKR9b2zkWHT7qnFo+aGnyRrgFFLtbpJdKs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9901.jpnprd01.prod.outlook.com (2603:1096:400:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Mon, 2 Oct
 2023 00:44:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 00:44:01 +0000
Message-ID: <87msx1etv3.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: renesas: renesas.yaml: Add renesas,s4sk compatible
In-Reply-To: <CAMuHMdW7wzyXUf-zZ5q5_iv9n2=ShW1hYXSvk767gvKP3DM11w@mail.gmail.com>
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
        <87msx9im83.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdW7wzyXUf-zZ5q5_iv9n2=ShW1hYXSvk767gvKP3DM11w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 00:44:00 +0000
X-ClientProxiedBy: TY2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:f6::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1276c25f-d63b-4d6e-2f5c-08dbc2e0abab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcsVQhfbjVKYnnPhVmmk1Qv4DfAaCRgNJBqWet/cOIcm8F+UFko7aSr3NwoD/04EQBo+LM61iYz6CtQ6xj/AJhahwgFdjVRoXW5BIdWl6fQ4pa2j3VEMo3Y+J9hqvzXzrQyQ5qYcbCsUZ995S+xG+fezjr0BU2Qnsdys75qAYJakp8tAp8n9zCuvGZ7rZhGIA8U2vTJ01S2gKpwjTgzMLE/Q6tIejisiwVZH1rSM6e9CzCJqG4ukk5zwzm6zZgoHluPymAIynIwhCrCkY8ku0/tIROV10qMF05eJWJU4sao8pV1L7lpEDHFdEAN4vtgxEJ1yArbPjse7doctGlIzoSxJme+UfqdBTt00sMDwOZhvuqo7nMX7PkbrPFVc94nO3nqny72+7FGqgebimnKzqZGcDxu+anwoNu76sN3FLrn51TBfSZzBW+BM/JLkQWroA8mxWt9YlZCzp+8uNYc41TVI55j3hj/c2xThdKAhKb1Z6MnxM6cQEGPQpADYYJjPFTp3Ld8xUABSQZ1GaO3Pd/2nzZel7Lmn6pF652ciXnlFj8Nn2vknSbjQX+k2v8b9MgIN05DeVuvRmUBqO1BMi58/kfXxemS17gqlOoNuM02UuXD9Af+vqc8Ge9ZiToQs
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(2616005)(6512007)(6506007)(52116002)(86362001)(38100700002)(38350700002)(36756003)(107886003)(26005)(2906002)(4744005)(478600001)(6486002)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6916009)(66476007)(66946007)(316002)(66556008)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nv0bvQEg7RAdgUZsqD5kyyxQhpwKxvzGipTJNbzHzFh7G5DPCeByXr9QJyfz?=
 =?us-ascii?Q?bFw9XrlK/c80VxrxLYH1lxVSmg3pJudvkrWXt336nJ2YVgvyPCgyMMzsQUDD?=
 =?us-ascii?Q?rmtwUY/B/OjhPhWAvXXkdfmZZx2sf7ff5KcmyWqzvQZ70ua7BITlMglFn8Rh?=
 =?us-ascii?Q?IBRsGT9N+70BGi48XSv6q08TCwkmRlwQqL0ZhESY1aBepYCUvR/o8Sl31s+B?=
 =?us-ascii?Q?1zzT/FVNWHH2SkVwpxTnV9LhrlhWxKYdB6FvL2TOlvTddIXPl7EDl2V5ctnX?=
 =?us-ascii?Q?J+5/hCbmw/PdNkb89WSAXxKYRtZyOccj+iVQsWwt0Iz2zjbN/FO6jOytK3cl?=
 =?us-ascii?Q?w+wEAgtpjb5Ao//BGcmVwAy37YOWbGTz9ZPGnmcKUfjlPaNaD12doJhl51r0?=
 =?us-ascii?Q?/lOfuPn/8SSjA+2zMnCk86WyKwTgLlN0Z7KoZ25tm5v+j+c22MQHMCm2RpiL?=
 =?us-ascii?Q?PplHkZdP635qcTSrroqw2pT2dx+2YcAKCKZLMhIdlB2IkLa2/EKiLWrE3B8V?=
 =?us-ascii?Q?dRM9tDGUlCK3lWiaoQk6BYGzlSsTJjNdEnWJW4U6a9H8sy3CSOpVlKgOOvyz?=
 =?us-ascii?Q?wvdQfsxpdXYSc8h07eljXYdvbQ0vSI0yeoGz7Bp8rw99QESF2IoxJPuYHBxZ?=
 =?us-ascii?Q?MocDupsIjEsCGMfq73tRK9Q05aN4zlrjlLgDCrgvJBNqoBwaNC0oV06aw7uk?=
 =?us-ascii?Q?ajgRm8Yx7g9xvPkmM4RMoYfHGq+zEMPwu1LRKpv6vkCE8wfRuHztcpDD1e36?=
 =?us-ascii?Q?JTH1wqpZuWt+q0ezxtNhHABlPGqOdEqNlW2gQmWjOIr3oxQ/HeOT6NsqqEoD?=
 =?us-ascii?Q?1ZnRRKTtJamEIV4E0lzZ+0LEBy463aGaho2MKvZYmQP8d+FDrN0N0sq1gp2m?=
 =?us-ascii?Q?6GPba4aSMqbwVbuZw4SWYK2P1vqibnrz3xpzobW/NkN1u88aAWqo1Gpo7LSx?=
 =?us-ascii?Q?dy04hpbs6pTXctMGZkVkRLkE5GwtBlRPXN2CXJZtgkLStry8ZOBb85jhpnx/?=
 =?us-ascii?Q?jcRQsuZIMbHeItVAA6YZkEV/5cJg3ZlqTwtylWM4b9G17pfBlsE1G9VfR2Ge?=
 =?us-ascii?Q?6dS0yPwVl53d/RwXgFbX7ygiQRpvD6v3UR4FgwX7HPDJkTf5HRiUkFk8QxIW?=
 =?us-ascii?Q?YxP2U9ieckpq7IP55Fj9LEHsFwVEJIbsvRP3SE3JAQZyvVH72PS/WRfoYDCH?=
 =?us-ascii?Q?qD5dt71sU7q/jY2TO5ftd1CTvEMDFcc2piJcIUERMb7WF+WB8uLWIiWPVVan?=
 =?us-ascii?Q?3S19fR/GDwvIBCWn2+rTP3DTcSTNuktZoZ8lAnKel1gVmLGAwuO4eWjpH2c8?=
 =?us-ascii?Q?lDcyIW8hJfCX7WTpb8wkdd7hSnM5wtNLltOtpDkY0bmCPBOFfc7Sv9jVxWlG?=
 =?us-ascii?Q?ukN0GQDh3vQYRZy4Yj0QXQYRp4Ef6vTYBchhxTl8gs2Y0xaE/Uh8t1CZOhzh?=
 =?us-ascii?Q?4H34zafPHpaZfxT4bx4epBLSYmHn0lBt8/lM1K25nB4jG/+hHdlC6e6mHFUr?=
 =?us-ascii?Q?yJQrKTBag1IMtNBjp7BgpFqiSjeFJYVTXp0E8pdRZHdD+tx9cRaKwxfQ8ubS?=
 =?us-ascii?Q?RGgoMiLhd5xpjsydcfBH0PFYHHkEM4nalBuQuzWXTt3l5QzIy4ijE1B7cNxU?=
 =?us-ascii?Q?AYvr8xKWXd6bj+oSxcjBuVo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1276c25f-d63b-4d6e-2f5c-08dbc2e0abab
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 00:44:01.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhKcS+yp1HeU1M/BHojvG/JHwLV6fRKl+CN0DMjquVdP5p0BQsxF7qpHMBr4vi1NmvMsnQydRpqDZTfPQjEgYqwldRo+kN/F7bBj14gfFxsKBnvvdbsD6iM2ruNiJkcX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9901
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

> If this patch was developed by Goda-san, and you took it, and submitted
> it, there should be a "From: Yusuke Goda ..." line at the top.
> On the other hand, if you co-developed the patch with Goda-san, you
> can keep your From: line, being the first author, and there should be
> Co-developed-by tags, too:

Not developed, Signed-off-by is enough in this case.

> The above would be fine if the S4SK board would have had an R8A779F0
> SoC. Instead, it has an R8A779F4 SoC.  So please add a section for
> R8A779F4, and document the new "renesas,s4sk" and "renesas,r8a779f4"
> compatible values, and the fallback to "renesas,r8a779f0".
> You can have a look at the R-Car V3H2 section for an example.

Will check and fix in v3

Thank you for your help !!

Best regards
---
Kuninori Morimoto
