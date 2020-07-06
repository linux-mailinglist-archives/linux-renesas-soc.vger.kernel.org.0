Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0420215AED
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 17:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgGFPkL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 11:40:11 -0400
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:39680
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729351AbgGFPkK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:40:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQOPXVzFDjNhcQ6DrD6kSxGJ8si9+hpseBBLkg9qnC8c4VpJEMNw0mtOcQgM4Uz/A577OT7G5ksyt0JY+XnBbIr7fjjT/mSXQe75blpC05mJ28CnAxenYqoIVb1uhrqBiO4ELGb9QVQtoNOYiguzFoVEuB+5xDj4aLqGy6qw8rkklVEbbXz1FlWqAImOj23IkBhle0FeVLaYnwR2+59aeL1FeCWk3+BcHMnL7/OQeTq8H0IfRqWpSd/fTfXiq3f6XYSAHGzeSeoE7WHnWAiWOB5JaSWf3JMWjHv4hwD+AjdGn8ljD8XzeLqgM1JpyYC1GupGHtrCSrc0Lu+8d0+gJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etFOnhP9QFYc7YONkn/opxXDNH1QmCEhhbMvJkzWJ40=;
 b=dbCzhHm3tr8o6Ygzo4ijeRVTdvXq9HJxL5D4UVdezwaAYFwoUsNO9rsq6rJVqi8QVkPsOlmVPah23X6/PSl8b9qIP70/zJ4o5ffAoozvFGtyTG/CdEYDVymKsCQS86jpGi38UaBOp7GQmcpN4X0HOdgDJLDgEoRm41GYRcwCFReVwNMJGa//oXff/+BeT5siBaHa5EmCYqSaoEziRK4Z09Q2QrVa2jw5+YHi7sCJWJuTj9voZO7D8uAzrwjcJB6w+OvQ2OJPYd0YOvx3jmPCJmUXux2C9eAI209Nu3kK983Itlp8r/gKRPkhUMxXb1IAeADpJxYBPAkQtAk+aNOhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etFOnhP9QFYc7YONkn/opxXDNH1QmCEhhbMvJkzWJ40=;
 b=UI4gLMKhZuptazJcdSZtMpH2cvfMe8lfbm6DKPwwAOcxImGMVZWmSR6U58JJ2t+7nYMttZW1xuXzSxWZjqF0NuKrSvnXnWuJqHbEBiUF3mwec7Zc9Sv66y9RWPDKPZ1jvs3k7D8XpQHSHCt/7TIcPHwZ2qEAYvg4Xw4CU7MWNEw=
