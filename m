Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D351529C17
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 10:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243269AbiEQIRA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 04:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243314AbiEQIQt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 04:16:49 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A22D4B854;
        Tue, 17 May 2022 01:14:39 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id j3so4599857qvn.0;
        Tue, 17 May 2022 01:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+esBYGdwBNF82J0r/t3Xc71uUQoFbWoz8vYtjWFG/vM=;
        b=4rlHyKQV306UZ4jZ5DlMel3GOVALAUHJ34+sn8AgpLtSbZllN5uecEPay9jSvr10d6
         RXwgBbevylvrQaeXouYU1zcrcAwA+p++jsbL54WL2Y5iILm24cx1iBlZKO7K/pj9OAxC
         Tzl+DERURs19OYNhmJeC/t3u3z+zm9U+J6tNXg30qfdvSeOcTak4CXcI8vAvJU3mG0kr
         X5eK4BNJG47CzvePWXl3VLi+7QNyy+C0umR0n0YkZGPLY04isF9HNZnbEEJWllcrHc1b
         EQbBqAtD2F8MLaxViwBJkCab4xpeALeZXlX3mJSk/gz563V/1KE3yRYSvNq94hJjJ5gs
         5EqA==
X-Gm-Message-State: AOAM533MS77vChCRRvi98vRcmSxb0l+Wx6I1oi7auuTQEMpGtDxs4xtG
        gx5Aqw0Xi4IRcBgM4LpdSl7mmsZdykBUBw==
X-Google-Smtp-Source: ABdhPJwi4KvOjFGrTt6mR+CKQCFp9XkAdQpL+UApDHryNCVFb4yiViMp4ormbX2nYOhbjRE7V229iw==
X-Received: by 2002:a0c:b2ca:0:b0:45a:a933:e477 with SMTP id d10-20020a0cb2ca000000b0045aa933e477mr19178956qvf.70.1652775278769;
        Tue, 17 May 2022 01:14:38 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id t202-20020a3746d3000000b0069fc13ce22fsm7227514qka.96.2022.05.17.01.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:14:38 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id r1so31134405ybo.7;
        Tue, 17 May 2022 01:14:37 -0700 (PDT)
X-Received: by 2002:a25:e04d:0:b0:64d:6f23:b906 with SMTP id
 x74-20020a25e04d000000b0064d6f23b906mr13300979ybg.380.1652775277578; Tue, 17
 May 2022 01:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 May 2022 10:14:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxqnW9+zO=bxHDV-edQcd4u3zu_zjeti-L+O+owJrLdQ@mail.gmail.com>
Message-ID: <CAMuHMdVxqnW9+zO=bxHDV-edQcd4u3zu_zjeti-L+O+owJrLdQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Thu, May 5, 2022 at 8:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add ADC node to R9A07G043 (RZ/G2UL) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
