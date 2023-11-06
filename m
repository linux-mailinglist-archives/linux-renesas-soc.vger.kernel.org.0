Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189B57E1DF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Nov 2023 11:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjKFKLG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Nov 2023 05:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjKFKK6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2023 05:10:58 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEFCA9;
        Mon,  6 Nov 2023 02:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699265455; x=1730801455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DRRKZrYj5+9kq92lsBvFIV1vN9Iksj0Xwc1g88JYlX8=;
  b=qKEwijsoBOv+4VNAHXgDA03K9XTtoExaDB7nIHFBtB0TwjhkiT8HaLYi
   M/o7fw/j1bHaOjxYb5d5w+4QyYs3PPJexIdqlaWWQ8IjSlKVCni+8s90k
   c93GkMs1nNEdQO6UQRQ0qO5ZsKO2OhyumjLUzdHRnhf8IAYdLKpXhjWl7
   g1VTlgk2TT2W5b7Jkm9LH7mVWRlO6OziDoVuZiRMoBaw2rLxs67eVJefJ
   qDKAgE0KAmzPDn1764uVJgiuuQtVZxWnnQjviEnzsa9BEov/Guv4noXu6
   4Iqc2NLXudN8g9xP51ToHb5xVupjvPCmSHbhT3T31teTQ/hB44RJ/Jx8G
   A==;
X-IronPort-AV: E=Sophos;i="6.03,281,1694728800"; 
   d="scan'208";a="33823697"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Nov 2023 11:10:53 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1180C28007F;
        Mon,  6 Nov 2023 11:10:53 +0100 (CET)
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
Subject: Re: [PATCH 1/2] dt-bindings: clk: rs9: Add 9FGV0841
Date:   Mon, 06 Nov 2023 11:10:55 +0100
Message-ID: <4852777.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org>
References: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org>
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

Hi Marek,

Am Sonntag, 5. November 2023, 21:07:58 CET schrieb Marek Vasut:
> This is an 8-channel variant of 9FGV series.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
>  .../devicetree/bindings/clock/renesas,9series.yaml     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> b/Documentation/devicetree/bindings/clock/renesas,9series.yaml index
> 3afdebdb52ad..af6319697b1c 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
> @@ -21,6 +21,15 @@ description: |
>      1 -- DIF1
>      2 -- DIF2
>      3 -- DIF3
> +  - 9FGV0841:
> +    0 -- DIF0
> +    1 -- DIF1
> +    2 -- DIF2
> +    3 -- DIF3
> +    4 -- DIF4
> +    5 -- DIF5
> +    6 -- DIF6
> +    7 -- DIF7
>=20
>  maintainers:
>    - Marek Vasut <marex@denx.de>
> @@ -30,6 +39,7 @@ properties:
>      enum:
>        - renesas,9fgv0241
>        - renesas,9fgv0441
> +      - renesas,9fgv0841
>=20
>    reg:
>      description: I2C device address

Looks goot to me.
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


