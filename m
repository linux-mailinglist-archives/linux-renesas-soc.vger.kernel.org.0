Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E781575691
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jul 2022 22:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240542AbiGNUsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jul 2022 16:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiGNUsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jul 2022 16:48:12 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6626D54E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jul 2022 13:48:11 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id b12so1593201ilh.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jul 2022 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uQy/2ot6jk8ItOxruR7MYpbiBmcSneiVOpTfpIP/4Vg=;
        b=NDhsQOqIVtkTO8KKEKShcxUmo19SmDyguUXGeUBq1N8zfnxEbt6/P73mEBZO/0QqTo
         7NTaanMBS8pOhxXYtfXyNKXVcppSVkCtZLoiscTMoR+2iEtTtN0+IXMdLKvXH3BQM61a
         oFTxSslrNsDW0BmQJKiFt9ODwa7+RKgYH/Yd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uQy/2ot6jk8ItOxruR7MYpbiBmcSneiVOpTfpIP/4Vg=;
        b=NWCldritjCOS5jhaAcbIED7a5CmOzxX/SWo0A4ZC652yde7qyDbWDyINMXAitzzLfG
         m43RQgTllU3FeE7+Fp0aPO5AiivUci9xCjBsafRXkIm5/liss3ygDXLnIqMmiknTG+8c
         ZPheCClXbyEI2P76PDEY2Pl6sEppvRjNZs8/m+yLpQxKnc5H3FypTPihLKyx0hudrvqy
         ArzGbHnqhtbCSaBvOO4+pv91PAv1P043OqMR5is6379L2pHkb0sg7TWn0XsSD4rNHegC
         epDs1/mYtCqGDjLk/ISTT6NXN/4tVb9jeUZhh1fEsGzmVIOLo+AjNmx6JtjaGzD+cF5V
         HYYw==
X-Gm-Message-State: AJIora8AFSLm2xBDLeyeKmgzpFOhNg+J6kcOE/62t8/KxY4nQgaQZGM5
        00cowcUXGuZriO/DI8j/J6gXVdzK8pnpng==
X-Google-Smtp-Source: AGRyM1upTNUmPJnrQYUi7ROJy/rLrnWkgEXy2DQojINP9ojm45Tia9BKqLanbQ4x7/eb4PDyjmH+xA==
X-Received: by 2002:a05:6e02:11a2:b0:2dc:3cef:d430 with SMTP id 2-20020a056e0211a200b002dc3cefd430mr5536322ilj.279.1657831690873;
        Thu, 14 Jul 2022 13:48:10 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id g16-20020a926b10000000b002dc1f1a7cc2sm983321ilc.31.2022.07.14.13.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 13:48:10 -0700 (PDT)
Subject: Re: [PATCH v2] selftests: timers: clocksource-switch: add 'runtime'
 command line parameter
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220714185721.48125-1-wsa+renesas@sang-engineering.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4f65df4d-ee70-f08c-3385-ab09a65a47a8@linuxfoundation.org>
Date:   Thu, 14 Jul 2022 14:48:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220714185721.48125-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/14/22 12:57 PM, Wolfram Sang wrote:
> So the user can decide how long the test should run.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: John Stultz <jstultz@google.com>
> ---
> 
> Change since V1:
> * added the new parameter to the help printout
> 
>

Applied to linux-kselftest next for 5.20-rc1 with the rest of
v1 patches in this series.

thanks,
-- Shuah
