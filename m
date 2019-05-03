Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7248A1310C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 May 2019 17:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfECPSV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 May 2019 11:18:21 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40035 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfECPSV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 May 2019 11:18:21 -0400
Received: by mail-wm1-f65.google.com with SMTP id h11so7163215wmb.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 May 2019 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b4bYbi8YD9r7VkoaNAe5HTZAcJUr3+8rVC7UnnMmUKM=;
        b=FlnqY919rtUpMPpAyFSkstelMDxDpZz0et+dJ1WjTcG7j4nAZsnAg5/6ChGvwG9Hsc
         caTFt4nwbeXQ3HPlV0RD7/iqZdCBpIE0Dy8pU9eXFl5SxbORaWWy/LL1+KrBc5PgCx/g
         YfcE3571gInUKNQPgXZr7diyDwr9Jeh0F4ZJBMoXsU1aixw7t6uf0kh90xN+mL++hOJd
         spzfCZI0D6zXJSje2GxHusU9qC5+e6N6KeEngc/1WLbFw5Rt/xoFiA77dIQvD3KJRAQB
         +nhlqPoeQIvRUnXbWm1u96SL6iKrceY6rAwGiZDTLMuczVVLOpuVm6snRTXHQ1ghQ93Q
         UBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b4bYbi8YD9r7VkoaNAe5HTZAcJUr3+8rVC7UnnMmUKM=;
        b=nmBijUlWsj1C7NW3x4A3CiVA5fXACbNdq2DWSzWkr95fHuzZLq+Grcmx9GeW/ayiHl
         zjknS2m6HT+Zm9BrDm1UlloYBS/vZWHfRpG0ikn0uOn3dKl2DR0vrZdT7qBUEiiMsZLt
         NCS9JqMZ/Z9SGq1fyeWZx94CGUC7U6pl4D2OV5iExeDWgqgkFAoq5dlB/uKL/dtR3Ll6
         UO+b1NLJgd+J9JCH31tSyRXbtXqFi21J8zSe4OZGSFdjKQGhtv36236c30KF6AUc31Rq
         eRVyVVuqYyw7yuVbsPbaGW8akywhQswm9Z3deFZ4kh45Mu9OjE+6VaJ8+J16UvKoEWqm
         yCHg==
X-Gm-Message-State: APjAAAUUYCu+OCckuqKzOG7prH6pAlJ2mzCMshz0+kxKU/dO7LQjzyqM
        uP+YRFcTvgB1DWimDFZxI/C9Su15
X-Google-Smtp-Source: APXvYqwBonBB/rPSrMqlaBkXk23nXrEJT1dwpnliPBl8EyPDu3+3q/Ism1DcUyMMQCbkPyoOI5flWg==
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr7059073wmh.32.1556896699306;
        Fri, 03 May 2019 08:18:19 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 195sm4366416wme.32.2019.05.03.08.18.18
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 08:18:18 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: r8a779x: Configure PMIC IRQ pinmux
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20190502140634.4529-1-marek.vasut@gmail.com>
 <CAMuHMdVGAq1XgSohBjc8i4c_o-N-yWGedS_LLS_Apr4Bx10xGQ@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <fa79e656-d71a-6f3d-21a5-8acac72e20f0@gmail.com>
Date:   Fri, 3 May 2019 17:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVGAq1XgSohBjc8i4c_o-N-yWGedS_LLS_Apr4Bx10xGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/3/19 2:36 PM, Geert Uytterhoeven wrote:
Hi,

[...]

>>  &rwdt {
>> @@ -309,6 +314,8 @@
>>  };
>>
>>  &iic3 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pmic_irq_pins>;
> 
> Given Blanche has a single device connected to irq2, I think it makes
> sense to move the pinctrl properties to the pmic node below.

It makes blanche somehow inconsistent with the other boards, but if you
insist ... ?

> With that fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Best regards,
Marek Vasut
