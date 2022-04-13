Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105C74FEFC8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 08:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbiDMG3b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 02:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbiDMG33 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 02:29:29 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E4A5FBF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 23:27:08 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id r13so1862001ejd.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Apr 2022 23:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/r3mT06Ib0iS2GFYXsKpaMewiowDgPKKZ6ID5tBYoLY=;
        b=eYWRaNUCswViJKR7KfIkCVUxCELXj/78KjmSKC5fe9ZvQOJKL0hR/lGqrpg34njTWk
         Nok5tHTv2Cma7RY/GB+uy7L6wykBRf6C5qMFStw2HXfgzx5unc4eSsL34e+DjxFx/zF+
         RlZA21b5vNMcwocu1oq6YO6QBo97Jf5gP0BY48P8jKe1uFGiMjne5/GRJOepfgiuzUrc
         Rd2htUQ19EJPUlIPGGwOEhM3+tJPdI6FZYPjpVPPWc0pHZr2sJRhmnnOVQdwThtSkS45
         aKhhviGAPbX9ZTGLCu90vtKjWsB1Q0vk7mJn1DKu8Rq80BMGH3AzzBpe9+/VS63QaeVb
         8E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/r3mT06Ib0iS2GFYXsKpaMewiowDgPKKZ6ID5tBYoLY=;
        b=uN125fuaBOgzwvLfwFNaTNigj0A50wCsqlfDsj0KPARbJ+8G8UWFlM1IGbMPqxmro9
         5WVDfuKYG3100wSb/0GqAKguyifUK1FttQcIH0yU47fNdOnJ3DKuDrZIOBjCYfMOEegS
         77ixqaXYR6iMDKGxTdH2ls1TtWpM9xLhvCMYfiJO8j0k3k0ypwhblPejJKNYuk6kODx/
         wKK1pmYet4kWGI+/uPisackjUkUFlgMSegcS/99OUdbkpUBHSekFIiprTn16gJHo6GiH
         Ub7zUVbCXtAAwlakVu0d5CQKa65pto/nCpLZIHar+DzMSBLAdzwX7Q+IutSWFXLfXe5b
         2pDQ==
X-Gm-Message-State: AOAM532BnIS7oVvfJQiNUDEbV1BKQN0kpFW0F2nf7kCIXzDVu7fK5FlM
        iDi6b0CqXBX+7DxPT6w0btH3zA==
X-Google-Smtp-Source: ABdhPJwsNHto5y5oS5z3KbHE+spZevz9lmKpJlXpSffcGVFfHIkJR6RLuG/yrzwVppKIMp2voa0vMQ==
X-Received: by 2002:a17:906:32d8:b0:6ce:d850:f79 with SMTP id k24-20020a17090632d800b006ced8500f79mr36460884ejk.414.1649831227300;
        Tue, 12 Apr 2022 23:27:07 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090624c500b006cee6661b6esm13953547ejb.10.2022.04.12.23.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 23:27:06 -0700 (PDT)
Message-ID: <1fccb130-2807-4376-a1d4-db1d44e6a7ef@linaro.org>
Date:   Wed, 13 Apr 2022 08:27:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc:     "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <20220412073647.3808493-7-yoshihiro.shimoda.uh@renesas.com>
 <b189e6fc-98b5-9668-d22c-1144d5741071@linaro.org>
 <TYBPR01MB534192EDF0C76F77A797187AD8EC9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYBPR01MB534192EDF0C76F77A797187AD8EC9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
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

On 13/04/2022 02:09, Yoshihiro Shimoda wrote:
>>> +		ufs: scsi@e6860000 {
>>
>> Node name: ufs (it is not a SCSI device, AFAIK).
> 
> I got it. I'll fix it.
> (I had assumed that we should choose a node name from "2.2.2 Generic Names
>  Recommendation" of the ePAPR v1.1 [1]. But, that's wrong. )
> 
> [1]
> https://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf

These are examples and at the time written, I am not sure if UFS was
considered. :) "ufs" is name of a standard, so it is a generic name.

Best regards,
Krzysztof
