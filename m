Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2776EA6F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 11:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbjDUJ3T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 05:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232009AbjDUJ27 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:28:59 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A1D2700;
        Fri, 21 Apr 2023 02:28:55 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-b8f64317611so620039276.0;
        Fri, 21 Apr 2023 02:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682069335; x=1684661335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCjofkWzZkuraVUTlUbtSbE2JJ1nXTh85jQkyVRTONE=;
        b=DsEHBxYpd4Yzg/ekZt+gi6OvQJDjP9c4ufdMOvRNQ//E2ijv6z1R669cSlV+Djp4as
         wNJWLX2il68yywOa/uCopIyXT8LKdwgFHhECb5yfZD2iCv7QICbe9Gazf458eFL+2CEt
         EbVRj1tW+YLPLVXEwgsyYrscwTT9c/nSUwSbBBzORHDJUP6il/uHT9KJPpgp56H2VBbt
         Bfw3Zr/GlwBRNJpyqABUmxZT8F06B2n1dkE5aPx1iCuxWqzZBKJp+YriuX0iTa4/Uqya
         I26Lvl1Jk039gb8+05pu9kgjBMLCOo8cy7J51B4ajjquQkUpngljfAhniOYb2K8sDSXK
         beKw==
X-Gm-Message-State: AAQBX9eE9kmfNhn7rFqifMhWQqdxXL/aZ6F8StjlbDYaRklPSolZWRcf
        /JwS3/adxuu0h/8gKu5TtFqzuVk1i+AfSOJc
X-Google-Smtp-Source: AKy350beXRU6rYgDoa1zr4m+6pvt69Ptc82jXj3zaKST9FhGBXdakQmpOnNqhK6+FBa4zP+AlLDnXg==
X-Received: by 2002:a0d:d684:0:b0:552:a0e4:aa18 with SMTP id y126-20020a0dd684000000b00552a0e4aa18mr1463510ywd.46.1682069334833;
        Fri, 21 Apr 2023 02:28:54 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id y68-20020a0def47000000b00545dc7c4a9esm846574ywe.111.2023.04.21.02.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 02:28:54 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b8f59a1071fso617458276.1;
        Fri, 21 Apr 2023 02:28:53 -0700 (PDT)
X-Received: by 2002:a0d:c606:0:b0:54f:e33d:f1d1 with SMTP id
 i6-20020a0dc606000000b0054fe33df1d1mr1334927ywd.13.1682069333635; Fri, 21 Apr
 2023 02:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com> <20230412145053.114847-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230412145053.114847-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 11:28:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXu5VExTMfaZrkeSgwy-y6eHPwacMh_mkdEd3Y974GSbg@mail.gmail.com>
Message-ID: <CAMuHMdXu5VExTMfaZrkeSgwy-y6eHPwacMh_mkdEd3Y974GSbg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] tty: serial: sh-sci: Fix TE setting on SCI IP
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

On Wed, Apr 12, 2023 at 4:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per the RZ/G2L users hardware manual (Rev.1.20 Sep, 2022), section
> 23.3.7 Serial Data Transmission (Asynchronous Mode) it is mentioned
> that the TE (transmit enable) must be set after setting TIE (transmit
> interrupt enable) or these 2 bits are set to 1 simultaneously by a
> single instruction. So set these 2 bits in single instruction.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * Removed fixes tag.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
