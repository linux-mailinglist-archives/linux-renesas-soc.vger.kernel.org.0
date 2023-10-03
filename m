Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733C17B5EF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 04:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjJCCMp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 22:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjJCCMp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 22:12:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7DBCE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 19:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flzHbbY3Nj5f8UuvYesp932VY/7mForYVrlyUSHau9S28XjgNFoE2t9XE4jxfagKYSprdKphK2W24rG6SEhI0JVrx94zfn1qcBXg+NcXx5F9oas2we7h+BLxaOchtthiDCslvIKFwCQsHPcMLuzmoZZHYYKLTZ2AZM+QuZWNuppAP0o6a3OTrUpb5owLFWfZz9p4p9ArLl7q9geIkiC11zGhJZ0Ee35FWPzKGbpkbqG2cOo8svvUKJnG0hSCnG1oSrHSB2Rd1VcL9BcU+UtInntj9MFqpdaJAm8rMARPg5XXPvsknhJ606ZSpAFQjeDqbWFxR49FnTt2TC3Xwji1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OmMNi7FtJbgfx6vjjgfUFF3tLrwT5OMmbX+NelSQ6M=;
 b=TMhewIBrJzJ+7j5RoN22CU4T6740QbFc96xdMLjUL/gfNUBhINO+lZk0udtaJgWTBKTBFWdYjNmPiAufgT32Q0UL4UjN9kaujYK5GKKOheG0I0/UZi0Padp/aZxdw54/ZgDZwNITvCTCE+fFGeojzeaOHZWyiogEOCFMwUuXChw8X5ImktIHJklJtsHbwzpXT74tauGcAxfjWm62TJeojcHdqFMlwS4oT3odF+FSVlmqotwuWE44dGintqmFYTNFM9E/8saZWVI0Yx5mxj/y/cC8JzSi6mTpxCcDbd34GTNtt1u+gH3R0mIrHMQSsg0xbjbUILHJq+bAM8zQCHiqFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OmMNi7FtJbgfx6vjjgfUFF3tLrwT5OMmbX+NelSQ6M=;
 b=PRk1uLqKv9hErxzPgalrtuSbUdhQqJPH8tL4r+yn3DYKdWIEUfpVgEWOl9DTF92OpKlodYr20lH9b6t5a+t5DFR2NdNELmtgfQ4Dkg7judvUNmQ+Kb2TxvtPGa2ozt/5HAyuWmMeLglp3U7wq0yfvdZz15D+1d8uLUJxpTwptZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8121.jpnprd01.prod.outlook.com (2603:1096:604:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 02:12:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 02:12:37 +0000
Date:   Tue, 03 Oct 2023 11:12:36 +0900
Message-ID: <87wmw4fo8b.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <maz@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
In-Reply-To: <TYBPR01MB534193210976F3274EC31622D8C5A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <TYBPR01MB534193210976F3274EC31622D8C5A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCPR01CA0021.jpnprd01.prod.outlook.com (2603:1096:405::33)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fa0bda-bc71-4f18-e960-08dbc3b636cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGINKCzVuOELdxdIZmUKhQ5bzuqo4l7KJntRNnq1U8qFo3n51N9/SJEP1dY3U6qLsaGbgYU3D7GyVyPCCQmjvckThtSNobwLrYN2O33c5Fcrj6xY3H2DD4/xvGGMsn6eu1F+GbECJszSPkSmXHqKhbMu7X/vTOFGIldfAnYd5PytUI1XsUr1rSgF3sdv9GKP80E+xNij0iLsUjPt01pW46PlDXeG0VdSdev/VauuMsoSaCaLK541an1hsvrTe6rPSh6tKCjEixXSSZOb+vtfInOs3nYrT9VWL5BNKdRAUPYIiWZfFUm9QDgGGf1NiAdhU8GMJqspdZabi9jNFp6nLSVmSH3Z82mvcTQ9B2v5Jc0XC44Cwui69YtuxwReS7xTvAWcRwJvQBsk3DgyZQg51eXg7+GNG2hojjr1mBz8CxB3LlaCTnwiaTGrKsG1oDgA8JTlE18qwzIFf1cAKQriFOjfih+hR8rk1lk76Z2NVJSg1adL2wZ5CWETSVcy4GK7OO8TxLlkvYKdThS3mZJbvuwPLXMLg0W30VBBCpEnMJk7RdE6oaLE0GNV00nSg4iQzObFuIu8moWRtvLP9Zd/+hTY7x5aq8cC3fOKJFNygTnbjihyt5ymN3U8nEkcxyqE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(52116002)(6486002)(478600001)(38350700002)(38100700002)(86362001)(4744005)(2906002)(41300700001)(2616005)(83380400001)(107886003)(6512007)(26005)(36756003)(66556008)(66476007)(54906003)(5660300002)(316002)(66946007)(110136005)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YcezGBcOHh7KFYo+9+igZ473v0EfGN6SF0G8mcJZphZry2ucxAkLw6kXORXq?=
 =?us-ascii?Q?IGyNqzT+uNsucshw301BfWqoh4I5aRFUP5bIUSl3Qd33X9EY/U9KJVWAHN6w?=
 =?us-ascii?Q?sa0gB7BiaQv2FkPxnszhPTw8ZC9a+zm71k7A/LIcSTRpajC5lsA8wWvWKc3r?=
 =?us-ascii?Q?SWU5KTeBN+6GrBrb5bwlYYiAFlAwPDBSROUeyX7v5HWxHIg0ZHDW/QvZ1gkX?=
 =?us-ascii?Q?0YUA9Y13hf6e9uxwVo+H/8DcVM8C/lZei8wkYrvc9Z8PKhiIA/mnQrECT+UH?=
 =?us-ascii?Q?gZrUodXbBrRxfwWEvMeHg/i5TCo/P6riJXsizw56ozrp9ZVWlZ5+DHr3In1Y?=
 =?us-ascii?Q?oYRqAxbxQqtyiL34eZ4ZOBzaIE4bI2gCHzIVYFDYiwce/7Ol2xayXBn52H20?=
 =?us-ascii?Q?1dW9Ka15xyvGna3AhS1iCfk3Tt9XHqjy++Dq9bPuzTtXYwVLlYaEmd/klR6d?=
 =?us-ascii?Q?W/ybbQV5mNRN8X1nEZR89aVoVGQcEOz08sLk7MZMRUAv1+1x6wjcr6VMseNR?=
 =?us-ascii?Q?b9/62S84vvP2WWUZyYRvNKqG0hqVYUeLWa7EQgiZbBonehq+ypp98gpZV7xQ?=
 =?us-ascii?Q?jIuHMKl2HNLywT9F8ipQXs4tTPIi6+uhSnnh4rUv3809p3uPGWg7lANRpoCY?=
 =?us-ascii?Q?o1776rjAh/KMvK8ldole3vPbPOIrH3tTZzT6S0k2hjDSQ4OMtTv34kn5oiB0?=
 =?us-ascii?Q?Q4Kzb5m2VQRMktLoZKM7KUBKhjOfr5Nlq9oIHvZVV9ldcgjciVm5F2ZrCose?=
 =?us-ascii?Q?eV3DuLM76tgX1KNQCTu2udr3wFbBmp26Y+rBxT0q4VZZ5hgtBPDdxkoeUb22?=
 =?us-ascii?Q?WS73wAM8c42kjjJyUdmpCDEkcLjnyedodduFBif2QDPEXNaqr7qqyiJ6lzKu?=
 =?us-ascii?Q?wWqdIMOP2nBHe8j/BnisSNtGXbFcUw2jYa1HBg00d3X7uKI9xTfv8V+aD3wZ?=
 =?us-ascii?Q?HkYoqHrINsNrjkafMp6ds6gu1ABwNYiMSySa/5RAfLQF4o0SbCb1MPX/8gyr?=
 =?us-ascii?Q?aAOVvRDVQgwdV4ne/EyR+E/QGUmZnqipdy8YY/UYxVMFr8ZcEKglCVFyvTzh?=
 =?us-ascii?Q?vjo7zqCfLWLwtII0rGp/+PDPhGCKBVJycQ5JOSI5zQmnfwmRKFLwsXpCzZ0F?=
 =?us-ascii?Q?4oJY29QtkAF64fo60vjNcZFtx5dqSdWNcrvvwxit+fWdEWrb8o+1+vJVn0Uc?=
 =?us-ascii?Q?dKn+EQ/yetutn7LWpHGthnBJHv2DNF0I0/13wDojBksfkWhQVhnaQE3haW4Z?=
 =?us-ascii?Q?tLS7QdMRc+zzK7G1Rr2gwYBvE8cAFZj5mTQpkHDScr0PRGdrtT5xY2hs80GW?=
 =?us-ascii?Q?M5nWd8T/bfveq17pL5Xz2BxWEyObdxTnX6KojxZ9BBEcJXJt2mkwL1nzqorA?=
 =?us-ascii?Q?0IMk2QyqKe/haVB+A+1CFNhYuGAhmZ//Tzaln3+WQT4PAchO37ok+hPvNo6h?=
 =?us-ascii?Q?rlbdh2xap/LsWEPLF9qGFekdnjaLAaXRbnrxlib6DaG6YhCeHwSkSOKsptc1?=
 =?us-ascii?Q?OAM9pas7a1OOA9vMHUN/YI9pC7WU2GsyyBgaNULb37msnbF/zNGj84lyTx2h?=
 =?us-ascii?Q?iODgA/d5WIsbFpP5bSRDuSw4TfVA6qBiFFkbC3pJBysIbmpE1DJkyVeHlUHM?=
 =?us-ascii?Q?IAUf7L9TD/bfhtL1fkme40g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fa0bda-bc71-4f18-e960-08dbc3b636cb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 02:12:37.7201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyhSyqd8Kc20POc1ziDLk7MY/t6cmnAtWSyMwrTWaPAE5WoqMUQ4jIcjmYfZspbv/Fdp+H2OKRwwYH+7KXosPc4LyvwJptgnh9j4MIirWZGdB+5DsMPNxt5FO5oX/nIv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8121
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Shimoda-san

> > Document support for the Interrupt Controller for External Devices
> > (INT-EX) in the Renesas R-Car S4 (R8A779F0) SoC.
> 
> nit:
> s/INT-EX/INTC-EX/

Thank you for the review.
I have copy-and-pasted the log message.
It seems original log hadwas nit :)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
