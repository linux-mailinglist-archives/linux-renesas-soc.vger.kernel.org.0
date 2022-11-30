Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAAF63CC76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Nov 2022 01:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbiK3ARF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Nov 2022 19:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbiK3ARE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2022 19:17:04 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F5AFADD;
        Tue, 29 Nov 2022 16:17:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VS14Oz9uGk3GW/5F8LWSVRPnClyMMLtFu1VxKKnIbUn/Zu6NEpw501lOLNKwpe8cwVsnVYCiswu5effSHu+C3eI6WC5u7OZbyzHZXY2/motinufk0qHJDZ3MKSkxngJ1J5gySQHQxRdY7B3615w0mqjR4+XfheJPQYMgfl+obrJ2eN3xwx5hDaNgzM0EbtiIZD3IlfbAoY1jMTcfGwFkhVT9uAj2qno/RxSDHAhnAPmB6emH72ONTJDWy7usV1lTDAi3VrWA/9mBVYiI1PzZkwjVOEEaFSTm2hoIfflg5ewjRZe5aXgIqG/YB1tzapy+iVRZg5fyu0xMd8nGaMQAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3g2qyE0uOQdJsfE5YS7A4XZGILUpt9Mv1n7XyZGTJOs=;
 b=F2NhFmZtBtLvJYiU+/cfFe8zeeUk7jwPdewRWAZvfj1G+m+8Z8OH8OTc+x4FUAsQmn0nSN1OU0PBuik84y6hb6o3t086g6e3xpErwnC6nkRVjHjsdegYnjSh//357vhCcrZFv1dXR8FcfMD2Q6ZWLih/H6S6yk9xrSWoOqJlZw80DQsQv2LxAT1okX+DuQl1z6jLSFmRdEmmA9lm9xfn+tcpGrWrN7QpW65SR4Y6AhX2L64jJxq0wH9YFhKRQu1zKU1wgTXO4vD1LFwVU3a6WIOoR91nHAijZWnwa9X/VIsTDDSkmlxZLECZ3yiRWVulmZsTxkmRMJUyvAe/YfgVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g2qyE0uOQdJsfE5YS7A4XZGILUpt9Mv1n7XyZGTJOs=;
 b=p+6ANf/KW/sPmKtcJdPkF79aNFA9JXPOwAlRUJGcDeUAFKCMWHfg05WhfSPUzpWZ+dptAMkNojInUaLiErdkZvzYC2lx4i067hchLghDhwtXcEdaBMN6SyHLKpXdcbe3mt61inhrQtmk529UQueQpglvO2SuGNEqAC1pxjpZuI0=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB9338.jpnprd01.prod.outlook.com
 (2603:1096:400:199::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 00:17:00 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%8]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 00:17:00 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rcar-gen4: Restore PLL enum sort order
