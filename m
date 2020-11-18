Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC492B796B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 09:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgKRIuN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 03:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgKRIuL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 03:50:11 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39043C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:50:10 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d17so1786973lfq.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8GUZhSuPciNzCpZlGjPGatVvy71YU22OP5kWu1o2CHc=;
        b=DnI2F6omsmFzAVgctZV2xwj3/J5GDllK4OnYalKXS8y4uPr/yXIonheOzKNBHF7/wX
         j9zNb9Yd+PS46XGQf93dUbFTPEz957mPuHxQpFXkb91HIMB7zFhZrvWjNbPzdjcJ3R8Y
         WK6jjTPhUcRzeGTOStzb0oL0CygjTHtonBqITjRY6PiDf8W11Bg8IjGn6OX2cuQlyPeO
         cRbXezxC8ylWxt39Og8ekhayHHINoq0sinv7xSnwfejpTZCy82zG7TzKKztLs3NM90Qz
         jV8663ePYck8wkUwISW/bhQg/CMF3279fSIzRaEqpwlzUMa2gBEkfgLH7kZ0A13PF3+w
         Pv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=8GUZhSuPciNzCpZlGjPGatVvy71YU22OP5kWu1o2CHc=;
        b=cQXbVCf50qpBx+D7cQ+fYrS3kL62uz5Pb6gC/kE4PxyjZimfT6eaAqDRGGOVa6hOzI
         WI33cD3ko7FFYu7urBrPgvuLxQhhh2A/qEnuRPN6PSOfs+/u8VcFcXjpNp83rIAZeEgm
         pxXuJXl15UJai7zJcxNtm53hhW2WbwSJ4pROFhw51Sl7j8DmGsyJ6sGcrJaFOMuyJCd2
         z2j35lCeJKItmUo69cMi+MgLTXOaZZqo1/c4/bpK4z0W+TbBjd0G64O/UtrAB/iov6Rc
         ThKrVXSz+zrWUX/TNK5Ml6g8lpj5KK6FHSpt9wxS3nmxaOQNwBpkQor+U8gaCwj8WeyB
         YtKA==
X-Gm-Message-State: AOAM532v71WMEUtXWqE47rJTpgcJiqyER2m71o4SBv8sZHgfDxY3/sxB
        M/435KCl7jLk+sSGE+pHKks=
X-Google-Smtp-Source: ABdhPJw3StrkFIQE9pOLdX4M2QyWqtc7mJuV0medQWLt/XvnW/k10gpvIXtWmwuW+c9jjRGwvUs/Vg==
X-Received: by 2002:a19:913:: with SMTP id 19mr3504203lfj.147.1605689408722;
        Wed, 18 Nov 2020 00:50:08 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:401:c2f8:8882:a0cb:e27c:5eb5? ([2a00:1fa0:401:c2f8:8882:a0cb:e27c:5eb5])
        by smtp.gmail.com with ESMTPSA id j22sm3170082lfr.6.2020.11.18.00.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 00:50:08 -0800 (PST)
Subject: Re: [PATCH 5/7] ARM: shmobile: sh73a0: Use ioremap() to map L2C
 registers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-6-geert+renesas@glider.be>
 <d46368c6-5528-e39f-663a-950e026b84e4@gmail.com>
 <CAMuHMdW7Auao=4YMxaY+19qUPciY+vCd+cJeOUHM0+4Bu3ZKDQ@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <d87571dc-cdba-2e47-c185-e5a9f8bdcbc7@gmail.com>
Date:   Wed, 18 Nov 2020 11:49:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW7Auao=4YMxaY+19qUPciY+vCd+cJeOUHM0+4Bu3ZKDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18.11.2020 11:44, Geert Uytterhoeven wrote:

[...]
>>> Replace using the legacy IOMEM() macro to map the L2C registers by
>>
>>      Mapping? Else it doesn't rhyme. ;-)
> 
> Can you please elaborate?

    Replace using ... to mapping ..., no? Or rather s/to/with/?

>>> ioremap().
> 
> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
