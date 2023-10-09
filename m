Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E61C7BDB6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 14:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346381AbjJIMTT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 08:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346715AbjJIMSv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 08:18:51 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EA13869;
        Mon,  9 Oct 2023 05:16:00 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-579de633419so54732387b3.3;
        Mon, 09 Oct 2023 05:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696853759; x=1697458559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl00x9F8gW/xdOyelK9eYXeUORxvhqizJLBB30N7AGk=;
        b=cI/Nqx/k179AtYaOEvaNz1ZhgKN3sFuJuBkj50Zr8VfTpEjqi1Ve0zz+Ap42QgfsOJ
         N2j7dRmmSRXJB/Bf7Aq1e7lsHiTc1sMX8IT0diGJjGmEjhGNn6tHr+pwXtgjGPdAxP2l
         0/LPW+9h7dy16EPEcchFfUMhIk1O12ij7wabTCeuxwVTZQmzYiqlkguZ5SczHG/ONq3N
         N/0zo+MOcBHdlLLrGG0bMLVyIKxTs7so4vM9Lpyj3JH1u6Qbq3FcCv7Rcb2TMUA/TskA
         IuIZKteKw32AiWBPTk3NtttRAdOP4sVRpENtkDSs59gez9dXNbI4CBl0EUM5Jbof1tmc
         EESA==
X-Gm-Message-State: AOJu0Yw7LhlbDS1zn0yRCw81UZFT4dfCzWbIqRgLGucRigzLsbzUNUk2
        PRlJPIzjZa/0JwuSqJzwR+YSBXv/1ErVoQ==
X-Google-Smtp-Source: AGHT+IELe+3I8FWuWnnUxoIPY8fcz5mi8r2NEs5/lm7mVTLb8wseID8RAmWbGRU9e0uQJnyWrp0urA==
X-Received: by 2002:a0d:f204:0:b0:569:479f:6d7f with SMTP id b4-20020a0df204000000b00569479f6d7fmr14459936ywf.43.1696853759588;
        Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id m131-20020a817189000000b005950e1bbf11sm3619210ywc.60.2023.10.09.05.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7af20c488so1026447b3.1;
        Mon, 09 Oct 2023 05:15:59 -0700 (PDT)
X-Received: by 2002:a0d:d402:0:b0:59b:c847:bce0 with SMTP id
 w2-20020a0dd402000000b0059bc847bce0mr16554853ywd.42.1696853759136; Mon, 09
 Oct 2023 05:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy> <20231009-smog-gag-3ba67e68126b@wendy>
In-Reply-To: <20231009-smog-gag-3ba67e68126b@wendy>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 14:15:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
Message-ID: <CAMuHMdVc7VOvB86A7-TShhoqut6Y1ZvY0WSC8XpOEv8Bb2bA-Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new properties
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-riscv@lists.indradead.org, conor@kernel.org,
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
        Jisheng Zhang <jszhang@kernel.org>,
        Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Conor,

On Mon, Oct 9, 2023 at 11:44 AM Conor Dooley <conor.dooley@microchip.com> wrote:
> Convert the RZ/Five devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -24,6 +24,9 @@ cpu0: cpu@0 {
>                         reg = <0x0>;
>                         status = "okay";
>                         riscv,isa = "rv64imafdc";
> +                       riscv,isa-base = "rv64i";
> +                       riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
> +                                              "zifencei", "zihpm";

LGMT, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I could not review the "zi*" parts, as the documentation that I have
does not mention these.

>                         mmu-type = "riscv,sv39";
>                         i-cache-size = <0x8000>;
>                         i-cache-line-size = <0x40>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
