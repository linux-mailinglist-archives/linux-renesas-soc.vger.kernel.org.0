Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3318354656F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 13:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237051AbiFJLVf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 07:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237231AbiFJLVd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 07:21:33 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B0014C752
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2022 04:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd4WJZpIeVsgctwp5KFp4EUmAGvFtKxztB7J/srnSoeAuFAjuyQxMzZghiHKgffRtSmN5Nb6rt4aW7TVTo5YrNII3Al3VvCiBqdm3D8hKjl0GkZG0igUhElvCm5Uwryo4X8mFpD/6Sv1U2MRvCAA2LZmFqPf6YqzkaI9R0fY9OxgbyxY2ZH+A6RT6C46NVw0rwSsXes/THS/Npz05gIsEOpu8dQPJljZzaEdTBhr7Lhi7ZHg7A3JsxzdiVHRx1SgQF1fQuLW/Md27bvwvjV5P5P17y0zVZ/kford7BexycBSfMbes+YGejrWebkvSYCkfQm4DP0sj73n0sLOyJ7u4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6tg/VVFc8N28pHaHAMpYPZf9YqB51cvL6vShlCkOYM=;
 b=lcS1Tu5E5gGtBpDSzC0h2crV0GbPT6lZILBGkgN9N4yActdZwzShJDx5PrlnQCz1YJyMPiAJDTYupuzNb7FoF765BpkPnjiqxaT5eCbnxP1huRT0DsBHoLMhJCYYZpTr8YpNtC5WudngBl/uXUovttnhas9ZxymqDwsgW9jTVaX02iGnQkD7Ax9hEFMNrQDFwTORWCUy3RMrH+UoyorcbAcngpfykjEBNIeBsGXp5VxIts2B6tiUmgKfqXvbCcbmICPG3RoY8Avz5+uWvnSrIGp45rxtrtKqnbTJ/DVNRxLFeBfOpzRVxL0HrWm5wqKexevorJZEYYWKE3BJ5YFc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6tg/VVFc8N28pHaHAMpYPZf9YqB51cvL6vShlCkOYM=;
 b=ohbFtyyQQ4NSEowfLdDGnVlvpHD9IjGuQ78b76F641wcnY0VCJs8PW5SFg68fmqnub7vUFijIId99HqLHOLvD44BB/BbADE7v7QHmPaAkwAjKUCOMAOQeWT2ZyjzkfpWpBZ3GXuppQsMGxpO0u5gcsHwH4hCyAmXCr4WHdiTppA=
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com (2603:1096:604:8a::15)
 by TYAPR01MB4704.jpnprd01.prod.outlook.com (2603:1096:404:12e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 11:21:29 +0000
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::60ad:abaf:4da3:f9e]) by OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::60ad:abaf:4da3:f9e%6]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 11:21:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct
 sizes
Thread-Topic: [PATCH] soc: renesas: rcar-sysc: Optimize rcar_sysc_area struct
 sizes
