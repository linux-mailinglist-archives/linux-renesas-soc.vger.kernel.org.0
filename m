Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA24E7B4A75
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 02:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbjJBApC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 Oct 2023 20:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJBApB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 Oct 2023 20:45:01 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B155294
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 17:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCDgb9iBzRrglTkx8Op54aVV2F6CfRumcbYV1A60oiQ9bGx0zYuNY6ZqHKLc4UKgUU34nb8XdWGRi8yVp4E17F07drZFr4LoRhLpkpZYA3ZoVh6oD2XS0AFNCyb84m7gKb3nNgE86qrAuuHOW0gYFDRLDciKBuAKXYKyTYyTAoiuacWOeegG6oc3kIik0Pb45MCulLNzKoKy9zffwIlKWg1+lK4No36FL+BFngmlq0NU7MUFvSNi3InGHuHo2y4wvP3W6gDMjKWV1cEPWqgwpH+UXZtmLaaslXDAER095Zn1L/WEX6aCuUt4CtukEn8+IJlyyH5G/QSpeDOZYUd3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtZtJ1GsALDWx/0obd8ZphAeQI46BtMLNWgP7g/JHxU=;
 b=FzQMvaMZx/oyZC58zsWFzCObx9ke9b+AwrptjLSUvQnGTF0v0Pk3F4VxpyHqWQHDc8TuX6c6mOHA/okI+J3XCiyuAO8agA+AoPit9G4kcrxe22jtDiOgXY1KLYLJRvdzVpW8Jdnj6znnTgSJTjEUYx0QACy9HPPui0bDSl7xU5lx4J+NqvVf7JF+6UZzc8Tv3sL7oUtEM0MDovFwQ9DqfhH+4yicMWHXBAuqIgpxsLjpIo0PRrO6MT498iaxgBx74QA4Na/I0r4U2DE7wP4ZcwXPjaMO1WCM8dG+zYcb5xx1BGqO9CmLrlB6gpXOWmAqM8ffq/m6ZE/leVJC6La0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtZtJ1GsALDWx/0obd8ZphAeQI46BtMLNWgP7g/JHxU=;
 b=Qe7zPK2bY/ldtv9C8z8/2+ILZtU7NIuNj5EsuwvKJLO46IYsNQHttqWfu1suVD/xD1LPqkDE8kAKfp/xLDXgUS8mp8H+GaQxsHUqBJJszgd/mdUgMiiH8dwecbhNu1v6TPTLNrR85Zog6+vAXPwO1177aH1rPHkmo5KxpIz32Hs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8554.jpnprd01.prod.outlook.com (2603:1096:604:199::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 00:44:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 00:44:54 +0000
Message-ID: <87leclettm.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
In-Reply-To: <CAMuHMdU01cU4jO2+jt2fpsU=ozbAHzNy75NJvffESOWHrLJdZg@mail.gmail.com>
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
        <87lectim7t.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVR+dchDRY1wo2RbeXJNb5f_Hbs9oGi90AV_1_rJgT-5A@mail.gmail.com>
        <CAMuHMdU01cU4jO2+jt2fpsU=ozbAHzNy75NJvffESOWHrLJdZg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 00:44:54 +0000
X-ClientProxiedBy: TYCP301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7af44a-9441-4cf9-cdbd-08dbc2e0cb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fQlUvtfN+ipzY5BqHNxI/6yo8XJ8t20V4hS7t+5diMcK/mMwq2mN5hFdJK5NZEc9w9L0LNxp+LHL/zKSR9YyoRr+sBLHMl4lSDjBwHZF92ctX+RaikF47dZ/+s9h8A6Y+9vUIXx3mL2VmowzvofMUHMdZfK1AJ/BBQrU2p0DdngZS8E3fWXbbkusnDOMNmz+xypoy2OtkH6gZeoOXblTt+cDhTmBSi8+rLgtWHM7QvMeizhCLgcX4LTx+LxcgP96CGi8OOrPrA/8SmcaoAzwHjDR1CStRsM8BRtQ+khKqY2GQ8acgCoGzy/cJvZf5BUcGsrkEBOZz8dcZkCFC8nT8zzQVZwncKbr7NyFjTCCROU+zEzYRTqdqyTiDuJSFaYSq2FM1xUF/rBnGDHCCBccGb80sq3fRMyT7HW6VyLOYrN7Pk+7J7ITovTAb6hAkY6AEaCpZLrDPt0eN3fHlShCKAaPYITJou+Xmif8JJQ1RENP6d77z9tb7gbiGcMy4TA6QBn0SA01+sIDd+Zup2isc3paw1UpYoztaW7Gq0nF9meC05/sYcckt1VFYOrlxjNrfGl096DMT7JXFlK/zzuPO9sDPKFyMS/K6m6f3lNNqGbA0VyGzz29ObXChecR2Pt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(4744005)(2906002)(38100700002)(38350700002)(5660300002)(86362001)(36756003)(6506007)(6486002)(478600001)(6512007)(83380400001)(52116002)(2616005)(107886003)(66556008)(41300700001)(26005)(66946007)(54906003)(316002)(6916009)(8936002)(8676002)(66476007)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Wd+/HULha5Q152pxixk/N8EU5IBFtlqEQMc+i3BYC4VHDGK0frPcUyWS7uW?=
 =?us-ascii?Q?GyxyBnGQbzcCuU/pLJ0nBn8M9RviPnJK88PuHu8hCLCuG308Zzl1sHLQLnuQ?=
 =?us-ascii?Q?sNmg0tYs5Ve/OiGCzGaMbj5gNeytFZA43hYnR7KJwgBOuYJ6AQiNQ6T3p/qn?=
 =?us-ascii?Q?Gt4PSIGU0jusSjuMRfFEFQBxxIxH69ygm1qWEgnhxf/O85N4C7+9chtZ1Fug?=
 =?us-ascii?Q?AgQ0nfChY6zJojmfxPUB6e2B59F5ytiT/S3DHUJqNylAE1pVfiOMaj9TcUcV?=
 =?us-ascii?Q?GeILvwRpbaAwm0AZbu/31Ortyntuf9HiNVEYMzfsZ0r4bc5WSR2hlKdgLsBL?=
 =?us-ascii?Q?MFd8e7LaDIRDqd82iiP8FRMhsF6qSY2R8CILxotaCdxNGzZwlHoUsPcc38YS?=
 =?us-ascii?Q?hn/Dv7Mc512P1B7Xs9m7lVX5RAUi4jClA1pDpHPNA1YCCpMsW4n5BFuddoKD?=
 =?us-ascii?Q?SuZDl73kxFZ1R2eqtPNSnt6ytzyFxg05dIQJeIfN3HIak+WKUCK/GAOImR28?=
 =?us-ascii?Q?tC3ws9Pgjc5PLN1J0uIbrJVpIU4MLmUHIefUIfuQvp+PrZkfWUfAYUZK7rGm?=
 =?us-ascii?Q?7tS2bZnkB7heFzHNTMbnab7ovZDqPuA6w18B57C0rrINQlLuZt6phwLAAW7z?=
 =?us-ascii?Q?pMw71oTo9OrxgTvgnhPXBDc0vvUl3hFTKbW2j1Tcjv1GxBqTr5oa4w+Fk0Z5?=
 =?us-ascii?Q?XKaglhMQ57YM9mtUJbR2W1OwCuT4jazi1io1hX2ALfkYH5yyN0VkIYAX7lGu?=
 =?us-ascii?Q?1vPOvOdZ8O7X7NfPp/VErpp9vw9UPPWQtEF0NdzWi6teKFLXNEB/AuraPkRs?=
 =?us-ascii?Q?fchFspxxdX8pRcJPt8BPRTmaT3G8eDJBmRP2XkBNx43X6MGn2jiyIsgV0+L3?=
 =?us-ascii?Q?unqHgN8piJyCsZszlqXnBAHOJ24RMeLbpelmygSOE4itv8duBYwMPkNBTaDZ?=
 =?us-ascii?Q?2cfKq9Ay+got9nhN9luEpOwGT2kDKT1WWPBRQDf2LavDLmf0pC/UE9+cQjMb?=
 =?us-ascii?Q?hFxSA7xheEmsUF6tCJdb8pLxNmoegh4J1eptZXSnAgJm1bkRFjxMO7xJlCMv?=
 =?us-ascii?Q?NH0Uj8/HAGzuKS+Zgd602HPi56Z57mI/JzV/YS2KC6mpdD5FRdA9FoJ9CKhG?=
 =?us-ascii?Q?uq7FOIY2JGnZJJ/RAj91VJqw2H5Agn4w5rirb0A2Fjatz0P+2OdV6MqTIrlt?=
 =?us-ascii?Q?NY6x5Y7SaBuwsfQv3+R9eZlrc+QYhxGdc4B4MOm0sYdd++oVh+wlDLUHEedW?=
 =?us-ascii?Q?33aJsW/I+Yw363/iWyyhdUJhwbbrcE+hDasLgTFYuE8vghoed4B9wPEpygzB?=
 =?us-ascii?Q?OOqvZpR6t85RBtn+h72hXKhOGd00nh3nTatxotZM24/rIr71w1WflGyrf9aD?=
 =?us-ascii?Q?/f63gLFb/IIfzvH/SATqRtDd1Uq9X9nBmJQmB3SMeiIt2aBjS4c4UxnJuXtn?=
 =?us-ascii?Q?rp2G+g5qPuKzwMY4HdZAekJa5y7B/iz60UICjEuf/Kuv8CFRKx3XuQPfIl44?=
 =?us-ascii?Q?lQYfhqWWHezGgjNJTvtTdJsGLnt5RNlvi0srpXELcxHQOGbkyPXjDn1MyUxF?=
 =?us-ascii?Q?prB/zmSiNamy3PxquCkUiiNT6EDGqTJVuffds+aQd9tdKkFOUUB7fS3t+nzj?=
 =?us-ascii?Q?shT2rzgUdbF78kKD0DOllaw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7af44a-9441-4cf9-cdbd-08dbc2e0cb4c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 00:44:54.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dffrYUTO+X6zNA7EVoS+W0oDcETORjZLCyW9nT/wQ5HLA97Ppsee6oL8Pclf968tomUmiRj1KsZXgbgpny2QQIk+K3q+TrD+kJi1+IgtfD7IO6I/z9E+o6ySA/KTkF7g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8554
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

> > > R8A779F4 is update version of R8A779F0.
> > > This patch adds its support, but is using r8a7799f0 dtsi internally.
> > >
> > > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v6.7.
> 
> ... with the silly typo s/r8a77f4/r8a779f4/ fixed, of course.

Thanks, but will post v3 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
