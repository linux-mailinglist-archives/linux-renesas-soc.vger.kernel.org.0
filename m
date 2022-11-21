Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E34D631B60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 09:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiKUI2T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 03:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiKUI2S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 03:28:18 -0500
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4D218394;
        Mon, 21 Nov 2022 00:28:17 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id z17so7525611qki.11;
        Mon, 21 Nov 2022 00:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qE1fqBat725e8iz0zzpI2SYT4ym88l39TqTjHkBdTBY=;
        b=nGdEGdVwp3T7mdBULvMVY0kztwiSGcACLhlXtn9IuiNIQXUf+OsimNkTtb5tSh2Omy
         pSXBUMyBpdX58IFqmwaTmbw9Cb0QlvFFhiACvWMVEHP4YIy6+NwlPOrIBDtUaT4YMadp
         TI6XMiRlHTL+6apgogS0euOAa/e0miv6WiwqtD6IeXXFZEVCcydHj+VX6QhGchM9oIq+
         n48Hv+MDYH8T1PAfzVuhe6rigOeWdnY23MOAla0pc4tDuzI3eAlMuv9kAOq1yOl8Z7yb
         tDd49oAoHsiVAfclVKrgV76akWFl52Eev8q7PfeZsa3LD2OloY3UUoy0fFYofVbuMnVe
         REew==
X-Gm-Message-State: ANoB5pmWQAkJ+ulAisxbdg8em1PyKqAW0g0wiEmtJ6jDwCO1iXY0pwZr
        kjFs5Dr44zmGA515gtQhjb7OmQ6ttw7cdg==
X-Google-Smtp-Source: AA0mqf7yHaoZ2lk726iGEjy5SFHitgE/Une/cRIxIRgG81dQYR82uky9Lk7Lirh3fwvLySL0tyfuRQ==
X-Received: by 2002:a05:620a:22ab:b0:6fa:9fb8:c50b with SMTP id p11-20020a05620a22ab00b006fa9fb8c50bmr15423488qkh.48.1669019295967;
        Mon, 21 Nov 2022 00:28:15 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id x12-20020ae9e90c000000b006b5cc25535fsm7491653qkf.99.2022.11.21.00.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:28:15 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id p81so5046875yba.4;
        Mon, 21 Nov 2022 00:28:15 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr1226421ybq.89.1669019295127; Mon, 21 Nov
 2022 00:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20221118214556.81763-1-wsa+renesas@sang-engineering.com> <20221118214556.81763-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221118214556.81763-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Nov 2022 09:28:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=+EVsu-f3owgUn=PZUGHyDvxuuVxH1RPMcD0+Q8uvfQ@mail.gmail.com>
Message-ID: <CAMuHMdV=+EVsu-f3owgUn=PZUGHyDvxuuVxH1RPMcD0+Q8uvfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: add helper to access quirks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 18, 2022 at 10:50 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add a macro to check for a quirk because it a) ensures that the check
> for non-empty 'quirks' struct is not forgotten and b) is easier to read.
> Convert existing quirk access as well.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
