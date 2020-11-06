Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 936562A8C67
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 03:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbgKFCDA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Nov 2020 21:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730414AbgKFCDA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 21:03:00 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384A0C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2020 18:02:59 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id i26so2733594pgl.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Nov 2020 18:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=MfUR8zFkzj3kr4PPBmXznA83GIqjmqrQi8dR4mnY5LM=;
        b=OifMrK+xYjA8lLgOUadiWJP+wSmcvuyLPJy8oZM5a4NU04wONUPxxyyTv0muleVrpf
         pKcbl7OS+5OBXTUQ5QZuvqqwhB/dix35NP+i273CjetfCHbFbdiq5r7cx47LwHz75s4M
         3sxaBTtvg0MYq/ttNf3mI9L6qr+lst9TdEAJ1rChG5EmJSI89BoqB0XyvQ8/N5KfYrJe
         r4feXgllxVNASUUFjmRMjgT8j6IZKT9eSEesWG/x9A8z3F2FdVj9PvwaBR33Vh1YVeFN
         0CDTmgTxUZpq5+dmcr69uz2gR3O5V1UDu39p3T9twUe7FUxW3DlZ1evqVwSvx15ZAws4
         ShMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=MfUR8zFkzj3kr4PPBmXznA83GIqjmqrQi8dR4mnY5LM=;
        b=IAgxRH5Npll+gyCfHuk2iw4z+VCiPuH2BsQId2Sv0Au4xdtV9oGsakiahs1ba04ChX
         f2HrIl7ctbAaGuJpCizhruPDJu3yVg2Xb4yO8zWynLqmriDw+1MRSTG8Nrl4cJ3jgR8z
         ckt0Q0Yl2ipe+ipmXXJaPu0GNM8n1QpSbmZ124IuwLtZXctreMExYbJYXvbFNwkXQwlm
         JVhmIX8Y7wC8k/LPQaeb+sZdOEGKA4hCIwy3xGINjinUD2V6XNH8sTazKAh+O5+SQ/dY
         vCkqR+RtKbfiGwo3zgIxaX9izTIk/Ir3KnKzYCVlbADTHZ1lFgTF8aIkWooj7wUy+6rg
         HpjQ==
X-Gm-Message-State: AOAM531eoe5Tiu/4M15xsNNbX0gWO5T8C0XjhBfPQnIkW8t15k8518QM
        pZyR/aFTuEVE0CqPKIXdV3K9gw==
X-Google-Smtp-Source: ABdhPJxYtyDZKGpxHAIXw60/WyXXonc+jGAUmrNQl1hZQ7jn6G63WSJpYGmmn54EdIUI/L3TW85EsA==
X-Received: by 2002:a17:90a:d104:: with SMTP id l4mr5261081pju.194.1604628178688;
        Thu, 05 Nov 2020 18:02:58 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i10sm3467604pjz.44.2020.11.05.18.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 18:02:58 -0800 (PST)
Date:   Thu, 05 Nov 2020 18:02:58 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 18:02:56 PST (-0800)
Subject:     Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when interrupt is hierarchy
In-Reply-To: <87y2jl81ft.fsf@nanos.tec.linutronix.de>
CC:     Marc Zyngier <maz@kernel.org>, jason@lakedaemon.net,
        geert+renesas@glider.be, greentime.hu@sifive.com,
        linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
        linux-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
        uli+renesas@fpond.eu, linux-renesas-soc@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     tglx@linutronix.de
Message-ID: <mhng-8b35a163-6996-484c-a9e9-09662614f1b1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, 01 Nov 2020 08:52:06 PST (-0800), tglx@linutronix.de wrote:
> On Sun, Nov 01 2020 at 12:10, Marc Zyngier wrote:
>
>> On Thu, 29 Oct 2020 10:37:38 +0800, Greentime Hu wrote:
>>> This oops is caused by a wrong chip_data and it is because plic_irq_unmask
>>> uses irq_get_chip_data(irq_data->irq) to get the chip_data. However it may
>>> get another irq_data with the same irq_data->irq if it is hierarchy.
>>>
>>> In this case, it will get irq_data of sifive_gpio_irqchip instead of
>>> plic_chip so that it will get a wrong chip_data and then the wrong lmask
>>> of it to cause this oops.
>>>
>>> [...]
>>
>> Applied to irq/irqchip-next, thanks!
>
> That should go into urgent, the offending commit is in Linus tree already

I agree.  I'm assuming that's for Marc, but LMK if you guys want me to take it.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!
