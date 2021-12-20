Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9CF47AB47
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Dec 2021 15:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbhLTO20 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Dec 2021 09:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhLTO2Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 09:28:25 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474C9C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 06:28:25 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id s1so20551494wrg.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Dec 2021 06:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WooZ8+G3drvx1+6gABS1CB4CVHUChh8QD6al3hgLHT0=;
        b=Hu2VM+3/PidvuBJkCTfuoSnf3r5qO3ftqjAkvelo8kOEZ8IHKSIQAhBwod07u+oq55
         DqyDi6Ve0ed0E89JykoDluEmMSEgXLOAmGOzY/Z+ckuW1Vv0KHSFsgO83Tb3TpCTxq4Q
         tqqW9C6ramZQNgmApKuN27wZ+A7enW96fegCtVwD1siH5daxTgaBf0zujAQ7T4Px6aun
         wYPAG/ZlLvoJz2Zve08m22Qw98IYUMKW+TxYR8JIKiUILm0GqN13gbDLtXaZIADF7+5s
         mQgyVRy3utRYbCCM2Tj77NoJLfnraoQwV/q9D01W52XkS+yfFG3lbJ8hXMtv9Yq9Ab7g
         cQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WooZ8+G3drvx1+6gABS1CB4CVHUChh8QD6al3hgLHT0=;
        b=38wyREceNnw+92swKhS6qhzSb3f9ZLJy2Znpvcb808aw2xeGy2GrGsEmvQzG+SUIi/
         VjGlVJSUTCUwf04QYf587HRvDbe9G7pCMEMM+QmmQs9hvbM+6Dp7M4RA8cv4AG527J9F
         qKe5YDEdcnmz080CkvnepJAAQPaw31NTZSfzjoXC81oCCUahanpqoOeyWWqz4vAHB//w
         xWDYVbu1qaVIkuSxeGxDOcqwfqiQd+7rrTMjFy7wYlsVKlh/tgRF1821wOfsWrNwakcJ
         CIAUEfduNDlELhNi5lYkIzg3fZrNiU0WYr7zawXFmoY4HSJsJAkUcP5ftXlD5f8baj2n
         rQ3A==
X-Gm-Message-State: AOAM533Pj+dHUCvwhbI+TWTMV9U7Rbat4Vobf7b5/4v+WjX5eDOqmryY
        8EOfAbZjjGu6MSjkGgRaQQ9pzlhzCnaUNw==
X-Google-Smtp-Source: ABdhPJw3TlXRRdDAmrr2xdrbdnLzo6CM5X39e2ZExdeVHSwzM67b1QuANK08rfzgrK5uj0GU/t19mw==
X-Received: by 2002:a5d:6088:: with SMTP id w8mr8586338wrt.85.1640010503680;
        Mon, 20 Dec 2021 06:28:23 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ac6:da31:b84c:183? ([2a01:e34:ed2f:f020:ac6:da31:b84c:183])
        by smtp.googlemail.com with ESMTPSA id l8sm20108265wmc.40.2021.12.20.06.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 06:28:23 -0800 (PST)
Subject: Re: [PATCH] thermal: rcar_thermal: Use platform_get_irq_optional() to
 get the interrupt
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20211218144136.6663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <5f8e2432-1214-3435-fb62-2f407ced0472@linaro.org>
 <CAMuHMdXgRzM4+OjR0or0aTk-ogPcAYajaVALsLF6E=MxEzeRQg@mail.gmail.com>
 <bdec1a89-ad1b-1e16-a248-029f7f02ae80@linaro.org>
 <CAMuHMdWjUG57trhkOevb0Pju1fFptXZwM+BKKvgnG0+vAM64gA@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <619343a0-4911-caff-7f47-a8469290c0f0@linaro.org>
Date:   Mon, 20 Dec 2021 15:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWjUG57trhkOevb0Pju1fFptXZwM+BKKvgnG0+vAM64gA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/12/2021 15:26, Geert Uytterhoeven wrote:

[ ... ]

>>
>> if (irq == -ENXIO)
>>         continue;
>>
>> if (irq <= 0)
>>         goto out;
>>
>>
>> Did I miss your point ?
> 
> I think so, as I don't see your point, neither ;-)
> 
> I meant (a) there is no need to continue the loop when there are no
> more interrupts present, and (b) irq == 0 cannot happen, so the cod
> can be simplified to:
> 
>     if (irq == -ENXIO)
>             break;
>     if (irq < 0) {
>             ret = irq;
>             goto out_unregister;
>     }
> 

Makes sense for me now, thanks :)




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
