Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A3877F3A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 11:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349734AbjHQJir convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 05:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349738AbjHQJig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 05:38:36 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0553B271F;
        Thu, 17 Aug 2023 02:38:36 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-64189860374so38519776d6.0;
        Thu, 17 Aug 2023 02:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692265115; x=1692869915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lG0PvqsurLUvaF1Y9k3gXKdirngpEpH0CAgcJMxxco=;
        b=TYdAgnsG0Eiu0morPqqnUr6x+RHBl2qZ3pG4da++25bdxmI+LxmUWr5TtogVdC2TSN
         TGSBmcTn8NWq2Rms4RhEzUnlNnhRlvhZThhN5aTX4jPvf2RjQaLBSooe6kEFNvoRbBJ4
         kRGePoj+tlL7m+fCJQwJXa72Lac4TzyIHULIvbFuW5nUYvFTmeK1rm5pk2HXuqq21yQf
         7jp17IEOfKwDWS8G0pGtAPtbZz9A3kGV9BQfZn5mDeVbfPCquPA1gjVbHPLrEdu1/e3D
         1SXw7CRIopCgoOW95zN78HFQAkm4GzwF3GZSdIOFlznmBFtcnXbs8Q86QjttBm53OfCj
         lv5Q==
X-Gm-Message-State: AOJu0Ywvrotzjih5UZqKYQjI43ZzeG7jqdswgZn1ooA5HCWuoGdFxZ5w
        NmXtmC86hdFTbMGWIl78A1Bb3hWMpsdQ8g==
X-Google-Smtp-Source: AGHT+IE6oqzoQc8oVEVMmOd93VeBI3KlUE7iAr688vm1DmxxBqvRO127zvnRQ0P18tEmO39rpL6mow==
X-Received: by 2002:a0c:e046:0:b0:649:cbd0:8127 with SMTP id y6-20020a0ce046000000b00649cbd08127mr1964219qvk.57.1692265114886;
        Thu, 17 Aug 2023 02:38:34 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id z11-20020a0cf24b000000b0063d643643b0sm5535820qvl.38.2023.08.17.02.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 02:38:34 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76754b9eac0so502903485a.0;
        Thu, 17 Aug 2023 02:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2908:b0:76c:b3cb:a7f0 with SMTP id
 m8-20020a05620a290800b0076cb3cba7f0mr5675858qkp.20.1692265114497; Thu, 17 Aug
 2023 02:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230802091920.3270703-1-yangyingliang@huawei.com>
In-Reply-To: <20230802091920.3270703-1-yangyingliang@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 11:38:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj1PQvZV7=u5Pk-=VwPim1vxvtGqZRtshEwACqhBUoqw@mail.gmail.com>
Message-ID: <CAMuHMdXj1PQvZV7=u5Pk-=VwPim1vxvtGqZRtshEwACqhBUoqw@mail.gmail.com>
Subject: Re: [PATCH -next] clk: renesas: r9a06g032: use for_each_compatible_node()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, magnus.damm@gmail.com
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

On Wed, Aug 2, 2023 at 11:22 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
> Use for_each_compatible_node() instead of open-coding it.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