Thread-Topic: [PATCH] clk: renesas: rcar-gen4: Restore PLL enum sort order
Thread-Index: AQHZBBNYy31vMRHGBk+aMI55/hDo6a5WmchQ
Date:   Wed, 30 Nov 2022 00:17:00 +0000
Message-ID: <TYBPR01MB5341FC5641B210CACC1FA8BED8159@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <dbd61ed19f79e9ae751fbb533d6c946e810e4359.1669740824.git.geert+renesas@glider.be>
In-Reply-To: <dbd61ed19f79e9ae751fbb533d6c946e810e4359.1669740824.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB9338:EE_
x-ms-office365-filtering-correlation-id: 63f0377e-c947-43d4-d1a9-08dad2683345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QpvfGk1YsVPJYrlIz8fKWHLchcrdRbTZpaHm1geAFEPMgfM9iGZMDj7pRIpYE+yZbUlBXHBy4RP4PGXOiLWdlw59Mm93lIPpr24Hmomml5UDRJ/zwBftr0HPip3JlR6RXVzTyuGNwZkgBRyCJH3UgxCwH6cEEOJQbrt+9/BS/SxLSCFhNb2ZJrBLhAEkObdfbvNKi7zFYiaGc6acuuwnUfjH6VJ3t9WxkL+5ARyZUhT+zXboRWzyjhElssXlOHINDT2c+J6h5pM+o0/r0eCZP4OHnXkNuqULzMLGh08sAhvtGxHyivSudw08lHxApVBn2g3CLrzaHm7pZk4QPHT1BK/IbAIkREyVnxb97FVweE0TIp2/v1MjEkaMohULSWMmOSmw+VkolUs7gs93XGkqkIMAZ8rkL4//PVR15kiXBKoEWXfsOQa7tKPdovEN/Bcg/lqIH6tsQHv1Nzc2OdcohjsKlikMgnkx3zgKrSGT0fGtpK8v9VQMR059P99MGdK+R0OMPeTe575PtYgfx4QRxRtk8lIJZjyRC0EMQP3Lg71pZ2dV7qQCA22BIIKlRE60qXEzyUFiHW3I3CASObeoW5jkP1YUCMopwMHrYFk/z9mJz6WgeL+Dq1OomC/m5JjmoF8Mh382/QLuQ45q+Vb89ByRLsVV3a7QJ3Cc8cHliUk7vLd96ezuOoij2a7rCgtt1uzbNIt3hUXYJWc83uvrxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199015)(9686003)(83380400001)(71200400001)(7696005)(110136005)(6506007)(33656002)(54906003)(55016003)(38070700005)(86362001)(38100700002)(122000001)(8676002)(186003)(4744005)(52536014)(5660300002)(66476007)(478600001)(76116006)(41300700001)(66446008)(8936002)(66946007)(4326008)(2906002)(316002)(66556008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z2UrIUzyKFyzUIbrmS4p4qkjwvU5r7SqtORdxsRopBwDdsmTQm4BHhjiMTi0?=
 =?us-ascii?Q?WJpTRPerwcdCvardkocRBDS41k27Ej5WdOpDFu7P9w7515wgjZ189cxIxvb3?=
 =?us-ascii?Q?cCgM5uMdAFTxCthkxitrq7KvOfKm06KclLtcwal95g23GZE9XWGogwEmtnVE?=
 =?us-ascii?Q?ykpghHrHR3Hif5NZJdVktF2CqoWikEcoMyh/mjtoiN+jx1Udyb14D+CqOtHq?=
 =?us-ascii?Q?yvubkiSQ3Trz6CSIdV6LzbDROQBZFPsZDl0W8UOJ13z1QMvsthNXEn6RjfPO?=
 =?us-ascii?Q?6t3T4rPJcucSQWgOJRJzi1v1Lyw7ZlDD+Yfj+ffEgUsujpqGhUG6dd/TBrDg?=
 =?us-ascii?Q?Jkf+FrWBE2AP0+iJZAtfdR+zE5qBvKF79iOfOTJ5T+n/9a9v5FEJ4MCDnq8T?=
 =?us-ascii?Q?zsm6Z03NtgZBrK71//IJjFuaSXsm0rtbjhVGy+Mcod20wwKulgqdcyTQC8kB?=
 =?us-ascii?Q?POSRWWYUu14M2vNc1ialM7KJFqdWU9CLaggO0T6Xh/gEPCFT005DPAVFBmZc?=
 =?us-ascii?Q?3IX/6mXIL5AtaeZe1O6ddHlOqnrpInBr5oAadXnr87EkVdI2Hwc2K4/UIsK9?=
 =?us-ascii?Q?PKsrf7ky4xgim61LRIsxXtAC5AffABLKBKVSdFeRoJcEpHGM3+l3CN9Uzy/l?=
 =?us-ascii?Q?7qYnTcQiBZjGW6b80YdHs/Gv5b5/9OqQk1pAPWt1snGAb3XrXxlu2aIIm/ry?=
 =?us-ascii?Q?oME3oFdmgWPp/4SJoNBQM7xZhFGa+mCGRsTdbMqW8yciOMdlyo8sUJILdRcW?=
 =?us-ascii?Q?5WJcuiv/mI1kbrgdIqlMdokNaimgUph2VxlDdUmkwE539MOp7XWTt6ZQstmh?=
 =?us-ascii?Q?miU3OhUe6Eiv8hQEta0kEcWMBcBcblJ6OgGWu2UtbqZZ3wXJLMPdUCHM8LkJ?=
 =?us-ascii?Q?onbrGkn3rp/KxywEJkFVg7P9coq8etQzx3U5Xud0Jk4L0WbrPhugKjwqPjj5?=
 =?us-ascii?Q?XZxCvOOk+5t44tTAEInjpoqf/Cvof3jelo8LkODdNj2oGK5oYP/QRTuFhPIB?=
 =?us-ascii?Q?RuPbJToL27FAITfuPNJyaFIup/eyb7xWk8bvGkTBd14n2ACom1bImTxsHyn6?=
 =?us-ascii?Q?Qgs+a8/QTLKWTIyy3zq5vqshZEP3H6PnN71lvEjTK0Zp29zpMq6ZncuD+m6f?=
 =?us-ascii?Q?vdjUnQvJAiWULJBhPwrOOkfWx4LMsP6o3M/RYNBUJWtMZbElcHno7Jlujy/a?=
 =?us-ascii?Q?5j4Jq9HjhvDqpjjgxvS7uNq7p1ip6257g2+LkF0ApxwiljXP9VDh8blsfoJQ?=
 =?us-ascii?Q?CR3ADeeXvrAeZn3xQYZNhxqeyT9cOjoi4xh6aUm0vjiQdEcWeuBgb7puK2Ka?=
 =?us-ascii?Q?WNH+ymA1xKZ6IOafQhbgo5NtRDJ+muhLt/oxglPS5TrQb+pJ4td1SQ0WyQzV?=
 =?us-ascii?Q?/SZcllb9HaAY/00bs0O1gcfnjWPFxPzu0p/Psar3f2UyInn8RlmlYL8RD5pI?=
 =?us-ascii?Q?5YU4GNItcrw0xsKdgfM7jFVjyePVWmENWW2zmFkfTlYRUiGyDWbBkdKjSZBh?=
 =?us-ascii?Q?ZlCgFF5/cxV3fhW4QY+s6gkBGZW9CmfSxA8IO8TBZOsgAFi/8C7soaiDv4M+?=
 =?us-ascii?Q?ak7+lu2FYIfizkQzH0KLMON33voecUywYSa8av23dKYduC4fnlE/KR4LcEaV?=
 =?us-ascii?Q?dipREoAEDmXYQbgJOLH3I3liVZEh7qcG7wZqytXzDpdBfkhXIc54kwNTqEkz?=
 =?us-ascii?Q?E7acJA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f0377e-c947-43d4-d1a9-08dad2683345
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 00:17:00.4835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMnHh4bULVE/7uQtX7YcLDtF/g89PWy/9hMOL+qhGXQxTCCAyYQK/eVcIEAyckXtahvvoyWb8HbhRXxs+24tmvvda5A/1MZ8TvHMDZGIBit2EpAv3m2Zu0xf4tPoPcfc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9338
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, November 30, 2022 1:55 AM
>=20
> When CLK_TYPE_GEN4_PLL4 was added to the rcar_gen4_clk_types enum, it
> was inserted at a random location.  Restore sort order of the clock
> types referring to PLLs.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

