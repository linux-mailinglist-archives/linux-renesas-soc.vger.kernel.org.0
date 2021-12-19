Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B17447A034
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Dec 2021 11:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbhLSKeo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Dec 2021 05:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbhLSKen (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Dec 2021 05:34:43 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4263AC061574
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Dec 2021 02:34:43 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id w64so11144357oif.10
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Dec 2021 02:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pFU92apYAvOiDgemoMKCF8lI/J5BTvrn5LAkNJ5Lc+Q=;
        b=6jyafL3WnyPHvnRov0EkqpVnS67kASRtzX3BTUeCWVpnIbYjILTsdwD/ZiNVuGq2S8
         qd+f1U5SszDNTsNOgZSwLOiAOgW6R/DcIMO9LwpKkNs9v2JfFxxsBm47QYIxi0IDunpK
         ZFc9a+U5/ZXJ68hjkFwPjebzjhkiimJ3KxYQX8fDMZvGPwCIACLvMbmksxZ39LszbjTQ
         niRDZApbbb5840Xt3112Z78RUh930C8scpv1At4jqijzA7Sm9FjOPlCW2VGiKwxir8Vd
         ohfsRKc9XLh/yzctnJyRotaTt5cvQlbO1WmQ0E9eTmiAEmGc/Y0gKcz4dB0akaRI+O+J
         Uuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pFU92apYAvOiDgemoMKCF8lI/J5BTvrn5LAkNJ5Lc+Q=;
        b=2WFxl38Prr43LM0ZqX0THZrI5wTUQ1tLBIdjF6vOG8cuHk0aUkxXmahR2d0PGpPFwo
         m6CvUcxpfM451t/jShldedA56WqQnh6TfxE84hpVcC5yCo9wkvDk0wmUq6Imw4L64qj6
         PucbFb6R6sbWGoNPVJ283VedQ3o+DJt7y0/5P0vhP8JHVFS890xPgRhrW9592WiWDBXl
         qnlekssy1ondA1ygiF8GbTQLHsIiY6O8hhLqOKdSPU9sqqpED7k/RnPysej/mIfFqkT2
         1FPitE+Ztv6XjJ7IjetLjYGgiROKxU3vZfHZpD/G/QVpYv1qL963jOsFcGix4pjk2uhr
         tniA==
X-Gm-Message-State: AOAM531z2WinHH0DK1d0g1SMizUKzCBVHpgjeSPdy81fvgwZ+VWiG//a
        1pPzZst3+8REg3x6xBdmv5qa/Q==
X-Google-Smtp-Source: ABdhPJwkz64GEp/3bR0EmpxAFoR/eSwzbqJ1wNpRSWEBhu44cGdNx5YCKHDBrP8TYcAFz5rQt2XsPw==
X-Received: by 2002:a05:6808:1aa8:: with SMTP id bm40mr13294933oib.38.1639910082479;
        Sun, 19 Dec 2021 02:34:42 -0800 (PST)
Received: from [192.168.86.166] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id t3sm2677741otk.44.2021.12.19.02.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Dec 2021 02:34:41 -0800 (PST)
Subject: Re: [PATCH 0/3] serial: sh-sci: Clock handling improvements
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
References: <cover.1639663832.git.geert+renesas@glider.be>
From:   Rob Landley <rob@landley.net>
Message-ID: <7cbec488-01d1-1ee2-006a-a3835d42a0a7@landley.net>
Date:   Sun, 19 Dec 2021 04:35:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cover.1639663832.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/16/21 8:17 AM, Geert Uytterhoeven wrote:
> 	Hi Greg, Jiri,
> 
> This patch series contains a legacy cleanup and two small improvements
> for the Renesas (H)SCI(F) serial driver.

Tested-by: Rob Landley <rob@landley.net>

By the way, did you ever figure out how to get the first serial port to work on
qemu so qemu-system-sh4 doesn't have to "-serial null -serial mon:stdio" to get
a serial console?

Rob
