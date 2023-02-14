Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B409695FAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 10:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbjBNJry convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 04:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbjBNJrX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 04:47:23 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F9325286;
        Tue, 14 Feb 2023 01:47:02 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id mg2so2878379qvb.9;
        Tue, 14 Feb 2023 01:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+hs2DyiPjSA/GdZYafa4UC6AqjpTN5zpt+4ZJaQUkU=;
        b=N99IVJ986ozCoD7gHWxfOsCMhdIgXiyCvK1pyvxc44CgweqVjNemMDGMu0GvDYf4/z
         mymP2NjPliRK8lL5QAS5zyMEUqmR6VjN5o7zJ+HgB44HaaTvIBXE6xtTnKH5JA6Xkx4N
         oDZRSnAZacG26ujiJybFNpKnkci1rx3prDzVEP6GQzOXyCEMnvua08qxK52WOrO2Uziv
         PbVRgjfti6hl8RNJUqjnrrEcWd6FkZ9Tv5/xJKfbonp0GD+lccu9ZFXbsM/e4P20j5BU
         VoilQxlcleg0Hok1GUjIP7736gp9iJb//fJDzz8uLDVQNUZ5CmYQmaJuRKTWJEuGEswp
         V+BA==
X-Gm-Message-State: AO0yUKWsfQDmnWBbfcmBNUFWDZeAcJtsfuI6quRuyqX4CAhPEe1yMyZU
        qIJqClufck/SJi2BuftZK6rVKQWdwNS6CUy1
X-Google-Smtp-Source: AK7set/09HpG47msX4+OqDltmIffuKg3g//pYcBSiDCgMTMYBsV7Xo28QJ13qxjWHAutGuJ6PKj3xQ==
X-Received: by 2002:a05:6214:3016:b0:56c:61:7499 with SMTP id ke22-20020a056214301600b0056c00617499mr3882178qvb.23.1676368021270;
        Tue, 14 Feb 2023 01:47:01 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id r129-20020a37a887000000b006cec8001bf4sm11539515qke.26.2023.02.14.01.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:47:00 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-501c3a414acso198969227b3.7;
        Tue, 14 Feb 2023 01:47:00 -0800 (PST)
X-Received: by 2002:a0d:fec4:0:b0:52a:7505:84bc with SMTP id
 o187-20020a0dfec4000000b0052a750584bcmr121816ywf.383.1676368020433; Tue, 14
 Feb 2023 01:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se> <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211165715.4024992-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 10:46:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUALJ7QGtHmb5fkrPotw-8vj6biM5_M-sc6eV3dK0tqZA@mail.gmail.com>
Message-ID: <CAMuHMdUALJ7QGtHmb5fkrPotw-8vj6biM5_M-sc6eV3dK0tqZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: draak: Add overlay for CVBS input
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas, Laurent,

On Sat, Feb 11, 2023 at 5:58 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> The Draak board has an ADV7180 CVBS decoder and an ADV7612 HDMI decoder,
> both connected to the same VIN input. DIP switches are used to select
> one of the two devices, with the HDMI decoder being the default. Add an
> overlay that selects the CVBS decoder.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> [Niklas: Inverted it from HDMI to CVBS]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023 Ideas on Board Oy
> + *
> + * Device tree overlay for the Draak board, to enable CVBS input. This requires
> + * setting DIP switches SW49, SW50, SW51 and SW52 to OFF, and SW53 and SW54 to
> + * ON.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&adv7180_out {
> +       remote-endpoint = <&vin4_in>;
> +};

[...]

> +&vin4_in {
> +       remote-endpoint = <&adv7180_out>;
> +};

Unfortunately dtc doesn't like references to nodes it cannot find the
names of:

    arch/arm64/boot/dts/renesas/draak-cvbs-input.dtbo: Warning
(graph_port): /fragment@0: graph port node name should be 'port'
    arch/arm64/boot/dts/renesas/draak-cvbs-input.dtbo: Warning
(graph_port): /fragment@2: graph port node name should be 'port'
    arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso:13.14-15.3:
Warning (graph_endpoint): /fragment@0/__overlay__: graph endpoint node
name should be 'endpoint'
    arch/arm64/boot/dts/renesas/draak-cvbs-input.dtso:27.10-29.3:
Warning (graph_endpoint): /fragment@2/__overlay__: graph endpoint node
name should be 'endpoint'

Do you think it would be worthwhile to add more hierarchy (like in
arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso), to get
rid of the dtc warnings?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
