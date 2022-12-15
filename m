Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDDDC64D936
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 11:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiLOKFb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 05:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiLOKFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 05:05:30 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED00E01C;
        Thu, 15 Dec 2022 02:05:26 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id g7so4760230qts.1;
        Thu, 15 Dec 2022 02:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+ZYNd92mzKYhHhNQyamU3s9dIOEVoY+yE9KyMFTsb4=;
        b=6hs20ZCDVViwwiZpsgEJljlfl0H5SBK5DQDmVXivu6pQYB8QQZMNiMpukrlc1ooB5D
         nP+ha1fflVTG8NPaqbINXt/cJZgLZbxb+oKl5xaREYlY5V0Kgen1pAhMmqPBE2sWUF4D
         DuToXKFxa6XZrL9v24J2fpbK2ZR5EMPff4cPMeeaTqchvVHFEx2jFSROAaiwpxSwILnc
         D2NL8sUPfxaLc+NwjwGMBUDK0Ylyz7mdUT68y5T51v/5o0CQj74hB6usJ7WQwNRv052v
         MmevRXGsKgd2oGjLnor0unzTSZ0WvB7EKeoGOmdtrdB8g9BZwNdsrZ9IQJqoKMM1ABkI
         I21w==
X-Gm-Message-State: ANoB5pnNirKpFlmCFJ3rxuMTB6DI80g6GEWg8ecw2U+ZEV2bNZLAHq28
        CBkmZs3JW8lIO3Xg6muu9MXkcLtOUgO6zQ==
X-Google-Smtp-Source: AA0mqf4uM3s7bP3j4TGRVmiEDaaBlC69aBTmM5I8RTpCeZh9cGBkiAFlPJaERs9yZ85bg6mAFbqjAA==
X-Received: by 2002:a05:622a:1818:b0:3a6:8da6:65bc with SMTP id t24-20020a05622a181800b003a68da665bcmr48963139qtc.13.1671098725143;
        Thu, 15 Dec 2022 02:05:25 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id i4-20020ac860c4000000b003a7ee9613a6sm3173219qtm.25.2022.12.15.02.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 02:05:24 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3cbdd6c00adso34030967b3.11;
        Thu, 15 Dec 2022 02:05:24 -0800 (PST)
X-Received: by 2002:a05:690c:f8a:b0:3b4:8af5:48e with SMTP id
 df10-20020a05690c0f8a00b003b48af5048emr2457724ywb.383.1671098724460; Thu, 15
 Dec 2022 02:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
 <20221209155623.29147-4-biju.das.jz@bp.renesas.com> <Y5NfWiqhoPhkGGjG@kroah.com>
In-Reply-To: <Y5NfWiqhoPhkGGjG@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Dec 2022 11:05:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwhBQ-VUJ_QMuBjgvNhgkba4SquzF9Pma9nLy5d39QGA@mail.gmail.com>
Message-ID: <CAMuHMdUwhBQ-VUJ_QMuBjgvNhgkba4SquzF9Pma9nLy5d39QGA@mail.gmail.com>
Subject: Re: [PATCH 3/4] usb: typec: hd3ss3220: Sort header files
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
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

Hi Greg,

On Fri, Dec 9, 2022 at 5:16 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Dec 09, 2022 at 03:56:22PM +0000, Biju Das wrote:
> > This patch sorts the header files alphabetically.
>
> This says what you are doing, but not why.
>
> Why is this needed?  What does this fix?  This is no requirement of USB
> code that I know of.

... to avoid merge conflicts when adding/removing includes in future
patches.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
