Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39F757C188
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 02:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiGUAYM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 20:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiGUAYL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 20:24:11 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD784F1A6;
        Wed, 20 Jul 2022 17:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmtVYOlvfKMMZ4H+Xp3Z+xnG3ROU2IjVCLI8jXaEf9WhH0i8V9clXZ09N/IesRh0VvQViO4l3EyVTlNQLoV2ij1fg+u7HGhBGtbDG8XUgm5ZokTpxDg3VqVq/SEPYi739+6Bf2y5CI4JchAKKs3wjQ1bSGO2pDL6jQ4Zo5smMDo3WYxgCKb7Aix52rrlHkBGIG7vhRIlc9uOjF7uYC1/uTozFc3VtowM6FlYADJP79vI1mIxjTktw4srjZC2QCPfmmm6Eelld7szxhE7wUWq9v/Of2okB651l2DDnBEXYGLap1yQpg7IUH24CpUTW5xwy26K1erC02YjZIO8YvfYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLX/dIga/QzPRZxwyS+jCimsbNXJsLPR0Kf4kav+7ys=;
 b=PEaCdmDZsjzpypc5YzGmqpPzzAf9+1zX2CCynsr2cj9s5JxXl6QgIb6d94ZXISTOe+lGqgUr4sC5exuJ8v334pwuX16C9xoVgjnIHf0TPXvdGY+fanvDQP7dbQ25sjPDuh2ReyM2vLJaeLJ0CmoFOTa1WAGe4eCuORc5aNbyHQRQEA7UMiXAk4WXNxnnOUc3nLii60p2HUXoKo3oTiRkG+SBy+egi5ZW5wLnSJ0JKyt+ZmhP6Zar+FLTz/lgLPWdgg6S2h08Y0lusRGFscLqkUeJRlGYfcUwa0CRkP2j+1RQhUAHdtPV3uqHQ4qoMgbDpxBjkNSxz9LlHJijZ044EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLX/dIga/QzPRZxwyS+jCimsbNXJsLPR0Kf4kav+7ys=;
 b=WZVkxiGJEXwO9xZA0oSzDpPpSdobxu5nLgJ5PwTpLuAtn/d4iqfyrjNHOINyv2E4zps4+HREzl+6t1sIEZ1BX2b7cCLQtvisMj3TG8ey3cj11uS6vK0lkkyU8pAXsizh/qnl5NdZXd92hCKVeniXda4DGI4PCeHXl/Odnsi/WDY=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 00:24:07 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%7]) with mapi id 15.20.5438.024; Thu, 21 Jul 2022
 00:24:07 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/6] arm64: dts: renesas: Add support for R-Car H3Ne-1.7G
