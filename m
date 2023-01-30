Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15B40680B56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 11:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbjA3Kx4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 05:53:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjA3Kxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 05:53:55 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F4D17CC0;
        Mon, 30 Jan 2023 02:53:54 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-501c3a414acso153888527b3.7;
        Mon, 30 Jan 2023 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FUC6K+TUdMSstlrzdppRdz/QrMCOXm0EOP7+90i1xZY=;
        b=ht9m9YFxQLFVsUimHeqoJwFOz8qFoSRwZxDiiTuUCr6V9x5I9kzETu5HZ7Rmjy4sEi
         fZhXb5qv67wtF+fT5O3UuWa+FO1COtdg5e+h2L1kz6syB0Vh/fbc7sY2LvOPYqFgz4JM
         wPEP8L+Z48T6Y/f7lzkOWKTluCOkEGZ9SxMMaXB4rb+AePPqGO3IckIkQOTgfEGw7zP/
         c2Mqi7wWoSXJaPWKSLOS5iLCgUz5XOrtLj7Rjb5HwZyghhU6UVRiQXKGEnbEWzxGOPKo
         HBisRg6xWKEI08xXgJdaZdfAf2SfbJwAkt9DNzkXrMyp6I1MoYB9R0TN1VDZhpMoLg+F
         TWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUC6K+TUdMSstlrzdppRdz/QrMCOXm0EOP7+90i1xZY=;
        b=K81O8UvgUrXSrxC7BLyURYFok65QC5K1uFgsbe9zVP+Q/yxJ5BjMyPHCSJFaOPgXk4
         fy9vcwX/RYzxs6qLXhOg8bPW7TRDzXOXHy0ePm3g3zR8giVnTdv8gcb1RjtEwjs5q5s8
         oMs3XIjghtqhr7ddLB1LpjWavV1C2Hq81toG8YYdsc6Gu7CL7KAWgDvlDOhRsqKXQh1h
         Y4nKVR1VHvs6cZIq/Ux9Nc4nLizYrbpqeQHlYlYn8S4npGwhapBdC+FXWeoV4yoTzJE6
         dRH+0rojVLWKDS3i6GUxaB4tB9SYJnxgMAYygzxpe71MNJcLIsZRAuwPmnxALlmsJfFL
         MnBQ==
X-Gm-Message-State: AO0yUKUNz9mxpU1hjxuAbmrsbEr6kx3Pq5Zc1URjEj0VTyjH8CF1XGnM
        zU9y2LRlmnEPzq3OC7r3PwIsvGQfbZtQwNdXGZE=
X-Google-Smtp-Source: AK7set8tcLkYYaI01/h2mGKxIOWC8zR7J8jV7aBtEhF+UBiWCM2HORVPRdg6Bslygx9SHUJanm0vt4LR3QDgRmsbg4g=
X-Received: by 2002:a81:b246:0:b0:506:55d9:3a78 with SMTP id
 q67-20020a81b246000000b0050655d93a78mr1975529ywh.339.1675076034014; Mon, 30
 Jan 2023 02:53:54 -0800 (PST)
MIME-Version: 1.0
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
In-Reply-To: <Y9KQPxzHBuZGIN4U@casper.infradead.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 30 Jan 2023 10:53:28 +0000
Message-ID: <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
Subject: Re: [QUERY]: Block region to mmap
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Matthew,

Thank you for the feedback.

On Thu, Jan 26, 2023 at 2:37 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Jan 25, 2023 at 12:30:13PM +0000, Lad, Prabhakar wrote:
> > Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
> > memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
> > virtual address falls within this range, the MMU doesn't trigger a
> > page fault; it assumes the virtual address is a physical address which
> > can cause undesired behaviours.
>
> Wow.  I've never come across such broken behaviour before.
>
> > To avoid this the ILM/DLM memory regions are now added to the root
> > domain region of the PMPU with permissions set to 0x0 for S/U modes so
> > that any access to these regions gets blocked and for M-mode we grant
> > full access (R/W/X). This prevents any users from accessing these
> > regions by triggering an unhandled signal 11 in S/U modes.
>
> I have no idea what any of this means.
>
Basically we are making use of the memory protection unit (MPU) so
that only M-mode is allowed to access this region and S/U modes are
blocked.

> > This works as expected but for applications say for example when doing
> > mmap to this region would still succeed and later down the path when
> > doing a read/write to this location would cause unhandled signal 11.
> > To handle this case gracefully we might want mmap() itself to fail if
> > the addr/offset falls in this local memory region.
>
> No, that's not what you want.  You want mmap to avoid allocating address
> space in that virtual address range.  I don't know if we have a good
> way to do that at the moment; like I said I've never seen such broken
> hardware before.
>
> I'd say the right way to solve this is to add a new special kind of VMA
> to the address space that covers this range.
Do you have any pointers where I can look further into this?

> We'd want to make sure it doesn't appear in /proc/*/maps and also that
> it can't be overridden with MAP_FIXED.
Agreed.

Cheers,
Prabhakar
