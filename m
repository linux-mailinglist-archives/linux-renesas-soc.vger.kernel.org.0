Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B08451553
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 21:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346426AbhKOUfB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 15:35:01 -0500
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:32640
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350938AbhKOU1y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 15:27:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eod7IAtG79ITIyAiybWcPAqNIwEkEt6Sa7r42UQ47RznvcAr+yUzdgKnHEC59YUzg8jCb4sga7eWKImrjWyt/nO7t+RiYJ7xeJd0bBrmZk+Jhv7elmvbp7auPXZHmsuZLIHZmigYMwtwJcYlCygqaSsU5IRSUn3MQVe68KJ8nO1RVpye+l0L89mlWuQOa/5U3K8yEfYOTPIAzYKPEuVaizkjegZqm7aoHAMuhPzwN87Y4uHs+NZU3SxrPb7Re/W/KcnfVR6q8+jQficzQGRe8ib4pD0jOvoa6ZFFIxC7NVVDeKvyGS8BuOy4V7oQxY1y/sH8M0+6cXnMc9Y4KGQn4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFNYNY9b+0h2NoPcG20pok4JPXAzY4BR4PebtGL7sN8=;
 b=CgZu8RN4gsNuHd5MZFlv3T4kVbCE7BXSEi/MQP/9NE0qpFgIQmgcCVHkuuAnFQ7zcAF1gsrY4UzwR1pLwosfXMnRXwf4hb3Hm1oRMdZssUTjhx7+E2KvOOGq/82C1C8ENsfFIAgxflFwpDwaA2ogAvTHe25cEs1DwNGCMU/WiEqqDgdn1sB+1neCdWXLvE0SOWenEsSo+WqHGre1UysSP+RL9AZDV/q/m6YtXsQ1MkvGuAFwY0LgU6GUykKR/FqR224noMhHNPhGmINR20FPskHqqPHDsN4cQuvBV6GyOYEmu3Vsh6f4t6SYDd3sZh5tNEwnbzyiHg7U0thRrYRrCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFNYNY9b+0h2NoPcG20pok4JPXAzY4BR4PebtGL7sN8=;
 b=rGg7H3wustWk35M/G5e9ODoNIKyhI+Ht5tGVXuuRY77mNhlS/zuSzHl7Y9gD6zUTFG+KMNo1P15E7R3miRTgi5KHolnL83/Vbo/QXKQAo6N8O8nP+vEZFrFE5x/yGxhB1IgY6CCtF4ooFf6gOP2kTc3E/ba4P3cTmLXrMK/hSyw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB6481.jpnprd01.prod.outlook.com (2603:1096:604:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Mon, 15 Nov
 2021 20:24:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 20:24:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Topic: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Index: AQHX2jrE4eSX7ohpXUa1PkZIvz7h+6wEx4EwgAAw7wCAAA+tYA==
Date:   Mon, 15 Nov 2021 20:24:54 +0000
Message-ID: <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
In-Reply-To: <YZKz/ptgPfzqGfeq@kunai>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b803871f-768f-4a71-07c8-08d9a875fc80
x-ms-traffictypediagnostic: OS0PR01MB6481:
x-microsoft-antispam-prvs: <OS0PR01MB64816F31A29D8B4CBDF9424386989@OS0PR01MB6481.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EB+3Xx4Vh73shkVKcdf24Beb+Bt9NPBH4nuo3u3Nd4SXxawkN6o5YmeSsxGsh8cVxChn1uKJfOJqkcrBo3gHkuCob51TEgCnvQcGI0zA0mYYdils7hQ/jKdtaU6TP9odijZmYWOEyEEvX66T/NTzUbPz60kdWyyQmCjZ7BoN1rGjrkmlThlYyInyFoErvIRYlviulSo5kYpaWSyhYtkYEIPLQ1+EWnOR2n4Tf6DFIw7SyPmzOCdSkbuOqUWfndWD8GJHnix2cFXc2RdN6P0qOHNApP8oCbVkmmBznZu6x+o8ffNPdcuRXqP9NyWe8hCmyS9hWWR31MgiqQpULjYjn/u66kOP9k7u65bdB/o+drM+vSvkvXCDiSNQsp6v6/qMT+Rh8dBZwin/wRdfwI2uD2yobiVJPfc4FM7UTtxYwrBVn4Wp8Dk5wDUeLrNah/QrhOIrvphmZHobxbnQa8p1eGl5l/FmdRj8MNrYUM+GL9O63FCmpQzvVMxarGFM5sEg/C3SCEZhvxspXnLLt9YtOs1X1TWzI5ySYBV1JgWWHN2LAOfQpnLlyEfsTy4Qn9LbV2K73UtVuT9z2IYnKIm9a5BFkoQxhJNazEuld0nrOjL3d/i8NRVCePPvG7KjqypMGQrx22fGMuUMwfIjBnbUGBZK8iaVVXdrd65mFTiMTIwKnQr5Guen98kzfKXteVlDrDvtOvklOu0el1ygbVsyRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(4744005)(83380400001)(66556008)(26005)(76116006)(71200400001)(186003)(33656002)(508600001)(66946007)(55016002)(86362001)(52536014)(7696005)(2906002)(38100700002)(122000001)(4326008)(6506007)(5660300002)(316002)(38070700005)(54906003)(8676002)(9686003)(64756008)(66446008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yEfiwGU8thme8n+j2OfyycNjigC3AyY5ssDesp96rI4p5I5rBqzxJRwbNXfv?=
 =?us-ascii?Q?WJpem9aOwKFD5CHbaFxuoQGcqON/dJFSXuvrrCfprtB7UQB5eAptpPgBtlyf?=
 =?us-ascii?Q?KZoEL2t3+THYwZA4BL0kL8CTfm0qx0F5AMhZh6Gt4HBIzVL/rDh2RUtuC2ox?=
 =?us-ascii?Q?G5nELp2B2cgEF+/LC9EWMoUcbjDCsNoAHV2ubS5zzJRWpmy6GKvnQlYt9Q+Z?=
 =?us-ascii?Q?CsiMGpVtuVrUpQr/tVMXtMAkcIof643Q9sLvYFDPPMYTItuGOoWQM/r2y9eI?=
 =?us-ascii?Q?4zm3RVYeGnIWN3BS6bMQnYSO3/ZCIYH3MJJbATIgzQVrR22Zz+PyQoonXYsE?=
 =?us-ascii?Q?fnjKby13OB+9qe5Pse8FzBGfOay/eoGXM2Kr8D6KBPNBe2X+c/3FYuLQVeyc?=
 =?us-ascii?Q?SGLLaMxUZ6f4XpSClDDEKWVw3LhIhTw1tnDFqCGQuir97WNrhTTq812MbBXa?=
 =?us-ascii?Q?Tle8tvs3AHpbo/1i00bMrjf9Wl5qSK1OiODgsIGS89KArTsnDuewgr+o53IN?=
 =?us-ascii?Q?1mMUq5tY8tb/QyJ0U/GSQWA7RZXJb8/eex+wfD0gYb9gBNDF9dlWPn7vYxBN?=
 =?us-ascii?Q?+da+8wnoq3Wu+EahohT+RiievmT3h2LfCIGIh+H0gmQnyNVzmVeTat960Gfc?=
 =?us-ascii?Q?MtYSvl6QcUculu71g3elzpQhZjudhv8O/KdIJwgvDRziQP6TEC78eUOfbmXE?=
 =?us-ascii?Q?YdgEUwYtd9GxKhO5IQ7GhibnhsznzOOJ4Bq9UUHl0L0oxP0nBrS3EYLN+2Vk?=
 =?us-ascii?Q?R1+/+JB+p8VBAhMVdD3enpBY/X4XeEgPvmpHjZ4ntCuJrxiWbkppILuSAU8q?=
 =?us-ascii?Q?s0QVR9UxS/j3n34BLavl1W4D9TRxQS2rSx/AZtnWQ7BL/iK0VL1bSN4UjLeh?=
 =?us-ascii?Q?jX3+rZymfcHwjL8X4G/L6tt1nU5dZlvKpV/9G2oMYCvP768tnbzC75KP3rYW?=
 =?us-ascii?Q?EJweeGkB7yDGPOg7nNdY58cFt05sm50yigZ1Lv1oXwFzNQO4mP1/N7AKh0if?=
 =?us-ascii?Q?rXKH377xdRmEeJoq+Kl4Ksz9oYtbRuur7FfJwHxNI2wboHYnzmA/L7Au/Z2+?=
 =?us-ascii?Q?ZPlTfR2e6kZXtNoVkqSWtt5OW/8EFuYO8nEAySVjEIdd4jPHgJwj8ldrFLv5?=
 =?us-ascii?Q?ufqwnGB3llS1aAREzif2gj37hCbtykmpa7+jYO0PoKtyF2WqLgtwgI3mWZN9?=
 =?us-ascii?Q?f6e7aIU5trE3tSZnzyGOWy4JidSjL9+metrkCZut1cQSKPkwVRLBBu+7IawT?=
 =?us-ascii?Q?jxo6KbP0pTS50/4q89NXe+sXTaMxEYagtX1PjN4ixHrTH1PPoIPlIKGhZV1I?=
 =?us-ascii?Q?eZotussq/QwYiQOUgzEhkPG6U00QjnAYcUNtwl9kwMOr01TUbiM89Hkjqw07?=
 =?us-ascii?Q?ahzCu8/ADwMyZZKakIawVqOjQclGWUvwKmj1ZP0a5XPjuOqf9OGGYKvfTIwI?=
 =?us-ascii?Q?cZcxCdJO2M/yc8OR5tcCvr9gp56iXamVn+XUUlzW+bMUkFSG0nfTXT/9uPJk?=
 =?us-ascii?Q?kdAi9xhxr/lW6gCowVIB53zS2Kdq220r6MqGVm71hkvArgC7gf+5oohI/ocR?=
 =?us-ascii?Q?gWeljcBPEbSC1sjHbgnjsw8+k2kaAoluS+bFlLG/MpyocB6BnOwyyany1JZY?=
 =?us-ascii?Q?rItB0RTXbvgSGKhaAOyZ7H+YQGycyb2KgpPrIkZMWbP30RDJI2TvkGsmml/p?=
 =?us-ascii?Q?+1vDiw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b803871f-768f-4a71-07c8-08d9a875fc80
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 20:24:54.8444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpvzjYTzR8ZmTlnA1Yp/m0i5hYt519zQX4jCCRlSBA4z7dgFwpQOCapW7mpoIQzA5xPsDvHpXuSb5K+F6RJJTODpvqhXKgESQvvj6W+ZoNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6481
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
> clock
>=20
>=20
> > > +      if:
> > > +        properties:
> > > +          compatible:
> > > +            contains:
> > > +              enum:
> > > +                - renesas,rcar-gen2-sdhi
> > > +                - renesas,rcar-gen3-sdhi
> >
> > What about RZ/G2L, as it has 4 clocks?
>=20
> They are a few lines above this in a seperate block if I am not confusing
> the SoC numbering.

Ah ok, I thought, since RZ/G2L using generic rcar-gen3-sdhi compatible, We =
need to move that
Separate block inside this if block. With in gen3 compatible, if RZG2L then=
=20
Max 4 clocks else Max 3 Clocks. I may be completely wrong.

Regards,
Biju
