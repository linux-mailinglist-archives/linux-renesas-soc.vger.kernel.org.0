Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362626D3DFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Apr 2023 09:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbjDCHSy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Apr 2023 03:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbjDCHSw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 03:18:52 -0400
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAE4421F
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 00:18:51 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id y15so36734755lfa.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Apr 2023 00:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680506328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehLyQWH/3+JQgCAyTWgVTaiW/YYZ6U90qQfq4tvZyhI=;
        b=x9BJc8lTGJkqtWZyGh83r7H5MGmo61w7ySiAWnEaQFPUnF1M1ZqRlyrwuYliGY9juE
         GaX7DRg4EB1oP2MAy8xDfJMCP0WNUzm4hqrAZuJ4VODtZCEpNiMJPvQSn3TpnNQZdgh3
         AE7ljBtr7uMsIK5NxA6nVxiOUq9MDL0HPq1tX4s2oNihkv5dc1kXgXiUcF5NSdpM/dW4
         CvIBKoLRC/rGAqNNd41B5o4EmN8A06jGJxz2f7/BEjxDw+csp4S499486/PtilKZPlLX
         Od8AdjkAGvzgOjWCoNU3JiB+2PEW/CenvGZ5AqnSAEiZWfyYNtKv8q9JJqBrAKoJ6xd5
         sfGg==
X-Gm-Message-State: AAQBX9dm2c46CngRTFON+fp0tLCmwz5qkMISevj8PzUqkSiWZvFx12R4
        +esIhYacQaMrOgNBJK+bpDxPI9rQuwbnrQ==
X-Google-Smtp-Source: AKy350YkbHDLMH1cyHAvY8xXpjmFKc6ogZDQ3/yENZ5q98nrOAl4B51uplJUZ3/5URvG7cMEu7yfGQ==
X-Received: by 2002:ac2:495e:0:b0:4e9:bafc:88d3 with SMTP id o30-20020ac2495e000000b004e9bafc88d3mr9221999lfi.59.1680506328236;
        Mon, 03 Apr 2023 00:18:48 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id b5-20020ac25e85000000b004e80141709fsm1649041lfq.109.2023.04.03.00.18.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 00:18:48 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id y15so36734521lfa.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Apr 2023 00:18:46 -0700 (PDT)
X-Received: by 2002:ac2:5e85:0:b0:4e8:5112:1fd5 with SMTP id
 b5-20020ac25e85000000b004e851121fd5mr10079154lfq.1.1680506326048; Mon, 03 Apr
 2023 00:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de> <20230401161938.2503204-40-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230401161938.2503204-40-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Apr 2023 09:18:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXr6kXjAMuzPRUnnYi3-z-8TnsOYdCp6jrdMUDa8oS+jA@mail.gmail.com>
Message-ID: <CAMuHMdXr6kXjAMuzPRUnnYi3-z-8TnsOYdCp6jrdMUDa8oS+jA@mail.gmail.com>
Subject: Re: [PATCH 39/49] mtd: rawnand: renesas: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Apr 1, 2023 at 6:20 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
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
