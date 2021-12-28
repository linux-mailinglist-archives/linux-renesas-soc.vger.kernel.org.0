Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B1D480CE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Dec 2021 21:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbhL1UAP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Dec 2021 15:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237203AbhL1UAO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 15:00:14 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A42EC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Dec 2021 12:00:14 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id bq20so43474457lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Dec 2021 12:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z6EHwMp5AZI+iYeqZZ9y+EtZ5393CdE1f8m14Zm+iNk=;
        b=rUTGf9yHxZRJ3iMQyLTHgFI6xiG0jbj3qxcYJo1dQXuxFkKYWmh4KgV5kO+pN1MHZW
         iG1IdXcrpfCjfyzpMgqsqrFApG3Ft45M2DMV8PqAVxo1oG72Cj8y9yGaGVQ1ljE09YEm
         av+98OHr8ea2kSLP7zFVYFcxgyFqL+ssNq7WWVgQ4NJOqspEvfKfzHT5IrIWZ6lJrpBh
         q4UEOZA0SMZoemcRwVnKERN2bej9asQfwAj9WcPN3l9RmfBTvmLzeeilqKYXSFvJivQj
         K3EcTMeVMN1izLI0boiXibiZiBBp/sPSFcQ09VJr6u9kCG88ZOYcfjpJC9AK7LBkWfht
         evGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z6EHwMp5AZI+iYeqZZ9y+EtZ5393CdE1f8m14Zm+iNk=;
        b=M01azK2Z9DCsOCjP9XNW0S2XeeNHpFiNGEfHAwIOkqrVREhCltL+dmODziBGLvXx5e
         4mVh8V3pr3uN58kgCrJ9b4ASHFv7EmC0Fs4dzWDLhwxB5LeckJNCOZK06FLJr6jZXeyB
         ajeHZxdVTq0b661OtJRDHyFDEJFVV860JX1BGPOVYRBf5/egWNStbABBq2zafkEwdW/k
         46l8qXK3z+tyrLP95ZyxX/HchPIGhtALB+l69rPuEeCp1gJwC5x4JI17LBc7U+a3OWVG
         qXyOmzgUr2UsxlF7A6MMDxzH9DIVCHK1HzJG8EcDVUV5i9odWm/YGKl9+TCMwkgGD2JR
         wOcw==
X-Gm-Message-State: AOAM531WuPveg1MKkonAjdr9jfTbBiMKrDKVb0bnLm/88/rePbCCvpJP
        r531CsVKbvwejWpEFolPRNowQw==
X-Google-Smtp-Source: ABdhPJz07lQuwwoVt07rxWnw5KLDQ/CmcgGzmyxu7smKkkMe74ylFzjEaAEYQS63RWd1sFDo1J82Qw==
X-Received: by 2002:a19:f806:: with SMTP id a6mr19910155lff.642.1640721609118;
        Tue, 28 Dec 2021 12:00:09 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id a23sm403945ljk.8.2021.12.28.12.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 12:00:08 -0800 (PST)
Subject: Re: [PATCH/RFC] drivers/irqchip: add irq-inverter
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
References: <20211228165642.2514766-1-nikita.yoush@cogentembedded.com>
 <CAMuHMdWbqi_ac2wVUooO_mukG++y=ZjOwSir87fu+NLXYEKUqg@mail.gmail.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <71643b48-b1ab-0768-32a2-a25815e31827@cogentembedded.com>
Date:   Tue, 28 Dec 2021 23:00:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWbqi_ac2wVUooO_mukG++y=ZjOwSir87fu+NLXYEKUqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi

> FTR, here's a link to the previous discussion about this topic:
> https://lore.kernel.org/all/20190607172958.20745-1-erosca@de.adit-jv.com/

Thanks for the link.
AFAICS, there was no solution found that time?

I was able to make it at least working...  and I'm ready to apply any reasonable changes to make this, 
or any other, solution for the issue acceptable for mainline.

Nikita
