Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367824816EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 22:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhL2VMI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 16:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbhL2VMH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 16:12:07 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5B4C061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Dec 2021 13:12:07 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id by39so37624423ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Dec 2021 13:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vjBtWdrmAlpHjYLO6yg6l3ARS7/1BBcb9/UFVxhf8Vc=;
        b=7Q8Yw9ADq2f6kLVocaZI9d1PCSVV/0J2PMI1H/vtOXZ1eYpu8+eFz42LLt9By15vcG
         oqQ6gFT1dLBlF7OhxCyrXw7rAmgduoWDyZ7E5sfg6bxp8lkRq4Pqtw/3rOLa6TJA59Dz
         Q3RqBpEaAtyhMhvsA6pTHqIreSuO25sWCBqb9j/dLszXUtSdtyT+xak+0/SS8moMmQ1H
         CMIwWiRsrZC9zLG65gT27kU9zetOUzgTjeOvtSZ7Zx8nFzTBBtx1+TVdAOk4tMjbXvJv
         Mpj6grLM78CDfuQJM1BapkjHQTNePlA/rtogzmeA6oely/vcGKlP2KZHHK2nxhZ7VeT4
         o6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vjBtWdrmAlpHjYLO6yg6l3ARS7/1BBcb9/UFVxhf8Vc=;
        b=YwBy+qakI/apwcQHKyk+5OvoVFhD7Qe3YjgVpPL4/bHjf8ZT6M7Q73OE1ge7Rz4PsH
         vKDfgCAg66t118aiiQWuUGMLKKu+Ba0lc4zHu6egrMnRPHR11LQEbKfNwoboYzZ6Wj+c
         QJB38JT9pjfVK8i45O3k3IonM3e+f3bFOnrhhRjwfh/cnAWEFe2pp+uz4EEEjsEZT5w1
         aPzKF3H0EOOr/2ylWB6wh2Es3ljQehGYtR/MeBX07mQt5OmtFMAwHN4q+IBHYz8+ymsO
         l7C/7+tGdJgY5LsmKMDMRRGKgRqhD3npiaRcpZ+NzAT0PULRq5jsptRFmgj9JsxitMKY
         54bg==
X-Gm-Message-State: AOAM530Sn/BtqynUnDCrx4NZX/oH9YRa4ZptyzkMPYkETkqWxbIenfix
        4CLvQCUdsOdi4C6DFRvVDhy67w==
X-Google-Smtp-Source: ABdhPJzNSZouXDGO7X5hs9MlNi3MGSek5vs3WsO6ApXEIyAxpTgsbCnmTebH3VbGA66lL6gaSiXHEQ==
X-Received: by 2002:a2e:8781:: with SMTP id n1mr3037502lji.96.1640812325657;
        Wed, 29 Dec 2021 13:12:05 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id m28sm2305722lfo.76.2021.12.29.13.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 13:12:05 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
 <87626d61-ada0-c220-bea5-5330f5256629@cogentembedded.com>
 <YcyXQxW3kRqQ2Yv0@pendragon.ideasonboard.com>
 <39f70781-831e-c86a-ec5f-68f2b4bd3d62@cogentembedded.com>
 <Ycy4AMAT53Uzf+K7@pendragon.ideasonboard.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <bb6ef732-7cd2-5ba9-0eef-caf2fbfbf829@cogentembedded.com>
Date:   Thu, 30 Dec 2021 00:12:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ycy4AMAT53Uzf+K7@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  Endpoints are meant to model a link between two ports, so an endpoint
> shouldn't exist in isolation. The issue with creating named endpoints in
> SoC files is that you can't tell there what remote devices may exist, so
> the endpoint may or may not match the actual hardware design of a board.
> I think it's better to create endpoints on both sides together in
> overlays.
> 
> https://lore.kernel.org/linux-renesas-soc/20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com/T/#t

What I don't like here is: details of particular SoC (such as "panel gets video from port@1 of &lvds1) 
leak into per-panel DT fragment.

This limits possibilities to share DT fragments between different use cases. In the patch pointed by the 
above URL, you have to reference both board and panel in the dts file name.

I'd prefer to make each DT fragment to use only either entities defined in that fragment itself, or 
defined "interface entities" between this and "neighbor" DT fragment.

Such as:
- SoC's DT fragment defines a named port/endpoint to export video stream at
- board's DT fragment defines a named panel node corresponding to panel plugged into board's physical 
connector, and connects endpoints with SoC's video export,
- panel's DT fragment extends the panel node from board with video mode information for this particular 
panel.

And similar for backlight, power, and whatever else exposed on the physical panel connector.

So for the board's physical connector there is a set of board-DT-provided entities for use by DT 
fragment of whatever component plugged to the connector, without direct references to final SoC 
interfaces. And possibility to reuse DT fragments between boards, and probably have a library of DT 
fragments for hardware currently available in the market, usable with different boards where that 
hardware can be connected.

Nikita
