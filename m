Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA59500793
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 09:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240333AbiDNHyY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 03:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240444AbiDNHyW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 03:54:22 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64A8377E4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 00:51:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id c6so5277783edn.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4kA3CM2rqbmneB8L2UH1I3TcMQuTf5ivjchAoMqbX7U=;
        b=x3EmNIl39+e060P3gumsTLBwQ/dYp5pzbB8c9v6xqbd9tPLnuQwxOwOpuCx/0b9HRg
         XDYlj9eut824d9ZK2O1rXfgSacT517UotlzV6646kvrpdm9RbBzMokpzEL3kxZ3/kSIs
         Ko/yz6scKpqOVk9BuV5YoHTBhAAV/r+MpzIBhlMa5nP09ao8C2k/dV5iT6P++V734EYQ
         eoNwqRnF/6o5j8VQkL0Y/O61t0s27qvT4wJQ2XRhvqEdDAeQy+PkTqxC0icPgIhNnua1
         6blTx/E1YKCHJd89Az7mazOLDQq/ECeuTs+7xPcLhe6WaSHolaHJeeRim3vD/b/AyyT8
         Ce5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4kA3CM2rqbmneB8L2UH1I3TcMQuTf5ivjchAoMqbX7U=;
        b=fbeaPo12j7j+jZuTAU3PFN1Smjr+xd1sXkOe06dwgnjJ3N/l6KAfzMpiryZlH/s/vZ
         0tExGbL0y1Xtq72RhneuwAlLu3JF7G6vgl5/RRcd8Ghfwb24eSsMgSp68Wk49qsmnREr
         YIh+vpIOmJGpMdxCVOvFyumE29Vp7scT/tysVFWtw9BHs83mdZULIs2r6Cj+Jc1C+5rk
         PztZSzh9cgRKXIGURtD5RepvWwL3v0itx+U6dUTOUPUAwD9kOYfJJEchF1vmgeA0orUv
         MwduyaOfstYrnrIHOW0JbSciBxr466fwXboxB1VPWSbYIVNb7Z5/mscxAbtmizVNSNpA
         RlHw==
X-Gm-Message-State: AOAM533Vi346IMItKilACoieYnPGDXyfBEma2ZyQCMUnRKB2zLLXd+Bn
        IaaHAzEXuCDFfEerECCKYCEo6A==
X-Google-Smtp-Source: ABdhPJyQHEbyUkRlPGNxcTF+ftkjVPdnxvbiROEmFI7FfJTEOfPhnkdz2kLA7/nMBMeanSfXPrNSnw==
X-Received: by 2002:a05:6402:128f:b0:41d:7e85:8421 with SMTP id w15-20020a056402128f00b0041d7e858421mr1616661edv.352.1649922717401;
        Thu, 14 Apr 2022 00:51:57 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id lg4-20020a170906f88400b006e869103240sm378635ejb.131.2022.04.14.00.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:51:57 -0700 (PDT)
Message-ID: <61be2078-1b3a-4049-6b14-5947ea64cf33@linaro.org>
Date:   Thu, 14 Apr 2022 09:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/7] dt-bindings: ufs: Document Renesas R-Car UFS host
 controller
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20220414023115.4190736-1-yoshihiro.shimoda.uh@renesas.com>
 <20220414023115.4190736-2-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220414023115.4190736-2-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/04/2022 04:31, Yoshihiro Shimoda wrote:
> Document Renesas R-Car UFS host controller for R-Car S4-8 (r8a779f0).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  .../devicetree/bindings/ufs/renesas,ufs.yaml  | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/renesas,ufs.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
