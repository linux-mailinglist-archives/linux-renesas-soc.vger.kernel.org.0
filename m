Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE831FAC55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgFPJ06 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 05:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgFPJ05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 05:26:57 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728A6C03E96A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2020 02:26:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q19so22683060lji.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2020 02:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yQDj+TXGkljmxt1I2pVxuHh9SH7HD6pmzH/DdtGOWQY=;
        b=T9gyuWvMDoyPQNXMAouLIiaQ+HEgwF4/Mpz3I1duc6TLOd4KtUUBR7h2gcjJ63KpWl
         fCHp6wAU3eixB5tvzAFy8Mb6nSMoxY+NUMGWJFHQM/njcbjntxCyfEdngqUTZoW/WhEN
         dnM2q+zFCjMwLlnGMhsjbtbenJi5W3kLbwu0IA7vrPqrgs5uN80htaxiqNpbAmWzKWeG
         EGyE6WSQ2xCAye+kVpbIBVI0rQB4386mwDVKgvsPjrN/c5r1sDlO8ERqUXwgYwtk9n8Z
         1xObFjbtYOYN3ht57Vxx3k6qRj7yDGU5b1VzOmdxH96suUE04J06fVlaAPI9+7PMfO5d
         27pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yQDj+TXGkljmxt1I2pVxuHh9SH7HD6pmzH/DdtGOWQY=;
        b=rnHt3Wt5ZIx0GGRAhkQNm2LqBX8PfSpM9IA2CYaXgD8RCrvhKKZRTZyDz/2Mx2MiEV
         gDEQhUcqdoqzdAcbRYl5m22eONG7pa+beF+TSvCP5IOhJa1xtxGAqkU/mIUe5djiv1Fm
         3jNYyppCW+2tu9wqy62xoCxS82Oqus986hm99wAFpHfpL3jIXHJNO1UnpslIa2Xi0aqz
         Ph7AOD/9uxvtaGMNGWQrvYsStW7vusilzT0Tt/VwBwUdh56hDn0z02JOpLGYAljbzXAS
         9OgJNE8zjSHrV1JyErTyE+7KCQdoHjJyUf9BsG+HvGb+xHRibtrQZG7dMlq/82L+T5x9
         aH2g==
X-Gm-Message-State: AOAM533sR6EmxHYrvi7zwVz+HvBOiC4XukvNPejBgjX4nI+R+oF2iNDp
        BFchhYoJlX1qcDI/dK9jHXradA==
X-Google-Smtp-Source: ABdhPJyITj5+XVe9pjMlbRhYgeCJSKTo0h6alvV7WG5y8piPFX9LfYvjUVCt7xWMiW8Pj50Fs9eZ/w==
X-Received: by 2002:a2e:b60c:: with SMTP id r12mr1007655ljn.316.1592299614939;
        Tue, 16 Jun 2020 02:26:54 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:416:ca24:55bc:10a5:e37e:1ad1? ([2a00:1fa0:416:ca24:55bc:10a5:e37e:1ad1])
        by smtp.gmail.com with ESMTPSA id f10sm5146823lfm.34.2020.06.16.02.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 02:26:54 -0700 (PDT)
Subject: Re: [PATCH v4] spi: add Renesas RPC-IF driver
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
References: <ad503d6e-4739-9744-64b4-fd13f44ea6fe@cogentembedded.com>
 <1ece0e6c-71af-f0f1-709e-571f4b0b4853@cogentembedded.com>
 <159226448570.27735.17453498854310254061.b4-ty@kernel.org>
 <6fd4533e-c548-5d14-2d21-96efa0c58a0b@cogentembedded.com>
 <20200616083856.GF4447@sirena.org.uk>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4c78964b-92f2-ac02-e2f6-a76cfc844b8a@cogentembedded.com>
Date:   Tue, 16 Jun 2020 12:26:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616083856.GF4447@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 16.06.2020 11:38, Mark Brown wrote:
> On Tue, Jun 16, 2020 at 11:24:55AM +0300, Sergei Shtylyov wrote:
>> On 16.06.2020 2:41, Mark Brown wrote:
> 
>>> All being well this means that it will be integrated into the linux-next
>>> tree (usually sometime in the next 24 hours) and sent to Linus during
>>> the next merge window (or sooner if it is a bug fix), however if
>>> problems are discovered then the patch may be dropped or reverted.
> 
>>     You realize that the SPI driver won't build alone, w/o the
>> drivers/memory/ core driver merged, right?
> 
> Those aren't merged yet?  There was no mention of any dependencies in
> the patch, no feedback for months on the patch and I've not seen any
> ongoing discussion.

    I thought the below passage was speaking for itself:

<<
It's the "front end" driver using the "back end" APIs in the main driver to 
talk to the real hardware."
 >>

    Sorry for not being clear enough...

MBR, Sergei
