Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A567020A33D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 18:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403912AbgFYQm5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 12:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404697AbgFYQm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 12:42:56 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED625C08C5DB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 09:42:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n23so7258186ljh.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zClFgpz3ZMsyGeYZHhNVEHPebUS6ZTida1tC/1yV4wQ=;
        b=XnU7x3eOw/bSXbFDAG1leuCXtQ6csxKA+CSU5cYRceR41Mzu3Z/ZhE3lCLKlBDURcJ
         NPqgX8GTfDUS3sPfoc0jVhrFaUCAsuY2sroqnqqMz6BU3F2HHnijYOoL/qv47JkxRov7
         P+W1Wq5bGFFhZP+n4lQxfVLgIDUpKtEr7ZwtJxEL/5orJIqhv536mi1S8dQSCSZY742k
         33sZG2kY5jKA16DOr3AlP7TzFVFthfyo0Teiqx3pozw45lOLwKH8QbOJujhj/OFsDGte
         6xBla455Fpt0gAZflbHtqieLXZ0P/64hUGCKZvomaOLQT+ExQ66Ls3kJbH1BSJKkcIvF
         QxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zClFgpz3ZMsyGeYZHhNVEHPebUS6ZTida1tC/1yV4wQ=;
        b=Tkqc/u9qV/tPeB49lO7SIFwTNH0xcckJuiJSj0oAD8/jZkJww6EVcAjFlg1v8hwPTg
         m9L+52szsKPoXktB7PWNqjGjqdbJ2hQgPT6QSmtfDtBQfjjeNBC+SSvYNNmdLd2dqlOC
         tZ5W1zrjOcruSwxnGlX5BcC5EwJwfyDmJ9oKvpZYp6djHslvHvysiiSugdw/0E9jzmER
         umk6HCSFI+X4WH7FxeUhfG1hDCz8YWD+QUNH2CGgyn0CPl/ysxPZO7vjA+ySWwVkbMPS
         13fVbFr2CPCWCJiQu7+s/gGxVvFffghPA9kyOQeYBj4GtKzS2Yz0HlibyBPBHxEIFVKi
         xdTg==
X-Gm-Message-State: AOAM533G7IfcCmeAYNMX1zAGTrPh+Dx42Kam1flgaVVHzrVQVsXVSoTI
        cQuKFZ+hAD3K8VXA/gzoOmNTV3KKBo1fFQ==
X-Google-Smtp-Source: ABdhPJzDdobcvIkvsC4t6+0mpz7c88hWpFSnrXKSvIHdOg1LwgQ2M+PnVjApc9f2/lRfyOfCsQpEkA==
X-Received: by 2002:a2e:7011:: with SMTP id l17mr18238543ljc.424.1593103374304;
        Thu, 25 Jun 2020 09:42:54 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:6ae:209b:f7ba:a780:4a06:8d86])
        by smtp.gmail.com with ESMTPSA id 2sm5696247lfr.48.2020.06.25.09.42.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jun 2020 09:42:53 -0700 (PDT)
Subject: Re: [PATCH v3] thermal: rcar_gen3_thermal: Fix undefined temperature
 if negative
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "rui.zhang@intel.com" <rui.zhang@intel.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "amit.kucheria@verdurent.com" <amit.kucheria@verdurent.com>
Cc:     "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Van Do <van.do.xw@renesas.com>,
        Dien Pham <dien.pham.ry@renesas.com>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <1593053768-31016-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <db9e3bd3-d3f0-61d2-7ffe-3306003f57d8@cogentembedded.com>
 <TY2PR01MB3692CC45140FF53CACD097BBD8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <cb207009-7af6-72cf-1551-b38445a557c8@cogentembedded.com>
Date:   Thu, 25 Jun 2020 19:42:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB3692CC45140FF53CACD097BBD8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/25/2020 02:34 PM, Yoshihiro Shimoda wrote:

>>> From: Dien Pham <dien.pham.ry@renesas.com>
>>>
>>> As description for DIV_ROUND_CLOSEST in file include/linux/kernel.h.
>>>    "Result is undefined for negative divisors if the dividend variable
>>>     type is unsigned and for negative dividends if the divisor variable
>>>     type is unsigned."
>>>
>>> In current code, the FIXPT_DIV uses DIV_ROUND_CLOSEST but has not
>>> checked sign of divisor before using. It makes undefined temperature
>>> value in case the value is negative.
>>>
>>> This patch fixes to satisfy DIV_ROUND_CLOSEST description
>>> and fix bug too. Note that the variable name "reg" is not good
>>> because it should be the same type as rcar_gen3_thermal_read().
>>> However, there is better to rename it in a further patch as
>>
>>     It's better.
> 
> Thank you for your review! I'll fix it.

   Note that "there" isn't needed there, I wasn't explicit enough, it seems... 

> Best regards,
> Yoshihiro Shimoda

MBR, Sergei
