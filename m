Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FE7764630
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 07:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbjG0Fu0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 01:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232558AbjG0FuJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 01:50:09 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1613A90
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 22:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N50cd6AzF9bMIc3iSDGNJIL5VMH0jtr90w9+bRT9Sh9PcYpgTTqWKuqWcpBfHaTlN6uyxVUKkgoNyVm1VeeviVp98uAc7RH1STKEvQh4Mc4Y5XfrDx4JCepKhRRd1Qh+JmmdsSa/zOx7kO+Nvl5G1gJRCLyX2KBRYy95lCxhBksU2ClRbrPIu9qgdK2W7OK3KaxcOiFp7djaN0o5m4BQtU6DcCXs3iX3dxUgHOjuHbdc39agI3Du8euaf4hMDjhVapUp88RZJ4P0KTjTcshByv99hBZRbCpLTNiuUbsH8pRQr/zw6JDoPD+9dxpKs4AyjLLMZF2UEm3zli/osHx+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1u42TiC0QSYoqgE9IC2Wqp+VcewWDgY3IkQw2QEiXM=;
 b=fGYWAa2KuXZyV5KKcZmKXweILewaugiXWy3b/Tw8AjdaZ+d7OKss4rfoyA3gk9yT7ZbZcLaIl4BeQ3d6OODwmTxW8syAJIWvIqZhm/jqSDHVqA7vsYERLODNdI5KmigcVX90las96znvmxcqWtxLxjE68/S4v82ApBgtnLV1fd/V3MzwJSYaljq2g7iMn13n0R2ghwXxTPhX9km0RuNPApELhQvM++J8DLnYZSk/wkMUxyHUWcvU5vC1YAFvr8GJxksfEE8q0PobSdVRlydxBQma1T1lzB312RD3KWzamf+oUtSXMwQTVRFQ04emdZGhvBcwsULkDw2Xlv4uAATlIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1u42TiC0QSYoqgE9IC2Wqp+VcewWDgY3IkQw2QEiXM=;
 b=ZlbB0wcYiUbQsyOJE+3T/eU4KZC8BdBVxzPza2NvodqiG7ifplYNxepgAk5Gr0yr7LIkbuunSUW/sOLFSdp05Rdpvyk86kRXdSodZzjQBAjXpMZ/iCi3fOYKmAPc6X4oCkGD7N4sQbv45x9deC5NxRuGGba2til1SNXHVNFDarQ=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB8330.jpnprd01.prod.outlook.com
 (2603:1096:400:164::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 05:48:53 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 05:48:53 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFT 3/3] arm64: dts: renesas: spider: Add keyboard to test
 IRQ[0145]
Thread-Topic: [PATCH/RFT 3/3] arm64: dts: renesas: spider: Add keyboard to
 test IRQ[0145]
Thread-Index: AQHZv8/CQttPlXtfKUS6p2CFq34KK6/NGhtA
Date:   Thu, 27 Jul 2023 05:48:53 +0000
Message-ID: <TYBPR01MB53412530BDC2567E23EDDF00D801A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1690382328.git.geert+renesas@glider.be>
 <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
