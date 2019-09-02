Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E0FA5BDF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 19:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbfIBRlS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 13:41:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39930 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfIBRlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 13:41:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id l11so10931657lfk.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2019 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9bia60mvHh0gbszywhWElEGhJ/D0akHyw7FHDFQMRCg=;
        b=vviNQCniwn2Pt5wqfCJ3Uoc4dO9TwZJWN63daVKPBL8Rk1XDPcribXQeMvEnCpgvjk
         wA5nLX8ZeAO2hlT+MRVrarZ4JQJ49AvIy79qVmzvJNsydHBG0fwzrDrRPUADetA1l95S
         vjZf/+8JKkwdMkHyFkp4oV4GZu3DqStIk/+1YvXXqnpPkdnwjIz6xf2q8v0/br3Q0+no
         O2FSONtzzWaU40Hl+2+raJaj4GQbk4Uqp/5+PaZfbk8TorNpEhd7UqgfMQGU+9L+rTfB
         daxzm1odQrYFmyh2KSTY56uf4K+3rr/v5lDhZwvYiuHzDIH15b10L2vgmc1qTO1R3QRp
         nkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9bia60mvHh0gbszywhWElEGhJ/D0akHyw7FHDFQMRCg=;
        b=MifBq+bfwKsAKWW9g1INp21hMVGM4MAkVOYaxBXBUeBPoqLLrFTbM781Q7WtjWThtP
         fjDAVQsLSqKKoeJXeDMVkpvHeOFb6x7G8K0p628Q1o28QzyvcuuJoLyNCQa5PaWg5CEh
         ZPnCY4nXUhz9y6eODofmhcXBo+hBNrI2mWkQlHpUJsGc7nCthE4B6C8RSv5i2wtNN6YG
         7yuLE5MsS/xCbYid9Dhxj96GrnGtmLnB5gh6AHzMQFOgdSXIFgTCEzRcnoAtuOuquTRj
         1VVqq21h/Sz4iPHfYOlzcUsnouXAN8+ywkcHE0Y4KVjRQox5idZnF7cwJiFWV0y2idhX
         iAFw==
X-Gm-Message-State: APjAAAW6oLECUuWAuNb5v52EY4y3k2vAlN3K6Di6ZwxkLWXdKZ8IoZfC
        4Z1q1vSOx1X2XlywhHZT/rI0sg==
X-Google-Smtp-Source: APXvYqxDD2wge+2LQ9/Ub63bv+73Femk+OMs/LM6ctbCLimLn/AjaBAeyv3tCs3oUN1EUOpKXAnTLA==
X-Received: by 2002:ac2:483a:: with SMTP id 26mr6746631lft.188.1567446075908;
        Mon, 02 Sep 2019 10:41:15 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:272:5afe:be7d:d15f:cff2:c9cf])
        by smtp.gmail.com with ESMTPSA id i21sm1404107lfl.44.2019.09.02.10.41.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 10:41:15 -0700 (PDT)
Subject: Re: [net-next 2/3] ravb: Remove undocumented processing
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20190902080603.5636-1-horms+renesas@verge.net.au>
 <20190902080603.5636-3-horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <f54e244a-2d9d-7ba8-02fb-af5572b3a191@cogentembedded.com>
Date:   Mon, 2 Sep 2019 20:41:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190902080603.5636-3-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/02/2019 11:06 AM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> This patch removes the use of the undocumented registers
> CDCR, LCCR, CERCR, CEECR and the undocumented BOC bit of the CCC register.

   The driver has many more #define's marked as undocumented. It's not clear
why you crammed the counters and the endianness bit in one patch. It clearly
needs to be split -- one patch for the MAC counters and one patch for the
AVB-DMAC bit.

> Current documentation for EtherAVB (ravb) describes the offset of
> what the driver uses as the BOC bit as reserved and that only a value of
> 0 should be written. Furthermore, the offsets used for the undocumented
> registers are also considered reserved nd should not be written to.
> 
> After some internal investigation with Renesas it remains unclear
> why this driver accesses these fields but regardless of what the historical
> reasons are the current code is considered incorrect.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
