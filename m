Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD973D0B46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jul 2021 11:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237967AbhGUIVq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jul 2021 04:21:46 -0400
Received: from mail-eopbgr1320103.outbound.protection.outlook.com ([40.107.132.103]:54928
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235987AbhGUILV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jul 2021 04:11:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCp3/RGx2A3Lq7X0kw9qmCXNffgJ5OZm2CB+lThv3LLP3szTdc10/YMe9qwAgkaj+oDevyQthxr73ww7COQnwkn1+I+zfGm16YwUgT70RaZdupr11H7rYpslCVuvDXrBxcPImsUBWua2ZAwa40YTxtDxB7h9/m9Bh+jFqtSq3+oKmWS0QlH+pWsNsrrejHDoY+f5UkVgQiutTGi1zV+rqHKRaxMNZmqMIEzGmYkVwAegY5MY12lIIsN3wgZKiFBFIqHeZVMqL9grQrDlLWD8g9gYX91qy/fivf8QHgZT/tJgKRwRakX5Vk9b7eQ7Uyd4+EB9ZoIBFRSnKdPHNhVb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxp11Vme7NDguyhhgLefz+fYAqbJCnz1EcPBokyp5cQ=;
 b=REREEJJ738J7fkl2cZi/oxse8wBdFsAACoXzCsCMf0Bt3UGfrOJqFKyfsOMhQI0FyPyWLgMytwz1GvruV/mJXj6dfp2xEI+72nlYe7NRa3n1a15LX0CDcjz9bWGQZ8ixxJKRZLBZYNZ0R8aFbn3dp3Km+XUnEvNguu5Sc8KewH40d43E504krRGw0HVcBYMOnM9oHl2vhrNKI5J/HBN7BgC++M4ratiNjAj86Ytr+zzTfP5P2D5EOfhJdNwAVo9zcXjwXS07VTrvWhwWYbSgBzAsGwMz2iud0LOeqeohs8dWHHajIY6MwhvuHD5nwyZ7nXbLCesYJnF82bzJFBs6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxp11Vme7NDguyhhgLefz+fYAqbJCnz1EcPBokyp5cQ=;
 b=FnNmcOChqWv4ofixeE2uOI6FYdRXKqMdee7Wb3SCSoQ5JBi8gNe4FwS4VJGZQ/gN93C+/OPQy6Tqpysw3/RBU+roOa4sRdPcT5Si37mZnBJAVHQPu2NYINZMlsQ856+NmDQ3t/mvM6fr9p7Ske9FElCkVo8EaxUcYJ5RXAgjl20=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2059.jpnprd01.prod.outlook.com (2603:1096:404:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 08:51:52 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 08:51:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: RE: [PATCH v3] mmc: host: renesas_sdhi: Refactor renesas_sdhi_probe()
Thread-Topic: [PATCH v3] mmc: host: renesas_sdhi: Refactor
 renesas_sdhi_probe()
Thread-Index: AQHXbzWgd7f4fd1HoEmGRyh7c9qLRqtLx1mAgAF06+A=
Date:   Wed, 21 Jul 2021 08:51:52 +0000
Message-ID: <TY2PR01MB3692421AECFC48530C19A16CD8E39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210702112956.1065875-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVH+mBWQ1KBNcrhdxoHavWpytczZmUBR_0pXu5AoULgYg@mail.gmail.com>
In-Reply-To: <CAMuHMdVH+mBWQ1KBNcrhdxoHavWpytczZmUBR_0pXu5AoULgYg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bf2f4d4-0dc6-4d9d-ef2f-08d94c24c91b
x-ms-traffictypediagnostic: TY2PR01MB2059:
x-microsoft-antispam-prvs: <TY2PR01MB20591B4E81B4DFB9667B1C05D8E39@TY2PR01MB2059.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W0uz6/cQP5oV5wgysHUb1WIXGoygS4EIRi3kLrYFZdJaUnvDncyIkdevUFoht6jfcF1RH++PGOcWa/ntkAQR78WCE39gF2qeoPsEx7IsOjS8sAZ0Cr3ZIGfZ88aBMVFFkfxAiLASPKorBAzTM0w3T01aKaCTJU+xmrMlRMXtL+uLQcnLhCyzQCWtapyThTJmHsgvFcj/J9GJfJ2xPN+vt9R0OVSoIWtiZ07OdwwSm7aW71fPCWzQM2kdsDfNn6LC4h+/g31hsjNP9PBqmwRxYGEU4ctWIff2iY/c7NqGkMT+lkYVLZ+IQIG255YPg2sQgKEXp5FvKWEhlzE0mfPEt0o5xG11N6KkvFAwaUcs1JtAPUpveGxC9+uvc7ZuXhUTGJnW1TyLa63XqjPAsvdFFXXv9gpsjYOV9cYvmIfH426D7d2PlMpi+GbXA3FHjV7U/re+RGqs49VEwugo50WUq7MjDcWd3LV31XwOivUxILtWqnj8HPWxMaVERACVkZiPUUYfr3KrG2xUiM9D98Q8RRhzpL/R5gkj5s8dXZUF0GN4ZqrZtnaInXnrRh629a29WFNlJs4I/yVoiWpxVuSXhoNTYGBXFYY2LSiq9qNxsvKO/lI70mGk0NuKtAq3W6cJpNgVZNKm/rc7jnraY5pSSrcIaFYrPw+qqm+Ltkb8AOGgBdtblTYE7ryDaxHCdT8QBKQpV26lfcx3jRCQMTeNbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(54906003)(316002)(66476007)(53546011)(71200400001)(55016002)(38100700002)(122000001)(9686003)(8676002)(5660300002)(83380400001)(6506007)(186003)(508600001)(8936002)(2906002)(6916009)(33656002)(76116006)(64756008)(52536014)(66556008)(7696005)(66946007)(4326008)(66446008)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xQHcb0J94J+Io26nobcm0Qm+H5SvPDHK17GNVPog3SJRska6jNPr5BztIJNV?=
 =?us-ascii?Q?547tBl2RMcFNEDexSvnt/guINk+nxL0VSETZP3jsY1rG9RkfAAJRkyfLN850?=
 =?us-ascii?Q?96XJug3YZYJXM9JJJw2NJr9YU/UXbK0rf6P44moPhfsccfBOfN1eU/oLZy+v?=
 =?us-ascii?Q?DFj5sK0MMH8JcWkLauXyEnrVPMxtjzGzspwhP3EtzdDlicPFq2ubgQLXts9a?=
 =?us-ascii?Q?R1zJJb8uaFnRJjQKxuWi2hMeFZFhMRgUKJnj3GowLbjIsGp0jx430nDwSg31?=
 =?us-ascii?Q?0VUotvUcYRRtqtvvUWQF7pYcyNpVBN+gdWybILdbBY+8qMP4BVczlLYg/VKC?=
 =?us-ascii?Q?v/56U4E0/JT06iBCMAmzfMFUWGWKqkhN03ae/VdfNNYpHTUgantqQc8O9Gbk?=
 =?us-ascii?Q?3uXzjZBldeWeXv1qG509VbpnBbPJuH3h0cRARihX6IZeE0iXCSyKFyBIhYrr?=
 =?us-ascii?Q?ZVV5WeYNkKK1TeM50wJx9+iH3S618ycF9F90mhsojbYtvPhORmH3edpjZuFo?=
 =?us-ascii?Q?Tz+IgcCAd2Wv/7P93mpEzZFiJp5q+hBQQOwf0N19KwPKO8SPYnlJYS/Axlwe?=
 =?us-ascii?Q?Z7Cq5M8DCrrx2/XoriyQrg5jQGduvNhJtwEXGeao5wiBNU+rsNLncADkz6uz?=
 =?us-ascii?Q?PjV3ov1ytdqPjeIFAEtGbPYFwYREYbh4oBw774aVXTmYtMAcfQKwr2vms5Gz?=
 =?us-ascii?Q?EPG+h44fWsGyo8HZwfFhs5HD+LOvjv+gYzwX2LGxTTqoWWjuX6whdCAqWu+9?=
 =?us-ascii?Q?PFQnUg7OWpv0sosda0hNozpqk+iLpzjuEiKnnNZ4FR2zR/sdTi6E9c5Jl8Jc?=
 =?us-ascii?Q?kCY3K/cwJ8Yg9i2LCqC/qbRtZDrsyncZXkg+QWbcTDnRk3dLInlscAG2ykDb?=
 =?us-ascii?Q?BtkTJchd2JDVVgWr60JjLoLUIi1xkGytOl5u/cY62R1rt44BYo63PwV9Ph1U?=
 =?us-ascii?Q?jr8DME5l2kYj1NCRcq5WlfCRAuJBnPZ635OmHBYxOkY7O9RKspeD2ZezQ+ls?=
 =?us-ascii?Q?VE+YY4LMzqwlCHbgdqHPDM7IQxMg3mg6azY6xFzLtHakS98iLT7LfltGztY/?=
 =?us-ascii?Q?hArwY6oKjdPesbej9ixvh6Bi58vueA98dYtKI08Wv9daJZE0+XOZ0nIFLrnK?=
 =?us-ascii?Q?u/H0ooK6KYaAf00ywScluqrADGJuCpA3U3ahZ6qN7GjIg4d7EJnREbec38HA?=
 =?us-ascii?Q?O0sL11HEPjIpt1BcoGAVhkQJh+eZrn6m+C5bKdnRRW89Hv23CGYBoDW9HdC1?=
 =?us-ascii?Q?9Lm1pcAEiD/LRCrvTez14TVRMDOucCsDqJ8wZIIPBZSHJcLsDPM2zfXRze9Z?=
 =?us-ascii?Q?BoEfX04dTRLe7pDk4Z1LWNQJ/bhGD2+gsKRg4W1UOgypBrrz55Mj+LV2dSNE?=
 =?us-ascii?Q?MyCc+XI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf2f4d4-0dc6-4d9d-ef2f-08d94c24c91b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 08:51:52.4941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unbXqb6vd/ufcza2FhB9l4YrLsTv+hH104BSmBn/EJsz1Bc5YFgjBOJDvHIcvOS5bZKSEf/8EcvxdmA21jX1pJivQKrxiQhrdhXI+8PM021mw+wG8uJYa/m3cWC6kco8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2059
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,


> From: Geert Uytterhoeven, Sent: Tuesday, July 20, 2021 7:35 PM
>=20
> On Fri, Jul 2, 2021 at 1:31 PM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Refactor renesas_sdhi_probe() to avoid increasing numbers of
> > sdhi_quirks_match[] entry when we add other stable SoCs like
> > r8a779m*.
>=20
> Cool, then we won't need "[PATCH 04/14] mmc: renesas_sdhi: Add support
> for R-Car H3e-2G and M3e-2G".

Indeed!

> > Note that the sdhi_quirks_match[] is only needed on
> > renesas_sdhi_internal_dmac.c so that of_data of
> > renesas_sdhi_sys_dmac.c keeps as-is.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reported-by: kernel test robot <lkp@intel.com> # build fix on RFC
>=20
> I would drop this tag, as it is basically a test/review comment for
> an older version of a patch.

I got it. I'll drop it.

> > --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> > @@ -406,15 +516,25 @@ static const struct soc_device_attribute soc_dma_=
quirks[] =3D {
> >  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pd=
ev)
> >  {
> >         const struct soc_device_attribute *soc =3D soc_device_match(soc=
_dma_quirks);
> > +       const struct soc_device_attribute *attr =3D soc_device_match(sd=
hi_quirks_match);
> > +       const struct renesas_sdhi_of_data_with_quirks *of_data_quirks;
> > +       const struct renesas_sdhi_quirks *quirks =3D NULL;
> >         struct device *dev =3D &pdev->dev;
> >
> >         if (soc)
> >                 global_flags |=3D (unsigned long)soc->data;
> >
> > +       of_data_quirks =3D of_device_get_match_data(&pdev->dev);
> > +
> > +       if (attr)
> > +               quirks =3D attr->data;
> > +
>=20
> I think the code would be easier to read without the interleaving of
> of_device_get_match_data() and soc_device_match() based matching, ...
>=20
> >         /* value is max of SD_SECCNT. Confirmed by HW engineers */
> >         dma_set_max_seg_size(dev, 0xffffffff);
> >
> > -       return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma=
_ops);
> > +       return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma=
_ops,
> > +                                 of_data_quirks->of_data,
> > +                                 quirks ? : of_data_quirks->quirks);
>=20
> ... and without using the ternary operator, like:
>=20
>     of_data_quirks =3D of_device_get_match_data(&pdev->dev);
>     quirks =3D of_data_quirks->quirks;
>=20
>     attr =3D soc_device_match(soc_dma_quirks);
>     if (attr)
>             global_flags |=3D (unsigned long)attr->data;
>=20
>     attr =3D soc_device_match(sdhi_quirks_match);
>     if (attr)
>             quirks =3D attr->data;
>=20
>     [...]
>=20
>     return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops,
>                               of_data_quirks->of_data, quirks);

Thank you for your suggestion! I'll update this patch.

> Regardless, as this doesn't impact functionality:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for your review!

Best regards,
Yoshihiro Shimoda