Thread-Topic: [PATCH 0/6] arm64: dts: renesas: Add support for R-Car H3Ne-1.7G
Thread-Index: AQHYnA/exUX6k3GRwkCPjZNDXJ8pEa2H9Y+A
Date:   Thu, 21 Jul 2022 00:24:07 +0000
Message-ID: <TYBPR01MB5341FE860C3BCC8D6E764854D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1656072871.git.geert+renesas@glider.be>
In-Reply-To: <cover.1656072871.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74e029de-b119-433c-45c2-08da6aaf5319
x-ms-traffictypediagnostic: TYCPR01MB8440:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EzVYx64zkoCYLtrU40MmmZDR0oJDADHFt86BwhOkUlzZ2FHI1EXEnlozYRpO26WNLgM5mkuO0+4f2/qMybBIfgaGd1C9f2dnPgCLlRvMIdD/F+aC91ZKyQlkbsUYaUywC2PQ/W46ACvm/v6yJjUAFlZloIbacsI/C6QKnXeppMFm0QShNO62sKlQ60N831u7xD7SlBzMzLuPM1+hsZezH5dMLHFMcfBBiCnKSHCvJg5ED1od+w7dIYnaAFtFWvTIJ+0+e0VV7IezHTBVMYYwG4or/plaZ9PwaqwVfdmg2C8GaKqoHYOZ10xvrbZifIp2r/0d50GHLRzWRV3GfAlVBV1orivv66PScz65enp7pyvvPRKp8ecp9rH7CAQEV++fai975zR7vGnZ09QqCb+dd0xD9NzdmPkDUv6KhAY76Nzf+IMQp2QXzru+cgcbkJivOPTRyeNRSF9fgXTSiitpYJ8wdrLtti2wy+Lf3DvjjoM5X4iuGUyIi2DhqcLfO3FbRcRbTkZuUrsZV9dI4/il9qv7HMjD9fCO4fiAnxaSB1prjKx87kVLPRtJDbFIe6fV9SirPqpRAmbQhtjUkZGuUmnlKg0BSj9vdk5Rd+zjJmHAbiPc6Cy/JFwutcuHwwxLw1zXIERscuZAaHipLsxN7fwD7N1CS1+V6oYkOed3ImK32QfeenSq2sKh56IHzhd8jr1b5Uif2UWldUOMMPgkFUofkdukV9d1sWD2tMb+BTHz1fukl81wWkC1SKe5AMeTT/bsOZSGa/f3R+FnYX1sRCXMSowZz0eoaHGy6AkKAP9W7A3eQZtRQIqeZT2QYXztnQFUHA9Oye7HnqNkS1q2Yg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(7696005)(6506007)(9686003)(66946007)(66556008)(76116006)(478600001)(8676002)(64756008)(66476007)(66446008)(4326008)(2906002)(8936002)(54906003)(86362001)(316002)(52536014)(110136005)(33656002)(41300700001)(5660300002)(38070700005)(55016003)(186003)(71200400001)(38100700002)(122000001)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VFx9gH0uvY6FB+zGuA7S9jsWPWsHg0bnmnPoDk2BuOC8RVrK7ezFr7d1NzMC?=
 =?us-ascii?Q?BpjNwCcIACUGTvout9jKDS5KyCD5aVlrwIe6LY5pgz4r3HPF3o2DmjMYwVkc?=
 =?us-ascii?Q?bpBn0Vr2j5H3BnrbH5VXPGVoqhLZH7rmd9zsI6FqB3aM0wH1RGysgeSmCoB9?=
 =?us-ascii?Q?Sd3BDVMZ/nVdzdmn8JtlAZfBYJKngEOULBOLhTAOK4mXNiZbqBv4+KO0MyJB?=
 =?us-ascii?Q?QtDo2wXBwQrIc8vw/9JxL07UoqR0KX0nTIrtUGWayHRiw182yevlVeuHYXZ9?=
 =?us-ascii?Q?EUziaYQo5ongTlKiJZ3lqkMHxYq+5y3xPP/0Ya7zZZj6QEj8SOYemoxdE/6b?=
 =?us-ascii?Q?ReKG71lyfegLM7GPNii7dVTzQQts7/ReyHjHA+igdUuDG7ri7h5WbzWbide/?=
 =?us-ascii?Q?i3MtMBmLRQnR0jUI5siBRYgB0rpPO0nWLVAf+9SJrYEijwFzp5sd+8TGNPLS?=
 =?us-ascii?Q?TSNBqmFYWmxSK4mso87DyVN5QO8sbf2IOzOAvorDLApih2YnALMBoMpBZl+j?=
 =?us-ascii?Q?vFGZVI8RfVwu8hNom4NLabq3Ae7pF+ew4Qm0YovFhD930x3g5A5+fJVrdgyB?=
 =?us-ascii?Q?cAdz9CYdwbgBzfo9AGG0/N6o9AMqOgq6sxdH1CQULhrvwFQuD+1v/btFto+u?=
 =?us-ascii?Q?qf2cAG2ZPGjtmQyCSdFCYY9CLegvcWsYLT5lgs0RKiw9LRYu9RpiM/7yjfHM?=
 =?us-ascii?Q?Xw0nEcwxVH6akkJdBLFK2VC6WWx4NDHuPDrpSAtv/dl5T74gEb5P+VcFtW07?=
 =?us-ascii?Q?6T69ixJV0wEA90pLPdVLaiqUViL+wKo7uIt1PZ9RBNhMHr4XncAYaLvYwaps?=
 =?us-ascii?Q?360ka9WhN4nWYaO3Sa62PQmdQp34UcwHsS9QNkRFRPU/1eFVbVznNiqQHhVx?=
 =?us-ascii?Q?LiJPKD69UED0faurTF3lb6FBTCSPfxOSn5WTgF6Q/aFX+0hW5Tv1Z40QCf83?=
 =?us-ascii?Q?YJxfJlk16Bejz2I8/yAvE9zyyWTNaEpfaSRWibTawlMsfgldS2JgP7seGw41?=
 =?us-ascii?Q?06ZXf6xQnpcQMIMxwwLAmdAfa8g/w5lbI2UThcN78P/J8OsD/fUrSOB8pEZx?=
 =?us-ascii?Q?JMxiXfzxq1Uv3SzOs2fHOFT6NZVtF+eYnOnCbuu3z7wlq6Lb/iQz1pWkyWoL?=
 =?us-ascii?Q?pfapT6dm02tPzCFFBllOTTsMLtptbDhnQntb9FREOMPQ2UDGrn9EcgaWOLnn?=
 =?us-ascii?Q?yYzq8Z0/qNeUXGXJpgjvl6BdcA0AUcS9e02ZHXABT8E+ySoKbOayC90FVu8L?=
 =?us-ascii?Q?90VdskDFHofV19uzHRGMD2I3Q5h5U037+7JcOOD1Ngf/d9OfvNfaWmyO7dXe?=
 =?us-ascii?Q?rfaojICCkiR0QSYZbND6TNMA6x8n6GZjpJsXj6hu3zcv0IdU9Ftjgomgs0+P?=
 =?us-ascii?Q?7N2r2SqkyAvywdqjVwU69+dS40kJMDutyIb7pNEeWswTdFlEHBRNsN9bfNBe?=
 =?us-ascii?Q?7DzzJjDokhexgYMp9Cu+1FU+xQu/pP4vn6h9k9rVhdcJd6xzBcDxjDZVBXqL?=
 =?us-ascii?Q?5/w8IOgy7Zeq+vE/DxsGidDhy/XdVOJ+toEH4hYJv0tDzOLRP8Eh8mepucai?=
 =?us-ascii?Q?4M2Jiod2FnpEqFiankkDoNa/B274lXquy70quEK3WG3YfghXeiIBcbKnxbMQ?=
 =?us-ascii?Q?u0/AAukjnIGWG7u7cchD3IKrns5d4zBA7PdgU+mYY8kdcDxMPjT/qvIbytv5?=
 =?us-ascii?Q?iat/Rg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e029de-b119-433c-45c2-08da6aaf5319
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 00:24:07.2163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytj8r4kIxNXWJUg2Wxn0cuIz9ivIIdZU83A6VYAOI8YEGVsA1pGF9KZzba+WIfDgPILy+Rdc9jsm8ySUkz93Kdh6j7P71EDZqwq0aErklCtZZQgZBQz3UzvFuqIQdYYJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8440
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for the patches!

