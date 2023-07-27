Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3EC76462F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 07:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbjG0FuY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 01:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbjG0FuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 01:50:09 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7E13A94
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 22:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJrS8btJR8G8/yyZzGh7KIY7mPzBlJVAUeBuPcrJgtays2lcaC8WMZrlZ2AD7eApE77s0xak+zTaDOkZbNrjmvhBrksV5dM6ELSM4JxcQG2Sqp/f4NlMGbmgd7yWeXg0GbwQPk0XaTo7FsxsbJ3jNvz2GnQv5wK0eMInQr6Cr2zmLCwhbOq4qqw63SoI/D2LH7m/h6JVxJnT03HMoOo5/n4GiQ6ck1tImzNwwMg1dd02iERH8Bf4WmKGUEw/SRhYNn9ldZo++NAINcENiptGLm0s4Ft+lKtVtL5Li1fWJUgjF92JfbjCIksfG6ayfvRNRSWjLJqU+fd9CXwYAQsKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ag1kMWtcoh6oF4k+WbbW1+WPvHgtyjmEG97HCxoc3I=;
 b=iw1LJK3grtViQHXu7yXpkbr+w5Hja2gxQRBG9Focwa9EpebbbUayuVprLKYdwZwVAfu6CI5OIQPpZLNQPRUfM/rTOdH+2rfG5FDartRf2kvM3DvGB/oNgr2AhF+F4wEGLrs7yvcEopZCqasbWG3d2telWRwEAZXkRsEzhZ3aj0M338YYYpNl51OHTkOq4+Lp8VLVc2bZBmsiB43/zeByirvQwBMH6SZrUIyQ2+hW1xynCGXsQRkS/kT2DNiukewXla4+l5oPBcAICjgTzdBs8LMtmQKE+r2CmuG3JzLzjF6j+142zKPJWfIbGag+T0aV8E67cDmQkcSDzNdF0HV76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ag1kMWtcoh6oF4k+WbbW1+WPvHgtyjmEG97HCxoc3I=;
 b=HnxLfP/yzDFfNcaGx0jJapbzg/GZgVhvcpNPOoAu/LBs/zfz2Xcd7WSEXaXyeQaT5m84T1QxvKh/vRmrPq2UfGKX5j6uXA0w0LYiEhAQ4JPBn9k4oTGwJeWGM2nyYA1+48HtY33+5ZQ3wZKTulNRokAitlEiqkojGgkyeCX0qlg=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB8330.jpnprd01.prod.outlook.com
 (2603:1096:400:164::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 05:48:59 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 05:48:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFT] arm64: dts: renesas: spider-cpu: Add GP LEDs
