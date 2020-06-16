Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879791FAB06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 10:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgFPIZH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 04:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbgFPIZG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 04:25:06 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3996C03E96A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2020 01:25:05 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g2so3614536lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2020 01:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lwd5cR6xUSk51EbPkBGTsFz5E0qETsw6twY6Yx6Ai5M=;
        b=gc+uBEh21MRfojimkwL4vubdu9F1FGZQTcy5bROPC2m9T89uHNR2gRufy+YVbekRyL
         SzaqrXqjhpjcBOdN95rxy2RUoAcVdHKMgOQJuNdLbOMQKrIdO+1x81uUDoa+JlCwqDpA
         sRy4sxTfknzGPknI8j9X89EQIcJCAvHA8nk7FKMEWoEAqE0tLB+4PkgenLR0YzjHejGt
         w9DGoh5EOUKwBRsD+oBMtXp6E3+f24T9lY5pOh0uy6AcCxPpTVhRKb0D/izX24XpVQAy
         dAnNvTYpdjvgR+uJZH2WBDhfgIG+76xJ2F23WEdaJwhRP9GeMX3T+YciUJ4kOJqfRgx8
         lrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lwd5cR6xUSk51EbPkBGTsFz5E0qETsw6twY6Yx6Ai5M=;
        b=jnn+6eupNgzKL0v612O1EFi8ZEtRgSY2HtVcBZyoOLZ+Iv+BdTQBrYYeTchXBd0JjV
         BJ7oSAIMgKGEvIOIim/TjapzMwu9sivCTWSX7oZJFbasEbLzWqod/DyDuN9f9PeZ5VIE
         P5sxOXQlhj2OGZUS4X0iZJDTustr9I9Aqh1pcjt8RsSQ0SVp3Yq28nqKxaNRqRJwU93f
         eL0WZTPzUf0v+6BSkd/42ohRp7sfofc33JF2FxNY575utTJjMNhyDWx96FKjcY6j47IW
         ctXJ2eKXZzrgQTOr1zg3TylPPNQCrAh6Zh/oGB3EZfHjA6O7UVSRuo5jZk+F280FpO/M
         hnQA==
X-Gm-Message-State: AOAM532CKq3TnkHk5GJ+6nJd6eR+O3M5l0gFkIy1/HbxErEHwskid326
        6ujdNx1sZrobmS3PHQeXnxnZxw==
X-Google-Smtp-Source: ABdhPJwNASQJWD//XJ5qMNB7cuZ/hioSKgNBlZNCWx4hDcFk6tuXFxftUU1wbltUpFQd7DN4r3ceZw==
X-Received: by 2002:ac2:59c3:: with SMTP id x3mr1122212lfn.117.1592295904355;
        Tue, 16 Jun 2020 01:25:04 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:416:ca24:55bc:10a5:e37e:1ad1? ([2a00:1fa0:416:ca24:55bc:10a5:e37e:1ad1])
        by smtp.gmail.com with ESMTPSA id 144sm2469756lfm.87.2020.06.16.01.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 01:25:03 -0700 (PDT)
Subject: Re: [PATCH v4] spi: add Renesas RPC-IF driver
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
References: <ad503d6e-4739-9744-64b4-fd13f44ea6fe@cogentembedded.com>
 <1ece0e6c-71af-f0f1-709e-571f4b0b4853@cogentembedded.com>
 <159226448570.27735.17453498854310254061.b4-ty@kernel.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6fd4533e-c548-5d14-2d21-96efa0c58a0b@cogentembedded.com>
Date:   Tue, 16 Jun 2020 11:24:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159226448570.27735.17453498854310254061.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 16.06.2020 2:41, Mark Brown wrote:

>> Add the SPI driver for the Renesas RPC-IF.  It's the "front end" driver
>> using the "back end" APIs in the main driver to talk to the real hardware.
>> We only implement the 'spi-mem' interface -- there's no need to implement
>> the usual SPI driver methods...
>>
>> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [1/1] spi: add Renesas RPC-IF driver
>        commit: eb8d6d464a27850498dced21a8450e85d4a02009
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.

    You realize that the SPI driver won't build alone, w/o the drivers/memory/ 
core driver merged, right?

> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark

MBR, Sergei
