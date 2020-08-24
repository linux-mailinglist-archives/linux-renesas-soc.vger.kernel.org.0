Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09CB724FC8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 13:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgHXLaF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 07:30:05 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:6073
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726624AbgHXL3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 07:29:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQB0Wm/FATW6j/QJn1yxqTiApHJ/lUCEX0qxi3a74NhyiHg4aG+G6E/CCH14zS5t4tkCssWKF6/Rmw4q588kWNH51ptzV2xnMvgst0dq3sPMXuKC+K+YB8p1pfvQei7c1xDdv+lPC5VEuMayXVt2iz5GVG1+Tr9b0crB1tljfBgiUrYvsjZ/v8qFvFT5JCaMxy8yovNwozi/H06/6kvSiUOrPMrzO+0uEY7aSjltrUBBwdOmwpiFF9RnqAiMzTjSLqV/6IyEDe+Z+ocjxmE763iAWPOlCHgHN3wkidSiys3gxWiDfvuG/lDPUQeHpaYzG89KzmclRwAa0rwWR3J9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqUpWGuelzAn3KKgYhSMrdTnI6+0Gdqs2UfkuSHm9f8=;
 b=XusLZR/13Is7tmt/8kGjoMNeURyBn+niT/vaTUUk1EY6rRpX3UsBawsdn/9fDVrISjFfCMVgo6xTcapm56zJL2xK6EPQQYiNLqi57hXck07L019UbGfNyr60QMK3M91wsmsvw8k7Pkawfk/OQCeOgn5BQt5crInQr93G9YPV6ADKraSeSjeZ9Lu6JYJiFZtK4P3fFvEaCKPCfrToE/tBL905QgAl+wcvVBNXvcQf/L59J98FicjgRcvlQss92lE7LN97LdAfZH8CObzcFd9zi8bzjG23eXaSQitp7YKDOI/gBTZgXXWXrm4rU/jQyoKpGjYwxHW4SOGIN3QkSjcQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqUpWGuelzAn3KKgYhSMrdTnI6+0Gdqs2UfkuSHm9f8=;
 b=BRSLEHInzAo1Ycb3RYfrkstvteyA2QdnNmEolELOIlSAbZVZSVogx8nlUkdq5LQ7W6hLiXGaYK3krbWyyf2mE/+cxaqOzAIVuetIfe+f8b8h6qHNX7muzBySsfHGeX9GdWmMEEDiecspAfkVONdWxHSVGYiA2H3b3FZJ7f9yVBU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4205.jpnprd01.prod.outlook.com (2603:1096:404:cb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 11:29:46 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 11:29:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
Thread-Topic: [PATCH v2 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
Thread-Index: AQHWb7XJjorZCTsTKkiFFP/oeG3wFqlHMPDQ
Date:   Mon, 24 Aug 2020 11:29:46 +0000
Message-ID: <TY2PR01MB36928D9A5BF4A43429662BCED8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
 <20200811080227.3170-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200811080227.3170-3-biju.das.jz@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e4c897a8-d5ae-4247-006c-08d848210175
x-ms-traffictypediagnostic: TYAPR01MB4205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB4205A17ED73822E69CB0E4B5D8560@TYAPR01MB4205.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fTqGTQ9QHBWSYdiZAmEIrYa4yCje/o+5f6bKXamQZz0TLmPv+2eKS2dBvcYnkJT2eFw41hmtDEgnT4X+OWumQBZBsv404lHd6xHcpa7RU9Xrop17Y95w9tbv8fw0v3WAitFy9oN5B9so3swis53CDLnBFvcIih9tehr6dJuWZj4iB5TX6r0PmDtTgbv5PZiIn0OmVptYO6aPi5svlXSSeELwMI3W/UUS1Ezco24wprkn9WE2JOo0DgmokCeVh3VLbr1xvd0VE7RsKL4YOBLXzHEvE7rPfT0MhHwA5VjfScz4+zasv8YMUvdUg82pOs08ikHseUTmJTJpixzX/YlQgMDIkvMdOxedRAvsTOgzvpA1Cr8/RLUvanLJutFfmBQ9nAKU00/J3V+1AOjQYJfe631WMLAR2O0cg7fx6cleD6DzynVW73Nqr82rZiKeOO1GvASysVgH3KoFF7imZ8yUQw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(6506007)(26005)(110136005)(54906003)(478600001)(8936002)(83380400001)(186003)(7696005)(55236004)(5660300002)(52536014)(9686003)(2906002)(66446008)(316002)(55016002)(64756008)(66476007)(76116006)(33656002)(8676002)(71200400001)(66946007)(66556008)(4326008)(86362001)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: pLLLS8jP1UhpUXMHIZgpKbjEHKH2xpFtesi/QRgf7J6e/u5BA7R4j9IhSMZcaFSn1DvecaT1hEn3i0YM0rrAJBNTm5bJ1rdZUVF/aM+3jF55Bck1Cz/u5u7l1h2aBtkVpPkIHUIAIu3kNra/DFJmT/fq/Grfy+6Q4tco2y3ie2DE2eacwGjrgdoF77QcIm91FRADnZk9MrynQc9tGzfvdPiTv6AafHRafzYp8RTqjSVqrr7Q7/LySsJl5h+AuHOsSUKotkbM3E1tyuFdld012LTaGF8m+MdGUZkUTQpXg3eScrY6BPls6vWRcgzfAkQHH0/RZFNS+Y49rcGYrRyKjZbIlru32xF58Xk4erGEXWUFb2FnAC1JRhEcs1jv80n6TaWaLGy7ytYCIzKhcaTa9oQ9Big44rMO1K4nqnVoSZi9qnV98kSQzrZXwM6/l62unVpdsaSbcR1RXURYdGshQWWkjcYkeKlQcYtRDm83TQOKQjgq60SNSMH/mCQ0qB11El+qbV/hHm4XhnR7C7mkeJyxk/tALZ4tlt5ZoG6xRLoeyiu2ps5diCSkd7Avpw679UQRHISq9YuXC+02lC4qXyyXF/5ta+Qn5TElUHx1/Jfm3pbiEfcy2rkWN66jxc1r61s3RJs+agHY7P7Swt/oeQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c897a8-d5ae-4247-006c-08d848210175
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 11:29:46.7031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5o2DBOnvVzmDZ+k4VlVuwIhMws/nmVGLbCmHKn1qWkHGkgC9E6TYxnj/sjB3+gQcwHCyk1po6rarqbBgd9Jcjl7bx8MV9lgd+Ys/hz7RXWbKT0o55yc59ELso/ip+sxY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4205
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Tuesday, August 11, 2020 5:02 PM
>=20
> Document HS and SS data bus for the "usb-role-switch" enabled case.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2: No change
> Ref:https://patchwork.kernel.org/patch/11669423/
> ---
>  .../bindings/usb/renesas,usb3-peri.yaml       | 36 +++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> index e3cdeab1199f..3eb964af37b8 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
<snip>
> @@ -79,9 +92,20 @@ examples:
>          companion =3D <&xhci0>;
>          usb-role-switch;
>=20
> -        port {
> -            usb3_role_switch: endpoint {
> -                remote-endpoint =3D <&hd3ss3220_ep>;
> -            };
> -        };
> +    	ports {

I think we should use spaces instead of tab here and below.

> +    		#address-cells =3D <1>;
> +    		#size-cells =3D <0>;
> +    		port@0 {
> +    			reg =3D <0>;
> +    			usb3_hs_ep: endpoint {
> +    				remote-endpoint =3D <&hs_ep>;
> +    			};
> +    		};
> +    		port@1 {
> +    			reg =3D <1>;
> +    			usb3_role_switch: endpoint {
> +    				remote-endpoint =3D <&hd3ss3220_out_ep>;
> +    			};
> +    		};
> +    	};

Best regards,
Yoshihiro Shimoda

>      };
> --
> 2.17.1

