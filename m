Return-Path: <linux-renesas-soc+bounces-4673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C78A7D3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 09:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D37A281564
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 07:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB446A337;
	Wed, 17 Apr 2024 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IafNZaDr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7E3184D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2024 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713339595; cv=fail; b=ZR/qh7cRtwrmedbcU5bN7oJwil4gJrAeJjaCaADysyEmUJBMmSNsOC2B8sJFwy91H4CBZAMI6eM+NVoLzC07RQVPFdBvftBbD6hwMCf6piON7ixOAbotklKJfjnxFdQcT1W6bEzuptSV6/1Ud6inKnbffbgL/jOb5yGQ5fgUlp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713339595; c=relaxed/simple;
	bh=rKW+an8vAZxdg+E8894gYU6Zo274+i20dQJ0sk15qjs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tawsDSj+837ZIM8ge75lKq7FdcPeqYlhX1Z3Nx4Iplo80PI4dh544/L3LEhNNGcfCkXq7p+7LmrN0Xk8uTbjnB/m4J05OlCvP0HyRAlxk5k2FKvfr/YIW40bU+rZY5mWxLmNdYbEe2R5vEVqkhr1aVx6Na3kzrj/BBhOX04I3y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IafNZaDr; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfaNvyNmU2RMhdOXlmWOzn1nValK6XGa7gfBpNsbsa9QEunO3gcClgMBdk21URu8OlO+hqsCDXx01sWcoZpdqOfvtyX52Lam8ykHxYvJgh0Njw6reTPrcUVAoStZqgcJfsR5OUQBry50eZ6TIlnAqgUjgcGBRJrdPczL4Ttb7Q7z+WBc/imvm6Hwx2rxpv21+F6dV0PgQuYmN/caf6fuv/CKdC2sv7LXT3qQGqHXVgiilKYtrIAMFnTjM7SjzLxAYUSbC85yC4zkqXcxOrHwuUeiBlfqcS46qtpmk9CoojqjTmGQTgMArB7KronEl6CZtbjb2ihacmD8A0DBawyGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pBpIOnDlQePehO57cyfNxA2jUjr0uMX0YLpRw9wCec=;
 b=KSitlD6SMoWgV1mlvpOVhRzlG6fBxMFKaHQ8oUCH7uc9Odc97JpoRUQYm6jOQ3YR6OtKWHcvsqki8xevcQ1rZX7/ro8qXdi4/0zA2fn7luJALUFdU/p2Xd9fMqUUbY893S90SKTaorivztrJ5FcIb4AYg6LfMEO/TuRHY9Xls+gBUH2yM/NWi0cn3xKJ7Cu2ej9aZxTp2HOZ0kVD3MtPu+uuFG2UkgF2Msd604uPyhKRel4P5OJdSr1P355EVYmgEgIDp2yhg5+3yZBNZ+6MtsfR7jthn2enRTB30IrHzshfleZ9YL6wE0AwIdcUB/A57zUFMl41gzX2Neu4OoddUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pBpIOnDlQePehO57cyfNxA2jUjr0uMX0YLpRw9wCec=;
 b=IafNZaDr2qC7G/wU3p+3b95CduMqLjD5pEo3R83DvOuCuNm2ZSn2MwJoBNOCO+6fQxAA9OkR2MHx++W3TyUkiS4gl8GJuqaPCzM+nuCyvJmDdwS/WoxLf5pgP21v4k7+eeYitRzed0EXXA7ou4SJacHM36WOdi7pQ51/sTck+dU=
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 (2603:1096:400:390::11) by OSZPR01MB8274.jpnprd01.prod.outlook.com
 (2603:1096:604:184::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 07:39:49 +0000
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::cd96:e2d7:d31b:6428]) by TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::cd96:e2d7:d31b:6428%5]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 07:39:49 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a779h0: Add INTC-EX node
Thread-Topic: [PATCH] arm64: dts: renesas: r8a779h0: Add INTC-EX node
Thread-Index: AQHakBRpoJ4qEo3At06sDgSN3biYzrFsE9Gg
Date: Wed, 17 Apr 2024 07:39:49 +0000
Message-ID:
 <TYWPR01MB110305DA3F6ADF7C2EB415212D80F2@TYWPR01MB11030.jpnprd01.prod.outlook.com>
References:
 <66aba473186df9a137e7f95393209b23a5916fd1.1713281889.git.geert+renesas@glider.be>
In-Reply-To:
 <66aba473186df9a137e7f95393209b23a5916fd1.1713281889.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11030:EE_|OSZPR01MB8274:EE_