Thread-Topic: [PATCH/RFT] arm64: dts: renesas: spider-cpu: Add GP LEDs
Thread-Index: AQHZv8/nn534Ut0tl0SFmEaYhOKj0a/NGs0g
Date:   Thu, 27 Jul 2023 05:48:59 +0000
Message-ID: <TYBPR01MB53413B31BDAF1B403BFB3B78D801A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
In-Reply-To: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB8330:EE_
x-ms-office365-filtering-correlation-id: 004ecb6b-3224-44f2-671f-08db8e652cae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ziO+9KSP0t4NGggWmxP5RMf3ew05T5zvfHqYFMl05XRMZojUVGXvUWRJuZ34VYFKHyMFcPY3gwV/qjBT5ufZyX16XEwg/gsB4K1fSn9OdyuSPfDLlBt7Gik5bRiae//80N1e2wxgVVFk/lJDaqRvglCIrc30lvr0EBcV8M+HvvrpIBr5+zD0l9jKhy19MzkgwzHXeFXAPDBAP1p1h42JchFgVXtbfc1J0SPn4jI7dz62HDpKCS8lRq53r8RING5/ASE8gI4aaBURenuq+TqOLv94WCIVO2V+a+fdWSkBrvh9H+P5OYG/c46mZKkj7CplLYNocYth8LoRuUa82F1veYwnefm+ilkAO2RmwZX9G5w0bCBN+QBOmNT4D6GoMUYdBbuARYR4M4DFWKxUdCiY4Y3nSOkcUOS7r41tWzBxNHsGINduczr8ZrcOeTbkGJpi9qbGnqRvb/Y72yUr2AQ35onr8PIogPm/gdqLAdMYB9ZzAfKx821LK7ur4pe8J6+r7EP7iZbGFXXYmPIMLHPJhhOUJQWHjiopHp/j9bjAWlmyZOCXTBfuuMgUcOZnKjv+dwuMo5XTbdm5JarZnUojG3xSvy9DAFh5u6p+GvM5PzBYN7Rs5fgSE6jw+Mp/sA1T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(55016003)(71200400001)(110136005)(122000001)(7696005)(38100700002)(9686003)(478600001)(52536014)(41300700001)(64756008)(5660300002)(4326008)(66556008)(8676002)(66946007)(76116006)(66476007)(8936002)(66446008)(316002)(186003)(83380400001)(6506007)(86362001)(33656002)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mERUr5P3pJ/MLXEMDZcCymrkjYB6eanXASZzMkb5Xx3dLhiVjX2HfeP7OT/z?=
 =?us-ascii?Q?GD6HUFHDMlqdsfpEZktqYhmBACAPlyW9GuOm4SbdeeHEsKWGL/uvOaAC1lO2?=
 =?us-ascii?Q?x6YpxmJVWx9r1FYb68ZX0ZYXCK6J2H3FxPQVmlDGAPZGed01UFvjA9oEq3SF?=
 =?us-ascii?Q?DMmq6LWNNgbIEzITgMChdrtjAO4jRElr8XI35Yy50+zb1N7tuKQzOuXvwu2w?=
 =?us-ascii?Q?DoBdsqhsMMGipL4vL8gLjcRjMKwD8ZvNQovWY6vM9DKj4NpBkWdqSXJlWK1E?=
 =?us-ascii?Q?dIGlrZxZebisUQ8xNVJV4h+kPK53/0J9tcFwk1DxblzpkQuRO1/870dWmVfF?=
 =?us-ascii?Q?b+EcUiaPUWF1wTo0mJ+VkbKcbDRBEWgG8O6v+W9fmG/H33AMDZ8BWT31P7ap?=
 =?us-ascii?Q?fNAeyJJbwVDKKlIhmOpC0zg6AB4/8TxumHw8wJjsxRpxpzQ/23jDv9/cz0bc?=
 =?us-ascii?Q?JKXmWhWhgDZUDOUAJWLXUeM5S9zIAmfE+xmooPrClqcbj6nx0fnvjGI9hKmG?=
 =?us-ascii?Q?WG26Zj0BeBGQ5hxKzVne7xzrAjDGPy1c02o0elkS9Xiy1FvzS4/Cvti5MqAO?=
 =?us-ascii?Q?LIH2axNDUMJTHU6h5r0NLmODQuWIRy0zC+9S8fEeyqNVDYZlGXLo6AB428oQ?=
 =?us-ascii?Q?f8I0gGv+zMjynHnJ5n9a09kP9ZDjZU4+f5AN/CU1VbF3OxvZ3BYhI+gY1fng?=
 =?us-ascii?Q?8xJ7VvrcCm/iRH7OmBTnX46wexT+Bd5Rfa9YtYu2hlEwBCRPA+Rkyh0wEVvC?=
 =?us-ascii?Q?Eta1u3Q3D/i6bjJP9Kc11noFsms4+8OU4B+snj0fYVltiwQPqFoyPQtTfLto?=
 =?us-ascii?Q?3Y/LPxLFfMgLFTZ33bYA8RospukFtVNab1OnWltKYCt9ETV0PYglxZvBZr/w?=
 =?us-ascii?Q?X+BREUjKj8vjFpb+pIwQnjGpSw4QGTy5/zkDdAygJou8tIgJgHPVySi/xAIZ?=
 =?us-ascii?Q?/hgft3uunPzVjm+FA+TUzTn5SULAcqWvKBfYYzFMa8bufqRYjjeS1K7jawS/?=
 =?us-ascii?Q?WuO+9OoqPj8IfAYAllRIabCNEiG27xki1IYyRRHgn87Ec5STGG3PoKwTUVLh?=
 =?us-ascii?Q?k4TPJn/1PvU7yfCcky08AgoZVWK4at95ztTVc/ufLcfMCNLwY/xe3Pl13N7G?=
 =?us-ascii?Q?arrTo5L6ZhvROnQ09qKN91hx0hN18X5FDM0uUao8xBBZTM/saXo68+fyV5YV?=
 =?us-ascii?Q?0WRJt8x44x4pwcIxJJ1oGK9mVtB+KzyX7m/tRNd2FkFzBdI0Q5N5IedxzQN9?=
 =?us-ascii?Q?WwW8e5uQ6dt2/fnxsV1nUrzQYkgkwNVbFqkYDZjp8s8OhmF0W3pH0i8Qmewi?=
 =?us-ascii?Q?YIr8bh7yeQiGQv2XUmiIGWTslMyh1VWGAKFdtQSnYbvTSZDhHMEIItzSBVz6?=
 =?us-ascii?Q?bXmihjui+6X5svMD55WQdq8Esr2cYEE+QOiEGDTUvThja2yvQSSfTeE5T9R4?=
 =?us-ascii?Q?T/p7C2XTvLjCd5kRA/dXgCteMU3/N3kAdPPMvU8V5fcAkJJs9nR86dGreN1T?=
 =?us-ascii?Q?cDgkPhDi7en5wZvfJJqrPL7a4WThu7Eb3A/ae4/Nmd8bbqioYdUwtYGQKELR?=
 =?us-ascii?Q?25iyJsCORsVyIS0cGOB6/F3w+Kf5tvrMhoWfPzvGXrzg8yJlzQGufqEWyV+D?=
 =?us-ascii?Q?CG+XpdI/dTAp4o3EyhTgr5+CSRjJ68jCGM5ejtzygBu0drX0U/CoaO8SsDwg?=
 =?us-ascii?Q?hf+iMg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004ecb6b-3224-44f2-671f-08db8e652cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 05:48:59.5501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IcbksRXvsENJvVhMrH3e9UwMlk1cfODGt7Tuljc4tEMzcrcMkL34kYSLn0i4VdDC4+xXudcT1QUoU0y30dCdjQn7iW0hy1FXN3sd7pqD1+BvH/WNkiObc0n+cNAukRpc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8330
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

