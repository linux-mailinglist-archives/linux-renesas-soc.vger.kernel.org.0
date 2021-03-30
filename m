Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA9634E50E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Mar 2021 12:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhC3KFW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Mar 2021 06:05:22 -0400
Received: from mail-eopbgr1320117.outbound.protection.outlook.com ([40.107.132.117]:17040
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231584AbhC3KFL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 06:05:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnpZ+nWb2s/pOgWBHzRAB90aHjdgdCtQU8XYCzwAhUHhhSjTGvmQ+YGWuWUXvdtmLBKa8GmpKJEdf93wf0nSCTAh5QrbUfcgdN64uzdd/rgHMGtDAVGkMIIhHybIO8DNYhDhQ3hMq0kqC8buunAKIZPAdTfU3ebUl+hbWhFRtyv9gfmtGCcYQZMPryXSha4Ydda+cvmy4D5U/MxBTRLmTYPk6FQoAAGaOc0IL7ruNP7V+3DMJvcevkwsGjHSwlk14oL3Quw7+oj/PNlMxFBAcpf+otzOxpoOdKM36MwDLI07LGZhTlN92gWfgrgB6M50KN8gL76RrZUtSi6I370Gsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/UaxoklHKIWdlIBMm3TiX8FEra+sucYE2VKfkhr0+s=;
 b=OtFWyrf1EAaiod6q/rjt3UV6W3NXruD10Ke4xx1Ep/ZWSWJWLDoaKWFx+mJiRRYlmJ2ZuoVAnXGRpRO/dhA6aZlHNiiK73YqvQ6kxMn1WUB3a3p1bgfaeuBUUqIr7GvZPonMo4/wC+VF0s+CaJzyAMtUxuUb9tkY5Exs7xMw/1bHFSliG4aIgGK/Cq3DQDpSQx3+DB5dukZ4ClpkUek56qMXJJuUZzJhavo8jPvwNFyQaYs0rqhBPuxlQoJ0RKVj+Qm/o+sq82ORVq6pZKSerFFK7KHSJ1/id/Ho6Fa7tYmvzgO0AVmmyfidzuUMgRSBqbR9lbGk7UyQQxfOEGedbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/UaxoklHKIWdlIBMm3TiX8FEra+sucYE2VKfkhr0+s=;
 b=HmgIgqpiDr5NLyB+gu1i3SDkadTr8cJXayTub4sAjj51QEvfjb2IKTaJcT5q0o3/bnbJZF6yzNXIV+kGSnQQK8m2T0EXl4c1RJ4VkeNFM0lv7l/XQvCFBDHigdYpdqSZmgowMYz3fr1R1smeb6eKQ/bu3g8V7vXXQ7yQQPxX+uY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2347.jpnprd01.prod.outlook.com (2603:1096:404:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Tue, 30 Mar
 2021 10:05:05 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 10:05:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH 0/7] clk: renesas: rcar-gen3: Add support for CPU core
 clock boost modes
Thread-Topic: [PATCH 0/7] clk: renesas: rcar-gen3: Add support for CPU core
 clock boost modes
Thread-Index: AQHXIjf3NlWPca0VKEOVehXmdIWVA6qcUcHg
Date:   Tue, 30 Mar 2021 10:05:05 +0000
Message-ID: <TY2PR01MB3692C5E461ADF12E848E0180D87D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210326120100.1577596-1-geert+renesas@glider.be>
In-Reply-To: <20210326120100.1577596-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7d802a0a-a592-413f-1715-08d8f3634a9e
x-ms-traffictypediagnostic: TY2PR01MB2347:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB2347018A03E61F2CDEDBB024D87D9@TY2PR01MB2347.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FMKZW26l/+wnAsjnVhu4+gJOZBZlE09VtEpxbg6a8+msplCuk23L+L6Cqhdd3eDFGRY0KWsA4oT8sIKDP+iljgAaXZ1ZNeO6sYt4ATjYPm6EsmJoZPhK/Eep6M0sxnhUcgPDvl1B1H6p8D3oNyhwsJH2JhK/0k3H6jrIKeXsP3JFV3bJlOMLZXgUaLZeA9UpsODWuBMK8b5uEKZVjRDsfkr+AvHXm+NqMYqVi2wOhrUtabztjdDfFpI9qMISU0LmEF0bzD/i3q7HHSuAhwBWvoH29a9DgcUFU7eiBrfIqajerF79m8F5GIB9RFdPgbx2YXsInf5OtsTqlfUHxUEkKoPSC0H5ZPTQ0v2RtoMj20YLH0C5yDSVVyRNIZVNEdWdtIRjtCaZIQncS/cnrvV+hmMlV8zLvSpMUbbFsXNhfEh+Ts/EEb0KeJO+f7wg4mTVnp8CDkXranlOZ9nH6LwEOF9/BIpqG1aZ49DdloPRxirkYJdJKE0fyJ+CBkUg2a47f8x/Z8VMyZJwe0HHgHw5LeswBQjqjKLAerGtLOSmv0JdK7WeGEHat80abNbEjMw8wu3Jc9uwnfEWhaOiuX1IweM9GPLzjyziILygpjD/c6cY0ZMpS1Y5mkusWn2jR5doCH9wUElN8TfpoYH/301RgaX+rdiGH4gf8c+V84oOM7A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(76116006)(66946007)(55236004)(52536014)(33656002)(66446008)(66476007)(66556008)(64756008)(478600001)(5660300002)(83380400001)(6506007)(186003)(9686003)(4326008)(71200400001)(8936002)(316002)(26005)(7696005)(55016002)(86362001)(38100700001)(2906002)(54906003)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iuZrbxY1K1KfRNdx6w7Yhb81m/FZbGkngo9wS0HSQYbwMfy11S+t/s/MtsHZ?=
 =?us-ascii?Q?XmK4gtXb3iS5c7iUC7GkzHkGWT9NGHz+jFYwTjn/HM0bm5je1PximYS1z/ew?=
 =?us-ascii?Q?29qvnpkqyjFeybsrc4wGKqAZjuWbSfLz4M7iF+WSlfXh7QSR8u/5u3rB65NZ?=
 =?us-ascii?Q?jUyQyx3ekeYHJKJaYzeJVQx+3EnAU9SDa0NmfTk7hu95J5s/NDtEGFa2lz9S?=
 =?us-ascii?Q?D+4d3tE+yVCtkatyTDMh9ejDrRUV0JAn3+FYDhebWZW2s/xMk2bciZz1ksF/?=
 =?us-ascii?Q?D1DsGUELRPsQLlXxPpNmdileLTA+u0gAzSyGzYNIwOc7Hap3e7MHIsKpqbqC?=
 =?us-ascii?Q?RytnukkaothLjqFrGB8ukWgAaLfi2IagVX7Pxay3Su0YkiqZbA53XS41kIou?=
 =?us-ascii?Q?CvjbB3p5YthS5fhFCpZxBVCGnjYZsiR2bOdtYflO7TT0Kj2sEoYHVkMvis11?=
 =?us-ascii?Q?uub+n2z5aTjrK8Odt7DqfpaYgBRf5FF2GJzsidVjmdzdcmog6QPbUNTapkn0?=
 =?us-ascii?Q?tnUbDHtFydfRL9+ZsrN02S3093olLsSoJBwDXBRC0Yw8tsijW7q0dYq2UMLR?=
 =?us-ascii?Q?3o9qWw3VB2svGz/0qo0DPkcA4lajCn2LwIjR5fwXb1nlu6AShWyHSBdKL2jo?=
 =?us-ascii?Q?g4i2tBKW5oJ+lrdHxAPgCYKl70SUDvN7aHNurqRqaV4/DRN8MaNwRRiLwOU9?=
 =?us-ascii?Q?Yc5lZxkpPewIN9HxUNGvmytpFPqajGQgHeRfsm+n6j8uTMa5/mhlk9n4ujoD?=
 =?us-ascii?Q?cbiHfDXZTeUKnkaPXRx/F8xWcgR7bWREvHOKz1KVDP+Baw/bVUrWFvwHzYc8?=
 =?us-ascii?Q?3G371k5UZ+3OGG+G3kwq6Ae9euvfWGemST239OwSG58m+bsvr7bVG/vaTznt?=
 =?us-ascii?Q?XRI2csV94k1qK4LwffYQVxiLzbI1EkkP8s+uIGmRq2P5PRT/b6JatQKllg6j?=
 =?us-ascii?Q?bovEQXVWcwQiRVXxFNYSYbhyhuugWUxi1Ef+8bPjXdEkVZO5SGsnS5kKCTeT?=
 =?us-ascii?Q?XRbnEgPSMOE/+GX3AelMxhJKGmirjK8/LsODShlG4w3dv9vP8+bandcC0J3m?=
 =?us-ascii?Q?IaGobkEAcpnAQhT4HRPLXoOmmRh8kbR+Ujpp0qdQf5lx2Ul1ys3X1Sh8qT3T?=
 =?us-ascii?Q?Gs+FZCUBatDyu+CTcjEIgeapUVMzWhQNtrZ4Q+vpjJIpHbgGw9uFv3ZmDHqB?=
 =?us-ascii?Q?dqKuytsYnCeZl1BB32Ci7A2OvG/Ls9+Jnm6k/0e2Y2dZl5kVVf0Sd5q9y7BF?=
 =?us-ascii?Q?KPp1MR/PlxbvF0tzCOg8+8kX0E28nt69CbFNro5F/vyCUR3JGWkmDwuU8MpZ?=
 =?us-ascii?Q?scF1wwBTbGRUUj04B7NKTLO2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d802a0a-a592-413f-1715-08d8f3634a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 10:05:05.0892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNdrAOk3v87hTYk/q8/p8LXmpWaWrwq3QlsJ4K9aKzEKBnG7oI3n8SuZb3z0KEDQw/KYBL7Ua4hKusFYfD814pAMwcOc4uasKGaQ2FKt+xaNzxyFPa6kIMMNlukiXTjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2347
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Friday, March 26, 2021 9:01 PM
>=20
> 	Hi Mike, Stephen,
>=20
> This patch series improves the accuracy of the CPU clock rate on R-Car
> Gen3 SoCs, and adds support for CPU boost modes (marked "turbo-mode" in
> the operating points table in DT).
> As usual, it is preceded by a few small cleanups.
>=20
> The easiest way to test this is by enabling
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE, and writing the requested clock
> rate to /sys/devices/system/cpu/cpufreq/policy$n/scaling_setspeed
> (n=3D0 for the first cluster, n=3D2 or 4 for the second cluster).
> Note that you need to do
>=20
>     echo 1 > /sys/devices/system/cpu/cpufreq/boost
>=20
> before you can enable boost modes.
>=20
> The PLL rates and CPU clock rates and voltages can be monitored in
> /sys/kernel/debug/{clk/{z,z2,.pll[024]}/clk_rate,reg*/dvfs/cpu*/*uV}.
> The DVFS voltage measured by the on-board max9611 can be monitored
> remotely using iio-monitor.
>=20
> This series has been tested on Salvator-(X)S (with R-Car H3 ES1.0, H3
> ES2.0, M3-W, and M3-N) and Ebisu-4D (R-Car E3).

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested on R-Car H3 ES3.0 and it worked. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
# I'm not sure adding Tested-by tag is suitable for patch 1 and 4 though...

> As boost modes may be unstable without increasing the CPU core voltage,
> this series depends on "[PATCH 0/2] arm64: dts: renesas: Add cpu-supply
> properties for DVFS"[1].  Hence I think it is better to postpone this to
> v5.14.

I think so.

Best regards,
Yoshihiro Shimoda

