Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 590D07CA88F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 14:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbjJPMyY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 08:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233482AbjJPMyX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 08:54:23 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03179EB;
        Mon, 16 Oct 2023 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697460862; x=1728996862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLMiq+CYDlC0gAXaIFVVJ2NuWge91yyg38CIhL86Fh4=;
  b=YikZk41ocTSHXGFKa51H+5Q0JW3bbilpHTSVbQuQK9uer19+bEF0fDdy
   4mSRY2ptJ+FN38Y15RwUm7Cc/aeTL4NXAnksJE751ujsBAw5KHa+zok8f
   F1sTWba2BtYuEMcO/ab1jJhfpaVYkOg4ZvCLv1i0IaVHM7q2rYfuAZzKn
   dr5IFUO2S99avpEbGUGM1fMdJilyZejhPPpggAxGNjwi4GAa1a3oE6jjP
   KatxzaztZtNsjT+R9AYf0kmYI+xC4qqXaiiLTkJUU/HheBEJNGoJFxVZH
   ZHGJsrV0N9rqMSD52FOtbLVFvJk1YcHP/kXthJPkk/x+iXwDa0Xhq3LfS
   w==;
X-CSE-ConnectionGUID: LdlmstcRQjaYoGh4b3JylQ==
X-CSE-MsgGUID: vn8ezhGBR7anL6QYf1/YXg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="10148319"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 05:54:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 05:54:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 05:54:12 -0700
Date:   Mon, 16 Oct 2023 13:53:51 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Greg Ungerer <gerg@linux-m68k.org>, <iommu@lists.linux.dev>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-m68k@lists.linux-m68k.org>, <netdev@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on
 !RISCV_ISA_ZICBOM
Message-ID: <20231016-decay-handgun-17cb857e616b@wendy>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kcVUeI7sXt5WFgxU"
Content-Disposition: inline
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--kcVUeI7sXt5WFgxU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 07:47:45AM +0200, Christoph Hellwig wrote:
> ARCH_R9A07G043 has it's own non-standard global pool based DMA coherent
> allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
> Add a proper dependency.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 880c544bb2dfda..f1696d3b5018d0 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -334,6 +334,7 @@ if RISCV
>  config ARCH_R9A07G043
>  	bool "RISC-V Platform support for RZ/Five"
>  	depends on NONPORTABLE
> +	depends on !RISCV_ISA_ZICBOM
>  	select ARCH_RZG2L
>  	select AX45MP_L2_CACHE
>  	select DMA_GLOBAL_POOL
> --=20
> 2.39.2
>=20

--kcVUeI7sXt5WFgxU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS0yXwAKCRB4tDGHoIJi
0jD2AP416cQb/GlbEFTwIX1JWQKl4+CzJCSGBVU+nMPi+xyLVAEAngvHkO5YQO4H
Fe2wrrFFVo5Ko7FTICOLVHKThrfRZQ8=
=XUzZ
-----END PGP SIGNATURE-----

--kcVUeI7sXt5WFgxU--
