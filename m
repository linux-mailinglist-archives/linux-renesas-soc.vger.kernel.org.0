Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D520929A70A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Oct 2020 09:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895151AbgJ0Iyc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Oct 2020 04:54:32 -0400
Received: from mail-eopbgr1300133.outbound.protection.outlook.com ([40.107.130.133]:6704
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2895135AbgJ0Iyc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 04:54:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZ/dsM31SOvzhVpNf0Zjhwv2TwPg5NSDVidWn4wuZoczGseR1rcvhVpHmMl+Lb9YRNQmg3sq6ZlWl6xO606/g0AGJgADheyW7/xZS84/NCSdLOOGOarV6uzGFk9YHCgrijcHYykjziIUESBuc+J+qUPcb0R3efngcESDP4ZH1kWje5OMih5sBuH8PdTj9yu2vjyjHsitGoXysoQWS80dPi/KCYRlOFMSIl6gxqpGqVsk/dlNpxnj9RuvgxFGmtGI/Q2Fi9Cv7Bt3UcoTW9DSMydGczPs2SeWrBUpJWcFEXy2eCa6IOuPeMAjnaV0ZCgi+tojiwu+SueAvmSpDk0rlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyxInbiysuLRNu/zRaKttkCKXYZtR4L6JIU6kamgFGo=;
 b=Z36mRdfXPEZWq1GgGSUTiMq+2rtusXUCAkUilrcHQlzVaEdw+aGBIPGhF7yVaj7HmUqYCMTdFNq4WbK8VmW0CJ2gIgs5EMyMuLD4BqPBt44fvmKlrlyjReDPry0s6JvShJbkUpQ2Z7tQKmGr0xAXGTrEzStFZnI6yDQAzpzCcW0x/R+GtKGIwZiQ93z7MCBnMm7fV+ONx/xyUeRSYhTp3E2974Xz/c2k/UAbx0F+LDYSCQrzs9J7wVUuAwBwBwL7M+HOS+TWe1lS2j3aAPwWwqxwYkzEVYo6j7YzjzXPmlHeaAt9XaCg6Tzazy5ciTz8xsMEybfCOQGOU5UDyPDZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyxInbiysuLRNu/zRaKttkCKXYZtR4L6JIU6kamgFGo=;
 b=Lwef7wAkkq3udu/2fBUKo6mgs9ENyFpaAkvVFShJDyoCeFuM9XKYVfcs6qkbc25ZIYa5EpKxJQyG9Cq1PQopGKE95jcUqXuLGSSSIvI29o4A9Z1IlskqJHZLSUbh4w5HPB+Y2LhEIxeGf0XNbli8M96IVaHwLoiuN/LiHKteKjw=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4331.jpnprd01.prod.outlook.com
 (2603:1096:404:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 08:54:20 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3499.018; Tue, 27 Oct 2020
 08:54:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 6/6] arm64: dts: renesas: beacon-renesom-baseboard:
 Move connector node out of hd3ss3220 device
Thread-Topic: [PATCH v4 6/6] arm64: dts: renesas: beacon-renesom-baseboard:
 Move connector node out of hd3ss3220 device
Thread-Index: AQHWj1Tcwh2pUiHDwEmlFyQoT8x5E6mrXabA
Date:   Tue, 27 Oct 2020 08:54:20 +0000
Message-ID: <TYBPR01MB5309E301D3EA84E56064B88286160@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
 <20200920134905.4370-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200920134905.4370-7-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [81.141.62.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f67c857a-bd3e-4b8b-1e6b-08d87a55e524
x-ms-traffictypediagnostic: TY2PR01MB4331:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB43317D46AC595FB5624389FE86160@TY2PR01MB4331.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2cznagziE7zgTTXcfAd+JjeHZpGzjPB99gW9JuOGtumtO0QLn0IPRJ6VS1QyPJHMSMQ0hpPB/TnndQkwgKre9CtSOutTxCkZvgKK4vHbobAvRDUcJ+QM3IO1nFyKM7K7ZEZTgXEs5a42h9AU8HmEEMLWmuriHNgt0skZCq5d7BFgSTg9Bclahuh48vQ0pQ/ZV+jSRHWbUMXZYz8M2kpiYaOZHHMtab6gzoMM/Z0gvlhr3RdylB4VU2xIGFDx8cZJegMR3OMkph3kdjU5RRH0ohq2AcOq/Vrhq2VWar/GMdB4aqphCRl8AXm+io4N5ODtns5O4FHwalq0hemHH9QycCObw0GOwOQclUlyCFispkda87IgMkC9C4x18mmOeINhL9o7tHBsoyqS5IJMEI6Hsg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(2906002)(8936002)(186003)(6506007)(478600001)(966005)(76116006)(66946007)(66556008)(26005)(64756008)(66446008)(66476007)(52536014)(4326008)(9686003)(107886003)(71200400001)(83380400001)(5660300002)(33656002)(316002)(86362001)(7696005)(110136005)(54906003)(8676002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Txuicw+e7Vy2WwpHARksg9m3SHWyKTUgCtk8okHpGT+K4Yy2st3Q2b5P0bYCHl/nAdxa99ecR6NYWn6BEEwMyJ0/u4uChQCs9jAhiKaNhVaTzK1lmgRAFkPZgeu6PsbkTX4DCYYNrqe3uhnyBnWfhVAYCO/viLSLfiwPaLBCopK2I/mvFJ/0foFwG5uAlW/zRgYlhHM2HN8nD+yDIStJo0b2/V7NoTJTYGir5TYw5867+cOpeKcXCRc32wDTe0jMMsWIuplXjeEeW9BDakQbSp/+KO+mkBwk66I9QN5vXhI2+UKoaaijUGLsqeExdpBafwfU3P10pOkKjWfi30NN86UqZSmm+Vr57kevh5lZbCFZ5bZjpLYVl/oXc3nwV0QUYXOm9uE1x+R7CdFQlt1QilcVgvcGuK3fFkwbYsiBF89eUj8/KbvMg0+Edf4lR+WmUChplOo+5Be6EVSBqSYTrV1jfggNpV4iRb34/dsIroILAY7fZK7BIzMH7qLhAbKQWyLGFPyTkcq81IfBTiH3bc2Wz08FAu9OWK8o+6FeTXUI5PSMPK78RLIfrvCdthArVLDXvkFaIgjvt5wvJhTdgw0CVo4mA85a6yDU8eHxZ498kSF20APihxageXYkgMWUaYkYwMfolvbbUErkxuuS/w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67c857a-bd3e-4b8b-1e6b-08d87a55e524
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 08:54:20.7326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdEsj4+Wh/Bg4NAhkvmRvCkzgM6X+/Muhwmded6+B0p3GXSj6unhPEmrQz7+YL81GfF/cRKHDzaT9YNn9qeOafxG7SHIFIi5nMRt3nnZq+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4331
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


> Subject: [PATCH v4 6/6] arm64: dts: renesas: beacon-renesom-baseboard:
> Move connector node out of hd3ss3220 device
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
>  .../dts/renesas/beacon-renesom-baseboard.dtsi | 67 ++++++++++++++-----
>  1 file changed, 50 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> index 66c9153b3101..e66b5b36e489 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -223,6 +223,29 @@
>  		#clock-cells =3D <0>;
>  		clock-frequency =3D <25000000>;
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
> @@ -427,20 +450,19 @@
>  		interrupt-parent =3D <&gpio6>;
>  		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
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
> @@ -714,9 +736,20 @@
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

