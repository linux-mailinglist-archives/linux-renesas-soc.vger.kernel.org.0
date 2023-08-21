Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2AF782A98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbjHUNdt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbjHUNdt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:33:49 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5331E2;
        Mon, 21 Aug 2023 06:33:41 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-579de633419so38921687b3.3;
        Mon, 21 Aug 2023 06:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692624821; x=1693229621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7mvIFODAMzO2NDF/ghM3N3wtfQulP1WxC0HjlTZ3hk=;
        b=TLNih0yUyADinkLcfd3sDWrgD63Ga9+INFAZ9iik7UmOexn2j/1HEtaP6QCqgv9WQs
         MJyaC+fmOLCLQoOvTk3N4LjZzMmxP6VZM0oyDryTTmVh6xHQzGGNKIsGy7NISTN+pK5V
         qbmPqACR8YKktpQfdzbrDKh1rXqu3t0ldrA7cD77vd101+BrbmsE81hwUN/e4wJHdad+
         O0M8lsYo7v8Awc0ECUMQ4rWniIVa6hX1DZH5d5YxmOZXCaFU4DOT4KMA7ckPiFLBDQJV
         K04L1UNtJlhs9mvj6PS4JO/Z4GIWdcMHOB42b7sgdVYUCmMDIiCmk+I8t1Z7GeYeXLwL
         AgBA==
X-Gm-Message-State: AOJu0YwrQwv5le7x1QRHSwGAiXBMbPlpBR16cR6e4C1j/E48CsUPx1m6
        RjmQdSrxzuiommEz/Md/O1zsbYcDCdbu6A==
X-Google-Smtp-Source: AGHT+IF7lC4UNzCTrQDiLstquG5tiddPIhtp2JgjzZkIVR3X16e+CWHpiWP2QeLzhcNTSplO4gpuHA==
X-Received: by 2002:a0d:ccd4:0:b0:58c:8b7e:a1e4 with SMTP id o203-20020a0dccd4000000b0058c8b7ea1e4mr7742567ywd.23.1692624820802;
        Mon, 21 Aug 2023 06:33:40 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id w17-20020a0dd411000000b005616d72f435sm2234112ywd.116.2023.08.21.06.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 06:33:40 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d690c9fbda3so3271475276.0;
        Mon, 21 Aug 2023 06:33:40 -0700 (PDT)
X-Received: by 2002:a25:d149:0:b0:c83:27d4:c0d6 with SMTP id
 i70-20020a25d149000000b00c8327d4c0d6mr7444935ybg.37.1692624820155; Mon, 21
 Aug 2023 06:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-4-biju.das.jz@bp.renesas.com> <ZONhXitn/aX6smxv@smile.fi.intel.com>
In-Reply-To: <ZONhXitn/aX6smxv@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Aug 2023 15:33:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiOfpx-cHx=P+eg11gbtCmynDxyezD12pnT3OYYm55og@mail.gmail.com>
Message-ID: <CAMuHMdUiOfpx-cHx=P+eg11gbtCmynDxyezD12pnT3OYYm55og@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: typec: tcpci_rt1711h: Add rxdz_sel variable to
 struct rt1711h_chip_info
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On Mon, Aug 21, 2023 at 3:06 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sun, Aug 20, 2023 at 07:44:01PM +0100, Biju Das wrote:
> > The RT1715 needs 0.35V/0.75V rx threshold for rd/rp whereas it is 0.4V/0.7V
> > for RT1711H. Add rxdz_sel variable to struct rt1711h_chip_info for
> > handling this difference.
>
> ...
>
> >  struct rt1711h_chip_info {
> >       u16 did;
> > +     u32 rxdz_sel;
> >  };
>
> Again, run pahole. And see the difference, if any, depending on the place of a
> new member. Note, some 64-bit architectures may require 8-byte alignment even
> for 4-byte members.

Doesn't make a difference, the size and alignment of a structure are
always multiples of the largest alignment of each of the members, so
the structure size will be 8 bytes on both 32-bit and 64-bit (except
on m68k, where it will be 6 bytes).

Either you have 2 bytes did, 2 bytes hole, and 4 bytes rxdz_sel, or
4 bytes rxdz, 2 bytes did, and 2 bytes hole (except on m68k, where
there won't be any holes).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
