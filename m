Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F7B4C44E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 13:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240703AbiBYMuP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 07:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237171AbiBYMuO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 07:50:14 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF011AAFCE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 04:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+wv3+ohvZM3TGos0zHMk8SdusVDmBnGNxfKct/HrPq/hmlJDSIbvHJoB6WVHkMw3C53Jm3HCtKQxjSkzNnbkIb6El7LHBG/2h5eo5ElCvKSPjGORyEBt1ZaO3EGDUS5+vfasGpu2uROWrp+a4xpVcWyoN/ukSpN3GnN1tJlvt1gWRjzDKi8SQJjQa65ry6LsF40oWJrIzbM3a2pxwCVlTqdqtAeT24tvrRI9oneAVcSoqlAOcQykvWJNVx1X6vrPXTJo/1HiQQn7yzRpUH1mMo9T45gWj5tCzCLYahbPYSnUm5ODec6xBSyLKId659LCYn+2M1OZDmMrNeeTU0dLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ9N1DffcPa5J7QW5whKfg2bNoK/+hZUdQ+eAOp39H8=;
 b=YKOUGxHTrzSAnPBPpLiYSB3hyagGWoNSATo3nRDxXvf7leWXZ/MO21zSZqOD1iMa6vY+A0I7pkUqJA3k+xCXoIGI85o3H3Op0cgSlevBjVPAES5tv9lck/Q30yeDADCQlO9uPF8YeJbn5tfZ4YydhmxiFcVpuKg5hV1SoFS3jHtwL55CowcAXph+zYLc5EBeATa3Vc3OQ+w97QEWqrzYGsByryWgC9TLIBvQDUeH4TSLq68bGuI8Hl+DbX36vhqy8d47cs+wUh7pLvrpI2rffN0qzH2PyEKfV3vZp9CQTVeVQo0ySojISIWgwVu8h4smcx4sUA2LC4jPUjxsXWPhCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ9N1DffcPa5J7QW5whKfg2bNoK/+hZUdQ+eAOp39H8=;
 b=ZayxxDPyokG1szgHyLJB0Ubv+HNGRyHFIBjlSkMK6+6y4lgkJD9z/kcKfTG7sPqXLffKxUGU8PCPkS2Ql7DV8boyur4nsLd+vBkiDGZMsmoZeCKTyJ1CKNwISMfM2izERdyzJlxtF1zKWavcGoFD2kdtaYGKASJFTnPagJ/deI0=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB7519.jpnprd01.prod.outlook.com
 (2603:1096:604:146::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Fri, 25 Feb
 2022 12:49:40 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::458:e316:da3:511a%4]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 12:49:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 0/2] arm64: renesas: Add R-Car S4-8 Pin control support
Thread-Topic: [PATCH v2 0/2] arm64: renesas: Add R-Car S4-8 Pin control
 support