x-ms-office365-filtering-correlation-id: 82e1b5f7-5f42-4851-e3e5-08dc5eb18fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ik3t1V4DcQxPg0KHukTrJysO2BS4+nPjzDvhGNXZF88Mla/k3YELVHlvvRSU34vvA0aTwkiqyUw2x9eDl9qMbtgj4qkSBF1H1Z71lfHOYR99fWPLkIhRSLnSmxZ98ukIcZ62xlDVvc+WLkZQqIXqj0lr6Dks3GIeRVkzHOgCT2UJA7Q35cjhCDxjuB3YU7R+P+RsgYkOn5GD1vCcriYfTX9+cEFtn5yhO08unSPkzjOdJFC4Pg4CBXoH+Kjf4/F+5Dr6EdGImQ9VwF/fM+aDl66W5/HNmlnEVCn/CEEAjH5gzEkjW4YBsuo3cMXbJGZgAI7DsSwofNlXY4WLSwSdHoTBHQgLj5KMPCe7IDt8Ow3I1sdpsJZn2f8R3eypkrwXD7IaJ7eIJyPeicG7DmiVsekm9nHSSh0ODvQSDifEto7nys0w8+CVi/4rfcmpSM8J4SHq49sj4debM94/QMlg9CHzQ9WF+Zg7KrpuvadJSUDcxqUqvnsgivVaFthZ7f352OBsjU52Qghebf4VOsXqrIOXeYCUJJdfCnOpJec5+o9QC+WaZovPLscfao4cWOdqKMrW/njnsn+DGhmgZxjGv1SUc4gKBn5c0sfpMqXmJURcOsNFMUlL131bTDh4TatqVRpF6clELPr3hL62i8OiWQQvz2uUMwFmDFlQU6mGmbesT1ccrgJv6NqlDgZm4bm6SXGOEU9lL7Y2d+FGPs1/tY8EQ1hF1O1CB0YdQ/IBtpc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11030.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aKNbuBFksl+b8EpXHpBCyhAjh8myyrOhLd7sGiTGk6tw6/a/66U1TXFy07fh?=
 =?us-ascii?Q?qeMLIlPiT2ihzERUEO1Bx0TQV4FHui3MKF0HwRkpXvMUebM025lxQdaY0Iff?=
 =?us-ascii?Q?ZSqK/M/wsjjbd6HMZ9i/KwTh0H38tLZwtigyfYh9uLgP7ODxsk0R2fE4z9GH?=
 =?us-ascii?Q?Cr3FQ6exdr4MDb+4rVbyWehJq28d898y79A/kADajeuiAj+HVVNbMzvNJDj0?=
 =?us-ascii?Q?GnAE03Uv8qp58ypN6XRUw3Rk5rShn5No+8DDJcSvyeO6Bmll3NK3fsUDLt5Z?=
 =?us-ascii?Q?baa4dq0t3RpGq/LOfOmXRROU8MpZUm6oYyRToydbxo0dp0xhq6PxuafTEehW?=
 =?us-ascii?Q?FWhRl5SPNgn+im+go5I/Il7ZIRXahSGo5b/sIibvyV7+VcZ6T7i428Aq5YWO?=
 =?us-ascii?Q?T3bEI5LF/bPVxtf2xLKjNkYodHIhatdW82IUpnhsqeZpVuBUiL2uM/EOmLWY?=
 =?us-ascii?Q?J7uz4pC9jXll4ebzDCq4VMccO7qTGuQdryHHyZqxfcYNlOPrpWdlvk11DORi?=
 =?us-ascii?Q?gpPQkE5hd+TVeSIamOOOosc5LwKX73PgaSJUQmVdnfluVs9naO+8ASVqDhGL?=
 =?us-ascii?Q?JuLt9fiemdfO9w5FDEW0mnFN7TEgvJP+M6cTczqJJMDgYEznc6L2W+Rx8JOo?=
 =?us-ascii?Q?irEzL9nEH+rU+X2Xcc4rlM+SAVcoJIzEzeJzc2IrOGa2nksVpYygRB5fGYbK?=
 =?us-ascii?Q?Vmo2y2lokzaApXjj1IKbwEeMlDjUG1VYjE2d1MsRlKq+iAF+Q+LpUn2fm0np?=
 =?us-ascii?Q?Tn4rFmiLCFfKgOWEOWEFRnikzG3Np43uwKKPFSXtCC7fGhaNBITuFDEkHJnk?=
 =?us-ascii?Q?ws6LOSOD4IUBud3a8z0O3jIWOL0LxbW/KxRfRY8FTrCFGQxW2pCHInFipC/3?=
 =?us-ascii?Q?H/kiiQ/M0mDfj6P3uGKHlu399GYyioPf6Dk9UPCZR68/dMhoObxwv0LNzywB?=
 =?us-ascii?Q?10dcHyarFndRQh61bln8s8pL52OAx1rcoQTJ6/bPYygV9Imb0hlNhAnlD8dT?=
 =?us-ascii?Q?cGGp6mmnQOjcTpQGOyBeC+d7ZKYQXE1w9FzuE7LYZRG4Qh/e26ajy0gGLj/d?=
 =?us-ascii?Q?Wv7pSJSPbz6naiV0UYXYRpnIe1M7rY4I+QFQPxEG19pqyTIW3TZcK52PpWut?=
 =?us-ascii?Q?3NaJG/FJrcDs5oArypMguUxh1lZdtEB/HHG5P+mOCGnX649SBH3JmqBg0A+r?=
 =?us-ascii?Q?rklhCt8nsPNV2PNq/XKqLPa7kahPVcfaOgBGrJrc7jN7b/MoUyKBXp8j+9wv?=
 =?us-ascii?Q?0cZmeEfcvoD59f/yCR+ITtXSi3rkOPhXlzuNxlGTQOfCaeC23YKAc75If4u1?=
 =?us-ascii?Q?WD43KStnEmlAo6Xi4qQToCUikhh8OXXoLPSu2s8BROMJ35BWReT+6TwQ5r/y?=
 =?us-ascii?Q?R8sSNHmlQc5VHgG4SQhU1ROP2SqGuhpb6/+YlU4DAIuB9mUxWUo3/k2QzPs3?=
 =?us-ascii?Q?/cgX5doFNLU1r2jaCn8PShHoE+F93EV7G/I3dvejixfOm8Z5R5BjpSMqNS4L?=
 =?us-ascii?Q?RzIRYA1xWDoO9/xTrqtePFaWKaabDq3nLjbgKEx6CIMTIgzP8N7Iick3t8d1?=
 =?us-ascii?Q?2toaTAyMuiUCgp+lMrxhNSl02HRvoJf67hc8k55G1p/+PtCisv1JYJZqhrHp?=
 =?us-ascii?Q?I3LX2AFWD4xeQB9oXTMUwizX2eJ3eKNimdL0rSaOMj/BBRfVwarBeqEAg78r?=
 =?us-ascii?Q?GaJDKw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11030.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e1b5f7-5f42-4851-e3e5-08dc5eb18fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2024 07:39:49.3020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OGGIEVHkwvRwHlE/6xdcjUBoJvkpaTe+uYTKyAR89n2T0tnEOPTzjO9/YPVnv/kjlL/x60dRWI9+cew7oHvnbpZ8hzBe5lGxcVMG2xRTfZrezYYIKhKnSsmudMIpZWP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8274

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, April 17, 2024 12:40 AM
>=20
> Add the device node for the Interrupt Controller for External Devices
> (INTC-EX) on the Renesas R-Car V4M (R8A779H0) SoC, which serves external
> IRQ pins IRQ[0-5].
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> ---
> IRQ2 was tested on the Gray Hawk Single development board using
> gpio-keys.  With the default hardware setup, this causes an interrupt
> storm, as expected (pin is shared with MD0).

I tested on the Gray Hawk Single board, and it worked correctly like below:
- If SW5-1 on the SW board turned on, the interrupt happened (as strom).
- After that, if the SW5-1 turned off, the interrupt stopped and /proc/inte=
rrupts
  showed the interrupt counts.

So,
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> To be queued in renesas-devel for v6.10.
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779h0.dtsi
> index 530219f21295f76f..bd3955316a88c8f2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -404,6 +404,22 @@ tsc: thermal@e6198000 {
>  			#thermal-sensor-cells =3D <1>;
>  		};
>=20
> +		intc_ex: interrupt-controller@e61c0000 {
> +			compatible =3D "renesas,intc-ex-r8a779h0", "renesas,irqc";
> +			#interrupt-cells =3D <2>;
> +			interrupt-controller;
> +			reg =3D <0 0xe61c0000 0 0x200>;
> +			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 611>;
> +			power-domains =3D <&sysc R8A779H0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 611>;
> +		};
> +
>  		tmu0: timer@e61e0000 {
>  			compatible =3D "renesas,tmu-r8a779h0", "renesas,tmu";
>  			reg =3D <0 0xe61e0000 0 0x30>;
> --
> 2.34.1
>=20


