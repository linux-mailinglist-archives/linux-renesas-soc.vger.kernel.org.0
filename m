Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AF520B55C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jun 2020 17:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730122AbgFZPx4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Jun 2020 11:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730120AbgFZPxy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jun 2020 11:53:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5C9C03E97B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 08:53:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so10866024ljn.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jun 2020 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wS3ZoLwVxMYE5aOSMJlL4wxZx5NfasIcwsCreNsKCHg=;
        b=aXUNBRHApb/d4chCFqPEAPBCerd3HA1AvzgBAtxqWUNfOP2ounPi0BGuHU/6m1fMLy
         iZUgVzdo4eoyvRyCiukLyt5m7teU8Bt/nXESIblqrPBS8siY3NlycbomLgD6F4O97yVX
         Yc6EqjHlhno2UoZfMpghdRCPxOK8hvq8MMShIZpLFyWt+ICmU5qANsip6istpwh2ATbS
         7TJoAXNg7C+bWwqwIZ2bFiKsNqC4/dosBpHgjQKhtBrYHYNiUoePWmDXvonUWiz36CvB
         SBybpbeMe/pSr54YHQuY0qFNbrQn5/1Pu5ViKf1lJa4+hB4rJnGLh5593rzpjFuoFwXO
         B5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wS3ZoLwVxMYE5aOSMJlL4wxZx5NfasIcwsCreNsKCHg=;
        b=PT/eRCGs27v05DQr0LMbS2lL7x0uegZb3eOtCTe9+2EnUy8ZRUuZWOgOIV38vW4Nbx
         1cHpUW1a2xJzqkSP8l/DAwpNQeTHzjuDQkIt3JiepznST0JS+O3jJuz0QYYHhUVYVLEp
         +CDbQ7KMAHpm1htl0oteWDqpyGd3PzOIifuihEjEg/KXGnJWFK2aQPSWVNa8JBD+Haew
         A2VYmAHflAzn4aY6ilGJr8aVr1+aFmpdl1Y1hgc0KciJ7EaVfc7Gadgo+ym5qSgdJVgT
         WU0T8IZElSdBXjOeZgkhPcd/RJ6yufiNsbmep/mvS35dOxAlh5uoKGulqvRz2txUE3yN
         XRow==
X-Gm-Message-State: AOAM531/4VyoWdabH9G/OyL9/6VDKYZSRK4gkPj0XgppBWykK0UBurJ2
        4JeivbY+5X/CEKn/UCLhu8a39ztTvEg=
X-Google-Smtp-Source: ABdhPJxVanab6IRVSKzmHEyKsqu6Hh1aLxUPDUAS04E63YfmDijCpVv/qdoDyztglfWI0L3Z931Ieg==
X-Received: by 2002:a2e:a548:: with SMTP id e8mr1822890ljn.76.1593186833518;
        Fri, 26 Jun 2020 08:53:53 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4807:b213:5663:e485:3cf8:764f])
        by smtp.gmail.com with ESMTPSA id d6sm2733412lja.77.2020.06.26.08.53.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jun 2020 08:53:52 -0700 (PDT)
Subject: Re: [PATCH/RFC v4 3/4] mmc: core: Call mmc_poweroff_nofity() if
 regulators are disabled
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <059bced3-00d3-cf2e-6628-a8c9f1544909@cogentembedded.com>
Date:   Fri, 26 Jun 2020 18:53:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1593163942-5087-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06/26/2020 12:32 PM, Yoshihiro Shimoda wrote:

> If regulator_is_enabled() of both vmmc and vqmmc returns false,
> _mmc_suspend() should call mmc_poweroff_nofity() instead of
                                          ^^^^^^
  That hard word again. :-)        

> mmc_sleep().
> 
> Note that this is possible to happen when the regulator-fixed driver
> turns the vmmc and vqmmc off by firmware like PSCI while the system
> is suspended.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergei
