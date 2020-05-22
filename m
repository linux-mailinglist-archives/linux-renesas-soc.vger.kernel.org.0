Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324621DF011
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2020 21:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730894AbgEVTiU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 15:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730907AbgEVTiS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 15:38:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C002C05BD43
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2020 12:38:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e16so11231280wra.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2020 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hpXaudKgcoJBGQ0g6uxVzYm/+QRXhqSUmA+R6+93KsY=;
        b=rU/rB2J7Mdt9KXpIYF0r/2PTHbz2uOVQ2NK26cJGrv+R3kPgTVw2zzlxWY/w5lYDYk
         cHOos1Rj8THnNbuv/g5cnIhM6vg75q5jArRdYdRLx8jcf5bYik7iNFewTqNNmL56rIZL
         sqxbaY4+dev8uEM2QOpvBOQbzXEEdD8u1GDZ2CXLuWzX9ATDQlaME+NMvKHMF1giG0yB
         b5SxBMRCFVdNgp+kPP+38NcoPrGMSj2zhd6fdXSCUDX4d0gObUbGpj7GITR4nWIj4DTF
         qPQ6H2nbPfwg9RFsZCw8cdHJR3mnXXdov2ex2dVNx8ayqNusqJK54CPW0fR6OcTial3j
         NMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hpXaudKgcoJBGQ0g6uxVzYm/+QRXhqSUmA+R6+93KsY=;
        b=R1oTJM80jBR5TplSCn4zWLxXlkvwUOLSJFuKyDIj7bMYyNCm3Oit5ZUulonGjYMWHQ
         qdWsBHY5wGMa7V/pqs0ANF/IVjPtWGy5RSF6DHEimpr6BzK/47SDWtSdPaEadB1A6osG
         eR+bb+yT0+mspahLDPXvWTCbmK8YR5D/cAS+svIU1AgJnebzsM0UG8g3JCTRbjutYQR7
         98u4gsr8L6Q1W5fsXWTIx/UMENehhzZWfxe8UrCxa5R786jzSCFEnpcGFYF+3SP2i+xZ
         SNaqdcX+8HaPcwjEwtXDjOb9lmD+bnIq8DYafKw/gqf9DbsfhNf4BIkSbXqVlXi9CCNJ
         DI5g==
X-Gm-Message-State: AOAM533PnY7sMMPwVJ+z7JKtWc7TDkUEu+FDVuok2VAXtQd/8EylLjzL
        1KGco6mPIOnzG0IS65IUa7fPLA==
X-Google-Smtp-Source: ABdhPJxEhOmC/akkcwQuLjNWKRMW/+unLHtosQ6iW22D5aOnV69Tm7M6WvnFN63OyUiN/55666tTJw==
X-Received: by 2002:a05:6000:14b:: with SMTP id r11mr4894259wrx.124.1590176296966;
        Fri, 22 May 2020 12:38:16 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a? ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
        by smtp.googlemail.com with ESMTPSA id v24sm10846635wmh.45.2020.05.22.12.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 12:38:16 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: timer: Add renesas,em-sti bindings
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200519081101.28973-1-geert+renesas@glider.be>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <50e3cf79-adb6-ba96-1c05-c88f54ccea86@linaro.org>
Date:   Fri, 22 May 2020 21:38:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519081101.28973-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/05/2020 10:11, Geert Uytterhoeven wrote:
> Document Device Tree bindings for the Renesas EMMA Mobile System Timer.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
