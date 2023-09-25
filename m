Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139287ACD52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 02:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjIYAxO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Sep 2023 20:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjIYAxO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Sep 2023 20:53:14 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DDF0C4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Sep 2023 17:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXvdDZGT3kzuOk8cB4+rAdG/g42IN4rVFnDykBc9Y3cXRTQbMTNxnQN2vJWhz3yo6EHeJDOCSoiLgetwktwOFPZGqE293Re2fvcfDQMkyrAFlu870pLOCOsxOWd9EphtNq9vHes1m3xlPaIaEfnu5PbRwyRmD1dbWKvAgTlIe6CYOAvYRJXc08ML+4646tkRJwGcyJrEMC2X1f4zWDIJjoSBdQS0+tmzVXxowGcKxE9GQ5u7p0keq7DWK23zcGsOfiqbypaJQfIq0GBMWLfzEBYOheYxmIOqOQMbL6976irv3xA1bqlMGIiziW6ejXKi/3atufWWhndU0cgqg4nCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZFi0HSXRygxFCWjw1qoJ2uAEG0NpJsIZ324ekLo/Bo=;
 b=JNvWikDglcqSNZe9KELF+nIGRnFpJOLyWIYG45BdhbmPEjdW6b4dp21mTbXBOdOJj+Pve9b9rwC6iO4Pzozmj6GuSQWU3f1NIiGX8YjuQFajL/8Y9/fCNPFpVpDFUJ/4UEOLxoup9tTQVwW7mKnVUo3HEIuE4vmWIZhrGaOMDr+cQMHdF/kqYedwyh3r/9TCd1B/Wrbttrip0cOdnTylds2KgOVsK2KXpsCSLYsPMz8XGpp/cfOwns/IXujwrIjC6DHXEhVmDKJVnK03RqZUEOSe4JYTPKUgHZA0DRS2b/x+75cdLyAkxjn2tXI/pXOex5bcNBbD5uSVDAj1HW1hKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZFi0HSXRygxFCWjw1qoJ2uAEG0NpJsIZ324ekLo/Bo=;
 b=bVv3NN18g/wPZ1OXpZc6mb8mduIIjnABaTwTRDod4nHuhMmUqdo7yI028n617OZdLkCEOtFGdF3gwXFsLC6lePNAJscbcpvP1PrI0OCShzkA0D0ZnKzT18qheT1R2pcmLwULMDxd5UtMyoy5QMhcjFsJy9DngFt7l3yN/LZTYao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11856.jpnprd01.prod.outlook.com (2603:1096:604:234::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 00:53:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 00:53:01 +0000
Message-ID: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: Add Renesas R8A779F0 S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 25 Sep 2023 00:53:00 +0000
X-ClientProxiedBy: TYXPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:403:a::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11856:EE_
X-MS-Office365-Filtering-Correlation-Id: dc09fac0-7501-4b87-e978-08dbbd61c47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcF90ZR5+W30iQ7Riu3sDyfPqtM/iuifJCWmkbYHNpEqgUuagZWjklz0usCIN67ZGAPuBIS2TuJg9pCxNFzbn9P2TOFqrAB7O8dhBpr73BAp34ZgDoxLYd4MIHXawOVTE7aq728nEOu97Hh41kFe7Eipf/zmPfJ1rdExJy7eCFnbnO1IJFxpfHB+mntRVNjwCDMk7lLK/jtLqm+NtwtE9V4vSMl9YQmBq82OzQzpjAkvDA0PbfFKMUMi8ZJh0U13Q3cEu0liTfqJKwUx6jmfMEGlwgoTKNXPQ27wmKLknX8tI7afdIExQCkkVYmgwzOVeysBUIkSftJcEf7AOWAVZGDIKSI1cxyrlmyo4Scy81POlddnVtpgol94zkhJGQo3RovGFQU2V1Tu44oSCsTL9jnb+hmPTVoRvp5MnGCPNY70bi8OxOIxQ8xmGWUVEvqWfXSTq3Gc7ZLKgDmgd004O8CVGNTt11uJA2XGfbazDWC3l23dPooH/8I1Hp4ijP+Of9RdDjOWmSpZ03OwF+TWdLB97iH8Jx9SfIS1UQeiqHibW8ZcImfTxzb9woBrxd2hYdaaioz684tEa0+wRlB8iLRaXOKtRMVBKfhiOgD0icU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(39860400002)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(107886003)(26005)(8936002)(8676002)(4326008)(478600001)(66476007)(41300700001)(54906003)(66946007)(66556008)(966005)(316002)(5660300002)(6512007)(52116002)(2616005)(2906002)(4744005)(6486002)(6506007)(36756003)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OKkU+kUDbJ3alOQVDwjlL6caAesW2odQcMYn2/Ydx08CyDVndoOuvmEb1YSG?=
 =?us-ascii?Q?ybyBdnMdVYY2huFM/y/zEw5hmTeSfgFpwcAGSmrjO3fomWhem0A/AmGpJk6W?=
 =?us-ascii?Q?+KshpJZs3yh9TW8+ynkLBhPkPDnwiWcYEPEQVKx6ryn8YnGsLzcIr5x6pO7j?=
 =?us-ascii?Q?LLE8klGEKHSIXuyKEqIlO6r8T1XwjAocsoO6TLemaAj80UjDUfG8vE3zIRR0?=
 =?us-ascii?Q?dk4gLBSVriATprhAQ3K1NzDGc3ZJ/J85l5FZGKhb9TDGoZKBNsKjS0ktIHa8?=
 =?us-ascii?Q?kcM8diJo2qS9Qg96QtpH0sZqseMI1j0rhlsmKXTp887753SNPE6KgJdD5Ubz?=
 =?us-ascii?Q?p3ehZIIWA3n4xIcXMytyeVoEE2x9RVjT/SEqSSFLRwNypW6NyEclsdRfEkj6?=
 =?us-ascii?Q?VAWkBxUYYJvrIAtTV7SlFNbDUBennNkZNkV6JIjzyEneIjNJGVewTEqMw7uY?=
 =?us-ascii?Q?ft496qmogPyGhFLd7zBxCEzbQRmtYEhg94BduwZbcNKJMFNHdxkREFSM53iM?=
 =?us-ascii?Q?BZ+q95cTMrS3HgrhO2tAHtIPL6yE69bYUHkgXl1zRpWQFGOjpy1c8AA9H3CL?=
 =?us-ascii?Q?dLb27kKGvTqk2dOmfsH6QqoBwMqWyndFzkBcwNXzz8U88TBuWPkSMdsXHulo?=
 =?us-ascii?Q?RIaywJKZmQ3wEsHLAe67J6SKhKfw7qDyY83MCxeobHDqVpBPonFRMekiBQ9p?=
 =?us-ascii?Q?7jEBEZXr2F2xpbQkC8aOld+A/KU3BKVk79snKep0yF245VHreIXSUkHZZNJk?=
 =?us-ascii?Q?l6xHbCVZW9vwI1Fe/XyHp9h9cYDUCB31UdLVqK7B1BQ+pkpbsKXVAw+yV1Nq?=
 =?us-ascii?Q?b7CPdWB4pUMVvoWS1Qb1dm2HbNXKUo2VmP+4QE0Ydto/YUuiLlFmssu/gnBw?=
 =?us-ascii?Q?KrwxS6G6S02arSitn0JXc0M1dAONMPQqw4VTD0xNAey+p0rvP8Ciez04JJMH?=
 =?us-ascii?Q?rELpOGEaGX8aVeOfb2ntOGEZ/XKOVDbhehCjMKKw4DGFi5NclgjW85boAiX+?=
 =?us-ascii?Q?lG/oJ56pkNaPLiQSL6ha6tVSZ1y4J9CFvqf9QiQASBJY+Yf0yYGcd++zMJrP?=
 =?us-ascii?Q?CfGujOnoUqWEqu4Vw2SV/PPNeklrvabOZaD9bT3OubvC7flZVcJVgLC900Bz?=
 =?us-ascii?Q?ECgadO8t3hufsUqVF5HQ+Xku1RT0X6H3ncbBfr6D7wTKgPSZHNogMf0+p3tf?=
 =?us-ascii?Q?r2W3rrLXv2ytqcCKKWEsFt4c3OFFDQFfka3nWgB02nsQKKBcGoNTNhh3W8TD?=
 =?us-ascii?Q?U5BeXIFY4BNyCYXob7Wj3K5CcwddWNzTuTLv6CAhEXa/x5Md1EfTURM4whKV?=
 =?us-ascii?Q?714oxcnGeQztJ72/AYL+2Qm1iwo/A88CHOBAKPNqsyFfvv1glaySsE9HNO20?=
 =?us-ascii?Q?2KC/T/7EyYyptBaV9MZPMqs0pvXTCMrsOKgMEi0DjixPruADY/qV71YEoWgC?=
 =?us-ascii?Q?AWEXZ/n9T4ASu5ZT7b3nJrIB4fujnjVg+oWWinh5N+d+9DaNMFa1dHdiN0P0?=
 =?us-ascii?Q?1sJ8U8jqro0nk1HIaun5pvNzHq9EBiVO8Orm9rkKJp/Efo4OY6RIDJcqxS9z?=
 =?us-ascii?Q?jPo59KA4j5rNof1f5AodQ179ju+VH6Ex1yN+TgLfQ/sCHVjR16pdjVq8p8iV?=
 =?us-ascii?Q?cfWvA++kOZHPM9PBLrrIVxI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc09fac0-7501-4b87-e978-08dbbd61c47a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 00:53:01.0317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IoB9PhMHeI9BzbSNVGVLOg/RYMedYhyi5x8nS5PtuIW6e+bruFAUH4TiD/1DaRL9VoAAbaRCkbo2RfIfOAbs3kJEG028X5YhYwHOf49xj8cKXxuz2MouT4Zo0AlWgzg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11856
X-Spam-Status: No, score=-2.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This patches adds Renesas R8A779F0 S4 Starter Kit support.
It needs Rswitch bug fix patch [1] which is posted to Ether ML today.
I hope it will be accepted for v6.6 Kernel.
renesas_defconfig needs missing PHY to enable Rswitch [PATCH 2/2].

[1] Link: https://lore.kernel.org/r/20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com

S4 Starter Kit is possible to setup details via config exe,
but the DT will be more complex. This DT is assuming "default" settings
to avoid confusion.

Kuninori Morimoto (2):
  arm64: dts: renesas: Add Renesas R8A779F0 S4 Starter Kit support
  arm64: renesas: defconfig: add MARVELL 10G PHY

 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts | 257 ++++++++++++++++++
 arch/arm64/configs/renesas_defconfig          |   1 +
 3 files changed, 259 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-s4sk.dts

-- 
2.25.1

