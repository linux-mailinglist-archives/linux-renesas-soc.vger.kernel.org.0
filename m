Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531C9693E2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 07:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjBMGXg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 01:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBMGXf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 01:23:35 -0500
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C78D83EE;
        Sun, 12 Feb 2023 22:23:35 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id sb24so5282920ejb.8;
        Sun, 12 Feb 2023 22:23:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etO7zNhs1y3Ex+7SYL1zuWkSbFOhkcZs2U63e4WpFqs=;
        b=1K3hS1Uc29YB4EHUeAnKdppOGzccO3FB9YbI1WkExGePOGj7Mz5G0HmyqB3EXinofn
         KfAuPzgNglYN1ANrXHxdbRaROAv57+WZ7D51l2VyXW3pAoLZDTM8xCSGkFcqE2wA1Fl0
         CyI/ZWlWnS1yVP8jpfgefE0lEdSdN3GLS2bIGVte9smCSgEylpczYTlMhj2avxX0g7k6
         Dyk3qYmEGjznp/5WbTDolYv1U1rS+ue+hMj3FSPtLBrHjoze7LpgxduPxBzf42Z9iXUj
         0AiNIJ0eN0jMul++hM2cZjsbcs7sieW6bL5G5tOLzba4yd9knlvTbNJ5M6ueKKMriA1a
         /HRw==
X-Gm-Message-State: AO0yUKW5nwqXug4ud6sy+YQDVL/4VJ3Hb7IfBfb/sDzcxOLcavJqcbq/
        vfSDequO6WLCmTPplEsbKGMK9jEAneI=
X-Google-Smtp-Source: AK7set91wBi6+6m2VKAmOJfZpYjzHfGzpPQbLjirUlMEBLoMdOLnED7I6oSTszXNs5+ue9m/gpwbSQ==
X-Received: by 2002:a17:907:c29a:b0:8aa:c155:9233 with SMTP id tk26-20020a170907c29a00b008aac1559233mr18683641ejc.26.1676269413530;
        Sun, 12 Feb 2023 22:23:33 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id u10-20020a170906108a00b008a9e37ca37fsm6340729eju.166.2023.02.12.22.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 22:23:32 -0800 (PST)
Message-ID: <81328241-670f-8a7a-256c-03919f1a3f67@kernel.org>
Date:   Mon, 13 Feb 2023 07:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/3] serial: 8250_em: Use dev_err_probe()
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-2-biju.das.jz@bp.renesas.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230210203439.174913-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10. 02. 23, 21:34, Biju Das wrote:
> This patch simplifies probe() function by using dev_err_probe()
> instead of dev_err in probe().
> 
> While at it, remove the unused header file slab.h and added a
> local variable 'dev' to replace '&pdev->dev' in probe().
> 
> Also replace devm_clk_get->devm_clk_get_enabled and updated the
> clk handling in probe() and remove().

Sorry, this "While at it" and "Also" is not allowed in a single patch. 
You do three completely distinct things in a single patch. Please 
separate (like prints+&dev, slab.h, and clk changes).

And pretty please, don't send 3 (!) versions a day. Wait a week or so 
for reviews of a single version. No need to haste.

thanks,
-- 
js
suse labs

