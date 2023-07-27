Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33D6F765C2B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 21:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjG0Teb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 15:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjG0Tea (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 15:34:30 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387AF2D68;
        Thu, 27 Jul 2023 12:34:29 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-583b4522927so13471477b3.3;
        Thu, 27 Jul 2023 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690486468; x=1691091268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ouXSBMQ9XfaLV2cnC7CmnxUEXunSTe45cPHPFLrssE=;
        b=e+h0P3t0tiLM4TQ9WkOu/zX32eqePLew4QUhh9kMmcahKWUp7a5c2Ucw88nFQS7IcJ
         u04w56Ie1jCm3tImJbvnZS5WZN24v15xxvnNUZVA2ZvIdqsNZEH1yV8vCYlrEDKOcPwW
         0dyiL7D1kB41X1BPmE3R2vQGcJ3hqS4KcKWkj2mQWJUwSovtgDfEEo2h+nR7kMFHBTbY
         4hTpdBHNpa4SofI2N2K86QCjOyR3E+vW5jhVCwANrqqJc3xm/A7a+zebvtq21TTxY+Ng
         4YJIj1itwP6pfxfACNV+6FB1Sop+D72C1uW+zm/bgUDJcU1VptK2NpPmubhKOtPQwCN2
         F1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690486468; x=1691091268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ouXSBMQ9XfaLV2cnC7CmnxUEXunSTe45cPHPFLrssE=;
        b=O5JBF7MygVOUhQjhq+grqkON3W6NnDQ2e4B5FF2CS3XlwPRiiP8bxn5Ahd8nn/noKP
         sBAqgTRi3U2JBHbPtlmg4+cg+/JFrj8EMd8gAaGWX6x87SWK3PRAoLZk/k1TPFmtaaCx
         GVZHooE1Akp7tdt0xm8sLE7s3cw2cSI52DBnmQmCtrkV8loODM1rWPBJIhRR89zlU4Zu
         +4AN/ncOf65LIzx4cbiB5P0wlfXI7B+bzCvQD4O0C3sNxnZYcpJkmgDsrjCJnc6cvruH
         KU8433Om7J47iRyRQSv+WB1eJKUhG0hLt9FY51e/kJATYq58xSNEC/OSreMkSkZ2ZFmx
         ei0w==
X-Gm-Message-State: ABy/qLYUY5y7umwCLILqq2zL19LTRw/pt7hzzqXz9qHN76y0EKVyocmE
        hjwGIov1QoYLB+WgsJ6DWh2sy4U3bqk=
X-Google-Smtp-Source: APBJJlGjhlH7e8kuTfMlW0HThaV2fCO9UO1OC1agKXfUHVi1LaW3X4KwB06kniTbwRJCM1OsJHXqJg==
X-Received: by 2002:a0d:ef07:0:b0:577:a46:26e5 with SMTP id y7-20020a0def07000000b005770a4626e5mr225020ywe.31.1690486468410;
        Thu, 27 Jul 2023 12:34:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:a5e9:8d43:2f62:e7bb? ([2600:1700:2442:6db0:a5e9:8d43:2f62:e7bb])
        by smtp.gmail.com with ESMTPSA id i145-20020a819197000000b005844ae2bfa3sm529271ywg.95.2023.07.27.12.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 12:34:27 -0700 (PDT)
Message-ID: <459984f5-9375-3faf-527c-1b8626fd0604@gmail.com>
Date:   Thu, 27 Jul 2023 14:34:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 00/13] of: overlay/unittest: Miscellaneous fixes and
 improvements
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1689776064.git.geert+renesas@glider.be>
 <20230720183752.GB2939849-robh@kernel.org>
From:   Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <20230720183752.GB2939849-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/20/23 13:37, Rob Herring wrote:
> On Wed, Jul 19, 2023 at 05:00:00PM +0200, Geert Uytterhoeven wrote:
>> 	Hi all,
>>
>> This patch series contains miscellaneous fixes and improvements for
>> dynamic DT overlays and the related unit tests.
>>
>> The first two patches are fixes for a lock-up and a crash.
>> The remaining patches are smaller fixes, enhancements and cleanups for
>> the overlay tests, including one new test.
>>
>> I ran into the crash when accidentally loading the wrong overlay (using
>> the out-of-tree DT overlay configfs[1]), and removing it afterwards.
>> As this case was not yet covered by the unittests, I added a test.
>> I enhanced the tests to clean up partial state after a failed
>> overlay apply attempt, which triggered the lock-up.
>>
>> Thanks for your comments!
> 
> Other than my comments all looks good to me. Of course, I treat code 
> deletions, documentation additions, and test additions the same: 
> automatic acceptance. ;)
> 
> I'll give it a bit more time in case Frank has comments.

Thanks Rob, but no need to wait for me as I'm easing out of devicetree.

-Frank

> 
> Rob

