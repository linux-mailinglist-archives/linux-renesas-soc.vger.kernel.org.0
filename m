Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865377B4B9B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 08:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235547AbjJBGpi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 02:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235539AbjJBGph (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 02:45:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEDCA6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 23:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8HxA6FlKtLTJ2XQk4wU3+w77+HTDVZwANLFhnuVO/oiIjVv7fQpOviMU/3O+NLImG1SLqNPZr0GBVsMYFHqXkWI1YQ64IGLq2xw0cmH4YU69tuEL9IGaIYnw8uLJjdnDsFrCo2xIsn8ZcgIWfEcmCo9BaDBVvsrzUx6hSnaDKUpiyaqzC2JZnkHkSEq9132VdKEaWKHJaTq/0Ftb4NVbN67uCvnZxgLUs8zDP8qoNVaoELvAGfwQK9oaLNFpcOrtq++Ui6E+3dBNw4PB6eg+MHWy8ixuU/v/TtVWGlYhbqvRyf2NhLhW+sKfwr1/QmCENKdEu1ev+X0oMe+/gnIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjwGqfz8ny7myQADGnUhzcfzow1eQBnDoGI+dJdTn84=;
 b=gjKCNwSd73WYp6sjhEEahPFWNPgR7D5ziB9fp4Uh7fCaC+/ufHyxK1nFVFKaPzGvzxKpfQeqDuJftTuRj1yq3+f55ugxxv9yno9MATXqraF/maLc/3VBsfkwAG4PfGlwi1CBt/T6gGzv20EAGTuWfWMPf2ObjTUCNUjxl/vfyqlXsU/KZGMsUNCelDbYLQu3AJj6Z1Aa7vYEnouiCWNIorro/Aiv+9sASJdhsEmsCNB1QOftN3kVrUmlFk9F2SnzVXfkiELutO2Yet1R6VWEa9Nj3mwUrSkj+4ljvcVBiIJEega4s7VLJZBsA3Yg8dd3dxUWYbhFUFplgXG/Byf2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjwGqfz8ny7myQADGnUhzcfzow1eQBnDoGI+dJdTn84=;
 b=ZvvnuC5mIqWT7DtG6NchyUsRGIBVsD1XclbeH6+t+xil4D7MuJ/S/b2cQDlYTvdEE/wE8HJ3FwjGZ7/ec8+XLNdveYxssh7Bzk8pm1krG7gHJIOfpdbS+TI2YJnANdq4zruMEh0QR/rYax4HclPzr6xmHYs+L2xJUc4hOKud/SQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB11289.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 06:45:31 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 06:45:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: RE: [PATCH v3 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC
 support
Thread-Topic: [PATCH v3 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC
 support
Thread-Index: AQHZ9PUo1LWKuQiLPUuq1NSwQpmLD7A2DX4g
Date:   Mon, 2 Oct 2023 06:45:31 +0000
Message-ID: <TYBPR01MB5341ABDED9F0EC0756207BB9D8C5A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
 <87bkdhefev.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkdhefev.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB11289:EE_
x-ms-office365-filtering-correlation-id: ecc7cdd3-8602-40c9-8ba4-08dbc3132c1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QsajACuXjSBsABOvA4ytUj4Kf4AUgXRau1UvVQMfAJEcxi4KdkmkUuWTjYJ4eZvo/JCCiE8hAZfQ2j6jto+v8Z2oX6en6XJ5akyk8RAxveesD6AeipnBJxyJOk9cV8VkZGu8zIVfiRQ5z/swsjNwVYujsJvf/+Q0R24PMOEZ87QvTMkyPfq+qjngO9hdC4lRrMKEwtc1kG4cD4iEg5OwMKU91cxbOMokiy2kRB+eyqXiA/4FdIe3pjzwrcJKnuHEWqxZvHDPFbqBNAdn4cqMXcYM952V4tDHwSpb3xTMYXAB1qGxqtGr9amWPVsTdZYWXppi8+mA7RUHwM4fM/71NFga4NlEXYOBcTWY41UFWcUIGnMJNZyb/3zsz/OZpmlvjZRVCh27ic+elIrO3cGPxL0ViXHHmARDTxqZwx0sr9n99JYqCyZWrY2YQiyPcnwpHPYmD34zuVYPid3S/3N0Od0nA7KqtcdjympAnn6hP7Dh6GjsY1xLAVRrNa9X+nbCA455XVdgf4n1nFTDxDqRf7gIVfkncOWcRIvCcdKOBBxb/Yqk2a2Dk3ATyaw+HIwb5kSOlawcGzITvYWm6tDIcBf8yrHDkbDT+ayfAlJLw1VRefafWywQXWnNktoKCKvm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(83380400001)(478600001)(64756008)(2906002)(66476007)(316002)(110136005)(66446008)(66556008)(76116006)(66946007)(55016003)(41300700001)(38100700002)(86362001)(52536014)(38070700005)(5660300002)(9686003)(4326008)(8936002)(8676002)(7696005)(6506007)(122000001)(54906003)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LSMHOUJyOkeE46KJ/XrM7r1UwEDliSVQkeT8If9VnV2qyfMdYqyW6Xep44BX?=
 =?us-ascii?Q?kiFa3e+6ZlWojsHWGGYNMrv9kH9MR8DxjQCHnnBJAF+Niuxwkdbjs5JwLHkU?=
 =?us-ascii?Q?D5CLpo0NLv8RV6kvHsJCxadl4VOATNYCsbKQS67d9NFj0C/aCXF10UtKl0zQ?=
 =?us-ascii?Q?ZBhjxsXzx9DSimJAS9o9AJ/koGcrt6it00BanVXUNgwVyTfB/B/rj6Gc0Pi9?=
 =?us-ascii?Q?2AaQ541HxTuc3AaGCaBqHP/mxikvF/Q6OqqztCXf1RGTIzZq6vuo/kf3kH5s?=
 =?us-ascii?Q?/3gL/ECtomHIE1VqiEniK+itfiaKkzuHsM3rl7WlLa0r2ioRv7h9SY3NCEi8?=
 =?us-ascii?Q?HteRXXq3TJjm7uXiHMkacjWwF2g1r+C5bruMHjLeXOV9UeNMWvS94gT1TqZe?=
 =?us-ascii?Q?JmLyo8lIY6/8ewa2ptGGpeGBV7vOo0nxCnNFqJ5hhb9DUK2uXTXco94eu0hQ?=
 =?us-ascii?Q?RRghxofCRe4HFuP/gy5+gh+zbAOdh2XfTga9E0yyNDAvrT93XQpQGSkgUnnX?=
 =?us-ascii?Q?UpAmASlSxBXAbrh+/GriKHidcaWP5c1i+CXXYoHokMvLsSwWVSdJh5J9sgAq?=
 =?us-ascii?Q?CjFAmu4kA403YNPs2vGVx6KLeBAncjwdRKRm0A+foMAhE62uNGec/x6gFwWl?=
 =?us-ascii?Q?lY4O5UuD+1E3llFSttqNvEkVbTYS0/twiVDA1YqpWc5lpHojtUYqj9RzHL7P?=
 =?us-ascii?Q?mrMguX8W6sMKRgBp1MLGJTI4QzuC1e/rXXpe9sRX8BGK32+REDPoVwAPyUaM?=
 =?us-ascii?Q?89PcWJgMZaE4NvPM/+GtkeGzdOJi9llXAEQWvBan2KQ/yAkUp5UR61MTmSKo?=
 =?us-ascii?Q?MFtXiJ5UhG/KN/DIDo19qNFz6Eex0o+paKrOGOqVuMKZJooD1311tBXMwT+G?=
 =?us-ascii?Q?I3p2hmAWeInHTTtmgQeIOHV0hDAay4JBiNubjHHwsjjR0RWivW5VLfyHxZIQ?=
 =?us-ascii?Q?3hs9G/c4ExIzSt0UV86S1bRG0827NOr4uldJEFBLl99JlwmtTI450IBfG5Wf?=
 =?us-ascii?Q?KP8+/dZos4OyQvlO6geGWvpaEiqWDTJ8ECDnv367xqazfH3s3UQ/DaxBQBw0?=
 =?us-ascii?Q?WyRaWym1G794QvMP5A2fxToxsIxlFrFDtVp7QsG8Gc6J2AJiX0zHjYUBlQea?=
 =?us-ascii?Q?Ceumx/z8xHlRAh/3qauUMCCKaZhjB4omQX4J/QCfT0bLuaHiy4pUrZUJyNEc?=
 =?us-ascii?Q?zPlUQYd8ImwKBxtm7rgIjL6XT+W9qw5kmDNZa8isxRqiT6/XMY+pQMU2KrGs?=
 =?us-ascii?Q?rmUnh5ajqgXFcZkDYcU72kAlIAp8H/zmKOfYWf5JcN3wEANFoOWwR3PBJHkE?=
 =?us-ascii?Q?RSuL601XXHdaYiFBSJJa5Y5IcGpt5EtNmxBtVriVynOO32LJPTK8SXEAH72V?=
 =?us-ascii?Q?bTycQujuYJNQ4IrDlnLNIMUtlcwR0xWJaCviQHymQm0eVp3vUveohmoRVDC+?=
 =?us-ascii?Q?gkt94uAlW+UbfSrdDpdVYVZ6hCQe+JP324HWkmbTF1QWcdc7pXfIhc7BVHGF?=
 =?us-ascii?Q?0kSZzDu28me9DQF0lAohdnKAeB/W0suXyUjMBJoBnO7erQkxx8+yaUdUyDwv?=
 =?us-ascii?Q?L+zLMFnV0CPVC/owaAiLkJAtHZzWdQnpGc+ch8EbsoNcFWTTDzVN2RzwztJB?=
 =?us-ascii?Q?EmZSD0278KLz0MeUCy1cLYplhvldmA2/eYSaHK6O5Dd3KChy6vAuX4johc/p?=
 =?us-ascii?Q?ecCc4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc7cdd3-8602-40c9-8ba4-08dbc3132c1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 06:45:31.4496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnOXze11SM16iR3xc6DQrjrxxSzL/s/sRFWeymxOQd4Y8jh46bN+uOq8lHSeRjoPXRGH1cE6UhhXHjGg1Bc992Qe2scgGGx+3R1Xfuaro2Btc1reop2V35dUjPsfuUxo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11289
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

> From: Kuninori Morimoto, Sent: Monday, October 2, 2023 2:56 PM
>=20
> R8A779F4 is update version of R8A779F0.
> This patch adds its support, but is using r8a7799f0 dtsi internally.

nit:
s/r8a7799f0/r8a779f0/

Anyway, this patch looks good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779f4.dtsi
> new file mode 100644
> index 000000000000..ebed41892df3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Device Tree Source for the R-Car S4-8 (R8A779F4) SoC
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +#include "r8a779f0.dtsi"
> +
> +/ {
> +	compatible =3D "renesas,r8a779f4", "renesas,r8a779f0";
> +};
> --
> 2.25.1