In-Reply-To: <d6ccbb7b7a73eb35f1e1a8d85adcf9f1f980b2c1.1690382328.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB8330:EE_
x-ms-office365-filtering-correlation-id: cfab69d5-8737-4306-df00-08db8e652951
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iE2doO5ufvBiYZBUiKjzsAZDijvNdrfiPuvp0T2aIevumlzyXYEmLFTkeMRwlLCU8FLHXBRw6ZHJlkppAFJDqyY4Uf7u3riaNqwG4/mE/uD5/O3rppnPJLeyZlxsWHpfRsbGXxN78Yj/cF3WACtshzWfBFeWGp5H8mGEJ5FvOLOBUUt/fEgTf2XN1eSyiOaZ+AZ3Dpg6tFZTJqZYjjO1kAcvDvh6tT5hr4f3Ce75qFlWACogXTMXlBexqsHidHhLeM2Vy2+37JHMX0KwP00BHJX69aWOrTShqLiRyQU4DexkcDlIslXYJYI2elBOpHSAfbJmOMTPKDOt4egR9lHAizIlTTJmxP4LEsBjX0i2NPMB2Vdx1Gg5DUTonPzQumK/2eVA8bG3hgqNSIlcCJzNoNq0aWICmXrPCmv1aWp1tiPiFTVhnsWRVoLwVi6KRNBeNGMH6sAuwZuqcZgMjZWy1IP6kG2gpyTwrWrM4oRLhnrdnhH/+v6bfW9reHcRrmReNECkJ1wfr3ibwxaxPCA/oqcZTZzjjDWg2aXt8vdfVPU9osvDu2cYbsU8n+lLg8PtG5riq+CPqrjpNNy7uFT3sfdAthxc0lVjVF4GN/jih9R+2B/I8c/wnrph6KDcU87J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(55016003)(71200400001)(110136005)(122000001)(7696005)(38100700002)(9686003)(478600001)(52536014)(41300700001)(64756008)(5660300002)(4326008)(66556008)(8676002)(66946007)(76116006)(66476007)(8936002)(66446008)(316002)(186003)(83380400001)(6506007)(86362001)(33656002)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tZlONgX5+HQwxjrUtN3hKIUPyGbAr5uHqZh8NnMYAEnWXXIk/zgPiQx6leH5?=
 =?us-ascii?Q?kWkC58FoJWQtXPkZKpb6TIMwmZ1qg7oBhpZw/uGrIHnr/uZmT5kh3Ct9X30I?=
 =?us-ascii?Q?e+QQWn45R4BkEqJIof5j6QpksfygaBo4Ohemiajd3gxL5Yl5g7Co5xLOiwW8?=
 =?us-ascii?Q?bIcsTXPCFgimsbaCv5EPOyMgQVHFx/wRjPL2qlVbjPU6qVT1r7Os4KXjtlUg?=
 =?us-ascii?Q?uy2x4K00vbQ4L3zvNzwdtx3srZ0qC38iFhkwqhKSh7RU0cbRlIAHZI+Wflqp?=
 =?us-ascii?Q?f/sokgGvaiVfO9ogIiWfaesa8kWamTvPWlppZDDsdCBL+nzAyig4qRTTUTMZ?=
 =?us-ascii?Q?SP6BxQe9U3du0gOjqMs9Eka6bKlnW13wtn2+EN44WXEo9RtkGBmXwMYBSXRf?=
 =?us-ascii?Q?xBd8MW/1lbz2LnGO649VIbs2wDcoftRkpivqNwILG2JbPO+9fd7BmvYe1hDG?=
 =?us-ascii?Q?7lvE9yhzIxXLqqC1P7amDCeGiXwREniQ4WPyema6iYJuf/Paz52uOo/FvBuV?=
 =?us-ascii?Q?D4Ac87IX4rqo+9mBJiOFGTJvLHYvINoDHJNmuZExbzSwz88fjcRvtY+vW6Wy?=
 =?us-ascii?Q?4PcfslvBgazLg+0MROvXmZu+D4EqLjXzoZA5J33+H0ttLBf500gMRFEJPO2q?=
 =?us-ascii?Q?4p7lDuYkJfSg7iCqfZv8ak6oBAWqKa33rArml4J/qSi33CM6KUWkG2oThSKJ?=
 =?us-ascii?Q?yd7WE84JBh9tzsOp8Gtgl20E+TRX90hhW1lq3fJWVJCtWQCMJqrcS7m6nqUJ?=
 =?us-ascii?Q?8/lemg3T6gSLLTJUw6EOs2xRrrA2r16V73tYHqnmyQcrAgDcwF6mRS5alxCV?=
 =?us-ascii?Q?H3dOQuusoFHP4YafMv5fC5Kmjr1seUD+JhSyyMwlflTgxAf0lVgt6RB+d7NZ?=
 =?us-ascii?Q?yxewZSv2P2Y30cHvXMCGxgfHmRLVAMYi6TKt/l7CPILzIgCjCn+vxHKMDD5/?=
 =?us-ascii?Q?+MO7qCsjI22jvmlWMAKX4XJJZaaL7qAQWCKq8WAGw4m76HtRT9PdfnlCgqwB?=
 =?us-ascii?Q?c8pD79oC8L2I5kgr+ws3nCipd1ayr7miHFr6QcGgp3wjQAUQFEgRndy9c+o5?=
 =?us-ascii?Q?rPegdWCJiJAWZvQ30lgzj9cV8i5q/xnUQ2IQ8wLvWArgmsEC25PVAm/O0JGk?=
 =?us-ascii?Q?dKEWnLZZxICjXBSngBZ5+YtJpSBVYwOgOFnKpLcudeMPBY+BOF2NtFsXy43g?=
 =?us-ascii?Q?nwl2vq7lVHy2fyjg9AZX3oqgcl7Za3TpwCTq2S6yKKS9txWRNsiiJG4hTs30?=
 =?us-ascii?Q?1QV5J/Uc08lYrpQNSl2h5q4LmBfD4q3hLvei+b+PHD5FtQX3FcOp5zhezjv1?=
 =?us-ascii?Q?BrM+gO4sSNjdqXB0aUolMpnkMH3PATmKNRWkMT+wkXnVYtqWn4jgPWeakyqi?=
 =?us-ascii?Q?ublWDqSoazGRTA/angc/kvp6ycHIj+CciCpQ9NBQwZHpGisF+C9Gf0H8SMOq?=
 =?us-ascii?Q?HDV9gzSWJUbluBWDz00oG6lWFoIWzXnVD41pFom//LN2ICBde7QwzTNmfwvS?=
 =?us-ascii?Q?KduXqPQS262MDdc4d6WNsfoWuFLKAECDwQUFEUopIUx8PZAixLyhOSSFYIKU?=
 =?us-ascii?Q?nUAdxhKpM7po027q6JNEew8PJZtwh3HurlHvdSwRwdNYnqNMq/Bdbc/yppls?=
 =?us-ascii?Q?ZWCXuTed67GI6AyMG13wYQFqxEViWV7ta57pOqFseFeBICoF6jyQv3ZRJ9sR?=
 =?us-ascii?Q?9HvENA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfab69d5-8737-4306-df00-08db8e652951
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 05:48:53.8641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNr2xR74Unkj5KoQTiGmxvaBwDfhcbjwzxWgboYU7RfRjYRG329f2nJxR4xieLEnbx2G341V5w89rjooREwWbcEUYedQJDpgxITqbpj/RZBfAfeHE7wi33afQWpDkvj1
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