> From: Geert Uytterhoeven, Sent: Wednesday, July 20, 2022 5:08 PM
=20
> 	Hi all,
>=20
> This patch series adds support for the R-Car H3Ne-1.7G SoC (R8A779MB),
> which is a different grading of the R-Car H3-N (R8A77951) SoC.  Board
> support includes the Salvator-XS and H3ULCB development boards, and the
> H3ULCB+Kingfisher board combo.  Note that unlike R-Car H3Ne (R8A779M8),
> R-Car H3Ne-1.7G does support running the Cortex-A57 CPU cores at 1.7
> GHz[1].
>=20
> The last 3 patches are marked RFC, as I do not know which boards
> will actually be produced with this SoC.

I'm sorry I should have informed you about this topic before.
Like r8a779m8 (R-Car H3Ne), we don't have any actual board for now.
So, please drop these supports.

Best regards,
Yoshihiro Shimoda

> This has been prototyped and tested on Salvator-XS with R-Car H3 ES2.0.
>=20
> I plan to queue (most) of this in renesas-devel for v5.21.
>=20
> Thanks for your comments!
>=20
> [1] [PATCH] arm64: dts: renesas: r8a779m8: Drop operating points above 1.=
5 GHz
>=20
<snip URL>
>=20
> Geert Uytterhoeven (6):
>   dt-bindings: arm: renesas: Document R-Car H3Ne-1.7G SoC and boards
>   soc: renesas: Identify R-Car H3Ne-1.7G
>   arm64: dts: renesas: Add Renesas R8A779MB SoC support
>   arm64: dts: renesas: Add support for Salvator-XS with R-Car H3Ne-1.7G
>   arm64: dts: renesas: Add support for H3ULCB with R-Car H3Ne-1.7G
>   arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car
>     H3Ne-1.7G
>=20
>  .../devicetree/bindings/arm/renesas.yaml      |  9 ++++
>  arch/arm64/boot/dts/renesas/Makefile          |  4 ++
>  .../boot/dts/renesas/r8a779mb-salvator-xs.dts | 53 +++++++++++++++++++
>  .../boot/dts/renesas/r8a779mb-ulcb-kf.dts     | 19 +++++++
>  arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts | 53 +++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a779mb.dtsi     | 12 +++++
>  drivers/soc/renesas/renesas-soc.c             |  1 +
>  7 files changed, 151 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-salvator-xs.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-ulcb-kf.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
>=20
> --
> 2.25.1
>=20
> Gr{oetje,eeting}s,
>=20
> 						Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
> 							    -- Linus Torvalds
