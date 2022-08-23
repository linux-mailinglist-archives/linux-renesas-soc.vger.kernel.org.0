Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 540D959CDC9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 03:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239132AbiHWB0R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 21:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238819AbiHWB0P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 21:26:15 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AF15A2D8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 18:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjaMWg2r6SBEZgnWvVG6X2IjByYnq4nxB+P38FgsuP+caKoQ7xU1hfqn6oah9gfheziSiBaFYUH/9jpfEGvoyo1Ok1jYeL9F/qy1b4/nII52gztLyvUJW71ALKDJmbS7MWNChbpCCZVWh1V9RZUuc2mXuNN8sEnif+0DN95zfiD1DfXOHs0Lr1WqDgvUagJAfpnnGi0B+u23RuUtyW9hgYvvxOTSFdf0CXEjSeYXMaB07WDlD0xYbA5LPtcgN2FjSJFyrlrjsuIjQxVxbJ0RaYTrrG60fbcg04NLmNY0owYjH/oiz66pCySd0q11FfOobJR5bDikIw8TxpQ4DWr0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zoIS8ZJf2pXg9UbjKgHunoZl0Q7YY/oxLW0sObIhVw=;
 b=TFllyG0ijiifaWPlg46Zh7uAEIIvfhveveHLAQOTKBN2YLcxR63XYu6DLK7ook5ODIPCrjyWjO6sBOlGv/3P/mT+PL8BwdC5iIWWp8QCdbhWY4GFAaQaWF/2uR82Vi6AnlnEXcM5LFZVRNS+tpzoT9KAP8xybcTSk6kioKzr0POBt0Qcfwcku9T6iIH5zEqnuerTIv1TXrHR7Vwo/GwUrdO9H5Oi8ytxIrwG8S84u7/DUo8WlCG0M0SUNQVmgXsgTATL8t/+c2aXe5F5IE+vpseWMC7cqAvZR9os019586vualJj04959e/Ou8/1d7xZE1mFJTb09vKuZdSx0OkZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zoIS8ZJf2pXg9UbjKgHunoZl0Q7YY/oxLW0sObIhVw=;
 b=kdBd2p45Lqc6/cK+rAtMsX440C4d5ydUHbPyt0VEzkzLW1xqSIW3sh7fF8VD+xnZbROnxdrS0Db2YIsFw13bav0PeGO3t4Ueq+BDBMeJ7qhtNM8pljPNUfZ0xNqMgtivPcKpnn3qfIe7BdI2xmB4/KGOFZFk56UwfocUnq7Gv80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYAPR01MB3151.jpnprd01.prod.outlook.com (2603:1096:404:83::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Tue, 23 Aug
 2022 01:26:12 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::3ce3:3cd2:46cf:6052%2]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 01:26:12 +0000
