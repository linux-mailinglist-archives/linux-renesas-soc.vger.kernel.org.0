Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD3E3B3BD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 06:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhFYE5G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 00:57:06 -0400
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:52496
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230097AbhFYE5F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 00:57:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuWkNCw5uZWlUEaf/nn1Yo8sLZMIOTapddTkGkAKklv05+hoHom2j1/ORW7wRrdE1Yus6jJJSz0WCiD/fIu/Jyzvb0qiYS6HQluPpFnhq7l7SuCxps5e312IJDlCafX/LFnK0F9sd9jeXe2scSHzwQU4uuT/RZU2fydZNpIvg+En43FyJweqitkThViSmbnvH7oXbA0kT19ej2m9UK3Ox6761qfw6KY28A7+p6Sx585qqxAo8S83JPSIePn9tWAt3bqdnq5UztNlnddu1AFJV/ICXlmeQ2Fb6hU3x+UN7qVjK/iH4Vvc8nXq+0lMvsb7oXJyVcjOxoxZL3/GRkmKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4lyYIFddjTYIL+TdtwNSSIYkdksKeZl1PqH/H0nQ4k=;
 b=CzEH/aIQtYVWCEfYkgFzM2WcUlJqFvth7vju77YfncIrShB+dyBiliHHJgCq+NhdpI4s+DQAoXkFXVwjAA8EsFU/68nVBF752wbpIy4C7YfV/rkJawJAHuRtzgZ2jZjhOJwf33Ts0hpIuwAn+uBV8UuHE/OVgZ6wYHlke3iCDFRFGOOHWVOKXMjtknbe0yMqsji96ksaGSaIBjMQ6iOp91vvjYCgYL3KV3cZsPRFNNBxHNit/VBiAGps69DqiOcqM0BqkUHmEJYbHPzm2pmkZPm6AYNu2DmQM/PabfFcf0bp0dnuBMKhjcpoSFU4lhS9RW4WojVkdr6fJCNgUBlRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4lyYIFddjTYIL+TdtwNSSIYkdksKeZl1PqH/H0nQ4k=;
 b=XztDObZEFBFdyb2kOiLZMebp2Bx+b0bU0a1ibHtKpxd8YW4Mr9rDGUvcEsAGiWC3mO/tG5vRwwa0cIf5OLEvbc9yIvtcJb0vX3iBq6eNPWYat4v2sc2gLaq0QwNNIW25pDLY1xK0la53pXpGvYjaDH/z+EIV9enWbgjHuF5DWso=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3215.jpnprd01.prod.outlook.com (2603:1096:404:8c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 04:54:42 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Fri, 25 Jun 2021
 04:54:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G and
 M3e-2G
Thread-Topic: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G
 and M3e-2G
Thread-Index: AQHXXdxGVxnXORnr0UKfnp2dzw5A3KsT3joAgAAN+YCADpPUcIAARLKAgABJHXCAAE8lAIAA43ug
Date:   Fri, 25 Jun 2021 04:54:42 +0000
Message-ID: <TY2PR01MB3692FA26EABD00FA4DD0F13AD8069@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
 <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
 <CAMuHMdUJQCv7Qe01Km=6F=yUjcNoo_OvOBrYpPcC3SbhX0Ru5Q@mail.gmail.com>
 <TY2PR01MB36929E0DE956A374B8CF5EE7D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <YNQi0w4zsG01ezgu@kunai>
 <TY2PR01MB36927B0CCE7C557A3115E481D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <YNSijAdvaNzHNnkF@shikoro>
In-Reply-To: <YNSijAdvaNzHNnkF@shikoro>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51418b37-c677-4126-536f-08d9379558ba
x-ms-traffictypediagnostic: TYAPR01MB3215:
x-microsoft-antispam-prvs: <TYAPR01MB32150B0FA215FCDEAAEC1C56D8069@TYAPR01MB3215.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /SwgE27EAx1F3niaUjkXkJWUL1hsu1Aq8oy7ny+aOu5hDfO7X48se8h0Db5CyEY2lTd4H5zfcP1dJ5CdG4dSuhAjggDHlN9wRIVFAXEIZqEJf43WgA8PJDG5pWNgQunAm/q2fZRihweHibn2FWjGCLEOmWRt2kbodjjwONIY/UEXYYMFOePH+2pBxUoiSM76xJ9gtC9IEYBUJnM/6Ndk8MwNKz8ZQaNW6ArTLXJ5XKjRByNw1OSyWQ5riNPs4a/gMl7SUtXt/WCbD6JPRkBS6NrKd7tCrlwqlRFttjByVhYh7naRS42xfaycIbZ2CJcUEkBu8W9jf/8Gl12upcvqHXTiH/pjJ7M6XwuAfPQS6gsFwV0CrJnL/YUPqyqPPv6DAKnM3b0GHWQWUtv/orY/+86vRiVGMLC5VzqpAJzOFOe7nC/TQqBvSD0Or4W/m+VAZ0yBouoJsN3YFlTbZUt24PKMYeOQuNt6M3el1yBtS+q+PFIeWP9EWFMRJoyaawG/6gi772vtkaNta40p/bF6dmRH38V1wJXOBpX4TMbcHySbRY/rImgBRL35F51NPoDz77vTFWBniEyzlvqiMd1dAkUBaGqH2zq5fuhIK7i4qTU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(38100700002)(122000001)(26005)(55236004)(186003)(52536014)(54906003)(4326008)(86362001)(5660300002)(7696005)(33656002)(6506007)(8676002)(316002)(66556008)(66476007)(8936002)(66446008)(64756008)(66946007)(76116006)(55016002)(6916009)(71200400001)(2906002)(9686003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?69YHo6GhtnIEqJ6lQgizAMoYqVm9x7Z/aE5RSqNBtrfyeyVnS3K/Z8ltXB4t?=
 =?us-ascii?Q?htvlr5V4lAMhh72YLXxASRHPu82FndvMJedtn5NKbCUYNPllCiRIvctnaS5Q?=
 =?us-ascii?Q?Xwi7pAmxjzI1zTu9PL677tTlRSw0XzbqMFrvY1xeZYlC8i22n3TQZLQoXb3L?=
 =?us-ascii?Q?b4ZwKqIxyhqYewJJNUSI5LqEI7KybPxnzMSt695odYONKtljlAN7WDS/Kw25?=
 =?us-ascii?Q?nbyO0tKRwPw/Ha+0Z7ogvj6vFYOU8D05IrhimDCsLBNzcNU+QruvMnfUAAkS?=
 =?us-ascii?Q?BhDBTt7Z2K4dJUPBFQ7cccS7Pitu5tD8lQOLngdlxu8S0XHiQ0HcqtHIlId/?=
 =?us-ascii?Q?LgRirxkpb9hAiBi5TERtPk7RUhX51xgWL3/NX+uXTrYOlBuL3GucYnN7UGZp?=
 =?us-ascii?Q?+0tycVrXuAkMbxa6LdtuZTpVUD+mGrscbP8nosEu3jOVCeJfofjnNAwyNzFH?=
 =?us-ascii?Q?zEFli0ZIDIeHaXg8xYGtMZnppoXku/EfSBtKRZfhU2lHKcX6jhAkzAxCvjBn?=
 =?us-ascii?Q?w42Hpa8g6ZgKIk2BDlNBbKqBDMu5i18vJ227ivwEHJh3vyprP/pYki1sRwRk?=
 =?us-ascii?Q?isUQKJ6otH7sIpPio6kB9ihwrlowGEFITdVLzbCm/4GT5fmhyGOrS+UK5I+b?=
 =?us-ascii?Q?3exqorRfxC0dxh3GZXBgx56HVypjqi4ulz2Sx14FkKP+zFQsnFPlTKjxUuMk?=
 =?us-ascii?Q?wdw700f6j1J54WZ6T1MTdX1Th3ebCRUat3mfal/eIjEq/UeGcV33YmX6rb62?=
 =?us-ascii?Q?BkURQsAl63lUnEyHL1q/V9Rp0jkJlvhw8kF9MsPjFBnjk+Q15aJCjl/OyijG?=
 =?us-ascii?Q?F7GOkDd0BlVEP5Cx/0pWw9fJsq2cJ70N+GEF6FTcSZwat39e5Prwk0mQCe1N?=
 =?us-ascii?Q?gc7J5ZIqjx4//gR8LTaycmWa+4NqweHG1jDMUlzPh6Fs6yKvdak0zStBEYTP?=
 =?us-ascii?Q?P8Dpf6VyUdp05rI/z/MktysXIH+XTRWMzRfija7rhKyxu6KP+PVGdVoiTI/L?=
 =?us-ascii?Q?Yf68yI4UxEPh7LFCProXqN2W01xdsi+bsu34kpm/qCPOgjU7ER6e2EyxELIi?=
 =?us-ascii?Q?T1G4PaN1AcZJlsgO0ERdw8cIOLqKLkjf/4UMKClClpfQRRpgg8YUm3yHNnYr?=
 =?us-ascii?Q?62rwFdqWBg3sB/6yKfX+Hn/97IBiFprw4l+sv7WsR3resEqsfztJi/FHm0+C?=
 =?us-ascii?Q?CzRQ6oj5x6zzIsQE2n5cWV0pULsK5FPjAno3lrHCLwz8HQWzpUYLzQ2L+sW2?=
 =?us-ascii?Q?z35LGn6D68Ehak8sGWZqm3mR4lxkswuF1JGzgse7n8WfeB7Sa6ASlQ9WcC1H?=
 =?us-ascii?Q?1Y5t7MCw1iCCvaWlvtWvytD+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51418b37-c677-4126-536f-08d9379558ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 04:54:42.5318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvfjqMTnJHAXjviArgnid/Mpcbi6f/RSpPSNVD0cce7fVZH+xKOkeG29iNWLwrHDsQ7dWynROUwXWCbhHVh2pXo5/Pse48THAz9P4m7B6DYY0sYU5WItGb0zbNPZPDOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3215
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, June 25, 2021 12:20 AM
>=20
> > > I don't fully understand how the refactoring should look like? Is it
> > > moving 'struct renesas_sdhi_quirks' to renesas_sdhi_internal_dmac.c a=
nd
> > > merge it there with renesas_sdhi_of_data? Is it really better to copy
> > > this struct per SoC? Most of the data is the same.
> >
> > I also have the same concern. But, I guess we can refactor
> > the renesas_sdhi_of_data like below to avoid increasing data size:
> >
> > struct renesas_sdhi_of_data_with_quirks {
> > 	const struct renesas_sdhi_of_data *of_data;
> > 	const struct renesas_sdhi_quirks *quirks;
> > };
> >
> > And then, we can keep of_rcar_gen3_compatible and
> > we can add each SoC's renesas_sdhi_of_data_with_quirks
> > and set it to the .data.
>=20
> That sounds like a reasonable approach to me. This would also allow us
> to merge the quirks from sdhi_core with the quirks from
> sdhi_internal_dmac.

Thank you for your reply! So, I'll try to make such a patch.

Best regards,
Yoshihiro Shimoda

