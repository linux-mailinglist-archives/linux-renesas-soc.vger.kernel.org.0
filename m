Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DADAF4F23DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Apr 2022 09:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiDEHDG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Apr 2022 03:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiDEHDF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 03:03:05 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A5411161;
        Tue,  5 Apr 2022 00:01:07 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id d65so9604382qke.5;
        Tue, 05 Apr 2022 00:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzWpni0hfB4U8rh5IakRHfzMsXXrFTYsZJsWONlkI+g=;
        b=nMGDi/nKfR8c8AuDDFih/q1pYmLkFOE3KhVW6i1OqBXDvKDvqXZts1kaJncQ6fL8c3
         NNNtJAQ7LBeFGShUBMJffZpezhjzLn9DKE2hzF/urN2MryhwLwPNtAVo/aE5q3FiEBYN
         mLqLQdTZG8F2EVQcKVKprjNlJbBCcZ/ot+swbDbrAqaqNZM9ydV+KBkCfTVJsFRZh9z9
         Icg3Vzn9eusAlxOknqwc1JKTMKPVoQXgBS3Fyr+CyFi3Jupo565E5JWsvwzTxGl+HE7q
         5256H2uyTaqH6qXmg+bjA6GDB9zysevBYC7xBYE7ny7w2T/pCtOQ7+32IEDAdnqfqxHW
         bwSA==
X-Gm-Message-State: AOAM532CVaENaBYdeFsJ8Efh3TEphA9g7PUZyX7oISRLys+IpOihM2tk
        JziSNk02yHVEQ22LPIWKvaqbwRrqdPlC/g==
X-Google-Smtp-Source: ABdhPJxZ9XHilEAzBKdGN91scVnqrNSbsJW11pL8Oj5104r6ualuQ3WkPsmVGi3P9qsRgPka57VJCg==
X-Received: by 2002:a37:ef13:0:b0:680:fc96:f63a with SMTP id j19-20020a37ef13000000b00680fc96f63amr1288373qkk.248.1649142066650;
        Tue, 05 Apr 2022 00:01:06 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 21-20020ac85715000000b002e1ce9605ffsm10793638qtw.65.2022.04.05.00.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 00:01:06 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2eb888cf7e7so37293077b3.13;
        Tue, 05 Apr 2022 00:01:06 -0700 (PDT)
X-Received: by 2002:a81:3d81:0:b0:2eb:8069:5132 with SMTP id
 k123-20020a813d81000000b002eb80695132mr1471199ywa.438.1649142066072; Tue, 05
 Apr 2022 00:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220404100508.3209-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220404100508.3209-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Apr 2022 09:00:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9CjzEN5jbrgjHY+HaPN9EJDD8cPGTOxgBf+fHrMX8Uw@mail.gmail.com>
Message-ID: <CAMuHMdW9CjzEN5jbrgjHY+HaPN9EJDD8cPGTOxgBf+fHrMX8Uw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi: special 4tap settings only apply to HS400
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

On Tue, Apr 5, 2022 at 2:26 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Previous documentation was vague, so we included SDR104 for slow SDnH
> clock settings. It turns out now, that it is only needed for HS400.
>
> Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock handling")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
