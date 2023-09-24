Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3902F7ACBAB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Sep 2023 21:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbjIXTmX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Sep 2023 15:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjIXTmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Sep 2023 15:42:22 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7CEFC;
        Sun, 24 Sep 2023 12:42:15 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a6190af24aso625859666b.0;
        Sun, 24 Sep 2023 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695584534; x=1696189334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1OAJIe+rOLUJzcNXVPzHOsb+JGDg6uIpunRCjru7BA=;
        b=mJp8Ah+MXmbEK7uvQ7uQiTWdPTlNE/ZtAAgTEnzOfuFIilT7f1P/vypblHIvsM0KYI
         VWG60e2pTl62KCxFay6q1/qpVrzkGNfCMd1ugqvzlhyTrfnH+L/Wdz2ih8ZwuIZ/RASx
         +xEcMJ5ybkSpr1Hoe5t/GkJhfa+I09WjW+YbEK5nPgW+pqNxdxlXmf5epjeCAqa4pa5B
         DurJXn5iHIt1G4R20L3rxACrMwYKO9Md1X8Hn1qm9cu/dthMDkcQwA9nKNB96H68Q+Ga
         BIuPD/NY7LdZVCOFgMMl+bTv8XDNFJYCy+PAKrDAc4sAhPf7TloxfB/HUa7ElG0s2OT3
         OV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695584534; x=1696189334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1OAJIe+rOLUJzcNXVPzHOsb+JGDg6uIpunRCjru7BA=;
        b=tde+8uSAQjvD4Tu1xUXATh4ZTWr4mKkhlKOoiuO1q21UpeXZo+zCez2AG57Jd6xbpZ
         SS7PfljRh8NNUUsxtexvWQhMbRnEcApwCBOCR5ajJEae3q6+bAB9MZuadjNVqnYsGolx
         cbt9XXqF2SteAezTIC/K701UFTzoQyIk8HiSnpvOYJ5vbv4A8sDZXU5Ge6cjJP8WjbIq
         lCQKO6Xa71pXVtBwvPyQiB6HW4olfZE6uKSFSPRDn1cWyi2M9Ajl94C9JAjDyE0g2Spz
         srelGxT/sXfD8vBBmDppAirZBO6ARITcqBMysXBrsMsJPz3Uew/bWIqjUWjhPqE66dYY
         jPzQ==
X-Gm-Message-State: AOJu0Yy6nqcag6qOmNbUCoK/uT69sLCB7WP1mu0124H6zsWxL4czwP1Y
        KK81yMOlsoOWL2ocXQYKkSI=
X-Google-Smtp-Source: AGHT+IElTLWdxYzDdmFsBbLbnhFSAtGhPSM0V5vdb/GQFUHvl00TjFJ8CTOxEMzXqAItwMFv4I1k2w==
X-Received: by 2002:a17:907:2e01:b0:9ae:406c:3425 with SMTP id ig1-20020a1709072e0100b009ae406c3425mr4634928ejc.0.1695584534105;
        Sun, 24 Sep 2023 12:42:14 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d18-20020a17090694d200b0099cb1a2cab0sm5322258ejy.28.2023.09.24.12.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:42:13 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc:     conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v2 5/6] riscv: dts: allwinner: convert isa detection to new
 properties
Date:   Sun, 24 Sep 2023 21:42:12 +0200
Message-ID: <4833002.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230922081351.30239-7-conor@kernel.org>
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-7-conor@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dne petek, 22. september 2023 ob 10:13:50 CEST je Conor Dooley napisal(a):
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the D1 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 8275630af977..947e975d2476 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -25,6 +25,9 @@ cpu0: cpu@0 {
>  			mmu-type = "riscv,sv39";
>  			operating-points-v2 = <&opp_table_cpu>;
>  			riscv,isa = "rv64imafdc";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +					       "zifencei", "zihpm";
>  			#cooling-cells = <2>;
>  
>  			cpu0_intc: interrupt-controller {
> 




