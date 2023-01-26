Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B26367C92F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 11:53:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjAZKxY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 05:53:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236762AbjAZKxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 05:53:21 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE166A31D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:53:19 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id n7so1340000wrx.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiJoiEAoy4kZcXpmL3tnw66CBHGYv2JqFPr5rCfnKMM=;
        b=XpAqkggTH73hfcyJsHVpMqZxnY9yTlkxR8ITb64Am8vly3CV3rfnf6r5/FOvKm+FC3
         L3OFhfp07vH/OYjRSaMcQdSTUX0jSCIt04YiIE4L4AvUKLhSn5LNynpiPMJA6KeQX4re
         AsWbFZIXAuOcKfFjHzjUWR+ZrVKvFZPvE4tAxMbNxQF57Qn96AiWC4DDufJf3/4aajbH
         6/BJMpxAem8Txxp1l50V9WReca8pe3N/FW38Mur3L9Rf7UA9Yl4Am3vaejs5CmzW+1le
         P2tGgMyeovkY0Ae/0lqF29gro3cBiQQo8sMQ1vo3q1cZOydFwYLuLe8pyu0Kpi8Z0oWQ
         lZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WiJoiEAoy4kZcXpmL3tnw66CBHGYv2JqFPr5rCfnKMM=;
        b=2+NwtlX91Xja129Zjfw2sOQzZNzpqpcwQI1c/5buznfwI/jEVrl9xW2q1t8uOvGTUP
         uJLcqTj/cwB8FphsyRUwbm1iu8Au7QN2We9oXJ7QZzrGfC3kFlqdlWstoux5RLvcTM5v
         blZTJc6gLtXAoQYWfNoizfTC/WHjseRNRikF7Xw1s6M908b5mMI4i0IaxsyTq+PClks1
         IjXuJ9iLM1dXJgplFn6LCKOpFUGlJ+EtkfwRtTLJni7fd4+o8dKEvT2hrHjuj76MO4yu
         yYX3CjI9o4KAYUrIu9Ataf7+y3j89f5gpD5BQ0LAe7LFaJP/oR3PS4QQl5ueYzW/HjIm
         GPWw==
X-Gm-Message-State: AFqh2ko4gB54eJG2s0/iMdmC8dp3dcBq0MLKYnCyZL0XJvjF9QdkRb4B
        gaXFFkTRpSfyvE5c6C9DXyvezQ==
X-Google-Smtp-Source: AMrXdXtKnNfVVj79k3ISGD2oxywqcJIi+tad2dEy7yBiXhDlMxAFAoaTXBUtMjioknStjnczHaXSHA==
X-Received: by 2002:a5d:5085:0:b0:2be:5402:61e6 with SMTP id a5-20020a5d5085000000b002be540261e6mr19858676wrt.46.1674730398099;
        Thu, 26 Jan 2023 02:53:18 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id h4-20020adfaa84000000b002bfbf4c3f9fsm998853wrc.17.2023.01.26.02.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 02:53:17 -0800 (PST)
Message-ID: <9f722f37-15da-0384-c059-a4af0f1dab10@linaro.org>
Date:   Thu, 26 Jan 2023 11:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v11 2/6] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Lee Jones <lee@kernel.org>
References: <20230113161753.1073706-1-biju.das.jz@bp.renesas.com>
 <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230113161753.1073706-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13/01/2023 17:17, Biju Das wrote:

[ ... ]

> +config RZ_MTU3
> +	bool "Renesas RZ/G2L MTU3a core driver"
> +	select MFD_CORE
> +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> +	help
> +	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
> +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available
> +	  on SoCs from Renesas. The core driver shares the clk and channel
> +	  register access for the other child devices like Counter, PWM,
> +	  Clock Source, and Clock event.

Do you really want to have this option manually selectable? Usually we 
try to avoid that and keep a silent option which is selected by the 
platform config.

[ ... ]

> +
> +	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> +	if (ret < 0)
> +		goto err_assert;
> +
> +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> +					&pdev->dev);
> +
> +err_assert:
> +	reset_control_assert(ddata->rstc);
> +	return ret;
> +}

I'm not sure this driver falls under the clocksource umbrella but under 
mfd [cc'ed Lee Jones]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

