Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7017F1B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 09:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfD3H7c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 03:59:32 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:34776 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbfD3H7c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 03:59:32 -0400
Received: by mail-lj1-f170.google.com with SMTP id s7so9153049ljh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Apr 2019 00:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NZOnwOT/39smZacukzn9yIAubnR297VqK+nhpay9xGw=;
        b=1rGNjz8L2yl0LMHFIe48X3IySkQ1+9hlbMjrtyosURxzEsPHqNG3B4ojshAunfVH6y
         B+GC2Cvept7QMcQsO5IPwbvlc++TYtvhvdIJxqeORjfQYRKGSyDeyJlymurGKSV1PysQ
         i7/TlOGObuHE0rQNoSZAlnfCYw4dMR/BxC0cg1nQ4VuDNNY/5WRFFe1eoMkeXYZuHzOV
         X/hFBId7g86bgv7VsuQam0omJcIJrtTyK2cFtDMUrcBn8zko3wi9dlxsfLErgvFTGkSI
         IVe5alUSwBcE3JK6dqiPy3ZXYH5ZAzrgsoYn2bHAGjFRaLGD8HP6biD+luPd/uYdehS2
         38cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NZOnwOT/39smZacukzn9yIAubnR297VqK+nhpay9xGw=;
        b=R0Xd6YJ0mSkBv/mpmO5PCzF4ze/VmQCqNwMONbt5n7+MsMn7KSjmL0NwkH5fSKbIA5
         zGVg6uW2Hb3ZNMiXKiPAwNQxdytw0lweqDx0wbO+vP/HjiuhFvHrCnNCuu0C6eSU0tvz
         FENTRIoHvadBD5spHb76KY/DU1mAAGeFbFNEZkB+1awPV2hkCOUorWw8LZUM/b27d1EG
         ILZF2Qp3/2OlBr1bcp1Af3vNjLlF1V9wUmMya5tOfQCYJ1PrDTjmd42ezNKz+XG6fF51
         GyF+N0xWnmyLrmEGsHbno2M5V1aKilg4H4Z+56DQuvLyy4vhIA1n+EcTsMGVLq9tTjSo
         W2Aw==
X-Gm-Message-State: APjAAAXffMxOiFsNdQuvCSQXQUrswyebstUskG+CNkqUF1LLYcgN7BFC
        4x4d6R5eGvr7DG1D3t7AMQfSb5jxhsI=
X-Google-Smtp-Source: APXvYqw79T5UGz2uMyZ5u74553TfGqbH+KTyqYp7xfZZon6zMIfnoZN4cAwSH07kRU9KrhzPRlVBoA==
X-Received: by 2002:a2e:90cc:: with SMTP id o12mr10755377ljg.133.1556611169529;
        Tue, 30 Apr 2019 00:59:29 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.195])
        by smtp.gmail.com with ESMTPSA id v23sm2411234ljk.14.2019.04.30.00.59.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 00:59:28 -0700 (PDT)
Subject: Re: [PATCH] sata_rcar: Remove ata_host_alloc() error printing
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>
Cc:     linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190429152209.22851-1-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <453d8c34-a3d5-3347-888a-ce608292b75d@cogentembedded.com>
Date:   Tue, 30 Apr 2019 10:59:23 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429152209.22851-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 29.04.2019 18:22, Geert Uytterhoeven wrote:

> ata_host_alloc() can only fail due to memory allocation failures.
> Hence there is no need to print a message, as the memory allocation core
> code already takes care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
