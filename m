Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB143E007F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 13:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237885AbhHDLuE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 07:50:04 -0400
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:10880
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237888AbhHDLt6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 07:49:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7rf6fAxW79A6RheBMAG7YhVl94/Osm5oRoWvyfneYaORzlpRtgeN+lh7cWo7NNYY8nX4godpyiOrpunRT1/Cwqk/XiqIqgFGOlXlAJDzj56Ux+z3NJ5p5r+cLK9OjCBu3Gyb5qIzL6vjbiZ+oZxmBm4VXpp88M/CqIP5g69rQE4vz+6T4jNupm1PUHD6KmhMxVKJJGbB7dAGj1YfRqJ2qzW4Sr8T9JuoIH4L9yU3qIDcttdTYVorT4tEyxdcVySoJRB2UFZb66qxO9NEhj+lVdgdsrzMIPo1JQplvRdSBUf+iFcyPFB6Dnc2njFpCySnAshsrIKAV2UshLf/p21HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xu7UqbAt11c9I3SeXnP0Jt7xuspXIkciBRYhZaN8E0=;
 b=CSmP+ao0YUVkl1meAPNfRhbF4ZUoj/gFZpcwO4btbB4M3KUxk1xMkcNG4xM3Y8JYXDWvBtE2NLbKFcGQ+SZ7Tkp/nDgVCkavtxW1D2uXSvQBXwkr3q/7Bts/oo9jyeWqqLjUSPv3DQHFq9M7TbduhVslhZtsxtyU9K4ugF/c+9BBRFe++GXveRKEcDrGp1fT+0TptUITBLdqt/4OLGiueK0NRadoewr0LGe8krgbTBYriRV5HYhC+HFZ8bQE7Qdf+Ty4oCB/xg1SXGhNUltGYuKI7bAS/vi97yuuYcj92nX/VvniDv9LoskcMCrJ09T0rdRz4L58be3cDPi7/rT/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xu7UqbAt11c9I3SeXnP0Jt7xuspXIkciBRYhZaN8E0=;
 b=pzyvN3FC+7cLOsfsQczvHrab0/wqnCwRXmlJ84gU073wB8+c5qnj9+ZZEawxrFxtUT14wZ0y0h2U8upvQYaSxvL78/9X7Qofm/t93lNDoUYwm91lKlMhtm/MWaveP5ZdE9asMxIWLVDXs7frnx5uIEPrsccvhPfQ3fyIQtDnsEQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3439.jpnprd01.prod.outlook.com (2603:1096:404:c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 11:49:44 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 11:49:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] clk: renesas: r8a779a0: Add Z0 and Z1 clock support
