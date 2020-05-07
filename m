Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6721C9957
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 20:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgEGSb7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 14:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGSb6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 14:31:58 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E6AC05BD43
        for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2020 11:31:58 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id c124so5892396oib.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2020 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v9hKv5iDBOo7RWh5ZOpQ7O9Wogr6dEUvxuwgWGqhjZY=;
        b=i8+1Qf4zlTIBxI9krKDUoNtN+l7e2MEXsdm04AMDF8cCKpyC1IUyO9yu4s3rCUmfVX
         e8/iSTwt7fXHvieEYommrPxZfibaBu2H7+KFgEdzL0Q0g35V6XI9Vr76pvRpiDnDpw4g
         0torWL/gWFkQRpUXOCXQhyZuwA9wAtOflSQKndBT5IZIyuEXBTEsBREBNTuyMM/vjl5o
         jbEhUwFRRJ4+b6WVkVFDgVQBIy73MRvAVQxUuqpg5OhAUXR7ELiCHBxdw9kCo/c48S3J
         6HVdSmD1PtwfpPvJKpdRHWdTH569EGQfEewJ3l285QL5XuI6Q8AaLngjOHvg+GqwcGg+
         QD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v9hKv5iDBOo7RWh5ZOpQ7O9Wogr6dEUvxuwgWGqhjZY=;
        b=e2KzvUXNyk/E6HPqzt6HzeyrdX1izveK9ZkuBww9wQ9IGFm4KGQ6vHotxKFeNZPUG4
         Bup9XC6dpswP+r02XzWzivN0joAzrO3piiSlqbAYJAir8RL80pRrrZzdt/LgN5BpmP/J
         MOInMnnsQy9k8/ZCe3cdC7jUfPH0xVZ6mzy03R0M+FAoB/okKWaA++XLX0WaYPYpaHtB
         broseooyQuJSM9rcH+3V47ZuJRv2UseI+86brUf4mx6hTiE1D+pGMRATXJJBKZL/84Ti
         runu4jDq5XUNHN2z9V09pr3X9Z2qPpC8RY9HlXuzGhjDvV04X4oZBvBWYCrhmswFVtig
         NI+w==
X-Gm-Message-State: AGi0PuaqcLRDQQeNq40Sx25Ij01RvojDA5fOsF7sY/OtrnfIuEN2eky8
        1/EC0ZyW1yIRU0wd3wXCW7qciTSksDw=
X-Google-Smtp-Source: APiQypLFuUSA1M7BFigStl2Ikj46vndddSIPgiOESJK6JSbrOi/vsscNG29Y+SI+uGQ/a/I5C7fjJw==
X-Received: by 2002:aca:5391:: with SMTP id h139mr7412369oib.80.1588876317902;
        Thu, 07 May 2020 11:31:57 -0700 (PDT)
Received: from [192.168.86.21] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id 60sm1289160oth.38.2020.05.07.11.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 11:31:57 -0700 (PDT)
Subject: Re: [PATCH] [RFC] media: sh_veu: Remove driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guennadi@rox.of.borg, Liakhovetski@rox.of.borg,
        g.liakhovetski@gmx.de, Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20200507122757.30119-1-geert+renesas@glider.be>
From:   Rob Landley <rob@landley.net>
Message-ID: <751849c0-67f9-dcdb-3cb3-6c8155ef5d08@landley.net>
Date:   Thu, 7 May 2020 13:38:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200507122757.30119-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/7/20 7:27 AM, Geert Uytterhoeven wrote:
> Since its inclusion in v3.9, no users of the SuperH VEU mem2mem video
> processing driver have appeared upstream.  All VEU devices in SuperH
> board code still bind to the "uio_pdrv_genirq" driver instead.
> The original author marked the driver orphaned in v3.15.
> 
> Remove the driver; it can always be resurrected from git history when
> needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Rob Landley <rob@landley.net>

Rob
