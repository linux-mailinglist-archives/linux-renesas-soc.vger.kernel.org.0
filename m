Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744745483AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jun 2022 11:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239806AbiFMJXm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jun 2022 05:23:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240994AbiFMJXf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jun 2022 05:23:35 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BD612AC1;
        Mon, 13 Jun 2022 02:23:34 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id o73so3585989qke.7;
        Mon, 13 Jun 2022 02:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8rFo7f66ykTSnfZKM/BnUKlIf9dWN24PvIXPDjPMSw=;
        b=IWGAeZDqc41JK92U6agu3qQ/NDluU7At6ZaAsmZQbeDBOuaBpXHEVdEHobwZvHrGte
         YZ1JDGWhPur3U1eHr3M9YjY5I/rHiYj17ZbI5MkefG0l59ikzX61Bb9w4L3fHoK81+kV
         RseJrIMMGU1WgYq8HSxp+hS1zPRmRw/mTvZCFVAhlNSs4Unm8nDOqbsugJphB1jLSsbK
         6vr/HvLarCzt4N/xga8khWx+09ry08pm+Mr6MEEsdMrovPJt4MxD9NraX95sAyR04WtF
         jycKv/pkn+b/pRe+HMeBvhLflpujiGqLnd6SO+vsrQ6BwTS9UHAtFRqBVE4KTAjlBoBq
         AWXg==
X-Gm-Message-State: AOAM532wCIpDLAjoY86zuSKqH66ES5EVKc5ukCtxQY144VLx7reNL6Yq
        hJIBXi6QXSgupikhVNd5AwbFFihWjr1sRw==
X-Google-Smtp-Source: ABdhPJwVq7u+H4ZGdGeUmsibwBiZEehO15kO8vTdDNbtHiQZN7cQjeHDOLGNwq1RBY3e/PmNBV0skg==
X-Received: by 2002:a05:620a:288d:b0:6a2:ee69:5ce8 with SMTP id j13-20020a05620a288d00b006a2ee695ce8mr38208795qkp.233.1655112213822;
        Mon, 13 Jun 2022 02:23:33 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id x1-20020a05620a12a100b006a6d74f8fc9sm5918458qki.127.2022.06.13.02.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 02:23:33 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id p13so8914385ybm.1;
        Mon, 13 Jun 2022 02:23:33 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr59508768ybh.36.1655112212999; Mon, 13
 Jun 2022 02:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <5f124fc332b4b866f5238ada7ac000f4639c88c3.1651495078.git.geert+renesas@glider.be>
 <4c11e4c7-c441-7520-5fea-08a89e149ce6@linaro.org>
In-Reply-To: <4c11e4c7-c441-7520-5fea-08a89e149ce6@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jun 2022 11:23:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCFU08oyFvex3sj=CBD4MB1c_B3jccqNedURRN_cia+g@mail.gmail.com>
Message-ID: <CAMuHMdXCFU08oyFvex3sj=CBD4MB1c_B3jccqNedURRN_cia+g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: renesas: Move renesas,prr from arm
 to soc
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

On Tue, May 3, 2022 at 1:54 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 02/05/2022 14:40, Geert Uytterhoeven wrote:
> > The Renesas Product Register DT binding is not a top-level DT binding,
> > hence it does not belong under Documentation/devicetree/bindings/arm/.
> > Move it to Documentation/devicetree/bindings/soc/renesas/.
> >
> > While at it, change the license from GPL-2.0 (only) to GPL-2.0-only OR
> > BSD-2-Clause, to match comment practises.
>
> s/practises/practices/ ?

Yep, and s/comment/common/ ;-)

> You should get Simon's ack for this. :)=

Pinging Simon by side-channel...

> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in renesas-devel for v5.19.
> >
> >  .../devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas,prr.yaml (85%)
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
