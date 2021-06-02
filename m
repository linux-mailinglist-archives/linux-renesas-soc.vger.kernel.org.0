Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C139398002
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jun 2021 06:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhFBEOW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Jun 2021 00:14:22 -0400
Received: from mail-eopbgr1300109.outbound.protection.outlook.com ([40.107.130.109]:19872
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229571AbhFBEOV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 00:14:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G74OM7EnpuojEmejmpy0QaGWfDfysCInhyD/u2VPHndOqf6LC4tYJEIniV1P5jzJJZNrvmL3mAYh+u3xoQ3u/YttkEW+oFJRIxyhKRZiojs0mlVWMyk3HTH+STAJVcs12P8YcVG5Km1QY92POQMvzt+eHdHI9bP56pciqWlUHEFEUHRxccrTcbQvAdl91TZS5nFINXLYi88gDEffRKvfG6P3EL50IVZX/RxOioXQjHgIH6xZLhVsyN/gWZfagQeYTLNp/YmZHW061O7Qfvd0HOuYNYjxlSgH9BENBYwvcda+HCibaZ2+Irr5hKQem/yYxnG7CMjZKKSUN5ZKEGjilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGNvdpIDdbTaowX17ALF/9GjU2fA/S/NOwVOjgsGWD4=;
 b=eVJK1rLJ8J/ZBbDVpeImLnNMFKWQTVDT3vt+BVGMjJlld9R8reiQz708h/o84Nc3Mu5gywQRyQpIyzgBwMA5yQ4mmbhnOarNyl1RBLaZ4ASd7q1Vh2felwAq5Ct/f0qVgwT0OeK2JjX9Xooca31WLjX367n+L0YbrX7Vko3PwAD1MMFYmDSj1dH2uQw5luB+s3ddmoaJUeM0zM0J83YwCUHOc9p/dH3XXsX8ErfKMGtZbSIPpshYpJjtwnUQ10IPNjgnQfuuduqp0GpAv+hJvt5VTwkqWXoT0LXqUdkZWJlfQB+NRA00mH2kfGMP5HLq5DZHnpQK4CA6TxOYxWs4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGNvdpIDdbTaowX17ALF/9GjU2fA/S/NOwVOjgsGWD4=;
 b=M1GH8O2benzqWOcCnX1ZZyvTNlFex/7D+pMosKmZZgnHCWtzDtJjfEb9uRG5dNq/8U4yv3AWCAqjGNpZG2AhIK273t/lERO4NoVxisPyo6B31yeF03POvUC/zOszuyuOdpQRpbSQ9jdU2SEm4XMfIcZ9p5nx3VLwB59BLdghtPw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2058.jpnprd01.prod.outlook.com (2603:1096:404:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Wed, 2 Jun
 2021 04:12:35 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 04:12:35 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: irqchip: renesas-irqc: Add R-Car M3-W+
 support
Thread-Topic: [PATCH] dt-bindings: irqchip: renesas-irqc: Add R-Car M3-W+
 support
Thread-Index: AQHXVtnEtdDuqTVqlUuAy0hs1laWCqsAHQOw
Date:   Wed, 2 Jun 2021 04:12:34 +0000
Message-ID: <TY2PR01MB3692D763D0030CFA015B7763D83D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <55d2c30cb14b2e10193a7fd4aa7670c70f360037.1622546880.git.geert+renesas@glider.be>
In-Reply-To: <55d2c30cb14b2e10193a7fd4aa7670c70f360037.1622546880.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b924b57-57a6-4368-474c-08d9257ca6a4
x-ms-traffictypediagnostic: TY2PR01MB2058:
x-microsoft-antispam-prvs: <TY2PR01MB2058C2DF09F6212D35DB2FCFD83D9@TY2PR01MB2058.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KauLCLswtTT9dZsePQo0kSDEOQ9DU1tvYOo/V1SgB2zukOPSYmOpYIvoxnejWYpzN+xl+Vxaii5dBWYaJQyjSwvyAcUZQnSPIyFl7XbSe8S17+33rB9vWeJWcZSmVBRTQq4O6OS4PvruYSp4BmbhKYZ4/GF+2LmA0l2qhxlIBnWsy66goB6zXq9Ygf4/C8OufR0ngD6c3mWvAbLfrciELIvVQJ67+CPnAeq15OjvEycwiPYu5oFjsScUgA/XKCo1rKS27fmR+d0G5vbVOr/VHThf+N8p4Xd1UyMRXAPA31qWM0NxU4ngod4ecmDjIMi6kBLR9Cqq4KO2LNmQWAAGz2IMMvIQPtH3bmisaMvDrmOZtCBIU9JF9bwpWVS9otP0mz60hZVzEO4zZg6WlC1VJu3+Ni7DgZhYfap+80hCZJmsBiiJvj9gqNP/xzx37uX2IaA2KEYNWNeaPNuWJmKx1uPROJf/UcnHIu1AAI88L0RmzK+ioGVrU33LeU4KngXzgq54QfmXYKLOFuCVu9mmsbDMqLJVqcZLYOaPaYgEhLWXdW9vVlHvkLs5j3IK+ZZdYg/RH31huR5q8+fzuFLsz3+J/6MD5LzAu/bCTgJINtQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(122000001)(38100700002)(52536014)(6506007)(5660300002)(4326008)(64756008)(66476007)(55236004)(66946007)(76116006)(186003)(86362001)(26005)(66556008)(316002)(66446008)(2906002)(110136005)(54906003)(71200400001)(8676002)(55016002)(83380400001)(7696005)(9686003)(33656002)(8936002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UEFZU7HD9IIf11Pz5DfSdXhqIO4deIjff/15IlZm/bP/nlSHr4vDzTbxMZPG?=
 =?us-ascii?Q?EdJJN9TvzEpEEkqGWB6VVHwT59zFeqVqyO8Ldr2PQd+CZl/kVaHCncEHtXiN?=
 =?us-ascii?Q?ok0mrqVVbLr0C3tSzCZLySY9rdaDSgCVE9lOAgpV3eniNmHtJ4+DTCJTYkwL?=
 =?us-ascii?Q?2KAdNfk7ujERigYhmqkRwhsCcFTTnanS5z/P98yG/ZakCuinvZDjIdD4KFqd?=
 =?us-ascii?Q?I0oSkmZzBbel758zYGOIelDJZTkt+4GXPqvGx1XJWFp12Z4g8w/mjBCBwJQg?=
 =?us-ascii?Q?YBv/dLWtzISohbxOTL306aC2nADhAWycatWRM3NtZBoSMlLhfif7Ainjt9cw?=
 =?us-ascii?Q?9S1K8dfvK1L176chll6FQYNbo9TxtIY5zsUK/BMPX5/gjmfO8wdQkrvcrfb2?=
 =?us-ascii?Q?65snrjuqqzXL5lc+AcutplRyjyfDp0Z0oaaxWfrfklAqc6Rhcffrudt5L+vP?=
 =?us-ascii?Q?RgYQaoDF5jYWHaAW4HNG348mWDIThRw7fxYY70k9grw09OUtPT+RDwf7NYPv?=
 =?us-ascii?Q?wWDfIxwPgndW0DyfqfdbDchKFRbNpzj1rz69d6AAvCluWwEY3ijAr0gzaNlI?=
 =?us-ascii?Q?Hxk8Uf5aTdylJudzrcb95WYKF+Apd3ujF1uljtLXQHvOHlgekaJku9iqcQJJ?=
 =?us-ascii?Q?c58H0s4XF81OlTKM73BthpP7r/VqHM4NEH9XOIJdghu8U/MzcvkjkqAmT3aJ?=
 =?us-ascii?Q?5dvuJDWQPKYH0Jo6X0IlhY9NHdUfyoKgOYbl0J/uJTM9pQKAjyVVVYQLmi0y?=
 =?us-ascii?Q?ZWn7E9HTwJEOn+DWcGQlB69eLIF0OEa087Qp6dcGuY+R26s72JYWH4617qe4?=
 =?us-ascii?Q?xUDbc4IJQ2AeyhSs+/CppLi4TlO6Jmr6fTPvFtjWOy2+EKEM5Q2WFd+UQSYh?=
 =?us-ascii?Q?4cStGWDY8CK5bUUCJ1NP81fFVBv5Lf3flSO5hc2wKkKIXf3qe/O0HaTaamH4?=
 =?us-ascii?Q?Nhum/BpTfXOSVGN0ecVM0+8C+Tx5de1Ke3R3KaKVAbwHXM5VSplG979677ju?=
 =?us-ascii?Q?KP7YpM5OKuRiVPxywIzEmNpws+/RnVfDjUzf/8bJUgeOEavDF9nAfY6ncBkH?=
 =?us-ascii?Q?wePU+ZCsGHfhNiDvgWzS0IRzfsEggiL3Sj5vVIkicQVvfHMR8lW/Mu8F7RVY?=
 =?us-ascii?Q?0bHalkR3uMhzJfnbUa6bfYnAsusZ6doUq6b5TWZCMeemeHWK4mT9hYh831y+?=
 =?us-ascii?Q?UsLO07IIUTy1huRLdiIzpGrr6Q4wejBE0HdXRgzwNd1ItPXie4sDQOmQFSnl?=
 =?us-ascii?Q?+h1ogNvk6j05Ndud7thR1FzZ4y6ZKDUNHxQwdGA8EdA15PAzTXrjRXGxKxO/?=
 =?us-ascii?Q?2URqZL0UkmLr/92Ugrz8hb5W?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b924b57-57a6-4368-474c-08d9257ca6a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 04:12:34.9673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErwOXMPzvX74fGufausJqu+KqaXUu+MmXS/YE7pejwRlzi8ysjeXLY44qIkNhHLVlMpotnZJ/6b418deGq8n+lJbwST7azN0fy8s/oydRMsBe2bLsYpQ82JFLYft9NqS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2058
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, June 1, 2021 8:32 PM
>=20
> Document support for the Interrupt Controller for External Devices
> (INT-EC) in the Renesas R-Car M3-W+ (r8a77961) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
> No Linux driver update needed.
>=20
>  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renes=
as,irqc.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yam=
l
> index b67b8cbd33fcb1a0..abb22db3bb28be29 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc=
.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc=
.yaml
> @@ -29,6 +29,7 @@ properties:
>            - renesas,intc-ex-r8a774c0    # RZ/G2E
>            - renesas,intc-ex-r8a7795     # R-Car H3
>            - renesas,intc-ex-r8a7796     # R-Car M3-W
> +          - renesas,intc-ex-r8a77961    # R-Car M3-W+
>            - renesas,intc-ex-r8a77965    # R-Car M3-N
>            - renesas,intc-ex-r8a77970    # R-Car V3M
>            - renesas,intc-ex-r8a77980    # R-Car V3H
> --
> 2.25.1

