Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B717E1DF2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Nov 2023 11:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjKFKJc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Nov 2023 05:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjKFKJb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2023 05:09:31 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D324123;
        Mon,  6 Nov 2023 02:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699265367; x=1730801367;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=B4Oe0b1cFvTgmEbTwGSSok8M6UKv+lWjUW+dPbjQ7Hk=;
  b=COME70ycXq7EChq3MGdSdyNBgToocblR5qGnOiap/0gMWX09Q8SVenHR
   RvqXscZNih1cnDNP7iyF1kAXGmE5YjAQp8ip2aeUM8kwTgKq1zItofH/0
   Eh7nl3erwt0HO4oizaPNqJ0Ub5vZX0tvbZIy8zo/BDdp3v24giq1Zs1ci
   hirDhBdZaE1EvGLBZhCT42zMdBt+J9nUvLxwcGZm0Vfsw5JnKN5mm24PK
   aWNAZM7t5zZSH4PsA4a92s6VyMpDt1FO0E+uIX+8oAkUCLMiSgdhR8g/V
   zspOpFt2kJrekSuW3R//zLiF35ISEu98zXGZUUvOsy6UGX0smCmy4TSys
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,281,1694728800"; 
   d="scan'208";a="33823655"
Subject: Re: [PATCH] clk: rs9: Fix DIF OEn bit placement on 9FGV0241
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Nov 2023 11:09:25 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4C7D628007F;
        Mon,  6 Nov 2023 11:09:25 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Date:   Mon, 06 Nov 2023 11:09:27 +0100
Message-ID: <4530887.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231105200642.62792-1-marek.vasut+renesas@mailbox.org>
References: <20231105200642.62792-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Maker,

thanks for the patch.

Am Sonntag, 5. November 2023, 21:06:15 CET schrieb Marek Vasut:
> On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE1 is BIT(2), on the other
> chips like 9FGV0441 and 9FGV0841 DIF OE0 is BIT(0) and so on. Increment
> the index in BIT() macro instead of the result of BIT() macro to shift
> the bit correctly on 9FGV0241.
>=20
> Fixes: 603df193ec51 ("clk: rs9: Support device specific dif bit
> calculation") Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/clk/clk-renesas-pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pci=
e.c
> index 380245f635d6..6606aba253c5 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -163,7 +163,7 @@ static u8 rs9_calc_dif(const struct rs9_driver_data
> *rs9, int idx) enum rs9_model model =3D rs9->chip_info->model;
>=20
>  	if (model =3D=3D RENESAS_9FGV0241)
> -		return BIT(idx) + 1;
> +		return BIT(idx + 1);
>  	else if (model =3D=3D RENESAS_9FGV0441)
>  		return BIT(idx);

Nice catch!
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


