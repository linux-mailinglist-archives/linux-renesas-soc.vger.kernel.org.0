Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2345F79AD0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 01:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242111AbjIKVR6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Sep 2023 17:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241318AbjIKPGa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 11:06:30 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977BFFA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 08:06:25 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ab7fb1172cso1155721b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 08:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694444784; x=1695049584;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r85M+hTFgVqhtA5+2fVJSsJ9jlo61HWAPqJF0RG2cpA=;
        b=N1SPBxhzToC48tWxiu3uJnea/HrL4v1CKCmFrkVcLbMsTm+sRrZqXR2IDiDqZxYooF
         nPBag5OnvCLZjcpfCYRPJzkZ7GEOrqCR8zOFh2gXPrhOB3GCLqbfAZyTKO9GRPbv6wxR
         2EctWwFpL5uSaxs7v3vKXGLIccfoDGeYhZhTlIxKotGXNyTr2dur519XtZ4BGOPDZLFd
         QY2BYnmPXri+SK1EKOP0XDgxkpEp+hxYFMRb4AebTRYghKK0tze6fN3B+u+6K5VDLIJp
         mrARSYywQZi1gjiRbtTgqPwygck/EtzXFoNCBZjQUDU9Dc+E4BE80SBwqb27xkr0WBCz
         gBzg==
X-Gm-Message-State: AOJu0Ywg/q//aKJVRHh0g8Lq0hSA6swgUlTlxg4wk5ji+NPpIuBWdX+0
        XNdMXqNdgN2oesJ5o0GVfqtXdnrh6Ymh3Q==
X-Google-Smtp-Source: AGHT+IH0yGUaXoLiyEvwBkXpyPWWN0Ds/ga2oNVm4T3NVcPCHkyX4m4UJQ7XN8AOKlsZ5/Q4OlDEnw==
X-Received: by 2002:a05:6808:18a4:b0:3a3:9df9:1918 with SMTP id bi36-20020a05680818a400b003a39df91918mr10744629oib.20.1694444784544;
        Mon, 11 Sep 2023 08:06:24 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id a23-20020a05680804d700b003a9b9648202sm3270327oie.26.2023.09.11.08.06.24
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 08:06:24 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6c0f2addaefso366711a34.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Sep 2023 08:06:24 -0700 (PDT)
X-Received: by 2002:a05:6830:12c4:b0:6be:fb88:8352 with SMTP id
 a4-20020a05683012c400b006befb888352mr8469398otq.8.1694444784041; Mon, 11 Sep
 2023 08:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdWXPesKV7XE_QwLrM6pZ1z6GFC-SjJ1ceFTs4o=hv71Zg@mail.gmail.com>
 <CAMuHMdX8HtWOAK6MDdN8F8V0aer0hTHzeAcnCGMycpS70hesNQ@mail.gmail.com>
 <CAMuHMdUjse9v=U8=oZHDJx0Oh9uVzxVWYU+C9jaP_23UOBVMaw@mail.gmail.com>
 <CAMuHMdVGnDg=zkjOSmCWAjEnjfSN9rhOCG-ubzeTf3mvjTEavw@mail.gmail.com> <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXkdD0dN93zsQnjCzFo6ijS2xDzbh+GPGe6--_FuuRbHQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Sep 2023 17:06:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
Message-ID: <CAMuHMdV0KWN2nHDGT28ysTPwBTrachBSsGWf0hHqrci-d0U33A@mail.gmail.com>
Subject: Re: Future renesas-drivers releases
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Tue, Jul 4, 2023 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>   - renesas-drivers-2023-08-29-v6.5 (TBD),
>   - renesas-drivers-2023-09-05-v6.5 (TBD).

So that became renesas-drivers-2023-08-29-v6.5.

Next planned releases, if all goes well:
  - renesas-drivers-2023-09-12-v6.6-rc1,
  - renesas-drivers-2023-09-26-v6.6-rc3,
  - renesas-drivers-2023-10-10-v6.6-rc5,
  - renesas-drivers-2023-10-24-v6.6-rc7,
  - renesas-drivers-2023-10-31-v6.6 (TBD),
  - renesas-drivers-2023-11-07-v6.6 (TBD).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
