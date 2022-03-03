Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1462A4CBCE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 12:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiCCLlA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 06:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbiCCLlA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 06:41:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5A948309;
        Thu,  3 Mar 2022 03:40:10 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7B2D885;
        Thu,  3 Mar 2022 12:40:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646307607;
        bh=aEI69yWfPBuis5wjsGUkbfbNbnmLNlm1tFJfreo9oe8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pww982AwmHbkWKBi2UjmnrjeXVIJj0qeh5qXu3Ofksb5NguMMhUSKJIEqpgbetpmJ
         aTieeLWJzFMgxy3zSKFZh+nWCQCihrLfY59dzJb74U//53Hb2FT3FLzv1mL7PYv535
         UjD124jm0qdXivNgZJCdF3afI0ZJjWVvmvobmJ4g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <52970494111d9287cc8355e0f2e3de474361c75f.1646296493.git.geert+renesas@glider.be>
References: <52970494111d9287cc8355e0f2e3de474361c75f.1646296493.git.geert+renesas@glider.be>
Subject: Re: [PATCH v2] ata: Drop commas after OF match table sentinels
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Florian Fainelli <f.fainelli@gmail.com>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Thu, 03 Mar 2022 11:40:05 +0000
Message-ID: <164630760533.3471399.15267126463863979019@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Quoting Geert Uytterhoeven (2022-03-03 08:36:35)
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.

Indeed.

> Add comments to clarify the purpose of the empty elements.
> Rewrap entries to a single line to have a consistent style.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

git grep "{ }," | wc -l
2638
git grep "{}," | wc -l
2088

Lots of false positives in that basic search, but this looks like a big
job. Is this something that could be added to checkstyle?

Probably hard to match when it's a sentinal, rather than an initialiser
... so perhaps a coccinelle task.

--
Kieran


> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com> [ahci_brcm]
> ---
> v2:
>   - Add Reviewed-by, Acked-by,
>   - Rewrap entries as requested by Damien.
> ---
>  drivers/ata/ahci_brcm.c        |  2 +-
>  drivers/ata/ahci_ceva.c        |  2 +-
>  drivers/ata/ahci_da850.c       |  2 +-
>  drivers/ata/ahci_dm816.c       |  2 +-
>  drivers/ata/ahci_imx.c         |  2 +-
>  drivers/ata/ahci_mtk.c         |  2 +-
>  drivers/ata/ahci_mvebu.c       |  2 +-
>  drivers/ata/ahci_octeon.c      |  2 +-
>  drivers/ata/ahci_platform.c    |  2 +-
>  drivers/ata/ahci_qoriq.c       |  2 +-
>  drivers/ata/ahci_st.c          |  2 +-
>  drivers/ata/ahci_sunxi.c       |  2 +-
>  drivers/ata/ahci_xgene.c       |  2 +-
>  drivers/ata/pata_ftide010.c    |  6 ++----
>  drivers/ata/pata_ixp4xx_cf.c   |  2 +-
>  drivers/ata/pata_macio.c       | 18 +++++-------------
>  drivers/ata/pata_mpc52xx.c     |  2 +-
>  drivers/ata/pata_octeon_cf.c   |  6 ++----
>  drivers/ata/pata_of_platform.c |  2 +-
>  drivers/ata/sata_fsl.c         | 10 +++-------
>  drivers/ata/sata_gemini.c      |  6 ++----
>  drivers/ata/sata_highbank.c    |  2 +-
>  drivers/ata/sata_mv.c          |  2 +-
>  drivers/ata/sata_rcar.c        |  2 +-
>  24 files changed, 33 insertions(+), 51 deletions(-)
>=20
> diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
> index 64dd8aa397d5276b..ab8552b1ff2a14ad 100644
> --- a/drivers/ata/ahci_brcm.c
> +++ b/drivers/ata/ahci_brcm.c
> @@ -427,7 +427,7 @@ static const struct of_device_id ahci_of_match[] =3D {
>         {.compatible =3D "brcm,bcm63138-ahci", .data =3D (void *)BRCM_SAT=
A_BCM7445},
>         {.compatible =3D "brcm,bcm-nsp-ahci", .data =3D (void *)BRCM_SATA=
_NSP},
>         {.compatible =3D "brcm,bcm7216-ahci", .data =3D (void *)BRCM_SATA=
_BCM7216},
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_of_match);
> =20
> diff --git a/drivers/ata/ahci_ceva.c b/drivers/ata/ahci_ceva.c
> index acf59f51b3569d71..cb24ecf36fafe040 100644
> --- a/drivers/ata/ahci_ceva.c
> +++ b/drivers/ata/ahci_ceva.c
> @@ -363,7 +363,7 @@ static SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_=
suspend, ceva_ahci_resume);
> =20
>  static const struct of_device_id ceva_ahci_of_match[] =3D {
>         { .compatible =3D "ceva,ahci-1v84" },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ceva_ahci_of_match);
> =20
> diff --git a/drivers/ata/ahci_da850.c b/drivers/ata/ahci_da850.c
> index 0e82766007128e72..052c28e250aa8d96 100644
> --- a/drivers/ata/ahci_da850.c
> +++ b/drivers/ata/ahci_da850.c
> @@ -241,7 +241,7 @@ static SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops, ahci_plat=
form_suspend,
> =20
>  static const struct of_device_id ahci_da850_of_match[] =3D {
>         { .compatible =3D "ti,da850-ahci", },
> -       { },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_da850_of_match);
> =20
> diff --git a/drivers/ata/ahci_dm816.c b/drivers/ata/ahci_dm816.c
> index 8bec4104167142c5..8a92112dcd59080a 100644
> --- a/drivers/ata/ahci_dm816.c
> +++ b/drivers/ata/ahci_dm816.c
> @@ -176,7 +176,7 @@ static SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
> =20
>  static const struct of_device_id ahci_dm816_of_match[] =3D {
>         { .compatible =3D "ti,dm816-ahci", },
> -       { },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_dm816_of_match);
> =20
> diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
> index 388baf528fa81cab..79aa9f2853129f6e 100644
> --- a/drivers/ata/ahci_imx.c
> +++ b/drivers/ata/ahci_imx.c
> @@ -811,7 +811,7 @@ static const struct of_device_id imx_ahci_of_match[] =
=3D {
>         { .compatible =3D "fsl,imx6q-ahci", .data =3D (void *)AHCI_IMX6Q =
},
>         { .compatible =3D "fsl,imx6qp-ahci", .data =3D (void *)AHCI_IMX6Q=
P },
>         { .compatible =3D "fsl,imx8qm-ahci", .data =3D (void *)AHCI_IMX8Q=
M },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx_ahci_of_match);
> =20
> diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
> index d9b08ae7c3b22104..1f6c85fde9830ac1 100644
> --- a/drivers/ata/ahci_mtk.c
> +++ b/drivers/ata/ahci_mtk.c
> @@ -169,7 +169,7 @@ static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_s=
uspend,
> =20
>  static const struct of_device_id ahci_of_match[] =3D {
>         { .compatible =3D "mediatek,mtk-ahci", },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_of_match);
> =20
> diff --git a/drivers/ata/ahci_mvebu.c b/drivers/ata/ahci_mvebu.c
> index 3ad46d26d9d51790..991413a272e608a2 100644
> --- a/drivers/ata/ahci_mvebu.c
> +++ b/drivers/ata/ahci_mvebu.c
> @@ -239,7 +239,7 @@ static const struct of_device_id ahci_mvebu_of_match[=
] =3D {
>                 .compatible =3D "marvell,armada-3700-ahci",
>                 .data =3D &ahci_mvebu_armada_3700_plat_data,
>         },
> -       { },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_mvebu_of_match);
> =20
> diff --git a/drivers/ata/ahci_octeon.c b/drivers/ata/ahci_octeon.c
> index 5a44e089c6bb6ae2..b9460b91288f772d 100644
> --- a/drivers/ata/ahci_octeon.c
> +++ b/drivers/ata/ahci_octeon.c
> @@ -80,7 +80,7 @@ static int ahci_octeon_remove(struct platform_device *p=
dev)
> =20
>  static const struct of_device_id octeon_ahci_match[] =3D {
>         { .compatible =3D "cavium,octeon-7130-sata-uctl", },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, octeon_ahci_match);
> =20
> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
> index 3aab2e3d57f3373a..28a8de5b48b979c9 100644
> --- a/drivers/ata/ahci_platform.c
> +++ b/drivers/ata/ahci_platform.c
> @@ -88,7 +88,7 @@ static const struct of_device_id ahci_of_match[] =3D {
>         { .compatible =3D "snps,dwc-ahci", },
>         { .compatible =3D "hisilicon,hisi-ahci", },
>         { .compatible =3D "cavium,octeon-7130-ahci", },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_of_match);
> =20
> diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
> index bf5b388bd4e0db9b..dd612d7963159118 100644
> --- a/drivers/ata/ahci_qoriq.c
> +++ b/drivers/ata/ahci_qoriq.c
> @@ -77,7 +77,7 @@ static const struct of_device_id ahci_qoriq_of_match[] =
=3D {
>         { .compatible =3D "fsl,ls1088a-ahci", .data =3D (void *)AHCI_LS10=
88A},
>         { .compatible =3D "fsl,ls2088a-ahci", .data =3D (void *)AHCI_LS20=
88A},
>         { .compatible =3D "fsl,lx2160a-ahci", .data =3D (void *)AHCI_LX21=
60A},
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_qoriq_of_match);
> =20
> diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
> index c268264c2129c52a..7526653c843b3226 100644
> --- a/drivers/ata/ahci_st.c
> +++ b/drivers/ata/ahci_st.c
> @@ -232,7 +232,7 @@ static SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_susp=
end, st_ahci_resume);
> =20
>  static const struct of_device_id st_ahci_match[] =3D {
>         { .compatible =3D "st,ahci", },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, st_ahci_match);
> =20
> diff --git a/drivers/ata/ahci_sunxi.c b/drivers/ata/ahci_sunxi.c
> index 56b695136977ab72..c7273c1cb0c73b9b 100644
> --- a/drivers/ata/ahci_sunxi.c
> +++ b/drivers/ata/ahci_sunxi.c
> @@ -286,7 +286,7 @@ static SIMPLE_DEV_PM_OPS(ahci_sunxi_pm_ops, ahci_plat=
form_suspend,
>  static const struct of_device_id ahci_sunxi_of_match[] =3D {
>         { .compatible =3D "allwinner,sun4i-a10-ahci", },
>         { .compatible =3D "allwinner,sun8i-r40-ahci", },
> -       { },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_sunxi_of_match);
> =20
> diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
> index 8e206379d699f080..d205896f66cfb228 100644
> --- a/drivers/ata/ahci_xgene.c
> +++ b/drivers/ata/ahci_xgene.c
> @@ -726,7 +726,7 @@ MODULE_DEVICE_TABLE(acpi, xgene_ahci_acpi_match);
>  static const struct of_device_id xgene_ahci_of_match[] =3D {
>         {.compatible =3D "apm,xgene-ahci", .data =3D (void *) XGENE_AHCI_=
V1},
>         {.compatible =3D "apm,xgene-ahci-v2", .data =3D (void *) XGENE_AH=
CI_V2},
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, xgene_ahci_of_match);
> =20
> diff --git a/drivers/ata/pata_ftide010.c b/drivers/ata/pata_ftide010.c
> index 34cb104f6b43e5cf..2e35505b683c7649 100644
> --- a/drivers/ata/pata_ftide010.c
> +++ b/drivers/ata/pata_ftide010.c
> @@ -554,10 +554,8 @@ static int pata_ftide010_remove(struct platform_devi=
ce *pdev)
>  }
> =20
>  static const struct of_device_id pata_ftide010_of_match[] =3D {
> -       {
> -               .compatible =3D "faraday,ftide010",
> -       },
> -       {},
> +       { .compatible =3D "faraday,ftide010", },
> +       { /* sentinel */ }
>  };
> =20
>  static struct platform_driver pata_ftide010_driver =3D {
> diff --git a/drivers/ata/pata_ixp4xx_cf.c b/drivers/ata/pata_ixp4xx_cf.c
> index 17b557c91e1c78fc..e225913a619d8414 100644
> --- a/drivers/ata/pata_ixp4xx_cf.c
> +++ b/drivers/ata/pata_ixp4xx_cf.c
> @@ -293,7 +293,7 @@ static int ixp4xx_pata_probe(struct platform_device *=
pdev)
> =20
>  static const struct of_device_id ixp4xx_pata_of_match[] =3D {
>         { .compatible =3D "intel,ixp4xx-compact-flash", },
> -       { },
> +       { /* sentinel */ }
>  };
> =20
>  static struct platform_driver ixp4xx_pata_platform_driver =3D {
> diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
> index 16e8aa184a75793f..b986908eaebc4977 100644
> --- a/drivers/ata/pata_macio.c
> +++ b/drivers/ata/pata_macio.c
> @@ -1333,19 +1333,11 @@ static int pata_macio_pci_resume(struct pci_dev *=
pdev)
> =20
>  static const struct of_device_id pata_macio_match[] =3D
>  {
> -       {
> -       .name           =3D "IDE",
> -       },
> -       {
> -       .name           =3D "ATA",
> -       },
> -       {
> -       .type           =3D "ide",
> -       },
> -       {
> -       .type           =3D "ata",
> -       },
> -       {},
> +       { .name =3D "IDE", },
> +       { .name =3D "ATA", },
> +       { .type =3D "ide", },
> +       { .type =3D "ata", },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pata_macio_match);
> =20
> diff --git a/drivers/ata/pata_mpc52xx.c b/drivers/ata/pata_mpc52xx.c
> index f1d352d5f128537a..bc9d9df3b5aced64 100644
> --- a/drivers/ata/pata_mpc52xx.c
> +++ b/drivers/ata/pata_mpc52xx.c
> @@ -849,7 +849,7 @@ mpc52xx_ata_resume(struct platform_device *op)
>  static const struct of_device_id mpc52xx_ata_of_match[] =3D {
>         { .compatible =3D "fsl,mpc5200-ata", },
>         { .compatible =3D "mpc5200-ata", },
> -       {},
> +       { /* sentinel */ }
>  };
> =20
> =20
> diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
> index 05c2ab3757568c62..ab264a3a57b0243a 100644
> --- a/drivers/ata/pata_octeon_cf.c
> +++ b/drivers/ata/pata_octeon_cf.c
> @@ -1006,10 +1006,8 @@ static void octeon_cf_shutdown(struct device *dev)
>  }
> =20
>  static const struct of_device_id octeon_cf_match[] =3D {
> -       {
> -               .compatible =3D "cavium,ebt3000-compact-flash",
> -       },
> -       {},
> +       { .compatible =3D "cavium,ebt3000-compact-flash", },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, octeon_cf_match);
> =20
> diff --git a/drivers/ata/pata_of_platform.c b/drivers/ata/pata_of_platfor=
m.c
> index c3a40b717dcdcc2a..ac5a633c00a57ac1 100644
> --- a/drivers/ata/pata_of_platform.c
> +++ b/drivers/ata/pata_of_platform.c
> @@ -79,7 +79,7 @@ static int pata_of_platform_probe(struct platform_devic=
e *ofdev)
> =20
>  static const struct of_device_id pata_of_platform_match[] =3D {
>         { .compatible =3D "ata-generic", },
> -       { },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pata_of_platform_match);
> =20
> diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
> index 556034a15430461f..9513f22d64749199 100644
> --- a/drivers/ata/sata_fsl.c
> +++ b/drivers/ata/sata_fsl.c
> @@ -1577,13 +1577,9 @@ static int sata_fsl_resume(struct platform_device =
*op)
>  #endif
> =20
>  static const struct of_device_id fsl_sata_match[] =3D {
> -       {
> -               .compatible =3D "fsl,pq-sata",
> -       },
> -       {
> -               .compatible =3D "fsl,pq-sata-v2",
> -       },
> -       {},
> +       { .compatible =3D "fsl,pq-sata", },
> +       { .compatible =3D "fsl,pq-sata-v2", },
> +       { /* sentinel */ }
>  };
> =20
>  MODULE_DEVICE_TABLE(of, fsl_sata_match);
> diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
> index 440a63de20d01a07..00e1c7941d0ea0dd 100644
> --- a/drivers/ata/sata_gemini.c
> +++ b/drivers/ata/sata_gemini.c
> @@ -419,10 +419,8 @@ static int gemini_sata_remove(struct platform_device=
 *pdev)
>  }
> =20
>  static const struct of_device_id gemini_sata_of_match[] =3D {
> -       {
> -               .compatible =3D "cortina,gemini-sata-bridge",
> -       },
> -       {},
> +       { .compatible =3D "cortina,gemini-sata-bridge", },
> +       { /* sentinel */ }
>  };
> =20
>  static struct platform_driver gemini_sata_driver =3D {
> diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
> index b29d3f1d64b03317..cd375e4df9644e33 100644
> --- a/drivers/ata/sata_highbank.c
> +++ b/drivers/ata/sata_highbank.c
> @@ -444,7 +444,7 @@ static struct scsi_host_template ahci_highbank_platfo=
rm_sht =3D {
> =20
>  static const struct of_device_id ahci_of_match[] =3D {
>         { .compatible =3D "calxeda,hb-ahci" },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ahci_of_match);
> =20
> diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
> index 53446b997740d5fd..13d92b71e6659cda 100644
> --- a/drivers/ata/sata_mv.c
> +++ b/drivers/ata/sata_mv.c
> @@ -4277,7 +4277,7 @@ static int mv_platform_resume(struct platform_devic=
e *pdev)
>  static const struct of_device_id mv_sata_dt_ids[] =3D {
>         { .compatible =3D "marvell,armada-370-sata", },
>         { .compatible =3D "marvell,orion-sata", },
> -       {},
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mv_sata_dt_ids);
>  #endif
> diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
> index 3d96b6faa3f0e1c6..1483d3efeb7e220e 100644
> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -857,7 +857,7 @@ static const struct of_device_id sata_rcar_match[] =
=3D {
>                 .compatible =3D "renesas,rcar-gen3-sata",
>                 .data =3D (void *)RCAR_GEN3_SATA
>         },
> -       { },
> +       { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sata_rcar_match);
> =20
> --=20
> 2.25.1
>
