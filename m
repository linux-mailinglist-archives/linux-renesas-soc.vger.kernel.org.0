Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF1129A70E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Oct 2020 09:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509560AbgJ0IzN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Oct 2020 04:55:13 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:42816
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730933AbgJ0IzM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 04:55:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+ar3CFzLsO1XkNl1y67kA47TfPyEwTtsfn2ItrhbJw91yBK6c6bSG1SQQtVgBPesbvhW5vOBBKezpHzuFT/+OVsbGXifj0jFhJu160UvdByaS0vUjYSRYmlv0/97mB+7hrB/ksgdeSI7K1RTBrzJ09wgAmCpwmxTmcRmMrZjSEVDW4w0kCwjlW/M7B4LF9+VC197VsKMGGW7E39WhptMkMA7s9tWKtvejXvpxGngh+iH70v3MBHBSKqqC/BXZPZa2+quxLNtO6mW5G0gPuil+15TbGutbhqnV9v6nWAcF9J+B2FuPws1ncANQLGdjP2f09UcB1Ci8gaLG4EWwCQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8J9m3xgrFieUyky9ZODg3KG04Ry9BKmR5LZlAia8rqg=;
 b=A5IRhYT5O620fQYveBV770DPGF+JQ8RTkWqCz1RhVPwJurwKcIkdW3moPyzJ2rHoFBrJ71N7hshIzbnaGus/IybRxyWiGw8YZjmROn3/CEVPAibxwgb57NQPHo/4xueVHD9bH+jC9/fIORcmbciLyMqhP6nKy+ErARU0BCE17lex+6ZEYW+fa4VB7POH3/u894PN1eXVn6eqQQFEOi07vhCx1do9jI/kFZyXYuIzMyfyK21ZYYlT0uV8PzJeMfwddXIk0awQzSIARz7HRseev+wA2uezjEeBe6Eu1pzJKGbMlYRQrRNrGqoAo64GBIA+8DKccLoaz29LC48KYmvHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8J9m3xgrFieUyky9ZODg3KG04Ry9BKmR5LZlAia8rqg=;
 b=sswgA1yOzXR1FRlLVs34h+KOcgy6+kalftgikKVrfwUXYEIeRzpbmDsYdKvY0d19nnPdJcck7rUaDxaS1eZQH2Azo+bIDRmHvCY5yZe+30AvarrEzECazB73FTsK8SOn5x2qut8D2qlIhljqnlcQq0f1mXX+N1OS39PTVg26Kl4=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB4687.jpnprd01.prod.outlook.com
 (2603:1096:404:125::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 08:55:07 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3499.018; Tue, 27 Oct 2020
 08:55:07 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>
Subject: RE: [PATCH v4 5/6] arm64: dts: renesas: cat874: Move connector node
 out of hd3ss3220 device
Thread-Topic: [PATCH v4 5/6] arm64: dts: renesas: cat874: Move connector node
 out of hd3ss3220 device
Thread-Index: AQHWj1TaXduNzoObDES12C8wMbMyqamrXt6Q
Date:   Tue, 27 Oct 2020 08:55:07 +0000
Message-ID: <TYBPR01MB530965C138116927C529DEA686160@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
 <20200920134905.4370-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200920134905.4370-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [81.141.62.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c9441a1-4485-42ac-ba23-08d87a560139
x-ms-traffictypediagnostic: TYAPR01MB4687:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB4687EADFFBFE0F42ADDE780286160@TYAPR01MB4687.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:260;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sdhDs2qt5c6SUesfnI3GD57cSMdZI4V9uG5jyOJ5Xwzeac3uZCMuda2cFVOmLvk8ZQcWaiDZyhBBxRWjpndxFYhzN0ni2cnKWz1EHwagX/GarPTZm0ERkjXdQwHN9TvJwGrH1YrXt+XzxFXhStXbdXYv7VSh3a9aBRh+vDYWixlvS/spMuVFKmS49t74x07cMcMB98+jH44vCwFj4SBDU63+s6RrpHrzUiJ53JMAISAd0p8HOc6a9ElIQ5c4icbE21FkqycsUZeLJEEZIAbyJoXpusNN/2QDGc/sBLMFeMACQ0SPObUwyHjQzF7McHgTp2pglOii7sLK35SAInAhbdK0Kycz4mmQZy339lN8CHPUVCkkKn8wWNoYgzZ4exQzzuL5mkajG4vvmrgiESq0mA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(64756008)(8936002)(76116006)(186003)(316002)(5660300002)(66476007)(54906003)(8676002)(66556008)(66946007)(66446008)(33656002)(9686003)(83380400001)(52536014)(7696005)(26005)(86362001)(2906002)(71200400001)(6506007)(4326008)(53546011)(478600001)(55016002)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 1YJOpLqkA4ytFsnXkBCnu+s1+jbpZv51o9yfwh5tTIpznpa58YQFI9f480k8P9wCVOT3xkBnkClkJ53lqFD3FCTRoYGCmBxIDFUrE1Jrwd3N97arGNFwWNI5FOn0UxZK7BdjCMA4kjR6Yww+7lR1MWQGMgG0QwnpX3/CmSAgTUv478qFM0TyHgOcEuCVCYMe8difVjuCda2wnaJZPkJdxVyYRv+BBphZOhp3aDmF0F0/XbbhfHmXFtdMCiGMk+d40g5f0XNvPxVztaiG2x4K0zXmitSatpoAQhlDxcDKTZjyfPGI2ub2mxIP3ZdZpw2kRDDyd3fqyig+hMjOxUBHC0PMCpQCW1bL6XgnHNLKjkz+kBDHJqJ/BAY3t6y5ty9p8fsB+0Ub/H3Mv2oN7Vx4JUT9d+ByEwVJZ5Xib5041pph6cVvABLP54JZxBaqdVAzspNLjw9/iguIuFfzAk4rUjoZZtEmiBLDmmD+lKSMMCGQHQ5MxSVcsc3SkwU0AfSXINt0j3rIiT5KBxyRwoj19yd1keJPTGF4VHPzs6fizQhF4vWfWwpoKIU8ptCsG0aZJb+tCYm+vs6mzmMoOxP0eAt0fmb0AQZwH12RrejOX+eBwoiwGCmPlCWsHOmfSM1zDYr98FIgWp/adjdQQfl7uQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9441a1-4485-42ac-ba23-08d87a560139
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 08:55:07.7818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uI9BfNbNO9VKMkbcxtesGKx7Zbk8QBY4ByrfoH8htF3mVqKF1SPxIiZiGB+w2hK8Rjq+RB/xA9EOYL/DpqR9voBlQmw3pbGv9b2Pp8L3HYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4687
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

The dependencies patches hit on 5.10-rc1 [1] [2][3].  This patch cleanly ap=
plies on renesas-devel.=20

[1]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?h=3Dv5.10-rc1&id=3D588614be61b7cb46f697c3e141b2aef7f6b49347
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?h=3Dv5.10-rc1&id=3Da6806e32e7a41c20c6b288009cb6f30929668327
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?h=3Dv5.10-rc1&id=3D1c6e8ee63adbaf02a1e5177610fe9b77bec93d8a


Regards,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 September 2020 14:49
> To: Rob Herring <robh+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Magnus Damm
> <magnus.damm@gmail.com>; linux-renesas-soc@vger.kernel.org;
> devicetree@vger.kernel.org; Chris Paterson
> <Chris.Paterson2@renesas.com>; Biju Das <biju.das@bp.renesas.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: [PATCH v4 5/6] arm64: dts: renesas: cat874: Move connector node
> out of hd3ss3220 device
>=20
> Move connector node out of hd3ss3220 device in order to comply with usb
> connector bindings.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4: No change
> v2->v3: No change
> v1->v2: No change
> ---
>  .../boot/dts/renesas/r8a774c0-cat874.dts      | 67 ++++++++++++++-----
>  1 file changed, 50 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index 26aee004a44e..ea87cb5a459c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -129,6 +129,29 @@
>  		#clock-cells =3D <0>;
>  		clock-frequency =3D <74250000>;
>  	};
> +
> +	connector {
> +		compatible =3D "usb-c-connector";
> +		label =3D "USB-C";
> +		data-role =3D "dual";
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			port@0 {
> +				reg =3D <0>;
> +				hs_ep: endpoint {
> +					remote-endpoint =3D <&usb3_hs_ep>;
> +				};
> +			};
> +			port@1 {
> +				reg =3D <1>;
> +				ss_ep: endpoint {
> +					remote-endpoint =3D
> <&hd3ss3220_in_ep>;
> +				};
> +			};
> +		};
> +	};
>  };
>=20
>  &audio_clk_a {
> @@ -186,20 +209,19 @@
>  		interrupt-parent =3D <&gpio6>;
>  		interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
>=20
> -		connector {
> -			compatible =3D "usb-c-connector";
> -			label =3D "USB-C";
> -			data-role =3D "dual";
> -
> -			ports {
> -				#address-cells =3D <1>;
> -				#size-cells =3D <0>;
> -
> -				port@1 {
> -					reg =3D <1>;
> -					hd3ss3220_ep: endpoint {
> -						remote-endpoint =3D
> <&usb3_role_switch>;
> -					};
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			port@0 {
> +				reg =3D <0>;
> +				hd3ss3220_in_ep: endpoint {
> +					remote-endpoint =3D <&ss_ep>;
> +				};
> +			};
> +			port@1 {
> +				reg =3D <1>;
> +				hd3ss3220_out_ep: endpoint {
> +					remote-endpoint =3D
> <&usb3_role_switch>;
>  				};
>  			};
>  		};
> @@ -405,9 +427,20 @@
>  	status =3D "okay";
>  	usb-role-switch;
>=20
> -	port {
> -		usb3_role_switch: endpoint {
> -			remote-endpoint =3D <&hd3ss3220_ep>;
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		port@0 {
> +			reg =3D <0>;
> +			usb3_hs_ep: endpoint {
> +				remote-endpoint =3D <&hs_ep>;
> +			};
> +		};
> +		port@1 {
> +			reg =3D <1>;
> +			usb3_role_switch: endpoint {
> +				remote-endpoint =3D <&hd3ss3220_out_ep>;
> +			};
>  		};
>  	};
>  };
> --
> 2.17.1

