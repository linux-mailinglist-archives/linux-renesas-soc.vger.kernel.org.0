Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24414DD5C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 09:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbiCRIHQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 04:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231597AbiCRIHP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 04:07:15 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C02220B1B;
        Fri, 18 Mar 2022 01:05:57 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id j21so6370956qta.0;
        Fri, 18 Mar 2022 01:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kbN1kQDZEcDLVN/clqzZKABwdGjgeE56x6zL+WZKMLU=;
        b=CkR56z8YgJKY4SiOiCTtG+9nli7qLQ1fYQ8cJm5Vu+9fuuELKlhdIW9D4vmIorKDWy
         1a4QSdDrIlJoAlMPmQyw1zttUJEJxsNFtGxR4YaXFfR+yymxeuMx+gF+RPS+fNZis2KU
         MIlSM40gJJMeZqD9rc93uSuIvhiuqyvWfl1mmoK7IfWygjuQpxRm/iTTpn3//2RF1io3
         I4FH2neW+4UYXVyGWnCPpvzBaNd0F0yx+6zZ6/OyKSnsPKYXmdDLXm4UQMY4wtlINVse
         SkZqK5Xv6IYZh/YLkv2+honLWS0uyk/ZFJdQ9R7n1+MXkFYRiNMcGd6pa2srOV+lIRAO
         r8IQ==
X-Gm-Message-State: AOAM533iniH4aQAuYCy/mhM6nvmc8w1lhJWOBhc5OdPKDePykRfOSUxl
        uzUb6JPM3iqx3U3Xm6PHU710AkNIqzfLta0s
X-Google-Smtp-Source: ABdhPJxqQ5jkavMXc7TAGZdnFjhTCXZ0cD34hmbznzHRygWBgVOPxp2cla8VLb71VHm3GVG9/4Okqg==
X-Received: by 2002:a05:622a:2cd:b0:2e1:db0c:88db with SMTP id a13-20020a05622a02cd00b002e1db0c88dbmr6580637qtx.649.1647590756453;
        Fri, 18 Mar 2022 01:05:56 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id g200-20020a379dd1000000b0067d76e714f5sm3648070qke.35.2022.03.18.01.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 01:05:56 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id o5so14566166ybe.2;
        Fri, 18 Mar 2022 01:05:55 -0700 (PDT)
X-Received: by 2002:a25:bc8f:0:b0:628:8649:5c4b with SMTP id
 e15-20020a25bc8f000000b0062886495c4bmr8735785ybk.207.1647590755490; Fri, 18
 Mar 2022 01:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220317174627.360815-1-miquel.raynal@bootlin.com> <20220317174627.360815-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220317174627.360815-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 09:05:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPxJiWErUk4-8Qc3E7i3_=h0rn-isgUPGoJBRdNUBGfQ@mail.gmail.com>
Message-ID: <CAMuHMdWPxJiWErUk4-8Qc3E7i3_=h0rn-isgUPGoJBRdNUBGfQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] serial: 8250: dw: Use the device API
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 17, 2022 at 6:46 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Use the device API instead of the of_* API.
> While at it move this operation outside of the if block to reduce the
> indentation level.
>
> Cc: Emil Renner Berthing <kernel@esmil.dk>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
