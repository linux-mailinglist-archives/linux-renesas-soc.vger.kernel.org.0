Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A19016E983F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Apr 2023 17:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjDTPZg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Apr 2023 11:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjDTPZe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2023 11:25:34 -0400
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791CB359B;
        Thu, 20 Apr 2023 08:25:33 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso634400e87.0;
        Thu, 20 Apr 2023 08:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682004329; x=1684596329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/WfTVgZ7cjo7IhLaMrIy3ZNMqKOacPl5jhauciw4fo=;
        b=bhzWTIoqPjSHnBM2H/KKmhI2L3ppCK+ZzdV22JYy0VUu5nAMwOuzxvB1R3wuC62Es1
         Aw8n7ByNnxc4AfRMOOp36RVJrXQXBfuL+9STYeTQNOfbmSSJMk/gaCBSfOKrsbckq08n
         s4XZTCK0Xu/v1P1TM50d7vZRKEfKKIYWTfg7XW6Oe15YtX9gra9pu6FGx73prMcvlufn
         R+uevCE2WpkA/oWjOSphxBLJ3KdXXA1tIATO6iiTuvSdxwoVD5OV80VbyrVJWkiT3ai0
         TxwB6AsnPS64Lh4abdLcyOyNa2jlvN8u4UX29eEVZoiwSeX+G3pDBW/a49FyOsLqvwGR
         h01w==
X-Gm-Message-State: AAQBX9cQZxWorRXtA1YQK959J7g2IsJdOpECzy7gdQwZG6Plo9K9fDzW
        d00ZzbwvtOR94qxHkdbRagvdNsMpVy/Alz4o
X-Google-Smtp-Source: AKy350YFei/uQcRmxLU7tg96a2BWfjN8rCt27EDLVII2NHWLsvVtZA/Mek3YL5NbVBIeBx/w+/QsKg==
X-Received: by 2002:a05:6512:98b:b0:4ed:c4c7:e636 with SMTP id w11-20020a056512098b00b004edc4c7e636mr564706lft.46.1682004329558;
        Thu, 20 Apr 2023 08:25:29 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id l22-20020ac24316000000b004d8580b2470sm246790lfh.225.2023.04.20.08.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:25:27 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ec81245ae1so654078e87.0;
        Thu, 20 Apr 2023 08:25:26 -0700 (PDT)
X-Received: by 2002:a19:5202:0:b0:4ed:c6d3:9f7 with SMTP id
 m2-20020a195202000000b004edc6d309f7mr508450lfb.1.1682004326215; Thu, 20 Apr
 2023 08:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com> <20230417090159.191346-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230417090159.191346-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Apr 2023 17:25:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgpP--UzotS-Cww6tjAES3YvWQ=ydmYARd8G2kb2umfg@mail.gmail.com>
Message-ID: <CAMuHMdVgpP--UzotS-Cww6tjAES3YvWQ=ydmYARd8G2kb2umfg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a07g054: Add MTU3a node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 17, 2023 at 11:02 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add MTU3a node to R9A07G054 (RZ/V2L) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
