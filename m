Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A677A5481
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Sep 2023 22:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjIRUxx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Sep 2023 16:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjIRUxw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 16:53:52 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1998E;
        Mon, 18 Sep 2023 13:53:47 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-773a5bb6fb6so261530785a.3;
        Mon, 18 Sep 2023 13:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695070426; x=1695675226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bK3tn5dFdIkaJdHv4A/3xeAMl/PHN2x+YLc9iStXbls=;
        b=L5VRhcj6cpf/XbQ4W69VF6M/VgGdG/0wVWdzVZbWfhtm4PdAXCWdvLgM6TLwkxevri
         nYqVxjov6Zkw5SWpUaQD4pBP/B8oirfCCL4o/01gokfvzqkBiIzgXTOTKq10RxpPl7Si
         pCjzUGonF9WK7tRx8dTY0Jr61cdFZAg33mSOrBI4EZ57/RtNhG+TBVmsQYcvuRvAz46z
         UzwQZIz702N86tYfeiJN/6ERUcNMQIlxd07n3V7dCL+8RWU8QmXN08aKSuHpiKlZJ6H2
         HwwXduzpWP/WdPfhnKTVRQpXJltu0cHul+nb5qYCc14BNBx4w2XAKfEN49uzpcJAPvzj
         0K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695070426; x=1695675226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bK3tn5dFdIkaJdHv4A/3xeAMl/PHN2x+YLc9iStXbls=;
        b=Wn3N7c1KCcomd84GnOlN7dPh8EqTw8UJf7q5iGIFOylKieiMchcUurpmrLKjao/pff
         Z+nsWLBqjxi5r9K+o8h5asnp9nbTwIIYVxzu9qzwDNHsFrK19um9DMYqNkJ2v77qfOdr
         SdriPP0b7DsApXzqrQ6rFb1VbagzNYwU6jWeC3wicfqZpEvH07I4GDnqFkAe/mohdkf2
         8FyYtb7g9hS0crNP32iOkrphUB+ybT4NIeJZBp2nq56rH2qEbElgXy2JbxN035Ft5Lc/
         VbET4sXPO5s6LusoUiLPK3mKBCsL0JIO2leLuKR02t9zut8PgDNHtuybLAIuuuANdwXV
         ZsXg==
X-Gm-Message-State: AOJu0Yy5ZV1ZYQBNDzVDj3mmlC3Wt/PYjJr3wStFFsgztCMZCsPOM43u
        tb6ru+p1gJxA0PVzKKIo0DA=
X-Google-Smtp-Source: AGHT+IFuG/RCWYnEGB2whgbEH5EazCMJ7h08Y7AAH6D+y3PeJONiu3YP0L2V+kcbEeFRyLayS4Iiqg==
X-Received: by 2002:a0c:f24f:0:b0:658:1ca4:97f7 with SMTP id z15-20020a0cf24f000000b006581ca497f7mr3647510qvl.34.1695070426331;
        Mon, 18 Sep 2023 13:53:46 -0700 (PDT)
Received: from [10.67.49.139] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id l2-20020a0cac02000000b00655e428604esm3767700qvb.137.2023.09.18.13.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 13:53:45 -0700 (PDT)
Message-ID: <5b8a126e-2eb3-a0cf-9b68-e9b7b9481cec@gmail.com>
Date:   Mon, 18 Sep 2023 13:53:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH net-next 8/9] net: dsa: rzn1_a5psw: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        kernel@pengutronix.de
References: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
 <20230918191916.1299418-9-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230918191916.1299418-9-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/18/23 12:19, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

