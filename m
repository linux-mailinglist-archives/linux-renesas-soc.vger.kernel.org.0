Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A77C49CE28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jan 2022 16:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242792AbiAZP2D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jan 2022 10:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbiAZP2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jan 2022 10:28:02 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081E6C06173B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jan 2022 07:28:02 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id o12so20270985lfg.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jan 2022 07:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VPUnImC2wk2fZ4Ai/dTGdK7fifC4L60M9kEWd9vOWJ4=;
        b=6oxt+dupjxlsSgFvsokhjYlITnm1hhgxO+FERQxgDirzO6TMJ47HHyWmGL2b7B7a0D
         TZUnnLG5TluBywPg1TtcGqNd5QuHm7Eq3jSwsWOzjLK+dZrPSD1rzsVzuZvxnH8uWqnI
         wyGuLQ7Fp+Wj5MGBn0nK63VlHHnL11s72JJL3uZqb3uz/lEfF8oyl1RdzaiHNMfgUHRl
         m/xvsZb9Y+mOt1/IgPlY+iLSlojjIcvmgtf398rROuRJ2g6svxSlWFcm88gBbkK6dU8A
         ydytgSsU9sB+JEtzwSptxLkFz26YHuyC/rqvPSxutX5t5iXo18FZeOtI20c8pW1Ttx0h
         CQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VPUnImC2wk2fZ4Ai/dTGdK7fifC4L60M9kEWd9vOWJ4=;
        b=eELa8nxtQrPsx9KLH87bnvmIS22YaUW2HGqO/35SFImSbt9DPlCbSLI6Nxv9eMVp8A
         TrmfkK/NSuAL753pvVLc9sRPbtk+sZqIP1o4WNjM8UOKIWG2MmPGgWnucEmd/ijsCyb7
         MeS+pJwW85TuA/9YF5cBogf+SizOy4TWQ9ByB41wbA4BisNZok1Aw+9sGETDI5o61jMr
         lIY40Iz8+S8XPEXGKNgdVXcnaQULq9HuypbpC1F1HMAsbj1vZue2zR+L0s8pJ+X5QWua
         iDLktIUeaWsm7rTEBVHBmVNqGNRSfhF8MyE+AislcPX30+S+DN2D7nWSl2ASsmssdDLp
         38yw==
X-Gm-Message-State: AOAM530IYIDSdN2rInUZlveU8zRBNnhslt9V9Sz2WWxbm94pvfNrVtSR
        B6S+OMQxBnVpYaZDWCSYf2B3pQ==
X-Google-Smtp-Source: ABdhPJye3GD10TNNc9Yf/u7JuVA9M3oCLkBFV7Li7u/MZykrFnh1c5wJMDA8HBzHFmbpB03TsEDAGw==
X-Received: by 2002:a05:6512:228e:: with SMTP id f14mr12437366lfu.479.1643210880275;
        Wed, 26 Jan 2022 07:28:00 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id u20sm232666lja.139.2022.01.26.07.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 07:27:59 -0800 (PST)
Message-ID: <a30c55ad-ec14-6cb8-0384-b07b79212351@cogentembedded.com>
Date:   Wed, 26 Jan 2022 18:27:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: add 9-asix sensor device
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220112205205.4082026-1-nikita.yoush@cogentembedded.com>
 <CAMuHMdU0h+VaAbwOqJE5YRK2f69H8JrVgtXsoYNwvNgGJKH7mQ@mail.gmail.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <CAMuHMdU0h+VaAbwOqJE5YRK2f69H8JrVgtXsoYNwvNgGJKH7mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

>> Interrupt definition is not added yet, because the interrupt lines of
>> lsm9ds0 are pulled to VCC on the board, which implies need for
>> active-low configuration. But st_sensors drivers currently can't work
>> with active-low interrupts on this chip.
> 
> That's unfortunate, as DT describes hardware, not limitations of the
> software stack.

Unfortunately, if interrupt definition is added, driver does wrong things and causes board hang.

>> +                               vdd-supply = <&accel_3v3>;
>> +                               vddio-supply = <&accel_3v3>;
> 
> According to the bindings, the supplies are not required, so you can
> leave them out? Or are the bindings wrong?

If supplies are not defined, warning messages about dummy regulator are logged.

> (The bindings also say "interrupts: maxItems 2", while the "interrupts:
>   description" says up to three interrupts, doh...)

Chip has 3 interrupt outputs. On KF board, all those are ANDed together and result connected to SoC's 
gpio that is expected to be used as a shared active-low interrupt. Driver currently claims that this 
chip does not support active-low interrupts. Per datasheet, this is not true. But driver's way to set up 
interrupt registers does not scale to the case when interrupts have to be configured by different bits 
in several registers, that part of the driver has to be somehow rewritten. I guess nobody has ever tried 
to make these drivers (st_*) to drive a compound device (accel+gyro) with interrupts.

At the same time, the device is perfectly useful without interrupts, and that is how it is enabled in 
the vendor BSP.

Nikita
