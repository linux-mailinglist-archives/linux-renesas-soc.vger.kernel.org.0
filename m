Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82E62694CF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 17:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjBMQdm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 11:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjBMQdl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 11:33:41 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F380CCC1F;
        Mon, 13 Feb 2023 08:33:10 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id g18so14332781qtb.6;
        Mon, 13 Feb 2023 08:33:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EWXIT4tZBYyYPCqmQRMCpsTOOU4dDNBYtC4FWjtudU=;
        b=4P8DNQJ+J4r1GAS0okX4s/npuT0Ukvt06bNi3XDEDiwcQIMyPzFD7+XrOuiNABCJ4F
         af7kzYWPOkr+uHnHY0d8CEwSSS56pQlji4VKEvRFYGJqMj0bYXH3ujlgTvaXsr2LGeu9
         I0OdBXaQthcId4+FCbT+dz2PH8PMiHqvTJ2IGhoAUUI3SSBCH5EEXINR7RPIETwcUBgG
         q8oBZJsTvGLVrTjBRD0cK9VMSS7rWh7wig/vvUO45OAxk55fdunVoFZ8VCLA/oOnof1x
         ZZQUcEZixO956vFwkbPjh5zMCYT3/SjUHwpQvYgDp4QuOV7TyWasqehuMPw4Ioc/11FT
         UPBw==
X-Gm-Message-State: AO0yUKU2FPr65V2CWycj6IW7memeEoKL75WP4woMyoJwswAfe7rQk/LV
        6a1ySr0cRe27DiQeEHNGY76CCZETEDp1dQ==
X-Google-Smtp-Source: AK7set8YaHsyhQdsDiR55Y3EI5ybpxf6fK0jKKnEYJ3BHdrPP5uRNgzDl0tnYqp9MAnOqihBjd/gsA==
X-Received: by 2002:ac8:7d4a:0:b0:3b4:a6af:a2f2 with SMTP id h10-20020ac87d4a000000b003b4a6afa2f2mr46130881qtb.34.1676305946480;
        Mon, 13 Feb 2023 08:32:26 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id u123-20020a379281000000b0073b4d9e2e8dsm880808qkd.43.2023.02.13.08.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 08:32:26 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id x71so14132818ybg.6;
        Mon, 13 Feb 2023 08:32:26 -0800 (PST)
X-Received: by 2002:a05:6902:385:b0:8ec:43b3:83fc with SMTP id
 f5-20020a056902038500b008ec43b383fcmr1061904ybs.128.1676305945849; Mon, 13
 Feb 2023 08:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20230211143655.3809756-1-niklas.soderlund+renesas@ragnatech.se> <20230211143655.3809756-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211143655.3809756-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Feb 2023 17:32:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUr0WkV-=Nm9cYo5eRpfPxjbNTjftpwUMq-uOcg4Jj1rg@mail.gmail.com>
Message-ID: <CAMuHMdUr0WkV-=Nm9cYo5eRpfPxjbNTjftpwUMq-uOcg4Jj1rg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r8a779g0: Add ISPCS clocks
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Feb 11, 2023 at 3:37 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add the ISPCS0 and ISPCS1  module clocks, which are used by the ISPCS
> modules on the Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
