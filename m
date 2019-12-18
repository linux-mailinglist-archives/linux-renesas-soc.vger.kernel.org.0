Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255AA124FFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 19:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfLRSBy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 13:01:54 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42221 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfLRSBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 13:01:54 -0500
Received: by mail-lf1-f65.google.com with SMTP id y19so2337310lfl.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2019 10:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wbOw61ub2QZR5UfVl5vQOrD9xSXq72V2Ul/qpCmdZt4=;
        b=Vg78AXxGe+bexbffzwNcmQHVU3Hl5ShytUl+R7mjL/uWGW7J09LYQYn8RepvoXG1zj
         JMYePSp2Y2Us6QxSFr8rrAJ1bMeL/gvokggiamGgBF9z8JxUzzp+rU0vNUBMt+kqsXWI
         SAYQxwwn2dwde+spxXjHYD/BI/VuH2PvqD5GipvTZmFpp/NvFKN7PN+hzxKh2hOPcZqw
         0G6DWMf4ZF4A374I0Njh6Ln5MJoKl+zzHhjwGfx+XS/sDsmQy3OIVgjvRi5YvgbFNKa7
         McLXo8zJUVdhUYDOT77u6CBuYYIVYi/OLld+CtoqPU7MMpcRKRR4ysbx7tvxW3aIYtHn
         9wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wbOw61ub2QZR5UfVl5vQOrD9xSXq72V2Ul/qpCmdZt4=;
        b=fZ/h2ApV0sdkx5l73EIxHR2xyqFWpzYHPwpTu3zV88qeUCmLcCVn4qT9fKj0FHyDX9
         SX7a/6qbElWX/y9sEpVqTHaKBWAI8nE/ajRq8vlx/5ACqm/XTjmspHXSSKAzgmCSLa4H
         9GtOI9VvA/vFO1KYuLSabTZIXQdIj9hf5Tw2TWDXg+mpXXGEJ7GEpmOmt1yHtIwAi2VN
         EdWRQNxJA6Z/ZIaUXiGLCn1M9ui9nwvW9kSwK8RTfONT/dqdgDPs6ALHGJyQRuhtsMF6
         42qMpDu9X4/nTCzIjIi1+K3fXVmzFOyH/LNYn7wqsDXJFyJz/AIw5Lk/yrhVQxBm3RuD
         e4ww==
X-Gm-Message-State: APjAAAVhBWU0mBu5yh/X6iMMVMok5AzdIE6KNdnkIhbd3Kjhr43UYoWo
        uvzt7HAG/73KMUpkWhFnPUuvbPiHFSo=
X-Google-Smtp-Source: APXvYqw7yyxFQAXo7vKA2w7ulRNGvCyv56rfhdpT5ejogTv6wRACLm66i8wHVY98PrQ1Yjcn1Hyyvg==
X-Received: by 2002:a19:e011:: with SMTP id x17mr2462253lfg.59.1576692111923;
        Wed, 18 Dec 2019 10:01:51 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:48d1:e89a:1bf6:a9f0:1b42:e170])
        by smtp.gmail.com with ESMTPSA id i13sm1532470ljg.89.2019.12.18.10.01.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 10:01:51 -0800 (PST)
Subject: Re: [PATCH] clock: renesas: cpg-mssr: Fix the typo
To:     Biju Das <biju.das@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <1576667390-29449-1-git-send-email-biju.das@bp.renesas.com>
 <2368e2c8-7f80-ec22-2c9f-4f719ab347dc@cogentembedded.com>
 <OSBPR01MB2103DDF07C530B24DCD2BE4BB8530@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f22fc0c9-c74c-0d1f-4abd-8969b806b5dd@cogentembedded.com>
Date:   Wed, 18 Dec 2019 21:01:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103DDF07C530B24DCD2BE4BB8530@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/18/2019 03:49 PM, Biju Das wrote:

>> Subject: Re: [PATCH] clock: renesas: cpg-mssr: Fix the typo
>>
>> On 18.12.2019 14:09, Biju Das wrote:
>>
>>> This patch fixes the typo %s/r8a774a1/r8a774b1/.
>>>
>>> Fixes: 1000393 ("dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1
>>
>>     SHA1 should have at least 12 digits.
>>
> Ok will do.
> 
>>> binding")
>>
>>     And never break up the tag lines please.
> 
> Do you mean ,  do the changes like below and ignore check patch warnings?

   checkpatch.pl doesn't complain to me, even about short SHA1...

> Is it acceptable to everyone?

   I remember e.g. Dave Miller complaining about breaking up the "Fixes:" tag --
I think it breaks patchwork. Looking at Documentation/process/submitting-patches.rst,
this format is even codified...

> Fixes: 10003938a0c64c2f0d89 ("dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1 binding")
> 
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> [...]

MBR, Sergei
