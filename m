Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B244B6652
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Feb 2022 09:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbiBOIke (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Feb 2022 03:40:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbiBOIkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Feb 2022 03:40:33 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12A5106100
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Feb 2022 00:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NApKAgYPzLIMsGPVbLXTjWkGJQ2toK/A3yDQM9+zi5F2OS0Gig4l3lpeu42fRwtU/WgXTMrQnditwNjshwVZpx4WVvWKh0X47Uu8+Tlu6KNmDl41N0pyy7VT/UsjOWE+fbdR4/NFMmKWgB4XDC4M/dbJ3OcxcltLFYD1IFv2ubtIK9Irl1cB84u2675MER3xyotPaG1r8YRA0mKxwhMwN7+EKaEIOvpK4nbZgDOkOfeBF9+pN39ltSliHy7wyrkyCFjdxebA/BMX6JXCJtHfaHCk7RJuSTiWfOFWtgxIZeqnDV7b/YW3L2mWrXflH7XSGABDZZC2vpcI5nBzP6U78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbvWZc5VOvj1ZtfSSK/3PxCoVxF/jCZosMC9d0Tn00o=;
 b=N0wqhrY0dIJqiCfbcRpOozedxR1dDeJDIs/PaJHr8d3TJIfitDSnj3yPRuO5sfgo1bMCLZsOFEXy+yIRcoAVEqXz4bt/Ad3BwFgA05F5hJKuZ1DInQYJ5WkL8uuRv2qsF35mvrLlRGmNO/1Gqs3XBQbCPGROACT52uR0y2mcbgrmUD9c00v1Z2Xs8WLnCDF93XcJq+OIZZuLbBW+PSJLrV40L1p6mh0+ikv7AygkPLCb+I72/1o8fyox/tkSVpl8WwwK8Ew3SUxckFS12Kd5kEm99dZGUUy4YbUtx8t/rzhx2scbIE8PoRM/wS8B5NwGVVR9CudBro7hpG/ssoyiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbvWZc5VOvj1ZtfSSK/3PxCoVxF/jCZosMC9d0Tn00o=;
 b=hIjMOhtWzRFhKFn1VOxLHilVlYiZ0G315QLVfMvQTQ8Hv3YQuGVYlaiKUqnWCaKhYbHOVLDZpxFyv7qaWi9489trZ1qgjTbROf7Kok6dVGHgkZtOm7c34OZ6hbulB+0Vr6wlHbtRuq/MuvhZtenslegec4RHAIkTiyziD2/DeGM=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Tue, 15 Feb
 2022 08:40:22 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::346f:1a56:ff4d:8c0a%6]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:40:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Hoai Luu <hoai.luu.ub@renesas.com>
Subject: RE: [PATCH/RFC 01/15] clk: renesas: r8a779f0: Add PFC clock
Thread-Topic: [PATCH/RFC 01/15] clk: renesas: r8a779f0: Add PFC clock
Thread-Index: AQHYDT0+L1r12Uan3Uae3ZZ/fLiKZqyUdICw
Date:   Tue, 15 Feb 2022 08:40:21 +0000
Message-ID: <TYBPR01MB5341AFC9E0DB5C5EA9FA0AC3D8349@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1642599415.git.geert+renesas@glider.be>
 <0657b04f706119c56462ea6437c518804e9d5330.1642599415.git.geert+renesas@glider.be>