> From: Geert Uytterhoeven, Sent: Wednesday, July 26, 2023 11:45 PM
>=20
> Add an interrupt-controlled keyboard to test operation of the Interrupt
> Controller for External Devices (INTC-EX) on the Spider development
> board.
>=20
> Test procedure:
>   - Run "evtest" (select device event number "0"),
>   - Pull one of the following signals on the Spider Breakout Board low
>     to trigger the corresponding interrupt and keypress (key release is
>     automatic):
>       - Test point CP18 -> IRQ0 (KEY_0),
>       - Test point CP17 -> IRQ1 (KEY_1),
>       - CN37 pin 4 -> IRQ4 (KEY_4),
>       - CN37 pin 2 -> IRQ5 (KEY_5).
>=20
> GND is available on e.g. pin 8 of CN37 (MSIOF0 PIN HEADER).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.

Thank you for the patch! I got it.

> I do not have physical access to a Spider development board.
> Thanks for testing!
>=20
> Note that this IRQ conflicts with operation of LED7, so do not apply the
> LED patch while testing.

I also tested on my Spider board about IRQ4 and IRQ5.

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

# For the record. My environment is Spider ES1.2 board which has a switch b=
oard.
# Since the SW3 pin 7 of the switch board is low, we cannot use CN37.
# However, we can use the SW3 pin 7 instead.

Best regards,
Yoshihiro Shimoda

> ---
>  .../boot/dts/renesas/r8a779f0-spider.dts      | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64=
/boot/dts/renesas/r8a779f0-spider.dts
> index 7aac3f4d319c330c..a73251da1f215141 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
> @@ -6,12 +6,56 @@
>   */
>=20
>  /dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +
>  #include "r8a779f0-spider-cpu.dtsi"
>  #include "r8a779f0-spider-ethernet.dtsi"
>=20
>  / {
>  	model =3D "Renesas Spider CPU and Breakout boards based on r8a779f0";
>  	compatible =3D "renesas,spider-breakout", "renesas,spider-cpu", "renesa=
s,r8a779f0";
> +
> +	keyboard-irq {
> +		compatible =3D "gpio-keys";
> +
> +		pinctrl-0 =3D <&keyboard_irq_pins>;
> +		pinctrl-names =3D "default";
> +
> +		interrupt-parent =3D <&intc_ex>;
> +
> +		key-0 {
> +			interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> +			linux,code =3D <KEY_0>;
> +			label =3D "Breakabout Board CP18";
> +			wakeup-source;
> +			debounce-interval =3D <20>;
> +		};
> +
> +		key-1 {
> +			interrupts =3D <1 IRQ_TYPE_EDGE_FALLING>;
> +			linux,code =3D <KEY_1>;
> +			label =3D "Breakabout Board CP17";
> +			wakeup-source;
> +			debounce-interval =3D <20>;
> +		};
> +
> +		key-4 {
> +			interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
> +			linux,code =3D <KEY_4>;
> +			label =3D "Breakout Board CN37-4";
> +			wakeup-source;
> +			debounce-interval =3D <20>;
> +		};
> +
> +		key-5 {
> +			interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
> +			linux,code =3D <KEY_5>;
> +			label =3D "Breakout Board CN37-2";
> +			wakeup-source;
> +			debounce-interval =3D <20>;
> +		};
> +	};
>  };
>=20
>  &i2c4 {
> @@ -22,3 +66,11 @@ eeprom@51 {
>  		pagesize =3D <8>;
>  	};
>  };
> +
> +&pfc {
> +	keyboard_irq_pins: keyboard-irq {
> +		groups =3D "intc_ex_irq0", "intc_ex_irq1", "intc_ex_irq4",
> +			 "intc_ex_irq5";
> +		function =3D "intc_ex";
> +	};
> +};
> --
> 2.34.1

