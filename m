Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A2047A7C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 11:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhLTK2V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 05:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhLTK2U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 05:28:20 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCF3C06173F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 02:28:20 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id be32so15037392oib.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 02:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L4Sw67BXpIx21OZ/G/pQTCNTjSKUb09oaSZld1KnM60=;
        b=wc4jConf2OyeQ5jgnUR8S55Kdd7aN73I/SDTcr37sMq7QH1MkC+Yq/9MVRpd4661HX
         2LIG+VhT3VNMC7Pk+04MoTAxamrok6ffsbp7fYGsmcWMljKvDwqCKkcRjAi8n2y9HWqg
         YsNR+DDAdompWe1+Y5WHRvLmdmXE9wDYMw51M/fPwgW+uZd10DY5mH4H7ikf0OCDNBvv
         kremqXx8AB5QFabeF25for/DsWbViQfkOeFUsRKWBK7DHq2QLZMzBCOT0UUceCfJTJpA
         UuoT2HxozkknP4jf8xZEyMOCyqltfd/+1u3L4gbRoWNQWoOJkOpzZfV5TXchc8EYWgHt
         m5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L4Sw67BXpIx21OZ/G/pQTCNTjSKUb09oaSZld1KnM60=;
        b=HW3UNnxy2+hey6Znidf9X5k9Y0ydv5jfkmkv1CfcHvFI4NAOwi4RN00BLeIZ1KWHyb
         OIUudhG+ldD51JDNtlFrSy4fWPOTQSyK9wFbLOG97kVZjVvl11ggr9I9bOMIvWx2Cl4T
         fpl61XNmuk40d39Sc0u6qkAr1sS+kBL7VyMWes0HpgjcIlf5s2+jy64+CGJ1cYqs0Pw0
         lR007Ned8DZr2XxJ5IaslmmEjdd0dUtQdUVVXSEAx9nVTFklDFT6nkRfCoprWrFVdvAl
         b3fEYQ143a7W80ZZnmV5kQvlOimwMHeR7makYso4cXkceLSU+APAoKcTxIBZcQinJeNK
         lhug==
X-Gm-Message-State: AOAM533YBS+awDhaXnY4rvoGQaPcrFlZQMomC1zKeJdgAFbacAlgiEHO
        FBQRYNDmS69GvVItG8eIjGS/ZD5udFfUnw==
X-Google-Smtp-Source: ABdhPJxM7qO+4A2xJGs0I+14CmJKtx1V0TJOtS9RMiaqVDw4lLLizmC2YIlgoVc5+2YSj6Smi0rxqw==
X-Received: by 2002:aca:230b:: with SMTP id e11mr17073975oie.22.1639996100050;
        Mon, 20 Dec 2021 02:28:20 -0800 (PST)
Received: from [192.168.86.166] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id 9sm3263578oij.16.2021.12.20.02.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 02:28:19 -0800 (PST)
Subject: Re: [PATCH 0/3] serial: sh-sci: Clock handling improvements
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Magnus Damm <magnus.damm@gmail.com>
References: <cover.1639663832.git.geert+renesas@glider.be>
 <7cbec488-01d1-1ee2-006a-a3835d42a0a7@landley.net>
 <CAMuHMdUYu4hOjZMHy+bPrLpJ6=3tja0kJ7WwJ5TFhHivvi0DNQ@mail.gmail.com>
From:   Rob Landley <rob@landley.net>
Message-ID: <ffd9ed49-69eb-0508-d2fa-5585a1421d78@landley.net>
Date:   Mon, 20 Dec 2021 04:29:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUYu4hOjZMHy+bPrLpJ6=3tja0kJ7WwJ5TFhHivvi0DNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/19/21 4:53 AM, Geert Uytterhoeven wrote:
>> By the way, did you ever figure out how to get the first serial port to work on
>> qemu so qemu-system-sh4 doesn't have to "-serial null -serial mon:stdio" to get
>> a serial console?
> 
> Nope, same as last time you asked ;-)

Well it had been a couple years, you never know...

> However, upon a fresh look at linux/arch/sh/boards/mach-r2d/setup.c,
> I noticed something I missed before: the SCI port is not available
> as a UART, as it is used to talk SPI to an RTC.

/* Single Epson RTC-9701JE attached on CS0 */

Huh. That does explain the CONFIG_RTC_DRV_R9701=y in rts7751r2d*_defconfig.
(And also SPI SPI_SH_SCI MFD_SM501 RTC_CLASS and RTC_DRV_SH RTC_HCTOSYS which
I've never gotten connected to QEMU.)

> So that means qemu
> has the hardware description wrong?

It would be nice if qemu-system-sh4 grew an RTC. Looks like Sato-san and Magnus
Damm are the qemu-system-sh4 maintainers? (cc'd)

Thanks,

Rob
