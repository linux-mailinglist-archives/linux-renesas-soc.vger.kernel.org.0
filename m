Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2EB87A6FB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 01:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjISX50 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Sep 2023 19:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjISX50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Sep 2023 19:57:26 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7911095;
        Tue, 19 Sep 2023 16:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDKCa56J34Y4KwwBvvabveZfbaccPb+l6J/4BCHLwJL4KkFvnBkgTRRBz7ueU03bRoQJOzRuV5lNIsUMcAa40hnzHEfn4RmN29iVm8YEtms+fG2JyCOuw6Mb0yyv+gv2GKsbQlGPM7N0NjTZspnHPDMjfKkfRdNAtlLytstHkt4F4BvYqg3QPs39JtcdLhlug1FokgVZlSh3wtAkeFjmTdONHXKEDdmMbWAvbWeMM9MD6EjK8z18MW7iRfGn1kpA5ymbT4dgXVEMilmz5cKNYl7bRM5TxapsQCieNs5MT0bZyjKZyIMrv/f2/R8Xz9Yo6xySY8r9BJTshel4kH79/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmU441Kj8sCAwn/cyIlUMCtYMcKdGyQMJXeFCjgnCC4=;
 b=TusJZKRNCbhvd9G+xeU0Q0YvEC+RzRbwe2c+F8UABDXVkriFojlNIJKGGm2XJ+ecU8ly36MxvFKZ+tsZYZrrCsg2OiHcV54FefXiQMsNqbGQnzPt4bnlY4lZILHaS+FIWMM1sNCDBzeAAKCJNb4naM5CIPYY3ofwU8xOPEh9yKVNNlxEFy16mSgR46o+oT0kiHibeZvyAMHgMz1+WxdGGtWhj8n0pUHlPY+RnUdBjUbpenGJ0ABEM5Q7JYWtXYcj4wZPQrHw6Jd11bEo9vuzO5aXVICY2g1c9LaWSPHBw+IGMjSvdawurWyEguk6Dku4iIbfvMNLcV8c6Z05AEsP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmU441Kj8sCAwn/cyIlUMCtYMcKdGyQMJXeFCjgnCC4=;
 b=C9y+mNLSAdbGrx99MY1t1MrBNm2dV+pz8I4q7vhHu0Zkj0sCNuQ/Xpo+gcEFWeIznK4zwZ4U/8GPn3TCd5cb5p/9JLRpYORRJUx54Xo5Zib1jZCwPZ/fyq4TEw9AiN9ouhmRWpSbpixajX2kOTkf4TuQ4zSJdaiLKqzpPMvmt4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB10534.jpnprd01.prod.outlook.com (2603:1096:400:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 23:57:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6813.018; Tue, 19 Sep 2023
 23:57:14 +0000
Message-ID: <87r0mtyawc.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: use multi Component for ULCB/KF
In-Reply-To: <CAMuHMdVZYqfzVxockGmCjBW6dZNs-b2WyYMwLbGhAsL9iXK1ZQ@mail.gmail.com>
References: <CAMuHMdW_d_juuo01gbD81aHJ=bs8k3jXeiP7kkOzQDVxHcbzoQ@mail.gmail.com>
        <87y1h36k35.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdVZYqfzVxockGmCjBW6dZNs-b2WyYMwLbGhAsL9iXK1ZQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 19 Sep 2023 23:57:13 +0000
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: a1174419-e6e6-47b1-0ff4-08dbb96c2591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vd+WoQjAuOJQ63P5NJmespN3sqx3YnoRWJelVVEojdpmsO+7eg1tXk0W4j+bDNj2E7jtVnE/TvfyntJhPhXLT9H0fW8eDSwgu50fo/sRYSeorwok+eWbG1BNlxxolvPEC9w2q8pcMT116OnhSbwCmoPXIsEUAZaWXL7rbs2Frf0w5O/nGWml7Rbe6AKcQvfjULqRK4sLs2OcNnOOmbN3y2A+i7qOc1WO71HzXcRhvwMeuO3xB40Rtj1PRhCDuIBzrP7Sc5d+eLn2HcOOGFQL2UJ60oA1mCEko+jDJ9LxfEf3TpSN4jafD/asiGHqdgW79POuY8yDtEcEqOuMqUOJDRz2S3gF0iO3/ddsxyGYZqsnM90bbLQhW6lUo6aLdHDsjdVHnxznOwY4GZ0OkWC2SldVu6p9I0vXhUnNb3dohR55Lm/9LzQJCUBl094R2iLEov6g4DJ8MV6KKF7LoXNqR9zfcOrIU0+25vn9TAjD+bCsG9krPy6mOAvCFpxnjtzqbXP9xBWDEqX7yTrrVLBIw43RiaJn59r/HFl2bfwMMk/Fg/qWNZK04JThwv1Pbt3r3RNkI2k1aSnyLSygxIuATiSg1kvnLjVMePMi4LdT1CjlzphnqCv/y1D0lHSZUbsr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(186009)(1800799009)(451199024)(6486002)(52116002)(6506007)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(4744005)(66556008)(316002)(66946007)(54906003)(66476007)(4326008)(5660300002)(8676002)(8936002)(41300700001)(6916009)(86362001)(36756003)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gbY5WJk+T6ce7+r6Vwomo0lVzwL5TOB410i6omfjyBK9HdWGFtOZDf7ysODb?=
 =?us-ascii?Q?/Q1bEOGQ7PJ0QhWy1NA+OZOQqYbN7cXakYt7e19FddpCi2L2P0dsKzUoYjXO?=
 =?us-ascii?Q?0VtnID12U4gKpaWYzyHoMiFu2XaTqL6iFajEb0Wv7445mvsDlobcbtQQEYhT?=
 =?us-ascii?Q?tYbNmD8vhUya4XEXINZKHtmw0JIxY5QX4P1j1kdHGD7iveZTZtaWbLZv0AuX?=
 =?us-ascii?Q?ofsZadocTYA3NWQ7bCcCif4A5PYtwc+KHfjF4/beLyn1T3x/oQNA3Yy097Dx?=
 =?us-ascii?Q?vlRUpvdq33LUDtE+/EfSyUQ8q5jNDlQtZI79xWjcaN2gL49UHYq4u9McpB9R?=
 =?us-ascii?Q?QDKqOFZg4vfr5SHkuu1r/QiPe+jeYHJqP/+hY5Uyx7zmtBPnkt2Tq3pWgXnl?=
 =?us-ascii?Q?ez7fjWPhuvXFtN21HUuM/yIj4zPVYtUYhO43sn/bppR8RGnkYUNDYGf3fdbC?=
 =?us-ascii?Q?5qeL1n1TWxbNHNznpnCWceM9tZdJNluKvkMgvmVoRPg1mb0PZJBNxB++O4ga?=
 =?us-ascii?Q?EjuMuf+Jz6KdRZb5xCJJ8b9YV0xQZ7fRx41LDIETOUIn3wNLhW6CCND6U3J5?=
 =?us-ascii?Q?1AttpIJpK/KZC212cZjfR9fz7+w23SLslh8S1ujbRITfTMz6P89ZBKhPd+8l?=
 =?us-ascii?Q?tx4g5ruhRmEb2NWsDn/6966qlnlCIWbdS+X/yMW3Ab+R1S4aW3v/spFgZoNo?=
 =?us-ascii?Q?hCGBXrjR7eGnqg7P8z1E0pdeePCxm7XqU6H+TOT9QmPeyiZDWSMXOyXECTKI?=
 =?us-ascii?Q?s/jBcupY+U9NgqpivluvrKXFjzudbgQWNMCreGQxKEP8ODdycnEyqOfVeJTn?=
 =?us-ascii?Q?h0dgeFLUqZrk6rbcJo0t3Z+3m4BDnK/ZOOVC+O7DhxfBvmorQlzVeqJg+nUL?=
 =?us-ascii?Q?0czR6KjnyaRIMlboHr03oxsCZP6lGc3pYRcM8DQrV0JESQTXtNskiPddygTb?=
 =?us-ascii?Q?KY59TQWIsSgEGDNkz83hnmcGaUSd35qk5njsD9S0r3ovS898tbse2QmwXv+w?=
 =?us-ascii?Q?8McVld5l3sB4+9rBoqL/myNTF0ECod4fsrj2cramHVRU4ZhiVDI7ZrA0LqGW?=
 =?us-ascii?Q?ONdW2/1CvIaadaNucAPdAaGqAQZfylXgmM133y/fRksE0+AYUBfGAqj3u1mZ?=
 =?us-ascii?Q?iqHyUpJs2389b08/f2MmTfVdNymyMfx8rjcJZlZYA3nfdPPWEBT5XiX9qck8?=
 =?us-ascii?Q?graGMsM8rKOVyMBQn8hzRoTEzUiEGuyeh8cupLbwNYnl29bYUIWviy7M8LsZ?=
 =?us-ascii?Q?ZTd4KJHw0Yt65Ur4JHkRK/Dk8hLC5wtesm6+yHgNe8hXYSekgT/B9tM/HheP?=
 =?us-ascii?Q?qkaonjWueYovNR/SYcVo64KuUwh/pbln/dHtW/3ChNkDgXCgfvaruAzY6oc5?=
 =?us-ascii?Q?Hy+JtJTAeVHzFVFz/uZM/rdDALJyjo6yhS63v1vlCPcaZVOmNss19UGYfeoY?=
 =?us-ascii?Q?NjcILFHqf5XxBsr2ueO08JXbckk8KY4zrVd0DoM5sesbDfcREsBwxomO2msK?=
 =?us-ascii?Q?FdNfelFWgkUtEeQHDUTa5j6YWIis+pc6ePDRaSLaOxjrdB7YtEI1rJGkzGGK?=
 =?us-ascii?Q?MApsGqeryDRWzL47aYvNgk+WvLloibNTEK//IMfWsHN3MqyonRIF83dbA78V?=
 =?us-ascii?Q?aUKZBMZaagwub+6bC2q9NlM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1174419-e6e6-47b1-0ff4-08dbb96c2591
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 23:57:14.2459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCpaHzEGN6oMetxm+UMju1Qbz4+ZHZz1IFRigrDj3cVVboY7+FhtdIJqqtUh5iwaqECO8iahtogxAsKYpEKeH9Qa6Z7AxdgEAOWP2YVvMMybuIyZ2t/vX9Jzsu3qRnho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10534
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

> I think you misunderstood: ulcb-kf-audio-graph-card-mix+split.dtsi
> is the only file that has "ports@1", but does not have the corresponding
> "#address-cells = <1>;" and "#size-cells = <0>;" right before it.

Oh, I see. Thank you for pointing it !

> Can't you use "ports@0" instead of "ports" in the base DTS?
> When there can be multiple subnodes, we usually use unit addresses
> for all of them.

Hmm... I could do it...
(I don't remember detail, but I got some warning when I did it before...)

I will post v2 patch.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
