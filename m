Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B81378A6BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 09:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjH1Hpt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 03:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjH1Hpd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 03:45:33 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F25F3;
        Mon, 28 Aug 2023 00:45:30 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5921a962adfso34346837b3.1;
        Mon, 28 Aug 2023 00:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693208729; x=1693813529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omFQ1a+8ec2563b9X8NA9taUjJt9oDMi0qwccvgcoAQ=;
        b=DWPejEPapUP7wvF/19dCRCSquBxnT4op1b9GX1k5EoogvxWp+YOuWx+6QosewVRWAd
         s9pGZxTYRFVU1fLSi1TTtVv3FeS0wtTvm63SHqv5/aL5dw23W2dw5hyLroaYEkjkd1eJ
         wo8cfksgMswI/bgmAdif2SocBR2w96eWpdavku1q+v/0lbKUQgXfPkbbRwSgOR2Uwax2
         Rb//OG+n4XQFZDEep+OVUoM3VpSDCCT/w/HrwCCAl11WPXYuHjmNCJoOffVoqWa+GVzO
         NyZZLrlAxbkQAO7ARPjUxAy+K4/NCoMAhvzKV2SZ0LCaRJ5PfQXrt1yMmcs0LCiL7l9t
         eSfQ==
X-Gm-Message-State: AOJu0Ywv20+nCwW3eV8IH7Xd4NWiI7At3qUXRqJcFXGfO7Z9Tl8U9oip
        4xE3+uVgqKCBsSufbgxgnyp62uy9wNkBUA==
X-Google-Smtp-Source: AGHT+IFyxiPaWKituSdp+HInlri+9crUV/qdsYYGdtSxti068XTPV7tpfyhqTdPwIxzFP5fboh0vnw==
X-Received: by 2002:a81:99d2:0:b0:592:9035:8356 with SMTP id q201-20020a8199d2000000b0059290358356mr9797783ywg.26.1693208729479;
        Mon, 28 Aug 2023 00:45:29 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id gz2-20020a05690c470200b0059511008958sm765773ywb.76.2023.08.28.00.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 00:45:28 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58d31f142eeso34591057b3.0;
        Mon, 28 Aug 2023 00:45:28 -0700 (PDT)
X-Received: by 2002:a25:d78c:0:b0:d73:e979:d5c8 with SMTP id
 o134-20020a25d78c000000b00d73e979d5c8mr25921990ybg.34.1693208728597; Mon, 28
 Aug 2023 00:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com> <20230825205345.632792-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230825205345.632792-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Aug 2023 09:45:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWESYVB2UXAHrKuBNway2zDzm-D-7rX8bz0OESAACK+OA@mail.gmail.com>
Message-ID: <CAMuHMdWESYVB2UXAHrKuBNway2zDzm-D-7rX8bz0OESAACK+OA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hwmon: tmp513: Simplify tmp51x_read_properties()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Aug 25, 2023 at 10:54 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Simplify tmp51x_read_properties() by replacing 'nfactor' ->'data->nfactor'
> in device_property_read_u32_array() and drop the local variable as it is
> unused.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/hwmon/tmp513.c
> +++ b/drivers/hwmon/tmp513.c
> @@ -680,10 +679,8 @@ static int tmp51x_read_properties(struct device *dev, struct tmp51x_data *data)
>         if (ret < 0)
>                 return ret;
>
> -       ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
> -                                           data->max_channels - 1);
> -       if (ret >= 0)
> -               memcpy(data->nfactor, nfactor, data->max_channels - 1);
> +       device_property_read_u32_array(dev, "ti,nfactor", data->nfactor,
> +                                      data->max_channels - 1);

My first thought was that this could cause a small change in behavior.
However, the comments for of_property_read_u32_array() and
of_property_read_variable_u32_array() state:

 * The out_values is modified only if a valid u32 value can be decoded.

and the implementation behaves that way.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
