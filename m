Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E8767DCD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 05:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjA0EZR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 23:25:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjA0EZQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 23:25:16 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2125.outbound.protection.outlook.com [40.107.215.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A2F564BF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 20:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+htQcNhwkYpKJyjaVRFnq7WLNfK2PS06Yg/LSjHSo8FXOhMBIS6qupnn/4lmskMtPfXfEV3BUyT2CYu4wZDu0ytarHEqhoZt9PHAxRuXfr86YVoRkC625E4oQ6gEj5KUgjY3KFvRkHldhHpfO3KoFetnekUJ+Y4wkHfpaxMIlsmYzZYAytkvAOPHLiN7xoNxgsVDAIhcuqcB4F0EAOCuWGAbqmwT7auAYD6MS5+678eCQ0YRhooxlFVe4OMnLp4phO9ylaP3oV4MV+S1b2l50DnjRwpp7loWoAIaMte+8L6oY/fYK3yT4C1mmbo8TdGXgjYH0T7Ekf/FyYgsYDX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdvviCFa8D/OjutPuy9zpitfjmDCFgw2PcloWOJ9Nkc=;
 b=PmFPkVLPwo+yq0YDJK3B7NU7irtdvyC4t1bQq8NNYmYSTTvWnAIsOiGVQqcpGxjeK/nLr/9gfxKRMlUurJsFiq3RC1quxatAE07EiaYkmVAkon1G2GSrzknmS5NRryHg1WKmMekEUzMq3GeTFPbd8MBY8hTBfpdS9iuJyrT4S67rkv1bnWEYfYAyNFzSTXjMDMKJAQW2He1qGCZ2qPAkOwOlXkzPO6iztbFnN15itaBrchVgDA5+LZLUF3vaesNlHFXGG/r3qRVfQIrVRu9DRMtQe55z1Wnmy3qDutkLGwm35m+jB2lM9nBoE2pZbe+UiuETa/uo60LDqT6nXaO14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdvviCFa8D/OjutPuy9zpitfjmDCFgw2PcloWOJ9Nkc=;
 b=kUN0wrorz/oGPWVkf2pSOrrjzKxbK+F0nyA/AqKQoTbLVLKkuPS6/D4SCihUI9YW4yZjEKVk6h6q9UOa7wh1pn4OdxFXJZmGE822SgcQgzhW59mBGe3ON9GU9LyBWKWbItGbtpTvtXjNKJJbjyoWcLxFhEJKzwLpBFlDOiC5nps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYTPR01MB10901.jpnprd01.prod.outlook.com (2603:1096:400:39b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 04:25:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%4]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 04:25:11 +0000
Message-ID: <875ycs61ug.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] clk: renesas: r8a779g0: Add Audio clocks
In-Reply-To: <CAMuHMdUkDgOUSCO4Qaqq7ZJ9mG1f0-915PzoRynaNOVOD_Yz-w@mail.gmail.com>
References: <87y1pqt4vs.wl-kuninori.morimoto.gx@renesas.com>
        <87tu0et4up.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUkDgOUSCO4Qaqq7ZJ9mG1f0-915PzoRynaNOVOD_Yz-w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 27 Jan 2023 04:25:11 +0000
