Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337BB3AB5C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhFQOZf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:25:35 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:6073
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231396AbhFQOZf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:25:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQ1zZHzQKBVIvGIfrVx70/mzPutqdRwNp8IIyTU9stVn3mSLeMX7xR/omwdDo5ECU3qpXCRefpDXipdN3nX++LaUpVzfLvcmUzDuD/LabPpZ/6y1SzzugtIW49+8ojCDcBCseOsPO8z8n3mG28WxskJ0qr7tmMxubVE0TB7+o5p8o4MoRDz8zZlNnrmVlfXqlBoZ1AqFVug1pYutgSilFDK6EcYzKQI/TB3BckdZN0cn4wFJb52QflAPEVrSnyvpivwZy806xWzioBDIeBTlt3fyS2/k7+spDPyDD+MzsvlIPhflv1X79CSlxnyujyOPZO/0pnZoBoTMdWvrgS9VaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7UOHIo3im3/A60FkgxP+AHuu5eQaxhKqUV5AFzrkBI=;
 b=VAbuVyZvDHT8JuN/WmL7rfiM5u+891vtNC3ImBXq0LdCz9I0miKOekvEKCesDeutYSmcueKcETGwiBdcsQKBJDMFF8cIfUl9qM4BAse5VkVMNmWKUCeud6XM/s+e8lbZP/nGek7zPjOSbNr2uwYDxSMjZcasYs3ozJEdeSQ/ULhHGgHAD127sXKiVTdP2Ccvbbuza8g6DWdhRNwhK2VHLf08WXaEEKbHUg8S/VmRobPAI2XfG2Ts6U3zMAW8iOoAdj8lDlrUC3Jpk0Ih06/wMWvOQdWYFySsCMte3aiZXL6SLzlvBF6GLy6pPR6S/Sp1vQzP+ygBYGlO8DV5Cy0Rhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7UOHIo3im3/A60FkgxP+AHuu5eQaxhKqUV5AFzrkBI=;
 b=F5FA+cI9o754QhBr9NOODrgrI9jxQtwtDWXD234yeqehxPeeWNO7PNNwLL6nZqbile8BgTxk/O87c/M0t2PA9fE42Ix+8wOKy0mBdQYWQ3/8JWUY10BvkDSL9Ce82gtDt+dFoquzWwKUW4m7xQKmJYxTh2+TSA11c4Z7wAtm1RY=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSBPR01MB2454.jpnprd01.prod.outlook.com (2603:1096:604:17::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 17 Jun
 2021 14:23:25 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6%8]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 14:23:25 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] clk: renesas: fix a double free on error
