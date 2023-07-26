Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1AF763B2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 17:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbjGZPe2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 11:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbjGZPe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 11:34:28 -0400
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D91213A
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:34:26 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so6045434276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690385665; x=1690990465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXXf3lU2t18vhj69GU+AQ79Bfl/ikBx7X+1wEYvWe0Q=;
        b=JyPVip3HR7iAr4tZvhvKVA/mt6UmMo69931NsZe2E/3EHkvozpj3GvSdOfwtm7kvz7
         kv5YRYoW4hEgMcEGKIXJxkti0Y6i3mR/TTw/2e4QdQryNYI7aL87Dup3RC8PjHQ8EAIY
         jwuS9yOP0bGJWXXOoA2sfh6im6O1Hkf91w/3kx0mVvcJi2f5j0ck6JhNcSpoatfXDoby
         Vcda4qngq55Msw9EN3dvNp3lpMhE9/IWHw7TSsjdIAFY/Wp9UPpWs5Lb7samJgerBY0Q
         2ElkEpcxXdbQgabsXvp9vbhidR988GUSX2nx6HxPHxx7dtwu2PareXFGvVUsBQNVtSjk
         woCA==
X-Gm-Message-State: ABy/qLa73pAzXU4yNsRRFH7Z2896hM4nEjcRpBk2MyT/zVuqBwQS0czl
        g8OZ18Ety20LPxJhH54WkRmePLfmz4YVww==
X-Google-Smtp-Source: APBJJlE9W9DlxqUP8cdNDNuoZOqmDdi9hK8Dt0ka5BL4BDK50vKnbxpA+EwoSPuzKmwrL+WPoLO38w==
X-Received: by 2002:a25:5d4:0:b0:d10:68c5:233e with SMTP id 203-20020a2505d4000000b00d1068c5233emr1999850ybf.60.1690385665578;
        Wed, 26 Jul 2023 08:34:25 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 188-20020a2519c5000000b00cf79d3a503fsm3510251ybz.42.2023.07.26.08.34.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 08:34:25 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-583b47809beso52114437b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 08:34:25 -0700 (PDT)
X-Received: by 2002:a25:6a45:0:b0:d0b:9a92:b8ac with SMTP id
 f66-20020a256a45000000b00d0b9a92b8acmr1914223ybc.14.1690385665227; Wed, 26
 Jul 2023 08:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
In-Reply-To: <aa1a92cf69dc341724bcb5662de994a54cb14422.1690382707.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Jul 2023 17:34:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEChOUP4uT1ff2spkVxsYLiz+74qz8xZfFKnk1Cji93A@mail.gmail.com>
Message-ID: <CAMuHMdXEChOUP4uT1ff2spkVxsYLiz+74qz8xZfFKnk1Cji93A@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: spider-cpu: Add GP LEDs
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 26, 2023 at 4:46 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Describe the two General Purpose LEDs LED7 and LED8 on the Spider CPU
> board, so they can be used as indicator LEDs.
>
> Note that General Purpose LEDs LED9 to LED11 are not added, as they are
> connected to GPIO block 4, which can only be accessed from the Control
> Domain.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I do not have physical access to a Spider development board.
> Thanks for testing!

Kieran and I held a remote test session over IRC and Jitsi, and
the LEDs are working as expected. Thanks Kieran!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
