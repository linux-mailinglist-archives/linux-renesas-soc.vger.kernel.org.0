Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822A7497D5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 11:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236552AbiAXKsD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 05:48:03 -0500
Received: from mail-os0jpn01on2131.outbound.protection.outlook.com ([40.107.113.131]:1084
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235576AbiAXKsD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 05:48:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpIM/rGonexOabhvWz3LXUvGmZJeCvgrlr418Jlzd8lM3Cn+sImSz97D2Aq/jPyAOjFBBftvmnYOgIne0W8SLFh7Z8bdIfNgEAp7VlY7ZOaRN7XHQvj+rmY2XrMM9XirSayNBvTbvrJ4FifoXlxd1Z7LWoP+7Peuzd/66EovX5RFvxTeZI91E6Uj1p0OEN8NvK0FxoFHuLWGqyUjG0O9CIxgo91OtAm973MEUigJwnFG5XCpUNNHLj/07n19BudfTyva5QCNW3qNqOVewiQ3s0avLOSuW1aw97KjJWuMlWY1Qh6LC1EG2Bz8u4b5yPGrSjj7GLSNZcJaOy9ID52zUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqpoCwxYp/UAq4fZn2SOVf6wK3m5S7q5yB+TYnF8n4o=;
 b=iXSfmbIT5DAp21FY6WLtXil6ZtOYI2Lj3XR4YQhwNsNJlFaU8GguU30wlZxBtS7xj0Kni+4RsM0sTrEmCZtzhL+cb6R4gmApDBIupr6jRrgAS1IMDm/jLi72f3S5JL74kXU9f5dGekJUrz5+bIcYljqig2MRgZUJIFRolMYN6juWdvpSv0BcGJvPgOcjegs+BQ2tVXeUF51ZKv+l3S5xxJXwa3HqP8fGCK2uBqv913HOZFcR97aYnWSNo/cbopL5dOnnlLqMaS2vZGAhUylRAwBt+HQQW02gUcfCtRxxOjGsZiSiU8yOm7ifRRfo/UuFkgloFX3YaDeFK+OU57sMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqpoCwxYp/UAq4fZn2SOVf6wK3m5S7q5yB+TYnF8n4o=;
 b=FOEL7ntGwjJftF7iKD3OkY7+xD4+YjNUe9giEs9l+sxOC8lAlLsO/Y4oZxdQLsqRuL++DrY8EwDactfjVTFvmXgvC6fN19BW/h+C+zNytniHfG6PQkM6gl0Zfh1NoLuw/vPeWOvc+oD7hw+fsbf236u+EE+BXdwPgsiF5AZu7EA=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OS0PR01MB5747.jpnprd01.prod.outlook.com (2603:1096:604:b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 10:48:01 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a5a8:3660:7f57:43f7]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a5a8:3660:7f57:43f7%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 10:48:01 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded
 pinctrl-names, too
Thread-Topic: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded
 pinctrl-names, too
Thread-Index: AQHYDt18YuMdRL3AiUOSVqYcOienW6xx/2tA
Date:   Mon, 24 Jan 2022 10:48:01 +0000
Message-ID: <OSZPR01MB70193269E111C3483F313972AA5E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <ada490aeee8f1bfdae4a878dd1fadbb34dbc3fb7.1642779366.git.geert+renesas@glider.be>
In-Reply-To: <ada490aeee8f1bfdae4a878dd1fadbb34dbc3fb7.1642779366.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91d93a9a-a763-4436-6b86-08d9df26fdee
x-ms-traffictypediagnostic: OS0PR01MB5747:EE_
x-microsoft-antispam-prvs: <OS0PR01MB57475A30D04C5DF05BD5FE28AA5E9@OS0PR01MB5747.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6mQcheebEz9JeC00Yz8wQs1BPDMKVAYPsi2NozfWzJLZPHVF6IesVSS23z3fVyYgkQ3JWaXtCrQDGNfHmXznON7p4Aeo8AJvkM3CTJ9TrmaMtUcEj7pi5TCsUQYulxCvJ4/tQjJbz2NjQtAmAgNi59OPwVerqVDutv6ilgA5zVCOPF+/xBJdKCraYZ+NYofAMjPoA3/RHCMvCJyRwNRDExKf92qqFGcQUHTrOV77CQXuVb4UTacxMXYienKf0E46H8j37YG9QVBqSDz/UoAaz6pxzI7cXDMz229B8evxy7XL/EUUjkjZzTxattDwnE2Xhg4c10BiLbg2K3K9Gd22nrgranrUb8Y2IHAfrBhm7RgmWSRoOdwoFWeOMdpu07XqZwQ89vz08h1Es+30OlTkGmEHk2bF3wurCtcb1r5UAASjf6/mZRbocx/LI8nIkszi1Drzg8jh5bDIS+k81659MRIkBpVRLzic4cveL3GRtyGkUQBmAyzKBjyRwRDiTLRWSo5ccAenBCuxaV2tzCz9QiDz3hsv+yk/t1HxUf9NCrSAN3A9DXUAQC7nJtwHBLmRivCnnRqw1DKRo31MwPx6QaECJalZaipbx3A2tuWKOpoil28d9OHQUzn9DKYn+PnLD4RPQkuGEGB/Xc9m8gAgAkGSSyc6axVOT1H6OFilL9xceKjQq9Nd9YRNJv3v4qIaGx1peewSCLUTnCG4YQhmCw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66946007)(64756008)(66476007)(8676002)(9686003)(38100700002)(6506007)(8936002)(53546011)(7696005)(110136005)(55016003)(66446008)(76116006)(38070700005)(71200400001)(316002)(186003)(6636002)(52536014)(26005)(122000001)(33656002)(86362001)(508600001)(4326008)(5660300002)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fb1hunYpkTtgzHyQdWQv7mSWBunYiybC8PC42JQDOrRbv9nTwFY4HNI0afHc?=
 =?us-ascii?Q?5prQsxwAfnxYgIILqEhzYjkc/qINbaGv5Ir77ONsuFyudV9e+ezZj0zCCHdr?=
 =?us-ascii?Q?+StpArG+CAUwlkQIoQYYHoho6p8b8X1XQJG2IR4lu/RSOn0JO9cnsB+t02n8?=
 =?us-ascii?Q?TK2HqF6Z+mA9fPuc+ypuggxRsIBCbzf/qawAHCHWF6IW4sl9IUh8zWDNq4oi?=
 =?us-ascii?Q?RB9T1eOauSiQNAOqczK7i+LBzs1bwTXkCjUWE0OTSgNHt05DB+1w6w6e5a2i?=
 =?us-ascii?Q?jMq6TNUBkBIVcgPKpLPnshRuUYhtHPTw9yyr/Q2liSe/WD74gkqk/BnF9oTX?=
 =?us-ascii?Q?nIVMcN8RRVlbFx3YfSZC2fAxUjBIOHU9MfY0HzjbEmQ/zZ3JWGN20wE8eBA4?=
 =?us-ascii?Q?zqCgMeC9jOIPKg1abD0uDmyEkKAsepRR//u1vcI6TaEf8mQ2l+cgpMlnrl6e?=
 =?us-ascii?Q?V4mxliHUWGPQHPhHbxGawcfcrTIFei2XZef9rDhSvM2Gh2qencDrWpojw/CG?=
 =?us-ascii?Q?GewPjSTaTJv/E0vwTZJhg+WIOFBFoWNrMzC5JmI44pumHdEJVeDakpxI48/c?=
 =?us-ascii?Q?UWmdtjFIsDtTTb7KOY1Tb9DIsmjn/zvhSKw7xwRF7tvZKLpETqme34NiIu8m?=
 =?us-ascii?Q?JeOim/aqMG8THI3VLnXarZEKyCdj6guEtHpJe6Td0J0wU2lO545KBEdmEoka?=
 =?us-ascii?Q?FAvEk1COfojAXSHN4Yo5SoMlgnsrJvRhzrnBFsKKBfZ3rCcmkbZK1AJd/gtd?=
 =?us-ascii?Q?xcxUcu1H1Lq9OomoApRP02mn0ujIkB/2Gw/HpKiR5BZvRSo5iXIed/IjJ+v8?=
 =?us-ascii?Q?z6Al0+XXX8gbzxNoJQbwwd8Qz+ZiySCU0FoEI6j4HiytJSlWBvOwpisG3aoj?=
 =?us-ascii?Q?bWaXrV7+hTx6BZRFg5y8XWUj66x4lZi/gPCHnkbuvp6omNuoWsWY6fWNJy6/?=
 =?us-ascii?Q?6az7BEZ67DUPCQpm3WVvffKhC37A91yHnQtcCrEiEjliIIKt0gIQLPBwFcyQ?=
 =?us-ascii?Q?KVTT19Z4r2Q1+aKZ3WV6vuFZqrLoBDetUOZ27fUpBJI2+zCRlB0flMhZkFMs?=
 =?us-ascii?Q?EHBbPdjP6NiL+bvWWdvxR6+b2zhXVvWc5gfVfx/+DoVyNdCGBIVdi6+yzHVx?=
 =?us-ascii?Q?dMLLfgnHXOj3Ko0f/5GE1zybW6bu96+TU1oBcqBOwVks37jeAiZdF+4mDEd/?=
 =?us-ascii?Q?fShIHAYDkEBshXBoDQkihpi7JnXb12nIvesC6axad6nDHBOfCtQIO1KrFSPM?=
 =?us-ascii?Q?FfNpz8AtwjuvNIBWj5WrpsFXge5uIUNs/QVz+WeM5rWwwUSDk+J2oxLXJOuf?=
 =?us-ascii?Q?rdatN7Mi/vz7nhpqKBZ1oCrIH4ELvZmhmMf28Y7uOf9p8/y+jUU7VGBemZpN?=
 =?us-ascii?Q?q/w92O940nSUsdnTk5xqds2buvmVMKBeHBmQ+YxN4bGGNFuXeon5WYDvKy9u?=
 =?us-ascii?Q?G6eBho2gRqAv936IPx86M8wM9uUBjTBkUYSLPhf2OxaK/Cwzxqg1j8oDgHpN?=
 =?us-ascii?Q?b7uoc0T5rf5xCGQSkyH9ekyF3mZmPdGHpeIMsQUmSieF6OVH9uDo5JVWxvaG?=
 =?us-ascii?Q?RDtpTfO7TpE+kV7WmCMt8kYIs5Vtmvh6UtxpkPxSmnh0SoFjcBywrKmhqqq8?=
 =?us-ascii?Q?oyPJEydtyr8WjeRGZd/Kc3qlspytnWaPmiHXcs9Ma2bHPkzWgZthKRnNSBnu?=
 =?us-ascii?Q?Eh/hCKyv7dT/Hydki0fihyxlgegoYPzC4BHJmjyLgycd/JBFO5lCIVatcghm?=
 =?us-ascii?Q?8e2U5mYDEA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d93a9a-a763-4436-6b86-08d9df26fdee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 10:48:01.0866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdB5lHrMBPqH74LWeT2hubOpOGeoQs++WE6T6WXV2w2tL6Y1Ai0piel17ImhsUgsi0Kic5utieqEfm7/BLvASi/xO2B5Lk1PHgVZqON4I5q89noz6BBUGVAOqbK8ZFGu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5747
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 21 January 2022 15:42
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Biju=
 Das
> <biju.das.jz@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven <geert+renesas@=
glider.be>
> Subject: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded pi=
nctrl-names, too
>=20
> "make dtbs" complains when "pinctrl-names" is present without "pinctrl-0"=
.
>=20
> Fixes: 5c0d1874072bef54 ("arm64: dts: renesas: Add initial device tree fo=
r RZ/G2LC SMARC EVK")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be folded into the original in renesas-arm-dt-for-v5.18.
>=20
>  arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> index 53845823d0dce9cc..728a2275ea8d21ac 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> @@ -19,46 +19,55 @@ / {
>=20
>  &canfd {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ehci0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ehci1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &hsusb {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &i2c0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &i2c1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &i2c3 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ohci0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ohci1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
> @@ -68,32 +77,38 @@ &phyrst {
>=20
>  &scif2 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &sdhi1 {
>  	/delete-property/ pinctrl-0;
>  	/delete-property/ pinctrl-1;
> +	/delete-property/ pinctrl-names;
>  	/delete-property/ vmmc-supply;
>  	status =3D "disabled";
>  };
>=20
>  &spi1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ssi0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &usb2_phy0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &usb2_phy1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
> --
> 2.25.1

