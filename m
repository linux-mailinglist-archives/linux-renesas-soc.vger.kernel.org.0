Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D93497846
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 05:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241507AbiAXE6e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Jan 2022 23:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235690AbiAXE6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 23:58:34 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E06AC06173B
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Jan 2022 20:58:34 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id n23so9374586ljg.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Jan 2022 20:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FXFmxDQy5UQl/OJS+xVXq8kS8ITCXJeU6yfRYQPHIR4=;
        b=IAAnzfbBZCvY6XrMxJf/FhkYFyrrQ6JcDQXvBwGTARxIhvIqMQIz+jx3CkiD3bAYZC
         tZSuk9frdxlLTmnD7yahnmXJVib6LlaRdAa9TBotdxZ82vMZtCBNHcehk2nHPQqlhSlC
         MQ4trjLAxNNjQjvwEjudMSZHC+iF+k/4U06BZXs4t+iKsBG+TMhMtQt1X+ie9XPEw8yC
         y0fsZ5Anfpe7CBfTE8C2pDERPM3lTZkTuWDI1n56EgFya4NHxFCfKGwR7gTswW1ti+nv
         WAXBChFefvkRifmQbK7p+3+J/6GHeVxGzhlryrtWEqX1Ille/IiN+GyhhwSAQvoi8WmX
         XDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FXFmxDQy5UQl/OJS+xVXq8kS8ITCXJeU6yfRYQPHIR4=;
        b=zUNvXqZRt4c47Bg6T0ThMM3306oHaq/PErxXuekxH46FFEdEbrafgCbONySu/4a/p/
         EWn8lmVHmOWd4ZdOd8PdhvVg6x57Sy8QKiij448t4i/i0OZgCvWavDQXlIKCnTAZOu5q
         O3dmWi8Ho46oEr/HtfSb2XRLfxLO4Y00NcVf7bSS9DvFxyP8yYgbb2/SWW/4iB9ytMns
         ku6ytRRl3DLIO2T+OoO94HfYhTirCswJYA3lbnDvAlNvtifzHArN6P5R77fEA0uzg75P
         zuZmGsp8aON4cGfxN3q3dV85f6+yCueIVcfYNDztFJ1565QUlEfvwvc/DHzUlxmtmlyD
         +6YQ==
X-Gm-Message-State: AOAM530i3gi05GnZEBPI+RHSs9MrBf3lBsCMNPExfTLvi2r0nBMpXJWs
        +MqsbYUJ6IO9sZp5zPezRV1mznZRjc6j4a/f
X-Google-Smtp-Source: ABdhPJzSmjj79qwcfBkc9iBrhtt2KBsfla9CnBnKbXJdkyL4UZY6dx7csn18EoOVBXcyDKHOgdGYKQ==
X-Received: by 2002:a2e:9001:: with SMTP id h1mr5355353ljg.273.1643000312478;
        Sun, 23 Jan 2022 20:58:32 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id r13sm1044312lfi.238.2022.01.23.20.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 20:58:31 -0800 (PST)
Message-ID: <7bfc1e3e-c4e4-cdde-6e2a-0f05369b6af5@cogentembedded.com>
Date:   Mon, 24 Jan 2022 07:58:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] media: vsp1: mask interrupts before enabling
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220120081530.799399-1-nikita.yoush@cogentembedded.com>
 <Ye3MfnICIv0PeqT9@pendragon.ideasonboard.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <Ye3MfnICIv0PeqT9@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> If you're fine with those two changes, there's no need for a v3, I can
> handle this when applying the patch.

Ok, please do that.

Nikita
