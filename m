Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4346964B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Feb 2023 14:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjBNN3Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Feb 2023 08:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjBNN3W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Feb 2023 08:29:22 -0500
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF4025BB3;
        Tue, 14 Feb 2023 05:29:16 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id d13so10393043qvj.8;
        Tue, 14 Feb 2023 05:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elju2MTP0U0qSa1xppoJtbK2DOfgpi3PhfsUbTV0VwQ=;
        b=sSdT1Bbs6bDTFm4Hb4939Ix1aITk/WQ70QxSW/eIJ8ceNlgavY5wAaQUzf1m3o9r2Q
         H/r4224PLyfa9/eyH2E1RZCKoirL59S/gizDrjFKN3y0Pil2O/2HVZBIWZcLRYfMemPt
         GTSGrvTiPafBO1HSGx3jnhcgy+SFOzytVwjLFcCd7PcU6+EFCI8A78bl3mA/F+TAh5Qh
         mPeAfeQk21TybvJU5DmvsE4Kmtmzb+Wv/GAgusIQeP7RexxCPZUMJRjepegZhtP46BuS
         3s5gdsvNm7Y1BJkhUmy6PdUIkusE4Yl8fQYqbZGDnXXnYdhHzczeiHeMi0SiyyIWkgEp
         zj1g==
X-Gm-Message-State: AO0yUKW/P0OAYytYferEtPxt5iMNv0hvG6bACPpM2Vu6G43Gd5+TExjE
        LgpBn/qo+qPhFbA2W93LHdaDuP45zTYgZp8e
X-Google-Smtp-Source: AK7set8UpzTPOhquFoX5ZP2DH8VNVeJ/rpkgofcDksrEhSDC1RWm3+uPM9tsWAswXBEFnfPjPtk8Jg==
X-Received: by 2002:ad4:5cad:0:b0:53c:c2d1:e3da with SMTP id q13-20020ad45cad000000b0053cc2d1e3damr5551521qvh.2.1676381354892;
        Tue, 14 Feb 2023 05:29:14 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id p187-20020a378dc4000000b0073b59128298sm1537879qkd.48.2023.02.14.05.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 05:29:14 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-51ba4b1b9feso205995057b3.11;
        Tue, 14 Feb 2023 05:29:14 -0800 (PST)
X-Received: by 2002:a05:690c:ea2:b0:4fc:962d:7dc1 with SMTP id
 cr2-20020a05690c0ea200b004fc962d7dc1mr201372ywb.301.1676381354024; Tue, 14
 Feb 2023 05:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20230209131422.192941-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230209131422.192941-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 14:29:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU4OMBtbpDPx6QiWCxt4WHqoCwBSjJzSNX77x+ktpd-4g@mail.gmail.com>
Message-ID: <CAMuHMdU4OMBtbpDPx6QiWCxt4WHqoCwBSjJzSNX77x+ktpd-4g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzv2m evk: Add uart0 pins
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 9, 2023 at 2:21 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add uart0 pins in pinctrl node and update the uart0 node
> to include pinctrl and uart-has-rtscts properties.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
