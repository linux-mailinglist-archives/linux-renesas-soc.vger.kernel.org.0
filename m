Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2046A7ACD59
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 02:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjIYA6q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Sep 2023 20:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjIYA6q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Sep 2023 20:58:46 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAE5C4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Sep 2023 17:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cmrb87yS0RiOtYgn6VEQ7MqOwm6F2u/eV+4da6cTlR8TU2VcWfnotwaGB1M81k6beXPWW6ibN6bQGWA5w5GjyJPbOGq1+hAg5bPJJprERHqXSOGxr7cKs7GmT2N40UQUjHqKm9X4xxicwcwNPINw3L5vxl6dsh7RI0N4WsxkiEzN2P3Gn68YklPm1kHOS0qmz6tOR9s9sc9B5rJFqyvd8aJoBYRakPNAt3sZwDme+1MAhFxzeYPYd3ORmVP80U3HxBWXPPcCn8FZQ3UfoOrf6GRIpijn8So/ScwjS2/AXqmPKc8N3Co2TMG+ibrqi1i6nFXRkibu1DPAG9S8M9L8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3v1a2dfdFAQfkq7J5Yn8Ds8quZjhy/u47Gh7oKuuRA=;
 b=Co45RPChVHihT1sr75rPaQ4Uakm5NADXVkvDThdghf5ATvznQsZrV0l9/1yZPHOITFTQdUw8BwMH+llrhc4sGtpXJrQo0/bIBi4iwiTBL9MlBD9HIf7uCWROQeYvXId1hMjmHYYqsHr/fXlv8OYz6VBSs8DeHw1UmoItRuA92hV3cvitORNHExkeIZ5NBfXVScCEA4rSah/u1kToU1qc8Iz7J8HHlHZnKDBPwny2n2tKcGtXxJRFP/4699gWL/kDnsQtx5o2Z1SkCSUMjFU2yaBw99fuPIEju0/4Vc7mSKg9hF0Ezh4WyTlXymQsPne+tDWLCApfLx+7CX03CpUbVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3v1a2dfdFAQfkq7J5Yn8Ds8quZjhy/u47Gh7oKuuRA=;
 b=AzaETC3OSrNi3vrY+8gH0GxQAVjpyLHDsDPid8vs8+Cq+eTisr9hHzNKwi39j8Jd5+pEtFnlMGCO1eCJ5xYXVq/HWgMqk5Qrh40F0eYDhLgHzxrtKfFbj21NHp4YYbtHoCdn/BgDRm22CA8CaUDbHCy5MWiYoDrpngj/0NGECIQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB9983.jpnprd01.prod.outlook.com
 (2603:1096:400:1dc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Mon, 25 Sep
 2023 00:58:36 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 00:58:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: RE: [PATCH 2/2] arm64: renesas: defconfig: add MARVELL 10G PHY
Thread-Topic: [PATCH 2/2] arm64: renesas: defconfig: add MARVELL 10G PHY
Thread-Index: AQHZ70qyimD4a0MGTECdXVFwgChTUbAqt5ig
Date:   Mon, 25 Sep 2023 00:58:36 +0000
Message-ID: <TYBPR01MB5341C90FBD1B8A6247DD9816D8FCA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
 <877cof8454.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877cof8454.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB9983:EE_
x-ms-office365-filtering-correlation-id: 69b476f2-9217-4b2c-9837-08dbbd628c80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUvIrFIVBeVYbxuHS4Ae27WdQvDLbG4BQ9lyWqAYIvLvCEyWr8YsckaN6mtK+JluViulTdzDvfRV8H6vkByAPBAOiR1wxaxbsIYNGWQA0L8S8FAcU6tPUmf892AmDWkJx0c02m2FfNe1o/h3g2U9AKCkydC38I/YV6wchO2317o2+5V80JovRiUsvPi8+mYXtqmQXpAux0Nrk+oUPtT2SzXUMQlW6PjaGUNuiPHTf9DULjRU4xGchqlGSayHyS4IR09mbbBD3VejOvOXoDvaaxf/kj4rHjEBHlS7HSdDpJ0OPnGKmhceQmm4y9CnH+nO6YPi1tlg8XQMgSRbDS10yE2P82tCJidyedrkCdiICbVHpXyD8EWW3xB0Jo4H5vSrj3DGBAsPGW0iMLsLSQSS4INC/t0zImXyqyDch0k/uw4uA6/5TOzXH2BFXx151fLIWWgUEILv1hhsFkg+6Z9Ls1zh7Rfyxb31PzAxlk5GhHO4wCuGBoGaV+BLLxiERggeIScSdI8pT8n8CuIMCCOkq32LD4FgnFGs+j4ohdglJ8EPicZLtEWtESDCC4aDDdBx158AInjriOsdkk+dN2qC0mFegteG2wNxidNi1rRugPvynXSCtDzDUiFp66NbgQ9y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(38070700005)(33656002)(38100700002)(86362001)(55016003)(4744005)(2906002)(5660300002)(66476007)(478600001)(52536014)(41300700001)(316002)(66556008)(76116006)(54906003)(64756008)(66446008)(110136005)(66946007)(122000001)(7696005)(6506007)(71200400001)(9686003)(107886003)(4326008)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V/XNRT/6K/xqSYtQJdZC/Cxy/NpJcUG8hMa7ofkybtcC7gvbkCdjVWFNOQj7?=
 =?us-ascii?Q?i8vSY/N5QWLPTBmRqxLcDiiSjZdUUUqN6g8XI85217NpjtE8FEajf1tY8mjj?=
 =?us-ascii?Q?AgwtpUl4pjMLRvzKDdQdOBU6WLa1nZdfv1rEaCcxahzKzsMDF/JQwJJljhRg?=
 =?us-ascii?Q?XhoKZeRJ0+ieg2vn1Ct2T5cCOyW6YFuZkLse2LlKVjOs3fAU815YOZAsLSns?=
 =?us-ascii?Q?Rd4WduUpduebM1iWf+BZs38SK98uyDSFciXIVyoQTviYvh2czgp4tIgkEiow?=
 =?us-ascii?Q?2B+ALTxmuYQ1FDXoQfG56zVMGXpQuvBsjoneyDEGn5ZVc6/vxXaJ90vm4HLn?=
 =?us-ascii?Q?6SxjWaHRDQgNYP2ZDeGtuumLJ1ZKgOlLlEF0Se6DUTA6yVTzO9vga4KF4UKn?=
 =?us-ascii?Q?PTz5lFQEnxAZCEMwBSLYyQkgETOgeOD8ZDYaRW1wM+k/68qem7zDEfJR/8Uf?=
 =?us-ascii?Q?L74pZYKgRa4LoDrUyZ+TuWhSnz1u2Xf7h4Q8VBugpZ8Pf94MS7gcWssh0Py6?=
 =?us-ascii?Q?dyyT0/hOlH+XjEZKvJ17615vpu+6Xde902srByVAGI8hRCY8wF6LyRd4dtp9?=
 =?us-ascii?Q?Fx7TuY4FBGrWiB1mRlTnBnLHXbaM7BfBkflHckpxQSP0KAr1cjNpSPAiVwrA?=
 =?us-ascii?Q?T36ZK1lPQj2p5E/X28UNXtHw8jLob2havrWhBs2wQVOaH1dHP6RrfRmYdwzm?=
 =?us-ascii?Q?M9qR2PG8QPhiQev34wbzUsob4QT3FbjzLQGlZHF7CG17+GFm6souUbsslvi0?=
 =?us-ascii?Q?1yDyKRcAIRvjC+j1NdVtmD9H7aAzBRkfSMgUNRMrZeVzASxCUlTc1L+K5NJe?=
 =?us-ascii?Q?ukunI4R7uX10mVJsikk0wVW4LHdrtDQ6vGI9Nhho79Ma0cUpnSRPV/gPnJId?=
 =?us-ascii?Q?0avY+zHDdYX0q5Ilak8k9fyFW8oJdnUVB5fS4J8m77o0nBxiFDKN6pU6W2OD?=
 =?us-ascii?Q?CN53QKtv0AkGaI5Z2YUDHgZw0qaiK7QNrdJ1aSwokOoVeMyyLP02Sx/I0U7/?=
 =?us-ascii?Q?EM5F1pMHZdM2KdF43RV/1wLGncO4GB0veRrvUdVxTK5qfb7b2QT3qAjPCdGr?=
 =?us-ascii?Q?jNnpJiGRao+CuAkBVIujxmzlQ7QBcCpI777sawt+NxJvKXu98yrlJ2Le6DWN?=
 =?us-ascii?Q?Px1y3GDO4Fk4JjzFa+3bUeozRgk1nIze6YRfttTz010ZTtORMpGvJT8jWnPU?=
 =?us-ascii?Q?XFaqlJ57dZ7aoVuf/uoNSQJzCVf4RnlNEX2dnE6D1qHjy3lKjNs5D3l2mGjc?=
 =?us-ascii?Q?x6/6UryG6f7e3V+7yGXolh7HfNsxeJOGLEpAXhbl8Vmi6PyHj7qWkYCF/ZUy?=
 =?us-ascii?Q?fXD3MEX5ztPXggpI8I9yi1dIyvkS5R8yVA0GaGgBHWuoGZ31w8g+OM/0AAMx?=
 =?us-ascii?Q?49HpXfUR+NF73HUQcUtSgegnWKhZrOBucXpSDn9AI/mHBissFbvafxk05K1w?=
 =?us-ascii?Q?7OU7yRc69gpuIQ+Txk6m9WGZ10RkfOMr9B1ndIjNnSmB/CL6ZYTd/0DoqWwN?=
 =?us-ascii?Q?Eb/UJIjcj3sH2wmD7wmYz4ihgWKTjXMel+eH2ppPo6x4k8DSZ9YEatMKp1bi?=
 =?us-ascii?Q?hHqJSB6BRTdob5q4pPY4yxN2pizEb6WOG8nTOgrvHtXUGohBI0/pvZHq99fd?=
 =?us-ascii?Q?gg+ObYNS4oSdlHOk5c+b98CMMQtf76Tkh5JtvwGRand958gmHet09Z791QAs?=
 =?us-ascii?Q?+JiscQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b476f2-9217-4b2c-9837-08dbbd628c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 00:58:36.4616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMotOA44n+HuwT11mmWCzvmB/rxIdG9Dt73mBwiZLuTv1AWTqXO9SYxEWqAq5hYqsWo4P8FSFH/9cbvUHkcnS7kezAQF2moHc+yuakajrMtSSysB5WwwOXSfHqvceSee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9983
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

> From: Kuninori Morimoto, Sent: Monday, September 25, 2023 9:53 AM
>=20
> MARVELL 10G PHY is needed for S4 StarterKit board.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/configs/renesas_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/re=
nesas_defconfig
> index 78d5d35ae9a1..185ee0ebe0ed 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -138,6 +138,7 @@ CONFIG_VIRTIO_NET=3Dy
>  CONFIG_SH_ETH=3Dy
>  CONFIG_RAVB=3Dy
>  CONFIG_RENESAS_ETHER_SWITCH=3Dy
> +CONFIG_BCM54140_PHY=3Dy
>  CONFIG_MARVELL_10G_PHY=3Dy

The MARVELL 10G PHY (CONFIG_MARVELL_10G_PHY) has already been enabled.
So, CONFIG_BCM54140_PHY is not needed.

Best regards,
Yoshihiro Shimoda

>  CONFIG_MICREL_PHY=3Dy
>  CONFIG_REALTEK_PHY=3Dy
> --
> 2.25.1