In-Reply-To: <0657b04f706119c56462ea6437c518804e9d5330.1642599415.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f5b4e07-c576-48a4-0f5d-08d9f05ecdca
x-ms-traffictypediagnostic: TYAPR01MB5996:EE_
x-microsoft-antispam-prvs: <TYAPR01MB5996793B5E0459DAFC930E40D8349@TYAPR01MB5996.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ayo5LvEJyw9l+5ZS4yW8nDO54w/mRnzRY1WiCO92c0j1bYMicycUFA50tzewgLWZnqtRqDqX49fxVD14AyyKK57b24nuxO2erDTAx5uGn96omwa5VLBhPm3v9TWwx0nH4sk+b2EBWd+RjEn4u27z5Ek/seJiCh/QE2eQZ21pRCSHI34kxJG1wwDawbfZgCbGhjMWgJiQE2voh5N4WNBB5mKjney3HEABtGYURXzHJIlkgtOXf44XT6CnmcSe8r8Z7pS7uDpT6nm8pNvVly9AKf7TKvZffTWkUpllszOsOIkZyC78S/5LzH5e5j53xE23KwqJfBbC4G811iJZx2hZzpN4EoaBz0F4PnCfBA2FJzH75JoNcy00jWigHd/E42QMtU8AHZm7yVoKqpx9iGSxtsv4XXg0rtFyawCNPzrCPduKtKBJs227iLwz/FM8ijMz4EsNOn8PyztbYQnFq8Xmz+OY8pjSnxCx+D2lFPNR7SV3KHf8dkZxu0zIfYNqRZcTnKZIT+BfU8GXyjJAYMJ8Wa2TZHCSssC1GToPylbaw9vtHEG8I4y9ud5eWS13q+47yjgLyBKc0EFRY/ua5cGRJEGk5DZHlZlZIQwhog0TYZINhTtagPOf01AE5Nlpd6FbA63MZjGhCoJqvWLr89N+NDvtIII2yxF8ppJwQnCufIKex5V29NN6L6aRrHQxbmLu9TeshTOFjDypF+0U7shD6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(508600001)(38100700002)(71200400001)(6506007)(7696005)(186003)(107886003)(33656002)(110136005)(316002)(86362001)(122000001)(38070700005)(55016003)(83380400001)(4326008)(66446008)(66476007)(66556008)(76116006)(64756008)(2906002)(66946007)(8676002)(8936002)(52536014)(5660300002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?scsEshoX2Dt9rn0XO1EoWpFg+GP+31DtdOabdm6B2ZY7uBjZEUco5Bl5GBw1?=
 =?us-ascii?Q?+tSNNZ9u9KLJLhUmWNPJPtw/E/BluiLNDTCPIIl6FyFxGEzBsZNM2Kbp+OAW?=
 =?us-ascii?Q?XbEajfSR6veaEcVmkgzGJOc5o+eafdoObQO5uyv4T2+vsSKDR3IKTya/8cKc?=
 =?us-ascii?Q?Ea9+Ln4ddUyFICa+UbKPhpSScmAX7YtNMY9BGyapyJFupmNG0ddBzFjNMRYr?=
 =?us-ascii?Q?mQOOhtkvBmXLuqcq9RT73YcMqPRBszODm9ZFEqeRrTqEAIdGro7xVsxXFiQb?=
 =?us-ascii?Q?OPzlrJ2Bzo1krRPk+6atI2LgXrldk6S8W1VdY1vQTIZVqBrL8lyFPxrnJAiS?=
 =?us-ascii?Q?y2BuUKw9dSH3NYxJuFs+MQcwZQkoHsKgXXLwXsWAtlWkKQWmNabPjMIY7wx3?=
 =?us-ascii?Q?2OAI+ODgj4oE72j3pKy5w/L5xvNmvO0+7k85t5cF2mseGC4ZB5ck3J5gL6mp?=
 =?us-ascii?Q?TLfVbi/9Eu8MvCV2znjzCHWs7N5zI3WevcY24JJprXoom7jTORAesKYBCgro?=
 =?us-ascii?Q?GbWzW/U0OF/rQ1lrXNK3zyXrHdNwla9J2wyBfv+vzl/7PFO4xykpOjnWVus+?=
 =?us-ascii?Q?rNOYoPV55h3RO6b3wNFVc1W3Je68lyuwTbXpSMHTP8m2QfKYD610iEP+XkYn?=
 =?us-ascii?Q?irs6f30fP8u+iuFBBzGR3cZFj3H96EtzriRZS0i95nKHVFn4+zIeHK16yot4?=
 =?us-ascii?Q?dKCCyH2q8DViXxpFi2kWbPoDTtt9QIfRwgmAciKb5gB1D7lC9odaSymd/buf?=
 =?us-ascii?Q?+IyANtc7U99YswCN2M4zi88zZESf8hv990JGqA/3nZsPXcSejui5mnjYo9dm?=
 =?us-ascii?Q?87asx4aDl0CSjHfTigjDywZa9NH9M9HSsrkjLjx9/68Sk5WAWFbOL7DjUolV?=
 =?us-ascii?Q?RuGwSe1bN9mWn2xxytwxar/83g1k59CZiyZaxKesAzIgukj3Uov1AzZTzp+q?=
 =?us-ascii?Q?1MKA+KQTXGZZsbkrA1ag0yTKZBkku18r0sms1rQCY2AuhaTuRHL6KamQ1tZc?=
 =?us-ascii?Q?7OKY6BvQhPRyjZ+ynfKaIOz2COFg5y2QbPHblXMo2zeVseiybPfow/aU9Shm?=
 =?us-ascii?Q?2kdHyaq5Roz+D8TVxvQo5ID+5w3KZpQiT1tpl7hAzpwmDsDaPo3M+HOMKOij?=
 =?us-ascii?Q?2hSqavMwOKBe6inGCGsTlPyBK9SD8Z6834RhXg1zc8ZZQondia71X6JA/gMm?=
 =?us-ascii?Q?m1ieMRODmAOVD79L+66naGCj/BgZgTeXg5aG0s6HJtD9ky+NjS2xK1rZaOXY?=
 =?us-ascii?Q?Dtdgo493dbAKxvGKY24E/29YNuU/6EU5J2dtczYD2Eo+LMGJtPXcbaHqZIHU?=
 =?us-ascii?Q?DHSe8lKwFb0yIeTL1lFzsYCxWavaRBuJOaNduFs/OTvrtskyadpYejLxzsj4?=
 =?us-ascii?Q?PAPHxqBP2z1GaLGSd1A5qXoAIy5kINChTcZDiVTZ+SXnpj8SDKlOyotHYtB0?=
 =?us-ascii?Q?5Z1hSw5LFDQ7/Y/YPu5+V7mpIvHZ1zRkytrpbkNZbvagONHox/tkTHX4smZi?=
 =?us-ascii?Q?rk1qKPTNwIRD3YE6lWnu7GHcjqVuRyzN7c2MIMez8yI7LE/w8O/W0dwB/weX?=
 =?us-ascii?Q?yzKNbYnKU9ppQO6O4sOZ9/jb1uZjEQqwkIe1x17V8AgAwgW8vgWJ20kaN8lh?=
 =?us-ascii?Q?Llz3b4DUwEGBZKBltGLLceG8+rNhL9Q8p9OJv0KHsj0vhOjCXBm2d/voj73F?=
 =?us-ascii?Q?YUW37KzZO6eAMBdBxqLPAmHQjGGVYtqSMdcbPZDObOZAvWsqipDeOB3kmM/d?=
 =?us-ascii?Q?1zupnVQkURRXJMQsuTKyB2uW9S34yKSiEEbQzU3FrRGVRE2pT6//?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5b4e07-c576-48a4-0f5d-08d9f05ecdca
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:40:21.9330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3JBhZ9aAQ6R5HY8/cz4PQ/sopvYpUnJumROZRYjS0YDAX0J8sXL53omi5y2q8HwYs4gpLid03F+Qj0dmTAInfH2Hh5NGZxq8WGkOvR9p2LtU5TWEmnklA09Ddr2W5/U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996
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
> Add the module clock used by the Pin Function (PFC/GPIO) controller
> on the Renesas R-Car S4-8 (R8A779F0) SoC.
>=20
> Extracted from a larger patch in the BSP by LUU HOAI.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

