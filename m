Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836C17CA888
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 14:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbjJPMxk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 08:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbjJPMxj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 08:53:39 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825A5E6;
        Mon, 16 Oct 2023 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1697460817; x=1728996817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/Kybg4Z50Wvq30RILKgpO3v0qlhowsz9dfetjRKyrI=;
  b=je4SJ/aIWleAMd44kMTRW5egWS/m7GLCINSozzU95txeqo7KURLyBk0D
   2vWNy7W8cdJ8LNnb8RzngeY15DyFf9xT3q3p+IMMdfkpwSJj7BcU/eYHp
   3r9R4B40rBl5SuSNNak8rIpcZtJHT8FlgB79IfVcdS3Yy6m+E9TRVus5l
   O54uG7fWnW35ezEqrgwWVAB57KJt6qrQrmKsMt24sVroVSbJC2DX0tNio
   Y/Yxjklbog5nBnrSCv/LizfVchZW0iHYOCGLYfw77pZaA3FbBC1HcoMMg
   eUSuXh3PcfKnvZUGHywSHRxMuRt8TcTSCfA7Xo806et5Z37dVQQ1ZTpqB
   g==;
X-CSE-ConnectionGUID: Leh/mquETYqrSTT64nJ6KQ==
X-CSE-MsgGUID: /im/eG7oQQ2L63+JysKsNA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="asc'?scan'208";a="240802430"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2023 05:53:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 16 Oct 2023 05:53:22 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 16 Oct 2023 05:53:18 -0700
Date:   Mon, 16 Oct 2023 13:52:57 +0100
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
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from
 ARCH_R9A07G043
Message-ID: <20231016-pantyhose-tall-7565b6b20fb9@wendy>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xxo3lByE7rW+vKH8"
Content-Disposition: inline
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--xxo3lByE7rW+vKH8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 07:47:46AM +0200, Christoph Hellwig wrote:
> Selecting DMA_GLOBAL_POOL without the rest of the non-coherent DMA
> infrastructure does not make sense.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index f1696d3b5018d0..ea473b4150dfa8 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -338,6 +338,7 @@ config ARCH_R9A07G043
>  	select ARCH_RZG2L
>  	select AX45MP_L2_CACHE
>  	select DMA_GLOBAL_POOL
> +	select RISCV_DMA_NONCOHERENT
>  	select ERRATA_ANDES if RISCV_SBI
>  	select ERRATA_ANDES_CMO if ERRATA_ANDES

Since this Kconfig menu has changed a bit in linux-next, the selects
are unconditional here, and ERRATA_ANDES_CMO will in turn select
RISCV_DMA_NONCOHERENT.

I don't think being more explicit hurts anyone though, so
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--xxo3lByE7rW+vKH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS0yKQAKCRB4tDGHoIJi
0j/bAQDgJ0nwXmtzgHU2Jl2AAhl0wDZ4qQpYml3lufvr+cf2nwD/ZKm1C9hG3Wly
LIQ9sbba3auXK4oJhcEr/7Eot4eqkAI=
=XPiq
-----END PGP SIGNATURE-----

--xxo3lByE7rW+vKH8--