Thread-Topic: [PATCH v2 1/2] clk: renesas: fix a double free on error
Thread-Index: AQHXY4MVN6/1NVH7sE2bvsoegGXr+6sYQGog
Date:   Thu, 17 Jun 2021 14:23:25 +0000
Message-ID: <OSZPR01MB7019EB435500EE84687640AFAA0E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <YMtYs7LVveYH4eRe@mwanda>
In-Reply-To: <YMtYs7LVveYH4eRe@mwanda>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f014a57-2ebc-487f-3b56-08d9319b7812
x-ms-traffictypediagnostic: OSBPR01MB2454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB24541C3F6BC2126365764B7AAA0E9@OSBPR01MB2454.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CxSzx59HwAC5FDzLq98cHyWp2mX/e75U8fqxB7h77o4B5HDCgNF5A4CXWAiyKmS1mhfu9zuw7rxmjDrZCm6F0pgoetoOnKVTY+5GJUup9Hj24pwkKtVPD9g7Zx4mkrGVuR21mfkJUzOQatsZlFkS/wzVbfnyToxiPoAsIGcPVGVOWYC6WNiO9AA+ggJj5IOuT4z/HwXZWyYvCvMk9rcaRr30WlCd89VsvAWvJRGMzm+RH87PrOKVIr3sr6GjbkHKrirmhtvtWJJ9A8DbCkGSZS/G10xCrLqwe2umZLIZwFgax8a+D7jxpn76TS4++eHGypE64lciAr9sZSfoUta2IxXhYs9BU0/tUPCy5eGC1+gHwR4eIMIVJFQWF/7DenCTW8Vr/P46yh7om19VSLgoYr0D7LKb0v/bn5jDnAkptUUkcPP8oB6I0zUee00QUXRf1YkdnU/OKwSQotht2KJbS0EZ0gP0AIgXoQClD+ZnRlYQNJdLnbGNJ/F6/5T4I7wSoon2oF2u6pOgU8pPTfayTbQ9bFPpg7fsDcfIn3rPBmTe24CYKc+e6r8UEaDhOzv9Hm5UJRl/tmE8o7N5OS7I1PmI3u8iunyFkgQj3fNrD/o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(136003)(396003)(366004)(6506007)(83380400001)(86362001)(4326008)(110136005)(66476007)(53546011)(8676002)(33656002)(316002)(122000001)(5660300002)(66946007)(55016002)(2906002)(38100700002)(76116006)(66446008)(8936002)(64756008)(66556008)(26005)(186003)(7696005)(9686003)(52536014)(478600001)(54906003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YkBsJ6fpPFhL4d1QT3r+FnGPCOWbXFvfN2DmOEvVoTmiA/H6fsBZewCRoNjP?=
 =?us-ascii?Q?3YtpSCgICLegwzt/pwF4cKJj49FPPC3ikS//8Y1IOuxTaHKqWlg5IuXzCVs9?=
 =?us-ascii?Q?S1b51QG2VTHP9LXBZAzR2CpeibMmJShxHY1Pe0yjjmVxM3D1YxRVGaDXZOcJ?=
 =?us-ascii?Q?o4geUoHBgxtPczrq7YO+qt2rqr9HMlDAPbDN8kq7efR9n33O02lC1amQPnt/?=
 =?us-ascii?Q?Tfkn3rN4XUjenF3sluaz0KUQP/sY+kdPrxrEGvab8ikVQM6SP8y+BqW0dzng?=
 =?us-ascii?Q?OK5oy3JX2GSVzFaMCEPAoZKcy8r7xUDd+rvA/AAI7TYSI11wnb+dGR+qajXH?=
 =?us-ascii?Q?ydMpC2P4SWbXAfPrHxOHyb5/kEvMDpQTohJNgTYqhN3AWqaw0pJGk/Pu2867?=
 =?us-ascii?Q?fPK19XeReb2woo9R0Bw8+l7q1u/7Mu/wX2JU6RelbBW9gltx99gYc3HQDa1/?=
 =?us-ascii?Q?P4Vs+iscyZtb3uQ9vSqunNlHDE9mSVYLnIloP7vTq0QohNVSrM9QPJIapTfE?=
 =?us-ascii?Q?tkJQGMmjvjsCcY3m0dMqckxqCW108RcZ0AUGKrf0QHPCkhrffQBGHjK5jBtc?=
 =?us-ascii?Q?wX6o0ihRKYvaBDoU240rmsKCQHqLHVZ6CX+C5iQ+MfukiRUPoZjckSZB1hOR?=
 =?us-ascii?Q?pvFNwwzzKJhW7dEycSIl90TtF1ETkBkPmHsCTTnTd5L26aCg88PIGnuo+y/H?=
 =?us-ascii?Q?ReRiqiqIrE85pua7mgosvSrQkjjz0YbC1z9hn3/30Qk+En7fBFQFeLeaeBZL?=
 =?us-ascii?Q?6HTkwbKPzrN67jQrTmNS6qwSBe8m0d90qsCcVQ0NCje+SaYLyyvvqIppFiQk?=
 =?us-ascii?Q?a9rL0FOyjGnvRb/ZOF+lVjwH6bcrq2o1a/egAzbux/m/2qIomHxShgsPMvj/?=
 =?us-ascii?Q?zg+RheSDhO0wLzQcxLVEzd3qWp4spUnSSJtNWvN5rg1TqtZHUnr5vL378Ea2?=
 =?us-ascii?Q?ApXq7PHGl6/FYvzxUKtHcAi2fSM6RK0JyjyvPDNckKs2far6vuipRUfr7VZ/?=
 =?us-ascii?Q?wkax+mOicOU+Mr1g18NkfGAXFBCaUCDTg2htC2BrmiR6INbor7oXB/sSlFV4?=
 =?us-ascii?Q?Vy2PFYy6Kqat9gggRIQV2WKloNEN0Hy4x6AVsjONYphN1TpBb93iQKvDaJrg?=
 =?us-ascii?Q?Kvd7NvH3/7Gjb/b8lOHBlcY/1BrPafDUxNMr3kkCZBnRHEHEbY3LIlyCjMlt?=
 =?us-ascii?Q?KjOWPF/LRB7B5s1fCE7j665a1vLFRY3Bu9WU7iOWBBHe9jk9ZX6JNSPqt2sg?=
 =?us-ascii?Q?udVwjc5hv4MUs1MH+tM0vKO/9L9fkB2DBTTC39lFhoCODOnLN/fS/LgsFpTs?=
 =?us-ascii?Q?LOQNpDNBoWopF2u/ao+85jHM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f014a57-2ebc-487f-3b56-08d9319b7812
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 14:23:25.1837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVGE/2SSDg+Bk7yk44NAxXqrjLjfGtZBlKWflaKhVzXghYR1Hg+BDIUMCF+CoMyy8F4vKUPSJqFoU545X6DLHyF+5eGangtz/yuhWNApFquvYAq3jdAR/P00iRZ5m/wg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2454
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

Thank you for the fix.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: 17 June 2021 15:14
> To: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kern=
el.org>; Prabhakar Mahadev
> Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Biju Das <biju.das.jz@bp.r=
enesas.com>; linux-renesas-
> soc@vger.kernel.org; linux-clk@vger.kernel.org; kernel-janitors@vger.kern=
el.org
> Subject: [PATCH v2 1/2] clk: renesas: fix a double free on error
>=20
> The "pll_clk" and "clock" pointers are allocated with devm_kzalloc() so f=
reeing them with kfree() will
> lead to a double free.  This would only happen if probe failed, and the s=
ystem is not bootable.
>=20
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> V2: Fix "pll_clk" as well.
>=20
>  drivers/clk/renesas/renesas-rzg2l-cpg.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Also Reported-by tag,

Reported-by: kernel test robot <lkp@intel.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesa=
s/renesas-rzg2l-cpg.c
> index 5009b9e48b13..7ba36f19896f 100644
> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -199,11 +199,7 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk=
 *core,
>  	pll_clk->priv =3D priv;
>  	pll_clk->type =3D core->type;
>=20
> -	clk =3D clk_register(NULL, &pll_clk->hw);
> -	if (IS_ERR(clk))
> -		kfree(pll_clk);
> -
> -	return clk;
> +	return clk_register(NULL, &pll_clk->hw);
>  }
>=20
>  static struct clk
> @@ -473,7 +469,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk=
 *mod,
>  fail:
>  	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
>  		mod->name, PTR_ERR(clk));
> -	kfree(clock);
>  }
>=20
>  #define rcdev_to_priv(x)	container_of(x, struct rzg2l_cpg_priv, rcdev)
> --
> 2.30.2

