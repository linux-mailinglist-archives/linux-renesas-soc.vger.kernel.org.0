Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D9B333BDE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 13:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCJL72 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 06:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhCJL66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 06:58:58 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D32EC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 03:58:58 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l12so22981410wry.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 03:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rUrQmd7md0y2mnEITUOs43I8wXuqCA0VPutH0poYyPg=;
        b=IYUUsfTVeuYlEeAwGRPh1HPNnomx5Z0yp13XyvsNjHS+Pc6q0FmOjKM8llQpeetgzg
         FRrUHxjIyXZ3Y+9GC7buCMjxeolAtA9Ds2+oLD9J7vM7kkTAjH9nENTDnOFWL3haXL5j
         Gff97KCjB6/5XXo/rH74rP7t7f0xqoEKbxEUOhVsp6T5K/vW9kGm8/9KrwB/kOr6AWIg
         vXs9VnkJIr3DUptCXoLLJhYJleYIXGXlO2KbXpi3AA5MaYlpKUXxH348fr0CMd4caUjp
         Gs84xPkO0kag1iOqV7T56LyImDWmjMcBjg/XtkMNZVyMgya5woXQCn75sFXyZ/3zevZI
         +W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rUrQmd7md0y2mnEITUOs43I8wXuqCA0VPutH0poYyPg=;
        b=gYZao4A88HYVoCum5fa4181gwckuQXsbJ5tfGgeDry1ttlU4ptKfT8ZwZMtYUkT8Th
         9UPKzVJRN1i9istLVjeQ+8GCUT3TXbqpQLSYi0CdOwRpJ4zhGxQHZvy5aV4+pjzlKkA3
         kMjHDl5g1donY4ie+4kg5R4yZ3LxTttTeBa4v1ge+MXP6YmiENIuYQaZqqRMLl29y9Th
         9onkTgZolEA7Ri7+VH303kGoiiH5JvaUR8o/ZUIMD4Ye7kvU7dtyGFJrwfD4zkL01xGX
         B5TDWzEaS8rDOcvWTidMN3cp9Hxz6Xsu/BwKX8bo6DjcXQOGp7gMXAuYhntgqnel+zsE
         dPlw==
X-Gm-Message-State: AOAM530J2xhcHhMEChod79f6Jm+pNUopqfKVlV6y4c8dg8u1u0CT1eTU
        4QeKC7qEnneUk/bqYtqDZpMivr2soUrolw==
X-Google-Smtp-Source: ABdhPJzNli5fgiwryc5GMOwljLQKLTlgS+lC6xLKe1ECaur6dGz4EvU5DM7NZfYF7QOq+Dh564b4Vg==
X-Received: by 2002:adf:e60a:: with SMTP id p10mr3210372wrm.291.1615377536711;
        Wed, 10 Mar 2021 03:58:56 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8018:efa9:4421:9140? ([2a01:e34:ed2f:f020:8018:efa9:4421:9140])
        by smtp.googlemail.com with ESMTPSA id m17sm29632508wrx.92.2021.03.10.03.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 03:58:56 -0800 (PST)
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Add support for up to five
 TSC nodes
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>, linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210309162419.2621359-1-niklas.soderlund+renesas@ragnatech.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ba60c08e-689b-849d-c232-26aad08ca036@linaro.org>
Date:   Wed, 10 Mar 2021 12:58:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210309162419.2621359-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/03/2021 17:24, Niklas Söderlund wrote:
> Add support for up to five TSC nodes. The new THCODE values are taken
> from the example in the datasheet.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
