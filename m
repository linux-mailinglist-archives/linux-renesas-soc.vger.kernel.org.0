Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF3A654214
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Dec 2022 14:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbiLVNoa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Dec 2022 08:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiLVNo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Dec 2022 08:44:29 -0500
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0642F1758F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Dec 2022 05:44:29 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id c14so1296679qvq.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Dec 2022 05:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWkoEVqb8gDzFMhTgLoXeVsl7llT8DBZlvGpP7SaItY=;
        b=w3nsrAm6lC2CZkqxKIDwV3o6IUTz9xTQ0Fmeo8mS/H6vQl+srh3pDpskf205a8GD6O
         xt1Vj8l6uROM+ZsgZa+1I8FtLHiMp3JRyDtEa24cABWyvKRN9iM8Pt5WkjkYlBfgS7G2
         IOEsIfOr2nu0MUDkPHj5IkMC5kjdKXvJ0fbsbQon5EgnZzGeOJBbYzfIgZZHBMgLrhcL
         tYZ0zyNWmx5KQmycirBTt6c7LzSCiwsp/AsYUjkkvg6irTG5xk0KphNWdTGOU/MDYHO9
         pcKmGlOeE6dfhSlK7PfhlugXaPO0iv0W1BaqnRpEzr/aanZ4wLRAFbAY+i8wK7Ssyvmh
         AsmA==
X-Gm-Message-State: AFqh2kq7dhBMFGI07ifpNqlH6Nq+sPKIRK71Pnc0Xv4/CXHBXK92Pwfl
        B/nRalUiN4CQj8ThrvnRHqv8kZeTDGOmqw==
X-Google-Smtp-Source: AMrXdXvxgWjvHbVRTdMH1Kdzl3e66Wd+WdAqCqRGDQonvCoCXnzYiO6eixgjsAIDeqP7JJjzmpkGeg==
X-Received: by 2002:a0c:fb4b:0:b0:4c7:c32:48e8 with SMTP id b11-20020a0cfb4b000000b004c70c3248e8mr7046861qvq.36.1671716667769;
        Thu, 22 Dec 2022 05:44:27 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id y19-20020a05620a44d300b006bbf85cad0fsm328074qkp.20.2022.12.22.05.44.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 05:44:27 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3b56782b3f6so26862847b3.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Dec 2022 05:44:27 -0800 (PST)
X-Received: by 2002:a05:690c:d84:b0:437:febc:6583 with SMTP id
 da4-20020a05690c0d8400b00437febc6583mr547019ywb.384.1671716667135; Thu, 22
 Dec 2022 05:44:27 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
In-Reply-To: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Dec 2022 14:44:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
Message-ID: <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 6, 2022 at 2:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2022-12-06-v6.1 (TBD),
>   - renesas-drivers-2022-12-13-v6.1 (TBD).

So that became the latter.

Next planned releases, if all goes well:
  - renesas-drivers-2022-12-27-v6.2-rc1,
  - renesas-drivers-2023-01-10-v6.2-rc3,
  - renesas-drivers-2023-01-24-v6.2-rc5,
  - renesas-drivers-2023-02-07-v6.2-rc7,
  - renesas-drivers-2023-02-14-v6.2 (TBD),
  - renesas-drivers-2023-02-21-v6.2 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
