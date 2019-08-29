Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7D8A1037
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 06:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbfH2EOL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 00:14:11 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:51046
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbfH2EOL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 00:14:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEPsE9xH1KI0emLDNETwnfxMrCK3dcZy/xbq4CwTPCktwF5nTXjO+nNqYUGs3JdOIiiOWLpRUggRSEqK+NzGS/02n3pGQnPexFGuEULvnUTJ9jlIla/J9dkCPIFcrN66YzoKdQzIcCIaU8VqAB3/jT4Aie/rASpVhd6qg6GwiCO11ZmhT93/4lgPJDm5md5+Bke+KlZVR03X2edpAVpvOe12x/K2CmxQ70o7+5uGZMaPvoE8bhuOjFeTSTQFsiDHVB8MeaihY8sZYFXWcytTKdsNa0OM7Z7HeeiVOZRBbXWscKEEkDknVTEQDh7aHSP3LIIACI8D75rM09suo+lUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvAeKsJl6ZAiIESYmoaVgiDGf9qSyYOZXjXNGRnfpJk=;
 b=GOPj65ufiTTwAl6mGYslj0lkyf1FWw2roAKISKvV7bJz565noyx7m0WHziNhvCvhNg31XbLT/oPk7GDgeEnXY/jV+l43nxyw5tavg61p8pxoZQxCLjGDPMn+WAjbrB3dnmQrrjJsLn+8uYdkxE+69DurOURcJ84tPNLxF1H21MPWWw9L5bUJ1XdsPXWYmL2rsZCCSiSG1G3JHIZXHcxAH/7i7JTbsh4Ph1d3BUV0/AC/X9PdkrYi9M85xzdhT7rKgSO1vRfvPU2rb0qZfxZRGkos1LvVYeBuUcqS1tPP6QjczT2blHFtJUzjn6wxuSU+bYl0jN16kObKZnmFn1nGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvAeKsJl6ZAiIESYmoaVgiDGf9qSyYOZXjXNGRnfpJk=;
 b=scKRe8+Bt7Vl2JJUIChYiZub017m4inFZo87icfN4UeriQUn87ilv9liBxM7d0fRTz5O2tuonsphDhCWAIygTVkcFcjv3Ct7/B3rNcCPfvz1yL2dSy1T2sHxGL56o+xwVgvRk8wnWvfjJaSulBN3TmvlLUmDPXqP79izamyfCdc=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2157.jpnprd01.prod.outlook.com (52.133.179.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 04:14:08 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6564:f61f:f179:facf%5]) with mapi id 15.20.2220.013; Thu, 29 Aug 2019
 04:14:08 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 0/7] soc: renesas: rcar-gen3-sysc: Fix power request
 conflicts
Thread-Topic: [PATCH v2 0/7] soc: renesas: rcar-gen3-sysc: Fix power request
 conflicts
Thread-Index: AQHVXZf2z5+RDK9abUGGM+GoCPRtMqcRhIfw
Date:   Thu, 29 Aug 2019 04:14:07 +0000
Message-ID: <TYAPR01MB45445637B824C0464A1CD5ADD8A20@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20190828113618.6672-1-geert+renesas@glider.be>
In-Reply-To: <20190828113618.6672-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4888d11-c47f-400f-01e4-08d72c37567d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2157;
x-ms-traffictypediagnostic: TYAPR01MB2157:
x-microsoft-antispam-prvs: <TYAPR01MB2157B79685D85419D818890CD8A20@TYAPR01MB2157.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(53754006)(189003)(199004)(7736002)(14444005)(2906002)(81156014)(81166006)(6506007)(256004)(305945005)(33656002)(229853002)(53936002)(74316002)(8676002)(76116006)(6436002)(25786009)(14454004)(478600001)(186003)(66066001)(9686003)(66946007)(7696005)(55016002)(86362001)(26005)(71200400001)(71190400001)(99286004)(66446008)(66556008)(102836004)(476003)(54906003)(3846002)(6116002)(5660300002)(6246003)(4326008)(446003)(11346002)(316002)(66476007)(76176011)(64756008)(52536014)(486006)(110136005)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2157;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aHgkRi2bRnVEos1GvLuY/Vi66W13mlaZt/Qs0mzmMYEB5rgkYHnzqRUZmlMD+0nCxdM30+tSDpjnJ2YwwMzZ08EpNluuRj22nQiVKp7EjZ/7JFjGPOh1TuvHKiO37tqeT8RLO6gCI/i1KnrCKJHs3JuIp+JYafXe+ws4/bB+nWJDpR2wjhTyDPWdHT+uBu6Z0xFkZkMYtdxkyAWrYLLQQoepgsVCBJhB22bgvOMTgLWEsN75xlO7c/X/gpDeUSq5JO9k0JLRO4I0re3dY6HlxY7jk9nJ8p0XpbKEMOJBYAosJthcPDUKmbyosfZ+lUnGOoyN5/FLyIfellfj68viUYt06eiZjRVq+xkA7Mh1s7MS0wZqefUWk0QftvmGdFHQSnxnFAGt5/sKgMJfPvVITsWmtYeeGDtZRPLvLOSo8vg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4888d11-c47f-400f-01e4-08d72c37567d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 04:14:08.0202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d4GnbpjrrYrsMW5meOtYtklZts7iCjbB+RCe+LRxzivP3T2rNpxrbPRyI5eYo0u07N7YOVnJ/7KIk4fqrO4Lkax7kun2WJnKiKmD/XkOcPvmmMLQJ5/tteEiCtyEZwsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2157
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, August 28, 2019 8:36 PM
>=20
> 	Hi all,
>=20
> Recent R-Car Gen3 SoCs added an External Request Mask Register to the
> System Controller (SYSC).  This register allows to mask external power
> requests for CPU or 3DG domains, to prevent conflicts between powering
> off CPU cores or the 3D Graphics Engine, and changing the state of
> another power domain through SYSC, which could lead to CPG state machine
> lock-ups.
>=20
> This patch series starts making use of this register.  Note that the
> register is optional, and that its location and contents are
> SoC-specific.
>=20
> This was inspired by a patch in the BSP by Dien Pham
> <dien.pham.ry@renesas.com>.
>=20
> Note that the issue fixed cannot happen in the upstream kernel, as
> upstream has no support for graphics acceleration yet.  SoCs lacking the
> External Request Mask Register may need a different mitigation in the
> future.
>=20
> Changes compared to v1[1]:
>   - Improve description of cover letter and first patch.
>=20
> Changes compared to RFC[2]:
>   - Rebased.
>=20
> This has been boot-tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0, M3-N,
> V3M, and E3 (only the last 3 have this register!), and regression-tested
> on R-Car Gen2.
>=20
> This has not been tested on R-Car H3 ES3.0, M3-W ES2.0, and V3H.

I also boot-tested on R-Car H3 ES3.0 and M3-W ES3.0.
And I reviewed all patches, so:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

