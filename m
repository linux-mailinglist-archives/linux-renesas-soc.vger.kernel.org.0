Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9735142C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 08:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243393AbiD2HCe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 03:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbiD2HCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 03:02:33 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45297BCB64;
        Thu, 28 Apr 2022 23:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPjosj9B6TkTMh/9678+fY7WuBqmYSg0pVQGrEDPqERhDPI158oIxTJnCRbkchFPJvdN2r2wwJRRfG4xIDO99jVX6P3ogtQchb8OORnvBFHoIDY2wwG1k/4txoJmYv4S2T7mOzGTfZqGEdlNF+dxfEMT2/LmjASUuIkPUtfQjbM0Sbdwixcr9Jqitm7nvCryf/Wrp3kHXgxkNHpmdVNh8IpmlGCOD5htP9a3ubNejkaY5pCuQ/lHPFxxYVmPdWbEcjnpUvTPbf/a1PRFLz4OyEALuCSaV6/vDIovPqzaGikeygsh9OOC/zDD3XPYz5lFAl+bocGW2wTTm97KP6BxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSXVy6A4fw6K9LyBt0zzTUdjDWKHwd1f0MwBtyCJzes=;
 b=DHn66kXUhNkstAFBzzH9M2gODvGfvTWQvNIIgYh9zAlf5+rX/mtkW9hd8n0iXNd51X9wIt4lopxbjL2OYgGlXpVBWWwG2qYV+NnYS1OoPragMlTDUAS8g4ZFcsbIVqrSY75SvDdSIId6aKwmW+DBrJjZOmF0LcTLLzDEnfKByZ69QF6nWYAInvmdmT09y2Z9BtqpSLxlO0AuNZ8Vgqhm16cmopd21cztIaoX9UmSS8BWbrqqcXvbDNvo6uzaxJJHyS+QMcz9OJVF6ZFZpPPqhn3RLhgqnP2oNVRyUqYkQ+YfIPROAl83AVyhaTgJruIgwLdRFGydWyiW8VQEvWBVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSXVy6A4fw6K9LyBt0zzTUdjDWKHwd1f0MwBtyCJzes=;
 b=hH42gno+hfbBogBQ4Z3eHZMcIY8XVPAj7VLFv76uUJIYtGc3kwn4E4OslkU5QefP0xvq/HXIIhppoK9dLFv0Hd5gdZmJuXycAfy8bx/7woZS3X1Azr4KgNJP9fxQXLJpfkDALXL3uGSjOKk+7gSmPt3aRGBGZbQFExDUvGfdPvg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB1681.jpnprd01.prod.outlook.com (2603:1096:603:2f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 06:59:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Fri, 29 Apr 2022
 06:59:14 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/3] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
Thread-Topic: [PATCH v2 2/3] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
Thread-Index: AQHYWxvHp3anAMc+pEOh1cpyb8y3U60GdeIA
Date:   Fri, 29 Apr 2022 06:59:13 +0000
Message-ID: <OS0PR01MB5922805E62844963436F505686FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220428161932.20370-1-biju.das.jz@bp.renesas.com>
 <20220428161932.20370-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220428161932.20370-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df2e7ff7-213c-411c-a169-08da29adc524