X-ClientProxiedBy: TYAPR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYTPR01MB10901:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdcdc75-71e9-4e0a-5abc-08db001e7b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcXOsx/pftPQWd59yGb5TfUAXyCl/rI0O5CNG4mAvSfG0VJy9Hp92gtCOaUIgmZQmbEXNHTXBHGJNFPIg43QOGLpjsnaUhHnldtXXXHzKJakz4j+5AKI3y7/vTsgygepau3A94Y+DHuqrMMGFS84yqjxqsQ4ModiEYxZYttLwDWQRMP83MbmRycU4geBit6YOFX2aOBLutO+Cy+FApAHiRNP3/AuX9InML17gOdajmGMK1c2yM0+m6jEb1wuJNnAIvYGx+mOvQfYY47LP/+F0PneZQkJO9b1+kd8BXEEAAECreRBJu2PCQU20WXWYQwWXlbyvOoDI1FJPS241Uc5C4uFmojmadr6dhcGH+PzvON95J/HHp4HncXk/TZixq2IIlkflpgbirZyQnVmj3cgDYr7lfbiijyOjziNoicmCgkzmM16E+Gz0uEsszn5RHAJ/Ihx/7XxG/55HT3UxXDoOPoOtV/015081y7js12bGYVj/cETnF2fJ5XMHaab4iYo4FbNxeZ4AE1c5kefz5WuZo+X9rT/PEhSlTRdh/np6Z9c0r+dSjfEtMwt/xzK1clHyWJdLIcrLChvKP8dM3eDq3xuHNmlIPHDuOLuSg4BTgYO+Sc7lf/7pDGALeEMf/qkh6mIrp0AwCf//lleLUSUod844elIN1lpW8C2A/3VMjBjTQ50+IEPFyi8BmNMdfK2f3pK/FBK747r9xxV42s0oQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199018)(41300700001)(38350700002)(38100700002)(316002)(6506007)(36756003)(186003)(26005)(86362001)(6486002)(6512007)(52116002)(478600001)(2616005)(4326008)(8676002)(6916009)(66476007)(66556008)(66946007)(4744005)(5660300002)(2906002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N4USiA4Gktag9tIMdjRkkw7U8iihm7nKOgZ5i3WcBuBWRenrDW1ru1HVXsGG?=
 =?us-ascii?Q?Z0gLHXZ0C6VKfaha3fZBs3CQY3+POQSjNVrQ2j/MqeyE9CtTr+Vr1ULKjz2o?=
 =?us-ascii?Q?PLQnOTPYWqWPmFDgxijt6/BGr2qdZUPfDyMKs8v3pX3lNe1X3rxM85ukYbvB?=
 =?us-ascii?Q?XNXEpb7dHozRBH9S2ap9zbX7rx8xv69yk1R8DuqtiSM8gHA6CtHshrd6x1Hd?=
 =?us-ascii?Q?3GISGn5AAQCsyhl21hULr6PIM7s03djMnNUSdteoiv+MUg0iUbQEr9AeQZon?=
 =?us-ascii?Q?P0UoI0S8U4fJnSh4LEmYpZ75JIrMi5K4UAye+bvU6tHqaj0G/KpAhRHYHgQj?=
 =?us-ascii?Q?PRyvY70wr+bxZ2EkVk1SqPDRfNTa3EfBiFh1epv+TRhNc6tf9XsFOJXULj16?=
 =?us-ascii?Q?++b+ne9VvyxxRmjb6/LmNzBw0a2gfEabHWBjmNU6O5MzyLlu4Yhvsl0OyTK0?=
 =?us-ascii?Q?TqvkIMk3S5NNE+P72PcUR2WSp6lIWYfunnCwV3zsHVIxKYdRxXSbbgb3fKbA?=
 =?us-ascii?Q?Ua0JC3Xxwa2RokioXtFrPW0budzPr3PsKfxQEBBmzNR/fw1TvtTgn7j41xsX?=
 =?us-ascii?Q?r+gF7/xBvEltIM62yV0awOQdINHKaYnQRLojOwA5IrnSx2u/iE+HaHEe3PB3?=
 =?us-ascii?Q?qMLVog3MFA/OPt45ehm5+tyERb6TsxZdciwuHCNd1FjH6/6Cixfi7jWws1bb?=
 =?us-ascii?Q?3/UoVOtbE71nR89xZYK58jV0xf1MjbhMU5Opx/8R2+yrAaxpyoefvhfWqm3W?=
 =?us-ascii?Q?dhmBEsIOjZXKOeInHrhbV1+TxF0qLv6YSG0wdQt/tCcAnM6dI0EzGlpxKUDK?=
 =?us-ascii?Q?FA6sygxXka978BqzUV/8VeGpkIeSz3A6HzhUN9XSsMjWGlOmTb3HjZ88O0v4?=
 =?us-ascii?Q?Pv7E592D8NUXo3KyztPVp412zHc5PM7w2Z9ODLcZmMAcbs1P5/n1cwPdt/8N?=
 =?us-ascii?Q?f6c+yT/3sO9yQK8nzdqB7tukshA8A/65tWLKKADtVsJNT0xlef670/7DiGKL?=
 =?us-ascii?Q?sNRxVrneNNv61YB+U0iXs4egqjIbSpnSGmxGwEyMjI3iQUC/O1UkIcCaX65l?=
 =?us-ascii?Q?Ojb97V/fT5wtm7wY7O33a42EN4D0Evqub7f1bJbaVwORrJT/3SWZzKplGbSr?=
 =?us-ascii?Q?5jVYatt7le+U+3vSXUF+p9QcXXtmyZweGTb/xBJaK+ta+RuO9ACU1UsUZEQv?=
 =?us-ascii?Q?jXzo7tiBGvdRsJrh/qagHiPxms4maq0UQkeBkaDt++fefD7nJN7pF6xxogAs?=
 =?us-ascii?Q?KNp1/RmjSGcvZ6Fugwy8+DFDKKOdBYifPa3OsIjlriZlXJp1/SHxPOPUaJXQ?=
 =?us-ascii?Q?MZ/1U5dqEFWv87tt3FdmbGVWN0zHxxo/40vO01g0KRbyiggIdKJ2mZw5eHlG?=
 =?us-ascii?Q?1Zaa7Ydst5FKFHRIB6/s6mIe3xRDyEJCKPMZha4wsTbOI/CByTvB3kJlq3y5?=
 =?us-ascii?Q?tnc5t+mu2K2cSvYIJ2MKjyJHkRAoZoka3nUwN77k+w0nHMgHcJ1HTDChs0gm?=
 =?us-ascii?Q?2KwZxkw/lHn6k7HN0Zi9AXAWL5dui58KZOnO3cW8LhdOkSYnvDNO93GgUj+N?=
 =?us-ascii?Q?1txZNunoFI+mxSiAHMEflv3IgugXe44MXBM+smCUxImcuEJO2MjQbJfvrH9c?=
 =?us-ascii?Q?WTFYozz26B+O96ZN0ROlvhk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdcdc75-71e9-4e0a-5abc-08db001e7b0a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 04:25:11.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhHJqTWLDAsb6adZMDF97LdpKpTKLfbLr7rwZrajbSKzYmJrGcV4EvyPD2PPNNL6SuZ5by1Z0MqM0fnjDo7bTIR+gl08v92NPyJxuKYSUQvArZ8jKShhvZ+p2waZVBGY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10901
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

> Does this actually work as-is?
> The arrays in drivers/clk/renesas/renesas-cpg-mssr.c do not yet contain
> the register offsets for e.g. MSTPCR28 and beyond...

Thank you for pointing it.
I needs extra patch.

I will re-check and post the patches again.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
