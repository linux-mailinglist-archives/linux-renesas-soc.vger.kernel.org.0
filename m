Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3934B6663
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Feb 2022 09:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbiBOIon (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Feb 2022 03:44:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbiBOIoi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Feb 2022 03:44:38 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43555111DFD
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Feb 2022 00:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9tmgpYpkvWuxZ/s+plmmC7hUUFltD/im2sPc7ovaHHBIMssJjf7obz4UeHX0Jjp7Vf4mmEQvOSMReN4q1fSLbFQg0JqywiCIh7sTW3JoDdHuTUkrCSBdLsP0B5X9phaNXU9h+TcZjwCT34qWCvrJzJl1Hy2n2nmmdsS2PdqhJCXHm0ex87M3M59di0kULVLG9GfnnWWNIm5JsYULArxe8kRA/9hU4QAZ+m5isRsg1VoZStvPqsteSegLX8mob9BgTwsOhugWWDT5zaTfOYY6X1g9Zcpr5OFWPhieMBi2I890HHcgKBy8xSlHyYuhhuoKD6cRu4HQxSuXe8u0ZVK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD2e95KqWtX4ss4+lLWhGuJvVkzHlWX3hUiNI9G5qk4=;
 b=f+tJTVgms+z2AVZhc4XqJlypHGklKj6Hyb2tlqGN92of3dvhP2ZaOmuFeOwCya8t78PewHLBP6STGe1j+65bESFWGgpEeWmkNeMh3k0HjmU2kdAfPy09r3PymwU8ZXn88nGEZSn4ROrDez2+jubLj3bjjT/1lO8TencOgCJscgOnG7t1Li6azUUjm50AlIygj9KpVpJ9NUHKQPseKPbccOnwHyoovt4DxPQAeQC7d7j6uIXYooG4TKwXRI3iS0GyBbhm6kCGM401YvH//x0qJjGCwCJS2AlbXc2ovHVNGkKS2PeuTk5nNpDGbkSRt++XVAJglkz80+ce63/14e/QoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD2e95KqWtX4ss4+lLWhGuJvVkzHlWX3hUiNI9G5qk4=;
 b=Ch04SudhILYJgNww2U/62B+74pIvq7SHiS1+hmvpbnzOZkk5DQoTdKnNOdM4N+Vw8Dta/bQsxcSy28T7UckCnLxE+5f/qYTtee148b6eLxkITCS/QMMfXWVDIHQ6MII0z3ATjVT9cnTpQ2moICrKGjrUWzJh/1S4+DSA+KPffc4=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB4061.jpnprd01.prod.outlook.com
 (2603:1096:404:c9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 08:44:26 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a%6]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:44:26 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Hoai Luu <hoai.luu.ub@renesas.com>
Subject: RE: [PATCH/RFC 02/15] dt-bindings: pinctrl: renesas,pfc: Document
 r8a779f0 support
Thread-Topic: [PATCH/RFC 02/15] dt-bindings: pinctrl: renesas,pfc: Document
 r8a779f0 support
Thread-Index: AQHYDT0+HKWDd35apEmni87w68M+k6yUddHw
Date:   Tue, 15 Feb 2022 08:44:26 +0000
Message-ID: <TYBPR01MB53413641C28C68B0729B1117D8349@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1642599415.git.geert+renesas@glider.be>
 <fa92c8c659874b707eeafe37f4486e7b040f2b65.1642599415.git.geert+renesas@glider.be>
In-Reply-To: <fa92c8c659874b707eeafe37f4486e7b040f2b65.1642599415.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0204a648-4da0-412a-f01d-08d9f05f5f85
x-ms-traffictypediagnostic: TYAPR01MB4061:EE_
x-microsoft-antispam-prvs: <TYAPR01MB406123244495FAA57D67A347D8349@TYAPR01MB4061.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: StV1a/Z3ubaj/uW1aU28l3pXMlQ7kmyfhRkGKQ32J3KyVunCwIK455C2esK+MvKO0O6UiWg7xu8VIqMkAyAzEcBWwXe2HJhPz2vrivtZH0GMGQgRfIwhYhAZFRIA3/phhbFXOetSGOOnELbIgxoVpw+u1bfHRc3F5Q+w4rBwg7kRWThG2lTyFZM+clEmXxoMCAxgDiAEVEmatv83pJNbRyKZelcorcXDivJ1gMyQMVBYWcmv+VnpwUYleTWmN0Bzm3psunikFBCGbKgUyhk5K8jt66fWjmHNtgc+avJ2GFGaj2K2zkyjcWIG9wsVy03DlAR5zRr50MP7GW2ldaEjhxP1Yn8ezItqzPbZMPJtX23ne40lXrr/nNjdg1ojAeAgVPAadrSnEOYLvkUQ1J7YaoqchTOkzLbUyr+63Kbv+fAFYlkTbzsmlyaSnUM2N7xensrEI69flE6pqKNQ3BldF6WJN3MInfRC287dR67mdxRk8kt9ite17dxRjHU6MUR8CHGCFc92e2UT2QPJT/za8AOTv6CLH2X4fSEacWJ00jTINqtlXD50U3yryDHMqBCA0zlhLJIEGvscX3v089k8EQsrwz31iqtBjFhb6cK1PFF9DTWKgBcqUP9NNV06Dq0KY4MHJRXU/tLWz6VqCWciRg01FVB5zKNoqrm00X6g+izsX922HWCHokmQk41C1XjDEZUyMh8J8JZFjG6M8GeJJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(4326008)(64756008)(66946007)(8676002)(76116006)(66556008)(8936002)(52536014)(316002)(71200400001)(55016003)(33656002)(66476007)(5660300002)(6506007)(9686003)(110136005)(508600001)(7696005)(2906002)(4744005)(186003)(107886003)(38070700005)(86362001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jHGN34earcIOhdComXY+6FuKo+z84gbfT9UuCNKTN/4xz+A85lD1HiZatCbC?=
 =?us-ascii?Q?ZjXjqK6UvPfhNcUaydiuJkfdTeWIM4Li2x5Q45BIGPL0IzcR8Hoaq5Rig+Gr?=
 =?us-ascii?Q?4WevNt17+Bp3DUTvl6ScbTHH7q0AIwL2VkNYnOfUpkk0hjXpLeJv2I/LOllH?=
 =?us-ascii?Q?2zG5Gs6mNxJR7bV5tmS/tVuplo8hYeU38CNibYEjCTkg+BebXJfJgoNXoiyn?=
 =?us-ascii?Q?+3NazgPg70z8VoO8xDj0e++uQMYXePtf0mj1ULE4TlpsXEX63eBjygYw02ev?=
 =?us-ascii?Q?YUJgIngM/XEt2zVavETMpNE8OBFxNWe6HtSLlu/7qDCubfhRM3q3PZmF4uIE?=
 =?us-ascii?Q?0O0aymM47VSFk1RzogN/WuE6XQ4zDJAPJ8DBe9YNp5svUGo9e/hktkoi/Pv+?=
 =?us-ascii?Q?9tLUITa3JVEM8Yc7nk1qTV0DheCrgfzRibwcatHazHw1Exv/Pb9GOhzXFcQq?=
 =?us-ascii?Q?32aNxmlgS9metRK+HN86fpVrz7oflZ+4hClcQ0fH6Wfh7PSCiPaOZKu6ijRm?=
 =?us-ascii?Q?vsvZG59V/4xcYNXGlLI65p7VjgldyR0d9BKYJg3l2hcGYiAdm77eIZpw/wu9?=
 =?us-ascii?Q?8pSizh2YDuKEslGmITmFnrcXzdGCFwceHUB2CqeVYlYWxHACa1W1Gug/qq36?=
 =?us-ascii?Q?RcRBExirkE16Pby2DJysYbadIL/BrIVMYAlQQtXSa/dubaS1oIIYaqQM4MWl?=
 =?us-ascii?Q?PSlq0U2wEQ043T+06ONCUBSuUuR2n870SIppgq2uP+uNETLrD/FLEcGrq7Ou?=
 =?us-ascii?Q?MeESHpCeTe9fpndUx1busu87+GimI8IoHRYMlBln2Ibaa63JdIYNmnNCCbSn?=
 =?us-ascii?Q?5yUf9GwhPyp6kO/P360tvULLjTGAWNTXQKm655vAsEroUKLMw6JCrtXosPLk?=
 =?us-ascii?Q?e5b7v6vfS35bEwGyrHiJSgso2BcT4nLZ47m/lIS0xB2r1KsmZx3kSAHNYv+o?=
 =?us-ascii?Q?kGvga83fGLXXY57gq3E4mxYqUrCknaF9dm5pwmnLHcMiIcU+rMMUdzmZb9+h?=
 =?us-ascii?Q?7jPQEEkb3fuSOjwQ/7L6JbTHXtakXXhBi5lJhKzfHaTCTHjXOWvqt5Jsrw+y?=
 =?us-ascii?Q?opw1AP92QnLqJhEBtJOaOZU68TPBtaKKzb5HS2WPoC4MM2OChdgvCKaTM6Oz?=
 =?us-ascii?Q?HKh82E3R/7ti7NLEdF2zMO8Dl+bzUHslO6AmOiRU7womLxWF8gFdFVUNQ8En?=
 =?us-ascii?Q?iwb6hWY+CIHER6MmZOsbTk+4YkGTZep6wBfrbjnte6voVNNImMREXQSi8DYX?=
 =?us-ascii?Q?H8MZMY62bAHb/apSRnQUxpQptfeFSyDRUSCVDXJA+ZRTXHZ5ICnlkGVeh1sc?=
 =?us-ascii?Q?j4r5DlPvhvMgFccOzTslzE4bNOR3+x0xLSv/vOM7XZMlnxmFpDzuoNqGgJPb?=
 =?us-ascii?Q?PKdwb2z3FCOqFMGhDpkMga3uZ2G74qc4j38XXqHrm+vqT6ENzR+Gs8vkp8nH?=
 =?us-ascii?Q?9/FP0jKP0yvS2jxiEkhcqJO6rGFttXukXExJdl6yls5wj1AJklsAQY8dVZ7E?=
 =?us-ascii?Q?zEs3b8omlxcuXjkdj/NxB5mDJxvlisAs/J9xTSIW5et0YyqGP5+9F26n8wB0?=
 =?us-ascii?Q?qP2NXoWozGPyab8ChfmmhN80tFAs8GGVHUCGiG6bS0baNlnyfp8QuDudA4LO?=
 =?us-ascii?Q?sbuQYYvqwNAr5elw+O0ABtpFeWMfRo60SVpf19dsrYNzMGQQ0UvmOPT4A1p7?=
 =?us-ascii?Q?VrRAt1i2PyZzKGZYqLS3UQCWS4tGulnQUx2KUzILdql4gT7gIaprTYYqQ3CH?=
 =?us-ascii?Q?VAdJbhfTAcart4l0iirByK37siPwak6ZxSpUf4U0dM4IEXyq7PbN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0204a648-4da0-412a-f01d-08d9f05f5f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:44:26.4339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiFwyfcSVzILUHMgjVAnVhQiWcaF0MCmd+374PEX5fD8EXitMy9bBW1rnIQrJxOQBGiv+XEgXeK7X/OS+aRRXdm3aeqqleUH/iYu9iwzZGZQqXUWHdiiN85u7CdRLb0d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4061
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, January 19, 2022 11:02 PM
>=20
> From: LUU HOAI <hoai.luu.ub@renesas.com>
>=20
> Document Pin Function Controller (PFC) support for the Renesas R-Car
> S4-8 (R8A779F0) SoC.
>=20
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

