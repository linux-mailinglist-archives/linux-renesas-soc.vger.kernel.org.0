Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111CE640998
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 16:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbiLBP4X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 10:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbiLBP4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 10:56:20 -0500
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF80CDE5EF
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 07:56:18 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id a27so5680887qtw.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Dec 2022 07:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXXeH4+ZYsUSaB1QpSk4DHdla+VszrboKtVjpAVkPJk=;
        b=29YY8kf1ZIG2Ivc2LvOdQoFMXMpYt0Cpc7Uufcxn00BlP9obHNr/KBlQCGquuoNT2I
         AjMAfLzp93tkmKmn+jQ1+TWZOY2U4GYEMIDOF3kS6zkSBVOFpUhmG2zd5mz3hDWXvrTz
         cAQ6DwdhKW7rqhgTY5D2Q4+FWlv4Qkx+VMCcrvMt6VlYqJSZ32DqXhpPpi5QIrNuTQRf
         OxU04a52U3wXOqk+TafECmml4Ry7sM8Nj67p6cAT57Q4YEHVqtdPkh8ORPGqSsKoenCh
         cWAFzfhRYLRqmqR+k1h0VGlMbJyTgejst+SnTBaYTZdgqa07Ijbjdw/b0zAhyU1O1nPh
         IAlA==
X-Gm-Message-State: ANoB5pnSX3fh1eE8LC7h8yu03f5Ps23b1fhnUrQHAl7YEGlqi9vpJbh+
        X8RSed44TDXLE+HRP3JZ6EtszQlbYEm2pg==
X-Google-Smtp-Source: AA0mqf7AOK2PuI8oIzogUj1VJdDksjUVN15mBFptzaG7FaogpW1toL8wLG4Uv+CeVYsRr+a03NVkVA==
X-Received: by 2002:ac8:44c1:0:b0:3a6:6cb9:45cf with SMTP id b1-20020ac844c1000000b003a66cb945cfmr32281952qto.205.1669996577906;
        Fri, 02 Dec 2022 07:56:17 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id w21-20020a05620a445500b006fa4ac86bfbsm5771182qkp.55.2022.12.02.07.56.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 07:56:17 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id l67so6542538ybl.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Dec 2022 07:56:17 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr42194640ybc.543.1669996577263; Fri, 02
 Dec 2022 07:56:17 -0800 (PST)
MIME-Version: 1.0
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com> <8f147834-095b-caae-fec1-66b1740ff1c2@ideasonboard.com>
In-Reply-To: <8f147834-095b-caae-fec1-66b1740ff1c2@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Dec 2022 16:56:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHzDh-F4Bm=7kERQYnodt3JncAGPNFQwfHg5PaJfcCyA@mail.gmail.com>
Message-ID: <CAMuHMdXHzDh-F4Bm=7kERQYnodt3JncAGPNFQwfHg5PaJfcCyA@mail.gmail.com>
Subject: Re: [PATCH kms++ 0/4] Support Y210
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Fri, Dec 2, 2022 at 4:32 PM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 02/12/2022 15:16, Tomi Valkeinen wrote:
> > These kms++ patches add support for Y210 format.
> >
> > I didn't find a super clear description of the byte order for Y210
> > anywhere.  If someone knows what it is supposed to be, I'd appreciate
> > verifying the code =).
>
> Actually, this:
>
> https://learn.microsoft.com/en-us/windows/win32/medfound/10-bit-and-16-bit-yuv-video-formats#overview
>
> indicates that the 10-bit values should be shifted by 6. So the drawing
> code in this series is probably not right.

https://elixir.bootlin.com/linux/latest/source/include/uapi/drm/drm_fourcc.h#L212
seems to confirm that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
