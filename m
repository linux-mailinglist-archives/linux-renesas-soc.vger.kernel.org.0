Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCC42A5DB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Nov 2020 06:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgKDFXX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 00:23:23 -0500
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:31322
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725535AbgKDFXX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 00:23:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwBbD+dcqbC08WOt6gTR8Y8+EgzO0/XdZNPwr+IXSgzmLePQ9IolmSsLqbHEcb+O4XL0wlxi/1jHyloPHkA+Rwfi8M26zkxc6+Z63NR8KmcfvZQAOtgiQpj4obWDdBRYr4IUyTitxI9g3YTfjN9OI5LLqaBGVNwOg/iuFNfwEzLMwAZsSzjjXl5d4WIXIeYq/Ry6BSvz+JLhGQIZEiHGy8Ciy8lzLbSorKIfdCsap0Wkld1CBIuJQvYARu8UFXVfJKDqsMvGARC7aVX9XBU509xU7ebE5li0coOt5YmyGGlV1uNZDy0z8zK+ygQlxDAZwyNusEJPQkuV340Afei6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=484vJHUGh/g52HWPj4lbp/yGnBs/6OMrJCXF6VaC/fc=;
 b=Om8iso0u378AifsVp3eBOzSkUyL4R1OdNyi5YaSsmW12wjip5aLF4H/RxE25q5IFDdZILvuLzKgFsJUlbjk7mQJiQSrKnggDtKZb1t0l5o7D3TIhnJc3P8gmEYNQiNFSDYqtZdasXRCpLVGBN04nvIPdrp9MX3629Wely0o+U4lhyq1QboLMYV2Qo7haLRDLcDysVae1Kcq6Oc6+g1oi0LL9yr5dEhp+Ccsl2Xgerwj0928R6Vxq3AaPceL4Jvdz/MaMCiEX57tkXivXmOaqqZgfx0q1QhoqYIhxML5VFuyftesxme7gqtxdKi0iIcjspJm6T6JLyLl16NKPZ00iPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=484vJHUGh/g52HWPj4lbp/yGnBs/6OMrJCXF6VaC/fc=;
 b=i2nN7egjuuH9EoPG18m3HJoyCUJ+WfqBYxGTpEvVecPS2O4XvYU72elTP0Cyz86+XNf0NrUPoFMAJ6IDDlvbF0g0ZepZ0Zb0+1vc+xUv/iEIZx2+EQ/OON/yqc9cliYVVfTSV/SUXltu0uTPkP4vZui/VLHOqx4QKaEIkyoUaA4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2400.jpnprd01.prod.outlook.com (2603:1096:404:8d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Wed, 4 Nov
 2020 05:23:20 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 05:23:20 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: RE: [PATCH/RFC v2 1/2] gpio: rcar: Optimize GPIO pin state read on
 R-Car Gen3
Thread-Topic: [PATCH/RFC v2 1/2] gpio: rcar: Optimize GPIO pin state read on
 R-Car Gen3
Thread-Index: AQHWrpTVyYB4oHnAg0aJq2Ku42PxU6m3dzBQ
Date:   Wed, 4 Nov 2020 05:23:19 +0000
Message-ID: <TY2PR01MB369216B8D5E8C954C33593BFD8EF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201030081522.2297074-1-geert+renesas@glider.be>
 <20201030081522.2297074-2-geert+renesas@glider.be>
In-Reply-To: <20201030081522.2297074-2-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:184:fa7:6262:a02c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 876318ff-e44c-489f-9cca-08d88081be13
x-ms-traffictypediagnostic: TYAPR01MB2400:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB24006B4E4C4C1141B30DE583D8EF0@TYAPR01MB2400.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J5rpPNkSjDxz6ZK2AohKudFEIUfL59IUztse3bh/C0WSzBiZ3OFO0fMVtM2VSVhexq+BYVwsLzey8ybH9/lmDNtTCswUxBWfECoCB7t/7cgp94T8Y/ArTauSb0B1O+/ysW9K5Uug17TAflcVIdIB5K0TmH2qosn8D/a6oLYwADWFA/x7nsaYm7f7/Qo+mN0uapyIfhiDgkW5fm/5i6BCliFDt/uTTwKuSPPEjul2tE4y8jnegoJgv9NBpjGB8PJ3I1uEAVDS3Y/YNcFQGfBno9EPqqrWhtFngtWVXkwIc4PxMuoAZo1lKWKoa5cMQzAu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(66946007)(9686003)(55016002)(66556008)(186003)(83380400001)(66476007)(64756008)(66446008)(478600001)(76116006)(71200400001)(5660300002)(52536014)(7696005)(86362001)(6506007)(33656002)(8936002)(316002)(54906003)(2906002)(110136005)(107886003)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 7pDAPSUMLsTX8AvEwA3rE0M6pLDv+oEjBWZ0pSdKimkKCzXM4oOMTSlZU1myXrn3zRusV2lvF3hxCuCqpNiNDPU7Nb/FU3/NUYiJKKQBjhHNPMyIOhIGsBqQwrHk/dGSqjDYy/dmr8Lh3OzmJEBlGX2ZbtvsiHKF4/vYSU4a5Fq4VXf88QqoA8uCacFKZiUc9ik85NQWqfYtJ1JTkuTlMoQuk1QqOYHuUCR1JhxgRXS1sIEO6whJSnFOkY+1lBvcWVZ+ZK1xK/3Ub7QLtdvn1G2fb6Q/ItV98sbNWlY4S3gYs78Az+8cd7dViNx+gILrcVdpK2noTYAAnzHqWqt6O92dU1HQ2wg0VXNj4thnAWzXVp1I3aTNQhAUq6fmOleuz5tiloprwpMhMSKgiqJmH5jv1p0cDkXX6wN+n1gTqh44/S3+agwXoMfso92LeIZIubIth7rSiG6cmZ0UozSAHr3P1JdS18dnudZzm2Oz6bKiO3fkXDej6W99aOJyJ9Zki6gpqUfcv4k8yaiJH6OugbH2cJ+2aHHHt8Ci83HFxsQlpgmDuu3W+mRAzaNSVsP4b4faI2ji3uTfGnEm9FBvscYuo5tEissnCHxx0NSFMpPGT7HtJGwoFt9A/5sHxYBTJ3ozjhNVEsyg9jcTjJMvHHH3YKqagPnhHUjtpl5WSBMvbkvbHrrD1dRJb4VskCHo
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 876318ff-e44c-489f-9cca-08d88081be13
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 05:23:19.9498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBgfI1V9VgcByZSAOSeMhkBvv4pgYN6x9MIsRfE6WyhlVE10si9Cq1ZeHAWONwG7SW5eIatXoan8UFOG1DtKkhNANfDmy5jZVYRLksCJ+Exz0rPQzQWX8/WKwQpZ3muU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2400
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for the patch!

> From: Geert Uytterhoeven, Sent: Friday, October 30, 2020 5:15 PM
>=20
> Currently, the R-Car GPIO driver treats R-Car Gen2 and R-Car Gen3 GPIO
> controllers the same.  However, there exist small differences, like the
> behavior of the General Input Register (INDT):
>   - On R-Car Gen1, R-Car Gen2, and RZ/G1, INDT only reflects the state
>     of an input pin if the GPIO is configured for input,
>   - On R-Car Gen3 and RZ/G2, INDT always reflects the state of the input
>     pins.
> Hence to accommodate all variants, the driver does not use the INDT
> register to read the status of a GPIO line when configured for output,
> at the expense of doing 2 or 3 register reads instead of 1.
>=20
> Given register accesses are slow, change the .get() and .get_multiple()
> callbacks to always use INDT to read pin state on SoCs where this is
> supported.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
<snip>
> @@ -302,9 +303,9 @@ static int gpio_rcar_get(struct gpio_chip *chip, unsi=
gned offset)
>  	struct gpio_rcar_priv *p =3D gpiochip_get_data(chip);
>  	u32 bit =3D BIT(offset);
>=20
> -	/* testing on r8a7790 shows that INDT does not show correct pin state
> -	 * when configured as output, so use OUTDT in case of output pins */
> -	if (gpio_rcar_read(p, INOUTSEL) & bit)
> +	/* Before R-Car Gen3, INDT does not show correct pin state when
> +	 * configured as output, so use OUTDT in case of output pins */

nit: checkpatch.pl said warning as the following.
---
WARNING: Block comments use a trailing */ on a separate line
#46: FILE: drivers/gpio/gpio-rcar.c:307:
+        * configured as output, so use OUTDT in case of output pins */

total: 0 errors, 1 warnings, 72 lines checked
---

Regardless:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

