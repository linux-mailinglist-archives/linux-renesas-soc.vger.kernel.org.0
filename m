Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5392ACEFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 06:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730673AbgKJFZN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 00:25:13 -0500
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:31731
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbgKJFZM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 00:25:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSuQMT8VmCLUs31TNtCokEzHsjF5jU1OCyU32rMWmkvY9r2aEAFy0c/LP81CYPQeZ7PkEYlKCmplLo2TarAzFmDi9ThPlo3n1/xtyfFuC+OW7Kr/ZsIG0i0zdeYa9xSR5jEE3c0jfLe8UBlCnWThz+nrboDOdK5t9WEnTI5dd1ST9iDOaTeB5jQjI9Gs+XfgcUUD74EDZO0z3IPd9lHrF5Jk7vu7sSb/XM35+he3sp6u3HkzjpWii2rUzl9Qn9wJpCqasKJSdI4L5o2JYWL/Ku2lfsKEL9XlZ3oEmbUpLrl0Qk4axBR1I5QM/0a38eVGZNkaSbWRUZnqLpMeJaO/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE0AqktVVIriEyOo61mclD44XzilSPEmR58wL0bba0w=;
 b=fm8rWC7C/+tYKzgTN4BuUswfWydUbAV4c5Bn5+rWf0SZe4bmuV3obxR45BPd47NVkxBWMRSFMBmgH/eFB8yrhxaBsiqgr0aAWhAAqhB3aUjFVsRPP91Rn0d2LzGvW5nkimkoOvnzTP2gL3zH4AFOXNfligGv7l+mpIDbd/7n13tiA5KyK0HBcN1KBk2YrI7D4mGk4AhZ8Q3g177xdGGBVifa60qVF8viD6DbpBYIDac4sg1esD9Je3kkYOyXUOWu72z/DVkvM297tWpbMtgOs9IKQFjvgTkgWPiWvZ5u9jnfwK1MoK793Xf9d31vbV1olwOzXH3J7/R6j9eBBHsMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE0AqktVVIriEyOo61mclD44XzilSPEmR58wL0bba0w=;
 b=lR0A07G6RZzut8gxq1eQuS04rD9gimnerEsqS5U+DLeIPwBV5x2efRw+PZTqb8LWF/KlzcQVhnNlrWKN71npW/LldQ+l+wxCPa+Lw3lYIM7KpKrg9gZYOTJswVK/IxIz2kX1bco3o4XwXoAyj7zr3xyIXceBOZmg2+SdlC0mrGY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1550.jpnprd01.prod.outlook.com (2603:1096:403:10::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Tue, 10 Nov
 2020 05:25:09 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 05:25:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: r8a779a0: Fix R and OSC clocks
Thread-Topic: [PATCH] clk: renesas: r8a779a0: Fix R and OSC clocks
Thread-Index: AQHWtqytYYv2Wq4f2kujlkUwJcc7janA1hQg
Date:   Tue, 10 Nov 2020 05:25:08 +0000
Message-ID: <TY2PR01MB3692F47FF86CC6170B39E7DDD8E90@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201109152614.2465483-1-geert+renesas@glider.be>
In-Reply-To: <20201109152614.2465483-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fa8887e1-98ec-4302-2f06-08d88538fd7a
x-ms-traffictypediagnostic: TYXPR01MB1550:
x-microsoft-antispam-prvs: <TYXPR01MB1550B2BF0621F8BB14A1E0EFD8E90@TYXPR01MB1550.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OzOrFokEpKCcjY+38tFdaaCer8l3BliXM+kqCd9PcHSMmQdfJ0Uukx0jx+KWK58k1F1/EmDbKvsgt4h0/HLX7mmtiJB9ZEaQ14DT3ZoC0BgD3C17CNMI2rL/3++1J0TjL5A30f6qSrRnJq5MgJDzDxGHEq9xu8PWCxZLw9Wk95k+9zeRSWZF2UCHuwpEbnsrQlR/YvyE9y8J9Ai+bApdv5Cq4SXzXxYtG7cRyVUp7PM2vzO3cabB8mpvVa5P0HClyALIa4Bv701ilQG2Ujivtyn4Wf6pqtptVY/UiiikAxnn6lKlC0cAeE5LuuUsUuEQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(5660300002)(8936002)(64756008)(66946007)(71200400001)(55016002)(83380400001)(66446008)(8676002)(4326008)(86362001)(52536014)(186003)(54906003)(478600001)(2906002)(110136005)(33656002)(26005)(9686003)(6506007)(55236004)(316002)(7696005)(76116006)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: oGYPa1DM1E+cc3HO3+OHK3FnSQjoyn7lT+zileq2Zj/GZu9/BZfiE+WXg88y2d0lFryBDZ7bo3+1k9W2IUwCCFV3K1T7VNlheeKhk0MufGeDAjmDSc02pv9S4Jd8wg070g3mnpnkI0h8meNPMtFCuxCz7Z28I93POlabHfKOX5t6lGg+2YhFSj9z57zUFIloFBmVtSx3tetFtDDLYYAOMGJDvb0xbZ6etqpNY2JyK2vnSpvi+slau87qQSwy9iyRnp2cLuzq7RpPGuTsDx0qmhu20v2cmy98zbrGEO/hGASGFf9zn3eE6YHYnjKTgFCXY7RAzBVoyAuxiSpnq8cvBg3vBgnIDyYbKGEhtclhpqBUcwGxT0S3mYygA+E0GlYDmwTo+Al9c5zf6CqOEOrV+55RpBLSHFMrEeHM1H/tasjhHfiHxZ9gFVi5kaGGIZu83HDa11dprTzQ+fWvmpyQk37QbLqDePcaWvp2RIgegzFHclPUYwGPG79MrJ6kxk90An/SyPWeV9bamGIKk4dCLt7KMFlQ77bNSguiIwQXj1Tn9xWnh81BQqcQ6KhJFZrPi/Vf3d4oxnF2cVaPkUdQdY+1LR3rhCTfJTw4xobhA79WIxmMd72xBIY4RTZUUNFXpE1SyocRlqyQzdMe1fu/iA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8887e1-98ec-4302-2f06-08d88538fd7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 05:25:08.9601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TuFyn4Zff07GpFZZsBqsLDGXgQ6mJmOXRRy/tvLjjT3VzgPF9hu+6EOe6+LjUq1BfGJK30Fi70zQ+EIIJCPOWGXkFTgQHY6O8B179xOCgp429u+bJ2CHfB+BHjVHRnhh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1550
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, November 10, 2020 12:26 AM
>=20
> The R-Car V3U clock driver defines the R and OSC clocks using R-Car Gen3
> clock types.  However, The R-Car V3U clock driver does not use the R-Car
> Gen3 clock driver core, hence registering the R and OSC clocks fails:
>=20
>     renesas-cpg-mssr e6150000.clock-controller: Failed to register core c=
lock osc: -22
>     renesas-cpg-mssr e6150000.clock-controller: Failed to register core c=
lock r: -22
>=20
> Fix this by introducing clock definition macros specific to R-Car V3U.
> Note that rcar_r8a779a0_cpg_clk_register() already handled the related
> clock types.  Drop the now unneeded include of rcar-gen3-cpg.h.
>=20
> Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V=
3U")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk for v5.11, as no driver relies on the presenc=
e of
> the R and OSC clocks yet.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

