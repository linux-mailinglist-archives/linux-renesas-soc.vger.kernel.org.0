Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC193209B8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 10:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390400AbgFYIxA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 04:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390330AbgFYIw7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 04:52:59 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151E7C061573
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 01:52:58 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 9so5617066ljv.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jun 2020 01:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fdFrHIZhBZS/7plt7r7Xv74Rwfn5L2PjN5vY0UMuaSo=;
        b=WZrh02H4MWYSgcB3+NqWBoKrD8cCaEhtpUv3lmljKnaSFY+oPzl3ZWyr4pU2EmA4tH
         AE0ODqWyrXgtr5PcxUA/UyggYUPih7HHctY1RrdsHnA8PPEAzJTtsWjP8JBhpDhA4O+v
         C248PpHUmnvhHk4IMOvSvETvrXIPTlSOG92a8Dd7Pe9hs2lQlNqb07Tl7oNx6+mYbD0n
         Mw3WEClOBuZ90A8+6M+sftI+dztJGxt6KqgTYCvog0kPDnF573lpqAdS6u1ZpZcnyd13
         97bvdMR3tLkTdZ/a3/FkemN1YMT7Ae8mWNExKiXuDkMNdoiJY38tEFHgHCq2Yrbcpgh7
         12Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fdFrHIZhBZS/7plt7r7Xv74Rwfn5L2PjN5vY0UMuaSo=;
        b=Q/uwXBRx9Cc6WrHmUFglIWd5xdjQaHszc/1FEEqbMHa7wPUlXO+Bbix2xYWkvpRPqY
         lwdbZhMLzKNGxR9Eb5f8fbmfJTUdLLRIjx6GSRVKUQke1W0cYnHoymGi8VPaf40h6lIv
         KYbkqAXPF5hbVfWgwO360+RUWQzKF8bvRaW49Wxojw3UiLhbDrUNhFvpu5w8uVJMfJQK
         IA+yt1PAwnuLjksuSyGb+zgW8RohScIhplwaXLRqPJctnUnM+t0fXGpFx3R9d67i4NAi
         zcgAReC9quagnp4sdHRgWafuqrxdaSqYQRRsavfELsoNHA4yP/++fET2BM7oy80DEddx
         ullA==
X-Gm-Message-State: AOAM533/Nz8ayrqCp+llVB7rwaMHfgrTQEmb+3HlN8ZvnmelJXTolbhA
        aFHoqHZAhH7gME5iqPi+xwFsskwdiZyKdQ==
X-Google-Smtp-Source: ABdhPJy4o2NNubK/0CUG3eE02dw9aLIsJs/wZPhkQoxeOtUSW8d981CXMfvMwvHsa4yecZ/X5KJ/+Q==
X-Received: by 2002:a05:651c:2cc:: with SMTP id f12mr15398947ljo.329.1593075176422;
        Thu, 25 Jun 2020 01:52:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44da:b8e6:887f:f9f8:ffc4:9fb8? ([2a00:1fa0:44da:b8e6:887f:f9f8:ffc4:9fb8])
        by smtp.gmail.com with ESMTPSA id l22sm4677486lji.120.2020.06.25.01.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 01:52:55 -0700 (PDT)
Subject: Re: [PATCH/LOCAL 4/7] arm64: renesas: defconfig: Enable ADV7180 and
 ADV7604 support
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200624133057.5860-1-geert+renesas@glider.be>
 <20200624133057.5860-5-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <135e8a7f-68ff-ea28-5e9d-733ca85a4d82@cogentembedded.com>
Date:   Thu, 25 Jun 2020 11:52:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624133057.5860-5-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 24.06.2020 16:30, Geert Uytterhoeven wrote:

> Enable support for the Analog Devices ADV71780 video decoder and ADV7604

   ADV7180? :-)

> HDMI receiver, which are used on the Draak board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

MBR, Sergei