Thread-Index: AQHYJzrFt3FNn+SonE+dQURmCeri2aykPYog
Date:   Fri, 25 Feb 2022 12:49:40 +0000
Message-ID: <TYBPR01MB5341FE6A3F2204112B05B3E4D83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1645458249.git.geert+renesas@glider.be>
In-Reply-To: <cover.1645458249.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d8d3a10-20a6-4b7d-92a5-08d9f85d49da
x-ms-traffictypediagnostic: OSAPR01MB7519:EE_
x-microsoft-antispam-prvs: <OSAPR01MB75195FBD98EF1D3568456A92D83E9@OSAPR01MB7519.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PKiCR3GoOCcOZmStwzhc1MG9QmHUEXtms7JwlvPD5jC57rt2YlVpc32sBdluxawE9olT01wlDNXgGj9TcWmpZEtQXSMlYAU+TPMz96649QmtvtL3VkcMrVxPAZVWeiKYrFHqGHQ90zLRoE3Tgw31xmtAFSK6iJ9pCrwrfgW0Y9xxmVUGGDihue+vqda2JSNjw37tdrdGw9mu6lYh9HprzockdwvVe6UHCebieUy8E0BxVc8ch/9vE7qagkMSJgcKTPMa5gowJVtE95/pVxrrJAYPvmVSdvwI3ZiREucCCmtu8atTtunYagpqpXr5PCGSz7zZwSBj321Hvr4PjF5OfBq5AYcbAGcNESPwWI7aKRsY0A6EmoPC264plJo8tJLsd2OdkLzy2GbkY523s7r3W4u85EGgkTYHbGd9WyTRI08jApdE9sP3SEQWwiyaJi/tpaFSqviJBpB/KhGg2wGwAVVzs04+4YxjKlbz+Pn7TwPoj9MRrhdDfLYDPdE9lwK3pfNwrMn+WaSm2Ql5N9rgu7s2fzgHvEZn1ribsDbiX3eMCpMHfpIOqBB6egbgLF6GXNx+0+9vQqBO6A9+8XXA6xBMxFov/pDuNmWGLKft7VvFjlb7p+1R08AzPZ0/YTif6BDmNtYYJlWBt+9SY+aIAgeJD3EgSDRjXJc69/CziaB7L5aSfq8KEhbU7/zEVDs2xSfIymI4u5tQulYfZWOZfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(4326008)(8676002)(64756008)(38100700002)(66476007)(66446008)(66946007)(76116006)(66556008)(6506007)(9686003)(316002)(7696005)(71200400001)(55016003)(52536014)(86362001)(33656002)(83380400001)(110136005)(54906003)(38070700005)(2906002)(508600001)(4744005)(26005)(186003)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SbQPh4z7JKhWPAAqB23iiSIWt21NW7M4q1+Y14fOCNe/g2n4Ne0pU7gBTde9?=
 =?us-ascii?Q?am5U7ypmQDD70ojpIBL+3Gs16pPj33TUYnimeRwca+FRIe6h3/KS/AV2hoNn?=
 =?us-ascii?Q?Z2wReXCSYofsXj3s5F/E3Pkv+li65j8rMzq/FMwHLPcusMySLKpzNdTvM1Gy?=
 =?us-ascii?Q?VIJNls4n/XvyozMfRVoVRkMRpMxwtvoGpNs6Tky6aQLaXIR2OWgHnwunrBX2?=
 =?us-ascii?Q?QV/Glt/KEJHG0YVCuYt/4yFgDMfzST7CKG7lGxn5x/1zVCn8NLkhQrXqflQ4?=
 =?us-ascii?Q?lOqbp6KMtDypXFiy47UWxeRCNm7aaSTO4xH93BKY2wssFP43c972wdLu9Z09?=
 =?us-ascii?Q?s/M/rOaoddrf0c/0+vYRbd8Tth39RkEV6vLQSqtoyOm3ZdHN/to+jCa7XBxl?=
 =?us-ascii?Q?GYVumiA3By6XNmxnJOkMuzjiVmwDuRumf6O/pQWAeGo6unBPmlxF6M1oJZjP?=
 =?us-ascii?Q?M4tFEnid+6H0j1ojNL5nZIdOM6YMIOnBTJlrTawjsQYdoJUYWlcqdoKrplxU?=
 =?us-ascii?Q?z+QlngblBUhPyQOt8cmrtU+T6b1w1YYe3PGcjVDRostJSuGrIG8AiwUIBNH3?=
 =?us-ascii?Q?WS3s3wk3hDRZszkqeUA3krG6Di7KYVs4TC+TSb1jdMEdF6MEj43sZUKzZxBj?=
 =?us-ascii?Q?A/lreeBcuqQV1d6wz4WWpR8Sf2mvDheapR6wk4yNQknsui7kGLb9BalBX+2M?=
 =?us-ascii?Q?Vc7wrSQIVFPfAJuCAtSz5O6u0UKjJ1Ezixa+/akFb5Gz8HL3zcX2ratu7K8l?=
 =?us-ascii?Q?Vw8dhek7zmU6qKiGZ0UPIw7EQYr5cnTd7Zmmwqh7CICuAIyS6La60C5h0Yf3?=
 =?us-ascii?Q?jPi8GF+ZSikjZAPakkHqpXYNwsZCeVeo7eVAtN+m2heWtbdMA5wTZDYFAwFP?=
 =?us-ascii?Q?SDl5idcfGYt66g4eW8Nd/3OiolbCxJke4InvnY4gKCiaOSHcreVxtZQU0gJU?=
 =?us-ascii?Q?DpbxdnJuuKHwDvfWmyY+F0uLkQ8GqaOn9cV8YT3oo+u45QE+I+UH8TQRdniI?=
 =?us-ascii?Q?XMbhEI9gcQALSYgD+iN9epTZU4iDR92RigL20bJO+TYVyB6jCzP5zLqNlZul?=
 =?us-ascii?Q?1DAA4CnI+hPl+v844/kLWJeeCiTYeG6w4vVbFbCdaweMTzHZJC97Uz5fL6mp?=
 =?us-ascii?Q?Mi1uQLCTlqfoT4N38GEkYLLOYtjrKNt6X3btQRhTZn5h6jWVh7f/8/uNKXJw?=
 =?us-ascii?Q?wOpN+P2NzRFvuhj3WeWErxojioya0BmTayII5kTBJI416V7QPF5Qb8QmGono?=
 =?us-ascii?Q?emLZyzya19JzctNF2nc/QU6pXg6GKICNaO7Wuk8gMOn3i2ohVzTYPKB4mHmf?=
 =?us-ascii?Q?CcFYv5Q1jVvvlUOhV/YcQUFwZdXRr92FNQSIHg+50eIu6vKgOf2cXn8kNHv1?=
 =?us-ascii?Q?vNpgvOi/+9iPQ98JPeqeLFG6tbj7skSRjl/lwb+kamS212eYSFRm8nyELYNw?=
 =?us-ascii?Q?uwyWQFQ82fI2hsampfMIl9yqPavUmbX7BUMAVE2N5CntJ9jYA59747HmFlhv?=
 =?us-ascii?Q?3Wu5YVljfiW+eHrKljKcSIpcXBIHZTzdPQh+Ylh5EQ6ld+16GmWKin31Ecxf?=
 =?us-ascii?Q?DJbxbxDRU1VlYmfEm2pBij/zpI2EoocUpsMZymtWxspCSco6tsuHQH4aW7cb?=
 =?us-ascii?Q?aydkr7AEr540/+mZL7YXfGOw+qm2CVRV6wC211JNNqD5TBf8/2nXyAg93s+F?=
 =?us-ascii?Q?S047f4QLMW28zxtkKNPaMXs52jCq6nDfd1WY7eQt1fpDjq/eAlU2yAWqJkM4?=
 =?us-ascii?Q?t2FaM1+m4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8d3a10-20a6-4b7d-92a5-08d9f85d49da
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 12:49:40.3562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfGLOXRCNkU7XefeC5NBlEk+J/GlB+CDoJhaobdhk3pc/xAcLuPvu1tYCeoCSwQMwnV86o1l/9lNAboLRMo8ZywaIOpgRKG5kJIC5VXqEthdX3hWIGJkLLtUsHAGJEr7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7519
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

> From: Geert Uytterhoeven, Sent: Tuesday, February 22, 2022 12:49 AM
>=20
> 	Hi all,
>=20
> This patch series adds pin control support for the Renesas R-Car S4-8
> Soc on the Spider board, and enables pin control for the serial console.
>=20
> Changes compared to v1[1]:
>   - Drop register banks 4-7, as they can only be accessed from the
>     Control Domain.
>=20
> Serial console and I2C[2] have been tested on the Renesas Spider
> development board.
>=20
> Thanks for your comments!

Thank you for the patch! All patches look good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

