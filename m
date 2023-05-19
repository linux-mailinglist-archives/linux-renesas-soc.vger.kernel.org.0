Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAAA70915E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 10:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjESIJm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 04:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbjESIJk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 04:09:40 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C906DC;
        Fri, 19 May 2023 01:09:39 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-561b43fc896so27589867b3.0;
        Fri, 19 May 2023 01:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483778; x=1687075778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaBdSp8eiNzrRXhSGbzgRa5y6IFKL4dLFDdhP2mKp9o=;
        b=YpW+HbLZC6cMMdC9leCRSJUrn6kMBBNmmb4QChyT4g5/O3xu4Z3F7WIgY2S67kJ/Um
         gaGP3bDDjEhY0gmMVSN6PXD7Ebu+0lH5TLRH4F1piMbmdfXDqs2QNER3ui6f4T1sY/Xj
         gm8DTR5EuB8Yh2zQZN/JFItGaZ7M3rjvCBxmWDRgSiR0nCZD7xsnDCSurh0I/+OHkrDE
         AQSVQTXrzhyj8YuLaScnevw9QQQ9lSzd6ylau2Lnuz/F0ltMLolWQb+rubdV6v+Dk+qd
         imIJiaFlSqnK3hLpzNj/ehwVjEHWF/UhwUl/zHTVfU/+rIOaKKCFkjDs9vepaGx2p2tV
         Derg==
X-Gm-Message-State: AC+VfDzjG1hAlLisGgZxeVq4tLx6v+qPTMeB6mCHRE13eVttfBGHc067
        A6uomPTWBDUxOc/EsR7ODTkH/+R5SYwSfw==
X-Google-Smtp-Source: ACHHUZ7h8a44f263KX+wZmpnuZRIBZngqgEFGIvZGt9WNqnCYabBCx1CUZAgrFbm6NtmM3vATDkEAQ==
X-Received: by 2002:a81:6507:0:b0:55a:6dc8:e084 with SMTP id z7-20020a816507000000b0055a6dc8e084mr1109902ywb.17.1684483778482;
        Fri, 19 May 2023 01:09:38 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id u7-20020a0dd207000000b0055ddea0db57sm966325ywd.146.2023.05.19.01.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 01:09:37 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-55a8e9e2c53so27480007b3.1;
        Fri, 19 May 2023 01:09:37 -0700 (PDT)
X-Received: by 2002:a25:cac4:0:b0:ba7:e9da:5d88 with SMTP id
 a187-20020a25cac4000000b00ba7e9da5d88mr867286ybg.63.1684483777227; Fri, 19
 May 2023 01:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de> <20230517230239.187727-41-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-41-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 10:09:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX60oq6VuTBpgxxAPs744+UQ9kxFyyEuSHJrRs8SAY7Qg@mail.gmail.com>
Message-ID: <CAMuHMdX60oq6VuTBpgxxAPs744+UQ9kxFyyEuSHJrRs8SAY7Qg@mail.gmail.com>
Subject: Re: [PATCH 40/97] usb: gadget/renesas_usbf: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Herve Codina <herve.codina@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
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

On Thu, May 18, 2023 at 1:03 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
