Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5FC7BA68F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 18:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjJEQip convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 12:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjJEQiT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:38:19 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409BC83E7;
        Thu,  5 Oct 2023 01:00:25 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-579de633419so7334677b3.3;
        Thu, 05 Oct 2023 01:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696492822; x=1697097622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8XXiyUa8rUMXqZKwJl8l2OpKGUUmRnI7buBMM68MR0=;
        b=WWg0jx+ERfYCMUcNwr/aJoqyXHc9RI4K1s+gUwXE0pUMW6jpHihKa1865QB6sutlKA
         5s2MRoXbbU13maUzaJa1KPV1Eep4lvi5Y6syrUmkx/NvzqfbXup+k1T7wSfppzI+hQPF
         pqcrgCMvMApcYtKHeNfgAMCVI4XbFuD4upijcRN6bgkXPKB2Yh5go76R9igjICPXhr7b
         S5eIlhRWDbZ7l4eMqkynIKC39dvUn8E9W5uS2mWTMA/C4lcCDnUCZsZPx0AIPYzg3Ns6
         SRd4grKBI61DTdO2saZ/cnzxwd/NJ3SI3x4qHB5COg6wT/s+xN3hwMYP/dmKeZCNkRBl
         wp6w==
X-Gm-Message-State: AOJu0YxdbnrJYj3rLR09OKkP5xQCMDaijCeJ6c69yyhmXzTSn8pws9LW
        wrMR6HGi6jesA/J+ci7xncDk96e5UiUxKg==
X-Google-Smtp-Source: AGHT+IHIMheIGiuO6/PzaNBuUOio/MU8sKPI4Rlf9vGVL7iMO32Z9ygTQNdlGsUl8JwaaR0kbCz/sw==
X-Received: by 2002:a81:9182:0:b0:59c:6ef:cd55 with SMTP id i124-20020a819182000000b0059c06efcd55mr4967700ywg.8.1696492822472;
        Thu, 05 Oct 2023 01:00:22 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id o203-20020a8173d4000000b005a237c85821sm338960ywc.110.2023.10.05.01.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 01:00:21 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-579de633419so7334457b3.3;
        Thu, 05 Oct 2023 01:00:21 -0700 (PDT)
X-Received: by 2002:a0d:d402:0:b0:59b:c847:bce0 with SMTP id
 w2-20020a0dd402000000b0059bc847bce0mr4930670ywd.42.1696492821478; Thu, 05 Oct
 2023 01:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com> <87sf6sfn9i.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sf6sfn9i.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 Oct 2023 10:00:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvRYzz4VciUYnznJ1pY=uaaRc4V29uxLkgyH2ReWPKGw@mail.gmail.com>
Message-ID: <CAMuHMdUvRYzz4VciUYnznJ1pY=uaaRc4V29uxLkgyH2ReWPKGw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: renesas: renesas.yaml: Add
 renesas,s4sk compatible
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 3, 2023 at 4:33 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch adds "renesas,s4sk" which target the R-Car S4 Starter Kit
> board.
>
> Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
