Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A422F333D96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 14:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhCJNYD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 08:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbhCJNXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 08:23:51 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8079EC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:23:51 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l12so23281078wry.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 05:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Jv6nQkkh1wfoAYNBjP6EZ7SrZ3TMGh9NZHFejwSKlL4=;
        b=muxCJqEiYWestY7TAkou3feRcyRpYIXemQk2y4CHCq02HubTny4FBQvma08fsFdQOs
         ms7VkD6gvPfh3evRSMgisUTvG1ebm1naqEjQ7j/sNlYWe4+vymODBP5zcTo7xqfEFiKW
         Muxh0QSag5lWuSyqHvkF3JzsBMNpeoojLS9twK3Z5pKn2hp6ovrbuhIJ8JKXEnortXCG
         TiKHzqqnFOjUTNcLjSj4iZXggCI9bYPCWGNE7JP8LggPYx/QUgNvtX2QtuFOlFqPyODJ
         GWlMFGLafto9kAxv0nSyXaYQJFeDx88W8sxIHIs9fwQHwUZGdatH67Nz2ZIiNIoXLNnW
         PiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jv6nQkkh1wfoAYNBjP6EZ7SrZ3TMGh9NZHFejwSKlL4=;
        b=n0AUlsvnnzCjxa+3/Bn2goUAtDMrNmrkORHuZG0NrxzynYCoX1oCMdXfcenUESuGUw
         6n0QW5qPGK7L/gKkdOo73Ta8KQMOJw1Vbj4j6UKZl84ZBkZTOajks9Wgid03fCFeqiPi
         Majb9zQiYlFyBDC7A3BralE7JuS0c3OhLHbPB52u/yAxirujOCuJYATKIDfNhLw+x87o
         1Pnc6NIpwt7KW5Z7s6IHWn7B/vdy371JlUamrTZ6NaNmnduTWesUxsTzL2yMwRoCyoP4
         ndgN1cuv4AgOgWaiSiQiyzt4EThPF3KlhRsLM/ICZZz1kbBOVqmdSpjitNpCR8IPs0LJ
         G5mQ==
X-Gm-Message-State: AOAM530LhGdHLgAL7yK2stm6oGcSAAjjrfOLQ6/NfVLjCylH5xEIqFvI
        zsK+Ui/oWMJAWYwrBxc7yqs4X5sdBqvp2Q==
X-Google-Smtp-Source: ABdhPJyLhAPaPoKo+bpeeuViu25VjY+TYYuuCTA25mMnWOuK2a2bc6whGi9l9tyfn0jXnpsLY5/WhQ==
X-Received: by 2002:adf:df10:: with SMTP id y16mr3568286wrl.372.1615382630176;
        Wed, 10 Mar 2021 05:23:50 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8018:efa9:4421:9140? ([2a01:e34:ed2f:f020:8018:efa9:4421:9140])
        by smtp.googlemail.com with ESMTPSA id h25sm4276050wml.32.2021.03.10.05.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 05:23:49 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: thermal: rcar-gen3-thermal: Support five
 TSC nodes on r8a779a0
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210310110716.3297544-1-niklas.soderlund+renesas@ragnatech.se>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <dd0913a8-8491-3a95-a875-8c0293481ee8@linaro.org>
Date:   Wed, 10 Mar 2021 14:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210310110716.3297544-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/03/2021 12:07, Niklas Söderlund wrote:
> When adding support for V3U (r8a779a0) it was incorrectly recorded it
> supports four nodes, while in fact it supports five. The fifth node is
> named TSC0 and breaks the existing naming schema starting at 1. Work
> around this by separately defining the reg property for V3U and others.
> 
> Restore the maximum number of nodes to three for other compatibles as
> it was before erroneously increasing it for V3U.
> 
> Fixes: d7fdfb6541f3be88 ("dt-bindings: thermal: rcar-gen3-thermal: Add r8a779a0 support")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - The register layout for V3U is larger then for other SoCs, fix the
>   example to reflect this. Thanks Geert for spotting this!
> - Fix a bad copy-past in the register list in the example.
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
