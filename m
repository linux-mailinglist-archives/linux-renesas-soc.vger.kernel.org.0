Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E894FDC6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379586AbiDLK0Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 06:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379267AbiDLKTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 06:19:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6424C5581
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 02:19:20 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b24so21555371edu.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yhcCIU7DE0IB/Ct8ayO2BJ1LjRabGTwtnXdW2NhwWWs=;
        b=PqvgzdPye1JbNnLeS1ndUKeSzvbTLzf9u9jwRQH0yehgVdfIkSzT7BwhC2AR5ExPmP
         eCMjwBjZh2zZ5eZs3r636bK1nLu40Tw7E29QrLn3hXAQ3Jpr5oQWmLR6rc0VWcuOVmYe
         r7Q0HCLTHBwIs5BNVVZF9kTIGyrtXyv19bvIRcq3LvsKTEiKzj3sfz70qpvXd9sKmo6W
         aKkb46tkUtNG8u/jlLg7GWDrD09xjD7QSyppdidKPT0nYoRFl97qjCkYrop6zfFynDMA
         oEbyqs6NhmqDv5lJO5Jlxr7lvrHlqkPUcwXTzcG+S4nRahwFc3aZNmwDHZqyWPbi2kwB
         HtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yhcCIU7DE0IB/Ct8ayO2BJ1LjRabGTwtnXdW2NhwWWs=;
        b=jx2az6SiWv2XA2jav3aSnLYGCepTQ8kTLhD7YN7GxMhLUqRygeZrhyOFd+puH71yUp
         GP77G3JwiXRnvUmk0pzlGWrvqS185+Z2SXUSaeOlH3Gl04WetFBYZxTHWOFcWzCh+CEQ
         EbgJm7LJAlFrfWrF0Vshw8ua+bjH1c9I7M6835Gma0+ohFMjY0CcyQyzqijZZf0UmHpx
         96jymdreGFQ7dUdGyGRgEwOBSNTmFZYjd70+Ywg5q2YjXtr6kLmVF29ILsxMBNCo1llV
         TbQ/Uh26oSl1UzYS0l1j+EXG/eu54srKD3cX8Ts86oE3LutjKUA27neGe+9mR4HLNq3I
         3rog==
X-Gm-Message-State: AOAM5321ZGltCgFLo3U6XUuOTMEb8jaOQlQd2d/wU2/IouxJTIvj2hjT
        zP8RemdRgCXMjhabUnYOkstvdg==
X-Google-Smtp-Source: ABdhPJw1v8JMNT1scRtq0kc3RAYfJiEEHavJfzGTaArPpMPFy0ixcqU47BTStrD9lgTAaYHgpm5IJA==
X-Received: by 2002:a50:a6d4:0:b0:41d:77aa:d876 with SMTP id f20-20020a50a6d4000000b0041d77aad876mr11619054edc.48.1649755158995;
        Tue, 12 Apr 2022 02:19:18 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id d7-20020a50cd47000000b004187eacb4d6sm16718423edj.37.2022.04.12.02.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:19:18 -0700 (PDT)
Message-ID: <23baab5b-722e-bdcd-be2c-62e38b2ff6a5@linaro.org>
Date:   Tue, 12 Apr 2022 11:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/7] treewide: scsi: ufs: Add support for Renesas R-Car
 UFS controller
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/04/2022 09:36, Yoshihiro Shimoda wrote:
> This patch series adds support Renesas R-Car S4-8 UFS controller.
> This controller has some restrictions so adds some quirks for it.
> Before using this driver, we have to initialize a clock generator
> on the environment board (named "Spider") by using the commands of
> U-Boot like below:
>  => i2c dev 0
>  => i2c mw 0x6c 0x26 0x05
>  => i2c olen 0x6c 2
>  => i2c mw 0x6c 0x26c 0x2e
> 
> To use the UFS controller, we need the following patch too:
> https://lore.kernel.org/all/20220411124932.3765571-1-yoshihiro.shimoda.uh@renesas.com/
> 

Thanks for the patches. Somehow I did not got entire set (bindings
missing) and I cannot find any of them on lore.kernel.org. Did you have
some bounces or sending troubles?

Best regards,
Krzysztof