> From: Geert Uytterhoeven, Sent: Wednesday, July 26, 2023 11:46 PM
>=20
> Describe the two General Purpose LEDs LED7 and LED8 on the Spider CPU
> board, so they can be used as indicator LEDs.
>=20
> Note that General Purpose LEDs LED9 to LED11 are not added, as they are
> connected to GPIO block 4, which can only be accessed from the Control
> Domain.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested test patch on my environment.

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
> I do not have physical access to a Spider development board.
> Thanks for testing!
> ---
>  .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> index dd8e0e1595260b3d..76a94812875ef261 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
> @@ -6,6 +6,8 @@
>   */
>=20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
>  #include "r8a779f0.dtsi"
>=20
>  / {
> @@ -22,6 +24,24 @@ chosen {
>  		stdout-path =3D "serial0:1843200n8";
>  	};
>=20
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-7 {
> +			gpios =3D <&gpio0 11 GPIO_ACTIVE_HIGH>;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			function =3D LED_FUNCTION_INDICATOR;
> +			function-enumerator =3D <7>;
> +		};
> +
> +		led-8 {
> +			gpios =3D <&gpio0 14 GPIO_ACTIVE_HIGH>;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			function =3D LED_FUNCTION_INDICATOR;
> +			function-enumerator =3D <8>;
> +		};
> +	};
> +
>  	memory@48000000 {
>  		device_type =3D "memory";
>  		/* first 128MB is reserved for secure area. */
> --
> 2.34.1

