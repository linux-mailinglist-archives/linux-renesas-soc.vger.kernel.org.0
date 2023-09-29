Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FF77B32F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Sep 2023 14:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjI2M62 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Sep 2023 08:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbjI2M61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 08:58:27 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2F9BF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:58:26 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59f4f80d084so136769407b3.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695992305; x=1696597105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fky2P0RNW8gUKAUHo3MAH34tNGpFl7NfD+DTbPPJfnI=;
        b=btEXzW8mhT6qsaDzfVJ/UG39O2xMLRUrlys8HhKEMHdx/mQwszEcfS4eX2Uf0LKIGd
         bWeGeVTeGWhI58eevzJ5Fk/bnCq1kFImaMZHPKqZL8Y9geBtQiUuBdQ8r6M/PjwKfx+h
         /txZ3VAW9zNgx6lgHA55qPvKkHa5iGZdtXU30jITS/fwtNhHmh5GbEoFiPD9td+FxepV
         jk0bqx1Lu2qpfGIpBoKKmsutxEv1gs0ayu20Zgyg1HVPdx2n8wH5wFo4nz8TnfxJr93Q
         AhBUvzUFzAsHwaSVhPJHAYM9RXF4ggZ3vK4PiGr95A/VvdpemSrRwlAt5b62FQh/Wd+D
         /0zA==
X-Gm-Message-State: AOJu0YxXwtmXIA8xvfrGjgguaB30ReOP0BlJbTvtW1EiriPs/wPCf9s5
        BNpvLwoo6Aj/cPn1SFDkW0tzz9Xw65gskA==
X-Google-Smtp-Source: AGHT+IEmnl8zU25u9kbiX1WrLjrW5nBiLG/e3U5bey4A51wF5KlK+AbjsOP1evPwBWxC8y2+KhLtQQ==
X-Received: by 2002:a81:6c06:0:b0:5a0:e86e:fd5c with SMTP id h6-20020a816c06000000b005a0e86efd5cmr3929938ywc.0.1695992305403;
        Fri, 29 Sep 2023 05:58:25 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id x125-20020a0dee83000000b0057a918d6644sm5443976ywe.128.2023.09.29.05.58.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:58:25 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59f6e6b7600so116645927b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:58:25 -0700 (PDT)
X-Received: by 2002:a81:a08c:0:b0:58c:53ad:ee3f with SMTP id
 x134-20020a81a08c000000b0058c53adee3fmr4022938ywg.34.1695992304906; Fri, 29
 Sep 2023 05:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <87pm25im9q.wl-kuninori.morimoto.gx@renesas.com>
 <87lectim7t.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVR+dchDRY1wo2RbeXJNb5f_Hbs9oGi90AV_1_rJgT-5A@mail.gmail.com>
In-Reply-To: <CAMuHMdVR+dchDRY1wo2RbeXJNb5f_Hbs9oGi90AV_1_rJgT-5A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Sep 2023 14:58:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU01cU4jO2+jt2fpsU=ozbAHzNy75NJvffESOWHrLJdZg@mail.gmail.com>
Message-ID: <CAMuHMdU01cU4jO2+jt2fpsU=ozbAHzNy75NJvffESOWHrLJdZg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add Renesas R8A779F4 SoC support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 29, 2023 at 2:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Sep 26, 2023 at 6:37 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > R8A779F4 is update version of R8A779F0.
> > This patch adds its support, but is using r8a7799f0 dtsi internally.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.7.

... with the silly typo s/r8a77f4/r8a779f4/ fixed, of course.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