Received: from OSAPR01MB2915.jpnprd01.prod.outlook.com (2603:1096:603:38::10)
 by OSBPR01MB5221.jpnprd01.prod.outlook.com (2603:1096:604:3a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Mon, 6 Jul
 2020 15:40:06 +0000
Received: from OSAPR01MB2915.jpnprd01.prod.outlook.com
 ([fe80::3d28:786d:6736:7a8]) by OSAPR01MB2915.jpnprd01.prod.outlook.com
 ([fe80::3d28:786d:6736:7a8%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:40:06 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: cat875: Drop superfluous phy-mode
Thread-Topic: [PATCH] arm64: dts: renesas: cat875: Drop superfluous phy-mode
Thread-Index: AQHWU6gYsNCNYQiRe0W33sV74LdVPKj6qipg
Date:   Mon, 6 Jul 2020 15:40:06 +0000
Message-ID: <OSAPR01MB2915D6529143D25E701E0A9CAA690@OSAPR01MB2915.jpnprd01.prod.outlook.com>
References: <20200706151400.23105-1-geert+renesas@glider.be>
In-Reply-To: <20200706151400.23105-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e10cbfad-c9a5-4e28-9322-08d821c2db8b
x-ms-traffictypediagnostic: OSBPR01MB5221:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB5221A52B311D5D0068DD2680AA690@OSBPR01MB5221.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: obr+zr11miud20DwrGVAQwkq3acvtQVPUO2VaBACiPMLYN5OdHVAuHWzoo7EI1yOphseyNXfzMBUVuQe1ra8lDDQddw2xNNy5R8GAtu9pFYC7h2bkR4rf016nWmAmLIjwuyknpCpPJp+tA2XefcTX2P4ap+Z+yS2lIjBcF83P48gglRB5sBzLVPsUw7a/QoI+yHSLNDdIcmnpSiyjpuguuqHRhyxUrzivAlV0KaSST1mV9LFDaLOuxjG+DTxwpYS3s7CN3kyclCzVZ72fAY2yqhYcyj09gd5U/FWLO66fPm3q76xUtCmZ1CnatpgHzjlAP6JZDryR2NI/gae+NXgrQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2915.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(83380400001)(478600001)(8676002)(86362001)(6506007)(2906002)(53546011)(9686003)(5660300002)(54906003)(316002)(71200400001)(110136005)(55016002)(8936002)(52536014)(33656002)(76116006)(7696005)(4326008)(66556008)(64756008)(66946007)(66446008)(66476007)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: wVwrUqHJsPEtxeqg6HLJwPaK1ToFAWiNCkPz+8pj7rUwenF8uGpPHZEzt3ruVNO0fGW+cawgslA7LGndfbRbGWWIHC2gaEv0t76h8JkKm6B9AjECJwOzxfGDvFXngjQvD9i7Wx3zgFw6ckXmdGHp0oHhYirOP1WrRw8YDLA37DDUtqZku+HFuuY7MesPibV968l6RyFf1oh/UIMgjPUt4eKoIlvT70T1LXXEvvvImKPa8y393MvvaMEfzdz/r4dLyzj8FlEFlZfdaTMMSHxL/FQzchXQv6NqIgEftr9SgAkzvoIOHPzI13jb/KUh0RauyN42L9q2uNdiY0/MDxFRrbBHGjGULUPQYHjPE/6DlBkpuIXlRFwGiTS7i7g8HtgJqObIVyJvhQhjPJcpRhFaEo6tUGrwSHAluMeDRXhcs+zPWXMbbKpbpwYyH1OHpmgPs0rVvpYxvyfYK76mJ5XaFNfdyC7p7HVi9tljZ4Sh2U/gG7SxAger74U3uat6WiTb
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2915.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10cbfad-c9a5-4e28-9322-08d821c2db8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 15:40:06.1535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5F4oiZWD0Y7WLaZl16ddcZOnyhkJGCRXUVpVAy0rg7lun9wlMfqeaBaV58N901Rt9fvOgAc0PXLxQPMnEfeq1uil3Fm1pslpwoI/GW1T78sE4KQEyjsPfu3MfEFEjC8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5221
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 06 July 2020 16:14
> To: Magnus Damm <magnus.damm@gmail.com>; Prabhakar Mahadev Lad <prabhakar=
.mahadev-lad.rj@bp.renesas.com>
> Cc: Chris Paterson <Chris.Paterson2@renesas.com>; linux-renesas-soc@vger.=
kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] arm64: dts: renesas: cat875: Drop superfluous phy-mode
>
> The PHY mode already defaults to RGMII in the RZ/G2E base SoC DTS file,
> so there is no need to specify the same value in board files.
>
> Fixes: 6b170cd3ed02949f ("arm64: dts: renesas: cat875: Add ethernet suppo=
rt")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/cat875.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
--Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dt=
s/renesas/cat875.dtsi
> index aaefc3ae56d50960..33daa95706840037 100644
> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> @@ -18,7 +18,6 @@
>  pinctrl-names =3D "default";
>  renesas,no-ether-link;
>  phy-handle =3D <&phy0>;
> -phy-mode =3D "rgmii";
>  status =3D "okay";
>
>  phy0: ethernet-phy@0 {
> --
> 2.17.1



Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
