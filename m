Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5A0450726
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 15:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbhKOOif (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 09:38:35 -0500
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:42336
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236802AbhKOOhH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 09:37:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCfJFLIXHp/gPtnf8kYdKZ7O8fwYVppPfvm4g2+QaHhBZU2U5hBf/0jlMvY7VBdGR6iFQWb5yPt9uQ7SYgPOo9IMEMIcRjLGYzH1swVaKT1BrrabV/bOT4S8t41o3ag+Ja4/pzEnWoEooKGXMiQs3hIU29HvmMKD/fPsmTmg3pjRTKZtJq0NeTchnnxkXH5ePe7T8PWax3IS5zIWJp6TIZVUn9zL1KfccSu+atocgm6pn2d8w0tOX2CJJZm4/mu488j0MMsQZH8VvS3Y/+WsfSVjdugFtnQIQ30oXA6lCiVINOz4VfGz1lmqBrY+wYWqqSfNvIIbEn17jf0d9zPX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Tde6zNICw995H9vX/Y7Y1xFWeoFwd/vo46mNPEb23c=;
 b=iv+t+NbIoZMUB93pKYLxjGPQBv/UnLC7FTPs/1omm4iereL6lTrY9VitCYTVpIDJqheoHLmQepp5TbVb+gjpeIPTepmy7XrEplCOw16DU3CokBw8hFFeE2U0AJ1NxDYTHLNM4EGjfaNMGSPOP2Da7o/bE5eNMCU6z1IzOx8RWNA0sTLxmm9FzVU/YyC0OsZxsPuRQwMiU8H5W8Tcu7Fs9WAK65Ul0wjvbT1uqSuCsfyLkd43m+brIkUIDaAuYDz5dEOOsxlkhDnFCaJ1D8sS6B3VZylrSxskhl/noCgtMNeILnm/0JtAgNfh0Te3kezyLn9uN8MQXiSuTSHB3FmpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tde6zNICw995H9vX/Y7Y1xFWeoFwd/vo46mNPEb23c=;
 b=h+Gt0hNBRUCrNXjPGj51RL4RPKSHD8h9QbCAU+8XVKA4tEQEVIqXh+0gLzIiUhd8BurRyViNAZ5Y+XT9mGtAEy7p7zFjlMU56BIStHXyIMqyTY5r8QVxtVgj44e/CmC2hgdwoqhHsXOLUyjA4daje/WR1FxuswJ6QdbFZFGkMxE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4082.jpnprd01.prod.outlook.com (2603:1096:604:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Mon, 15 Nov
 2021 14:34:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 14:34:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [RFC PATCH v2 00/21] clk/mmc: renesas_sdhi: refactor SDnH to be a
 separate clock
Thread-Topic: [RFC PATCH v2 00/21] clk/mmc: renesas_sdhi: refactor SDnH to be
 a separate clock
Thread-Index: AQHX1md0JjZB7mYmWkWf3VwZdHwxSqwErpiA
Date:   Mon, 15 Nov 2021 14:34:07 +0000
Message-ID: <OS0PR01MB5922A97F46F04F3EBDD8E55886989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06aa9b36-bcc3-40e8-e0a1-08d9a844fb7b
x-ms-traffictypediagnostic: OSAPR01MB4082:
x-microsoft-antispam-prvs: <OSAPR01MB40822F8017813C0BD9D2F9DE86989@OSAPR01MB4082.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U+oakMXtXSHVomKNsiDOf4RfIyC7WpN4MxeHTEf1iVQv9+epu/ZYixEaThKYfcqy6LLDeV+nXKyQ/PQgdA0YZnu6+Q9A4A6oylp1MzXuf3VlttVr+awXDEc/XXSZH3EreHonbH7U1htouMtjOtXRjUmA76xwDCccKpKBWAjYjc3xo0hAZlCUV8cmIfwANpNjlboPIHoqWSBjlH74ozb2DaYB8KbeJ3tZ/GVr0xejgM5TG+0eRhuA8NuKgF4iVKvweo75LBSUEcgmPNgT/BHq3YfxbUcDPvRR5AANfT4M5XEPvd+xfDvNCVWh8AsSWdUwwTE3hwbYlVE7QcI9tZews/GOK5aSW9USp5dwJzPNb8sonZtfIZ/ihH3lffL2+VXHx5D/jcsp+j4OH7b1D28cj78PXr46zTQE4X9vYD4FgYFh83fHPA3NrMrTdQldQ+h+bNrYBTievcc0eMZHddKMQNPFG+ZC9wWeIKgAB8AL7mLbC+eIS5If0CP/3yCbno3TFCeU0JgCrF3ArT71h1OuA+ZOAzN3ekDgToqyDvOHf/YL05RM92zX3Zb8qtwh3rWpnEzQMsriJ3//MxyDKKHwRgwE8o9Lx8Sp0kQ5Rn3WBOB1Wh7GguWFiJwjBx55MVaCqIWuDQJHTmUrCFiu/qmneIadf+ip4IqSbBFGyaTd1DKZ6DT7mhkH1W/dqvaQotqGJpRv4Qjo1X84TAr9J7GkhA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(5660300002)(6506007)(66946007)(33656002)(38070700005)(122000001)(316002)(110136005)(2906002)(7696005)(38100700002)(54906003)(71200400001)(4326008)(86362001)(9686003)(66446008)(64756008)(66476007)(66556008)(83380400001)(508600001)(52536014)(26005)(8936002)(8676002)(186003)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dKUfZoWSb+tQakIdF4NUg0VvYwMEEtAIBWtDrae7odyzagYfavUazR0LKZQM?=
 =?us-ascii?Q?VFm4HdJtcf8gJxTFlOG6QZdUboRUcnncN0UokNxKNd3vl5AR0v5JDYw8zKkF?=
 =?us-ascii?Q?flL7825Ab6lsdi/FCwjO26r7Z3WdwWRBzlkMA/NbLFEcBn0JoZ4F6JxwXwrx?=
 =?us-ascii?Q?dWDq/+DPzKPL74JbAfIwXa9HsJRCAPbZ1JTAcse48dFa41LIsgVB4FYXpG5j?=
 =?us-ascii?Q?bA2ciVSob6g+PJPzoRVQy9qKI2xOXyR0zxpuxQaDJiQhNjhIz5pL/UvXls+Q?=
 =?us-ascii?Q?WNJcIEbzV+9YypqofTg5j+ufUtA3uXbnj3BTRXAuMwKW5Ab8/L84dFYmfMrl?=
 =?us-ascii?Q?2SZwqBvUFLB636z1uyQxCwXD7Yru8LeFnXhQ+XMq/IX9vwaTZq6Sm+YIOd89?=
 =?us-ascii?Q?2Y1HYZh49Bvj9DEE6rksv0X1wEANX64Ugt5MPiH5NFG2N3k5TgOkXZwnxZqp?=
 =?us-ascii?Q?Kryg3pNk5aR1kL8TD/kvbbvbYpVRrUZz09S+Av8wVTqUBl4KjdcVKCs1+zWc?=
 =?us-ascii?Q?cvwziuT7fYXT45ROlF7i4UjvRqHP4UIOtfBRhPb3WiKypPSUw5KiLQuHgrSJ?=
 =?us-ascii?Q?E5qzl+K9xxEQdSnE3pJjGQyZArq+G+aFms9R/9h8KGwbgOYkz58MgUtx7jBE?=
 =?us-ascii?Q?z5wFlK8oAuoHlFJuzpuzTRhzOKa6dtxp73BYR7q10QsMbp36+e1x2ksZIetj?=
 =?us-ascii?Q?ReapIke0xtAYSaNr5WDrkjppdU3zCPzMQxK5Ceu/BNiZ1BFJG2WcN2pWZgdo?=
 =?us-ascii?Q?e6mG8gH+WAc4b4sye6SUFCUFCCT7kJm/QZgYHCWrwrrJzWQINUgzxrKnr2uJ?=
 =?us-ascii?Q?s6HZoPg0KuKdFP+7LQC9gCzH9LWQtFKY98STZ7p9mzXp9Ijf3q7dw5j2RSnW?=
 =?us-ascii?Q?C/4aNcyePFZWYQ9FFd96o/DhLYqsoXtD/CH0Pp6BJIrmn70fSxvfTcYjaclp?=
 =?us-ascii?Q?Qr6pukruQ5F/y9q+l2x1MhDovN0wI7FhuBqmoc0EWbClqX45/sC2XDbF6qo4?=
 =?us-ascii?Q?oIf2I4zlwWTKFcMHNQPOT0vrLb+RKQBBVa94UAIFpIXVQNyzBR10fAs7gu4y?=
 =?us-ascii?Q?Dsy36HkmCJY0XJGmfx+bxiS/NBNJSBGpf50a5/AZyCDa+W7YOa+V2ykawuY2?=
 =?us-ascii?Q?iajyfWqhEyzaDGONxHgL2SVUltDatQ24mAUbfRMK7HSmsAnbdwKEpbDetwyN?=
 =?us-ascii?Q?ssD9ZsDEa5b9b+ME9RFcLZmlq3fxvbCbqaXoGRU/hRc1js/Jio5RQAFnAYxm?=
 =?us-ascii?Q?RMsxUMdjOOLcR5d6EkXzzy7JeVbY63PB+rfytv2Wa8scSWHtRhlMIU7gzGm+?=
 =?us-ascii?Q?I9W0m4oFHVbWWOKXvhKZfpwiJhfDI843A7y+OFKsC7wz0dl9wNUzA5K5y5Xs?=
 =?us-ascii?Q?QHskjmcNAx1M4ElXrnAVXPBnyYYCLOhAKUYIQazidoLiAUARrCckExdfyOA+?=
 =?us-ascii?Q?hkEipYAqh7Oufq0OkqxFgkp6eOtesPZfjOv27TCZo49p1a5+c9aNPxRCWmr3?=
 =?us-ascii?Q?eYnPlTfx4vzU3L5wO2RbqNKzbta5ZTIvDy93GBnBAKkbBigxyRKaFOQhaV94?=
 =?us-ascii?Q?wfnvfYZzJ3qn3yPLtbpKNxmkT6OyXgFYf7zpNHeqJmBKjKFGMF8L1fp4kUHT?=
 =?us-ascii?Q?XJpXpDBn2Ps2T7WZFPodr5rxj/4cmBMOcfozGUqnZPVBJXFfk0AMDx5W/5Kt?=
 =?us-ascii?Q?Sy0cYw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06aa9b36-bcc3-40e8-e0a1-08d9a844fb7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 14:34:07.8036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AoVnKXt8y1hJyT+g3mRBYMCFzsLZHCGx4DgmcUsVZiv0Bt8bqsklqDBex+klpDbamp2c6NAK1xgn7616PrI44T7T2eBfpGxJ0imN5N+Nxjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4082
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: [RFC PATCH v2 00/21] clk/mmc: renesas_sdhi: refactor SDnH to be =
a
> separate clock
>=20
> Here is the second RFC to refactor SDHI clocks so that SDnH is a separate
> clock. The main advantage is that we can handle per-SoC quirks regarding
> the clocks now in the SDHI driver rather than the clock driver. This is
> where it belongs because only there we know which mode needs which tuning=
.
> Also, the code is way cleaner and more readable now.
>=20
> Geert seemed basically okay with this approach, so I continued to work on
> it by addressing his comments and adding DT updates for all other involve=
d
> SoCs. I also excluded V3M now because it has a different SDnH handling. I=
t
> shouldn't be affected by this series. But it may be that we need to add
> V3M SDnH handling later because it may be missing since ever. If so, this
> series will make that additional task a lot easier.
>=20
> The downside is that patch 4 looks messy. When switching from old to new
> handling in the clock driver, I see no alternative to switch the MMC
> driver in the same patch. clk_set_rate just has to work. However, the MMC
> part is small, so I hope we can deal with it as an exception this time. M=
y
> suggestion is that Geert takes all the patches via his clk and renesas-dt
> trees wich MMC acks from Ulf. Is this okay for you, guys?
>=20
> These patches have been tested on R-Car H3 ES1.0, H3 ES2.0, M3-W ES1.0,
> M3N, E3, and V3U (remote only). On Gen2 a H2 has been tested. I tested
> SDR104, HS200, HS400, and regular modes. All observed values and relation=
s
> in 'clk_summary' made perfect sense. Actually, this is the first time all
> quirks are correctly handled. HS200 with 4tap was broken before which was
> the initial reason for this patch series.
>=20
> Detailed changes are in the patch descriptions.
>=20
> A branch can be found here:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
> renesas/sdhi/separate-sdhn-v2
>=20
> Looking forward to comments and testing.

I have tested this patch series on RZ/G2{M,N,E,L} boards
and all looks good.

Regards,
Biju

>=20
> Thanks and happy hacking,
>=20
>    Wolfram
>=20
> Wolfram Sang (21):
> clk: renesas: rcar-gen3: add dummy SDnH clock
> clk: renesas: rcar-gen3: add SDnH clock
> clk: renesas: r8a779a0: add SDnH clock to V3U
> mmc: sdhi: internal_dmac: flag non-standard SDnH handling for V3M
> clk: renesas: rcar-gen3: switch to new SD clock handling
> clk: renesas: rcar-gen3: remove outdated SD_SKIP_FIRST
> dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
> arm64: dts: reneas: r8a774a1: add SDnH clocks
> arm64: dts: reneas: r8a774b1: add SDnH clocks
> arm64: dts: reneas: r8a774c0: add SDnH clocks
> arm64: dts: reneas: r8a774e1: add SDnH clocks
> arm64: dts: reneas: r8a77951: add SDnH clocks
> arm64: dts: reneas: r8a77960: add SDnH clocks
> arm64: dts: reneas: r8a77961: add SDnH clocks
> arm64: dts: reneas: r8a77965: add SDnH clocks
> arm64: dts: reneas: r8a77980: add SDnH clocks
> arm64: dts: reneas: r8a77990: add SDnH clocks
> arm64: dts: reneas: r8a77995: add SDnH clocks
> mmc: sdhi: use dev_err_probe when getting clock fails
> mmc: sdhi: parse DT for SDnH
> arm64: dts: reneas: r8a779a0: add SDnH clocks
>=20
> .../devicetree/bindings/mmc/renesas,sdhi.yaml |  16 +-
> arch/arm64/boot/dts/renesas/r8a774a1.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a774c0.dtsi     |   9 +-
> arch/arm64/boot/dts/renesas/r8a774e1.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77951.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77960.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77961.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77965.dtsi     |  12 +-
> arch/arm64/boot/dts/renesas/r8a77980.dtsi     |   3 +-
> arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   9 +-
> arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   3 +-
> arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   3 +-
> drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a774b1-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a774c0-cpg-mssr.c       |   9 +-
> drivers/clk/renesas/r8a774e1-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a7795-cpg-mssr.c        |  12 +-
> drivers/clk/renesas/r8a7796-cpg-mssr.c        |  12 +-
> drivers/clk/renesas/r8a77965-cpg-mssr.c       |  12 +-
> drivers/clk/renesas/r8a77980-cpg-mssr.c       |   3 +-
> drivers/clk/renesas/r8a77990-cpg-mssr.c       |   9 +-
> drivers/clk/renesas/r8a77995-cpg-mssr.c       |   3 +-
> drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  17 +-
> drivers/clk/renesas/rcar-cpg-lib.c            | 211 +++---------------
> drivers/clk/renesas/rcar-cpg-lib.h            |   7 +-
> drivers/clk/renesas/rcar-gen3-cpg.c           |  24 +-
> drivers/clk/renesas/rcar-gen3-cpg.h           |   4 +
> drivers/mmc/host/renesas_sdhi.h               |   4 +
> drivers/mmc/host/renesas_sdhi_core.c          |  39 +++-
> drivers/mmc/host/renesas_sdhi_internal_dmac.c |  21 ++
> 31 files changed, 261 insertions(+), 289 deletions(-)
>=20
> --
> 2.30.2

