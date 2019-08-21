Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5649770E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 12:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbfHUKWo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 06:22:44 -0400
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:11968
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727776AbfHUKWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 06:22:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRBwNishRbZJnOKfv4zgbJa32GdCD/fNKC0zMBSjkrcb8yH6wSRHTZcKK1TkcToC2ERcgtsobSkj2fy+kYiVqnx62xgo75uc4XZCWU5LSt7PJzloG3y9l8YleNYnB4nAeSQWEgctyCkY3CjK/+pe8hnnifNkAOxPJiF0+R2X3SsJAnzJfLQHRR/WWjGEJvGa0vIlaw3sd6+zGFqjrXB19VtNMM7cH/y1PQxSKzHfg9kCaUc75qI5skxoEUzFiSyCFrN93Q6pvrS6E75wgTB4+oOvP/3Yguxs89dcaHCoe1563ZzC0pE4LJU1vPrNdCP81VPdEPumAnAAQ5EM5R7Wew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1qO9OWRYNg5vUoawKVb2R9GERd4sd1BrxR1XWdHlDs=;
 b=IYBOy6+V6Lns9O9QDey4j60jF2qXA9jNCZEXPTHt87T5CCWdHWsw3KCHYbNhb7fjmc1ncI8lh0RSpO+7rIiPlTnHu6+qaWevY/2rbD4oIUfEeCYegHrqMHOzKmEZ/OcQlXAuOB0wO5RAEKVtI1lvLDZEzAjlJNf2nXnBX/9yZ6WuE1NObM3BcDlsEcyIM0bvERVfYwjEonAZqcWqJMNiZWmgz9BaLrbfQj7034GRFnzMoMe/ZfW1waCBOFhzcUv1JJwcLP5vn0TfdcDqRZOFUrTWpUUdfgEvV8UNP0j6HABcD9LU0MfX5pi8eH/NuTgvvBPq5kOK8JQ0qhRUjXZ7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1qO9OWRYNg5vUoawKVb2R9GERd4sd1BrxR1XWdHlDs=;
 b=MkYI4XFjHPkWvMJuyHgO2Q4k3QaSz9eBkQrBlC4XOFPxB1QMPJulC28lAbjstnc+vgR0hYddwEFgSTmw60NDLsUPkSglHtyl0ZrpCzvDYSgL/YPFl72wuB5Ph3tiSohjkaqbiQipLwL20dwS5No4y93+SprwFtXeMQwHc5A2oYE=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1708.jpnprd01.prod.outlook.com (52.133.162.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 10:22:40 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4409:a3fc:419e:8efd%5]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 10:22:40 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0: Fix register range of
 display node
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774c0: Fix register range of
 display node
Thread-Index: AQHVWAbemAQGZ1xOO0maGl0/c+tfHqcFZEjQ
Date:   Wed, 21 Aug 2019 10:22:39 +0000
Message-ID: <TY1PR01MB17704454A598425494F18426C0AA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190821095732.19001-1-geert+renesas@glider.be>
In-Reply-To: <20190821095732.19001-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba6c7849-53c5-401b-3329-08d726217f06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1708;
x-ms-traffictypediagnostic: TY1PR01MB1708:
x-microsoft-antispam-prvs: <TY1PR01MB170899389FEA5BC945AC397DC0AA0@TY1PR01MB1708.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(199004)(189003)(44832011)(33656002)(55016002)(6436002)(7696005)(2906002)(9686003)(86362001)(6116002)(3846002)(6246003)(76176011)(66476007)(53936002)(4326008)(76116006)(66556008)(66446008)(66946007)(64756008)(8936002)(110136005)(14454004)(316002)(229853002)(486006)(11346002)(478600001)(25786009)(102836004)(186003)(52536014)(71200400001)(476003)(53546011)(6506007)(26005)(305945005)(74316002)(66066001)(99286004)(7736002)(14444005)(81166006)(446003)(5660300002)(256004)(8676002)(71190400001)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1708;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4YuYql2gZvWHAUeAjtTB+MHsdsrWX/efHfMik8GSb7c6lZdODbSdTYlo+N60JQTd+GwQce2Idk3VMBSyk/JrmJWsxwkggBdYULW5Ck7hTcD0mw1MUDQxVRPd4FxomSttEfqlwjy+8mqhzhJBuB1YMwQIePcFUpMBw7pFhDi1hOhCtGJzzg7LtIowvCGVD/5lE+fXk92jlcWztwAz9xNNzCM2pf3JHZhKVwn1NSGGwqQnkxqgfP1N1Xg+9eqH5l9IeDh1pafYYwGQGKe1uRfD4IA3y/zvNyuerLKwhwO3BzuN8AugZAhYD8/iI+tWUpjElBme3G7m3aZVO7d20cDvYIZ+N32LokC+0+pQhUgrzuB1pi6uDB/RVFpS3QnbNRZ51HZ4KKcS26FOxUnWNueL/z1laUjE747NioCEE4paSzM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6c7849-53c5-401b-3329-08d726217f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 10:22:40.1664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vY23IiqEIa0a9zKNWOJP1A48xBzwR9N053ByhJ+eRZZD+mCW2Xy1jxlri6VdLqcMpmCINVg17RZxv0PepxFY0UlSjR9L7fAz/bguExqHmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1708
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch!

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 21 August 2019 10:58
> Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix register range of dis=
play node
>=20
> Since the R8A774C0 SoC uses DU{0,1} only, the register block length
> should be 0x40000.
>=20
> Based on commit 06585ed38b6698bc ("arm64: dts: renesas: r8a77990: Fix
> register range of display node") for R-Car E3.
>=20
> Fixes: 8ed3a6b223159df3 ("arm64: dts: renesas: r8a774c0: Add display outp=
ut support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774c0.dtsi
> index 5ce1eb4596f54043..4ee885e7678886f6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1805,7 +1805,7 @@
>=20
>  		du: display@feb00000 {
>  			compatible =3D "renesas,du-r8a774c0";
> -			reg =3D <0 0xfeb00000 0 0x80000>;
> +			reg =3D <0 0xfeb00000 0 0x40000>;
>  			interrupts =3D <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&cpg CPG_MOD 724>,
> --
> 2.17.1

