Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA0D29492E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Oct 2020 10:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502159AbgJUIHx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Oct 2020 04:07:53 -0400
Received: from mail-eopbgr1410117.outbound.protection.outlook.com ([40.107.141.117]:11785
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2502153AbgJUIHi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 04:07:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmpD0bgKA41Dwp6p9mburXiGjt5JjSAdHQZqBvAGAVAaCA5U7aPZ39oa0gh4CbQfHCs9Axyv4TMXk+17bE52a6ADo1qebG+uclIptcEHSu1HI9aGxU/M8Lg36LE3G9JF8r+Ua7lwJg41ZDGE9H5Xm+XAN8XZwp+aUbldxmqvu6SSShG+ZFLH7Dv7ADd0Q1qbu1VfxYvvffzPP49IcoopSwpgiLnzAln497eo+Mp3Wcqnqa+lkp+GooS0bIcSQUr6bdq9H9HxUBpx1Ini8Epaqz6mlcOqjCYT/mzlB0hg8sjRVrVNjTDMIc20y3VPWiYaSnjlY1HFGFitxZ6e8m5ASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVtohq3R8Zb2s5Eclcw+oJa9IDLjxHLTiRfawYGkO/I=;
 b=hG4rS9oMEpofKyqSpKyn92TjhGiKVjUgMIPtrnh/Qcy5X394JvxQhteNLdhv6s847qmW1P/rwiHJlmPLjRnkCkh0wIS9hcNqBSU+TVShXp/bX8eqIJt+VHKkP/cg1T3EbNwm6+y8mqWadn+xptR/x+0enGgujhZDxpLmP20Ys5+trH1Q28mmSPPsEc7o23OalIthqvb/tbAIC0chClz36Uulo83VTSeW4RS+IiQKX8dm7OZop9bT31+AqVbr4yffuMf589wZDjAbmfC0XKGvaQBqZxd8Uh+x/vI8USU6d/84XJNR31jUxkMPJirs/rhU4ekYbsbptp5qwYf0zXEP5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVtohq3R8Zb2s5Eclcw+oJa9IDLjxHLTiRfawYGkO/I=;
 b=Eb+yata7k4X8tm5vVqvp5YtGvS0PjYK3rruXIa8k/rWJasORZDWaW1ii62dafix9KtDBruN+Xwlsnuzvxa1U9Ed6VH93oFfaQl/t1fa3MJNynoTaX+8LMWNx9dgiEFQ059jVGCvyDZ9JUH3KpEwk6y49+fv5Vtmkt5wFRxbPY4o=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY1PR01MB1817.jpnprd01.prod.outlook.com (2603:1096:403:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 21 Oct
 2020 08:07:35 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 08:07:35 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH/RFC 3/6] clk: renesas: r8a779a0: Add PFC/GPIO clocks
Thread-Topic: [PATCH/RFC 3/6] clk: renesas: r8a779a0: Add PFC/GPIO clocks
Thread-Index: AQHWphBCv8ztLOHTs0O3grsNsxvjBamhrhawgAAHUvA=
Date:   Wed, 21 Oct 2020 08:07:35 +0000
Message-ID: <TY2PR01MB3692F7578166FE096586FB18D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-4-geert+renesas@glider.be>
 <TY2PR01MB3692A94AF01CE95C4E206279D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692A94AF01CE95C4E206279D81C0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:5405:3048:ff68:887f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 09880ff5-fad5-4234-98a9-08d875985e85
x-ms-traffictypediagnostic: TY1PR01MB1817:
x-microsoft-antispam-prvs: <TY1PR01MB18174159A7668AE29C2E40CAD81C0@TY1PR01MB1817.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6KgDpkr4UUoKFayjDAwb0IYlL/tK4s3xrmWKdwncXFFyOUMla/HDgpC4k33HbZWcjTs82IwPEe4ipFEFhMrayDeGT2P4C7ZuoBAfm+DF5lGMd7XWgedAc9m5sVX57s+H4l6M0xLGW/FpyOLu4JaMVbGtz5pkKSoFcPkDQocfpm8gXc0zEgtJoqaSaIEAVVV8U38lFWCQRD2Yx+uDe5SmVRnYRAi27CaN0Iy5Q7/MzldaXLr9rer/KB1KyupbgX1AhDvFBknlkwfhdUI8sg/l8SZdlBRG9WPWSu61olIv6lwW8UbbjWpxW2vYzo/0s4D9cJm3aMtv5MmOD/C9swF8ow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(33656002)(8936002)(5660300002)(2906002)(478600001)(86362001)(66446008)(66946007)(66476007)(186003)(4326008)(54906003)(66556008)(110136005)(76116006)(55016002)(316002)(83380400001)(7696005)(6506007)(2940100002)(71200400001)(64756008)(8676002)(52536014)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 5InG8Y6U/Wn/hMz+uUFO7R3IIRI666KLKoBh7R1iblWCWCFN85OzXHvH6JUpP39TZL/7aD4ANnhHgZcB2f1en2mCZbBGAaRPKbuSNmzoRpfT1H4QPSVk9jxBEohnsKSos80asCeeeqPbXnJEe5LMHmr7UGduVNEtnO2MfQ5jXWgrQ+UQtie93yGigya5AWalvBRNpPO98PEOkOMzgjN3W7VOIU567fop9ADXqLKBVWoh0MyV1QVFPupq1fBi5pqDui5AzCPrNN/43p2hUuk0I1pLlBheE7mEgEzl+5TAcXKXyZHpW/+ZnjphEw/ATyNQmi5cnN4EvSwDqVwvMlf8FRk3t0Ync4le7MpgxPRVMmMw/LibJlT4YgLZEmSF3GEfe3DkqNQQcN+glGYutg53IfCmeT0XUzlBVZNmRpxzfK25k1l3D2CAjShi1Rz92OHEWu4Upazc5IEDNeB0SAZK4Yq4G9UwXnZ6/AExR9LGV5C+wwuZVqIld6BHLkAJMNGR/cxryF3XAzLw/0tGpOL/VUAvd9J7qAYCBPTU9ULdar2Fn2h9N5jgdcDfR+eaT+1WQdmapR6BzqKOYDNSL9qDK6+Avg52Tr3hTMf+qSeXHPtXmUkHh8Yj69bSHR6kq7CxekWFhCxed6tzPvL0QLymvxDuHI2oYIRE2VnUNrTywbXDCRqMtTCwW7OSrpx7QZ5FRuJF4Dju+uG5YrxjJ4zThA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09880ff5-fad5-4234-98a9-08d875985e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 08:07:35.3588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/Q2dS0vfOtzWPGUrKVtvrSIjGeuUly2ly/IrLwQ2Z+qJCllgU32XE6Wsrsx5l5a9ZfwhPjB7Cl3tzJXZOvJO54Ke7rJR4ObX5gQxoP+Iw8gW8EC1fwbNHTpj0yTzQ17
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1817
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san again,

> From: Yoshihiro Shimoda, Sent: Wednesday, October 21, 2020 4:41 PM
>=20
> Hi Geert-san,
>=20
> > From: Geert Uytterhoeven, Sent: Monday, October 19, 2020 9:06 PM
> >
> > Add the module clocks used by the Pin Function Controller (PFC) and
> > General Purpose Input/Output (GPIO) blocks, and their parent clock CP.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Untested on actual hardware.
> >
> > Note that the BSP uses MAIN instead of EXTAL, just like for the CBFUSA
> > clock.  However, according to Figure 8.1.1 ("Block Diagram of CPG (R-Ca=
r
> > V3U-AD)") in the R-Car V3U Series User's Manual Rev. 0.5, the parent of
> > the CP clock is EXTAL, which matches earlier R-Car Gen3 SoCs.
>=20
> Thank you for the patch!
>=20
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I'm afraid but, since the upstream code doesn't have the following "vin3[56=
7]"
lines, we should remove it from this patch. After fixed it,
you can use my Reviewed-by :)

>@@ -180,6 +181,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] =
__initconst =3D {
> 	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
> 	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
> 	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),

Best regards,
Yoshihiro Shimoda