x-ms-traffictypediagnostic: OSAPR01MB1681:EE_
x-microsoft-antispam-prvs: <OSAPR01MB16810CA9104BAE733F29720686FC9@OSAPR01MB1681.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BrWbW7nUEZoK2VU+hJqK5skPqXyJF06HLrgLvNVN/0xqkw8dzRXJDObl5r3/KzcvkZO0vLMNfK4nFfs/2+wJUQ2KeK56wLr/+U+QSzhOkAL0Y9xi88t5TkC/b5uP+vY832azbJ3M1VY4lp3pj+PjtnkcRX180UGGy3Kn+9lIG4RNdbSxu3AeRrUY8U8gMA45C2okM6EPWSHcbhMEGAHPB21A4dqecQnrHg+l87T+4C5MAsVydY7Uszky/8FYwAKbSru6mcaKAlxncCb19NLpINgMsC4nzUsL96lme6sdVSIhOeOxNomiIQMIVaj1KgcPGXkZOhNb0ZMCERuwNnWHDDCDFZ/TKcEsbzLzGaYe/eMeizsfCE7VCFcnv7JfOdwiI9PuOhLU88wc4zXNZfmH1/z+gVhfzmbfyQTeskYeYD+x5hiG7jB4B6g6bnVSSlD0qWrf6C1PVi+fwHtyz9h2Cp5h0PW+JFSbqwG0yGrjTJTmMOwFr/dfYxL2/fkd8HgNwB06/mMJqLjCAWGwInJzK62JezLxaLROaMjGmfUMJOQ+rnsey5TW9jXsOLM1GVnkXcGVijmTdSiTzU59TuA2P84L4omZx4nz11kuW64XM91AtotOldwQil4vKdHy+WpDPJ4PWowPISX3DWPGdSNQ/wMPaLPpa1G323I5LhRYAwHVrfamo5PdXqhgZm91id2sj4VL17gAkwf4D03jZe8igQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(55016003)(33656002)(5660300002)(4326008)(2906002)(64756008)(8676002)(66476007)(66556008)(26005)(52536014)(66446008)(66946007)(8936002)(38070700005)(122000001)(38100700002)(9686003)(316002)(76116006)(83380400001)(6506007)(54906003)(186003)(110136005)(107886003)(7696005)(508600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O6y4SkbuPHeVGvb2YLq1qoysHwoD9a5EXoeOQHoItGgFyIvZgM+947z4PslC?=
 =?us-ascii?Q?7DMnHt6DfXr1dZ4drF4fzYLnb1X/57DBBGi5xyz0xbt06sEn4mpT5SOx4rkq?=
 =?us-ascii?Q?99itvmh+sytaSk7FW2vZXsoa7CDrXLWnkKk7oLz6EEneHn6KxB7O2hgsch5h?=
 =?us-ascii?Q?ILAaG8QyxIVDfZEK0NE7PhLLNVBABtTByXd90MhkpcpHhkRFGspd9S8/bMNs?=
 =?us-ascii?Q?dtKvkulAGLcqafc/byF/m13177k8wxmViSMWIVRW0p5CVt1tYcsAc98fHGFK?=
 =?us-ascii?Q?jwxHTMk24/iEXvJKShuLYqD7PrAjeT6NGCteSg0aXxeFlrrsKvcwxwxwtf0A?=
 =?us-ascii?Q?IQehP2T27g2zUYWUL9PhGUqO/C3WxYcW7Xb6u9JPGWXiLEWtfbvv7WORXvp1?=
 =?us-ascii?Q?U81OARajq/dDSs2Ld6QWL7kajAKMXT1bcPoTcFLlzB7sro4W3jbgSSaYC8/K?=
 =?us-ascii?Q?WaUoTT0penudNXKy+xIYRh0tbQVsTMEX3FsJG52PmuFH1iq1TyaXnEWyvXD7?=
 =?us-ascii?Q?HH2N+KZdx0pd5DWidmuA0voxdTNnr9OIe01iwS7tZ6UCPvBmeh3dj0JFg7Tt?=
 =?us-ascii?Q?g0lcUNGPGg6k1MB11WDhCqDHcoh+pf1ls6w//+SNud7A7JGTyX+0zyj503+2?=
 =?us-ascii?Q?BanCqT2a9b+FnibZd9Wow7EmlDC4/to4bEhCB2O8iD6KY0Kr9Jf3AkTA/OSc?=
 =?us-ascii?Q?DF4b1z69XGn5U+DETQPjXNKvategiPGAMbt/Zu5kgTzfyVVSI+funRcnxDUi?=
 =?us-ascii?Q?haytGYn04/PwmWL5y+PcJfi78RIIMRDLIW8u9cWmzrCgB7HAM3dr3pewYjzj?=
 =?us-ascii?Q?3Vl8iNLQJ+i5jwY4aIogPqRsk4m4iSYtNoqM6ZT+fEZUeAXMOu07LYeydDBD?=
 =?us-ascii?Q?chDch6X0AMQi5VNKlLDzluRwM/WVXZi0gR58tvYymycCx6c1W+TVLmejBB5h?=
 =?us-ascii?Q?DZ8Aeykr42EyRjrcXgOValubkSa8ru0TQOqz7MnWMzloOhE/37rq2AqkOIQ8?=
 =?us-ascii?Q?6puZd/mFCKQsli0n5Ml3ElV9qH3dG/Gy58p7nT6WcW2Wk/bCC2j5WGy6D/Km?=
 =?us-ascii?Q?E0irGKIimzZwJfJsvi42SLD8ByiOruvoclbIVhQJuLnHL1Va2/ZWlLMpxN2F?=
 =?us-ascii?Q?VPRebh2VNB3GWA2ojX3wRw0So9TfKmt7Ey9GPGw7UUFzRbheR+smT3Ik5olV?=
 =?us-ascii?Q?z64xbWx8HAXtWJdVvwzoh3TywXh9OqUGSxctAB8FskeJiZHuDSf1t+Y5Irw8?=
 =?us-ascii?Q?8lkdFA1yVaominDZ2HQU4RVI5nBlZg+SE7xQYSgtmU1E/YwGYm7fhtXk4aO/?=
 =?us-ascii?Q?dxf4RY/KBcvYFcYRKBxvV83EJTUrjlRXpuWIl1fok7Ls//2E95go6ZpmWrsg?=
 =?us-ascii?Q?6alhM3EuWT8A4xseia4qPfuDXKTx9329crb6uHNQ7VCp7cYAOBnefU+pq4G9?=
 =?us-ascii?Q?u/e2g4+robplTYSsfVCE0wp3rMB2MBBJysC5sQxGhXRi4Vo9c2ewTKkNTgb+?=
 =?us-ascii?Q?cgM1WRNUhjeKSf90bpQA1TpReRMrB5SlbWfNR344q5U3ZPc4D2P1OvGTNFoD?=
 =?us-ascii?Q?boT1pp35IWYZ72IijuEjyOo20ZW3RTzVpFPTaix3Vu1AYdkps8BCBXcCDp8o?=
 =?us-ascii?Q?L/ovu784k/0Hu2l5dypttQMxLmUeZtZkZxnhh+fU0iYLn+OryLtMLmf1puXI?=
 =?us-ascii?Q?M/NhvXmlY8BgY8rBLZPkuBfWIhJx7tqGkzSAHBT3RmCds4d6BJKdvISXN903?=
 =?us-ascii?Q?sfiPwgwWYE7J6gQ9EM1My09X6ghgCZc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2e7ff7-213c-411c-a169-08da29adc524
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 06:59:13.9471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Ytn7oc83d84sgP7d52NT+LJhuyuSW3Rk9TwBL0u5FGHQ1jaB4MQ48MTSvSMqWG9Zptpy9nZHQOcavtmsA2bMCYIuLryH5KArUubU7TrJP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1681
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

> Subject: [PATCH v2 2/3] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
>=20
> Enable Audio on RZ/G2LC SMARC EVK by adding ssi1 pincontrol entries to th=
e
> soc-pinctrl dtsi and ssi1 and cpu sound_dai nodes to the board dtsi.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * started using cpu_dai node instead of snd_rzg2l in board dtsi.
>  * Added rb tag from Geert.
> ---
>  .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  7 ++++++
> arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 23 +++++++++++++++++++
>  2 files changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> index 17527184ff2a..201b70150e01 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
> @@ -98,4 +98,11 @@ sound_clk_pins: sound_clk {
>  		pins =3D "AUDIO_CLK1", "AUDIO_CLK2";
>  		input-enable;
>  	};
> +
> +	ssi1_pins: ssi1 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(3, 0, 2)>, /* BCK */
> +			 <RZG2L_PORT_PINMUX(3, 1, 2)>, /* RCK */
> +			 <RZG2L_PORT_PINMUX(3, 2, 2)>, /* TXD */
> +			 <RZG2L_PORT_PINMUX(3, 3, 2)>; /* RXD */
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> index d75ad79ba804..a97c8781d223 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> @@ -25,6 +25,10 @@ &canfd {
>  	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
> +#else
> +&cpu_dai {
> +	sound-dai =3D <&ssi1>;
> +};
>  #endif

Looks like this guarding is not required. As below one take care of it.
Will send V3.

>=20
>  &i2c1 {
> @@ -35,6 +39,25 @@ wm8978: codec@1a {
>  	};
>  };
>=20
> +#if (SW_ET0_EN_N)
> +&ssi1 {
> +	pinctrl-0 =3D <&ssi1_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +#else
> +&snd_rzg2l {
> +	status =3D "disabled";
> +};
> +
> +&ssi1 {
> +	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
> +	status =3D "disabled";
> +};
> +#endif
> +
>  &vccq_sdhi1 {
>  	gpios =3D <&pinctrl RZG2L_GPIO(6, 1) GPIO_ACTIVE_HIGH>;  };
> --
> 2.25.1

