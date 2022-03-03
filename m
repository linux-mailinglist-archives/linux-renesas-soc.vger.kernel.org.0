Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9304CBD9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiCCMVQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiCCMVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:21:12 -0500
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217BEE1B58;
        Thu,  3 Mar 2022 04:20:26 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id t69so100067vkc.5;
        Thu, 03 Mar 2022 04:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WTJ5LvjqEp7+ENcKXvmkMqdcb8CZ4kI1jvvGxz0GEe4=;
        b=D5ds7FAOlZ9asbzaQpxjo6wEqGeDhujK6X+MMiLCt6vnHJGoYXyn5mWSazaRsGmGk4
         1lradq44QzF0T5LswAbaMi1JuKG31MilIAuhf8f8NQw5gnRg7EAtd3Z7UA15VXX5XHoB
         SIHSnuNEjtPT1iMFWbIl867uiAnpzU1zyM7JeRTIUrmuBH9pH/pw+iotVAJi4mtwC9fD
         XdGCJtKj0m2crPP/VkeP7uVNwDAKsLZGvXJEGpyO7BiLo8fvyN45JA28t11G3P2K0WbB
         rBJSd96KMQhuiP4J/giPki4AF+xtd/c//G2LLTn2YzHA23k1/W2URukPC/yVdzakvPNj
         KhDg==
X-Gm-Message-State: AOAM531fUAVkxALiA2Bq3YVcTlnekOdxE66jISQeqxrYaZPIeFTpN9qj
        Kuow2LNkxRm0J9bL/dB0v9jG0e3EnQA2mQ==
X-Google-Smtp-Source: ABdhPJwKAWoH3XwJl+EtwuA2waIsoFR0yBUbAu7jBsi6fHYozYPe+tO2hk7yD7nqDXKS+Px8PbsdUg==
X-Received: by 2002:a05:6122:1314:b0:332:4d98:5db4 with SMTP id e20-20020a056122131400b003324d985db4mr15078568vkp.26.1646310025026;
        Thu, 03 Mar 2022 04:20:25 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id j127-20020a1f5585000000b003289dda729asm289570vkb.20.2022.03.03.04.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 04:20:24 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id q12so1250476vsr.13;
        Thu, 03 Mar 2022 04:20:23 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:31e:bd90:f1c3 with SMTP id
 cz34-20020a056102292200b0031ebd90f1c3mr4452772vsb.77.1646310023737; Thu, 03
 Mar 2022 04:20:23 -0800 (PST)
MIME-Version: 1.0
References: <52970494111d9287cc8355e0f2e3de474361c75f.1646296493.git.geert+renesas@glider.be>
 <164630760533.3471399.15267126463863979019@Monstersaurus>
In-Reply-To: <164630760533.3471399.15267126463863979019@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Mar 2022 13:20:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWYaqxA8W-1CSdOj7HV1V0s_byx=iFe+awbgxwsAh7tA@mail.gmail.com>
Message-ID: <CAMuHMdWWYaqxA8W-1CSdOj7HV1V0s_byx=iFe+awbgxwsAh7tA@mail.gmail.com>
Subject: Re: [PATCH v2] ata: Drop commas after OF match table sentinels
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ide@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Thu, Mar 3, 2022 at 12:40 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Quoting Geert Uytterhoeven (2022-03-03 08:36:35)
> > It does not make sense to have a comma after a sentinel, as any new
> > elements must be added before the sentinel.
>
> Indeed.
>
> > Add comments to clarify the purpose of the empty elements.
> > Rewrap entries to a single line to have a consistent style.
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

>
git grep "{ }," | wc -l
> 2638
> git grep "{}," | wc -l
> 2088
>
> Lots of false positives in that basic search, but this looks like a big
> job. Is this something that could be added to checkstyle?
>
> Probably hard to match when it's a sentinal, rather than an initialiser
> ... so perhaps a coccinelle task.

Yes, there are _lots_ of these.

I fixed the ca. 50 cases involving Renesas-specific compatible values,
and picked up the ata subsystem for a first run.  But fixing all of them
looks like a lot of work, so automation might help.

For soc_device_attribute tables, there are less cases, so I'll just
send the handful patches to fix all of them...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