Thread-Index: AQHYe0pyuSxaeoTerE6CtClA6O39ya1IgMdA
Date:   Fri, 10 Jun 2022 11:21:29 +0000
Message-ID: <OSYPR01MB5334467D3C43A5B031D26FC6D8A69@OSYPR01MB5334.jpnprd01.prod.outlook.com>
References: <cbbc8f464743d636895c048de61aa610d75392de.1654701156.git.geert+renesas@glider.be>
In-Reply-To: <cbbc8f464743d636895c048de61aa610d75392de.1654701156.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 074ed2d1-803e-4ddc-14f8-08da4ad35db9
x-ms-traffictypediagnostic: TYAPR01MB4704:EE_
x-microsoft-antispam-prvs: <TYAPR01MB470498EF5A92432865765A77D8A69@TYAPR01MB4704.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8P9TieSCVotkTpOMJ1cQn2O4ZLlv026KHNqiF3JWDZSsuLhHwEFXR2uWtH5yscBtaCIDjC5sIDZdp6RJLxlt6iL952HmgQBw7fPXDh2ZUQ9yg05ZanWUyy31XsiLvVCU0rIjKrIU4/B4CsUfzBRALH3luIiY8pP7mn83ceIEOJ2c4sJVx9mUGvmDXE/PnjWzXGfYXWn6XkiFByzTvI7lflnWy1oF4NhGA8s7CLd7sP2gVoJV7cLvwyzF/Il5tsdcA8MRtAwmCzbc2vEcvJsq56nImVLU32OVYTAtmlplv7hhmR/HrUFG1nAFCwfM1SXbvlLVZq8KSjSnZAyCN5GbY4o1Vnp1rG8g13mbL/9c/yU1LDbNn57qgnR7U+SpA2kAxYo8rGYLpjwRkU0qLRl5Bill65lOJMRnTVJl/N+g2Gn3U1aSqk6RlO+VldFYysUn4El08w6XBURn+6CjtNKgPpIy4kXdlZuAfxwi3VoOSfUkQUs2WhBdRV31/8obDUMixf0YtKg8dLx5YkwH01D1FYyvL3DS6DGwiuhKp6DFGCwpIjscoh7PSqqwcEp828jQxm4cfNsZ3pcBP+h82sXECcASQUHO4z/6VVLg5Kf1HWEWanbtPMo3sap3mSg1NDu3OtncmcnWo/wFTT/MzyfB4Z7vGir6UiaS9SdGp5WDXUsNjnNwEKVRywmCwg62qF0RCrS0dzpONCvE1VqSiMImng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSYPR01MB5334.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(508600001)(110136005)(38100700002)(8936002)(54906003)(52536014)(33656002)(8676002)(4326008)(2906002)(5660300002)(66946007)(55016003)(76116006)(316002)(71200400001)(38070700005)(26005)(122000001)(7696005)(6506007)(86362001)(9686003)(4744005)(66446008)(66556008)(66476007)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zaTZTGRLbLjiA4lYpCRSWUlwnykYtQ8eMGstS6oDxHo8a4DrqRTvOuBbjlMo?=
 =?us-ascii?Q?0AfRbgbsNVIW08g6ieG+qvPeLHL17rU3kpmsiennJ2jCJj1DqdJVOSkqnKxY?=
 =?us-ascii?Q?4FD5n+3ImMG5pmPrwEV+T2HD+1JVpnoy+hHBavYxH72Xq9wrfW+ouh9ba88y?=
 =?us-ascii?Q?XNWuuzVVTWk0vipw98lESujmBhVSDu9cgNIROkq6M0JnktvHuFKiNILT90ya?=
 =?us-ascii?Q?lV8LcU6ebekuo6P25oBIv7QHh5BmjMMA9Rlo8htokjYjSBqgShtOckoPu6dM?=
 =?us-ascii?Q?1zy6nbKrWANCFdZdOaV9LhY/9aoRhx+ce54GRKdB4QGhEYMfga98a0ftavVy?=
 =?us-ascii?Q?ivW0JCT+A+nDaU6xhBZxiXn6KmNMHtgofWxWuixVesHjIKhi/sIQE7nRrhUH?=
 =?us-ascii?Q?dWKmkiE8r0+OjhdpH9cQe1cKTwftPOAEhbFW81KFuYH3QYrWEerqwIxavbCA?=
 =?us-ascii?Q?oevIcwE225g3HRSiRAaxxP3gjoDtqNluk3iB1WB368bGZ+Y86J05L7wH/JXa?=
 =?us-ascii?Q?FUTsUx2x+AH7WILSs8mQa4u5ykPMgP21phWY5f7pJh3RF2UWhl0IQBcuP/l3?=
 =?us-ascii?Q?DFDXd2zrTOPts/HjnAt5bVw5uzETrwZPDteKbO6kl1LiE5qjykDm6DJngFsc?=
 =?us-ascii?Q?3GyUid/BkBSAkmGX9DsVqGUwH+5NoYGT9NkWlaj5No6ugr0unh4Cr+eKOLqd?=
 =?us-ascii?Q?A+sNLFSGbSuWV+xtKLUlmy0dbwTMj3qo8mxCDZsP19TMbvyRgvvKEZ7QQU3R?=
 =?us-ascii?Q?BUxerQnN2Ln2IkThsOFsPuS60aJSNSUsOOMwbu+WI7IgonKCM+PeHrTUvpyh?=
 =?us-ascii?Q?x+FHcPSBfU/d+EPxc3isRhPlLBjYD99ouNwg2u4FcZJmRIXNk6ye8ezDia4X?=
 =?us-ascii?Q?SXScpoeB8AJqbKgbXROWASw7aIFTGlld1V5Pe9JH8DbpUTaq4y/SVDVPLo0A?=
 =?us-ascii?Q?jlPzf/gKsDesORjqgObVj4HioH8F0VQxk5zlU/R1zjtVaSUCFTL8qFWVETxk?=
 =?us-ascii?Q?R5sUHMoAWnkUmhkFmB4whDySMy4SIX5UFXjlEXIAJ9cpbvNKrdlXMZGiXW0H?=
 =?us-ascii?Q?UkLB22KjJTuDY1qXikaFCwhHUG8CPKE/nHq67dP5KZvJkhAyJLAWm3g//Wtv?=
 =?us-ascii?Q?T0PnsrnKN/FFczBemQKCFtgXPBHTLfIDo5BJaXI4G225M59lqhk+iDvzIbBK?=
 =?us-ascii?Q?etrPIzpFUw1hBhBgyQ19PvWGXyknreTUNs3lxJ+cfMbMq/2D5mGmXpa+YjeI?=
 =?us-ascii?Q?G//IxayTrGSWts5fvd9yuAb/QphHRxIohyRSZHvRpGc0qGBpa6N8nWj5JE3p?=
 =?us-ascii?Q?oqhnrzRnd0aRtxLNg60WL/smncnwe9ddhRCddG/IZK/smVRYpx5UHqYWPjmW?=
 =?us-ascii?Q?RYrA6txfg18DJll8d1gBFcMAORSMXxjPixs2MpId8Ps4yKfDag8z4r8xDP7v?=
 =?us-ascii?Q?dOqjovgp/lVrL8s1SHwAsp/umu2kf5zG0QAE6yitJNYmWnSBe9Is9j7xdMYj?=
 =?us-ascii?Q?bxcFyZ+VAfgz9KW6ElYgmK519ejVcHCKbpEJdm18kyR1g4Uj3HkJNiAyK4Uk?=
 =?us-ascii?Q?nOaEq3kheamaVxnxHvxaDTdMgkrzARd8wxFlNG+4U4bj9N7nKBOiMdA6WpNz?=
 =?us-ascii?Q?E41/kCHPquyDP7G55XoR2jHou9Oe0NSnGjb7wzL/KdrXDAFsX+gakHh+Szbg?=
 =?us-ascii?Q?DNeeqMLwWcOuKoRXFeOHjpbA4UQ7atZRBmuBdozeDt4KGUwBYJt9tphzficr?=
 =?us-ascii?Q?Qf2KFdA+DDyFQ6f7ntWNLynxaI+b2C7fHr97gKp2Oyml1rZcZeog?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSYPR01MB5334.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074ed2d1-803e-4ddc-14f8-08da4ad35db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 11:21:29.7155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JnvzynI8ouYPVvwRlJoCVXMKbdGDuUoiG3Dq4wqmVYYPh9j/dM47KCFvOLqcN0jumQ/OqiN/SJldjb5AvVdH9N1dLuit4p0474F+qzAR0nifCBjzP0WHeTM+cbMcLzY2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4704
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, June 9, 2022 12:14 AM
>=20
> Reduce the sizes of the rcar_sysc_area and rcar_gen4_sysc_area
> structures:
>   - parent is in the range [-1..32] or [-1..64], so s8 is sufficient,
>   - flags needs just 3 bits (for now), so u8 is plenty.
>=20
> This reduces kernel size by:
>   - 288 bytes for an R-Car Gen1+Gen2 kernel (arm32),
>   - 1772 bytes for an R-Car Gen3+Gen4 kernel (arm64).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel-for-v5.20.

Thank you for the patch! This patch looks good to me. And, I tested
this patch on both r8a77951 and r8a779f0, and I didn't observe any regressi=
on.
So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

