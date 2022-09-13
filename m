Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A9F5B655F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 04:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiIMCHD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 22:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiIMCG7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 22:06:59 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79843520B2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 19:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU0xh4mtRFgjS9uw5+OuUZrP0CnYRaFWCn+6NLFPbtREHZbpjygpSM+hQmbJR3Oyox7tvz6ipTffiE1Tx2cQfyszRWhYevXIBEnvuSGqxwtAYx+80ZHTgxAKpvSvBG9r/C0+RldhPNngUeQcpFlWQzQ94Zl1MJygzWVkycGWl2DaR5dIpJlkad1CDL4H64kdg4sz3dJjI/2u6hk0IOyaOSCbqAUyFqpF7WH3ijUYgH5ckE4sRo7jEqqZ1Qh8+h38qSQMR4x+Hi6GiK5W9iOPO/ZRtgEJ7BlH1rb4Lfe0/0QqqZksGJ6RQq3TU2ru0y95Iqlob1MfwZiS+ALUCN2R/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXmuvkZQzeC5NkJcwSXZSqC6SIdbPPR4BaF8GPlGGcI=;
 b=ZUWnMELPwR7wgYgiMdFBDDLCRwR/opeKPLb9VlfVkk5VLxOQwOzwDV6XxX9+Kdy8+DyJF/bUTifFI7UjPxwQxCrxicZ3q41jx2NxorM7s903IYXc85Y3nk+Wc3dIGOy0D3s45XaF7A50FvZbOszeYo5/GgLRTj6/71R9bOoh5IFpulhQJzxYk/S5NgGgbphY/OIGbJPuutYSSoSE1FUKtM57SK2yeHJeS6vEF6DPQ/eJbwoFi/UkmAHg8juu2Vj4a9YqSzfjRNwCpX32tYbIlJJREKOtmwV6EfsA7ZINDXAvPQEgsmQZEywKTzmkemnqZMufa8asEcJJ+UhCNVvfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXmuvkZQzeC5NkJcwSXZSqC6SIdbPPR4BaF8GPlGGcI=;
 b=HacLx+W/v9/psKtHNNSU5/+IQDpDAvafFpGrs7unCZ3AdfreqDYGFxt4HvJvROO48RWwPgXYAOYIniFtwjMVpRxu/NfkyQ5qGrejKV8Q7OWgqSB6rZ4OphCyBVnTNqUwYvsabdyUnQSThUqCYwSEY2cs2879TdJpvpelRH0iUjw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8311.jpnprd01.prod.outlook.com (2603:1096:400:15b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 02:06:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 02:06:55 +0000
Message-ID: <87leqo58ox.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RESEND] arm64: dts: renesas: spider: add missing bootargs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 13 Sep 2022 02:06:55 +0000
X-ClientProxiedBy: TY2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:404:a6::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: a79b102d-60a5-4e79-d4b0-08da952ca1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +W5jVZfa/0AYWAHeQ6xDXBOFIzCq7OViNgEVhIpHaXvlxwHYuChxLbckfBZ9sJvPYa0UL8xU8zZli120NEEXJf1T27dR8YDl+qtrhzDI0lB66v05Rhj7u2ZYtna99CoW1cVanxEbbeFiCr5O7p+OiK5rc1JnetYDkGtbOHkieOrMWxixthIdIXjQHSfHaUs8FRsl9aNXTzU/6oaSDOB+e4OogwUXlxMv5zWnaIrMLeX2+1ZWGHh7e5SGGZ8W1+cjG/sK6z6HL02F1IOLqYm8dpUIHSIvSQaJJQlHYtcgLO100HtOGEu7ipokWD33yzovpSNU8gUPVv4YnHe0LBJRm5h7K9QOnFk8MwWtPQfRUJ0pJAmhIWsIB+ZEai+dvxASsRSu6KoJB8N7UiroTNvrqGdu2KXMqmlUacY0gMWtbaPWAYiiXXbq8f3Iu9grPNf5SQbWEssS0TCeR897tub+/iEZSVCwTTlvy6pjn36079ZSJb+jmMMIay2fTMPCcq5d6iUZOwXRAYQHD7U9jgQCAC07OoO8RbwN8sa/BNvs0rpwyerfjPzgRw+BCMniu5Ksj8pBnrUFQXOkLJ/pH6zP/iD2Bx9tG3ie0FyeAS/m6uixgFxyfFAWvuiOPQEZoRHlzoa5Yu64CHqdYdrU/wj3Cb5uAGtyxypZRaSpaz+Cf5gaSrvoxkhM+uQ7x91/zBoeRyDhfyAT8zRHgEV6+w/X5c+cO+wqoRr/gL26Wsw7f4RixnvzdWqpBjoFMm4HDx74Z9A0UOSUq1J9ua1dPzrJGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(38350700002)(478600001)(6506007)(316002)(2906002)(6486002)(5660300002)(41300700001)(8676002)(2616005)(52116002)(6512007)(66556008)(38100700002)(4744005)(26005)(66476007)(186003)(8936002)(66946007)(6916009)(54906003)(36756003)(86362001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6k9F9pZ6jTu/snWdqRd9ADMtAl0zucg/cDiYUxuYuEwux2reXJPlimySvkPy?=
 =?us-ascii?Q?VTooh0+5Zh5DpZs0MaBec39Pks1QdnrwztJmSRlMmehSE04U3Lf3SS8odSim?=
 =?us-ascii?Q?WmnI9vL5sP30n5m9vAKd06F4wr0rCrZ4TPyAnHRgfz0uv5gAXMQTYyYqV+MY?=
 =?us-ascii?Q?vpthHgjeZlX9FmpQ5pCKffyO/FXSLMB0hlWDcP5JuGNPPOVQOfu1GS8qmGBc?=
 =?us-ascii?Q?09dFh8kE1As/hMsAB67bolgZDGIqqEexC42XO75bFyMnugpsLC/cz+AjHQN7?=
 =?us-ascii?Q?UckRWKf0cPfUr/uBYyfvEiCHx7DLnRVJaDHbIvPa8jnWZ2KIovBUDwHi6bjN?=
 =?us-ascii?Q?D2mHW+lYDN2nqBRiXspnuhhE4UwP2gEcUe+36d+F4H69+Ex4y6mb7+foKz7i?=
 =?us-ascii?Q?03L6kUbPN4J5Vp/mHYKjBquqH0o3ALXA9XlxO8OFAK68OlpJOYrGzt6Ha4wp?=
 =?us-ascii?Q?fsUpCkho42wNNQY3IsG4p/JttQ5MqB1g2Z5uKAb89/mmRMt3pZvod4EYdQa5?=
 =?us-ascii?Q?4WhUJXRbk7VRQHu+9iecLgGDI1/aJJzJpJU12dZm8f1QBOSAt+Vo/e0RF302?=
 =?us-ascii?Q?2T5HgZddjnwngDYq6MuF4blf3/p3rAiI+TLqiJD+F81WvjQJ10kKoAKOeDo4?=
 =?us-ascii?Q?yJMCxIDdMLJJdYtKM8VRR11ZdWGvjNZdMRxmJOamrhDMvNSr7EQWx75uSMFv?=
 =?us-ascii?Q?h8WepuhFa8pnsrZ/cba92p6liZnYteCpmmXl/+8kyxoqtQSWLIRpFBZCWMMg?=
 =?us-ascii?Q?4/qExvZZ/xX2xdrYlvJEQLnTsKhSZG5EQfKmzsnYD3mwt+eU3/U0jXcWnyhL?=
 =?us-ascii?Q?0Q4WrnzBobq9atSgx2tlr13PFIUZ7ThRaHwLsDzdcWOKLZVqQWn1+WULflQY?=
 =?us-ascii?Q?+HsWpY2nt1q0X60xuqD4g2+4j7LoxohkuNkRhk3g1cBz7NCvbuuw5ympyx6j?=
 =?us-ascii?Q?5KFjGO2ZApzz4cbDnIQun5xzdCkplzcx6ljrZ+cFkavs5V3SOanRkZ+iZGSo?=
 =?us-ascii?Q?And3VHrYPxc2Y9a/D30+eJOqSAqtKp6lXPL3+inILH7LrkX551iHBkGD8Xr/?=
 =?us-ascii?Q?juAHj6SIy6lBTz+//V4w5KXSsy2pjclQXWyOnGwXFXIltmswVKVy9ngoFo01?=
 =?us-ascii?Q?hGXVcxdqurG+g5QBdbU8eWlodDA2+acCFasVyo5X6/eSs0ESdMl7zVLD1IHJ?=
 =?us-ascii?Q?CS+scoDks5OMYS8P/qYrKpFIuGrLej+jD1vkxi0lvXOygAG3/WDtLgJHgB2h?=
 =?us-ascii?Q?aTLUiPs4m7d+d7nrYEdFGqO61xAmbfmwe50zKXTqz9KjvmPn0E9QxRUhTMAr?=
 =?us-ascii?Q?vbcPm4tCQAoJzWOIURsI5qR7JH6nn2Q04R5L9nf+ocbiTQWoO6V9rJPAA86x?=
 =?us-ascii?Q?1DiI3LQtt1VNsfdDqPy59i1eh02LQ2moRdxAyMCeARRcqjK3QQD/8TQ2A8fN?=
 =?us-ascii?Q?FI6F66R7Y9Eu9Afl+xsI/mq3Xprbwxdv/FofUUbjWWmCeZ35CiQGtM+mfuHv?=
 =?us-ascii?Q?opLKtaANkW4IKu6NBuHp3U9YaV8xBREf7nr23h0im/kmgvisigHkHTS1P1GX?=
 =?us-ascii?Q?sKtPCFMz3djx162P1RmRDhiV+VzEtT3foGlEyxtKtlWJ7vrNRnBoU6/BqlNl?=
 =?us-ascii?Q?JiUfTBYiFJhuCYOt9zYPE0A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79b102d-60a5-4e79-d4b0-08da952ca1e0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 02:06:55.4562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7EJdAuRWUQuBVEChhff9ZUvX5euEEfSyyUbVhZ66Mx8qZna7VxrohH7kGCeE4p+ajUt90D1GdAM2CLXIPxpIysiVsJxu2af/NRW0PUhayO/povwvws+HvTKynvyKICW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8311
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing bootargs for S4 Spider board.

One note is that current Spider board doesn't have Ethernet
support yet, but this patch adds standard settings for it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
index 7a7c8ffba711..70c081e745bf 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
@@ -19,6 +19,7 @@ aliases {
 	};
 
 	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 };
-- 
2.25.1

