Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0DF7ABE92
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Sep 2023 09:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjIWHvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Sep 2023 03:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjIWHu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Sep 2023 03:50:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3014711D
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Sep 2023 00:50:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E628C433CB;
        Sat, 23 Sep 2023 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695455451;
        bh=ubMZKfnyWKEVj8IonDZ1KMHOScdcFtBBm3nDE8Z1AWc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QiIERg4N7rrYpj3SdR416sb92nDUGV9zxcTCRd3QekW4b15Ph48zl1w0nIrDDR7NP
         toaj5B4xUccHC8mDBCvMRdT+LcYwdqtL421Kh3j3YLMR2S2//D4Jm7x3mwKLE/jxqo
         WfwGAG76J65srxjJ4nuVPpfeiAzftq9pUUamLUQ5uRhXyhTxz/s7qeQfgNpZJMyAsb
         n7R3QhjAnr1FOlX1hiZ6k8eBQILTi1xNPpAFg5w0fF91/GHCNE/AD8SL6v+SCfRr7g
         5J71CiSYG3bWNuSt2A+4nF2YIbHfeW8BBkteF8jJZFDrGHLxqsWP65I/j3tDp0Gm34
         KrQV7vUY/hp5Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50307acd445so5364142e87.0;
        Sat, 23 Sep 2023 00:50:51 -0700 (PDT)
X-Gm-Message-State: AOJu0YxP6Tb9x3I9pARnE+HTnR1kOuDINps2pffz2PoSq+o1vsgkDZ2S
        fF7cW4+HjNDhrhsqhgPvjTdrtJT/0+JosbebN0A=
X-Google-Smtp-Source: AGHT+IFea1wRy5eJudPxUVu3RtK9dVhqNh4TIRC1jtYqezMS8B5X7TK38IQtLbtJiEI0LfX+mY8MEQQsI3NSizqlOp8=
X-Received: by 2002:ac2:4a69:0:b0:502:d302:e025 with SMTP id
 q9-20020ac24a69000000b00502d302e025mr1061315lfp.2.1695455449792; Sat, 23 Sep
 2023 00:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230922081351.30239-2-conor@kernel.org> <20230922081351.30239-8-conor@kernel.org>
In-Reply-To: <20230922081351.30239-8-conor@kernel.org>
From:   Guo Ren <guoren@kernel.org>
Date:   Sat, 23 Sep 2023 15:50:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
Message-ID: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new properties
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 22, 2023 at 4:16=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Convert the th1520 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/=
thead/th1520.dtsi
> index ce708183b6f6..723f65487246 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -20,6 +20,9 @@ c910_0: cpu@0 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
Why not riscv,isa-base =3D "rv64"? I saw "i" in the riscv,isa-extensions.

Maybe this question should be in this mailing thread and a little late:
https://lore.kernel.org/linux-riscv/20230713-tablet-jimmy-987fea0eb2e1@wend=
y/

> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <0>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> @@ -41,6 +44,9 @@ c910_1: cpu@1 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <1>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> @@ -62,6 +68,9 @@ c910_2: cpu@2 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <2>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> @@ -83,6 +92,9 @@ c910_3: cpu@3 {
>                         compatible =3D "thead,c910", "riscv";
>                         device_type =3D "cpu";
>                         riscv,isa =3D "rv64imafdc";
> +                       riscv,isa-base =3D "rv64i";
> +                       riscv,isa-extensions =3D "i", "m", "a", "f", "d",=
 "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";
>                         reg =3D <3>;
>                         i-cache-block-size =3D <64>;
>                         i-cache-size =3D <65536>;
> --
> 2.41.0
>


--
Best Regards
 Guo Ren
