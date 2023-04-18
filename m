Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829936E5B1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 10:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjDRIAw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 04:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjDRIAv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 04:00:51 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122A7C5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 01:00:49 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-54fb615ac3dso234073997b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 01:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681804848; x=1684396848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ae3jQh811jW+bT69kCowskcbhNDlXoH7aTMA8yYfQxs=;
        b=K7Tenolttkvmc8/E0R+509WPo/dO3yJj+nUlAtBGUUssrE5lrqkXu3I5oFK4IVh4Kn
         xjMMcemVf55yuon+JF/lZy3ZnL+9yxjkObxhA9NtQibjQVSHwNg4nVNECh9+y8I6OAux
         E8h1J7oJCy14f9dXXujDk3EOtrtluE98OyzhwsDOfHFyK+Bjo0ixueUcnjPY/wIdWYgp
         AW0uzm1ihJYJ4gJR4nsQWy09nrQnWSZ7eD8pnVjMj4KpFmjZECItLAi1GC7qEhjh0dEm
         tJi/NdQ5/ZhhtzBNCUL+0LqYPXrkoxAfXB1amTbjFpK7JdEH0+lrJye1DYpYD3vteDRT
         Qbpw==
X-Gm-Message-State: AAQBX9fzRB7GB3+kjANgiIhJ4vyvnDLhCKeCA1k1nhqcX0NPbkDvNjyX
        lN5Ai9NhTNVKOK77HyfRvWmMkYXrBY4biQ==
X-Google-Smtp-Source: AKy350Y272JAidutVcPKSNTqs97Z+bjzN0WTZ/uf2mZDGXEzxfchArVwHnHdghDhGvZ7tDG+hDjR8A==
X-Received: by 2002:a0d:d74e:0:b0:54f:b518:cbea with SMTP id z75-20020a0dd74e000000b0054fb518cbeamr18416142ywd.47.1681804848112;
        Tue, 18 Apr 2023 01:00:48 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id cl22-20020a05690c0c1600b0054fbadd96c4sm3631422ywb.126.2023.04.18.01.00.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 01:00:47 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-552fb3c2bb7so38755917b3.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 01:00:47 -0700 (PDT)
X-Received: by 2002:a0d:d8c1:0:b0:54f:8c00:58e7 with SMTP id
 a184-20020a0dd8c1000000b0054f8c0058e7mr15979059ywe.48.1681804846803; Tue, 18
 Apr 2023 01:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681734821.git.geert+renesas@glider.be> <20230418075000.GF4703@pendragon.ideasonboard.com>
In-Reply-To: <20230418075000.GF4703@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Apr 2023 10:00:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
Message-ID: <CAMuHMdUqKCokNc-phYFoGKa0vFwCMDdy7RZ-kn6F8yqkvtfkfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm: shmobile: Fixes and enhancements
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Tue, Apr 18, 2023 at 9:49 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Apr 17, 2023 at 03:40:20PM +0200, Geert Uytterhoeven wrote:
> > Currently, there are two drivers for the LCD controller on Renesas
> > SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
> >   1. sh_mobile_lcdcfb, using the fbdev framework,
> >   2. shmob_drm, using the DRM framework.
> > However, only the former driver can be used, as all platform support
> > integrates the former.  None of these drivers support DT-based systems.
> >
> > This patch series is a first step to enable the SH-Mobile DRM driver for
> > Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned is
> > to add DT support.
> >
> > Changes compared to v1:
> >   - Add Reviewed-by,
> >   - Drop dependency on ARM.
> >
> > This has been tested on the R-Mobile A1-based Atmark Techno
> > Armadillo-800-EVA development board, using a temporary
> > platform-enablement patch[1].
> >
> > Thanks for applying to drm-misc!
>
> Would you like to request drm-misc committer rights ? :-)

Don't the listed maintainers for drivers/gpu/drm/shmobile/ don't
have such access already?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