Thread-Topic: [PATCH/RFC] clk: renesas: r8a779a0: Add Z0 and Z1 clock support
Thread-Index: AQHXbyjFO3jL6fcub0yTvVCsJ4sPU6tjapgQ
Date:   Wed, 4 Aug 2021 11:49:44 +0000
Message-ID: <TY2PR01MB369226AD09A144F60F9D3E11D8F19@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <2112e3bc870580c623bdecfeff8c74739699c610.1625219713.git.geert+renesas@glider.be>
In-Reply-To: <2112e3bc870580c623bdecfeff8c74739699c610.1625219713.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1a466f2-30b6-449a-ca94-08d9573df3f7
x-ms-traffictypediagnostic: TYAPR01MB3439:
x-microsoft-antispam-prvs: <TYAPR01MB34393E1DE9924384D468B787D8F19@TYAPR01MB3439.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 90H6LWcc66qCgiYnZ6j+tyDnl+yOcDasWFED7tLGn8nj3oLKAcFB176894FdsTiBkZR7RmbhvUE6/KEk7RpbWl1tOmY4Im8Y4xAw4o409HReJaWuLF7izgpeWEL5hBOAexmRTPCFn4q67k1rASXv7G2zu0F8V/2Sa0A6AGoJEpDBUH5T1mTtt2WvCR9DmRp+5T5VOWvDYxtZdA5F/CoIN8nnDcd0VHyYj9r7+bbgQ94/JAsLty9M5DYgZMjCvnkEh6LWL157O/97BcEXGFEZ6f0sqwKySrQBFNMXG7yvWFKeuj0QAEcKReLOQkVLS2hqh0FKOpCvC07fTHWmn+CcLF90iqhCbw0b5JTkBdX2CWKMssm+VO31mABjR/TKVdg0LoFjV5940rp2whkOovhOUgyX7jITfxRj3noWPaK/ZTFrSgtG73yHApSR0Iv4g6bknBss4NoCbBO9Mm1yypmMuCADgD+yr3V10H1LAEvUJ8mWM4tPtgez60a0EkcL6Voc7MRTvM7tYGSh6RcopcboEl2KB773qSpSDWFmiCuNuqokBUfqEIA89K8873R5HLkoStVsl1gxhum8I+p+HwU0dfVgfoTF9DSxA+BAnuCWUrKnI3cjWC+F8BeyYJbooGInTFitGUnzv4BOywxPagAAGlAnZkmawszXKjI6X9FlNuFyzXw/D3vT1If34J69gYKV+9PMoNd4szSXILs9BQS6Bg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(186003)(122000001)(26005)(478600001)(4326008)(8936002)(38100700002)(38070700005)(86362001)(2906002)(5660300002)(8676002)(52536014)(64756008)(66946007)(66556008)(66446008)(316002)(66476007)(6506007)(83380400001)(76116006)(33656002)(55016002)(55236004)(9686003)(7696005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6zKkbEa9XqxNulEugO8fxHqFKP7pv+s0xOXXuRnl6wXRugTkupUZclZfUD1O?=
 =?us-ascii?Q?SSnabWCk5M71NENC4pZm2CtdUP32Q/uKCWj+cWXjZeouqYz1/5rzFmrwVCCI?=
 =?us-ascii?Q?SW9jJ7baDYbgaiVnI0K5F+8+lOfL0eO0JH2xJYzvywOo2mRNndLDT9vRpfDw?=
 =?us-ascii?Q?ESWvZnB4bNvzcmFnfNSUWwM+EYhqjIsgEwzjK3nZt4P2tj+4Xz+6Z6SpMLHs?=
 =?us-ascii?Q?8K+HH+DrWGYi3JVjMA6a0ARtl4JxMIjqwBRoM5HvDdgYyfcked84rss9sUdv?=
 =?us-ascii?Q?vxPBbjHkiHWqJvOMWkTRI9RTjgR7iJUu1yvU59lgYvPyEUfdz0b32PJlRaoE?=
 =?us-ascii?Q?S93PBTKXAb+TLHn0C3CtQLFveHm+qG9Kwg8APMVzNfZ4T0T+/4PTG86KN3oq?=
 =?us-ascii?Q?YdjUpN7sFYoMIN4+gsx7xCsDvbZTysmsfTUni8aX+xjZbw4Ab9vHWj0ahUN8?=
 =?us-ascii?Q?lqozN3trHhPT29bNwnm7lxediBwJ2JXrt4xktvfPsUvbJLKPYAs62VGO8Yf/?=
 =?us-ascii?Q?qimRrDCiGSHUUjqRpcLpHyhQ0yW6maDlMrxvJSYz2S4SDNVeXe0tPNmfDqos?=
 =?us-ascii?Q?dva0ewNAA/R090GF8J1a3LPCIhxntrv+lmH7Xmf5hU7v/bjZkPEaX6qMdc39?=
 =?us-ascii?Q?zboOoDUEtFI4pfTpcT2buTyfP292BEn20nX0hj6Lqhtg2ltd8Vp071F6tz82?=
 =?us-ascii?Q?9iOgDcUG0w7xr59r79qys06d1ULfuPK0X5jrtVAfpi4Au9JCmnIRKusQnJtl?=
 =?us-ascii?Q?Oaxy2JajZH1UKkwdfmW5s80TAk4NFA+x//98lEJbwlc7ajy/7+RDmkiO+veg?=
 =?us-ascii?Q?nsPNMHnMgxdUK/HgbnCttHcdzLhsxRkZFMezRiQTnxZUNtvm5Wjdsg7c/lcx?=
 =?us-ascii?Q?cxJ+58z61yxJ4RnPwrUQ2oAZayI3UECwZHVHlf1sZ9vKQDJYOWPFhsMYCfTq?=
 =?us-ascii?Q?Hq9POYnRNBRWNprY0Dohsn+ow4flfAjxz7UvLqMd0lE8uS+dKiiGyRBIplMP?=
 =?us-ascii?Q?fDoN2dTTCC24aDBRRPIflgu+2TZOLWuKyl9yYlMUF/uMBaJKqtJwfYSt1moY?=
 =?us-ascii?Q?BEX/i88MBaK2eAh+wBH1OgFU4rBe4OkrZK1TYbRRaenG2wDDZLj33EkCXXJB?=
 =?us-ascii?Q?4cDKvv7nJ3XO/F+qFyt4mW2B0mOUaVIHpjyiKNfVlCHyUzfV8WELz5pXZ2y2?=
 =?us-ascii?Q?ulWcxjqVCiM+sW9XRr5xE0LsKyBEJ9CnMW8tT3v/ps+rn3eeghQQhtbGghdw?=
 =?us-ascii?Q?jc4HqQyg1E3iXnPMX7Zy0FslrxYPsXIU7XC+9ATCTp1RpqKPOa54NFLvTf/c?=
 =?us-ascii?Q?+S9DnFz0qSjUh7cpHn0HvaYx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a466f2-30b6-449a-ca94-08d9573df3f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 11:49:44.5841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwlEpSbhawC/C9MlwA8/VujEC79UMTa+usDlAHk0put0IBD3qJ/ukAU88kTT8bMQJNJUeJstSkyqocJ1DXo9l6r0+vbjKYZclpxqG2chvCpvhE4HjZHkJ9r/cHt38N1u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3439
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for the patch!

> From: Geert Uytterhoeven, Sent: Friday, July 2, 2021 6:58 PM
>=20
> Add support for the Z0 and Z1 (Cortex-A76 Sub-system 0 and 1) clocks,
> based on the existing support for Z clocks on R-Car Gen3.
>=20
> As the offsets of the CPG_FRQCRB and CPG_FRQCRC registers on R-Car V3U
> differ from the offsets on other R-Car Gen3 SoCs, we cannot use the
> existing R-Car Gen3 support as-is.  For now, just make a copy, and
> change the register offsets.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on Falcon by changing
>=20
>     -#undef CLOCK_ALLOW_WRITE_DEBUGFS
>     +#define CLOCK_ALLOW_WRITE_DEBUGFS
>=20
> in drivers/clk/clk.c, writing the desired clock rate to
> /sys/kernel/debug/clk/z0/clk_rate, and timing shell loops.
> The performance/clock rate looks fine over the full range from 56.25 MHz
> to 1.8 GHz.
>=20
> RFC as it is not clear from the R-Car V3U User's Manual Rev. 0.5 if the
> CPG_FRQCRB.KICK bit applies to changes to CPG_FRQCRC or not:
>   - Section 8.2.12 ("Frequency Control Register B (FRQCRB)") says the
>     KICK bit activates the FRQCRB settings, but doesn't mention FRQCRC
>     like on R-Car Gen2 and Gen3,

The latest internal manual is also not clear about this unfortunately...

>   - Section 8.3 ("CPG Operation") says the KICK bit should be used when
>     changing Z0 or Z1.

I also understood it.

> Setting the KICK bit seems to work, and it is cleared automatically
> after 1 or 2 loops.

It looks good to me.

> The handling of Z clocks on R-Car Gen2, Gen3, and V3-U should be
> consolidated and moved to rcar-cpg-lib.c, so it can be shared by all
> clock drivers.

I think so. But, anyway,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

