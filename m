Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E242C2E2A90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Dec 2020 10:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbgLYJQM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Dec 2020 04:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgLYJQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Dec 2020 04:16:11 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5764C061573;
        Fri, 25 Dec 2020 01:15:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x20so9119328lfe.12;
        Fri, 25 Dec 2020 01:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GlWZ8R+fuhT/j1M7sXyJhAgX6o+xq9lQZbiVeR1W5lk=;
        b=QzU+E7qobAtk/l0yKRryuCEStUbb6S8OiGbr5vyMjslEwobnWatoveE2FOyh57D9bx
         ctfF3KRFfNVq04QrgQSxaQe4FegYZo/0wcm2GrOTn/X4bQmiHCJk9GWeiaru/1TYuxnC
         bZeBPzvATp5JXQH695LWEt8eFif7W2dzaRxHGd2e4VY529ARY8UHpPPQ+cscpAaeSlBv
         xioNX3lrb+HGTvDwinfACd73KMixyyFcPu0E/2geNKakKebIynIkRqadDROxFfL6Ltsl
         bNuycwxYu3AOl07vxtQkpGwCbIcH/Ljj96M0j5witkoXckJIEXyvRtTBOK4WB7a5Z2dK
         JduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GlWZ8R+fuhT/j1M7sXyJhAgX6o+xq9lQZbiVeR1W5lk=;
        b=pPZXK+Qp7n6Zlo7/ytvlq0ntiFg5VbxlamOBFQjZm2ZPh1n9kcM84z7Z1ttQpJha9p
         RUPF52yprOLF6ZkYi3sC8AghZ+Jl36GaScw2/vvGr1iYxy5E30W6KuywQzDYIoa4hxR4
         jz+VvTnU53P7AeI20H9WbqTVosflWWKqfBNa298AYEzTM3dLwWwD0dNtbXtoLhWERkhb
         Sqrv+nDZ5AQISiVsxm/4fQuT/lRX8qKc+K/pRLRnsZUvGFOg16Sai8iwdVPY2Hz8zhyO
         cB3gDMrenV/2VXsV0aLCfnUaz/63MP9fqPKnrG7hb2/BtGL31yuDdpsHj8EsvBpSw9nU
         1i+w==
X-Gm-Message-State: AOAM531Cyhxi/vcC7R3+DwRTTwwTw9Kz9Sr9kEgRqfAGr+UXmxh7mmpW
        8D7tqPqsyhM8/hcTWQ96SwIRxzBUU8c=
X-Google-Smtp-Source: ABdhPJxIT/jMh4PYUi+o6jXCZf1BI41BWXz/BFAW9XBczQCFH+mdWH4mH3sQU6Dwht1n6EHCK31nVA==
X-Received: by 2002:a19:f718:: with SMTP id z24mr15013731lfe.532.1608887728961;
        Fri, 25 Dec 2020 01:15:28 -0800 (PST)
Received: from [192.168.1.100] ([31.173.84.55])
        by smtp.gmail.com with ESMTPSA id a16sm4581130ljh.91.2020.12.25.01.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 01:15:28 -0800 (PST)
Subject: Re: [PATCH V2 2/9] arm64: dts: renesas: beacon kit: Fix Audio Clock
 sources
To:     Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201224170502.2254683-1-aford173@gmail.com>
 <20201224170502.2254683-2-aford173@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <054e5cc9-deb8-594c-36e7-8feb022dbf0a@gmail.com>
Date:   Fri, 25 Dec 2020 12:15:18 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224170502.2254683-2-aford173@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24.12.2020 20:04, Adam Ford wrote:

> The SoC was expecting two clock sources with different frequencies.
> One to support 44.1KHz and one to support 48KHz.  With the newly added
> ability to configure the programmably clock, configure both clocks.

    Programmable.

> Assign the rcar-sound clocks to reference the versaclock instead of
> the fixed clock.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
[...]

MBR, Sergei
