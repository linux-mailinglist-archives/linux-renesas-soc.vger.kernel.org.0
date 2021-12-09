Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7146EA88
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Dec 2021 16:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239140AbhLIPG5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Dec 2021 10:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239153AbhLIPGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 10:06:50 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADE7C061353
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Dec 2021 07:03:16 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u17so10217316wrt.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Dec 2021 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DceIKBZdPfWWzEFspshwq/4AFcE8dKQFPMvGqy4h/Bo=;
        b=VfAKC5JSeTF8Ez8AZKvX4Oo3uelD+ija3DgYdTLltbQiXXSYaNCTw1T56ixnwxNuwp
         cMBQ3coAIcTKM69H8pTLrhDtTajoXhvosYQ+oDfJ4dSeMNxsAfYloKkA8boeAoaRil8f
         cPwNfAwwQcH16t4+St+HYwdRmbJGGpiXzajkLtizsv3MWb9tTUENHIsuIhtMFZDM+ar2
         HZWmPR/cx+myM3qZ5I17OhAUDkqFKxdyCzmVuwPhd6D4IHaNlaRdRzfotEW7LBFI7grc
         bK1Qoogt85nzeVPJAkH3XQGQ6GAd2ugUA9A5OxtYtVnZyRQ5eHHcA17355MM/4mAHoBn
         XXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DceIKBZdPfWWzEFspshwq/4AFcE8dKQFPMvGqy4h/Bo=;
        b=hgAkstb6bPO/HaCuMfZZGdqYEvxW4jhNXFh2rJwX4fuBvGRwteGcGgDdwlMeScO6Ic
         e3lq6EsPFve3tXRoPMLI1Qh6h4UHtNX1OHLzNV3mxhGR5MqDwGzfXFR9CxUNeOQpPGGm
         HaN9Iv5WZw3L3++O3ECesKnToQblVa+7yLak6ShvbjUfjyS5wJbxNm7kk55xcac+4udf
         V5sEe2NFbhj0n3Y0zuTtRmLMdSs4edcrLlMafIyygIi79WibetlFDTpQbPwjSwnuLezw
         lgsPxSNMcAGejksWix2e1A0x9w51se9ptRgU4Y3BSwEdB+Bl+QoSw0+s8LDWa0cvYNGU
         EQ/Q==
X-Gm-Message-State: AOAM532UAEV3wwfVvMU7ZkIr97+j8sJen6z6X+1EZKkdD7Te0At4ibJt
        jJ+dqhw/Gne33pOzus5cvwmaxpV4V1ArdA==
X-Google-Smtp-Source: ABdhPJy1XiTFFujehS1Js8gTZlxNuKCjNd0fWSEy86Yl1IrdvO4noh13q6pm2f9ohGKmzph+quIPcQ==
X-Received: by 2002:adf:aa08:: with SMTP id p8mr7001130wrd.572.1639062194508;
        Thu, 09 Dec 2021 07:03:14 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:7191:566f:2b5:22f1? ([2a01:e34:ed2f:f020:7191:566f:2b5:22f1])
        by smtp.googlemail.com with ESMTPSA id a1sm8261698wri.89.2021.12.09.07.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 07:03:13 -0800 (PST)
Subject: Re: [PATCH v2] thermal/drivers: Add error check for
 reset_control_deassert()
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211208164010.4130-1-biju.das.jz@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4a0ab27a-a5ba-5ad8-5ad7-be883b661b67@linaro.org>
Date:   Thu, 9 Dec 2021 16:03:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208164010.4130-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 08/12/2021 17:40, Biju Das wrote:
> If reset_control_deassert() fails, then we won't be able to access
> the device registers. Therefore check the return code of
> reset_control_deassert() and bail out in case of error.
> 
> While at it replace the parameter "&pdev->dev" -> "dev" in
> devm_reset_control_get_exclusive().
> 
> Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> v1->v2:
>  * removed the cast operation "PTR_ERR(ret)" -> ret
>  * Added Rb tag from Philipp.
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
