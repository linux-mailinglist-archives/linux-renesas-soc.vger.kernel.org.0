Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECDB6EA5EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 10:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjDUIew (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 04:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjDUIev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 04:34:51 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705EA7DA8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 01:34:49 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94a342f15e4so183860166b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682066088; x=1684658088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JLrpYppJRBZnm4293v5qlzP26kcaV844cal3A2By+/4=;
        b=WmqsnnE8cSF2LkSO+3yYmUeQvDPnjfEkEtmHmzbkHE+ri/yyS8It/xq4CIUR4TIWJI
         wH6tIJj8gQtF4wbhYMvcOIxjYo4nn7wLPYH5brs7giYUZ5dEe1Dy8BsQsyebLYm4dCLR
         WrBwwC8YNVvp0WNn+v2PsRS4j1TylV3Ban+2ek5vmN+Efo5GqtqGvoybxLX8C9eUn1PW
         GTv44XBbEaVO5UE1e7AUR2eb4xvp+/e1eCyU3dd7K937TamRC8Ys2bwTJIbuwCU2c8Jf
         Z2+bhW0FGGf295VyBxnt8F1k+48pznYHl3VMOeTAnp7etg7gRfwEP6GjLD2QKtxJ+Het
         atOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682066088; x=1684658088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLrpYppJRBZnm4293v5qlzP26kcaV844cal3A2By+/4=;
        b=j4UgEHvSculiQMnvcu4YH8UZHi+YxIwxFNBBOZPiT02TP0Jig8BWnSlRgSjSeqsxUH
         8DWOY/SSGsbDRtP+ZV/KuwJkRSOW04GKdNc505lLM6wYDzdQiiJeI+JNKvSv6BXDIlyY
         FWrhbMZsD4PPfwP514Gvg2Q252TYdYmzDQZjmuCSlwZqGoyV8MDzEKGRZoLbM7lr7jsj
         4OmJPphIwxoQicL+nxzAWobxmIUO2I9DH4W29gfSJYOTvy3+QbxmoPjq0skm0en8o+Ln
         Oo7acEFljq7u4Nq0XLd4gHaemcfRxlLSO7o8EBvthIBfPSF6QiLbCLJAE2/psDYoyFWV
         LuKA==
X-Gm-Message-State: AAQBX9fofDfKSBl84sKgHe4yp05BNcS+ettSdXF/Aqmp2Yl4um7v1xEA
        Macw6P72UKFL2hSkGnKxuFzvXg==
X-Google-Smtp-Source: AKy350ZWzTa+6dzxFcNGIlO21Ew9EETMq6dUqln7SS4w2bvqzBSO/XL24kivsmI/kDkUJ6hAtEBFzA==
X-Received: by 2002:a17:907:a809:b0:94e:68a5:b7b8 with SMTP id vo9-20020a170907a80900b0094e68a5b7b8mr1506381ejc.76.1682066087953;
        Fri, 21 Apr 2023 01:34:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:668b:1e57:3caa:4d06? ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
        by smtp.gmail.com with ESMTPSA id de23-20020a1709069bd700b0094f02ebedf5sm1763209ejc.64.2023.04.21.01.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 01:34:47 -0700 (PDT)
Message-ID: <7492e42e-c8c4-7222-d990-d6ed5b894625@linaro.org>
Date:   Fri, 21 Apr 2023 10:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4] memory: renesas-rpc-if: Fix PHYCNT.STRTIM setting
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Cong Dang <cong.dang.xn@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        linux-kernel@vger.kernel.org
References: <20230419130234.44321-1-wsa+renesas@sang-engineering.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230419130234.44321-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/04/2023 15:02, Wolfram Sang wrote:
> According to the datasheets, the Strobe Timing Adjustment bit (STRTIM)
> setting is different on R-Car SoCs, i.e.
> 
> R-Car M3 ES1.*  : STRTIM[2:0] is set to 0x6
> other R-Car Gen3: STRTIM[2:0] is set to 0x7
> other R-Car Gen4: STRTIM[3:0] is set to 0xf
> 
> To fix this issue, a DT match data was added to specify the setting
> for special use cases.
> 
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Hai Pham  <hai.pham.ud@renesas.com>
> [wsa: rebased, restructured, added Gen4 support]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Change since v3:
> * rebased to latest changes in the driver
> 
> The previous version was already reviewed by Geert and tested by
> Prabhakar. Since the rebase for v4 was not super trivial, I decided to
> drop the tags. It would be great if you could have another look. Thank
> you already. Happy hacking!

Thank you for the patch.
It is too late in the cycle for me to pick it up. I will take it after
the merge window.


Best regards,
Krzysztof

