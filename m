Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C927A73B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 09:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbjITHIQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 03:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233534AbjITHIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 03:08:15 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0243C99
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2023 00:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URZKphxhbmNYM1uid9UpsKh3Tq4FmKur8DAAnv82utTSm3gZSy/gU0q57a6N6H0nkvPi93QBtjiDAlxz79tjuhJXsr0tSPMDNq6Q8lqPKtoQp+6TkZ6XZDNpGyoe3svj8Av0VaoVtxgwRGeZKIq3mv+n2rt5suU7gXgqwGTJ16nwHgeADB/wdnFnyb7x0UFyoGdJvDqoUaADwpeEBNLHawOTpwTfS88bYur3XmXOnl7+hKdnkwX2mzb2zQaBEVpvXqPKRB6B1Z7hEF7KefVhA0DJI0vNjIEX1pfR5eyhiroe41DlbzJuvlV7K9jsqB4gpE0zROviI8v9Wc5apPimdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7i2JFPY6Q2efX0dyFUO+TF6QzZaTxSBBKy6MRy1jUWk=;
 b=RNKY6uxA81oxM9Q821jF6Yg+bhETSxITeDY5CCwviy92KvEHT4Yc9GYn/QC90UQS+G+EYHD81geq2GBoNcWiPnGJ4393pIkA/uFuQebEy/48OkjcWbm9Ds3cpF5FOdJvSz5e1QBrRawhhAd7ApC00QNgiY+rWlWhwvbaKsto58NhM+cpCXyxQiiiofUQtxh8YJlF6HPgY+7lfjpr8Yd623Ev32Q2aq8uiAUeUkug5Yx+fMH8vB6fK3NS/ZhWjApEgoq8M/UfDpR5zyPWXkaUpn3pr3PP+c3GyxTzRm6cTQdNTDY8WGCB+hajOjCdPkmnyvTGNUIfUtpmWp6uH8TymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i2JFPY6Q2efX0dyFUO+TF6QzZaTxSBBKy6MRy1jUWk=;
 b=U0VpF5skrUx65ZeRgDgvWQX0mVyfAJumA2QhLKmn7FYybjYKQA4X9bx9Bu8BqF5HvBa/Gltp0lb75kVYwZw4e2Q2TieKGE3ZYNee7ZTPkajzdE40EkPH76es0J7xXqDY3h8gXkyE1vLKLOx5L0T+aWwOJq+gBQHOASeS2aLkuEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8139.jpnprd01.prod.outlook.com (2603:1096:604:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 07:08:05 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 07:08:05 +0000
Message-ID: <87msxhxqy3.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: spider: fixup memory address
In-Reply-To: <CAMuHMdVjW-bwJzLizL6XoJkq_SNUwrPQW7imA8VD2yX5-q+mjg@mail.gmail.com>
References: <87o7hxxv6o.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVjW-bwJzLizL6XoJkq_SNUwrPQW7imA8VD2yX5-q+mjg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Wed, 20 Sep 2023 07:08:05 +0000
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e66ead0-e25d-440f-7dac-08dbb9a855f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XaozALKRo9cAMT6/xG4w+aWVQ00EeZEIUSd+1uB2HTkyo0CqJCpO5iI0rXU9GyXqaZuZK8+1pMN3Dk4nZKrreS+iQgmobKhNwIz3JIJHpbmVUPamfpe1cyn6bMnsZJB1u+CMsHsmrivuvNAddD+R2s6DGh4IIcjG+198aBUVktyNga2dEtppLEnT8tF2lFXuN8P2WtVAyhR2XmfZeryo+EHoDMFqIpg+PwuliKWFSLLDN5AePLiqnsy7+F2rgVhBP5TBM6dRdbi6CIZtDw9m9g+GzyGo51bofhCzQUzJZMPipk5VshIxKkVkUxVP7jvkHjjM6gGymQIbXRvcgS8PqLbrfOJfBfQh20ANSiDv7Y63RCjN9jgHhLvXlIFiUzEZuEMQWNx/qZkarWEO3BYkmGrqa2AZXRZfX1rq4oargiQlU8SHDMQ4u8Q+h1Zo6LvLvCMf7cVpaM60O2B4lFtz2n8taY4EGxXiOeFIhoRG/jgTZEuZOEEz5JFlgXIxvC7bfdYDF4x1EXpSb9qo4TyP74VfacfVF5n5W0fvEYBlidKZyrAw6KmWPlEhn7o9gpZBA3EbgxoRvofqTvfo5Y2z8TDm/zGOWTnQc4pzmdP6R0MlWRNRfeTYvg1lUWKsXDkb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(186009)(1800799009)(451199024)(66556008)(478600001)(66476007)(6916009)(66946007)(26005)(2616005)(6506007)(52116002)(4744005)(6512007)(4326008)(6486002)(8676002)(8936002)(316002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPpISplsH91PHmOUglcVS10lOfDN0CxKlPQa5DXPlJq6i/mCJuMaL0uopORE?=
 =?us-ascii?Q?kx1/Mg0S39/vVKTAisT+5+xuI6/kpVr8/H+cjAODL92V5axZjyb7arWqPqnP?=
 =?us-ascii?Q?Ox2snZk63J+XpOZiUdSiCOEawMPysEOvDtuxqqLBgpZ5kfHw04vBIpKmMLfX?=
 =?us-ascii?Q?ZokmdLAjUqoQzuitQEc/OK7N4XcIs/5f2L3lDd9zQ2H+IDbEA/q1dAnVStGB?=
 =?us-ascii?Q?nHIAaONWlXhr7vbka/2rlh8Iz6CRS0zH1KUIDSUmarkmrvbCX8ukl5AueTUF?=
 =?us-ascii?Q?/obaygGMMGc/yyEufdXPTPGpgluNMmVMXCNCORZVokzL8dj2Ai4bBq15ndvG?=
 =?us-ascii?Q?GH7Ru6QqAOrCaygRyhQc/qbXOPW0schYlFj0TC9UWe+HA2oRA4OWJhLDN1I9?=
 =?us-ascii?Q?MEUFKina4mYwDrNgaIn4wCAvSngJfxRA8AvFWmdKGTTkpNEEj9LzFozgTAi9?=
 =?us-ascii?Q?IJpKsAsqE0PMbe3CgbRp4qX9/47WtTzKO0bQqjigHOBjMh54wNWuAVOGSbce?=
 =?us-ascii?Q?U6A1YxkaxKGS3CyqT5e0dWqPck64o8366YIKpUdoDiXNgV7Fs2md4ICJE0hr?=
 =?us-ascii?Q?bsnf0XWcJUI420BeExUMYBegg85zuz68nIrkL1Yabt3X29VZ8+bqULRGmPlk?=
 =?us-ascii?Q?axGEiUnGIRs4BLjOzdY5cJicMikf4Aja6Qeu+Wia87GNoAtJqMIBNdT3sZ5g?=
 =?us-ascii?Q?gjEaoR9nLujURx3cryPPgxGsPbLeUn2FyLUQfHCY3FZT44xwUQYM3DPcTtvz?=
 =?us-ascii?Q?9cjkrQpzsili9GxDo/uvgmZt3jJNfT1hmlXNipvU8mNWStyICUBCTlranZpR?=
 =?us-ascii?Q?QE5wrzcP/iQ9Y6v30CCO1495KSzqLUL2ZN7xUUtEOJuM7+svCw63sdBpu3La?=
 =?us-ascii?Q?ru6GG4G2aFgLfVYSCaQE3jCrKHjOJjt6waBlt7i6h/S2smBWOZq3UrJ9Etz2?=
 =?us-ascii?Q?62BKQaEqXaGyLWEj9CkWzGhwMp9YzeC5R7CoxQbfav8PQGb1+kysigaCE8A0?=
 =?us-ascii?Q?lVBWQV6iAs6xCn+TfU5Hs6j+kp2j/RUj9bi1jred4PhXpBs5QEViKVwd1EwO?=
 =?us-ascii?Q?RLwoXD3F2kSrFBUa9Oqm6uXHkKwNU/ZVJ3IvfFsrBRrrEtoHIwJhe1jE05/Q?=
 =?us-ascii?Q?d99XgHbhbG711MfrnQQ0srtLXMQiUIpLCsCkla8SgZbi68cYlA2TIcZxKJ6K?=
 =?us-ascii?Q?S80vBETezjB4ulakasvZAAwNdis828Jl00B9KvoxHT5WlQ4Q5yva6LS3jDVr?=
 =?us-ascii?Q?bntYigW4ADZCAhapU73Ku2ZSYVDki7ik24H9mTgy6IOUurLMBaZQmSiJOZjl?=
 =?us-ascii?Q?H2ArlXqK3PtAFgge2VAGG2Pmp83WZc88OJLjzst0VtPqt0LiCZQC9ptQEvV8?=
 =?us-ascii?Q?kn+s+87CV+t73gNP95M+Y/Q6vcudIIqbqHATaNujrqiOjJBCcRmSTuw1w8Fn?=
 =?us-ascii?Q?8CCmtE3ALFWWFBf/1NzurGl+dGtieHhrP4+N6S41Omy9hT/QaL/5gf5jVOCe?=
 =?us-ascii?Q?zTdE2FQkge3JyF+G9dA3T/psTtqKGaDKJ4+1qC658770zpEXTOMsUgVPXiEW?=
 =?us-ascii?Q?MF35Vdr3iaBNsn5lvcLhwYmiq1bvdk828HMjM4csWHFEH3/1nCSZAFwFeTJw?=
 =?us-ascii?Q?mQzYRJZMMfekguCv7nXkteM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e66ead0-e25d-440f-7dac-08dbb9a855f9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 07:08:05.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6BdlCW9QmbIenfJxh8DHCH63tYZVF74W9OLYRmQe3ywX9/dZID4mm+xrCidG20fGOEk43oJ5FzNhVURNktUvSsA42c2PwfYro8rZGixGgD9EAqOTSonHWNpVSUeK+Ux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8139
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

> > -       memory@480000000 {
> > +       memory@80000000 {
> >                 device_type = "memory";
> >                 reg = <0x4 0x80000000 0x0 0x80000000>;
> >         };
> 
> Unit address 4_8000_0000 is correct though, as it matches the
> (36-bit!) address 0x4_8000_0000 in the reg property.

Oh, I see !

Because it has memory at 0x0_4800_0000 too,
I thought it was copy-paste miss ;P


Thank you for your help !!

Best regards
---
Kuninori Morimoto