Message-ID: <87y1vf92do.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/4] arm64: dts: renesas: Add V3H2 Condor-I board support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 23 Aug 2022 01:26:11 +0000
X-ClientProxiedBy: TYBP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::14) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0d623c2-1421-4fbb-8b74-08da84a676cb
X-MS-TrafficTypeDiagnostic: TYAPR01MB3151:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2J0AFLmVsw16u5xnc9pdkVT6BqvuXsj3X2s18iwBvLFhd0RdilrtBj8G84Kep64pJuNZ/LzdphG9wSTBi87OEqY+DcNbvQWl0QtDvzgkSqNNMiXFjJOawilFh2MmZy+P9ezeUQjrX8pRceV8XB3pnfjJ92J3HVL3zoKgFXJ9Acd7wSMMpPI6G1+Fkb2wdcOgz758kUaO6hjfyZnRZo/E8kuJKREyBRLnryMsBJrVBqPcGiBCBwNCWSUIdqgaepH+p53qqqxqx2Or3U5NH2igmziK/OzDEuKPBOz20amk2v935Kzp4RLb+yUJeR768Gsszxhok1+w+bcN2n279Q4OP77bsKXL9WZ37qzQwyr5yHuaF0Jo3UprMQOM+OvKOF6ViRcVAnrJWujnlbozwYB+7R1VjIeghbMNjTnA7yaWHOLxcblEaCWpK6/jeUvNdx+wBUqjwmUdB8TORfwbXDjRtK7rfnY7PXYktr2vC/JNZcb/qekEguM33UURxSeLCEPeXKwfNKq4u4Plu4Z2GKq5swMEqackioDhSnVXDv9WlGsUmvLIn7j0pvg1GoKBeTeiRA8iBna6V03UQTSltS58kb0M2MidDhp+bsayVJXdPKXYkDQGPNMR/jMmh/6jNrDo0EpQqOXFniIY74jYctRSwYqlz2duRftri4TvUEvg9p/I0DaZsiQ4yN3ZME99Xec74KKTAAUJNnlTfsny2K0XDZt4/riZ0q3N5RbLAghXlXnNtDrdultq/EzawYbNvbhQyLDFtysUu23/b+lnhio9iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(26005)(86362001)(38100700002)(38350700002)(107886003)(8936002)(6486002)(54906003)(66946007)(66556008)(8676002)(66476007)(316002)(186003)(36756003)(2616005)(4326008)(2906002)(83380400001)(52116002)(6506007)(5660300002)(41300700001)(478600001)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k9zGzWVsvZ4McN/MLTLQjulcFnwOSaSRLSC8pAcbP177gx6oNb28+iwu1691?=
 =?us-ascii?Q?mEe7/oep3MoEufmRdVRS2wdUUwCsuWz/qhiyEv8sgSqXH0FS/X/PAnkbmkvq?=
 =?us-ascii?Q?75/pREQP+SDxLB7R167lx6dQjjahqwb3zc3lX098CNPVMhgN9u/3U38Z0+G3?=
 =?us-ascii?Q?DiFj8kjqjpIP/Nwi0/cBfjxp+dJ6gn7x4XARH3vTjD1E/ADvoQ+br2MwYLhy?=
 =?us-ascii?Q?XdyDg6dm4kChdSRy5PLOYmEAfjETphtqam+6ePZl3bYDBUUzJK3VwAozehGd?=
 =?us-ascii?Q?DF31P3+3aRYsSSk+ynX/VffKhEJ65Coklgpl3/wRAaMjL8oJEiLFMJ8GKjwK?=
 =?us-ascii?Q?Vr904QWd+4YCHFn4M8SQRg0i0LN/aVJMx9x/m1uB+60NwpEV0dpIVufJG6sf?=
 =?us-ascii?Q?Zq26PyaSCLGp1iZHqdFWg5JRsakGRxprDtG2i5i5/dUcuEFpZst7zcSUSt0X?=
 =?us-ascii?Q?SkE7HDjeBP9YZ2s1a/b5pT7BGIlxUgvJubYbHP7lKzehbyQtrIQX0f0/jgnL?=
 =?us-ascii?Q?rLLQo/rtUomNafgVjB+a+3fzO387woDtNmNGopYZ0NaJr4fGH6RbZCWzprsm?=
 =?us-ascii?Q?UAyNVRjh8cMNSh+aCBQSbqgNzacBHZoIyA28HQlxh3lhCkX7RyJLqU8rfOnj?=
 =?us-ascii?Q?nsWlbyo8KdlVepdVTUVVYHJr9IfRUI/PI+qUIVsoY+1wApfp7fPfYbWF4IWB?=
 =?us-ascii?Q?gFQJ2C3WgQfN6lljFu0zIwHGEZfDudJbOVYBFiPqN5rBd81sp9hCQKsMIs9+?=
 =?us-ascii?Q?sPgfTaZ0HWEGO/GVRxHJZXIilTQ8H+8ZkTNdJPLQ/JJrPFa6xZZf07pBxS3W?=
 =?us-ascii?Q?HsqbanYo7QQS5bQ0ZLtBAMUC9jAy5caF33FGJARBX8fXtvqf65F3oAqYSzGw?=
 =?us-ascii?Q?FoIZFV1urjkpv/exLTWs7fVt44raD7ZowGIObE/Y1ljfjz9OaO4SVVaXcGAH?=
 =?us-ascii?Q?bBvTDczBg97o4QNdNGZxuD1mlP0i/j3DQYGGMoclxFUF1aahELOrmEOTQcBc?=
 =?us-ascii?Q?f+40XTsdek3lghEM6jAXQpAdGfiRmUM2UnnJ51eeEbEdksxrGyaRzOefvBb0?=
 =?us-ascii?Q?yQZNuB+52cdJFTIeKAezfewyQKUxxSunnR8OBaURbKbqf4o772wSME7dL8qv?=
 =?us-ascii?Q?lrm32LAMhno8lBKTg45HcWGPsJN7GoZ393OieDfuxffPXM4u+XZ8q7tNef1B?=
 =?us-ascii?Q?SjLu+s0xYk8uG0GCoBb6f6yxXkPmGAgK+QkQQbPd/FwNbGNbl/BxYsgPrt5S?=
 =?us-ascii?Q?m79a10EiNc5ywzpC/kmNQyTPWnhy8VZmrjWfM55N3eN3nZriGVv7/8wT0uiz?=
 =?us-ascii?Q?o4m/29LinA0bOJ2n7HcbJp4VI7Aa1Ceqd96SQP6r2HntO331f8FjlR+Lm6/8?=
 =?us-ascii?Q?9pf/pHWH+Q5kUyPfCGCvMGtmUie9OPU+Nr+FxFXmXubLIDrjKEmTyEqvKNwr?=
 =?us-ascii?Q?ExgUafoFTkseyAFrxjE7LESU8WMnDwkFvbQxzp5W7DcLH9LSlUKG2Ua73VjY?=
 =?us-ascii?Q?vKTBFuLZh3++JGrx+X/PlJrXyd0mpiSgPopIuKCObhQQWY9dUCN/4FR4U1zb?=
 =?us-ascii?Q?7Y14DBW8dhxmg56i8iI3ZtUXKADkrWlHbw0UzraobKf+UfVdIfTsD0pQlW2/?=
 =?us-ascii?Q?fdew4f1XCUK0opSjBvRy0HY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d623c2-1421-4fbb-8b74-08da84a676cb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 01:26:12.0553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMe6CyODNDK0/Hj8eFXog9jmmmUCWoFjAWltShrYSFUf/41sSqah/z4RlARyOJdx5I2Be5ah2kEQPP1KfKmBKFAba1DFQnAHeFQ6ArtWoznqfxf3ikByAVK+St9ZJPC0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3151
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This is v2 of V3H2 Condor-I board support.
It adds condor-common.dtsi for Condor / Condor-I.
It also adds new r8a77980a.dtsi file, it is no change from r8a77980.dtsi for now.

Kuninori Morimoto (4):
  arm64: dts: renesas: add condor-common.dtsi
  arm64: dts: renesas: add r8a77980a.dtsi
  arm64: dts: renesas: Add V3H2 Condor-I board support
  dt-bindings: arm: renesas: Document Renesas R-Car Gen3 V3H2 Condor-I board

 .../devicetree/bindings/arm/renesas.yaml      |   9 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../arm64/boot/dts/renesas/condor-common.dtsi | 542 ++++++++++++++++++
 .../boot/dts/renesas/r8a77980-condor.dts      | 534 +----------------
 .../boot/dts/renesas/r8a77980a-condor-i.dts   |  17 +
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi    |   7 +
 6 files changed, 577 insertions(+), 533 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/condor-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a.dtsi

-- 
2.25.1

